import { Component, signal } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { HelloService } from './hello.service';

@Component({
  selector: 'app-root',
  imports: [RouterOutlet],
  templateUrl: './app.html',
  styleUrl: './app.css'
})
export class App {
  message = signal('');

  constructor(private helloService: HelloService) {
    this.loadMessage();
  }

  loadMessage() {
    this.helloService.getHello().subscribe(response => {
      this.message.set(response);
    });
  }
}
