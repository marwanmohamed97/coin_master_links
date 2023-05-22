import 'package:flutter/material.dart';

class PrivacyPolicyContent extends StatelessWidget {
  const PrivacyPolicyContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Privacy Policy',
        ),
        backgroundColor: Colors.yellow[900],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Spin Links Privacy Policy',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                'We built the Spin Links app as a free app for users to enjoy. This page is intended to inform you about our policies regarding the collection, use, and disclosure of personal information when you use our Service.',
              ),
              SizedBox(
                height: 24,
              ),
              Text(
                'Information Collection and Use',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                'We do not collect any personal information from users of the Spin Links app. However, we do use third-party service providers to deliver our Service, and these providers may collect certain information when you use our app.',
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                'Third-Party Service Providers',
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                'The following third-party service providers are used by the Spin Links app:',
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                '      Google Play Services',
              ),
              Text(
                '      AdMob Google',
              ),
              Text(
                '      Analytics for Firebase',
              ),
              Text(
                '      Firebase Crashlytics',
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                'These service providers collect certain information when you use our app, such as your device\'s Internet Protocol ("IP") address, device name, operating system version, the configuration of the app when utilizing our Service, the time and date of your use of the Service, and other statistics. This information is collected to help us improve the functionality and performance of our app.',
              ),
              SizedBox(
                height: 24,
              ),
              Text(
                'Log Data',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'In a case of an error in the Spin Links app, we may collect data and information (through third-party products) on your phone called Log Data. This Log Data may include information such as your device\'s IP address, device name, operating system version, the configuration of the appwhen utilizingour Service, the time and date of your use of the Service, and other statistics. This information is used to help us diagnose and fix any issues with the app.',
              ),
              SizedBox(
                height: 24,
              ),
              Text(
                'Data Security',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'We take data security seriously and have implemented measures to protect the information collected by our third-party service providers. We use industry-standard security measures to ensure that your data is protected.',
              ),
              SizedBox(
                height: 24,
              ),
              Text(
                'Changes to Privacy Policy',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'We may update our privacy policy from time to time. We will notify you of any changes by posting the new privacy policy on this page. You are advised to review this privacy policy periodically for any changes.',
              ),
              SizedBox(
                height: 24,
              ),
              Text(
                'Contact Us',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'If you have any questions or suggestions about our privacy policy, please do not hesitate to contact us at marwanandroid2014@gmail.com. We are always happy to hear from our users and will do our best to address any concerns you may have.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
