import 'package:flutter/material.dart';
// import 'package:meal/screens/tabs.dart';
// import 'package:meal/widgets/main_drawer.dart';

enum Filter {
  GlutenFree,
  LactoseFree,
  Vegetarian,
  Vegan
}

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key,required this.currentFilters});
  final Map<Filter,bool> currentFilters;

  @override
  State<FiltersScreen> createState (){
    return _FilterScreenState();
  }
}


class _FilterScreenState extends State<FiltersScreen> {

  var _gultenFreeFilterSet = false;
  var _lactoseFreeFilterSet = false;
  var _vegetarianFilterSet = false;
  var _veganFilterSet = false;

  @override
  void initState() {
    super.initState();
    _gultenFreeFilterSet = widget.currentFilters[Filter.GlutenFree]!;
    _lactoseFreeFilterSet = widget.currentFilters[Filter.LactoseFree]!;
    _vegetarianFilterSet = widget.currentFilters[Filter.Vegetarian]!;
    _veganFilterSet = widget.currentFilters[Filter.Vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Your Filter'
        ),
      ),
      // drawer: MainDrawer(onSelectScream: (identifier){
      //   Navigator.of(context).pop();
      //   if(identifier == 'meals'){
      //     Navigator.of(context).pushReplacement(
      //       MaterialPageRoute(
      //         builder: (context) => const TabScreen()
      //       )
      //     );
      //   }
      // }),
      body: WillPopScope(
        onWillPop: ()async{
          Navigator.of(context).pop({
            Filter.GlutenFree : _gultenFreeFilterSet,
            Filter.LactoseFree: _lactoseFreeFilterSet,
            Filter.Vegetarian : _vegetarianFilterSet,
            Filter.Vegan : _veganFilterSet
          });
          return false;
        },
        child: Column(
          children: [
            SwitchListTile(
              value: _gultenFreeFilterSet, 
              onChanged: (isChecked){
                setState(() {
                  _gultenFreeFilterSet = isChecked;
                });
              },
              title: Text(
                'Gluten-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
              subtitle: Text(
                'Only include gulten-free meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34,right: 22),
            ),
            SwitchListTile(
              value: _lactoseFreeFilterSet, 
              onChanged: (isChecked){
                setState(() {
                  _lactoseFreeFilterSet = isChecked;
                });
              },
              title: Text(
                'Lactose-Free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
              subtitle: Text(
                'Only include Lactose-Free meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34,right: 22),
            ),
            SwitchListTile(
              value: _vegetarianFilterSet, 
              onChanged: (isChecked){
                setState(() {
                  _vegetarianFilterSet = isChecked;
                });
              },
              title: Text(
                'Vegetarian',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
              subtitle: Text(
                'Only include Vegetarian meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34,right: 22),
            ),
            SwitchListTile(
              value: _veganFilterSet, 
              onChanged: (isChecked){
                setState(() {
                  _veganFilterSet = isChecked;
                });
              },
              title: Text(
                'Vegan',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
              subtitle: Text(
                'Only include Vegan meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34,right: 22),
            )
          ],
        ),
      ),
    );
  }
}