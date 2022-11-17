import 'package:flutter/material.dart';

class Book {
  final int id;
  final String name;
  final String overview;
  final String posterPath;

  Book({
    required this.id,
    required this.name,
    required this.overview,
    required this.posterPath,
  });
}

final allBooks = [
  Book(
    id: 1,
    name: 'Zootopia+',
    posterPath:
        'https://image.tmdb.org/t/p/w500/sMdOToOg7KXM7j7cOu1QtjB6rkr.jpg',
    overview:
        'Head back to the fast-paced mammal metropolis of Zootopia in this short-form series that dives deeper into the lives of some of the film’s most intriguing characters, including Fru Fru, the newly married arctic shrew; Gazelle’s talented tiger dancers; and the sloth full of surprises, Flash.',
  ),
  Book(
    id: 2,
    name: 'House of the Dragon',
    posterPath:
        'https://image.tmdb.org/t/p/w500/etj8E2o0Bud0HkONVQPjyCkIvpv.jpg',
    overview:
        'The Targaryen dynasty is at the absolute apex of its power, with more than 15 dragons under their yoke. Most empires crumble from such heights. In the case of the Targaryens, their slow fall begins when King Viserys breaks with a century of tradition by naming his daughter Rhaenyra heir to the Iron Throne.',
  ),
  Book(
    id: 3,
    name: 'Star Wars: Andor',
    posterPath:
        'https://image.tmdb.org/t/p/w500//ajztm40qDPqMONaSJhQ2PaNe2Xd.jpg',
    overview:
        'The tale of the burgeoning rebellion against the Empire and how people and planets became involved. In an era filled with danger,',
  ),
  Book(
    id: 4,
    name: 'The Falcon and the Winter Soldier',
    posterPath:
        'https://image.tmdb.org/t/p/w500//6kbAMLteGO8yyewYau6bJ683sw7.jpg',
    overview:
        'Following the events of “Avengers: Endgame,” Sam Wilson/Falcon and Bucky Barnes/Winter Soldier team up in a global adventure that tests their abilities—and their patience.',
  ),
  Book(
    id: 5,
    name: 'WandaVision',
    posterPath:
        'https://image.tmdb.org/t/p/w500//glKDfE6btIRcVB5zrjspRIs4r52.jpg',
    overview:
        'Wanda Maximoff and Vision—two super-powered beings living idealized suburban lives—begin to suspect that everything is not as it seems.',
  ),
  Book(
    id: 6,
    name: 'Loki',
    posterPath:
        'https://image.tmdb.org/t/p/w500//kEl2t3OhXc3Zb9FBh1AuYzRTgZp.jpg',
    overview:
        'Loki, the God of Mischief, steps out of his brother’s shadow in a new Disney+ series that takes place after the events of “Avengers: Endgame.”',
  ),
  Book(
    id: 7,
    name: 'The Bad Batch',
    posterPath:
        'https://image.tmdb.org/t/p/w500//wNUDA0QY7EgYJjgjFk3YkYiKwQJ.jpg',
    overview:
        'Follow the elite and experimental Clones of the Bad Batch as they find their way in a rapidly changing galaxy in the aftermath of the Clone Wars.',
  ),
  Book(
    id: 8,
    name: 'What If...?',
    posterPath:
        'https://image.tmdb.org/t/p/w500//lztzYkXQbUQzU9nUd8pYkYmW7Sb.jpg',
    overview:
        'The series explores pivotal moments from the Marvel Cinematic Universe in an alternate reality that flips the script on what we know about the MCU, resulting in unexpected developments and surprising interactions.',
  ),
  Book(
    id: 9,
    name: 'The Mighty Ducks: Game Changers',
    posterPath:
        'https://image.tmdb.org/t/p/w500//xJWPZIYOEFIjZpBL7SVBGnzRYXp.jpg',
    overview:
        'After failing to make the cut on his elite junior hockey team, 12-year-old Evan is reluctantly accepted onto the Mighty Ducks, a ragtag local squad where the coach is an eccentric former player.',
  ),
  Book(
    id: 11,
    name: 'The Mysterious Benedict Society',
    posterPath:
        'https://image.tmdb.org/t/p/w500//x4UkhIQuHIJyeeOTdcbZ3t3gBSa.jpg',
    overview:
        'Four gifted orphans must outsmart a mysterious organization in order to save the world.',
  ),
  Book(
    id: 12,
    name: 'The Mysterious Benedict Society',
    posterPath:
        'https://image.tmdb.org/t/p/w500//qtfMr08KQsWXnCHY0a96N8NpQ2l.jpg',
    overview:
        'Four gifted orphans must outsmart a mysterious organization in order to save the world.',
  ),
  Book(
    id: 13,
    name: 'The Walking Dead',
    posterPath:
        'https://image.tmdb.org/t/p/w500//zaulpwl355dlKkvtAiSBE5LaoWA.jpg',
    overview:
        'Four gifted orphans must outsmart a mysterious organization in order to save the world.',
  ),
];
