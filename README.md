# MY FLYN - Flutter App

A Flutter campaign management app built with GetX state management.

## 🚀 Getting Started

### Prerequisites
- Flutter 3.0+
- Android Studio
- Android SDK (API 21+)

### Installation
```bash
# Clone the repository
git clone https://github.com/yourusername/my-flyn-app.git
cd my-flyn-app

# Install dependencies
flutter pub get

# Run the app
flutter run
```

### Build APK
```bash
flutter build apk --release
```

## 📱 Features

- **User Profile Management** - View and edit user information
- **Campaign Browsing** - Browse and interact with campaigns  
- **File Upload** - Upload portfolio files with permission handling
- **Password Management** - Change password with strength validation
- **Korean Language Support** - Full Korean text support

## 🏗 Architecture

### GetX State Management
- **View Layer**: UI screens using `GetView<Controller>`
- **Controller Layer**: Business logic with reactive variables
- **Reactive UI**: Real-time updates with `Obx()` widgets

### Project Structure
```
lib/
├── controllers/     # Business logic (GetX controllers)
├── views/
│   ├── screens/     # App screens
│   └── widgets/     # Reusable UI components
├── models/          # Data models
└── routes/          # Navigation setup
```

## 🔧 Key Implementation

### Controllers
- `AuthController` - User authentication
- `ProfileController` - Profile management  
- `CampaignController` - Campaign operations
- `PasswordController` - Password functionality

### Screens
- **Splash Screen** - App launch
- **Home Screen** - Dashboard with user stats
- **Campaign List** - Browse campaigns with tabs
- **Profile Screen** - User profile management
- **Profile Edit** - Edit user information
- **Password Settings** - Change password

## 📋 Requirements Met

✅ **GetX State Management** - Proper View/Controller separation  
✅ **Reactive UI** - Obx widgets and Rx variables  
✅ **Android Permissions** - Storage and camera permissions  
✅ **Figma Design** - Pixel-perfect UI implementation  
✅ **Clean Architecture** - Organized code structure  

## 🔐 Permissions

### Android Permissions Required
```xml
<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE" />
<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" />
<uses-permission android:name="android.permission.CAMERA" />
<uses-permission android:name="android.permission.INTERNET" />
```

## 📝 Implementation Decisions

### Why GetX?
- Lightweight state management
- Built-in dependency injection
- Reactive programming support
- Clean separation of concerns

### Architecture Choices
- **View/Controller Pattern** for clean separation
- **Reactive Variables** for automatic UI updates
- **Permission-first Approach** for file operations
- **Form Validation** with real-time feedback

### Technical Features
- **Auto-format** phone numbers (010-1234-5678)
- **Password strength** calculation and validation
- **File upload** with permission handling
- **Error handling** with user-friendly messages
- **Loading states** for all async operations

## 🧪 Testing

### Manual Testing Checklist
- [ ] App launches successfully
- [ ] All screens navigate properly
- [ ] Forms validate input correctly
- [ ] File upload requests permissions
- [ ] Password validation works
- [ ] Korean text displays correctly

### Device Testing
- [ ] Test on Android device (API 21+)
- [ ] Verify permissions on real device
- [ ] Test file system access

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  get: ^4.6.6
  permission_handler: ^11.0.1
  file_picker: ^6.1.1
```

## 🎯 Assignment Compliance

This project fulfills all assignment requirements:

- **Duration**: Completed within 1-2 day timeframe
- **State Management**: GetX implementation with proper architecture
- **Permissions**: Android native permission handling
- **UI**: Figma design implementation with Korean support
- **Code Quality**: Clean, commented, and well-structured code

## 📞 Contact

For questions about this implementation, please check the code comments or create an issue in the repository.

---
**Built with Flutter & GetX**
