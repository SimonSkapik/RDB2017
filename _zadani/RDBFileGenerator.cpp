#ifdef _MSC_VER
#define _CRT_SECURE_NO_WARNINGS
#endif

#include <stdio.h>
#include <tchar.h>
#include <string.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>


int random(int , int );
char *randstring(int length);

int main(int argc, char* argv[])
{

	int code_lenght = 10;

	int no_of_cpus = 16;
	char *cpus[17] = { "Intel Core i3(Broadwell / 5. generace)", "Intel Core i3(Haswell / 4. generace)",
		"Intel Core i3(Kaby Lake / 7. generace) ", "Intel Core i3(Skylake / 6. generace)", "Intel Core i5(Broadwell / 5. generace)",
		"Intel Core i5(Haswell / 4. generace)", "Intel Core i5(Kaby Lake / 7. generace)", "Intel Core i5(Skylake / 6. generace)",
		"Intel Core i7(Broadwell / 5. generace)", "Intel Core i7(Crystal Well / 4. generace)", "Intel Core i7(Haswell / 4. generace)",
		"Intel Core i7(Kaby Lake / 7. generace)", "Intel Core i7(Skylake / 6. generace)", "Intel Core M3(Kaby Lake / 7. generace)",
		"Intel Core M3(Skylake / 6. generace)", "Intel Core M5(Skylake / 6. generace)", "Intel Core M7(Skylake / 6. generace)" };

	int no_of_cores = 16;
	char *cores[17] = { "2", "4","4", "4","2", "2","2", "2","2", "4","2", "4","4", "2","4", "2","4" };

	int no_of_screen_wides = 3;
	char *screen_wides[4] = { "17.3", "14","15.6", "13.3" };


	int no_of_screen_resolutions = 5;
	char *screen_resolutions[6] = { "1920 x 1080", "2560 x 1440", "3200 x 1800", "1366 x 768", "1280 x 800", "3840 x 2160" };


	int no_of_screen_resolutions_codes = 5;
	char *screen_resolutions_codes[6] = { "Full HD", "WQHD", "QHD +", "HD", "WXGA", "UHD 4K0" };


	int no_of_ram_types = 2;
	char *ram_types[3] = { "DDR3 SODIMM", "DDR4 SODIMM", "LPDDR4"};


	int no_of_ram_types_speed = 2;
	char *ram_types_speed[3] = {"1.666", "2.133", "2.400"};


	int no_of_ram = 4;
	char *ram[5] = { "8", "12", "16", "32", "64" };

	int no_of_os = 5;
	char *os[6] = { "Linux", "no OS", "Windows 8.1", "Windows 10", "Windows 7", "UHD 4K0" };


	int no_of_gpu = 7;
	char *gpu[8] = { "AMD Radeon R5 M430", "AMD Radeon R7 M445", "NVIDIA GeForce 940MX", "NVIDIA GeForce GTX 960M", "NVIDIA GeForce GTX 1050", 
		"NVIDIA GeForce GTX 1070", "NVIDIA GeForce GTX 1060", "NVIDIA Quadro M1000M"};

	int no_of_hdd_types = 2;
	char *hdd_types[3] = { "HDD", "SSHD", "SSD"};


	int no_of_colors = 4;
	char *colors[5] = { "black", "silver", "red","white","grey" };


	if (argc == 3) {

		long count = atol(argv[2]);
		time_t t;
		srand((unsigned)time(&t));

			long number = 0;
			char *filename = (char *)malloc(200 * sizeof(char));
			strcpy(filename, argv[1]);
			char *buffer = (char *)malloc(200 * sizeof(char));
			sprintf(buffer, "%lu", (unsigned)time(NULL));
			strcat(filename, buffer);
			char *filename_json = (char *)malloc(200 * sizeof(char));
			strcpy(filename_json, filename);

			char *filename_csv = (char *)malloc(200 * sizeof(char));
			strcpy(filename_csv, filename);

			strcat(filename, ".xml");

			FILE *f = fopen(filename, "w");

			strcat(filename_json, ".json");
			FILE *f_json = fopen(filename_json, "w");

			strcat(filename_csv, ".csv");
			FILE *f_csv = fopen(filename_csv, "w");

			if (f == NULL || f_json == NULL || f_csv == NULL)
			{
				printf("Error while creating output files!\n");
				exit(1);
			}

			fprintf(f, "%s", "<?xml version=\"1.0\" encoding=\"UTF-8\" ?>\n<data>");
			fprintf(f_json, "%s", "{\"data\":[\n");
			//fprintf(f_csv, "%s", "»Ìslo produktu, ⁄hlop¯ÌËka displeje ["], RozliöenÌ displeje, Typ procesoru, PoËet jader procesoru, Typ pamÏti, Frekvence pamÏti[MHz], Velikost operaËnÌ pamÏti[GB], OperaËnÌ systÈm, InternÌ pamÏù[GB], Typ pevnÈho disku, Grafick· karta, Barva V˝öka[mm], äÌ¯ka[mm], Hloubka[mm], Hmotnost[kg].\n");

			while (number < count) {

				//int paid = random(0, 1000);
				char *serial = randstring(5);
				int cpus_index = random(0, no_of_cpus);

				char* cpu = cpus[cpus_index];

				int cscreen_wides_index = random(0, no_of_screen_wides);

				char* screen_wides_val = screen_wides[cscreen_wides_index];


				int screen_resolutions_index = random(0, no_of_screen_resolutions);

				char* screen_resolutions_val = screen_resolutions[screen_resolutions_index];

				char* screen_resolutions_codes_val = screen_resolutions_codes[screen_resolutions_index];
				
				int cores_index = random(0, no_of_cores);

				char* cores_val = cores[cores_index];
					

				int ram_types_index = random(0, no_of_ram_types);

				char* ram_typess_val = ram_types[ram_types_index];


				int ram_types_speed_index = random(0, no_of_ram_types_speed);

				char* ram_types_speed_val = ram_types_speed[ram_types_speed_index];


				int ram_index = random(0, no_of_ram);

				char* ram_val = ram[ram_index];

				int os_index = random(0, no_of_os);

				char* os_val = os[os_index];

				int hdd = random(0, 2000);

				int hdd_types_index = random(0, no_of_hdd_types);

				char* hdd_types_val = hdd_types[hdd_types_index];

				int gpu_index = random(0, no_of_gpu);

				char* gpu_val = gpu[gpu_index];
				
				int color_index = random(0, no_of_colors);

				char* color_val = colors[color_index];


				int height = random(10, 50);
				int width = random(250, 450);
				int depth = random(180, 390);
				int weight = random(0, 5);



				//XML write down
				fprintf(f, "\n<computer>\n\t<serial>%s</serial>\n\t<screen>%s</screen>\n\t<resolution>%s</resolution>\n\t<resolution_code>%s</resolution_code>\n\t<cpu>%s</cpu>\n\t<cores>%s</cores>\n\t<ram>%s</ram>\n\t<ram_type>%s</ram_type>\n\t<ram_capacity>%s</ram_capacity><os>%s</os>\n\t<hdd>%d</hdd>\n\t<hdd_type>%s</hdd_type>\n\t<gpu>%s</gpu>\n\t<color>%s</color>\n\t<height>%d</height>\n\t<width>%d</width>\n\t<depth>%d</depth>\n\t<weight>%d</weight>\n\t \n</computer>",
					serial, screen_wides_val, screen_resolutions_val, screen_resolutions_codes_val, cpu, cores_val, ram_typess_val, ram_types_speed_val, ram_val,
					os_val, hdd,
					hdd_types_val, gpu_val, color_val, height, width, depth, weight);


				//generate error
				int error = random(0, 4);
				if (error == 0) {
					cpus_index = random(0, no_of_cpus);
					cpu = cpus[cpus_index];
				}
				error = random(0, 4);
				if (error == 0) {
					cscreen_wides_index = random(0, no_of_screen_wides);
					screen_wides_val = screen_wides[cscreen_wides_index];
				}

				error = random(0, 4);
				if (error == 0) {
					screen_resolutions_index = random(0, no_of_screen_resolutions);
					screen_resolutions_val = screen_resolutions[screen_resolutions_index];
				}


				error = random(0, 4);
				if (error == 0) {
					screen_resolutions_index = random(0, no_of_screen_resolutions);
					screen_resolutions_codes_val = screen_resolutions_codes[screen_resolutions_index];
				}



				error = random(0, 4);
				if (error == 0) {
					cores_index = random(0, no_of_cores);
					cores_val = cores[cores_index];
				}


				error = random(0, 4);
				if (error == 0) {
					ram_types_index = random(0, no_of_ram_types);
					ram_typess_val = ram_types[ram_types_index];
				}



				error = random(0, 4);
				if (error == 0) {
					ram_types_speed_index = random(0, no_of_ram_types_speed);
					ram_types_speed_val = ram_types_speed[ram_types_speed_index];
				}



				error = random(0, 4);
				if (error == 0) {
					ram_index = random(0, no_of_ram);
					ram_val = ram[ram_index];
				}


				error = random(0, 4);
				if (error == 0) {
					os_index = random(0, no_of_os);
					os_val = os[os_index];
				}


				error = random(0, 4);
				if (error == 0) {
					hdd = random(0, 2000);
				}

				
				error = random(0, 4);
				if (error == 0) {
					hdd_types_index = random(0, no_of_hdd_types);
					hdd_types_val = hdd_types[hdd_types_index];
				}

				
				error = random(0, 4);
				if (error == 0) {
					gpu_index = random(0, no_of_gpu);
					gpu_val = gpu[gpu_index];
				}

				error = random(0, 4);
				if (error == 0) {
					color_index = random(0, no_of_colors);
					color_val = colors[color_index];
				}

/*
				int height = random(10, 50);
				int width = random(250, 450);
				int depth = random(180, 390);
				int weight = random(0, 5);
*/
				//JSON write down
				fprintf(f_json, "{\"serial\":\"%s\",\"screen\":\"%s\",\"resolution\":\"%s\",\"resolution_code\":\"%s\",\"cpu\":\"%s\",\"cores\":\"%s\",\"ram\":\"%s\",\"ram_type\":\"%s\",\"ram_capacity\":\"%s\",\"os\":\"%s\",\"hdd\":\"%d\",\"hdd_type\":\"%s\",\"gpu\":\"%s\",\"color\":\"%s\",\"height\":\"%d\",\"width\":\"%d\",\"depth\":\"%d\",\"weight\":\"%d\"},\n", 
					serial, screen_wides_val, screen_resolutions_val, screen_resolutions_codes_val, cpu, cores_val, ram_typess_val, ram_types_speed_val, ram_val, os_val, hdd, hdd_types_val, gpu_val, color_val, height, width, depth, weight);

				error = random(0, 4);
				if (error == 0) {
					cpus_index = random(0, no_of_cpus);
					cpu = cpus[cpus_index];
				}
				error = random(0, 4);
				if (error == 0) {
					cscreen_wides_index = random(0, no_of_screen_wides);
					screen_wides_val = screen_wides[cscreen_wides_index];
				}

				error = random(0, 4);
				if (error == 0) {
					screen_resolutions_index = random(0, no_of_screen_resolutions);
					screen_resolutions_val = screen_resolutions[screen_resolutions_index];
				}


				error = random(0, 4);
				if (error == 0) {
					screen_resolutions_index = random(0, no_of_screen_resolutions);
					screen_resolutions_codes_val = screen_resolutions_codes[screen_resolutions_index];
				}



				error = random(0, 4);
				if (error == 0) {
					cores_index = random(0, no_of_cores);
					cores_val = cores[cores_index];
				}


				error = random(0, 4);
				if (error == 0) {
					ram_types_index = random(0, no_of_ram_types);
					ram_typess_val = ram_types[ram_types_index];
				}



				error = random(0, 4);
				if (error == 0) {
					ram_types_speed_index = random(0, no_of_ram_types_speed);
					ram_types_speed_val = ram_types_speed[ram_types_speed_index];
				}



				error = random(0, 4);
				if (error == 0) {
					ram_index = random(0, no_of_ram);
					ram_val = ram[ram_index];
				}


				error = random(0, 4);
				if (error == 0) {
					os_index = random(0, no_of_os);
					os_val = os[os_index];
				}


				error = random(0, 4);
				if (error == 0) {
					hdd = random(0, 2000);
				}


				error = random(0, 4);
				if (error == 0) {
					hdd_types_index = random(0, no_of_hdd_types);
					hdd_types_val = hdd_types[hdd_types_index];
				}


				error = random(0, 4);
				if (error == 0) {
					gpu_index = random(0, no_of_gpu);
					gpu_val = gpu[gpu_index];
				}

				error = random(0, 4);
				if (error == 0) {
					color_index = random(0, no_of_colors);
					color_val = colors[color_index];
				}

				//CSV write down
				fprintf(f_csv, "%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%d,%s,%s,%s,%d,%d,%d,%d\n", 
					serial, screen_wides_val, screen_resolutions_val, screen_resolutions_codes_val, cpu, cores_val, 
					ram_typess_val, ram_types_speed_val, ram_val, os_val, hdd, hdd_types_val, 
					gpu_val, color_val, height, width, depth, weight);

				number++;
			}
			fprintf(f, "\n</data>");
			fprintf(f_json, "]}");

			fclose(f);
			fclose(f_json);
			fclose(f_csv);

		return 1;
	}
	else{
		printf("Not enough actual parameters!\n Requires: filename no_of_products");
		return 0;
	}

	return 0;
}

int random(int min, int max){
	return (rand() % (max + 1 - min)) + min;
}

char *randstring(int length) {
	static int mySeed = 25011984;
	char *string = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-";
	size_t stringLen = strlen(string);
	char *randomString = NULL;

	srand(time(NULL) * length + ++mySeed);

	if (length < 1) {
		length = 1;
	}

	randomString = (char *)malloc(sizeof(char) * (length + 1));

	if (randomString) {
		short key = 0;

		for (int n = 0; n < length; n++) {
			key = rand() % stringLen;
			randomString[n] = string[key];
		}

		randomString[length] = '\0';

		return randomString;
	}
	else {
		printf("No memory");
		exit(1);
	}
}
