import '../models/message_model.dart';

class AIService {
  static Map<String, List<String>> defaultQuestions = {
    'Informatika': [
      'Apa itu algoritma?',
      'Apa itu programming?',
      'Jelaskan tentang struktur data.'
    ],
    'Matematika': [
      'Apa itu integral?',
      'Apa itu trigonometri?',
      'Jelaskan tentang aljabar.'
    ],
    'IPA': [
      'Apa itu fotosintesis?',
      'Jelaskan hukum Newton.',
      'Apa itu energi kinetik?'
    ],
    'IPS': [
      'Apa itu globalisasi?',
      'Jelaskan sistem pemerintahan demokrasi.',
      'Apa itu ekonomi pasar?'
    ],
    'Coding': [
      'Bagaimana cara membuat loop di Python?',
      'Apa itu variabel?',
      'Jelaskan fungsi di JavaScript.'
    ],
    'Lainnya': [
      'Berikan tips belajar efektif.',
      'Apa itu soft skill?',
      'Bagaimana mengatur waktu belajar?'
    ],
  };

  static List<Message> getAnswer(String question, String subject) {
    String answer;

    // Jawaban lebih panjang & terstruktur
    if (subject == 'Informatika') {
      if (question.toLowerCase().contains('algoritma')) {
        answer =
            'Algoritma adalah urutan langkah-langkah logis untuk menyelesaikan suatu masalah atau tugas tertentu. '
            'Dalam pemrograman, algoritma membantu kita merencanakan solusi sebelum menulis kode.';
      } else if (question.toLowerCase().contains('programming')) {
        answer =
            'Programming adalah proses menulis instruksi yang dapat dijalankan komputer untuk menyelesaikan masalah. '
            'Bahasa pemrograman populer termasuk Python, Java, dan C++.';
      } else {
        answer =
            'Ini jawaban Informatika umum: Pelajari algoritma, pemrograman, struktur data, dan logika pemrograman.';
      }
    } else if (subject == 'Matematika') {
      answer =
          'Jawaban Matematika: Untuk pertanyaan "$question", fokus pada konsep dan teori yang relevan. '
          'Gunakan contoh soal dan langkah-langkah penyelesaian yang jelas.';
    } else if (subject == 'IPA') {
      answer =
          'Jawaban IPA: Untuk pertanyaan "$question", jelaskan definisi, konsep, dan contohnya. '
          'Misalnya eksperimen atau fenomena sehari-hari untuk memudahkan pemahaman.';
    } else if (subject == 'IPS') {
      answer =
          'Jawaban IPS: Untuk pertanyaan "$question", jelaskan konsep, konteks sosial dan historis, '
          'dan berikan contoh nyata dalam kehidupan sehari-hari.';
    } else if (subject == 'Coding') {
      answer =
          'Jawaban Coding: Jelaskan sintaks, contoh kode, dan cara kerja program. '
          'Berikan langkah-langkah jelas agar mudah dipahami pemula.';
    } else {
      answer =
          'Jawaban umum: Untuk pertanyaan "$question", pahami inti masalah, gunakan contoh, '
          'dan jelaskan langkah-langkah dengan bahasa yang mudah dimengerti.';
    }

    return [Message(text: answer, isUser: false)];
  }
}