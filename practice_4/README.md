# practice_4
# Notes App

## Интрефейс приложения

<img width="973" alt="Начальный экран" src="https://github.com/user-attachments/assets/ba83cd84-b0fd-4da1-9566-98c801724c04">

<img width="973" alt="Добавление заметки" src="https://github.com/user-attachments/assets/1a7c1674-844d-476a-baa8-31ec5e628aad">

<img width="973" alt="ShackBar - заметка сохранена" src="https://github.com/user-attachments/assets/a6f5b157-da38-4b2d-8b6f-c1df6ae2c656">

<img width="973" alt="SnackBar - заметка удалена" src="https://github.com/user-attachments/assets/d68505d8-fdb8-45d6-a3e4-4ac135a8cdb3">

<img width="973" alt="SnackBar - необходимо название" src="https://github.com/user-attachments/assets/a52421d5-821d-4e63-b1ce-85c5f47da4dc">

## Логика работы

### Экран HomePage => HomeScreen

Основной экран приложения, на нем отображаются все заметки, и находится кнопка "+"

### Экран NotesPage => NotesScreen

На этом экране два текстовых поля TextField: "Название" - обязательное поле, "Дополнительная информация" - не обязательное.

Также на нем две кнопки "Сохранить" и "Удалить"

### Кнопка "Сохранить"

saveNote() - сохраняет новую заметку или сохраняет изменение для старой, также с помощью Navigator возвращает HomeScreen.

### Кнопка "Удалить"

deleteNote()() - удаляет заметку, также с помощью Navigator возвращает HomeScreen.


## Используемые классы

### class Note

Сам экземпляр заметки, имеет два строковых поля: title и info

### class NotesChanger

Функции работы с заметками:

1. addNote
2. updateNote
3. deleteNote
