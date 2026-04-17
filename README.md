<h1>🗓 Evently</h1>

<img src="assets/screenshots/evently_cover.png" alt="Cover" width="100%"/>

<p>
<b>Evently</b> is a modern Flutter application that allows users to create, manage, and organize their events .  
The app includes authentication, profile customization, and full CRUD operations for events — making it perfect for managing daily activities and important occasions. 📅✨
</p>

<hr/>

<h2>🚀 Features</h2>

<ul>
  <li>
    <b>Authentication System</b>
    <ul>
      <li>Sign up & login using <b>Email & Password</b></li>
      <li>Sign in with <b>Google Account</b> 🔐</li>
    </ul>
  </li>

  <li>
    <b>Home & Events Management</b>
    <ul>
      <li>Add new events (Title, Description, Date & Time, Category) 📌</li>
      <li>View all events in a clean and organized UI</li>
    </ul>
  </li>

  <li>
    <b>Favorites System</b>
    <ul>
      <li>Mark/unmark events as <b>Favorite</b> ⭐</li>
      <li>Dedicated screen for favorite events</li>
    </ul>
  </li>

  <li>
    <b>Edit & Delete Events</b>
    <ul>
      <li>Edit event details بسهولة ✏️</li>
      <li>Delete events instantly 🗑️</li>
    </ul>
  </li>

  <li>
    <b>Profile Screen</b>
    <ul>
      <li>Change profile picture 🖼️</li>
      <li>Switch between <b>Dark / Light mode</b> 🌙☀️</li>
      <li>Change application language 🌍</li>
    </ul>
  </li>
</ul>

<hr/>

<h2>📸 Screenshots</h2>

<table>
  <tr>
    <td><img src="assets/screenshots/login.jpeg" width="200"/></td>
    <td><img src="assets/screenshots/home.jpeg" width="200"/></td>
    <td><img src="assets/screenshots/add_event.jpeg" width="200"/></td>
  </tr>
  <tr>
    <td><img src="assets/screenshots/event_details.jpeg" width="200"/></td>
    <td><img src="assets/screenshots/favorites.jpeg" width="200"/></td>
    <td><img src="assets/screenshots/profile.jpeg" width="200"/></td>
  </tr>
</table>

<hr/>

<h2>📦 Packages Used</h2>

<h3>🎨 UI & Design</h3>
<ul>
  <li><b>google_fonts</b> - Custom fonts for better UI appearance.</li>
  <li><b>flutter_svg</b> - Display SVG icons and assets.</li>
  <li><b>icons_plus</b> - Extra icon collections.</li>
  <li><b>toggle_switch</b> - Used for theme & language switching.</li>
</ul>

<h3>🌍 Localization</h3>
<ul>
  <li><b>easy_localization</b> - Multi-language support داخل التطبيق.</li>
</ul>

<h3>🧠 State Management</h3>
<ul>
  <li><b>provider</b> - Manage app state (user, theme, language, events).</li>
</ul>

<h3>💾 Local Storage</h3>
<ul>
  <li><b>shared_preferences</b> - Store settings like theme and language.</li>
</ul>

<h3>🔥 Firebase & Authentication</h3>
<ul>
  <li><b>firebase_core</b> - Initialize Firebase.</li>
  <li><b>firebase_auth</b> - Email & Password authentication.</li>
  <li><b>google_sign_in</b> - Google login integration.</li>
  <li><b>cloud_firestore</b> - Store events data (CRUD).</li>
</ul>

<h3>🖼️ Media Handling</h3>
<ul>
  <li><b>image_picker</b> - Pick profile image from gallery.</li>
  <li><b>cached_network_image</b> - Load and cache images efficiently.</li>
</ul>

<h3>📁 File & Path</h3>
<ul>
  <li><b>path_provider</b> - Access device storage.</li>
  <li><b>path</b> - Handle file paths.</li>
</ul>

<h3>🌐 Networking</h3>
<ul>
  <li><b>http</b> - Handle API requests.</li>
</ul>

<h3>🔐 Permissions</h3>
<ul>
  <li><b>permission_handler</b> - Manage permissions (gallery, etc.).</li>
</ul>

<h3>🔤 Utilities</h3>
<ul>
  <li><b>characters</b> - Advanced text handling.</li>
  <li><b>matcher</b> - Input validation.</li>
</ul>

<h3>⚙️ Tools</h3>
<ul>
  <li><b>flutter_native_splash</b> - Splash screen generation.</li>
  <li><b>flutter_launcher_icons</b> - App icons generation.</li>
  <li><b>rename</b> - Rename app بسهولة.</li>
</ul>

<hr/>

<h2>🛠 Installation & Run</h2>

<pre>
git clone https://github.com/abdallahelnshar123-ux/evently.git
cd evently
flutter pub get
flutter run
</pre>

<hr/>

<h2>👨‍💻 Author & License</h2>

<p>
<b>Abdallah Samir Elnshar</b><br/>
This app is part of my Flutter development journey during my training at <b>Route Academy</b>.<br/><br/>

It demonstrates real-world concepts like:
<ul>
  <li>Authentication (Firebase)</li>
  <li>State Management (Provider)</li>
  <li>CRUD Operations</li>
  <li>Clean UI & UX</li>
</ul>

This project is open source and available under the <b>MIT License</b>.
</p>
