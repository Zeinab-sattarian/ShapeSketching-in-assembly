# README

## Overview

This repository contains an assembly language program that demonstrates simple graphical operations using DOS interrupts. The code allows users to interactively choose a shape (Circle, Triangle, Rhombus), a symbol, and a color, then displays the selected shape with the chosen symbol and color. The program also calculates and displays the area of the selected shape. This example showcases basic concepts of assembly programming, including macros, DOS interrupts, and simple graphics.
![OutPut1](https://github.com/user-attachments/assets/733682b7-b177-426c-939d-4b27119420ac)
![OutPut2](https://github.com/user-attachments/assets/a0fe2567-98f0-4a12-a64a-fb0ca1921023)
![OutPut3](https://github.com/user-attachments/assets/a438e9bf-bf44-4c8c-8dd7-48175fbc7f69)



## Features

- **Interactive Menu**: Users can select a shape, symbol, and color through a text-based menu.
- **Shape Drawing**: Supports drawing a Circle, Triangle, or Rhombus.
- **Color Coding**: Different colors are applied based on user input.
- **Area Calculation**: Computes and displays the area of the selected shape.
- **Customizable Symbols**: Allows choosing symbols to represent the shapes.

## Macros

- **`printstr st`**: Prints a string of text to the screen using DOS interrupt 21h.
  - `st` - The string to be printed.
- **`goto x, y`**: Moves the cursor to the specified screen coordinates.
  - `x` - Row coordinate.
  - `y` - Column coordinate.
- **`printchar str, color`**: Prints a single character to the screen with the specified color.
  - `str` - The character to be printed.
  - `color` - The color attribute (e.g., 0Ah for green).

## Data Segment

- **`menu1`, `menu2`, `menu3`, `menu4`**: Strings for user prompts.
- **`line`**: String for new line characters.
- **`input`**: Buffer for user input.
- **`area`, `are`**: Variables for storing the area of the shape.
- **`sym`**: Symbol chosen by the user.
- **`col`**: Color chosen by the user.
- **`num`**: Buffer for numerical input.
- **`row`, `cols`**: Dimensions for shape drawing.
- **`f`**: Flag for managing shape drawing.
- **`msg`**: Prompt message for user input.

## Code Segment

- **`start`**: Entry point of the program. Initializes data segment and displays menus.
- **`getuser`**: Procedure to get and validate user input for shape, symbol, and color.
- **`print_ax`**: Procedure to print a numerical value in hexadecimal format.

## How to Run

1. **Assemble the Code**: Use an assembler like MASM or TASM to convert the source code into an executable file.
   ```bash
   masm shapesketching.asm;
   ```
2. **Link the Executable**: Use a linker to create an executable file.
   ```bash
   link shapesketching.obj;
   ```
3. **Run the Program**: Execute the generated `.exe` file in a DOS environment or DOS emulator like DOSBox.

## Example Usage

1. **Start the Program**: Run the executable file.
2. **Select Shape**: Enter `a`, `b`, or `c` to choose between Circle, Triangle, or Rhombus.
3. **Select Symbol**: Choose a symbol using `a`, `b`, or `c`.
4. **Select Color**: Choose a color with `a`, `b`, or `c`.
5. **Enter Area**: Input the area for the chosen shape.

## Notes

- **Compatibility**: This program is intended to run in a DOS environment. Use a DOS emulator if running on modern systems.
- **Customization**: You can modify the shape drawing logic, colors, and symbols to suit your needs.
- **Debugging**: For debugging or understanding the code, use an assembly language debugger or emulator.


## Acknowledgements

- **DOS Interrupts**: Utilizes DOS interrupts for screen output and cursor movement.
- **Assembly Language**: Written in 16-bit x86 assembly language.

Feel free to open issues or contribute improvements to this repository.
