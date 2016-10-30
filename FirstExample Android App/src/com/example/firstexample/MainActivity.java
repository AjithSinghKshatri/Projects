package com.example.firstexample;

import android.app.Activity;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

public class MainActivity extends Activity {

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);
		initDisplayButton();
		initClearButton();
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.main, menu);
		return true;
	}

	@Override
	public boolean onOptionsItemSelected(MenuItem item) {
		// Handle action bar item clicks here. The action bar will
		// automatically handle clicks on the Home/Up button, so long
		// as you specify a parent activity in AndroidManifest.xml.
		int id = item.getItemId();
		if (id == R.id.action_settings) {
			return true;
		}
		return super.onOptionsItemSelected(item);
	}
	
	private void initDisplayButton() {
		Button displayButton = (Button) findViewById(R.id.button1); // 2
		displayButton.setOnClickListener(new OnClickListener() { // 3
					public void onClick(View arg0) {
						EditText editName1 = (EditText) findViewById(R.id.editText1); 
						EditText editName2 = (EditText) findViewById(R.id.editText2);// 4
						TextView textDisplay = (TextView) findViewById(R.id.textView2); // 5
						String nameToDisplay1 = editName1.getText().toString();
						String nameToDisplay2 = editName2.getText().toString();// 6
						textDisplay.setText(" Hello " + nameToDisplay1 + nameToDisplay2); // 7
					}
				});
	}
	
	private void initClearButton() {
		Button displayButton = (Button) findViewById(R.id.button2); // 2
		displayButton.setOnClickListener(new OnClickListener() { // 3
					public void onClick(View arg0) {
						EditText editName1 = (EditText) findViewById(R.id.editText1); 
						EditText editName2 = (EditText) findViewById(R.id.editText2);// 4
						TextView textDisplay = (TextView) findViewById(R.id.textView2); // 5
						String nameToDisplay1 = editName1.getText().toString();
						String nameToDisplay2 = editName2.getText().toString();// 6
						editName1.setText("          ");
						editName2.setText("          ");
						
						editName1.clearFocus();
						textDisplay.setText(" Hello World!"); // 7
					}
				});
	}
}
