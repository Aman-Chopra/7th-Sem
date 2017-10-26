package myPackage;

import java.io.*;
import org.apache.hadoop.*;
import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.mapreduce.lib.input.MultipleInputs;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.Mapper;
import org.apache.hadoop.mapreduce.Reducer;
import org.apache.hadoop.util.GenericOptionsParser;
import org.apache.hadoop.mapreduce.lib.input.TextInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;
import org.apache.hadoop.mapreduce.lib.output.TextOutputFormat;


public class MultiInput {
	public static void main(String args[]) throws Exception{
		Configuration c=new Configuration();
		String[] files= new GenericOptionsParser(c,args).getRemainingArgs();
		Path p1=new Path(files[0]);
		Path p2=new Path(files[1]);
		Path p3=new Path(files[2]);
		
		Job j=new Job(c,"multiInp");
		j.setJarByClass(MultiInput.class);
		MultipleInputs.addInputPath(j,p1,TextInputFormat.class,MapFormultiInp1.class);
		MultipleInputs.addInputPath(j,p2,TextInputFormat.class,MapFormultiInp2.class);
		j.setReducerClass(ReduceFomultiInp.class);
		//j.setMapperClass(MapperFormultiInp.class);
		//j.setOutputKeyClass(Text.class);
		//j.setOutputValueClass(Text.class);

		//FileInputFormat.addInputPath(j,input);
		FileOutputFormat.setOutputPath(j,p3);
		System.exit(j.waitForCompletion(true)?0:1);
	}
	
	public static class MapFormultiInp1 extends  Mapper <LongWritable, Text, LongWritable, Text>{
		public void map(LongWritable k, Text value, Context context) throws IOException, InterruptedException
		{
			String line= value.toString();
			String[] words=line.split("\t");
			LongWritable out=new LongWritable(Long.parseLong(words[0]));
			Text out2=new Text(words[1]);
			context.write(out,out2);
		}
	}
	public static class MapFormultiInp2 extends  Mapper <LongWritable, Text, LongWritable, Text>{
		public void map(LongWritable k, Text value, Context context) throws IOException, InterruptedException
		{
			String line= value.toString();
			String[] words=line.split(" ");
			LongWritable out=new LongWritable(Long.parseLong(words[0]));
			Text out2=new Text(words[1]);
			context.write(out,out2);
		}
	}
	public static class ReduceFomultiInp extends Reducer<LongWritable,Text,LongWritable, Text>
	{
		String merg="";
		public void reduce(LongWritable lv,Iterable <Text> values, Context con) throws IOException, InterruptedException
		{
			int i=0;
			for(Text value:values)
			{
				if(i==0){
					merg=value.toString()+",";
				}
				else
					merg+=value.toString();
				i++;
			}
			Text ans=new Text(merg);
			con.write(lv,ans);
		}
	}
	
		
}
