shadoop = hadoop jar /home/js39/software/spatialhadoop2/target/spatialhadoop-2.4.3-SNAPSHOT-uber.jar


all:
	mvn assembly:assembly -Dmaven.test.skip=true -Dmaven.javadoc.skip=true -q

run:
	make all
	$(shadoop) index test.rects sindex:learned test.grid shape:rect overwrite:True local:True
	$(shadoop) rangequery test.grid rect:10,10,10000,10000 rangequery.out overwrite:True local:True

init:
	$(shadoop) generate test.rects size:10m shape:rect mbr:0,0,100000,100000 overwrite:True

quick_run:
	$(shadoop) index test.rects sindex:learned test.grid shape:rect overwrite:True local:True
	$(shadoop) rangequery test.grid rect:10,10,20000,20000 rangequery.out overwrite:True local:True
