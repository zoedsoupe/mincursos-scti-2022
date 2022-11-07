import express from 'express';
import morgan from 'morgan';
import { Express, Request, Response } from 'express';

const app: Express = express();

app.set('view engine', 'pug');

app.use(morgan('tiny'));

app.get('/', (req: Request, res: Response) => {
  res.render('index', { title: 'Hey', message: 'Hello there!' })
})

app.listen(3000, () => console.log('Node Server running...'))
