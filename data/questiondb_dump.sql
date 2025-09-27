--
-- PostgreSQL database dump
--

-- Dumped from database version 17.0
-- Dumped by pg_dump version 17.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: question; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.question (
    id integer NOT NULL,
    question_title character varying(255) NOT NULL,
    option1 character varying(255) NOT NULL,
    option2 character varying(255) NOT NULL,
    option3 character varying(255) NOT NULL,
    option4 character varying(255) NOT NULL,
    right_answer character varying(255) NOT NULL,
    difficulty_level character varying(255) NOT NULL,
    category character varying(255) NOT NULL
);


ALTER TABLE public.question OWNER TO postgres;

--
-- Name: question_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.question_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.question_id_seq OWNER TO postgres;

--
-- Name: question_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.question_id_seq OWNED BY public.question.id;


--
-- Name: question_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.question_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.question_seq OWNER TO postgres;

--
-- Name: question id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.question ALTER COLUMN id SET DEFAULT nextval('public.question_id_seq'::regclass);


--
-- Data for Name: question; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.question (id, question_title, option1, option2, option3, option4, right_answer, difficulty_level, category) FROM stdin;
17	Which data type is used to store whole numbers?	int	float	double	char	int	Easy	Java
18	Which statement is used to print in Java?	System.out.println	print	echo	cout	System.out.println	Easy	Java
19	What is an instance of a class called?	class	object	method	variable	object	Easy	Java
20	Which access modifier allows access from anywhere?	public	private	protected	default	public	Easy	Java
21	Which data type is used to store text?	int	Integer	float	String	String	Easy	Java
22	Which access modifier allows access within the same package?	public	private	protected	default	default	Medium	Java
23	What is it called when two methods have the same name but different parameters?	Overloading	Overriding	Inheritance	Polymorphism	Overloading	Medium	Java
24	Which component is responsible for executing Java bytecode?	JVM	JRE	JDK	JIT	JVM	Medium	Java
25	Which class is mutable in Java?	StringBuilder	StringBuffer	String	StringTokenizer	StringBuilder	Medium	Java
26	Which is a wrapper class for primitive int?	int	Integer	float	double	Integer	Medium	Java
27	Where are objects stored in memory in Java?	Heap	Stack	Method Area	Class Loader	Heap	Hard	Java
28	Which type of exception must be handled explicitly?	Checked Exception	Unchecked Exception	Error	Runtime Exception	Checked Exception	Hard	Java
29	Which feature is used to achieve multiple inheritance in Java?	Abstract Class	Interface	Enum	Annotation	Interface	Hard	Java
30	Which component is responsible for memory management in Java?	Garbage Collector	JVM	JIT	Compiler	Garbage Collector	Hard	Java
31	Which keyword is used to prevent thread interference?	synchronized	volatile	transient	final	synchronized	Hard	Java
32	Which data structure is ordered and mutable?	list	tuple	dictionary	set	list	Easy	Python
33	Which keyword is used to define a function in Python?	def	class	lambda	return	def	Easy	Python
34	What is the boolean value for "yes" in Python?	True	False	None	0	True	Easy	Python
35	Which loop is used to iterate over a sequence in Python?	for	while	do-while	foreach	for	Easy	Python
36	Which function is used to get the length of a list in Python?	len()	size()	count()	length()	len()	Easy	Python
37	Which data structure is unordered and mutable?	list	tuple	dictionary	set	set	Medium	Python
38	Which method is called a constructor in Python?	__init__	__str__	__repr__	__del__	__init__	Medium	Python
39	Which keyword is used to create anonymous functions?	lambda	def	map	filter	lambda	Medium	Python
40	Which operator checks for object identity?	is	==	!=	in	is	Medium	Python
41	Which tool is used to install Python packages?	pip	conda	virtualenv	wheel	pip	Medium	Python
42	What is the time complexity of searching in a dictionary?	O(1)	O(n)	O(log n)	O(n^2)	O(1)	Hard	Python
43	Which block is always executed in exception handling?	try	except	finally	raise	finally	Hard	Python
44	Which feature is used to modify the behavior of a function?	Decorator	Generator	Iterator	Context Manager	Decorator	Hard	Python
45	Which variable is used to check if a script is run directly?	__name__	__main__	__file__	__init__	__name__	Hard	Python
46	Which feature is used for memory-efficient iteration?	list comprehension	generator expression	lambda function	map function	generator expression	Hard	Python
47	Which data type is used to store whole numbers?	int	float	double	char	int	Easy	Java
48	Which statement is used to print in Java?	System.out.println	print	echo	cout	System.out.println	Easy	Java
49	What is an instance of a class called?	class	object	method	variable	object	Easy	Java
50	Which access modifier allows access from anywhere?	public	private	protected	default	public	Easy	Java
51	Which data type is used to store text?	int	Integer	float	String	String	Easy	Java
52	Which access modifier allows access within the same package?	public	private	protected	default	default	Medium	Java
53	What is it called when two methods have the same name but different parameters?	Overloading	Overriding	Inheritance	Polymorphism	Overloading	Medium	Java
54	Which component is responsible for executing Java bytecode?	JVM	JRE	JDK	JIT	JVM	Medium	Java
55	Which class is mutable in Java?	StringBuilder	StringBuffer	String	StringTokenizer	StringBuilder	Medium	Java
56	Which is a wrapper class for primitive int?	int	Integer	float	double	Integer	Medium	Java
57	Where are objects stored in memory in Java?	Heap	Stack	Method Area	Class Loader	Heap	Hard	Java
58	Which type of exception must be handled explicitly?	Checked Exception	Unchecked Exception	Error	Runtime Exception	Checked Exception	Hard	Java
59	Which feature is used to achieve multiple inheritance in Java?	Abstract Class	Interface	Enum	Annotation	Interface	Hard	Java
60	Which component is responsible for memory management in Java?	Garbage Collector	JVM	JIT	Compiler	Garbage Collector	Hard	Java
61	Which keyword is used to prevent thread interference?	synchronized	volatile	transient	final	synchronized	Hard	Java
62	Which data structure is ordered and mutable?	list	tuple	dictionary	set	list	Easy	Python
63	Which keyword is used to define a function in Python?	def	class	lambda	return	def	Easy	Python
64	What is the boolean value for "yes" in Python?	True	False	None	0	True	Easy	Python
65	Which loop is used to iterate over a sequence in Python?	for	while	do-while	foreach	for	Easy	Python
66	Which function is used to get the length of a list in Python?	len()	size()	count()	length()	len()	Easy	Python
67	Which data structure is unordered and mutable?	list	tuple	dictionary	set	set	Medium	Python
68	Which method is called a constructor in Python?	__init__	__str__	__repr__	__del__	__init__	Medium	Python
69	Which keyword is used to create anonymous functions?	lambda	def	map	filter	lambda	Medium	Python
70	Which operator checks for object identity?	is	==	!=	in	is	Medium	Python
71	Which tool is used to install Python packages?	pip	conda	virtualenv	wheel	pip	Medium	Python
72	What is the time complexity of searching in a dictionary?	O(1)	O(n)	O(log n)	O(n^2)	O(1)	Hard	Python
73	Which block is always executed in exception handling?	try	except	finally	raise	finally	Hard	Python
74	Which feature is used to modify the behavior of a function?	Decorator	Generator	Iterator	Context Manager	Decorator	Hard	Python
75	Which variable is used to check if a script is run directly?	__name__	__main__	__file__	__init__	__name__	Hard	Python
76	Which feature is used for memory-efficient iteration?	list comprehension	generator expression	lambda function	map function	generator expression	Hard	Python
77	Which statement is used to output text in PHP?	echo	print	printf	write	echo	Easy	PHP
78	Which symbol is used to declare a variable in PHP?	$	@	#	%	$	Easy	PHP
79	Which keyword is used to include files in PHP?	include	require	import	load	include	Easy	PHP
80	Which function is used to create an array in PHP?	array()	list()	dict()	set()	array()	Easy	PHP
81	Which function is used to get the length of a string in PHP?	strlen()	length()	size()	count()	strlen()	Easy	PHP
82	Which HTTP method is used to send data to the server in PHP?	GET	POST	PUT	DELETE	POST	Medium	PHP
83	Which function checks if a variable is set and not null?	isset()	empty()	is_null()	is_set()	isset()	Medium	PHP
84	Which function is used to start a session in PHP?	session_start()	session_begin()	start_session()	begin_session()	session_start()	Medium	PHP
85	Which extension is used for database access in PHP with object-oriented support?	PDO	MySQLi	ODBC	ADOdb	PDO	Medium	PHP
86	Which loop is specifically used to iterate over arrays in PHP?	foreach	for	while	do-while	foreach	Medium	PHP
87	Which block is used to handle exceptions in PHP?	try	catch	finally	throw	catch	Hard	PHP
88	Which method is called automatically when an object is created in PHP?	__construct	__destruct	__call	__invoke	__construct	Hard	PHP
89	Which feature is used to achieve code reuse in PHP?	trait	interface	abstract class	namespace	trait	Hard	PHP
90	Which function is used to generate a hash in PHP?	md5()	sha1()	hash()	crypt()	hash()	Hard	PHP
91	Which tool is used for dependency management in PHP?	Composer	Packagist	PEAR	PHAR	Composer	Hard	PHP
92	Which keyword is used to declare a variable in JavaScript?	var	let	const	function	var	Easy	JavaScript
93	Which statement is used to print in JavaScript?	console.log	print	echo	write	console.log	Easy	JavaScript
94	Which keyword is used to define a function in JavaScript?	function	arrow function	class	object	function	Easy	JavaScript
95	What is the boolean value for "yes" in JavaScript?	true	false	null	undefined	true	Easy	JavaScript
96	Which loop is used to iterate over a sequence in JavaScript?	for	while	do-while	foreach	for	Easy	JavaScript
97	Which keyword is block-scoped and can be reassigned?	let	var	const	none	let	Medium	JavaScript
98	Which operator checks for both value and type equality?	==	===	!=	!==	===	Medium	JavaScript
99	Which array method is used to transform each element in JavaScript?	map()	filter()	reduce()	forEach()	map()	Medium	JavaScript
100	Which feature is used for asynchronous programming in JavaScript?	Promise	Callback	Async/Await	Event Loop	Promise	Medium	JavaScript
101	Which method is used to convert a JSON string to an object?	JSON.parse()	JSON.stringify()	JSON.decode()	JSON.encode()	JSON.parse()	Medium	JavaScript
102	Which feature allows a function to access variables from its outer scope?	Closure	Callback	Promise	Event Loop	Closure	Hard	JavaScript
103	Which block is used to handle exceptions in JavaScript?	try	catch	finally	throw	catch	Hard	JavaScript
104	Which feature is used to implement inheritance in JavaScript?	prototype	class	constructor	object	prototype	Hard	JavaScript
105	Which function is used to execute code after a delay in JavaScript?	setTimeout	setInterval	clearTimeout	clearInterval	setTimeout	Hard	JavaScript
106	Which tool is used for bundling JavaScript modules?	Webpack	Babel	NPM	ESLint	Webpack	Hard	JavaScript
\.


--
-- Name: question_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.question_id_seq', 106, true);


--
-- Name: question_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.question_seq', 151, true);


--
-- Name: question question_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.question
    ADD CONSTRAINT question_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

