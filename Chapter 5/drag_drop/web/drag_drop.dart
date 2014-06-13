import 'dart:html';
import 'dart:math';

void main() {
  var dnd = new DragnDrop();
  dnd.init();
}

class DragnDrop {
  Element dragSource;
  Map tiles;
  var rand = new Random();
  var cols = document.querySelectorAll('.pict');

  void init() {
    generateMap();
    for (var col in cols) {
      col.onDragStart.listen(_onDragStart);
      col.onDragEnd.listen(_onDragEnd);
      col.onDragEnter.listen(_onDragEnter);
      col.onDragOver.listen(_onDragOver);
      col.onDragLeave.listen(_onDragLeave);
      col.onDrop.listen(_onDrop);
      col.style.setProperty("background-image", getRandomTile(), "");
      col.style.setProperty("background-repeat", "no-repeat", "");
      col.style.setProperty("background-position", "center", "");
    }
  }

  void generateMap() {
    tiles = new Map();
    tiles[1] = "url(img/tiles_01.jpg)";
    tiles[2] = "url(img/tiles_02.jpg)";
    tiles[3] = "url(img/tiles_03.jpg)";
    tiles[4] = "url(img/tiles_04.jpg)";
    tiles[5] = "url(img/tiles_05.jpg)";
    tiles[6] = "url(img/tiles_06.jpg)";
    tiles[7] = "url(img/tiles_07.jpg)";
    tiles[8] = "url(img/tiles_08.jpg)";
    tiles[9] = "url(img/tiles_09.jpg)";
  }

  void _onDragStart(MouseEvent event) {
    Element dragTarget = event.target;
    dragTarget.classes.add('moving');
    dragSource = dragTarget;
    event.dataTransfer.effectAllowed = 'move';
    // event.dataTransfer.setData('text/html', dragTarget.innerHtml);
  }

  void _onDragEnd(MouseEvent event) {
    Element dragTarget = event.target;
    dragTarget.classes.remove('moving');
    for (var col in cols) {
      col.classes.remove('over');
    }
  }

  void _onDragEnter(MouseEvent event) {
    Element dropTarget = event.target;
    dropTarget.classes.add('over');
  }

  void _onDragOver(MouseEvent event) {
    // This is necessary to allow us to drop.
    event.preventDefault();
    event.dataTransfer.dropEffect = 'move';
  }

  void _onDragLeave(MouseEvent event) {
    Element dropTarget = event.target;
    dropTarget.classes.remove('over');
  }

  void _onDrop(MouseEvent event) {
    // Stop the browser from redirecting in case of hovering over a link.
    event.stopPropagation();
    // Don't do anything if dropping onto the same tile we're dragging.
    Element dropTarget = event.target;
    if (dragSource != dropTarget) {
      var swap_image = dropTarget.style.backgroundImage;
      dropTarget.style.backgroundImage = dragSource.style.backgroundImage;
      dragSource.style.backgroundImage = swap_image;
      // Set the source column's HTML to the HTML of the tile we dropped on.
      // dragSource.innerHtml = dropTarget.innerHtml;
      // dropTarget.innerHtml = event.dataTransfer.getData('text/html');
    }
  }

  String getRandomTile() {
    var num = rand.nextInt(10);
    var imgUrl = tiles[num];
    while (imgUrl == null) {
      num = rand.nextInt(10);
      imgUrl = tiles[num];
    }
    tiles.remove(num);
    return imgUrl;
  }
}