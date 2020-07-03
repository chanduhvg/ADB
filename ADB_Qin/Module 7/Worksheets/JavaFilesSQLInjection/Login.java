/* Using JTextFields, JTextArea, and JPasswordField
   Tu
*/
package sql.injection.demo;

import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JTextField;
import javax.swing.JPasswordField;
import javax.swing.JTextArea;
import java.awt.Container;
import java.awt.FlowLayout;
import java.awt.Color;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;

public class Login extends JFrame
{
 private Container contents;
 private JLabel acctLabel,idLabel, passwordLabel, message;
 private JTextField acctNum;
 private JTextField id;
 private JPasswordField password;
 private JTextArea legal;
 
 private boolean validLogin;
 private BankDatabase database = new BankDatabase();
 
 // Constructor
 public Login( )
 {
  super( "Login Screen" );
  
  validLogin = false;
  database.openConnection();
  
  contents = getContentPane( );
  contents.setLayout( new FlowLayout( ) );

  acctLabel = new JLabel( "Enter acct number" ); // label for account
  acctNum = new JTextField( "", 7 );      // instantiate acct text field
  
  idLabel = new JLabel( "Enter id" ); // label for ID
  id = new JTextField( "", 12 );      // instantiate ID text field

  passwordLabel = new JLabel( "Enter password" ); // password label
  password = new JPasswordField( 8 ); // instantiate password field
  password.setEchoChar( '?' );        // set echo character to '?'

  // instantiate JTextArea with legal warning
  legal = new JTextArea( "Warning: Any attempt to illegally\n"
           + "log in to this server is punishable by law.\n"
           + "This corporation will not tolerate hacking,\n"
           + "virus attacks, or other malicious acts." );
  legal.setEditable( false );        // disable typing in this field
  
  message = new JLabel( "Log in" );  // label to hold messages
  // add all components to the window
  contents.add( acctLabel );
  contents.add( acctNum );
  contents.add( idLabel );
  contents.add( id );
  contents.add( passwordLabel );
  contents.add( password );
  contents.add( legal );
  contents.add( message );
  // instantiate event handler for the text fields
  TextFieldHandler tfh = new TextFieldHandler( );

  // add event handler as listener for ID and password fields
  id.addActionListener( tfh );
  password.addActionListener( tfh );

  setSize( 800,500 );
  setVisible( true );
 }

 // private inner class event handler
 private class TextFieldHandler implements ActionListener
 {
  public void actionPerformed( ActionEvent e )
  {
      
      //call a method here that returns true or false
      //demo sql injection to gain unauthorized access
   String returner = database.getName(acctNum.getText(), id.getText(), new String(password.getPassword()));
   message.setText( returner );
   if ( !returner.equals("Login Failed"))
   {
    message.setForeground( Color.BLACK );
   }
   else
   {
    message.setForeground( Color.RED );
   }
  }
 }
}
