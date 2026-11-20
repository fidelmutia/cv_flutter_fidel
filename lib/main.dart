import 'package:flutter/material.dart';

void main() {
  runApp(const FidelPortfolio());
}

const Color primaryColor = Color(0xFF355C8A);
const Color darkColor = Color(0xFF14243A);
const Color backgroundColor = Color(0xFFF4F7FB);

class FidelPortfolio extends StatelessWidget {
  const FidelPortfolio({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Portfolio - Fidel Mushagalusa',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryColor,
        ),
        scaffoldBackgroundColor: backgroundColor,
        fontFamily: 'Roboto',
      ),
      home: const LoginPage(),
    );
  }
}

// =====================================================
// PAGE 1 : CONNEXION
// =====================================================

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  bool hidePassword = true;

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void login() {
    if (usernameController.text.trim().isEmpty ||
        passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Veuillez remplir les deux champs.'),
        ),
      );
      return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => const MainPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF172E4F),
              Color(0xFF0D1828),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 430),
                child: Column(
                  children: [
                    const SizedBox(height: 25),

                    CircleAvatar(
                      radius: 48,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 44,
                        backgroundColor: primaryColor,
                        child: const Text(
                          'FM',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 22),

                    const Text(
                      'FIDEL MUSHAGALUSA',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      'PORTFOLIO PERSONNEL',
                      style: TextStyle(
                        color: Colors.white70,
                        letterSpacing: 3,
                        fontSize: 12,
                      ),
                    ),

                    const SizedBox(height: 35),

                    Container(
                      padding: const EdgeInsets.all(25),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Connexion',
                            style: TextStyle(
                              color: darkColor,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 8),

                          const Text(
                            'Bienvenue dans mon espace personnel.',
                            style: TextStyle(
                              color: Colors.black54,
                            ),
                          ),

                          const SizedBox(height: 25),

                          const Text(
                            'Identifiant',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),

                          const SizedBox(height: 8),

                          TextField(
                            controller: usernameController,
                            decoration: InputDecoration(
                              hintText: 'Entrez votre identifiant',
                              prefixIcon: const Icon(Icons.person),
                              filled: true,
                              fillColor: backgroundColor,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),

                          const SizedBox(height: 20),

                          const Text(
                            'Mot de passe',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),

                          const SizedBox(height: 8),

                          TextField(
                            controller: passwordController,
                            obscureText: hidePassword,
                            decoration: InputDecoration(
                              hintText: 'Entrez votre mot de passe',
                              prefixIcon: const Icon(Icons.lock),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  hidePassword
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                                onPressed: () {
                                  setState(() {
                                    hidePassword = !hidePassword;
                                  });
                                },
                              ),
                              filled: true,
                              fillColor: backgroundColor,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),

                          const SizedBox(height: 25),

                          SizedBox(
                            width: double.infinity,
                            height: 54,
                            child: ElevatedButton(
                              onPressed: login,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: primaryColor,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14),
                                ),
                              ),
                              child: const Text(
                                'Se connecter',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 25),

                    const Text(
                      'Réseaux • Télécommunications • Communication',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white60,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// =====================================================
// NAVIGATION ENTRE LES PAGES
// =====================================================

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;

  final pages = const [
    CvPage(),
    FamilyPage(),
    ContactPage(),
  ];

  final titles = [
    'Mon CV',
    'Ma famille',
    'Contact',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          titles[selectedIndex],
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: primaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            tooltip: 'Déconnexion',
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => const LoginPage(),
                ),
              );
            },
          ),
        ],
      ),

      drawer: Drawer(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(20, 55, 20, 25),
              color: primaryColor,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 38,
                    backgroundColor: Colors.white,
                    child: Text(
                      'FM',
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Fidel Mushagalusa',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Portfolio personnel',
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),

            drawerItem(Icons.person, 'Mon CV', 0),
            drawerItem(Icons.family_restroom, 'Ma famille', 1),
            drawerItem(Icons.contact_mail, 'Contact', 2),

            const Spacer(),

            const Divider(),

            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Déconnexion'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const LoginPage(),
                  ),
                );
              },
            ),

            const SizedBox(height: 15),
          ],
        ),
      ),

      body: IndexedStack(
        index: selectedIndex,
        children: pages,
      ),

      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'CV',
          ),
          NavigationDestination(
            icon: Icon(Icons.people_outline),
            selectedIcon: Icon(Icons.people),
            label: 'Famille',
          ),
          NavigationDestination(
            icon: Icon(Icons.contact_mail_outlined),
            selectedIcon: Icon(Icons.contact_mail),
            label: 'Contact',
          ),
        ],
      ),
    );
  }

  Widget drawerItem(IconData icon, String title, int index) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      selected: selectedIndex == index,
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
        Navigator.pop(context);
      },
    );
  }
}

// =====================================================
// PAGE 2 : CV
// =====================================================

class CvPage extends StatelessWidget {
  const CvPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Profil
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(22),
            ),
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 53,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 49,
                    backgroundColor: Color(0xFFDCE7F4),
                    child: Icon(
                      Icons.person,
                      size: 65,
                      color: primaryColor,
                    ),
                  ),
                ),

                const SizedBox(height: 18),

                const Text(
                  'Fidel Mushagalusa',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  'Étudiant en Réseaux et Télécommunications',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),

                const SizedBox(height: 14),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Text(
                    'Communication • Technologie • Leadership',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 18),

          sectionCard(
            icon: Icons.person,
            title: 'Profil',
            child: const Text(
              "Formé aux réseaux et télécommunications ainsi qu'à "
              "la langue anglaise, je possède des connaissances "
              "techniques et une bonne maîtrise des structures "
              "grammaticales et de la compréhension orale. "
              "Mon parcours me permet d'aborder les enjeux "
              "numériques avec une ouverture linguistique et "
              "une capacité à comprendre des échanges en anglais "
              "dans des contextes variés.",
              style: TextStyle(height: 1.6),
            ),
          ),

          sectionCard(
            icon: Icons.school,
            title: 'Formation',
            child: Column(
              children: [
                timelineItem(
                  title: 'Réseaux et Télécommunication',
                  place: 'ISIG, Goma',
                  date: 'Oct. 2023 – Juil. 2027',
                  details: [
                    'Formation en réseaux et télécommunications.',
                  ],
                ),
                timelineItem(
                  title: 'Langue anglaise',
                  place: 'CPN, Goma',
                  date: 'Oct. 2026 – Janv. 2027',
                  details: [
                    'Étude approfondie de la grammaire anglaise.',
                    'Temps verbaux, structures de phrases et voix active/passive.',
                    'Discours indirect et emploi des modaux.',
                    'Développement de la compréhension orale et de la conversation.',
                  ],
                ),
              ],
            ),
          ),

          sectionCard(
            icon: Icons.work,
            title: 'Expérience professionnelle',
            child: Column(
              children: [
                timelineItem(
                  title: 'Chef de la brigade universitaire',
                  place: 'ISIG, Goma',
                  date: 'Janv. 2025 – Janv. 2027',
                  details: [
                    'Encadré et coordonné la brigade au quotidien.',
                    'Réparti les tâches selon les compétences et priorités.',
                    'Supervisé les activités et assuré la discipline.',
                    'Organisé la rotation des membres.',
                  ],
                ),
                timelineItem(
                  title: 'Chargé de communication',
                  place: 'S.O.S RDCongo, Goma',
                  date: 'Déc. 2024 – Janv. 2025',
                  details: [
                    'Géré les publications sur les réseaux sociaux.',
                    'Suivi leur portée afin d’améliorer l’engagement.',
                    'Élaboré des plans de communication.',
                    'Préparé des contenus adaptés aux objectifs.',
                  ],
                ),
                timelineItem(
                  title: 'Représentant des élèves',
                  place: 'Lycée Lomonba, Kisangani',
                  date: 'Sept. 2022 – Juil. 2023',
                  details: [
                    'Représenté les élèves lors des réunions.',
                    'Facilité le dialogue entre apprenants et administration.',
                    'Coordonné les échanges entre délégués.',
                    'Relayé les besoins des élèves.',
                  ],
                ),
                timelineItem(
                  title: 'Chef de promotion',
                  place: 'ISIG, Goma',
                  date: 'Oct. 2023 – Juil. 2026',
                  details: [
                    'Élaboré des supports et messages promotionnels.',
                    'Présenté des programmes et initiatives.',
                    'Mobilisé les étudiants autour des activités.',
                    'Répondu aux questions des étudiants.',
                  ],
                ),
              ],
            ),
          ),

          sectionCard(
            icon: Icons.engineering,
            title: 'Stages',
            child: Column(
              children: [
                timelineItem(
                  title: 'Stagiaire',
                  place: 'Douane, Kisangani',
                  date: 'Juil. 2022 – Août 2022',
                  details: [
                    'Assisté à la coordination des programmes de stage.',
                    'Suivi des objectifs pédagogiques et des échéances.',
                    'Participé aux échanges entre stagiaires et encadrants.',
                  ],
                ),
                timelineItem(
                  title: 'Stagiaire',
                  place: 'Engineering Sarl, Goma',
                  date: 'Juin 2026 – Juil. 2026',
                  details: [
                    'Installation, configuration et maintenance des réseaux.',
                    'Diagnostic des pannes de connectivité.',
                    'Mise en œuvre de solutions adaptées.',
                    'Documentation des interventions techniques.',
                  ],
                ),
              ],
            ),
          ),

          sectionCard(
            icon: Icons.verified,
            title: 'Certificats',
            child: timelineItem(
              title: 'Hikvision',
              place: 'Certifications techniques',
              date: 'Juil. 2025',
              details: [
                'HCSP – Conception et déploiement de solutions de vidéosurveillance.',
                'HCSA – Installation et configuration des caméras IP Hikvision.',
              ],
            ),
          ),

          sectionCard(
            icon: Icons.computer,
            title: 'Compétences',
            child: Column(
              children: [
                skillItem('Réseaux et télécommunications'),
                skillItem('Coordination d’équipe'),
                skillItem('Encadrement de brigade'),
                skillItem('Communication stratégique'),
                skillItem('Supervision des opérations'),
                skillItem('Gestion des réseaux sociaux'),
                skillItem('Organisation'),
                skillItem('Installation et configuration'),
              ],
            ),
          ),

          sectionCard(
            icon: Icons.language,
            title: 'Langues',
            child: Column(
              children: [
                languageItem('Anglais', 3),
                languageItem('Swahili', 5),
                languageItem('Lingala', 5),
                languageItem('Français', 4),
              ],
            ),
          ),

          sectionCard(
            icon: Icons.favorite,
            title: 'Centres d’intérêt',
            child: Column(
              children: [
                interestItem(Icons.camera_alt, 'Photographie'),
                interestItem(Icons.volunteer_activism, 'Bénévolat'),
                interestItem(Icons.translate, 'Apprentissage des langues'),
                interestItem(Icons.mic, 'Prise de parole en public'),
              ],
            ),
          ),

          const SizedBox(height: 20),

          const Text(
            'Fidel Mushagalusa • Portfolio personnel',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

// =====================================================
// PAGE 3 : FAMILLE
// =====================================================

class FamilyPage extends StatelessWidget {
  const FamilyPage({super.key});

  // Les noms et photos sont à personnaliser.
  final List<Map<String, String>> familyMembers = const [
    {
      'name': 'Nom à ajouter',
      'relation': 'Père',
      'profession': 'Profession à ajouter',
    },
    {
      'name': 'Nom à ajouter',
      'relation': 'Mère',
      'profession': 'Profession à ajouter',
    },
    {
      'name': 'Nom à ajouter',
      'relation': 'Frère / Sœur',
      'profession': 'Information facultative',
    },
    {
      'name': 'Nom à ajouter',
      'relation': 'Frère / Sœur',
      'profession': 'Information facultative',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(22),
            ),
            child: const Column(
              children: [
                Icon(
                  Icons.family_restroom,
                  size: 55,
                  color: Colors.white,
                ),
                SizedBox(height: 12),
                Text(
                  'Ma famille',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Les personnes qui occupent une place importante dans ma vie.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: familyMembers.length,
            gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.78,
            ),
            itemBuilder: (context, index) {
              final member = familyMembers[index];

              return Card(
                elevation: 2,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                clipBehavior: Clip.antiAlias,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color(0xFFE5EDF7),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: const Icon(
                            Icons.add_a_photo,
                            size: 40,
                            color: primaryColor,
                          ),
                        ),
                      ),

                      const SizedBox(height: 12),

                      Text(
                        member['relation']!,
                        style: const TextStyle(
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 5),

                      Text(
                        member['name']!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      const SizedBox(height: 5),

                      Text(
                        member['profession']!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 11,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),

          const SizedBox(height: 18),

          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Text(
              'La famille est une source de soutien, de motivation et de valeurs.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontStyle: FontStyle.italic,
                color: darkColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// =====================================================
// PAGE 4 : CONTACT
// =====================================================

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(22),
            ),
            child: const Column(
              children: [
                CircleAvatar(
                  radius: 38,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.contact_page,
                    size: 42,
                    color: primaryColor,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  'Contactez-moi',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Pour toute question ou collaboration',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          contactCard(
            icon: Icons.phone,
            title: 'Téléphone',
            value: 'Ajouter ton numéro',
          ),

          contactCard(
            icon: Icons.email,
            title: 'E-mail',
            value: 'Ajouter ton adresse e-mail',
          ),

          contactCard(
            icon: Icons.location_on,
            title: 'Adresse',
            value: 'Goma, République démocratique du Congo',
          ),

          contactCard(
            icon: Icons.school,
            title: 'Établissement',
            value: 'ISIG – Goma',
          ),

          contactCard(
            icon: Icons.code,
            title: 'GitHub',
            value: 'Ajouter ton profil GitHub',
          ),

          contactCard(
            icon: Icons.business,
            title: 'LinkedIn',
            value: 'Ajouter ton profil LinkedIn',
          ),

          const SizedBox(height: 15),

          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Column(
              children: [
                Icon(
                  Icons.waving_hand,
                  color: primaryColor,
                  size: 35,
                ),
                SizedBox(height: 10),
                Text(
                  'Merci de visiter mon portfolio !',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Je suis ouvert à l’apprentissage, aux échanges '
                  'et aux opportunités de collaboration.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black54,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

// =====================================================
// WIDGETS REUTILISABLES
// =====================================================

Widget sectionCard({
  required IconData icon,
  required String title,
  required Widget child,
}) {
  return Container(
    width: double.infinity,
    margin: const EdgeInsets.only(bottom: 15),
    padding: const EdgeInsets.all(18),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(18),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.03),
          blurRadius: 8,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: primaryColor),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  color: darkColor,
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 15),

        child,
      ],
    ),
  );
}

Widget timelineItem({
  required String title,
  required String place,
  required String date,
  required List<String> details,
}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),

        const SizedBox(height: 4),

        Text(
          place,
          style: const TextStyle(
            color: primaryColor,
            fontWeight: FontWeight.w500,
          ),
        ),

        const SizedBox(height: 4),

        Text(
          date,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 12,
          ),
        ),

        const SizedBox(height: 8),

        ...details.map(
          (detail) => Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('•  '),
                Expanded(
                  child: Text(
                    detail,
                    style: const TextStyle(height: 1.4),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget skillItem(String skill) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 7),
    child: Row(
      children: [
        const Icon(
          Icons.check_circle,
          size: 18,
          color: primaryColor,
        ),
        const SizedBox(width: 10),
        Expanded(child: Text(skill)),
      ],
    ),
  );
}

Widget languageItem(String language, int level) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: Row(
      children: [
        Expanded(
          child: Text(
            language,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Row(
          children: List.generate(
            5,
            (index) => Icon(
              Icons.circle,
              size: 12,
              color: index < level
                  ? primaryColor
                  : Colors.grey.shade300,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget interestItem(IconData icon, String interest) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: Row(
      children: [
        Icon(icon, color: primaryColor, size: 20),
        const SizedBox(width: 12),
        Expanded(child: Text(interest)),
      ],
    ),
  );
}

Widget contactCard({
  required IconData icon,
  required String title,
  required String value,
}) {
  return Container(
    width: double.infinity,
    margin: const EdgeInsets.only(bottom: 12),
    padding: const EdgeInsets.all(17),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
    ),
    child: Row(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: const Color(0xFFE5EDF7),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Icon(
            icon,
            color: primaryColor,
          ),
        ),

        const SizedBox(width: 14),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                value,
                style: const TextStyle(
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}