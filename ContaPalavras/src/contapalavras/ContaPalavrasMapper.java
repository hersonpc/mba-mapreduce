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
import java.util.StringTokenizer;
 
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;
 
public class ContaPalavrasMapper extends
        Mapper<Object, Text, Text, IntWritable> {
 
    private final IntWritable ONE = new IntWritable(1);
    private Text word = new Text();
 
    public void map(Object key, Text value, Context context)
            throws IOException, InterruptedException {
 
	String line = value.toString();
	StringTokenizer st = new StringTokenizer(line," ");
	while(st.hasMoreTokens()){
		word.set(st.nextToken());
		context.write(word,ONE);
	}
    }
}