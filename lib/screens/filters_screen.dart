import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String, bool> currentFilters;
  FiltersScreen(
    this.currentFilters,
    this.saveFilters,
  );

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _vegetarin = false;
  bool _lactoseFree = false;
  bool _vegan = false;
  bool _glutenfree = false;
  @override
  initState() {
    _glutenfree = widget.currentFilters['gluten'];
    _vegan = widget.currentFilters['vegan'];

    _vegetarin = widget.currentFilters['vegetarian'];

    _lactoseFree = widget.currentFilters['lactose'];

    super.initState();
  }

  Widget filterTileBuilder(
    String title,
    String description,
    bool assignedValue,
    Function updateFilter,
  ) {
    return SwitchListTile(
      title: Text(title),
      value: assignedValue,
      subtitle: Text(description),
      onChanged: updateFilter,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Filters'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final selectedFilters = {
                  'gluten': _glutenfree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarin,
                  'lactose': _lactoseFree,
                };
                widget.saveFilters(selectedFilters);
              },
            ),
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust your meals',
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Expanded(
                child: ListView(
              children: <Widget>[
                filterTileBuilder(
                  'Vegan',
                  'Include vegan only',
                  _vegan,
                  (valueSet) {
                    setState(
                      () {
                        _vegan = valueSet;
                      },
                    );
                  },
                ),
                filterTileBuilder(
                  'Vegtarian',
                  'Include vegetarian only',
                  _vegetarin,
                  (valueSet) {
                    setState(
                      () {
                        _vegetarin = valueSet;
                      },
                    );
                  },
                ),
                filterTileBuilder(
                  'Lactose free',
                  'Include lactose free only',
                  _lactoseFree,
                  (valueSet) {
                    setState(
                      () {
                        _lactoseFree = valueSet;
                      },
                    );
                  },
                ),
                filterTileBuilder(
                  'Gluten Free',
                  'Include Gluten Free only',
                  _glutenfree,
                  (valueSet) {
                    setState(
                      () {
                        _glutenfree = valueSet;
                      },
                    );
                  },
                ),
              ],
            ))
          ],
        ));
  }
}
