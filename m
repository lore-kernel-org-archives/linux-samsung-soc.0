From: Romain Naour <romain.naour@openwide.fr>
Subject: Re: [PATCH 1/5 v2] Rename s5p-time to samsung-time
Date: Sat, 15 Dec 2012 22:43:03 +0100
Message-ID: <50CCEEE7.4090203@openwide.fr>
References: <50885608.1030503@openwide.fr> <201211280057.16345.heiko@sntech.de> <50BBAF81.8050100@openwide.fr> <201212101359.51974.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from zimbra3.corp.accelance.fr ([213.162.49.233]:38796 "EHLO
	zimbra3.corp.accelance.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751969Ab2LOVnF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 15 Dec 2012 16:43:05 -0500
In-Reply-To: <201212101359.51974.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>
Cc: tomasz.figa@gmail.com, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, 'Sylwester Nawrocki' <sylvester.nawrocki@gmail.com>

Le 10/12/2012 13:59, Heiko St=FCbner a =E9crit :
> Am Sonntag, 2. Dezember 2012, 20:44:01 schrieb Romain Naour:
>> This patch rename s5p-time to samsung-time.
>> There is no functional change.
>>
>>
>> Signed-off-by: Naour Romain <romain.naour@openwide.fr>
>=20
> The patch does not apply to current linux-next, because it has some p=
roblem=20
> with the exynos-universal board. I've fixed this to test the patch, s=
o
>=20
> Acked-by: Heiko Stuebner <heiko@sntech.de>

What's wrong with this part of the patch ?
I applied this patch today on linux-next tree, branch next-20121214. (w=
ith some hunk but no error)

Thank you for your time.
>=20
>>
>>  delete mode 100644 arch/arm/plat-samsung/include/plat/s5p-time.h
>>  create mode 100644 arch/arm/plat-samsung/include/plat/samsung-time.=
h
>>  rename arch/arm/plat-samsung/{s5p-time.c =3D> samsung-time.c} (70%)
>=20
> what does this line do in the patch description? It seems your mail c=
lient=20
> mangled the "--" parting the patch message from the stats/comment sec=
tion.
>=20
>=20
>=20
>> diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kco=
nfig
>> index da55107..20edfa3 100644
>> --- a/arch/arm/mach-exynos/Kconfig
>> +++ b/arch/arm/mach-exynos/Kconfig
>> @@ -274,7 +274,7 @@ config MACH_UNIVERSAL_C210
>>  	select S5P_DEV_ONENAND
>>  	select S5P_DEV_TV
>>  	select S5P_GPIO_INT
>> -	select S5P_HRT
>> +	select SAMSUNG_HRT
>>  	select S5P_SETUP_MIPIPHY
>>  	help
>>  	  Machine support for Samsung Mobile Universal S5PC210 Reference
>> diff --git a/arch/arm/mach-exynos/mach-universal_c210.c
>> b/arch/arm/mach-exynos/mach-universal_c210.c index ebc9dd3..325bfe9 =
100644
>> --- a/arch/arm/mach-exynos/mach-universal_c210.c
>> +++ b/arch/arm/mach-exynos/mach-universal_c210.c
>> @@ -41,7 +41,7 @@
>>  #include <plat/mfc.h>
>>  #include <plat/sdhci.h>
>>  #include <plat/fimc-core.h>
>> -#include <plat/s5p-time.h>
>> +#include <plat/samsung-time.h>
>>  #include <plat/camport.h>
>>  #include <linux/platform_data/mipi-csis.h>
>>
>> @@ -1099,7 +1099,7 @@ static void __init universal_map_io(void)
>>  	exynos_init_io(NULL, 0);
>>  	s3c24xx_init_clocks(clk_xusbxti.rate);
>>  	s3c24xx_init_uarts(universal_uartcfgs, ARRAY_SIZE(universal_uartcf=
gs));
>> -	s5p_set_timer_source(S5P_PWM2, S5P_PWM4);
>> +	samsung_set_timer_source(SAMSUNG_PWM2, SAMSUNG_PWM4);
>>  }
>>
>>  static void s5p_tv_setup(void)
>> @@ -1158,7 +1158,7 @@ MACHINE_START(UNIVERSAL_C210, "UNIVERSAL_C210"=
)
>>  	.handle_irq	=3D gic_handle_irq,
>>  	.init_machine	=3D universal_machine_init,
>>  	.init_late	=3D exynos_init_late,
>> -	.timer		=3D &s5p_timer,
>> +	.timer		=3D &samsung_timer,
>>  	.reserve        =3D &universal_reserve,
>>  	.restart	=3D exynos4_restart,
>>  MACHINE_END
>> diff --git a/arch/arm/mach-s5p64x0/Kconfig b/arch/arm/mach-s5p64x0/K=
config
>> index e8742cb..f0ec535 100644
>> --- a/arch/arm/mach-s5p64x0/Kconfig
>> +++ b/arch/arm/mach-s5p64x0/Kconfig
>> @@ -9,7 +9,7 @@ if ARCH_S5P64X0
>>
>>  config CPU_S5P6440
>>  	bool
>> -	select S5P_HRT
>> +	select SAMSUNG_HRT
>>  	select S5P_SLEEP if PM
>>  	select SAMSUNG_DMADEV
>>  	select SAMSUNG_WAKEMASK if PM
>> @@ -18,7 +18,7 @@ config CPU_S5P6440
>>
>>  config CPU_S5P6450
>>  	bool
>> -	select S5P_HRT
>> +	select SAMSUNG_HRT
>>  	select S5P_SLEEP if PM
>>  	select SAMSUNG_DMADEV
>>  	select SAMSUNG_WAKEMASK if PM
>> diff --git a/arch/arm/mach-s5p64x0/mach-smdk6440.c
>> b/arch/arm/mach-s5p64x0/mach-smdk6440.c index 96ea1fe..587fec5 10064=
4
>> --- a/arch/arm/mach-s5p64x0/mach-smdk6440.c
>> +++ b/arch/arm/mach-s5p64x0/mach-smdk6440.c
>> @@ -50,7 +50,7 @@
>>  #include <plat/pll.h>
>>  #include <plat/adc.h>
>>  #include <linux/platform_data/touchscreen-s3c2410.h>
>> -#include <plat/s5p-time.h>
>> +#include <plat/samsung-time.h>
>>  #include <plat/backlight.h>
>>  #include <plat/fb.h>
>>  #include <plat/sdhci.h>
>> @@ -231,7 +231,7 @@ static void __init smdk6440_map_io(void)
>>  	s5p64x0_init_io(NULL, 0);
>>  	s3c24xx_init_clocks(12000000);
>>  	s3c24xx_init_uarts(smdk6440_uartcfgs, ARRAY_SIZE(smdk6440_uartcfgs=
));
>> -	s5p_set_timer_source(S5P_PWM3, S5P_PWM4);
>> +	samsung_set_timer_source(SAMSUNG_PWM3, SAMSUNG_PWM4);
>>  }
>>
>>  static void s5p6440_set_lcd_interface(void)
>> @@ -276,6 +276,6 @@ MACHINE_START(SMDK6440, "SMDK6440")
>>  	.handle_irq	=3D vic_handle_irq,
>>  	.map_io		=3D smdk6440_map_io,
>>  	.init_machine	=3D smdk6440_machine_init,
>> -	.timer		=3D &s5p_timer,
>> +	.timer		=3D &samsung_timer,
>>  	.restart	=3D s5p64x0_restart,
>>  MACHINE_END
>> diff --git a/arch/arm/mach-s5p64x0/mach-smdk6450.c
>> b/arch/arm/mach-s5p64x0/mach-smdk6450.c index 12748b6..714cd8a 10064=
4
>> --- a/arch/arm/mach-s5p64x0/mach-smdk6450.c
>> +++ b/arch/arm/mach-s5p64x0/mach-smdk6450.c
>> @@ -50,7 +50,7 @@
>>  #include <plat/pll.h>
>>  #include <plat/adc.h>
>>  #include <linux/platform_data/touchscreen-s3c2410.h>
>> -#include <plat/s5p-time.h>
>> +#include <plat/samsung-time.h>
>>  #include <plat/backlight.h>
>>  #include <plat/fb.h>
>>  #include <plat/sdhci.h>
>> @@ -250,7 +250,7 @@ static void __init smdk6450_map_io(void)
>>  	s5p64x0_init_io(NULL, 0);
>>  	s3c24xx_init_clocks(19200000);
>>  	s3c24xx_init_uarts(smdk6450_uartcfgs, ARRAY_SIZE(smdk6450_uartcfgs=
));
>> -	s5p_set_timer_source(S5P_PWM3, S5P_PWM4);
>> +	samsung_set_timer_source(SAMSUNG_PWM3, SAMSUNG_PWM4);
>>  }
>>
>>  static void s5p6450_set_lcd_interface(void)
>> @@ -295,6 +295,6 @@ MACHINE_START(SMDK6450, "SMDK6450")
>>  	.handle_irq	=3D vic_handle_irq,
>>  	.map_io		=3D smdk6450_map_io,
>>  	.init_machine	=3D smdk6450_machine_init,
>> -	.timer		=3D &s5p_timer,
>> +	.timer		=3D &samsung_timer,
>>  	.restart	=3D s5p64x0_restart,
>>  MACHINE_END
>> diff --git a/arch/arm/mach-s5pv210/Kconfig b/arch/arm/mach-s5pv210/K=
config
>> index 92ad72f..01018ef 100644
>> --- a/arch/arm/mach-s5pv210/Kconfig
>> +++ b/arch/arm/mach-s5pv210/Kconfig
>> @@ -12,7 +12,7 @@ if ARCH_S5PV210
>>  config CPU_S5PV210
>>  	bool
>>  	select S5P_EXT_INT
>> -	select S5P_HRT
>> +	select SAMSUNG_HRT
>>  	select S5P_PM if PM
>>  	select S5P_SLEEP if PM
>>  	select SAMSUNG_DMADEV
>> diff --git a/arch/arm/mach-s5pv210/mach-aquila.c
>> b/arch/arm/mach-s5pv210/mach-aquila.c index ee9fa5c..7c7d89b 100644
>> --- a/arch/arm/mach-s5pv210/mach-aquila.c
>> +++ b/arch/arm/mach-s5pv210/mach-aquila.c
>> @@ -39,7 +39,7 @@
>>  #include <plat/fb.h>
>>  #include <plat/fimc-core.h>
>>  #include <plat/sdhci.h>
>> -#include <plat/s5p-time.h>
>> +#include <plat/samsung-time.h>
>>
>>  #include "common.h"
>>
>> @@ -652,7 +652,7 @@ static void __init aquila_map_io(void)
>>  	s5pv210_init_io(NULL, 0);
>>  	s3c24xx_init_clocks(24000000);
>>  	s3c24xx_init_uarts(aquila_uartcfgs, ARRAY_SIZE(aquila_uartcfgs));
>> -	s5p_set_timer_source(S5P_PWM3, S5P_PWM4);
>> +	samsung_set_timer_source(SAMSUNG_PWM3, SAMSUNG_PWM4);
>>  }
>>
>>  static void __init aquila_machine_init(void)
>> @@ -688,6 +688,6 @@ MACHINE_START(AQUILA, "Aquila")
>>  	.handle_irq	=3D vic_handle_irq,
>>  	.map_io		=3D aquila_map_io,
>>  	.init_machine	=3D aquila_machine_init,
>> -	.timer		=3D &s5p_timer,
>> +	.timer		=3D &samsung_timer,
>>  	.restart	=3D s5pv210_restart,
>>  MACHINE_END
>> diff --git a/arch/arm/mach-s5pv210/mach-goni.c
>> b/arch/arm/mach-s5pv210/mach-goni.c index 55e1dba..2740001 100644
>> --- a/arch/arm/mach-s5pv210/mach-goni.c
>> +++ b/arch/arm/mach-s5pv210/mach-goni.c
>> @@ -48,7 +48,7 @@
>>  #include <plat/keypad.h>
>>  #include <plat/sdhci.h>
>>  #include <plat/clock.h>
>> -#include <plat/s5p-time.h>
>> +#include <plat/samsung-time.h>
>>  #include <plat/mfc.h>
>>  #include <plat/camport.h>
>>
>> @@ -910,7 +910,7 @@ static void __init goni_map_io(void)
>>  	s5pv210_init_io(NULL, 0);
>>  	s3c24xx_init_clocks(clk_xusbxti.rate);
>>  	s3c24xx_init_uarts(goni_uartcfgs, ARRAY_SIZE(goni_uartcfgs));
>> -	s5p_set_timer_source(S5P_PWM3, S5P_PWM4);
>> +	samsung_set_timer_source(SAMSUNG_PWM3, SAMSUNG_PWM4);
>>  }
>>
>>  static void __init goni_reserve(void)
>> @@ -976,7 +976,7 @@ MACHINE_START(GONI, "GONI")
>>  	.handle_irq	=3D vic_handle_irq,
>>  	.map_io		=3D goni_map_io,
>>  	.init_machine	=3D goni_machine_init,
>> -	.timer		=3D &s5p_timer,
>> +	.timer		=3D &samsung_timer,
>>  	.reserve	=3D &goni_reserve,
>>  	.restart	=3D s5pv210_restart,
>>  MACHINE_END
>> diff --git a/arch/arm/mach-s5pv210/mach-smdkc110.c
>> b/arch/arm/mach-s5pv210/mach-smdkc110.c index d9c99fc..d2e93b7 10064=
4
>> --- a/arch/arm/mach-s5pv210/mach-smdkc110.c
>> +++ b/arch/arm/mach-s5pv210/mach-smdkc110.c
>> @@ -30,7 +30,7 @@
>>  #include <linux/platform_data/ata-samsung_cf.h>
>>  #include <linux/platform_data/i2c-s3c2410.h>
>>  #include <plat/pm.h>
>> -#include <plat/s5p-time.h>
>> +#include <plat/samsung-time.h>
>>  #include <plat/mfc.h>
>>
>>  #include "common.h"
>> @@ -122,7 +122,7 @@ static void __init smdkc110_map_io(void)
>>  	s5pv210_init_io(NULL, 0);
>>  	s3c24xx_init_clocks(24000000);
>>  	s3c24xx_init_uarts(smdkv210_uartcfgs, ARRAY_SIZE(smdkv210_uartcfgs=
));
>> -	s5p_set_timer_source(S5P_PWM3, S5P_PWM4);
>> +	samsung_set_timer_source(SAMSUNG_PWM3, SAMSUNG_PWM4);
>>  }
>>
>>  static void __init smdkc110_reserve(void)
>> @@ -156,7 +156,7 @@ MACHINE_START(SMDKC110, "SMDKC110")
>>  	.handle_irq	=3D vic_handle_irq,
>>  	.map_io		=3D smdkc110_map_io,
>>  	.init_machine	=3D smdkc110_machine_init,
>> -	.timer		=3D &s5p_timer,
>> +	.timer		=3D &samsung_timer,
>>  	.restart	=3D s5pv210_restart,
>>  	.reserve	=3D &smdkc110_reserve,
>>  MACHINE_END
>> diff --git a/arch/arm/mach-s5pv210/mach-smdkv210.c
>> b/arch/arm/mach-s5pv210/mach-smdkv210.c index 4cdb5bb..cd28725 10064=
4
>> --- a/arch/arm/mach-s5pv210/mach-smdkv210.c
>> +++ b/arch/arm/mach-s5pv210/mach-smdkv210.c
>> @@ -45,7 +45,7 @@
>>  #include <plat/keypad.h>
>>  #include <plat/pm.h>
>>  #include <plat/fb.h>
>> -#include <plat/s5p-time.h>
>> +#include <plat/samsung-time.h>
>>  #include <plat/backlight.h>
>>  #include <plat/mfc.h>
>>  #include <plat/clock.h>
>> @@ -287,7 +287,7 @@ static void __init smdkv210_map_io(void)
>>  	s5pv210_init_io(NULL, 0);
>>  	s3c24xx_init_clocks(clk_xusbxti.rate);
>>  	s3c24xx_init_uarts(smdkv210_uartcfgs, ARRAY_SIZE(smdkv210_uartcfgs=
));
>> -	s5p_set_timer_source(S5P_PWM2, S5P_PWM4);
>> +	samsung_set_timer_source(SAMSUNG_PWM2, SAMSUNG_PWM4);
>>  }
>>
>>  static void __init smdkv210_reserve(void)
>> @@ -332,7 +332,7 @@ MACHINE_START(SMDKV210, "SMDKV210")
>>  	.handle_irq	=3D vic_handle_irq,
>>  	.map_io		=3D smdkv210_map_io,
>>  	.init_machine	=3D smdkv210_machine_init,
>> -	.timer		=3D &s5p_timer,
>> +	.timer		=3D &samsung_timer,
>>  	.restart	=3D s5pv210_restart,
>>  	.reserve	=3D &smdkv210_reserve,
>>  MACHINE_END
>> diff --git a/arch/arm/mach-s5pv210/mach-torbreck.c
>> b/arch/arm/mach-s5pv210/mach-torbreck.c index 18785cb..aec668c 10064=
4
>> --- a/arch/arm/mach-s5pv210/mach-torbreck.c
>> +++ b/arch/arm/mach-s5pv210/mach-torbreck.c
>> @@ -27,7 +27,7 @@
>>  #include <plat/devs.h>
>>  #include <plat/cpu.h>
>>  #include <linux/platform_data/i2c-s3c2410.h>
>> -#include <plat/s5p-time.h>
>> +#include <plat/samsung-time.h>
>>
>>  #include "common.h"
>>
>> @@ -107,7 +107,7 @@ static void __init torbreck_map_io(void)
>>  	s5pv210_init_io(NULL, 0);
>>  	s3c24xx_init_clocks(24000000);
>>  	s3c24xx_init_uarts(torbreck_uartcfgs, ARRAY_SIZE(torbreck_uartcfgs=
));
>> -	s5p_set_timer_source(S5P_PWM3, S5P_PWM4);
>> +	samsung_set_timer_source(SAMSUNG_PWM3, SAMSUNG_PWM4);
>>  }
>>
>>  static void __init torbreck_machine_init(void)
>> @@ -132,6 +132,6 @@ MACHINE_START(TORBRECK, "TORBRECK")
>>  	.handle_irq	=3D vic_handle_irq,
>>  	.map_io		=3D torbreck_map_io,
>>  	.init_machine	=3D torbreck_machine_init,
>> -	.timer		=3D &s5p_timer,
>> +	.timer		=3D &samsung_timer,
>>  	.restart	=3D s5pv210_restart,
>>  MACHINE_END
>> diff --git a/arch/arm/plat-samsung/Kconfig b/arch/arm/plat-samsung/K=
config
>> index 59401e1..5278795 100644
>> --- a/arch/arm/plat-samsung/Kconfig
>> +++ b/arch/arm/plat-samsung/Kconfig
>> @@ -70,7 +70,7 @@ config S3C_LOWLEVEL_UART_PORT
>>
>>  # timer options
>>
>> -config S5P_HRT
>> +config SAMSUNG_HRT
>>  	bool
>>  	select SAMSUNG_DEV_PWM
>>  	help
>> diff --git a/arch/arm/plat-samsung/Makefile
>> b/arch/arm/plat-samsung/Makefile index 9e40e8d..06f2312 100644
>> --- a/arch/arm/plat-samsung/Makefile
>> +++ b/arch/arm/plat-samsung/Makefile
>> @@ -13,7 +13,7 @@ obj-				:=3D
>>
>>  obj-y				+=3D init.o cpu.o
>>  obj-$(CONFIG_ARCH_USES_GETTIMEOFFSET)   +=3D time.o
>> -obj-$(CONFIG_S5P_HRT) 		+=3D s5p-time.o
>> +obj-$(CONFIG_SAMSUNG_HRT) 		+=3D samsung-time.o
>>
>>  obj-$(CONFIG_SAMSUNG_CLOCK)	+=3D clock.o
>>  obj-$(CONFIG_SAMSUNG_CLOCK)	+=3D pwm-clock.o
>> diff --git a/arch/arm/plat-samsung/include/plat/s5p-time.h
>> b/arch/arm/plat-samsung/include/plat/s5p-time.h deleted file mode 10=
0644
>> index 3a70aeb..0000000
>> --- a/arch/arm/plat-samsung/include/plat/s5p-time.h
>> +++ /dev/null
>> @@ -1,40 +0,0 @@
>> -/* linux/arch/arm/plat-samsung/include/plat/s5p-time.h
>> - *
>> - * Copyright 2011 Samsung Electronics Co., Ltd.
>> - *		http://www.samsung.com/
>> - *
>> - * Header file for s5p time support
>> - *
>> - * This program is free software; you can redistribute it and/or mo=
dify
>> - * it under the terms of the GNU General Public License version 2 a=
s
>> - * published by the Free Software Foundation.
>> -*/
>> -
>> -#ifndef __ASM_PLAT_S5P_TIME_H
>> -#define __ASM_PLAT_S5P_TIME_H __FILE__
>> -
>> -/* S5P HR-Timer Clock mode */
>> -enum s5p_timer_mode {
>> -	S5P_PWM0,
>> -	S5P_PWM1,
>> -	S5P_PWM2,
>> -	S5P_PWM3,
>> -	S5P_PWM4,
>> -};
>> -
>> -struct s5p_timer_source {
>> -	unsigned int event_id;
>> -	unsigned int source_id;
>> -};
>> -
>> -/* Be able to sleep for atleast 4 seconds (usually more) */
>> -#define S5PTIMER_MIN_RANGE	4
>> -
>> -#define TCNT_MAX		0xffffffff
>> -#define NON_PERIODIC		0
>> -#define PERIODIC		1
>> -
>> -extern void __init s5p_set_timer_source(enum s5p_timer_mode event,
>> -					enum s5p_timer_mode source);
>> -extern	struct sys_timer s5p_timer;
>> -#endif /* __ASM_PLAT_S5P_TIME_H */
>> diff --git a/arch/arm/plat-samsung/include/plat/samsung-time.h
>> b/arch/arm/plat-samsung/include/plat/samsung-time.h new file mode 10=
0644
>> index 0000000..9d6d622
>> --- /dev/null
>> +++ b/arch/arm/plat-samsung/include/plat/samsung-time.h
>> @@ -0,0 +1,40 @@
>> +/* linux/arch/arm/plat-samsung/include/plat/samsung-time.h
>> + *
>> + * Copyright 2011 Samsung Electronics Co., Ltd.
>> + *		http://www.samsung.com/
>> + *
>> + * Header file for samsung s3c and s5p time support
>> + *
>> + * This program is free software; you can redistribute it and/or mo=
dify
>> + * it under the terms of the GNU General Public License version 2 a=
s
>> + * published by the Free Software Foundation.
>> +*/
>> +
>> +#ifndef __ASM_PLAT_SAMSUNG_TIME_H
>> +#define __ASM_PLAT_SAMSUNG_TIME_H __FILE__
>> +
>> +/* SAMSUNG HR-Timer Clock mode */
>> +enum samsung_timer_mode {
>> +	SAMSUNG_PWM0,
>> +	SAMSUNG_PWM1,
>> +	SAMSUNG_PWM2,
>> +	SAMSUNG_PWM3,
>> +	SAMSUNG_PWM4,
>> +};
>> +
>> +struct samsung_timer_source {
>> +	unsigned int event_id;
>> +	unsigned int source_id;
>> +};
>> +
>> +/* Be able to sleep for atleast 4 seconds (usually more) */
>> +#define SAMSUNG_TIMER_MIN_RANGE	4
>> +
>> +#define TCNT_MAX		0xffffffff
>> +#define NON_PERIODIC		0
>> +#define PERIODIC		1
>> +
>> +extern void __init samsung_set_timer_source(enum samsung_timer_mode=
 event,
>> +					enum samsung_timer_mode source);
>> +extern	struct sys_timer samsung_timer;
>> +#endif /* __ASM_PLAT_SAMSUNG_TIME_H */
>> diff --git a/arch/arm/plat-samsung/s5p-time.c
>> b/arch/arm/plat-samsung/samsung-time.c similarity index 70%
>> rename from arch/arm/plat-samsung/s5p-time.c
>> rename to arch/arm/plat-samsung/samsung-time.c
>> index 028b6e8..91773bf 100644
>> --- a/arch/arm/plat-samsung/s5p-time.c
>> +++ b/arch/arm/plat-samsung/samsung-time.c
>> @@ -2,7 +2,7 @@
>>   * Copyright (c) 2011 Samsung Electronics Co., Ltd.
>>   *		http://www.samsung.com/
>>   *
>> - * S5P - Common hr-timer support
>> + * SAMSUNG - Common hr-timer support
>>   *
>>   * This program is free software; you can redistribute it and/or mo=
dify
>>   * it under the terms of the GNU General Public License version 2 a=
s
>> @@ -25,41 +25,41 @@
>>  #include <mach/map.h>
>>  #include <plat/devs.h>
>>  #include <plat/regs-timer.h>
>> -#include <plat/s5p-time.h>
>> +#include <plat/samsung-time.h>
>>
>>  static struct clk *tin_event;
>>  static struct clk *tin_source;
>>  static struct clk *tdiv_event;
>>  static struct clk *tdiv_source;
>>  static struct clk *timerclk;
>> -static struct s5p_timer_source timer_source;
>> +static struct samsung_timer_source timer_source;
>>  static unsigned long clock_count_per_tick;
>> -static void s5p_timer_resume(void);
>> +static void samsung_timer_resume(void);
>>
>> -static void s5p_time_stop(enum s5p_timer_mode mode)
>> +static void samsung_time_stop(enum samsung_timer_mode mode)
>>  {
>>  	unsigned long tcon;
>>
>>  	tcon =3D __raw_readl(S3C2410_TCON);
>>
>>  	switch (mode) {
>> -	case S5P_PWM0:
>> +	case SAMSUNG_PWM0:
>>  		tcon &=3D ~S3C2410_TCON_T0START;
>>  		break;
>>
>> -	case S5P_PWM1:
>> +	case SAMSUNG_PWM1:
>>  		tcon &=3D ~S3C2410_TCON_T1START;
>>  		break;
>>
>> -	case S5P_PWM2:
>> +	case SAMSUNG_PWM2:
>>  		tcon &=3D ~S3C2410_TCON_T2START;
>>  		break;
>>
>> -	case S5P_PWM3:
>> +	case SAMSUNG_PWM3:
>>  		tcon &=3D ~S3C2410_TCON_T3START;
>>  		break;
>>
>> -	case S5P_PWM4:
>> +	case SAMSUNG_PWM4:
>>  		tcon &=3D ~S3C2410_TCON_T4START;
>>  		break;
>>
>> @@ -70,7 +70,7 @@ static void s5p_time_stop(enum s5p_timer_mode mode=
)
>>  	__raw_writel(tcon, S3C2410_TCON);
>>  }
>>
>> -static void s5p_time_setup(enum s5p_timer_mode mode, unsigned long =
tcnt)
>> +static void samsung_time_setup(enum samsung_timer_mode mode, unsign=
ed long
>> tcnt) {
>>  	unsigned long tcon;
>>
>> @@ -79,27 +79,27 @@ static void s5p_time_setup(enum s5p_timer_mode m=
ode,
>> unsigned long tcnt) tcnt--;
>>
>>  	switch (mode) {
>> -	case S5P_PWM0:
>> +	case SAMSUNG_PWM0:
>>  		tcon &=3D ~(0x0f << 0);
>>  		tcon |=3D S3C2410_TCON_T0MANUALUPD;
>>  		break;
>>
>> -	case S5P_PWM1:
>> +	case SAMSUNG_PWM1:
>>  		tcon &=3D ~(0x0f << 8);
>>  		tcon |=3D S3C2410_TCON_T1MANUALUPD;
>>  		break;
>>
>> -	case S5P_PWM2:
>> +	case SAMSUNG_PWM2:
>>  		tcon &=3D ~(0x0f << 12);
>>  		tcon |=3D S3C2410_TCON_T2MANUALUPD;
>>  		break;
>>
>> -	case S5P_PWM3:
>> +	case SAMSUNG_PWM3:
>>  		tcon &=3D ~(0x0f << 16);
>>  		tcon |=3D S3C2410_TCON_T3MANUALUPD;
>>  		break;
>>
>> -	case S5P_PWM4:
>> +	case SAMSUNG_PWM4:
>>  		tcon &=3D ~(0x07 << 20);
>>  		tcon |=3D S3C2410_TCON_T4MANUALUPD;
>>  		break;
>> @@ -114,14 +114,14 @@ static void s5p_time_setup(enum s5p_timer_mode=
 mode,
>> unsigned long tcnt) __raw_writel(tcon, S3C2410_TCON);
>>  }
>>
>> -static void s5p_time_start(enum s5p_timer_mode mode, bool periodic)
>> +static void samsung_time_start(enum samsung_timer_mode mode, bool
>> periodic) {
>>  	unsigned long tcon;
>>
>>  	tcon  =3D __raw_readl(S3C2410_TCON);
>>
>>  	switch (mode) {
>> -	case S5P_PWM0:
>> +	case SAMSUNG_PWM0:
>>  		tcon |=3D S3C2410_TCON_T0START;
>>  		tcon &=3D ~S3C2410_TCON_T0MANUALUPD;
>>
>> @@ -131,7 +131,7 @@ static void s5p_time_start(enum s5p_timer_mode m=
ode,
>> bool periodic) tcon &=3D ~S3C2410_TCON_T0RELOAD;
>>  		break;
>>
>> -	case S5P_PWM1:
>> +	case SAMSUNG_PWM1:
>>  		tcon |=3D S3C2410_TCON_T1START;
>>  		tcon &=3D ~S3C2410_TCON_T1MANUALUPD;
>>
>> @@ -141,7 +141,7 @@ static void s5p_time_start(enum s5p_timer_mode m=
ode,
>> bool periodic) tcon &=3D ~S3C2410_TCON_T1RELOAD;
>>  		break;
>>
>> -	case S5P_PWM2:
>> +	case SAMSUNG_PWM2:
>>  		tcon |=3D S3C2410_TCON_T2START;
>>  		tcon &=3D ~S3C2410_TCON_T2MANUALUPD;
>>
>> @@ -151,7 +151,7 @@ static void s5p_time_start(enum s5p_timer_mode m=
ode,
>> bool periodic) tcon &=3D ~S3C2410_TCON_T2RELOAD;
>>  		break;
>>
>> -	case S5P_PWM3:
>> +	case SAMSUNG_PWM3:
>>  		tcon |=3D S3C2410_TCON_T3START;
>>  		tcon &=3D ~S3C2410_TCON_T3MANUALUPD;
>>
>> @@ -161,7 +161,7 @@ static void s5p_time_start(enum s5p_timer_mode m=
ode,
>> bool periodic) tcon &=3D ~S3C2410_TCON_T3RELOAD;
>>  		break;
>>
>> -	case S5P_PWM4:
>> +	case SAMSUNG_PWM4:
>>  		tcon |=3D S3C2410_TCON_T4START;
>>  		tcon &=3D ~S3C2410_TCON_T4MANUALUPD;
>>
>> @@ -178,24 +178,24 @@ static void s5p_time_start(enum s5p_timer_mode=
 mode,
>> bool periodic) __raw_writel(tcon, S3C2410_TCON);
>>  }
>>
>> -static int s5p_set_next_event(unsigned long cycles,
>> +static int samsung_set_next_event(unsigned long cycles,
>>  				struct clock_event_device *evt)
>>  {
>> -	s5p_time_setup(timer_source.event_id, cycles);
>> -	s5p_time_start(timer_source.event_id, NON_PERIODIC);
>> +	samsung_time_setup(timer_source.event_id, cycles);
>> +	samsung_time_start(timer_source.event_id, NON_PERIODIC);
>>
>>  	return 0;
>>  }
>>
>> -static void s5p_set_mode(enum clock_event_mode mode,
>> +static void samsung_set_mode(enum clock_event_mode mode,
>>  				struct clock_event_device *evt)
>>  {
>> -	s5p_time_stop(timer_source.event_id);
>> +	samsung_time_stop(timer_source.event_id);
>>
>>  	switch (mode) {
>>  	case CLOCK_EVT_MODE_PERIODIC:
>> -		s5p_time_setup(timer_source.event_id, clock_count_per_tick);
>> -		s5p_time_start(timer_source.event_id, PERIODIC);
>> +		samsung_time_setup(timer_source.event_id, clock_count_per_tick);
>> +		samsung_time_start(timer_source.event_id, PERIODIC);
>>  		break;
>>
>>  	case CLOCK_EVT_MODE_ONESHOT:
>> @@ -206,24 +206,24 @@ static void s5p_set_mode(enum clock_event_mode=
 mode,
>>  		break;
>>
>>  	case CLOCK_EVT_MODE_RESUME:
>> -		s5p_timer_resume();
>> +		samsung_timer_resume();
>>  		break;
>>  	}
>>  }
>>
>> -static void s5p_timer_resume(void)
>> +static void samsung_timer_resume(void)
>>  {
>>  	/* event timer restart */
>> -	s5p_time_setup(timer_source.event_id, clock_count_per_tick);
>> -	s5p_time_start(timer_source.event_id, PERIODIC);
>> +	samsung_time_setup(timer_source.event_id, clock_count_per_tick);
>> +	samsung_time_start(timer_source.event_id, PERIODIC);
>>
>>  	/* source timer restart */
>> -	s5p_time_setup(timer_source.source_id, TCNT_MAX);
>> -	s5p_time_start(timer_source.source_id, PERIODIC);
>> +	samsung_time_setup(timer_source.source_id, TCNT_MAX);
>> +	samsung_time_start(timer_source.source_id, PERIODIC);
>>  }
>>
>> -void __init s5p_set_timer_source(enum s5p_timer_mode event,
>> -				 enum s5p_timer_mode source)
>> +void __init samsung_set_timer_source(enum samsung_timer_mode event,
>> +				 enum samsung_timer_mode source)
>>  {
>>  	s3c_device_timer[event].dev.bus =3D &platform_bus_type;
>>  	s3c_device_timer[source].dev.bus =3D &platform_bus_type;
>> @@ -233,14 +233,14 @@ void __init s5p_set_timer_source(enum s5p_time=
r_mode
>> event, }
>>
>>  static struct clock_event_device time_event_device =3D {
>> -	.name		=3D "s5p_event_timer",
>> +	.name		=3D "samsung_event_timer",
>>  	.features	=3D CLOCK_EVT_FEAT_PERIODIC | CLOCK_EVT_FEAT_ONESHOT,
>>  	.rating		=3D 200,
>> -	.set_next_event	=3D s5p_set_next_event,
>> -	.set_mode	=3D s5p_set_mode,
>> +	.set_next_event	=3D samsung_set_next_event,
>> +	.set_mode	=3D samsung_set_mode,
>>  };
>>
>> -static irqreturn_t s5p_clock_event_isr(int irq, void *dev_id)
>> +static irqreturn_t samsung_clock_event_isr(int irq, void *dev_id)
>>  {
>>  	struct clock_event_device *evt =3D dev_id;
>>
>> @@ -249,14 +249,14 @@ static irqreturn_t s5p_clock_event_isr(int irq=
, void
>> *dev_id) return IRQ_HANDLED;
>>  }
>>
>> -static struct irqaction s5p_clock_event_irq =3D {
>> -	.name		=3D "s5p_time_irq",
>> +static struct irqaction samsung_clock_event_irq =3D {
>> +	.name		=3D "samsung_time_irq",
>>  	.flags		=3D IRQF_DISABLED | IRQF_TIMER | IRQF_IRQPOLL,
>> -	.handler	=3D s5p_clock_event_isr,
>> +	.handler	=3D samsung_clock_event_isr,
>>  	.dev_id		=3D &time_event_device,
>>  };
>>
>> -static void __init s5p_clockevent_init(void)
>> +static void __init samsung_clockevent_init(void)
>>  {
>>  	unsigned long pclk;
>>  	unsigned long clock_rate;
>> @@ -275,7 +275,7 @@ static void __init s5p_clockevent_init(void)
>>  	clock_count_per_tick =3D clock_rate / HZ;
>>
>>  	clockevents_calc_mult_shift(&time_event_device,
>> -				    clock_rate, S5PTIMER_MIN_RANGE);
>> +				    clock_rate, SAMSUNG_TIMER_MIN_RANGE);
>>  	time_event_device.max_delta_ns =3D
>>  		clockevent_delta2ns(-1, &time_event_device);
>>  	time_event_device.min_delta_ns =3D
>> @@ -285,22 +285,22 @@ static void __init s5p_clockevent_init(void)
>>  	clockevents_register_device(&time_event_device);
>>
>>  	irq_number =3D timer_source.event_id + IRQ_TIMER0;
>> -	setup_irq(irq_number, &s5p_clock_event_irq);
>> +	setup_irq(irq_number, &samsung_clock_event_irq);
>>  }
>>
>> -static void __iomem *s5p_timer_reg(void)
>> +static void __iomem *samsung_timer_reg(void)
>>  {
>>  	unsigned long offset =3D 0;
>>
>>  	switch (timer_source.source_id) {
>> -	case S5P_PWM0:
>> -	case S5P_PWM1:
>> -	case S5P_PWM2:
>> -	case S5P_PWM3:
>> +	case SAMSUNG_PWM0:
>> +	case SAMSUNG_PWM1:
>> +	case SAMSUNG_PWM2:
>> +	case SAMSUNG_PWM3:
>>  		offset =3D (timer_source.source_id * 0x0c) + 0x14;
>>  		break;
>>
>> -	case S5P_PWM4:
>> +	case SAMSUNG_PWM4:
>>  		offset =3D 0x40;
>>  		break;
>>
>> @@ -319,9 +319,9 @@ static void __iomem *s5p_timer_reg(void)
>>   * this wraps around for now, since it is just a relative time
>>   * stamp. (Inspired by U300 implementation.)
>>   */
>> -static u32 notrace s5p_read_sched_clock(void)
>> +static u32 notrace samsung_read_sched_clock(void)
>>  {
>> -	void __iomem *reg =3D s5p_timer_reg();
>> +	void __iomem *reg =3D samsung_timer_reg();
>>
>>  	if (!reg)
>>  		return 0;
>> @@ -329,7 +329,7 @@ static u32 notrace s5p_read_sched_clock(void)
>>  	return ~__raw_readl(reg);
>>  }
>>
>> -static void __init s5p_clocksource_init(void)
>> +static void __init samsung_clocksource_init(void)
>>  {
>>  	unsigned long pclk;
>>  	unsigned long clock_rate;
>> @@ -341,17 +341,17 @@ static void __init s5p_clocksource_init(void)
>>
>>  	clock_rate =3D clk_get_rate(tin_source);
>>
>> -	s5p_time_setup(timer_source.source_id, TCNT_MAX);
>> -	s5p_time_start(timer_source.source_id, PERIODIC);
>> +	samsung_time_setup(timer_source.source_id, TCNT_MAX);
>> +	samsung_time_start(timer_source.source_id, PERIODIC);
>>
>> -	setup_sched_clock(s5p_read_sched_clock, 32, clock_rate);
>> +	setup_sched_clock(samsung_read_sched_clock, 32, clock_rate);
>>
>> -	if (clocksource_mmio_init(s5p_timer_reg(), "s5p_clocksource_timer"=
,
>> +	if (clocksource_mmio_init(samsung_timer_reg(),
>> "samsung_clocksource_timer", clock_rate, 250, 32,
>> clocksource_mmio_readl_down))
>> -		panic("s5p_clocksource_timer: can't register clocksource\n");
>> +		panic("samsung_clocksource_timer: can't register clocksource\n");
>>  }
>>
>> -static void __init s5p_timer_resources(void)
>> +static void __init samsung_timer_resources(void)
>>  {
>>
>>  	unsigned long event_id =3D timer_source.event_id;
>> @@ -393,13 +393,13 @@ static void __init s5p_timer_resources(void)
>>  	clk_enable(tin_source);
>>  }
>>
>> -static void __init s5p_timer_init(void)
>> +static void __init samsung_timer_init(void)
>>  {
>> -	s5p_timer_resources();
>> -	s5p_clockevent_init();
>> -	s5p_clocksource_init();
>> +	samsung_timer_resources();
>> +	samsung_clockevent_init();
>> +	samsung_clocksource_init();
>>  }
>>
>> -struct sys_timer s5p_timer =3D {
>> -	.init		=3D s5p_timer_init,
>> +struct sys_timer samsung_timer =3D {
>> +	.init		=3D samsung_timer_init,
>>  };
>=20
