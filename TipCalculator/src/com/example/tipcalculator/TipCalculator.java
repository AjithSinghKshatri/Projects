package com.example.tipcalculator;

import android.app.Activity;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

public class TipCalculator extends Activity {

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_tip_calculator);
		calculateButton();
		resetButton();
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.tip_calculator, menu);
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

	private void calculateButton() {
		Button displayButton = (Button) findViewById(R.id.Calculatebutton); // 2
		displayButton.setOnClickListener(new OnClickListener() { // 3
			public void onClick(View arg0) {
				EditText bill = (EditText) findViewById(R.id.billEditText);
				EditText tip = (EditText) findViewById(R.id.tipEditText);
				TextView tipAmount = (TextView) findViewById(R.id.Resulttip);
				TextView totalAmount = (TextView) findViewById(R.id.Resultamount);

				double billAmount = 0;
				double tipPercent = 0;

				try {
					billAmount = Double.parseDouble(bill.getText().toString());
					tipPercent = Double.parseDouble(tip.getText().toString());
					tipPercent /= 100;
					double totalToPay = billAmount * (tipPercent + 1);
					double totalTip = billAmount * tipPercent;

					// Display results to user
					totalAmount.setText(String.format("$%.2f", totalToPay));
					tipAmount.setText(String.format("$%.2f", totalTip));

				} catch (Exception e) {
					totalAmount.setText("Error");
					tipAmount.setText("Error");
				}

			}
		});
	}

	private void resetButton() {
		Button displayButton = (Button) findViewById(R.id.Resetbutton); // 2
		displayButton.setOnClickListener(new OnClickListener() { // 3
			public void onClick(View arg0) {
				EditText bill = (EditText) findViewById(R.id.billEditText);
				EditText tip = (EditText) findViewById(R.id.tipEditText);
				TextView tipAmount = (TextView) findViewById(R.id.Resulttip);
				TextView totalAmount = (TextView) findViewById(R.id.Resultamount);
				bill.setText("");	
				tip.setText("");
				tipAmount.setText("");
				totalAmount.setText("");
			}
		});
	}
}
