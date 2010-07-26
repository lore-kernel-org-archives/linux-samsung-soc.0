From: MyungJoo Ham <myungjoo.ham@samsung.com>
Subject: Re: [PATCH v4 7/7] ARM: S5PV210: Initial CPUFREQ Support
Date: Mon, 26 Jul 2010 15:15:50 +0900
Message-ID: <AANLkTikSTOwoKe9j070oR4mR7qJjSLQ7oWQnutFzUJZo@mail.gmail.com>
References: <1279790573-24179-1-git-send-email-myungjoo.ham@samsung.com>
	<1279790573-24179-2-git-send-email-myungjoo.ham@samsung.com>
	<1279790573-24179-3-git-send-email-myungjoo.ham@samsung.com>
	<1279790573-24179-4-git-send-email-myungjoo.ham@samsung.com>
	<1279790573-24179-5-git-send-email-myungjoo.ham@samsung.com>
	<1279790573-24179-6-git-send-email-myungjoo.ham@samsung.com>
	<1279790573-24179-7-git-send-email-myungjoo.ham@samsung.com>
	<1279790573-24179-8-git-send-email-myungjoo.ham@samsung.com>
	<008301cb2c7e$ad2ed4a0$078c7de0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:65063 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753275Ab0GZGPv convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 26 Jul 2010 02:15:51 -0400
Received: by iwn7 with SMTP id 7so2555325iwn.19
        for <linux-samsung-soc@vger.kernel.org>; Sun, 25 Jul 2010 23:15:51 -0700 (PDT)
In-Reply-To: <008301cb2c7e$ad2ed4a0$078c7de0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kyungmin.park@samsung.com, ben-linux@fluff.org

On Mon, Jul 26, 2010 at 1:54 PM, Kukjin Kim <kgene.kim@samsung.com> wro=
te:
> MyungJoo Ham wrote:
>>
>> S5PV210 CPUFREQ Support.
>>
>> This CPUFREQ may work without PMIC's DVS support. However, it is not
>> as effective without DVS support as supposed. AVS is not supported i=
n
>> this version.
>>
>> Note that CLK_SRC of some clocks including ARMCLK, G3D, G2D, MFC,
>> and ONEDRAM are modified directly without updating clksrc_src
>> representations of the clocks. =C2=A0Because CPUFREQ reverts the CLK=
_SRC
>> to the supposed values, this does not affect the consistency as long=
 as
>> there are no other modules that modifies clock sources of ARMCLK, G3=
D,
>> G2D, MFC, and ONEDRAM (and only CPUFREQ should have the control). As
>> soon as clock framework is settled, we may update source clocks
>> (.parent field) of those clocks accordingly later.
>>
>> Signed-off-by: MyungJoo Ham <myungjoo.ham@samsung.com>
>> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
>
> Hi MyungJoo,

Hello,

>
>> --
>> v2:
>> =C2=A0 =C2=A0 =C2=A0 - Ramp-up delay is removed. (let regulator fram=
ework do the job)
>> =C2=A0 =C2=A0 =C2=A0 - Provide proper max values for regulator_set_v=
oltage
>> =C2=A0 =C2=A0 =C2=A0 - Removed unneccesary #ifdef's.
>> =C2=A0 =C2=A0 =C2=A0 - Removed unnecessary initialiser for CLK_OUT
>> v3:
>> =C2=A0 =C2=A0 =C2=A0 - Style corrections (pr_info/pr_err, ...)
>> =C2=A0 =C2=A0 =C2=A0 - Revised dvs_conf struct
>> v4:
>> =C2=A0 =C2=A0 =C2=A0 - Renamed cpufreq-s5pv210.c -> cpufreq.c
>> =C2=A0 =C2=A0 =C2=A0 - Style corrections (less #ifdef's, comments)
>> =C2=A0 =C2=A0 =C2=A0 - Removed unncessary codes
>> =C2=A0 =C2=A0 =C2=A0 - Remove #ifdef for WORKAROUND, use s5pv210_wor=
karound()
>> =C2=A0 =C2=A0 =C2=A0 - Renamed some static variables (get rid of s5p=
v210 prefix)
>> =C2=A0 =C2=A0 =C2=A0 - Added machine dependency to Kconfig/Makefile
>> =C2=A0 =C2=A0 =C2=A0 - DMC0, DMC1 refresh counter is not updated by =
a hardcoded value,
> but
>> =C2=A0 =C2=A0 =C2=A0 with the value given as the default and relativ=
e clock speeds.
> Besides,
>> =C2=A0 =C2=A0 =C2=A0 the algorithm to update DMC0/1 refresh counter =
is reformed.
>>
>> ---
>> =C2=A0arch/arm/Kconfig =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=
=A01 +
>> =C2=A0arch/arm/mach-s5pv210/Kconfig =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A05 +
>> =C2=A0arch/arm/mach-s5pv210/Makefile =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A02 +
>> =C2=A0arch/arm/mach-s5pv210/cpufreq.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | =C2=A0783
>> +++++++++++++++++++++++++
>> =C2=A0arch/arm/mach-s5pv210/include/mach/cpu-freq.h | =C2=A0 40 ++
>> =C2=A05 files changed, 831 insertions(+), 0 deletions(-)
>> =C2=A0create mode 100644 arch/arm/mach-s5pv210/cpufreq.c
>> =C2=A0create mode 100644 arch/arm/mach-s5pv210/include/mach/cpu-freq=
=2Eh
>>
>> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
>> index 98922f7..d5a5916 100644
>> --- a/arch/arm/Kconfig
>> +++ b/arch/arm/Kconfig
>> @@ -701,6 +701,7 @@ config ARCH_S5PV210
>> =C2=A0 =C2=A0 =C2=A0 select HAVE_CLK
>> =C2=A0 =C2=A0 =C2=A0 select ARM_L1_CACHE_SHIFT_6
>> =C2=A0 =C2=A0 =C2=A0 select ARCH_USES_GETTIMEOFFSET
>> + =C2=A0 =C2=A0 select ARCH_HAS_CPUFREQ
>> =C2=A0 =C2=A0 =C2=A0 help
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 Samsung S5PV210/S5PC110 series based sys=
tems
>>
>> diff --git a/arch/arm/mach-s5pv210/Kconfig b/arch/arm/mach-s5pv210/K=
config
>> index 631019a..1c6d3bc 100644
>> --- a/arch/arm/mach-s5pv210/Kconfig
>> +++ b/arch/arm/mach-s5pv210/Kconfig
>> @@ -14,6 +14,7 @@ config CPU_S5PV210
>> =C2=A0 =C2=A0 =C2=A0 select PLAT_S5P
>> =C2=A0 =C2=A0 =C2=A0 select S3C_PL330_DMA
>> =C2=A0 =C2=A0 =C2=A0 select S5P_EXT_INT
>> + =C2=A0 =C2=A0 select S5PV210_CPU_FREQ if CPU_FREQ
>> =C2=A0 =C2=A0 =C2=A0 help
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 Enable S5PV210 CPU support
>>
>> @@ -101,4 +102,8 @@ config MACH_SMDKC110
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 Machine support for Samsung SMDKC110
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 S5PC110(MCP) is one of package option of=
 S5PV210
>>
>> +config S5PV210_CPU_FREQ
>> + =C2=A0 =C2=A0 bool "S5PV210 CPU-FREQ Support"
>> + =C2=A0 =C2=A0 depends on CPU_S5PV210 && CPU_FREQ
>> +
>> =C2=A0endif
>> diff --git a/arch/arm/mach-s5pv210/Makefile
> b/arch/arm/mach-s5pv210/Makefile
>> index aae592a..72ca5ec 100644
>> --- a/arch/arm/mach-s5pv210/Makefile
>> +++ b/arch/arm/mach-s5pv210/Makefile
>> @@ -34,3 +34,5 @@ obj-$(CONFIG_S5PV210_SETUP_I2C2) =C2=A0 =C2=A0+=3D=
 setup-i2c2.o
>> =C2=A0obj-$(CONFIG_S5PV210_SETUP_KEYPAD) =C2=A0 +=3D setup-keypad.o
>> =C2=A0obj-$(CONFIG_S5PV210_SETUP_SDHCI) =C2=A0 =C2=A0 =C2=A0 +=3D se=
tup-sdhci.o
>> =C2=A0obj-$(CONFIG_S5PV210_SETUP_SDHCI_GPIO) =C2=A0 =C2=A0 =C2=A0 +=3D=
 setup-sdhci-gpio.o
>> +
>> +obj-$(CONFIG_S5PV210_CPU_FREQ) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 +=3D cpufreq.o
>> diff --git a/arch/arm/mach-s5pv210/cpufreq.c
> b/arch/arm/mach-s5pv210/cpufreq.c
>> new file mode 100644
>> index 0000000..8ea1ce8
>> --- /dev/null
>> +++ b/arch/arm/mach-s5pv210/cpufreq.c
>> @@ -0,0 +1,783 @@
>> +/* =C2=A0linux/arch/arm/mach-s5pv210/cpufreq.c
>> + *
>> + * =C2=A0Copyright (C) 2010 Samsung Electronics Co., Ltd.
>> + *
>> + * =C2=A0CPU frequency scaling for S5PV210/S5PC110
>> + * =C2=A0Based on cpu-sa1110.c and s5pc11x-cpufreq.c
>> + *
>> + * This program is free software; you can redistribute it and/or mo=
dify
>> + * it under the terms of the GNU General Public License version 2 a=
s
>> + * published by the Free Software Foundation.
>> + */
>> +
>> +#include <linux/types.h>
>> +#include <linux/kernel.h>
>> +#include <linux/sched.h>
>> +#include <linux/delay.h>
>> +#include <linux/init.h>
>> +#include <linux/err.h>
>> +#include <linux/clk.h>
>> +#include <linux/io.h>
>> +#include <linux/regulator/consumer.h>
>> +#include <linux/gpio.h>
>> +#include <asm/system.h>
>> +
>> +#include <mach/hardware.h>
>> +#include <mach/map.h>
>> +#include <mach/regs-clock.h>
>> +#include <mach/regs-gpio.h>
>> +#include <mach/cpu-freq.h>
>> +
>> +#include <plat/cpu-freq.h>
>> +#include <plat/pll.h>
>> +#include <plat/clock.h>
>> +#include <plat/gpio-cfg.h>
>> +#include <plat/regs-fb.h>
>> +#ifdef CONFIG_PM
>> +#include <plat/pm.h>
>> +#endif
>> +
>> +static struct clk *mpu_clk;
>> +static struct regulator *arm_regulator;
>> +static struct regulator *internal_regulator;
>> +
>> +struct s3c_cpufreq_freqs s3c_freqs;
>> +
>> +static unsigned long previous_arm_volt;
>> +
>> +static unsigned int backup_dmc0_reg;
>> +static unsigned int backup_dmc1_reg;
>> +static unsigned int backup_freq_level;
>> +static unsigned int mpll_freq; /* in MHz */
>> +static unsigned int apll_freq_max; /* in MHz */
>> +
>> +/* frequency */
>> +static struct cpufreq_frequency_table freq_table[] =3D {
>> + =C2=A0 =C2=A0 {L0, 1000*1000},
>> + =C2=A0 =C2=A0 {L1, 800*1000},
>> + =C2=A0 =C2=A0 {L2, 400*1000},
>> + =C2=A0 =C2=A0 {L3, 200*1000},
>> + =C2=A0 =C2=A0 {L4, 100*1000},
>> + =C2=A0 =C2=A0 {0, CPUFREQ_TABLE_END},
>> +};
>> +
>> +struct s5pv210_dvs_conf {
>> + =C2=A0 =C2=A0 unsigned long =C2=A0 =C2=A0 =C2=A0 arm_volt; =C2=A0 =
/* uV */
>> + =C2=A0 =C2=A0 unsigned long =C2=A0 =C2=A0 =C2=A0 int_volt; =C2=A0 =
/* uV */
>> +};
>> +
>> +const unsigned long arm_volt_max =3D 1350000;
>> +const unsigned long int_volt_max =3D 1250000;
>> +
>> +static struct s5pv210_dvs_conf dvs_conf_workaround[] =3D {
>
> Is this really workaround?
>
> This is just difference of voltage characteristic of CPU revision, no=
t
> workaround.

When the user manual (even when EVT1 was not released) says it's 1.2V
for 1GHz and later we use 1.3V for 1GHz for the stability, it only
looks as if we are doing workaround for the stability of EVT0. That's
why I'm putting that name on it. However, changing the name of this
variable is nothing, so, it can be done with the next revision.


>
>> + =C2=A0 =C2=A0 [L0] =3D {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .arm_volt =C2=A0 =3D 130=
0000,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .int_volt =C2=A0 =3D 120=
0000,
>> + =C2=A0 =C2=A0 },
>> + =C2=A0 =C2=A0 [L1] =3D {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .arm_volt =C2=A0 =3D 125=
0000,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .int_volt =C2=A0 =3D 120=
0000,
>> +
>> + =C2=A0 =C2=A0 },
>> + =C2=A0 =C2=A0 [L2] =3D {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .arm_volt =C2=A0 =3D 125=
0000,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .int_volt =C2=A0 =3D 120=
0000,
>> +
>> + =C2=A0 =C2=A0 },
>> + =C2=A0 =C2=A0 [L3] =3D {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .arm_volt =C2=A0 =3D 125=
0000,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .int_volt =C2=A0 =3D 120=
0000,
>> + =C2=A0 =C2=A0 },
>> + =C2=A0 =C2=A0 [L4] =3D {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .arm_volt =C2=A0 =3D 125=
0000,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .int_volt =C2=A0 =3D 120=
0000,
>> + =C2=A0 =C2=A0 },
>> +};
>> +static struct s5pv210_dvs_conf dvs_conf_default[] =3D {
>> + =C2=A0 =C2=A0 [L0] =3D {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .arm_volt =C2=A0 =3D 125=
0000,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .int_volt =C2=A0 =3D 110=
0000,
>> + =C2=A0 =C2=A0 },
>> + =C2=A0 =C2=A0 [L1] =3D {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .arm_volt =C2=A0 =3D 120=
0000,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .int_volt =C2=A0 =3D 110=
0000,
>> + =C2=A0 =C2=A0 },
>> + =C2=A0 =C2=A0 [L2] =3D {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .arm_volt =C2=A0 =3D 105=
0000,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .int_volt =C2=A0 =3D 110=
0000,
>> + =C2=A0 =C2=A0 },
>> + =C2=A0 =C2=A0 [L3] =3D {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .arm_volt =C2=A0 =3D 950=
000,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .int_volt =C2=A0 =3D 110=
0000,
>> + =C2=A0 =C2=A0 },
>> + =C2=A0 =C2=A0 [L4] =3D {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .arm_volt =C2=A0 =3D 950=
000,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .int_volt =C2=A0 =3D 100=
0000,
>> + =C2=A0 =C2=A0 },
>> +};
>> +static struct s5pv210_dvs_conf *dvs_conf =3D dvs_conf_default;
>> +
>> +static u32 clkdiv_val[5][11] =3D {
>> + =C2=A0 =C2=A0 /*{ APLL, A2M, HCLK_MSYS, PCLK_MSYS,
>> + =C2=A0 =C2=A0 =C2=A0* HCLK_DSYS, PCLK_DSYS, HCLK_PSYS, PCLK_PSYS, =
ONEDRAM,
>> + =C2=A0 =C2=A0 =C2=A0* MFC, G3D }
>> + =C2=A0 =C2=A0 =C2=A0*/
>> + =C2=A0 =C2=A0 /* L0 : [1000/200/200/100][166/83][133/66][200/200] =
*/
>> + =C2=A0 =C2=A0 {0, 4, 4, 1, 3, 1, 4, 1, 3, 0, 0},
>> + =C2=A0 =C2=A0 /* L1 : [800/200/200/100][166/83][133/66][200/200] *=
/
>> + =C2=A0 =C2=A0 {0, 3, 3, 1, 3, 1, 4, 1, 3, 0, 0},
>> + =C2=A0 =C2=A0 /* L2 : [400/200/200/100][166/83][133/66][200/200] *=
/
>> + =C2=A0 =C2=A0 {1, 3, 1, 1, 3, 1, 4, 1, 3, 0, 0},
>> + =C2=A0 =C2=A0 /* L3 : [200/200/200/100][166/83][133/66][200/200] *=
/
>> + =C2=A0 =C2=A0 {3, 3, 0, 1, 3, 1, 4, 1, 3, 0, 0},
>> + =C2=A0 =C2=A0 /* L4 : [100/100/100/100][83/83][66/66][100/100] */
>> + =C2=A0 =C2=A0 {7, 7, 0, 0, 7, 0, 9, 0, 7, 0, 0},
>> +};
>> +
>> +static struct s3c_freq clk_info[] =3D {
>> + =C2=A0 =C2=A0 [L0] =3D { =C2=A0 =C2=A0 =C2=A0 =C2=A0/* L0: 1GHz */
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .fclk =C2=A0 =C2=A0 =C2=A0=
 =3D 1000000,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .armclk =C2=A0 =C2=A0 =3D=
 1000000,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .hclk_tns =C2=A0 =3D 0,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .hclk =C2=A0 =C2=A0 =C2=A0=
 =3D 133000,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .pclk =C2=A0 =C2=A0 =C2=A0=
 =3D 66000,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .hclk_msys =C2=A0=3D 200=
000,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .pclk_msys =C2=A0=3D 100=
000,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .hclk_dsys =C2=A0=3D 166=
750,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .pclk_dsys =C2=A0=3D 833=
75,
>> + =C2=A0 =C2=A0 },
>> + =C2=A0 =C2=A0 [L1] =3D { =C2=A0 =C2=A0 =C2=A0 =C2=A0/* L1: 800MHz =
*/
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .fclk =C2=A0 =C2=A0 =C2=A0=
 =3D 800000,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .armclk =C2=A0 =C2=A0 =3D=
 800000,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .hclk_tns =C2=A0 =3D 0,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .hclk =C2=A0 =C2=A0 =C2=A0=
 =3D 133000,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .pclk =C2=A0 =C2=A0 =C2=A0=
 =3D 66000,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .hclk_msys =C2=A0=3D 200=
000,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .pclk_msys =C2=A0=3D 100=
000,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .hclk_dsys =C2=A0=3D 166=
750,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .pclk_dsys =C2=A0=3D 833=
75,
>> + =C2=A0 =C2=A0 },
>> + =C2=A0 =C2=A0 [L2] =3D { =C2=A0 =C2=A0 =C2=A0 =C2=A0/* L2: 400MHz =
*/
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .fclk =C2=A0 =C2=A0 =C2=A0=
 =3D 800000,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .armclk =C2=A0 =C2=A0 =3D=
 400000,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .hclk_tns =C2=A0 =3D 0,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .hclk =C2=A0 =C2=A0 =C2=A0=
 =3D 133000,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .pclk =C2=A0 =C2=A0 =C2=A0=
 =3D 66000,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .hclk_msys =C2=A0=3D 200=
000,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .pclk_msys =C2=A0=3D 100=
000,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .hclk_dsys =C2=A0=3D 166=
750,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .pclk_dsys =C2=A0=3D 833=
75,
>> + =C2=A0 =C2=A0 },
>> + =C2=A0 =C2=A0 [L3] =3D { =C2=A0 =C2=A0 =C2=A0 =C2=A0/* L3: 200MHz =
*/
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .fclk =C2=A0 =C2=A0 =C2=A0=
 =3D 800000,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .armclk =C2=A0 =C2=A0 =3D=
 200000,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .hclk_tns =C2=A0 =3D 0,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .hclk =C2=A0 =C2=A0 =C2=A0=
 =3D 133000,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .pclk =C2=A0 =C2=A0 =C2=A0=
 =3D 66000,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .hclk_msys =C2=A0=3D 200=
000,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .pclk_msys =C2=A0=3D 100=
000,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .hclk_dsys =C2=A0=3D 166=
750,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .pclk_dsys =C2=A0=3D 833=
75,
>> + =C2=A0 =C2=A0 },
>> + =C2=A0 =C2=A0 [L4] =3D { =C2=A0 =C2=A0 =C2=A0 =C2=A0/* L4: 100MHz =
*/
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .fclk =C2=A0 =C2=A0 =C2=A0=
 =3D 800000,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .armclk =C2=A0 =C2=A0 =3D=
 100000,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .hclk_tns =C2=A0 =3D 0,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .hclk =C2=A0 =C2=A0 =C2=A0=
 =3D 66000,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .pclk =C2=A0 =C2=A0 =C2=A0=
 =3D 66000,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .hclk_msys =C2=A0=3D 100=
000,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .pclk_msys =C2=A0=3D 100=
000,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .hclk_dsys =C2=A0=3D 833=
75,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .pclk_dsys =C2=A0=3D 833=
75,
>> + =C2=A0 =C2=A0 },
>> +};
>> +
>> +static int s5pv210_verify_speed(struct cpufreq_policy *policy)
>> +{
>> +
>
> No need empty line.

Yes.
>
>> + =C2=A0 =C2=A0 if (policy->cpu)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;
>> +
>> + =C2=A0 =C2=A0 return cpufreq_frequency_table_verify(policy, freq_t=
able);
>> +}
>> +
>> +static unsigned int s5pv210_getspeed(unsigned int cpu)
>> +{
>> + =C2=A0 =C2=A0 unsigned long rate;
>> +
>> + =C2=A0 =C2=A0 if (cpu)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;
>> +
>> + =C2=A0 =C2=A0 rate =3D clk_get_rate(mpu_clk) / 1000;
>> +
>> + =C2=A0 =C2=A0 return rate;
>> +}
>> +
>> +static void s5pv210_target_APLL2MPLL(unsigned int index,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int bus_speed_c=
hanging)
>> +{
>> + =C2=A0 =C2=A0 unsigned int reg;
>> +
>> + =C2=A0 =C2=A0 /*
>> + =C2=A0 =C2=A0 =C2=A0* 1. Temporarily change divider for MFC and G3=
D
>> + =C2=A0 =C2=A0 =C2=A0* SCLKA2M(200/1=3D200)->(200/4=3D50)MHz
>> + =C2=A0 =C2=A0 =C2=A0*/
>> + =C2=A0 =C2=A0 reg =3D __raw_readl(S5P_CLK_DIV2);
>> + =C2=A0 =C2=A0 reg &=3D ~(S5P_CLKDIV2_G3D_MASK | S5P_CLKDIV2_MFC_MA=
SK);
>> + =C2=A0 =C2=A0 reg |=3D (0x3 << S5P_CLKDIV2_G3D_SHIFT) |
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (0x3 << S5P_CLKDIV2_MFC_=
SHIFT);
>
> How about following for reducing redundant definition?
> reg |=3D (0x3 << 0) | (0x3 << 4); /* G3D_SHIFT, MFC_SHIFT */
>
> Actually, you used same method in below...
> + =C2=A0 =C2=A0 =C2=A0 } while (reg & ((1 << 16) | (1 << 17)));
>

We are accessing the same shift values with the same registers again
at another file (arch/arm/mach-s5pv210/clock.c). Isn't it normal to
use some name for such values? As long as we use the same names as in
clock.c (although clock.s is not patched to use names yet), they are
not defined "redundantly", aren't they?

>> + =C2=A0 =C2=A0 if (s5pv210_workaround()) {
>
> This is just from CPU revision...not workaround.

Yes, having no G2D is not "errata", but "feature not added". Do you
think a name such as "s5pv210_evt0_only" would fit? I think this name
would fit for both errata workaround code and feature-not-added.

>
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Early version do=
es NOT have G2D
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Do Nothing about=
 G2D.
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/
>> + =C2=A0 =C2=A0 } else {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg &=3D ~S5P_CLKDIV2_G2=
D_MASK;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg |=3D (0x2 << S5P_CLK=
DIV2_G2D_SHIFT);
>> + =C2=A0 =C2=A0 }
>> +
>> + =C2=A0 =C2=A0 __raw_writel(reg, S5P_CLK_DIV2);
>> +
>> + =C2=A0 =C2=A0 /* For MFC, G3D dividing */
>> + =C2=A0 =C2=A0 do {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D __raw_readl(S5P_=
CLK_DIV_STAT0);
>> + =C2=A0 =C2=A0 } while (reg & ((1 << 16) | (1 << 17)));
>
>> +
>> + =C2=A0 =C2=A0 /*
>> + =C2=A0 =C2=A0 =C2=A0* 2. Change SCLKA2M(200MHz) to SCLKMPLL in MFC=
_MUX, G3D MUX
>> + =C2=A0 =C2=A0 =C2=A0* (100/4=3D50)->(667/4=3D166)MHz
>> + =C2=A0 =C2=A0 =C2=A0*/
>> + =C2=A0 =C2=A0 reg =3D __raw_readl(S5P_CLK_SRC2);
>> + =C2=A0 =C2=A0 reg &=3D ~(S5P_CLKSRC2_G3D_MASK | S5P_CLKSRC2_MFC_MA=
SK);
>> + =C2=A0 =C2=A0 reg |=3D (0x1 << S5P_CLKSRC2_G3D_SHIFT) |
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (0x1 << S5P_CLKSRC2_MFC_=
SHIFT);
>
>
>> + =C2=A0 =C2=A0 if (s5pv210_workaround()) {
>
> This is not workaround...just CPU revision...
>
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Early version do=
es NOT have G2D
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Do Nothing about=
 G2D.
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/
>> + =C2=A0 =C2=A0 } else {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg &=3D ~S5P_CLKSRC2_G2=
D_MASK;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg |=3D (0x1 << S5P_CLK=
SRC2_G2D_SHIFT);
>> + =C2=A0 =C2=A0 }
>> + =C2=A0 =C2=A0 __raw_writel(reg, S5P_CLK_SRC2);
>> +
>> + =C2=A0 =C2=A0 do {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D __raw_readl(S5P_=
CLK_MUX_STAT1);
>> + =C2=A0 =C2=A0 } while (reg & ((1 << 7) | (1 << 3)));
>> +
>> + =C2=A0 =C2=A0 /* 3. msys: SCLKAPLL -> SCLKMPLL */
>> + =C2=A0 =C2=A0 reg =3D __raw_readl(S5P_CLK_SRC0);
>> + =C2=A0 =C2=A0 reg &=3D ~(S5P_CLKSRC0_MUX200_MASK);
>> + =C2=A0 =C2=A0 reg |=3D (0x1 << S5P_CLKSRC0_MUX200_SHIFT);
>> + =C2=A0 =C2=A0 __raw_writel(reg, S5P_CLK_SRC0);
>> +
>> + =C2=A0 =C2=A0 do {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D __raw_readl(S5P_=
CLK_MUX_STAT0);
>> + =C2=A0 =C2=A0 } while (reg & (0x1 << 18));
>> +}
>> +
>> +static void s5pv210_target_MPLL2APLL(unsigned int index,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int bus_speed_c=
hanging)
>> +{
>> + =C2=A0 =C2=A0 unsigned int reg;
>> +
>> + =C2=A0 =C2=A0 /*
>> + =C2=A0 =C2=A0 =C2=A0* 7. Set Lock time =3D 30us*24MHz =3D 02cf (EV=
T1)
>> + =C2=A0 =C2=A0 =C2=A0* WORKAROUND: Lock time =3D 300us*24Mhz =3D 72=
00(0x1c20)
>> + =C2=A0 =C2=A0 =C2=A0* Normal: =C2=A0 =C2=A0 Lock time =3D 30us*24M=
hz =3D 0x2cf
>> + =C2=A0 =C2=A0 =C2=A0*/
>> + =C2=A0 =C2=A0 if (s5pv210_workaround())
>
> Same....just EVT0...not workaround.
>
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __raw_writel(0x1c20, S5P=
_APLL_LOCK);
>> + =C2=A0 =C2=A0 else
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __raw_writel(0x2cf, S5P_=
APLL_LOCK);
>> +
>> + =C2=A0 =C2=A0 /*
>> + =C2=A0 =C2=A0 =C2=A0* 8. Turn on APLL
>> + =C2=A0 =C2=A0 =C2=A0* 8-1. Set PMS values
>> + =C2=A0 =C2=A0 =C2=A0* 8-3. Wait until the PLL is locked
>> + =C2=A0 =C2=A0 =C2=A0*/
>> + =C2=A0 =C2=A0 if (index =3D=3D L0)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* APLL FOUT becomes 100=
0 Mhz */
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __raw_writel(PLL45XX_APL=
L_VAL_1000, S5P_APLL_CON);
>> + =C2=A0 =C2=A0 else
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* APLL FOUT becomes 800=
 Mhz */
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __raw_writel(PLL45XX_APL=
L_VAL_800, S5P_APLL_CON);
>> +
>> + =C2=A0 =C2=A0 do {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D __raw_readl(S5P_=
APLL_CON);
>> + =C2=A0 =C2=A0 } while (!(reg & (0x1 << 29)));
>> +
>> + =C2=A0 =C2=A0 /*
>> + =C2=A0 =C2=A0 =C2=A0* 9. Change source clock from SCLKMPLL(667MHz)
>> + =C2=A0 =C2=A0 =C2=A0* to SCLKA2M(200MHz) in MFC_MUX and G3D_MUX
>> + =C2=A0 =C2=A0 =C2=A0* (667/4=3D166)->(200/4=3D50)MHz
>> + =C2=A0 =C2=A0 =C2=A0*/
>> + =C2=A0 =C2=A0 reg =3D __raw_readl(S5P_CLK_SRC2);
>> + =C2=A0 =C2=A0 reg &=3D ~(S5P_CLKSRC2_G3D_MASK | S5P_CLKSRC2_MFC_MA=
SK);
>> + =C2=A0 =C2=A0 reg |=3D (0 << S5P_CLKSRC2_G3D_SHIFT) | (0 <<
>> S5P_CLKSRC2_MFC_SHIFT);
>
>
>> + =C2=A0 =C2=A0 if (s5pv210_workaround()) {
>
> Same.
>
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Early version do=
es NOT have G2D
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Do Nothing about=
 G2D.
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/
>> + =C2=A0 =C2=A0 } else {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg &=3D ~S5P_CLKSRC2_G2=
D_MASK;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg |=3D 0x1 << S5P_CLKS=
RC2_G2D_SHIFT;
>> + =C2=A0 =C2=A0 }
>> + =C2=A0 =C2=A0 __raw_writel(reg, S5P_CLK_SRC2);
>> +
>> + =C2=A0 =C2=A0 do {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D __raw_readl(S5P_=
CLK_MUX_STAT1);
>> + =C2=A0 =C2=A0 } while (reg & ((1 << 7) | (1 << 3)));
>> +
>> + =C2=A0 =C2=A0 /*
>> + =C2=A0 =C2=A0 =C2=A0* 10. Change divider for MFC and G3D
>> + =C2=A0 =C2=A0 =C2=A0* (200/4=3D50)->(200/1=3D200)MHz
>> + =C2=A0 =C2=A0 =C2=A0*/
>> + =C2=A0 =C2=A0 reg =3D __raw_readl(S5P_CLK_DIV2);
>> + =C2=A0 =C2=A0 reg &=3D ~(S5P_CLKDIV2_G3D_MASK | S5P_CLKDIV2_MFC_MA=
SK);
>> + =C2=A0 =C2=A0 reg |=3D (clkdiv_val[index][10] << S5P_CLKDIV2_G3D_S=
HIFT) |
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (clkdiv_val[index][9] <<=
 S5P_CLKDIV2_MFC_SHIFT);
>
>
>> + =C2=A0 =C2=A0 if (s5pv210_workaround()) {
>
> Same.
>
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Early version do=
es NOT have G2D
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Do Nothing about=
 G2D.
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/
>> + =C2=A0 =C2=A0 } else {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg &=3D ~S5P_CLKDIV2_G2=
D_MASK;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg |=3D 0x2 << S5P_CLKD=
IV2_G2D_SHIFT;
>> + =C2=A0 =C2=A0 }
>> + =C2=A0 =C2=A0 __raw_writel(reg, S5P_CLK_DIV2);
>> +
>> + =C2=A0 =C2=A0 do {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D __raw_readl(S5P_=
CLK_DIV_STAT0);
>> + =C2=A0 =C2=A0 } while (reg & ((1 << 16) | (1 << 17)));
>> +
>> + =C2=A0 =C2=A0 /* 11. Change MPLL to APLL in MSYS_MUX */
>> + =C2=A0 =C2=A0 reg =3D __raw_readl(S5P_CLK_SRC0);
>> + =C2=A0 =C2=A0 reg &=3D ~(S5P_CLKSRC0_MUX200_MASK);
>> + =C2=A0 =C2=A0 reg |=3D (0x0 << S5P_CLKSRC0_MUX200_SHIFT); /* SCLKM=
PLL ->
>> SCLKAPLL =C2=A0 */
>> + =C2=A0 =C2=A0 __raw_writel(reg, S5P_CLK_SRC0);
>> +
>> + =C2=A0 =C2=A0 do {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D __raw_readl(S5P_=
CLK_MUX_STAT0);
>> + =C2=A0 =C2=A0 } while (reg & (0x1 << 18));
>> +}
>> +
>> +#ifdef CONFIG_PM
>> +static int no_cpufreq_access;
>> +/*
>> + * s5pv210_target: relation has an additional symantics other than
>> + * the standard
>> + * [0x30]:
>> + * =C2=A0 1: disable further access to target until being re-enable=
d.
>> + * =C2=A0 2: re-enable access to target */
>> +#endif
>> +static int s5pv210_target(struct cpufreq_policy *policy,
>
> s5pv210_target what?...


I will rename names including this and the following ones.

>
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int target_freq=
,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int relation)
>> +{
>> + =C2=A0 =C2=A0 static int initialized;
>> + =C2=A0 =C2=A0 int ret =3D 0;
>> + =C2=A0 =C2=A0 unsigned long arm_clk;
>> + =C2=A0 =C2=A0 unsigned int index, reg, arm_volt, int_volt;
>> + =C2=A0 =C2=A0 unsigned int pll_changing =3D 0;
>> + =C2=A0 =C2=A0 unsigned int bus_speed_changing =3D 0;
>> +
>> + =C2=A0 =C2=A0 cpufreq_debug_printk(CPUFREQ_DEBUG_DRIVER, KERN_INFO=
,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 "cpufreq: Entering for %dkHz\n", target_freq);
>> +#ifdef CONFIG_PM
>> + =C2=A0 =C2=A0 if ((relation & ENABLE_FURTHER_CPUFREQ) &&
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 (relation & DISABLE_FURTHER_CPUFREQ)) {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Invalidate both if bo=
th marked */
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 relation &=3D ~ENABLE_FU=
RTHER_CPUFREQ;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 relation &=3D ~DISABLE_F=
URTHER_CPUFREQ;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_err("%s:%d denied mar=
king \"FURTHER_CPUFREQ\""
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 " as both marked.\n",
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __FILE__, __LINE__);
>> + =C2=A0 =C2=A0 }
>> + =C2=A0 =C2=A0 if (relation & ENABLE_FURTHER_CPUFREQ)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 no_cpufreq_access =3D 0;
>> + =C2=A0 =C2=A0 if (no_cpufreq_access =3D=3D 1) {
>> +#ifdef CONFIG_PM_VERBOSE
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_err("%s:%d denied acc=
ess to %s as it is disabled"
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0" temporarily\n", __FILE__, __LINE__,
> __func__);
>> +#endif
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D -EINVAL;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;
>> + =C2=A0 =C2=A0 }
>> + =C2=A0 =C2=A0 if (relation & DISABLE_FURTHER_CPUFREQ)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 no_cpufreq_access =3D 1;
>> + =C2=A0 =C2=A0 relation &=3D ~MASK_FURTHER_CPUFREQ;
>> +#endif
>> +
>> + =C2=A0 =C2=A0 s3c_freqs.freqs.old =3D s5pv210_getspeed(0);
>> +
>> + =C2=A0 =C2=A0 if (cpufreq_frequency_table_target(policy, freq_tabl=
e,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_freq, relation, &index)) {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D -EINVAL;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;
>> + =C2=A0 =C2=A0 }
>> +
>> + =C2=A0 =C2=A0 arm_clk =3D freq_table[index].frequency;
>> +
>> + =C2=A0 =C2=A0 s3c_freqs.freqs.new =3D arm_clk;
>> + =C2=A0 =C2=A0 s3c_freqs.freqs.cpu =3D 0;
>> +
>> + =C2=A0 =C2=A0 /*
>> + =C2=A0 =C2=A0 =C2=A0* Run this function unconditionally until s3c_=
freqs.freqs.new
>> + =C2=A0 =C2=A0 =C2=A0* and s3c_freqs.freqs.old are both set by this=
 function.
>> + =C2=A0 =C2=A0 =C2=A0*/
>> + =C2=A0 =C2=A0 if (s3c_freqs.freqs.new =3D=3D s3c_freqs.freqs.old &=
&
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 initialized >=3D 2)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;
>> + =C2=A0 =C2=A0 else if (initialized < 2)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 initialized++;
>> +
>
> Where is initialization of 'initialized'?...

It's static. If we initialize it with 0, we get:

ERROR: do not initialise statics to 0 or NULL
#381: FILE: arm/mach-s5pv210/cpufreq.c:381:
+	static int initialized =3D 0;

total: 1 errors, 0 warnings, 783 lines checked

arch/arm/mach-s5pv210/cpufreq.c has style problems, please review.  If
any of these errors


>
>> + =C2=A0 =C2=A0 arm_volt =3D dvs_conf[index].arm_volt;
>> + =C2=A0 =C2=A0 int_volt =3D dvs_conf[index].int_volt;
>> +
>> + =C2=A0 =C2=A0 /* iNew clock information update */
>
> 'iNew clock'?
> Hmm...I found this typo in the S.LSI's original code :-(

uh oh.. we've got so many copy-pasted codes.. :(

>
>> + =C2=A0 =C2=A0 memcpy(&s3c_freqs.new, &clk_info[index],
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 sizeof(struct s3c_freq));
>> +
>> + =C2=A0 =C2=A0 if (s3c_freqs.freqs.new >=3D s3c_freqs.freqs.old) {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Voltage up code: incr=
ease ARM first */
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!IS_ERR_OR_NULL(arm_=
regulator) &&
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 !IS_ERR_OR_NULL(internal_regulator)) {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 regulator_set_voltage(arm_regulator,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 arm_volt, a=
rm_volt_max);
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 regulator_set_voltage(internal_regulator,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int_volt, i=
nt_volt_max);
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
>> + =C2=A0 =C2=A0 }
>> + =C2=A0 =C2=A0 cpufreq_notify_transition(&s3c_freqs.freqs, CPUFREQ_=
PRECHANGE);
>> +
>> + =C2=A0 =C2=A0 if (s3c_freqs.new.fclk !=3D s3c_freqs.old.fclk || in=
itialized < 2)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pll_changing =3D 1;
>> +
>> + =C2=A0 =C2=A0 if (s3c_freqs.new.hclk_msys !=3D s3c_freqs.old.hclk_=
msys ||
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 initialized < 2)
>
> Hmm...why need 'initialized' checking?

I did it (counting the initializing executions of "target" function)
in order to guarantee s3c_freqs.new and s3c_freqs.old values correctly
reflect the status of CPU clocks as soon as possible because we do
_not_ have the guarantee that the bootloader has given the right
values for the clock settings (as in clkdiv_val[]). With this
checking, we forcibly set the clock settings as in clkdiv_val even if
the frequency is not being effectively changed; it is called when
CPUFREQ is loaded. If we do not check this, clock settings related
with clkdiv_val[] won't be initialized by CPUFREQ until the frequency
is changed from the previous one and both s3c_freqs.new and
s3c_freqs.old should reflect the actual settings. However, a slight
modification will let it do this in one cycle and I can do it with the
next revision (making initialized < 2 --> initialized < 1).

>
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bus_speed_changing =3D 1=
;
>> +
>> + =C2=A0 =C2=A0 /*
>> + =C2=A0 =C2=A0 =C2=A0* If ONEDRAM(DMC0)'s clock is getting slower, =
DMC0's
>> + =C2=A0 =C2=A0 =C2=A0* refresh counter should decrease before slowi=
ng down
>> + =C2=A0 =C2=A0 =C2=A0* DMC0 clock. We assume that DMC0's source clo=
ck never
>> + =C2=A0 =C2=A0 =C2=A0* changes. This is a temporary setting for the=
 transition.
>> + =C2=A0 =C2=A0 =C2=A0* Stable setting is done at the end of this fu=
nction.
>> + =C2=A0 =C2=A0 =C2=A0*/
>
> Actually there are some S5PC110 MCP types which don't have ONEDRAM.
> ...so how can distinguish it? No need check it?

Is accessing DMC0's TIMINGAREF registers (0xF0000030) without the
existence of ONEDRAM problematic? In this patch, writing values of
DMC0 is based on the given (by bootloader) value of DMC0. It only sets
the refresh count of DMC0/DMC1. I'm not sure how the hardware would
work; however, I guess it would not be a problem if there exists no
corresponding ONEDRAM.

>
>> + =C2=A0 =C2=A0 reg =3D (__raw_readl(S5P_CLK_DIV6) & S5P_CLKDIV6_ONE=
DRAM_MASK)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >> S5P_CLKDIV6_ONEDRAM_S=
HIFT;
>> + =C2=A0 =C2=A0 if (clkdiv_val[index][8] > reg) {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D backup_dmc0_reg =
* (reg + 1) / (clkdiv_val[index][8] +
> 1);
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 WARN_ON(reg > 0xFFFF);
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg &=3D 0xFFFF;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __raw_writel(reg, S5P_VA=
_DMC0 + 0x30);
>> + =C2=A0 =C2=A0 }
>> +
>> + =C2=A0 =C2=A0 /*
>> + =C2=A0 =C2=A0 =C2=A0* If hclk_msys (for DMC1) is getting slower, D=
MC1's
>> + =C2=A0 =C2=A0 =C2=A0* refresh counter should decrease before slowi=
ng down
>> + =C2=A0 =C2=A0 =C2=A0* hclk_msys in order to get rid of glitches in=
 the
>> + =C2=A0 =C2=A0 =C2=A0* transition. This is temporary setting for th=
e transition.
>> + =C2=A0 =C2=A0 =C2=A0* Stable setting is done at the end of this fu=
nction.
>> + =C2=A0 =C2=A0 =C2=A0*
>> + =C2=A0 =C2=A0 =C2=A0* Besides, we need to consider the case when P=
LL speed changes,
>> + =C2=A0 =C2=A0 =C2=A0* where the DMC1's source clock hclk_msys is c=
hanged from ARMCLK
>> + =C2=A0 =C2=A0 =C2=A0* to MPLL temporarily. DMC1 needs to be ready =
for this
>> + =C2=A0 =C2=A0 =C2=A0* transition as well.
>> + =C2=A0 =C2=A0 =C2=A0*/
>> + =C2=A0 =C2=A0 if (s3c_freqs.new.hclk_msys < s3c_freqs.old.hclk_msy=
s) {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* hclk_msys is up =
to 12bit. (200000)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* reg is 16bit. so=
 no overflow, yet.
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* May need to use =
div64.h later with larger hclk_msys or
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* DMCx refresh cou=
nter. But, we have bugs in do_div and
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* that should be f=
ixed before.
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D backup_dmc1_reg =
* s3c_freqs.new.hclk_msys;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg /=3D clk_info[backup=
_freq_level].hclk_msys;
>> +
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* When ARM_CLK is =
absed on APLL->MPLL,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* hclk_msys become=
s hclk_msys *=3D MPLL/APLL;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Based on the wor=
st case scenario, we use MPLL/APLL_MAX
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* assuming that MP=
LL clock speed does not change.
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Multiplied first=
 in order to reduce rounding error.
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* because reg has =
15b length, using 64b should be enough to
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* prevent overflow=
=2E
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (pll_changing) {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 reg *=3D mpll_freq;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 reg /=3D apll_freq_max;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 WARN_ON(reg > 0xFFFF);
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __raw_writel(reg & 0xFFF=
=46, S5P_VA_DMC1 + 0x30);
>> + =C2=A0 =C2=A0 }
>> +
>> + =C2=A0 =C2=A0 /*
>> + =C2=A0 =C2=A0 =C2=A0* APLL should be changed in this level
>> + =C2=A0 =C2=A0 =C2=A0* APLL -> MPLL(for stable transition) -> APLL
>> + =C2=A0 =C2=A0 =C2=A0* Some clock source's clock API =C2=A0are not =
prepared. Do not use clock
>> API
>> + =C2=A0 =C2=A0 =C2=A0* in below code.
>> + =C2=A0 =C2=A0 =C2=A0*/
>> + =C2=A0 =C2=A0 if (pll_changing)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s5pv210_target_APLL2MPLL=
(index, bus_speed_changing);
>> +
>> + =C2=A0 =C2=A0 /* ARM MCS value changed */
>> + =C2=A0 =C2=A0 if (index !=3D L4) {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D __raw_readl(S5P_=
ARM_MCS_CON);
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg &=3D ~0x3;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg |=3D 0x1;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __raw_writel(reg, S5P_AR=
M_MCS_CON);
>> + =C2=A0 =C2=A0 }
>> +
>> + =C2=A0 =C2=A0 reg =3D __raw_readl(S5P_CLK_DIV0);
>> +
>> + =C2=A0 =C2=A0 reg &=3D ~(S5P_CLKDIV0_APLL_MASK | S5P_CLKDIV0_A2M_M=
ASK
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | S5P_CLKDIV0_HCLK200_MASK |
>> S5P_CLKDIV0_PCLK100_MASK
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | S5P_CLKDIV0_HCLK166_MASK |
>> S5P_CLKDIV0_PCLK83_MASK
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | S5P_CLKDIV0_HCLK133_MASK |
>> S5P_CLKDIV0_PCLK66_MASK);
>> +
>> + =C2=A0 =C2=A0 reg |=3D ((clkdiv_val[index][0]<<S5P_CLKDIV0_APLL_SH=
IFT)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | (clkdiv_val[index][1] << S5P_CLKDIV0_A2M_SHIFT)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | (clkdiv_val[index][2] <<
>> S5P_CLKDIV0_HCLK200_SHIFT)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | (clkdiv_val[index][3] <<
>> S5P_CLKDIV0_PCLK100_SHIFT)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | (clkdiv_val[index][4] <<
>> S5P_CLKDIV0_HCLK166_SHIFT)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | (clkdiv_val[index][5] << S5P_CLKDIV0_PCLK83_SHIFT)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | (clkdiv_val[index][6] <<
>> S5P_CLKDIV0_HCLK133_SHIFT)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | (clkdiv_val[index][7] <<
>> S5P_CLKDIV0_PCLK66_SHIFT));
>> +
>> + =C2=A0 =C2=A0 __raw_writel(reg, S5P_CLK_DIV0);
>> +
>> + =C2=A0 =C2=A0 do {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D __raw_readl(S5P_=
CLK_DIV_STAT0);
>> + =C2=A0 =C2=A0 } while (reg & 0xff);
>> +
>> + =C2=A0 =C2=A0 /* ARM MCS value changed */
>> + =C2=A0 =C2=A0 if (index =3D=3D L4) {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D __raw_readl(S5P_=
ARM_MCS_CON);
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg &=3D ~0x3;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg |=3D 0x3;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __raw_writel(reg, S5P_AR=
M_MCS_CON);
>> + =C2=A0 =C2=A0 }
>> +
>> + =C2=A0 =C2=A0 if (pll_changing)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s5pv210_target_MPLL2APLL=
(index, bus_speed_changing);
>> +
>> + =C2=A0 =C2=A0 /*
>> + =C2=A0 =C2=A0 =C2=A0* Adjust DMC0 refresh ratio according to the r=
ate of DMC0
>> + =C2=A0 =C2=A0 =C2=A0* The DIV value of DMC0 clock changes and SRC =
value is not
> controlled.
>> + =C2=A0 =C2=A0 =C2=A0* We assume that no one changes SRC value of D=
MC0 clock, either.
>> + =C2=A0 =C2=A0 =C2=A0*/
>> + =C2=A0 =C2=A0 reg =3D __raw_readl(S5P_CLK_DIV6);
>> + =C2=A0 =C2=A0 reg &=3D ~S5P_CLKDIV6_ONEDRAM_MASK;
>> + =C2=A0 =C2=A0 reg |=3D (clkdiv_val[index][8] << S5P_CLKDIV6_ONEDRA=
M_SHIFT);
>> + =C2=A0 =C2=A0 /* ONEDRAM(DMC0) Clock Divider Ratio: 7+1 for L4, 3+=
1 for Others */
>> + =C2=A0 =C2=A0 __raw_writel(reg, S5P_CLK_DIV6);
>> + =C2=A0 =C2=A0 do {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D __raw_readl(S5P_=
CLK_DIV_STAT1);
>> + =C2=A0 =C2=A0 } while (reg & (1 << 15));
>> +
>> + =C2=A0 =C2=A0 /*
>> + =C2=A0 =C2=A0 =C2=A0* If DMC0 clock gets slower (by orginal clock =
speed / n),
>> + =C2=A0 =C2=A0 =C2=A0* then, the refresh rate should decrease
>> + =C2=A0 =C2=A0 =C2=A0* (by original refresh count / n) (n: divider)
>> + =C2=A0 =C2=A0 =C2=A0*/
>> + =C2=A0 =C2=A0 reg =3D backup_dmc0_reg * (clkdiv_val[backup_freq_le=
vel][8] + 1)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 / (clkdiv_val[index][8] =
+ 1);
>> + =C2=A0 =C2=A0 __raw_writel(reg & 0xFFFF, S5P_VA_DMC0 + 0x30);
>> +
>> + =C2=A0 =C2=A0 /*
>> + =C2=A0 =C2=A0 =C2=A0* Adjust DMC1 refresh ratio according to the r=
ate of hclk_msys
>> + =C2=A0 =C2=A0 =C2=A0* (L0~L3: 200 <-> L4: 100)
>> + =C2=A0 =C2=A0 =C2=A0* If DMC1 clock gets slower (by original clock=
 speed * n),
>> + =C2=A0 =C2=A0 =C2=A0* then, the refresh rate should decrease
>> + =C2=A0 =C2=A0 =C2=A0* (by original refresh count * n) (n : clock r=
ate)
>> + =C2=A0 =C2=A0 =C2=A0*/
>> + =C2=A0 =C2=A0 reg =3D backup_dmc1_reg * clk_info[index].hclk_msys;
>> + =C2=A0 =C2=A0 reg /=3D clk_info[backup_freq_level].hclk_msys;
>> + =C2=A0 =C2=A0 __raw_writel(reg & 0xFFFF, S5P_VA_DMC1 + 0x30);
>> +
>> + =C2=A0 =C2=A0 if (s3c_freqs.freqs.new < s3c_freqs.freqs.old) {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Voltage down: decreas=
e INT first.*/
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!IS_ERR_OR_NULL(arm_=
regulator) &&
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 !IS_ERR_OR_NULL(internal_regulator)) {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 regulator_set_voltage(internal_regulator,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int_volt, i=
nt_volt_max);
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 regulator_set_voltage(arm_regulator,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 arm_volt, a=
rm_volt_max);
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
>> + =C2=A0 =C2=A0 }
>> + =C2=A0 =C2=A0 cpufreq_notify_transition(&s3c_freqs.freqs, CPUFREQ_=
POSTCHANGE);
>> +
>> + =C2=A0 =C2=A0 memcpy(&s3c_freqs.old, &s3c_freqs.new, sizeof(struct=
 s3c_freq));
>> + =C2=A0 =C2=A0 cpufreq_debug_printk(CPUFREQ_DEBUG_DRIVER, KERN_INFO=
,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 "cpufreq: Performance changed[L%d]\n", index);
>> + =C2=A0 =C2=A0 previous_arm_volt =3D dvs_conf[index].arm_volt;
>> +out:
>> + =C2=A0 =C2=A0 return ret;
>> +}
>> +
>> +#ifdef CONFIG_PM
>> +static int previous_frequency;
>> +
>> +static int s5pv210_cpufreq_suspend(struct cpufreq_policy *policy,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pm_message_t pmsg)
>> +{
>> + =C2=A0 =C2=A0 int ret =3D 0;
>> + =C2=A0 =C2=A0 pr_info("cpufreq: Entering suspend.\n");
>> +
>> + =C2=A0 =C2=A0 previous_frequency =3D cpufreq_get(0);
>> + =C2=A0 =C2=A0 ret =3D __cpufreq_driver_target(cpufreq_cpu_get(0), =
SLEEP_FREQ,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 DISABLE_FURTHER_CPUFREQ);
>> + =C2=A0 =C2=A0 return ret;
>> +}
>> +
>> +static int s5pv210_cpufreq_resume(struct cpufreq_policy *policy)
>> +{
>> + =C2=A0 =C2=A0 int ret =3D 0;
>> + =C2=A0 =C2=A0 u32 rate;
>> + =C2=A0 =C2=A0 int level =3D CPUFREQ_TABLE_END;
>> + =C2=A0 =C2=A0 int i;
>
> Should be 'int i =3D 0;' for removing below 'i =3D 0;'

Ok. will do.


>
>> +
>> + =C2=A0 =C2=A0 pr_info("cpufreq: Waking up from a suspend.\n");
>> +
>> + =C2=A0 =C2=A0 __cpufreq_driver_target(cpufreq_cpu_get(0), previous=
_frequency,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ENABLE_FURTHER_CPUFREQ);
>> +
>> + =C2=A0 =C2=A0 /* Clock information update with wakeup value */
>> + =C2=A0 =C2=A0 rate =3D clk_get_rate(mpu_clk);
>> +
>> + =C2=A0 =C2=A0 i =3D 0;
>
> ...
>
>> + =C2=A0 =C2=A0 while (freq_table[i].frequency !=3D CPUFREQ_TABLE_EN=
D) {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (freq_table[i].freque=
ncy * 1000 =3D=3D rate) {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 level =3D freq_table[i].index;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 break;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i++;
>> + =C2=A0 =C2=A0 }
>> +
>> + =C2=A0 =C2=A0 if (level =3D=3D CPUFREQ_TABLE_END) { /* Not found *=
/
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_err("[%s:%d] clock sp=
eed does not match: "
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "%d. Using L1 of 800MHz.\n",
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __FILE__, __LINE__, rate);
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 level =3D L1;
>> + =C2=A0 =C2=A0 }
>> +
>> + =C2=A0 =C2=A0 memcpy(&s3c_freqs.old, &clk_info[level],
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 sizeof(struct s3c_freq));
>> + =C2=A0 =C2=A0 previous_arm_volt =3D dvs_conf[level].arm_volt;
>> + =C2=A0 =C2=A0 return ret;
>> +}
>> +#endif
>> +
>> +static int __init s5pv210_cpu_init(struct cpufreq_policy *policy)
>
> s5pv210_cpu_init?...is this function cpu initialization?..No!
> hmm...s5pv210_cpufreq_init() is better...but used at below...
>
> ...need another name for easily reading

sure.

>
>> +{
>> + =C2=A0 =C2=A0 u32 rate ;
>> + =C2=A0 =C2=A0 int i, level =3D CPUFREQ_TABLE_END;
>> + =C2=A0 =C2=A0 struct clk *mpll_clk;
>> +
>> + =C2=A0 =C2=A0 pr_info("S5PV210 CPUFREQ Initialising...\n");
>> +#ifdef CONFIG_PM
>> + =C2=A0 =C2=A0 no_cpufreq_access =3D 0;
>> +#endif
>> + =C2=A0 =C2=A0 mpu_clk =3D clk_get(NULL, "armclk");
>> + =C2=A0 =C2=A0 if (IS_ERR(mpu_clk)) {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_err("S5PV210 CPUFREQ =
cannot get armclk\n");
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return PTR_ERR(mpu_clk);
>> + =C2=A0 =C2=A0 }
>> +
>> + =C2=A0 =C2=A0 if (policy->cpu !=3D 0) {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_err("S5PV210 CPUFREQ =
cannot get proper cpu(%d)\n",
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 policy->cpu);
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;
>> + =C2=A0 =C2=A0 }
>> + =C2=A0 =C2=A0 policy->cur =3D policy->min =3D policy->max =3D s5pv=
210_getspeed(0);
>> +
>> + =C2=A0 =C2=A0 cpufreq_frequency_table_get_attr(freq_table, policy-=
>cpu);
>> +
>> + =C2=A0 =C2=A0 policy->cpuinfo.transition_latency =3D 40000; =C2=A0=
 =C2=A0 /* 1us */
>> +
>> + =C2=A0 =C2=A0 rate =3D clk_get_rate(mpu_clk);
>> + =C2=A0 =C2=A0 i =3D 0;
>> +
> i =3D 0?
>
>> + =C2=A0 =C2=A0 while (freq_table[i].frequency !=3D CPUFREQ_TABLE_EN=
D) {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (freq_table[i].freque=
ncy * 1000 =3D=3D rate) {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 level =3D freq_table[i].index;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 break;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i++;
>> + =C2=A0 =C2=A0 }
>> +
>> + =C2=A0 =C2=A0 if (level =3D=3D CPUFREQ_TABLE_END) { /* Not found *=
/
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_err("[%s:%d] clock sp=
eed does not match: "
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "%d. Using L1 of 800MHz.\n",
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __FILE__, __LINE__, rate);
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 level =3D L1;
>> + =C2=A0 =C2=A0 }
>> +
>> + =C2=A0 =C2=A0 backup_dmc0_reg =3D __raw_readl(S5P_VA_DMC0 + 0x30) =
& 0xFFFF;
>> + =C2=A0 =C2=A0 backup_dmc1_reg =3D __raw_readl(S5P_VA_DMC1 + 0x30) =
& 0xFFFF;
>> + =C2=A0 =C2=A0 backup_freq_level =3D level;
>> + =C2=A0 =C2=A0 mpll_clk =3D clk_get(NULL, "mout_mpll");
>> + =C2=A0 =C2=A0 mpll_freq =3D clk_get_rate(mpll_clk) / 1000 / 1000; =
/* in MHz */
>> + =C2=A0 =C2=A0 clk_put(mpll_clk);
>> + =C2=A0 =C2=A0 i =3D 0;
>> + =C2=A0 =C2=A0 do {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int index =3D freq_table=
[i].index;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (apll_freq_max < clk_=
info[index].fclk)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 apll_freq_max =3D clk_info[index].fclk;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i++;
>> + =C2=A0 =C2=A0 } while (freq_table[i].frequency !=3D CPUFREQ_TABLE_=
END);
>> + =C2=A0 =C2=A0 apll_freq_max /=3D 1000; /* in MHz */
>> +
>> + =C2=A0 =C2=A0 memcpy(&s3c_freqs.old, &clk_info[level],
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 sizeof(struct s3c_freq));
>> + =C2=A0 =C2=A0 previous_arm_volt =3D dvs_conf[level].arm_volt;
>> +
>> + =C2=A0 =C2=A0 return cpufreq_frequency_table_cpuinfo(policy, freq_=
table);
>> +}
>> +
>> +static struct cpufreq_driver s5pv210_driver =3D {
>
> s5pv210_cpufreq_driver...
>
>> + =C2=A0 =C2=A0 .flags =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D CPUFREQ=
_STICKY,
>> + =C2=A0 =C2=A0 .verify =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D s5pv210_veri=
fy_speed,
>> + =C2=A0 =C2=A0 .target =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D s5pv210_targ=
et,
>> + =C2=A0 =C2=A0 .get =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D s5=
pv210_getspeed,
>> + =C2=A0 =C2=A0 .init =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D s5pv210=
_cpu_init,
>> + =C2=A0 =C2=A0 .name =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "s5pv21=
0",
>> +#ifdef CONFIG_PM
>> + =C2=A0 =C2=A0 .suspend =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D s5pv210_cpuf=
req_suspend,
>> + =C2=A0 =C2=A0 .resume =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D s5pv210_cpuf=
req_resume,
>> +#endif
>> +};
>> +
>> +static int __init s5pv210_cpufreq_init(void)
>> +{
>> + =C2=A0 =C2=A0 if (s5pv210_workaround())
>
> Same...just CPU revision...not workaround...
>
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dvs_conf =3D dvs_conf_wo=
rkaround;
>> +
>> + =C2=A0 =C2=A0 arm_regulator =3D regulator_get_exclusive(NULL, "vdd=
arm");
>> + =C2=A0 =C2=A0 if (IS_ERR(arm_regulator)) {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_err("failed to get re=
gulater resource vddarm\n");
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto error;
>> + =C2=A0 =C2=A0 }
>> + =C2=A0 =C2=A0 internal_regulator =3D regulator_get_exclusive(NULL,=
 "vddint");
>> + =C2=A0 =C2=A0 if (IS_ERR(internal_regulator)) {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_err("failed to get re=
gulater resource vddint\n");
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto error;
>> + =C2=A0 =C2=A0 }
>> + =C2=A0 =C2=A0 goto finish;
>> +error:
>> + =C2=A0 =C2=A0 pr_warn("Cannot get vddarm or vddint. CPUFREQ Will n=
ot"
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0" change the voltage.\n");
>> +finish:
>> + =C2=A0 =C2=A0 return cpufreq_register_driver(&s5pv210_driver);
>
> s5pv210_cpufreq_driver...
>
>> +}
>> +
>> +late_initcall(s5pv210_cpufreq_init);
>> diff --git a/arch/arm/mach-s5pv210/include/mach/cpu-freq.h
> b/arch/arm/mach-
>> s5pv210/include/mach/cpu-freq.h
>> new file mode 100644
>> index 0000000..e1a1c0c
>> --- /dev/null
>> +++ b/arch/arm/mach-s5pv210/include/mach/cpu-freq.h
>> @@ -0,0 +1,40 @@
>> +/* arch/arm/mach-s5pv210/include/mach/cpu-freq.h
>> + *
>> + * Copyright (c) 2010 Samsung Electronics
>> + *
>> + * =C2=A0 =C2=A0 =C2=A0 MyungJoo Ham <myungjoo.ham@samsung.com>
>> + *
>> + * S5PV210/S5PC110 CPU frequency scaling support
>> + *
>> + * This program is free software; you can redistribute it and/or mo=
dify
>> + * it under the terms of the GNU General Public License version 2 a=
s
>> + * published by the Free Software Foundation.
>> +*/
>> +
>> +#ifndef __ASM_ARCH_CPU_FREQ_H
>> +#define __ASM_ARCH_CPU_FREQ_H
>> +
>> +#include <linux/cpufreq.h>
>> +
>> +#define USE_FREQ_TABLE
>
> Where is this used?

None. will be removed.

>
>> +
>> +enum perf_level {
>> + =C2=A0 =C2=A0 L0 =3D 0,
>> + =C2=A0 =C2=A0 L1,
>> + =C2=A0 =C2=A0 L2,
>> + =C2=A0 =C2=A0 L3,
>> + =C2=A0 =C2=A0 L4,
>> +};
>> +
>> +#ifdef CONFIG_PM
>> +#define SLEEP_FREQ =C2=A0 =C2=A0 =C2=A0(800 * 1000) /* Use 800MHz w=
hen entering sleep */
>> +
>> +/* additional symantics for "relation" in cpufreq with pm */
>> +#define DISABLE_FURTHER_CPUFREQ =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x10
>> +#define ENABLE_FURTHER_CPUFREQ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x=
20
>> +#define MASK_FURTHER_CPUFREQ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A00x30
>> +/* With 0x00(NOCHANGE), it depends on the previous "further" status=
 */
>> +
>> +#endif /* CONFIG_PM */
>> +
>> +#endif /* __ASM_ARCH_CPU_FREQ_H */
>> --
>
>
> Thanks.
>
> Best regards,
> Kgene.
> --
> Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
> SW Solution Development Team, Samsung Electronics Co., Ltd.
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>



--=20
MyungJoo Ham (=ED=95=A8=EB=AA=85=EC=A3=BC), Ph.D.
Mobile Software Platform Lab,
Digital Media and Communications (DMC) Business
Samsung Electronics
cell: 82-10-6714-2858
