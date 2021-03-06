// Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library engine.src.index.store.codec;

import 'dart:collection';

import 'package:analyzer/index/index.dart';
import 'package:analyzer/src/generated/element.dart';
import 'package:analyzer/src/generated/engine.dart';
import 'package:analyzer/src/index/store/collection.dart';


/**
 * A helper that encodes/decodes [AnalysisContext]s from/to integers.
 */
class ContextCodec {
  /**
   * A table mapping contexts to their unique indices.
   */
  Map<AnalysisContext, int> _contextToIndex = new HashMap<AnalysisContext, int>(
      );

  /**
   * A table mapping indices to the corresponding contexts.
   */
  Map<int, AnalysisContext> _indexToContext = new HashMap<int, AnalysisContext>(
      );

  /**
   * The next id to assign.
   */
  int _nextId = 0;

  /**
   * Returns the [AnalysisContext] that corresponds to the given index.
   */
  AnalysisContext decode(int index) => _indexToContext[index];

  /**
   * Returns an unique index for the given [AnalysisContext].
   */
  int encode(AnalysisContext context) {
    int index = _contextToIndex[context];
    if (index == null) {
      index = _nextId++;
      _contextToIndex[context] = index;
      _indexToContext[index] = context;
    }
    return index;
  }

  /**
   * Removes the given [context].
   */
  void remove(AnalysisContext context) {
    int id = _contextToIndex.remove(context);
    if (id != null) {
      _indexToContext.remove(id);
    }
  }
}


/**
 * A helper that encodes/decodes [Element]s to/from integers.
 */
class ElementCodec {
  final StringCodec _stringCodec;

  /**
   * A table mapping element encodings to a single integer.
   */
  final IntArrayToIntMap _pathToIndex = new IntArrayToIntMap();

  /**
   * A list that works as a mapping of integers to element encodings.
   */
  final List<List<int>> _indexToPath = <List<int>>[];

  ElementCodec(this._stringCodec);

  /**
   * Returns an [Element] that corresponds to the given location.
   *
   * @param context the [AnalysisContext] to find [Element] in
   * @param index an integer corresponding to the [Element]
   * @return the [Element] or `null`
   */
  Element decode(AnalysisContext context, int index) {
    List<int> path = _indexToPath[index];
    List<String> components = _getLocationComponents(path);
    ElementLocation location = new ElementLocationImpl.con3(components);
    return context.getElement(location);
  }

  /**
   * Returns a unique integer that corresponds to the given [Element].
   */
  int encode(Element element) {
    List<int> path = _getLocationPath(element);
    int index = _pathToIndex[path];
    if (index == null) {
      index = _indexToPath.length;
      _pathToIndex[path] = index;
      _indexToPath.add(path);
    }
    return index;
  }

  List<String> _getLocationComponents(List<int> path) {
    int length = path.length;
    List<String> components = new List<String>();
    for (int i = 0; i < length; i++) {
      int componentId = path[i];
      String component = _stringCodec.decode(componentId);
      if (i < length - 1 && path[i + 1] < 0) {
        component += '@${(-path[i + 1])}';
        i++;
      }
      components.add(component);
    }
    return components;
  }

  List<int> _getLocationPath(Element element) {
    List<String> components = element.location.components;
    int length = components.length;
    if (_hasLocalOffset(components)) {
      List<int> path = new List<int>();
      for (String component in components) {
        int atOffset = component.indexOf('@');
        if (atOffset == -1) {
          path.add(_stringCodec.encode(component));
        } else {
          String preAtString = component.substring(0, atOffset);
          String atString = component.substring(atOffset + 1);
          path.add(_stringCodec.encode(preAtString));
          path.add(-1 * int.parse(atString));
        }
      }
      return path;
    } else {
      List<int> path = new List<int>.filled(length, 0);
      for (int i = 0; i < length; i++) {
        String component = components[i];
        path[i] = _stringCodec.encode(component);
      }
      return path;
    }
  }

  bool _hasLocalOffset(List<String> components) {
    for (String component in components) {
      if (component.indexOf('@') != -1) {
        return true;
      }
    }
    return false;
  }
}


/**
 * A helper that encodes/decodes [Relationship]s to/from integers.
 */
class RelationshipCodec {
  final StringCodec _stringCodec;

  RelationshipCodec(this._stringCodec);

  Relationship decode(int idIndex) {
    String id = _stringCodec.decode(idIndex);
    return Relationship.getRelationship(id);
  }

  int encode(Relationship relationship) {
    String id = relationship.identifier;
    return _stringCodec.encode(id);
  }
}


/**
 * A helper that encodes/decodes [String]s from/to integers.
 */
class StringCodec {
  /**
   * A table mapping names to their unique indices.
   */
  final Map<String, int> nameToIndex = new HashMap<String, int>();

  /**
   * A table mapping indices to the corresponding strings.
   */
  final List<String> _indexToName = <String>[];

  /**
   * Returns the [String] that corresponds to the given index.
   */
  String decode(int index) => _indexToName[index];

  /**
   * Returns an unique index for the given [String].
   */
  int encode(String name) {
    int index = nameToIndex[name];
    if (index == null) {
      index = _indexToName.length;
      nameToIndex[name] = index;
      _indexToName.add(name);
    }
    return index;
  }
}
