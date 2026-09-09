# 👹 Monster Arm Game

A 2D monster game prototype built in **Godot 4**, centered around controlling a giant monster's hand with gesture-based attacks.

Instead of directly controlling the monster, the player controls its arm and uses gestures to interact with and destroy the environment.

> **Status:** Early gameplay prototype

## 🎮 Current Gameplay

The monster's hand follows the player's mouse while remaining within a limited distance of the monster.

The player can perform attacks using mouse gestures:

- **Swipe Right** → 👊 Punch
- **Swipe Down** → 💥 Ground Slam

Simply touching a building doesn't destroy it. The hand must actually be performing an attack, making destruction part of the combat mechanic rather than just collision.

## ✨ Features So Far

- Mouse-controlled monster hand
- Limited arm reach
- Weighted / delayed hand movement
- Gesture recognition
- Right-swipe punch attack
- Downward ground slam
- Physics-based collisions
- Destructible buildings
- Static ground collision
- Separate normal and attacking collision behavior

## 🎥 Gameplay Demo

![Monster Arm Game Screenshot](media/gameplay.mov)

Gameplay footage coming soon.

## 🛠️ Built With

- **Godot 4**
- **GDScript**
- Godot's 2D physics system

## 🧪 Current Goal

This project is currently focused on proving the core gameplay concept.

The main idea is to create a monster that moves through a city while the player directly controls its hand. Obstacles and interactions can then be designed around different hand gestures and attacks.

The current prototype has successfully established the basic interaction loop:

**Control Hand → Perform Gesture → Attack → Destroy Environment**

## 🚧 What's Next

Some ideas being explored for future iterations include:

- Automatic monster movement
- Procedurally spawning city obstacles
- Additional hand attacks and gestures
- Attack recovery and anticipation
- Improved destruction effects
- Screen shake and impact feedback
- Pixel art graphics and animation
- Mobile touch controls

## 🎯 Project Purpose

This is an experimental game project being built incrementally to explore whether controlling a giant monster through its hand can create a fun and satisfying core gameplay mechanic.

The focus right now isn't on polished art or a complete game. It's on making the central interaction feel good first.
