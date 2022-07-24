import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

class DeleteAccount extends StatelessWidget {
  const DeleteAccount({Key key}) : super(key: key);
  static const keyLanguage = 'key-language';
  static const keyLocation = 'key-location';
  static const keyPassword = 'key-password';
  @override
  Widget build(BuildContext context) {
    return SimpleSettingsTile(
      title: 'Delete Account',
      subtitle: "",
      leading: Container(
        padding: EdgeInsets.all(7),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.red,
        ),
        child: Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
      onTap: () => {},
      child: SettingsScreen(
        title: 'Change Number',
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.error, color: Colors.red.shade400),
                          SizedBox(
                            width: 32,
                          ),
                          Text(
                            'Deleting your account will:',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.red.shade400,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(70, 0, 0, 0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.circle,
                                size: 5,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text('Delete your account from Quee')
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.circle,
                                size: 5,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text('Erase your message history')
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.circle,
                                size: 5,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text('Delete you from all of your Quee groups')
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.circle,
                                size: 5,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text('Delete your Google Drive backup')
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.circle,
                                size: 5,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Flexible(
                                child: Text(
                                    'Delete your payments history and cancel any pending payments'),
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildChangeNumber(context),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.green.shade400)),
                        onPressed: () {},
                        child: Text(
                          'Change Number'.toUpperCase(),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    'To delete your account, confirm your country code and rnter your phone number',
                    style: TextStyle(
                        fontSize: 18, color: Theme.of(context).accentColor),
                  ),
                ),
                SettingsGroup(
                  title: 'Country',
                  children: [
                    buildCountrypic(context),
                  ],
                ),
                SettingsGroup(
                  title: 'Phone',
                  children: [
                    buildPhoneNumber(context),
                  ],
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.red.shade400)),
                    onPressed: () {},
                    child: Text(
                      'Delete my account'.toUpperCase(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildChangeNumber(context) => SimpleSettingsTile(
        title: 'Change Number Instead?',
        subtitle: "",
        leading: Icon(Icons.logout, color: Colors.white),
      );

  Widget buildCountrypic(context) => SafeArea(
        child: Container(
          padding: EdgeInsets.fromLTRB(20, 0, 0, 20),
          transform: Matrix4.translationValues(-17.0, 0.0, 0.0),
          child: CountryCodePicker(
            onChanged: print,
            // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
            initialSelection: 'In',
            favorite: ['+91', 'IN'],
            // countryFilter: ['IT', 'FR'],
            showFlagDialog: false,
            alignLeft: true,
            padding: EdgeInsets.all(0),
            showDropDownButton: true,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            dialogBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
            barrierColor: Theme.of(context).accentColor,
            dialogSize:
                Size.fromHeight(MediaQuery.of(context).size.height * 0.8),
            boxDecoration: BoxDecoration(boxShadow: [
              new BoxShadow(
                // color: Colors.black,
                blurRadius: 0.0,
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
            ]),
          ),
        ),
      );
  Widget buildPhoneNumber(context) => Container(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: TextField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  // border: InputBorder.none,
                  hintText: "+91",
                ),
                onChanged: (value) {
                  // this.phoneNo=value;
                  print(value);
                },
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              flex: 5,
              child: TextField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  // border: InputBorder.none,
                  hintText: "Phone Number",
                ),
                onChanged: (value) {
                  // this.phoneNo=value;
                  print(value);
                },
              ),
            ),
          ],
        ),
      );
}
