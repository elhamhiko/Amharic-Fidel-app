import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const AmharicKidsApp());
}

class AmharicKidsApp extends StatelessWidget {
  const AmharicKidsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'የታናናሾች ፊደል',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        useMaterial3: true,
      ),
      home: const MainHomeScreen(),
    );
  }
}

// =---------------- 1. MAIN HOME SCREEN =----------------
class MainHomeScreen extends StatelessWidget {
  const MainHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.lightBlueAccent, Colors.purpleAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'የአማርኛ ፊደላት',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Fidel Worksheets & Games 🎈',
                style: TextStyle(fontSize: 16, color: Colors.white70),
              ),
              const SizedBox(height: 30),
              _buildBtn(context, 'ፊደል ተማር (Worksheets)', Colors.orange, Icons.menu_book, const LearnFidelScreen()),
              const SizedBox(height: 14),
              _buildBtn(context, 'ፊደል ጨዋታ (Game)', Colors.lightGreen, Icons.sports_esports, const BalloonGameScreen()),
              const SizedBox(height: 14),
              _buildBtn(context, 'መልመጃ (Quiz)', Colors.pinkAccent, Icons.assignment_turned_in, const QuizScreen()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBtn(BuildContext context, String title, Color color, IconData icon, Widget screen) {
    return SizedBox(
      width: 260,
      height: 55,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => screen)),
        icon: Icon(icon, color: Colors.white),
        label: Text(title, style: const TextStyle(fontSize: 17, color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
  }
}

// =---------------- 2. WORKSHEET LEARN SCREEN =----------------
class LearnFidelScreen extends StatefulWidget {
  const LearnFidelScreen({super.key});

  @override
  State<LearnFidelScreen> createState() => _LearnFidelScreenState();
}

class _LearnFidelScreenState extends State<LearnFidelScreen> {
  final Map<String, Map<String, dynamic>> fidelData = const {
    'በ': {
      'phonetic': 'BE',
      'mainWord': 'በግ',
      'mainIcon': '🐑',
      'vowels': [
        {'letter': 'በ', 'phonetic': 'BE', 'word': 'በግ', 'icon': '🐑', 'color': Colors.red},
        {'letter': 'ቡ', 'phonetic': 'BU', 'word': 'ቡችላ', 'icon': '🐥', 'color': Colors.blue},
        {'letter': 'ቢ', 'phonetic': 'BI', 'word': 'ቢራቢሮ', 'icon': '🦋', 'color': Colors.purple},
        {'letter': 'ባ', 'phonetic': 'BA', 'word': 'ባቡር', 'icon': '🚂', 'color': Colors.orange},
        {'letter': 'ቤ', 'phonetic': 'BAE', 'word': 'ቤት', 'icon': '🏠', 'color': Colors.green},
        {'letter': 'ብ', 'phonetic': 'B', 'word': 'ብርቱካን', 'icon': '🍊', 'color': Colors.pink},
        {'letter': 'ቦ', 'phonetic': 'BO', 'word': 'ቦርሳ', 'icon': '🎒', 'color': Colors.indigo},
      ],
      'gridLetters': ['በ', 'ጠ', 'ሐ', 'በ', 'ወ', 'ሐ', 'ቤ', 'ጠ', 'ቤ', 'መ', 'በ', 'ለ'],
    },
    'ጨ': {
      'phonetic': 'CHE - RE - QA',
      'mainWord': 'ጨረቃ',
      'mainIcon': '🌙',
      'vowels': [
        {'letter': 'ጨ', 'phonetic': 'CHE', 'word': 'ጨረቃ', 'icon': '🌙', 'color': Colors.teal},
        {'letter': 'ጩ', 'phonetic': 'CHU', 'word': 'ጩኸት', 'icon': '📢', 'color': Colors.cyan},
        {'letter': 'ጪ', 'phonetic': 'CHI', 'word': 'ጪስ', 'icon': '💨', 'color': Colors.grey},
        {'letter': 'ጫ', 'phonetic': 'CHA', 'word': 'ጫማ', 'icon': '👟', 'color': Colors.amber},
        {'letter': 'ጬ', 'phonetic': 'CHAE', 'word': 'ጬስ', 'icon': '🧀', 'color': Colors.deepOrange},
        {'letter': 'ጭ', 'phonetic': 'CH', 'word': 'ጭቃ', 'icon': '🌧️', 'color': Colors.brown},
        {'letter': 'ጮ', 'phonetic': 'CHO', 'word': 'ጮማ', 'icon': '🥩', 'color': Colors.redAccent},
      ],
      'gridLetters': ['ጨ', 'ጠ', 'ሐ', 'ጨ', 'ወ', 'ሐ', 'ጤ', 'ጠ', 'ጤ', 'መ', 'ጨ', 'ለ'],
    },
    'መ': {
      'phonetic': 'ME - KI - NA',
      'mainWord': 'መኪና',
      'mainIcon': '🚗',
      'vowels': [
        {'letter': 'መ', 'phonetic': 'ME', 'word': 'መኪና', 'icon': '🚗', 'color': Colors.blue},
        {'letter': 'ሙ', 'phonetic': 'MU', 'word': 'ሙዝ', 'icon': '🍌', 'color': Colors.yellow},
        {'letter': 'ሚ', 'phonetic': 'MI', 'word': 'ሚዛን', 'icon': '⚖️', 'color': Colors.purple},
        {'letter': 'ማ', 'phonetic': 'MA', 'word': 'ማር', 'icon': '🍯', 'color': Colors.orange},
        {'letter': 'ሜ', 'phonetic': 'MAE', 'word': 'ሜዳ', 'icon': '⚽', 'color': Colors.green},
        {'letter': 'ም', 'phonetic': 'M', 'word': 'ምስር', 'icon': '🍲', 'color': Colors.brown},
        {'letter': 'ሞ', 'phonetic': 'MO', 'word': 'ሞባይል', 'icon': '📱', 'color': Colors.deepPurple},
      ],
      'gridLetters': ['መ', 'ጠ', 'ሐ', 'መ', 'ወ', 'ሐ', 'ሜ', 'ጠ', 'ሜ', 'መ', 'በ', 'ለ'],
    },
  };

  String selectedRoot = 'በ';
  Set<int> foundIndices = {};

  @override
  Widget build(BuildContext context) {
    final current = fidelData[selectedRoot]!;
    final vowels = current['vowels'] as List<Map<String, dynamic>>;
    final gridLetters = current['gridLetters'] as List<String>;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('${current['mainWord']} Worksheets'),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: fidelData.keys.map((key) {
                bool isSelected = key == selectedRoot;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedRoot = key;
                      foundIndices.clear();
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 6),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.orange : Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      key,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: isSelected ? Colors.white : Colors.black87,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.amber[50],
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.orangeAccent),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(selectedRoot, style: const TextStyle(fontSize: 60, fontWeight: FontWeight.bold)),
                      Text(
                        current['mainWord'],
                        style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.lightBlue),
                      ),
                      Text(current['phonetic'], style: const TextStyle(fontSize: 14, color: Colors.grey)),
                    ],
                  ),
                  Text(current['mainIcon'], style: const TextStyle(fontSize: 70)),
                ],
              ),
            ),
            const SizedBox(height: 20),

            const Text(
              'ሰባቱ የፊደል ዘሮች (7 Vowels & Words):',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.brown),
            ),
            const SizedBox(height: 10),
            Column(
              children: vowels.map((v) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: (v['color'] as Color).withOpacity(0.15),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: v['color'] as Color, width: 1.5),
                  ),
                  child: Row(
                    children: [
                      Text(
                        v['letter'],
                        style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: v['color']),
                      ),
                      const SizedBox(width: 16),
                      Text(
                        v['phonetic'],
                        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.grey),
                      ),
                      const Spacer(),
                      Text(
                        v['word'],
                        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 12),
                      Text(v['icon'], style: const TextStyle(fontSize: 28)),
                    ],
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),

            Text(
              '< $selectedRoot > ፊደልን ፈልገህ ንካ (Find & Tap "$selectedRoot"):',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.deepOrange),
            ),
            const SizedBox(height: 10),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: gridLetters.length,
              itemBuilder: (context, index) {
                final letter = gridLetters[index];
                final isFound = foundIndices.contains(index);

                return GestureDetector(
                  onTap: () {
                    if (letter == selectedRoot) {
                      setState(() => foundIndices.add(index));
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: isFound ? Colors.green[100] : Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: isFound ? Colors.green : Colors.grey[400]!,
                        width: isFound ? 3 : 1.5,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        letter,
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: isFound ? Colors.green[800] : Colors.black87,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// =---------------- 3. BALLOON POP GAME =----------------
class BalloonGameScreen extends StatefulWidget {
  const BalloonGameScreen({super.key});

  @override
  State<BalloonGameScreen> createState() => _BalloonGameScreenState();
}

class _BalloonGameScreenState extends State<BalloonGameScreen> {
  final List<String> _letters = ['ሀ', 'ለ', 'መ', 'ሠ', 'ረ', 'ሰ', 'በ', 'ተ', 'ቀ', 'ነ', 'አ', 'ከ', 'ወ', 'ዘ', 'ደ', 'ገ', 'ጠ', 'ጨ', 'ፈ'];
  late String _targetLetter;
  int _score = 0;
  List<String> _currentBalloons = [];

  @override
  void initState() {
    super.initState();
    _startNewRound();
  }

  void _startNewRound() {
    _letters.shuffle();
    _currentBalloons = _letters.take(4).toList();
    _targetLetter = _currentBalloons[Random().nextInt(_currentBalloons.length)];
    setState(() {});
  }

  void _checkAnswer(String chosen) {
    if (chosen == _targetLetter) {
      _score += 10;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('ጐበዝ! Correct! 🎉'), backgroundColor: Colors.green, duration: Duration(milliseconds: 600)),
      );
      _startNewRound();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('እንደገና ሞክር! Try Again! ❌'), backgroundColor: Colors.red, duration: Duration(milliseconds: 600)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      appBar: AppBar(title: Text('ነጥብ (Score): $_score'), backgroundColor: Colors.lightGreen),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Text('Pop: "$_targetLetter"', style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.purple)),
          const SizedBox(height: 20),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(20),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: _currentBalloons.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => _checkAnswer(_currentBalloons[index]),
                  child: Container(
                    decoration: const BoxDecoration(color: Colors.redAccent, shape: BoxShape.circle),
                    child: Center(
                      child: Text(
                        _currentBalloons[index],
                        style: const TextStyle(fontSize: 42, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

// =---------------- 4. EXPANDED QUIZ EXERCISE =----------------
class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final List<Map<String, String>> fullQuizData = [
    {'icon': '🚗', 'word': 'መኪና', 'answer': 'መ'},
    {'icon': '🍋', 'word': 'ለሞን', 'answer': 'ለ'},
    {'icon': '🐑', 'word': 'በግ', 'answer': 'በ'},
    {'icon': '🦁', 'word': 'አንበሳ', 'answer': 'አ'},
    {'icon': '🐔', 'word': 'ዶሮ', 'answer': 'ደ'},
    {'icon': '🏠', 'word': 'ቤት', 'answer': 'ቤ'},
    {'icon': '🍌', 'word': 'ሙዝ', 'answer': 'ሙ'},
    {'icon': '👟', 'word': 'ጫማ', 'answer': 'ጫ'},
    {'icon': '🌙', 'word': 'ጨረቃ', 'answer': 'ጨ'},
    {'icon': '🚂', 'word': 'ባቡር', 'answer': 'ባ'},
    {'icon': '🎒', 'word': 'ቦርሳ', 'answer': 'ቦ'},
    {'icon': '🐟', 'word': 'ዓሳ', 'answer': 'ዓ'},
    {'icon': '⚽', 'word': 'ኳስ', 'answer': 'ኳ'},
    {'icon': '👁️', 'word': 'ዓይን', 'answer': 'ዓ'},
    {'icon': '🌳', 'word': 'ዛፍ', 'answer': 'ዛ'},
    {'icon': '🍯', 'word': 'ማር', 'answer': 'ማ'},
    {'icon': '👂', 'word': 'ጆሮ', 'answer': 'ጆ'},
    {'icon': '🐍', 'word': 'እባብ', 'answer': 'እ'},
    {'icon': '🔑', 'word': 'ቁልፍ', 'answer': 'ቁ'},
    {'icon': '🐎', 'word': 'ፈረስ', 'answer': 'ፈ'},
    {'icon': '☕', 'word': 'ቡና', 'answer': 'ቡ'},
    {'icon': '🔔', 'word': 'ደወል', 'answer': 'ደ'},
    {'icon': '🥖', 'word': 'ዳቦ', 'answer': 'ዳ'},
    {'icon': '🕯️', 'word': 'ሻማ', 'answer': 'ሻ'},
  ];

  int index = 0;
  int score = 0;
  late List<Map<String, String>> activeQuizList;

  @override
  void initState() {
    super.initState();
    _resetQuiz();
  }

  void _resetQuiz() {
    activeQuizList = List.from(fullQuizData)..shuffle();
    index = 0;
    score = 0;
  }

  void _check(String choice) {
    if (choice == activeQuizList[index]['answer']) {
      score++;
    }
    if (index < activeQuizList.length - 1) {
      setState(() => index++);
    } else {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('🎉 Finished! / ተጠናቋል!'),
          content: Text('Your Score: $score / ${activeQuizList.length}'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                setState(() => _resetQuiz());
              },
              child: const Text('Restart / እንደገና ጀምር'),
            )
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final current = activeQuizList[index];
    
    final List<String> allLetters = ['ሀ', 'ለ', 'ሐ', 'መ', 'ሠ', 'ረ', 'ሰ', 'ሸ', 'ቀ', 'በ', 'ተ', 'ቸ', 'ነ', 'አ', 'ከ', 'ወ', 'ዘ', 'ደ', 'ገ', 'ጠ', 'ጨ', 'ፈ'];
    allLetters.remove(current['answer']);
    allLetters.shuffle();
    
    final choices = [current['answer']!, allLetters[0], allLetters[1]]..shuffle();

    return Scaffold(
      backgroundColor: Colors.pink[50],
      appBar: AppBar(
        title: Text('መልመጃ (${index + 1}/${activeQuizList.length})'),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(current['icon']!, style: const TextStyle(fontSize: 90)),
              const SizedBox(height: 10),
              Text(
                current['word']!,
                style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.brown),
              ),
              const SizedBox(height: 10),
              const Text(
                'የቃሉ መጀመሪያ ፊደል የትኛው ነው?',
                style: TextStyle(fontSize: 16, color: Colors.grey, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: choices.map((c) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                        side: const BorderSide(color: Colors.pinkAccent, width: 2),
                      ),
                    ),
                    onPressed: () => _check(c),
                    child: Text(c, style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.pinkAccent)),
                  );
                }).toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
