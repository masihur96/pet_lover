import 'package:flutter/material.dart';
import 'package:pet_lover/demo_designs/search_bar.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(child: _bodyUI(context)),
    );
  }

  Widget _bodyUI(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        height: size.height,
        width: size.width,
        child: Column(
          children: [
            Container(
                alignment: Alignment.center,
                width: size.width,
                height: AppBar().preferredSize.height,
                child: Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: size.width * .1,
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(left: size.width * .04),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              Navigator.pop(context);
                            });
                          },
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Container(
                        width: size.width * .9,
                        child: SearchBar().showSearchBar(context),
                      ),
                    ],
                  ),
                )),
            Expanded(
              child: Container(
                width: size.width,
                child: ListView.builder(
                    itemCount: 10,
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Container();
                    }),
              ),
            )
          ],
        ));
  }

  Widget _searchBar(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.fromLTRB(size.width * .03, size.width * .01,
          size.width * .03, size.width * .01),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(size.width * .2),
        child: Container(
          width: size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(size.width * .2),
              border: Border.all(color: Colors.grey)),
          child: Padding(
            padding: EdgeInsets.fromLTRB(size.width * .03, size.width * .001,
                size.width * .03, size.width * .001),
            child: _textFormBuilder('Search'),
          ),
        ),
      ),
    );
  }

  Widget _textFormBuilder(String hint) {
    return TextFormField(
      controller: _searchController,
      validator: (value) {
        if (value!.isEmpty)
          return 'Enter $hint';
        else
          return null;
      },
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: Icon(
          Icons.search,
          color: Colors.black,
        ),
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
      ),
      cursorColor: Colors.black,
    );
  }

  Widget _cancelSearch(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.fromLTRB(size.width * .01, size.width * .02,
          size.width * .01, size.width * .02),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SearchPage()));
        },
        borderRadius: BorderRadius.circular(size.width * .2),
        child: Container(
          // width: size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(size.width * .2),
              border: Border.all(color: Colors.grey)
              // boxShadow: [
              //   BoxShadow(color: Colors.grey, spreadRadius: 1),
              // ],
              ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(size.width * .03, size.width * .02,
                size.width * .03, size.width * .02),
            child: Text(
              'Cancel',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey, fontSize: size.width * .04),
            ),
          ),
        ),
      ),
    );
  }
}
