#テーブル設計

## usersテーブル

| column     | type   | option     |
|------------|--------|------------|
| email      | string | null:false | 
| password   | string | null:false |
| name       | string | null:false |
| profile    | text   | null:false |
| occupation | text   | null:false |
| position   | text   | null:false |

### Association

- belongs_to :prototype
- belongs_to :comments

## prototypeテーブル

| column     | type       | option     |
|------------|------------|------------|
| title      | string     | null:false |
| catch_copy | text       | null:false | 
| concept    | text       | null:false |
| user       | references |            |

### Association

- belongs_to :users
- belongs_to :comments

## commentsテーブル

| column    | type       | option     |
|-----------|------------|------------|
| text      | text       | null:false |
| user      | references |            |
| prototype | references |            |

### Association

- belongs_to :users
- belongs_to :prototype