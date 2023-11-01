// mock_severity_data.dart
import 'model_map.dart';

Map<String, List<SeverityQuestion>> severityQuestionsByIllness = {
  'social anxiety': [
    SeverityQuestion(
        question: 'Do you feel nervous in social situations?',
        options: {1: 'Rarely', 2: 'Sometimes', 3: 'Often', 4: 'Always'}),
    SeverityQuestion(
        question: 'Do you get anxious often?',
        options: {1: 'Rarely', 2: 'Sometimes', 3: 'Often', 4: 'Always'}),
    SeverityQuestion(
        question: 'Excessive worry about being embarrassed or humiliated',
        options: {1: 'Rarely', 2: 'Sometimes', 3: 'Often', 4: 'Always'}),
    SeverityQuestion(
        question: 'Rapid heartbeat or palpitations',
        options: {1: 'Rarely', 2: 'Sometimes', 3: 'Often', 4: 'Always'}),
    SeverityQuestion(
        question: 'Feeling overwhelmed or panicked in social situations',
        options: {1: 'Rarely', 2: 'Sometimes', 3: 'Often', 4: 'Always'}),
    SeverityQuestion(
        question: 'Fear of being called on or asked to contribute in class or meetings',
        options: {1: 'Rarely', 2: 'Sometimes', 3: 'Often', 4: 'Always'}),
    SeverityQuestion(
        question: 'Fear of making phone calls or leaving voicemails',
        options: {1: 'Rarely', 2: 'Sometimes', 3: 'Often', 4: 'Always'}),
    SeverityQuestion(
        question: 'Feeling like you don\'t belong or fit in social settings',
        options: {1: 'Rarely', 2: 'Sometimes', 3: 'Often', 4: 'Always'}),
    SeverityQuestion(
        question: 'Excessive need for reassurance or validation from others',
        options: {1: 'Rarely', 2: 'Sometimes', 3: 'Often', 4: 'Always'}),
    SeverityQuestion(
        question: 'Fear of attending social events without a trusted companion',
        options: {1: 'Rarely', 2: 'Sometimes', 3: 'Often', 4: 'Always'}),
    SeverityQuestion(
        question: 'Difficulty attending social events due to fear of panic attacks',
        options: {1: 'Rarely', 2: 'Sometimes', 3: 'Often', 4: 'Always'}),
        
    // ... add nine more questions
  ],
  'schizophrenia': [
    SeverityQuestion(
        question: 'Do you hear voices that others cannot hear?',
        options: {1: 'Rarely', 2: 'Sometimes', 3: 'Often', 4: 'Always'}),
    SeverityQuestion(
        question: 'Memory problems',
        options: {1: 'Rarely', 2: 'Sometimes', 3: 'Often', 4: 'Always'}),
    SeverityQuestion(
        question: 'Disorganized behavior',
        options: {1: 'Rarely', 2: 'Sometimes', 3: 'Often', 4: 'Always'}),
    SeverityQuestion(
        question: 'Difficulty initiating and sustaining activities',
        options: {1: 'Rarely', 2: 'Sometimes', 3: 'Often', 4: 'Always'}),
    SeverityQuestion(
        question: 'Poverty of speech (reduced amount of speech)',
        options: {1: 'Rarely', 2: 'Sometimes', 3: 'Often', 4: 'Always'}),
    SeverityQuestion(
        question: 'Difficulty in following instructions',
        options: {1: 'Rarely', 2: 'Sometimes', 3: 'Often', 4: 'Always'}),
    SeverityQuestion(
        question: 'Feelings of persecution or being controlled',
        options: {1: 'Rarely', 2: 'Sometimes', 3: 'Often', 4: 'Always'}),
    SeverityQuestion(
        question: 'Compulsive behaviors',
        options: {1: 'Rarely', 2: 'Sometimes', 3: 'Often', 4: 'Always'}),
    SeverityQuestion(
        question: 'Auditory hallucinations (hearing voices or sounds)',
        options: {1: 'Rarely', 2: 'Sometimes', 3: 'Often', 4: 'Always'}),
    SeverityQuestion(
        question: 'Lack of emotional expression in the face',
        options: {1: 'Rarely', 2: 'Sometimes', 3: 'Often', 4: 'Always'}),
    SeverityQuestion(
        question: 'Difficulty in experiencing or expressing emotions',
        options: {1: 'Rarely', 2: 'Sometimes', 3: 'Often', 4: 'Always'}),
    SeverityQuestion(
        question: 'Feelings of being controlled or manipulated by external forces',
        options: {1: 'Rarely', 2: 'Sometimes', 3: 'Often', 4: 'Always'}),
    SeverityQuestion(
        question: 'Hypersomnia (excessive sleepiness)',
        options: {1: 'Rarely', 2: 'Sometimes', 3: 'Often', 4: 'Always'}),
    // ... add nine more questions
  ],
  'acrophobia': [
    SeverityQuestion(
        question: 'Do you feel dizzy when looking down from a height?',
        options: {1: 'Rarely', 2: 'Sometimes', 3: 'Often', 4: 'Always'}),
    SeverityQuestion(
        question: 'Is it difficult for you to look down from heights?',
        options: {1: 'Rarely', 2: 'Sometimes', 3: 'Often', 4: 'Always'}),
    SeverityQuestion(
        question: 'Do you have a fear of elevators?',
        options: {1: 'Rarely', 2: 'Sometimes', 3: 'Often', 4: 'Always'}),
    SeverityQuestion(
        question: '58. Fear of rooftop parties or events',
        options: {1: 'Rarely', 2: 'Sometimes', 3: 'Often', 4: 'Always'}),
    SeverityQuestion(
        question: '63. Fear of hanging decorations or lights at a height',
        options: {1: 'Rarely', 2: 'Sometimes', 3: 'Often', 4: 'Always'}),
    SeverityQuestion(
        question: '27. Avoidance of heights or high places',
        options: {1: 'Rarely', 2: 'Sometimes', 3: 'Often', 4: 'Always'}),
    SeverityQuestion(
        question: '29. Difficulty looking down from heights',
        options: {1: 'Rarely', 2: 'Sometimes', 3: 'Often', 4: 'Always'}),
    SeverityQuestion(
        question: '28. Difficulty going up or down stairs',
        options: {1: 'Rarely', 2: 'Sometimes', 3: 'Often', 4: 'Always'}),
    SeverityQuestion(
        question: '31. Excessive worry about heights',
        options: {1: 'Rarely', 2: 'Sometimes', 3: 'Often', 4: 'Always'}),
    SeverityQuestion(
        question: '37. Hypersensitivity to bridges or cliffs',
        options: {1: 'Rarely', 2: 'Sometimes', 3: 'Often', 4: 'Always'}),
    SeverityQuestion(
        question: '42. Fear of flying in airplanes or helicopters',
        options: {1: 'Rarely', 2: 'Sometimes', 3: 'Often', 4: 'Always'}),
    // SeverityQuestion(
    //     question: '',
    //     options: {1: 'Rarely', 2: 'Sometimes', 3: 'Often', 4: 'Always'}),
    // SeverityQuestion(
    //     question: '',
    //     options: {1: 'Rarely', 2: 'Sometimes', 3: 'Often', 4: 'Always'}),
    // ... add nine more questions
  ],
};