/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package contapalavras;

/**
 *
 * @author herson melo <hersonpc@gmail.com>
 */

import java.io.IOException;
 
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Reducer;
 
public class ContaPalavrasReducer extends
        Reducer<Text, IntWritable, Text, IntWritable> {
 
    public void reduce(Text text, Iterable<IntWritable> values, Context context)
            throws IOException, InterruptedException {
        int sum = 0;
        for (IntWritable value : values) {
            sum += value.get();
        }
        context.write(text, new IntWritable(sum));
    }
}