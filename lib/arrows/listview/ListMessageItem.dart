import './ListItem.dart';

class ListMessageItem implements ListItem {
	final String sender;
	final String body;

	ListMessageItem(this.sender, this.body);
}
