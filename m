From: MyungJoo Ham <myungjoo.ham@samsung.com>
Subject: Re: [PATCH v2 5/5] ARM: S5PV210: Initial CPUFREQ Support
Date: Mon, 19 Jul 2010 11:50:28 +0900
Message-ID: <AANLkTinj5LAerJPSqYtRg6oumV3o_DTXZaj6GC6mOVA7@mail.gmail.com>
References: <1279267277-6804-1-git-send-email-myungjoo.ham@samsung.com>
	<1279267277-6804-2-git-send-email-myungjoo.ham@samsung.com>
	<1279267277-6804-3-git-send-email-myungjoo.ham@samsung.com>
	<1279267277-6804-4-git-send-email-myungjoo.ham@samsung.com>
	<1279267277-6804-5-git-send-email-myungjoo.ham@samsung.com>
	<1279267277-6804-6-git-send-email-myungjoo.ham@samsung.com>
	<4C403C53.4000204@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:43818 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758156Ab0GSCue convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 18 Jul 2010 22:50:34 -0400
Received: by iwn7 with SMTP id 7so4102347iwn.19
        for <linux-samsung-soc@vger.kernel.org>; Sun, 18 Jul 2010 19:50:33 -0700 (PDT)
In-Reply-To: <4C403C53.4000204@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Maurus Cuelenaere <mcuelenaere@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, kyungmin.park@samsung.com, kgene.kim@samsung.com, ben-linux@fluff.org, linux-samsung-soc@vger.kernel.org

On Fri, Jul 16, 2010 at 8:02 PM, Maurus Cuelenaere
<mcuelenaere@gmail.com> wrote:
> =C2=A0Op 16-07-10 10:01, MyungJoo Ham schreef:
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
>> --
>> v2:
>> =C2=A0 =C2=A0 =C2=A0 - Ramp-up delay is removed. (let regulator fram=
ework do the job)
>> =C2=A0 =C2=A0 =C2=A0 - Provide proper max values for regulator_set_v=
oltage
>> =C2=A0 =C2=A0 =C2=A0 - Removed unneccesary #ifdef's.
>> =C2=A0 =C2=A0 =C2=A0 - Removed unnecessary initialiser for CLK_OUT
>>
>> Signed-off-by: MyungJoo Ham <myungjoo.ham@samsung.com>
>> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
>> ---
>> =C2=A0arch/arm/Kconfig =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=
=A01 +
>> =C2=A0arch/arm/mach-s5pv210/Makefile =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A03 +
>> =C2=A0arch/arm/mach-s5pv210/cpufreq-s5pv210.c =C2=A0 =C2=A0 =C2=A0 |=
 =C2=A0776 +++++++++++++++++++++++++
>> =C2=A0arch/arm/mach-s5pv210/include/mach/cpu-freq.h | =C2=A0 50 ++
>> =C2=A04 files changed, 830 insertions(+), 0 deletions(-)
>> =C2=A0create mode 100644 arch/arm/mach-s5pv210/cpufreq-s5pv210.c
>> =C2=A0create mode 100644 arch/arm/mach-s5pv210/include/mach/cpu-freq=
=2Eh
>>

(snip)

>> +
>> +struct s5pc11x_dvs_conf {
>> + =C2=A0 =C2=A0 const unsigned long lvl; =C2=A0 =C2=A0 =C2=A0 =C2=A0=
/* DVFS level : L0,L1,L2,L3... */
>
> Why add this when you don't use it? You could use the level as the lo=
okup key instead.
>

Thank you for pointing out. I'll correct them (including pr_* and
duplicated info messages) in the next version of patches.

>> + =C2=A0 =C2=A0 unsigned long =C2=A0 =C2=A0 =C2=A0 arm_volt; =C2=A0 =
/* uV */
>> + =C2=A0 =C2=A0 unsigned long =C2=A0 =C2=A0 =C2=A0 int_volt; =C2=A0 =
/* uV */
>> +};
>> +
>> +#ifdef CONFIG_CPU_S5PC110_EVT0_ERRATA
>> +const unsigned long arm_volt_max =3D 1350000;
>> +const unsigned long int_volt_max =3D 1250000;
>> +#else
>> +const unsigned long arm_volt_max =3D 1300000;
>> +const unsigned long int_volt_max =3D 1200000;
>> +#endif
>> +
>> +static struct s5pc11x_dvs_conf s5pv210_dvs_conf[] =3D {
>> +#ifdef CONFIG_CPU_S5PC110_EVT0_ERRATA
>> + =C2=A0 =C2=A0 {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .lvl =C2=A0 =C2=A0 =C2=A0=
 =C2=A0=3D L0,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .arm_volt =C2=A0 =3D 130=
0000,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .int_volt =C2=A0 =3D 120=
0000,
>> + =C2=A0 =C2=A0 }, {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .lvl =C2=A0 =C2=A0 =C2=A0=
 =C2=A0=3D L1,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .arm_volt =C2=A0 =3D 125=
0000,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .int_volt =C2=A0 =3D 120=
0000,
>> +
>> + =C2=A0 =C2=A0 }, {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .lvl =C2=A0 =C2=A0 =C2=A0=
 =C2=A0=3D L2,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .arm_volt =C2=A0 =3D 125=
0000,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .int_volt =C2=A0 =3D 120=
0000,
>> +
>> + =C2=A0 =C2=A0 }, {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .lvl =C2=A0 =C2=A0 =C2=A0=
 =C2=A0=3D L3,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .arm_volt =C2=A0 =3D 125=
0000,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .int_volt =C2=A0 =3D 120=
0000,
>> + =C2=A0 =C2=A0 }, {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .lvl =C2=A0 =C2=A0 =C2=A0=
 =C2=A0=3D L4,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .arm_volt =C2=A0 =3D 125=
0000,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .int_volt =C2=A0 =3D 120=
0000,
>> + =C2=A0 =C2=A0 },
>> +#else
>> + =C2=A0 =C2=A0 {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .lvl =C2=A0 =C2=A0 =C2=A0=
 =C2=A0=3D L0,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .arm_volt =C2=A0 =3D 125=
0000,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .int_volt =C2=A0 =3D 110=
0000,
>> + =C2=A0 =C2=A0 }, {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .lvl =C2=A0 =C2=A0 =C2=A0=
 =C2=A0=3D L1,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .arm_volt =C2=A0 =3D 120=
0000,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .int_volt =C2=A0 =3D 110=
0000,
>> +
>> + =C2=A0 =C2=A0 }, {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .lvl =C2=A0 =C2=A0 =C2=A0=
 =C2=A0=3D L2,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .arm_volt =C2=A0 =3D 105=
0000,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .int_volt =C2=A0 =3D 110=
0000,
>> +
>> + =C2=A0 =C2=A0 }, {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .lvl =C2=A0 =C2=A0 =C2=A0=
 =C2=A0=3D L3,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .arm_volt =C2=A0 =3D 950=
000,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .int_volt =C2=A0 =3D 110=
0000,
>> + =C2=A0 =C2=A0 }, {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .lvl =C2=A0 =C2=A0 =C2=A0=
 =C2=A0=3D L4,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .arm_volt =C2=A0 =3D 950=
000,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .int_volt =C2=A0 =3D 100=
0000,
>> + =C2=A0 =C2=A0 },
>> +#endif
>> +};
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
>> +static struct s3c_freq s5pv210_clk_info[] =3D {
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
>> +int s5pv210_verify_speed(struct cpufreq_policy *policy)
>> +{
>> +
>> + =C2=A0 =C2=A0 if (policy->cpu)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;
>> +
>> + =C2=A0 =C2=A0 return cpufreq_frequency_table_verify(policy, s5pv21=
0_freq_table);
>> +}
>> +
>> +unsigned int s5pv210_getspeed(unsigned int cpu)
>> +{
>> + =C2=A0 =C2=A0 unsigned long rate;
>> +
>> + =C2=A0 =C2=A0 if (cpu)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;
>> +
>> + =C2=A0 =C2=A0 rate =3D clk_get_rate(mpu_clk) / KHZ_T;
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
>> + =C2=A0 =C2=A0 /* 1. Temporarily change divider for MFC and G3D
>> + =C2=A0 =C2=A0 =C2=A0* SCLKA2M(200/1=3D200)->(200/4=3D50)MHz
>> + =C2=A0 =C2=A0 =C2=A0**/
>> + =C2=A0 =C2=A0 reg =3D __raw_readl(S5P_CLK_DIV2);
>> + =C2=A0 =C2=A0 reg &=3D ~(S5P_CLKDIV2_G3D_MASK | S5P_CLKDIV2_MFC_MA=
SK);
>> + =C2=A0 =C2=A0 reg |=3D (0x3 << S5P_CLKDIV2_G3D_SHIFT) |
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (0x3 << S5P_CLKDIV2_MFC_=
SHIFT);
>> +#ifndef CONFIG_CPU_S5PC110_EVT0_ERRATA
>> + =C2=A0 =C2=A0 reg &=3D ~S5P_CLKDIV2_G2D_MASK;
>> + =C2=A0 =C2=A0 reg |=3D (0x2 << S5P_CLKDIV2_G2D_SHIFT);
>> +#endif
>> + =C2=A0 =C2=A0 __raw_writel(reg, S5P_CLK_DIV2);
>> +
>> + =C2=A0 =C2=A0 /* For MFC, G3D dividing */
>> + =C2=A0 =C2=A0 do {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D __raw_readl(S5P_=
CLK_DIV_STAT0);
>> + =C2=A0 =C2=A0 } while (reg & ((1 << 16) | (1 << 17)));
>> +
>> + =C2=A0 =C2=A0 /* 2. Change SCLKA2M(200MHz) to SCLKMPLL in MFC_MUX,=
 G3D MUX
>> + =C2=A0 =C2=A0 =C2=A0* (100/4=3D50)->(667/4=3D166)MHz
>> + =C2=A0 =C2=A0 =C2=A0**/
>> + =C2=A0 =C2=A0 reg =3D __raw_readl(S5P_CLK_SRC2);
>> + =C2=A0 =C2=A0 reg &=3D ~(S5P_CLKSRC2_G3D_MASK | S5P_CLKSRC2_MFC_MA=
SK);
>> + =C2=A0 =C2=A0 reg |=3D (0x1 << S5P_CLKSRC2_G3D_SHIFT) |
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (0x1 << S5P_CLKSRC2_MFC_=
SHIFT);
>> +#ifndef CONFIG_CPU_S5PC110_EVT0_ERRATA
>> + =C2=A0 =C2=A0 reg &=3D ~S5P_CLKSRC2_G2D_MASK;
>> + =C2=A0 =C2=A0 reg |=3D (0x1 << S5P_CLKSRC2_G2D_SHIFT);
>> +#endif
>> + =C2=A0 =C2=A0 __raw_writel(reg, S5P_CLK_SRC2);
>> +
>> + =C2=A0 =C2=A0 do {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D __raw_readl(S5P_=
CLK_MUX_STAT1);
>> + =C2=A0 =C2=A0 } while (reg & ((1 << 7) | (1 << 3)));
>> +
>> + =C2=A0 =C2=A0 /* 3. DMC1 refresh count for 133MHz if (index =3D=3D=
 L4) is true
>> + =C2=A0 =C2=A0 =C2=A0* refresh counter is already programmed in the=
 outer/upper
>> + =C2=A0 =C2=A0 =C2=A0* code. 0x287@83MHz
>> + =C2=A0 =C2=A0 =C2=A0**/
>> + =C2=A0 =C2=A0 if (!bus_speed_changing)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __raw_writel(0x40d, S5P_=
VA_DMC1 + 0x30);
>> +
>> + =C2=A0 =C2=A0 /* 4. SCLKAPLL -> SCLKMPLL */
>> + =C2=A0 =C2=A0 reg =3D __raw_readl(S5P_CLK_SRC0);
>> + =C2=A0 =C2=A0 reg &=3D ~(S5P_CLKSRC0_MUX200_MASK);
>> + =C2=A0 =C2=A0 reg |=3D (0x1 << S5P_CLKSRC0_MUX200_SHIFT);
>> + =C2=A0 =C2=A0 __raw_writel(reg, S5P_CLK_SRC0);
>> +
>> + =C2=A0 =C2=A0 do {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D __raw_readl(S5P_=
CLK_MUX_STAT0);
>> + =C2=A0 =C2=A0 } while (reg & (0x1 << 18));
>> +
>> +#if defined(CONFIG_S5PC110_H_TYPE)
>> + =C2=A0 =C2=A0 /* DMC0 source clock: SCLKA2M -> SCLKMPLL */
>> + =C2=A0 =C2=A0 __raw_writel(0x50e, S5P_VA_DMC0 + 0x30);
>> +
>> + =C2=A0 =C2=A0 reg =3D __raw_readl(S5P_CLK_DIV6);
>> + =C2=A0 =C2=A0 reg &=3D ~(S5P_CLKDIV6_ONEDRAM_MASK);
>> + =C2=A0 =C2=A0 reg |=3D (0x3 << S5P_CLKDIV6_ONEDRAM_SHIFT);
>> + =C2=A0 =C2=A0 __raw_writel(reg, S5P_CLK_DIV6);
>> +
>> + =C2=A0 =C2=A0 do {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D __raw_readl(S5P_=
CLK_DIV_STAT1);
>> + =C2=A0 =C2=A0 } while (reg & (1 << 15));
>> +
>> + =C2=A0 =C2=A0 reg =3D __raw_readl(S5P_CLK_SRC6);
>> + =C2=A0 =C2=A0 reg &=3D ~(S5P_CLKSRC6_ONEDRAM_MASK);
>> + =C2=A0 =C2=A0 reg |=3D (0x1 << S5P_CLKSRC6_ONEDRAM_SHIFT);
>> + =C2=A0 =C2=A0 __raw_writel(reg, S5P_CLK_SRC6);
>> +
>> + =C2=A0 =C2=A0 do {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D __raw_readl(S5P_=
CLK_MUX_STAT1);
>> + =C2=A0 =C2=A0 } while (reg & (1 << 11));
>> +#endif
>> +}
>> +
>> +static void s5pv210_target_MPLL2APLL(unsigned int index,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int bus_speed_c=
hanging)
>> +{
>> + =C2=A0 =C2=A0 unsigned int reg;
>> +
>> + =C2=A0 =C2=A0 /* 7. Set Lock time =3D 30us*24MHz =3D 02cf (EVT1) *=
/
>> +#ifdef CONFIG_CPU_S5PC110_EVT0_ERRATA
>> + =C2=A0 =C2=A0 /* Lock time =3D 300us*24Mhz =3D 7200(0x1c20)*/
>> + =C2=A0 =C2=A0 __raw_writel(0x1c20, S5P_APLL_LOCK);
>> +#else
>> + =C2=A0 =C2=A0 /* Lock time =3D 30us*24Mhz =3D 0x2cf*/
>> + =C2=A0 =C2=A0 __raw_writel(0x2cf, S5P_APLL_LOCK);
>> +#endif
>> +
>> + =C2=A0 =C2=A0 /* 8. Turn on APLL
>> + =C2=A0 =C2=A0 =C2=A0* 8-1. Set PMS values
>> + =C2=A0 =C2=A0 =C2=A0* 8-3. Wait until the PLL is locked
>> + =C2=A0 =C2=A0 =C2=A0**/
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
>> + =C2=A0 =C2=A0 /* 9. Change source clock from SCLKMPLL(667MHz)
>> + =C2=A0 =C2=A0 =C2=A0* to SCLKA2M(200MHz) in MFC_MUX and G3D_MUX
>> + =C2=A0 =C2=A0 =C2=A0* (667/4=3D166)->(200/4=3D50)MHz
>> + =C2=A0 =C2=A0 =C2=A0**/
>> + =C2=A0 =C2=A0 reg =3D __raw_readl(S5P_CLK_SRC2);
>> + =C2=A0 =C2=A0 reg &=3D ~(S5P_CLKSRC2_G3D_MASK | S5P_CLKSRC2_MFC_MA=
SK);
>> + =C2=A0 =C2=A0 reg |=3D (0 << S5P_CLKSRC2_G3D_SHIFT) | (0 << S5P_CL=
KSRC2_MFC_SHIFT);
>> +#ifndef CONFIG_CPU_S5PC110_EVT0_ERRATA
>> + =C2=A0 =C2=A0 reg &=3D ~S5P_CLKSRC2_G2D_MASK;
>> + =C2=A0 =C2=A0 reg |=3D 0x1 << S5P_CLKSRC2_G2D_SHIFT;
>> +#endif
>> + =C2=A0 =C2=A0 __raw_writel(reg, S5P_CLK_SRC2);
>> +
>> + =C2=A0 =C2=A0 do {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D __raw_readl(S5P_=
CLK_MUX_STAT1);
>> + =C2=A0 =C2=A0 } while (reg & ((1 << 7) | (1 << 3)));
>> +
>> + =C2=A0 =C2=A0 /* 10. Change divider for MFC and G3D
>> + =C2=A0 =C2=A0 =C2=A0* (200/4=3D50)->(200/1=3D200)MHz
>> + =C2=A0 =C2=A0 =C2=A0**/
>> + =C2=A0 =C2=A0 reg =3D __raw_readl(S5P_CLK_DIV2);
>> + =C2=A0 =C2=A0 reg &=3D ~(S5P_CLKDIV2_G3D_MASK | S5P_CLKDIV2_MFC_MA=
SK);
>> + =C2=A0 =C2=A0 reg |=3D (clkdiv_val[index][10] << S5P_CLKDIV2_G3D_S=
HIFT) |
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (clkdiv_val[index][9] <<=
 S5P_CLKDIV2_MFC_SHIFT);
>> +#ifndef CONFIG_CPU_S5PC110_EVT0_ERRATA
>> + =C2=A0 =C2=A0 reg &=3D ~S5P_CLKDIV2_G2D_MASK;
>> + =C2=A0 =C2=A0 reg |=3D 0x2 << S5P_CLKDIV2_G2D_SHIFT;
>> +#endif
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
PLL -> SCLKAPLL =C2=A0 */
>> + =C2=A0 =C2=A0 __raw_writel(reg, S5P_CLK_SRC0);
>> +
>> + =C2=A0 =C2=A0 do {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D __raw_readl(S5P_=
CLK_MUX_STAT0);
>> + =C2=A0 =C2=A0 } while (reg & (0x1 << 18));
>> +
>> + =C2=A0 =C2=A0 /* 12. DMC1 refresh counter
>> + =C2=A0 =C2=A0 =C2=A0* L4: DMC1 =3D 100MHz 7.8us/(1/100) =3D 0x30c
>> + =C2=A0 =C2=A0 =C2=A0* Others: DMC1 =3D 200MHz 7.8us/(1/200) =3D 0x=
618
>> + =C2=A0 =C2=A0 =C2=A0**/
>> + =C2=A0 =C2=A0 if (!bus_speed_changing)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __raw_writel(0x618, S5P_=
VA_DMC1 + 0x30);
>> +
>> +#if defined(CONFIG_S5PC110_H_TYPE)
>> + =C2=A0 =C2=A0 /* DMC0 source clock: SCLKMPLL -> SCLKA2M */
>> + =C2=A0 =C2=A0 reg =3D __raw_readl(S5P_CLK_SRC6);
>> + =C2=A0 =C2=A0 reg &=3D ~(S5P_CLKSRC6_ONEDRAM_MASK);
>> + =C2=A0 =C2=A0 reg |=3D (0x0 << S5P_CLKSRC6_ONEDRAM_SHIFT);
>> + =C2=A0 =C2=A0 __raw_writel(reg, S5P_CLK_SRC6);
>> +
>> + =C2=A0 =C2=A0 do {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D __raw_readl(S5P_=
CLK_MUX_STAT1);
>> + =C2=A0 =C2=A0 } while (reg & (1 << 11));
>> +
>> + =C2=A0 =C2=A0 reg =3D __raw_readl(S5P_CLK_DIC6);
>> + =C2=A0 =C2=A0 reg &=3D ~(S5P_CLKDIV6_ONEDRAM_MASK);
>> + =C2=A0 =C2=A0 reg |=3D (0x0 << S5P_CLKDIV6_ONEDRAM_SHIFT);
>> + =C2=A0 =C2=A0 __raw_writel(reg, S5P_CLK_DIV6);
>> +
>> + =C2=A0 =C2=A0 do {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D __raw_readl(S5P_=
CLK_DIV_STAT1);
>> + =C2=A0 =C2=A0 } while (reg & (1 << 15));
>> + =C2=A0 =C2=A0 __raw_writel(0x618, S5P_VA_DMC0 + 0x30);
>> +#endif
>> +}
>> +
>> +#ifdef CONFIG_PM
>> +static int no_cpufreq_access;
>> +/* s5pv210_target: relation has an additional symantics other than
>> + * the standard
>> + * [0x30]:
>> + * =C2=A0 1: disable further access to target until being re-enable=
d.
>> + * =C2=A0 2: re-enable access to target */
>> +#endif
>> +static int s5pv210_target(struct cpufreq_policy *policy,
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
>> +#ifdef CONFIG_CPU_FREQ_DEBUG
>> + =C2=A0 =C2=A0 printk(KERN_INFO "cpufreq: Entering for %dkHz\n", ta=
rget_freq);
>> +#endif
>
> cpufreq_debug_printk(CPUFREQ_DEBUG_DRIVER, <prefix>, ...)
>
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
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printk(KERN_ERR "%s:%d d=
enied marking \"FURTHER_CPUFREQ\""
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 " as both marked.\n",
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __FILE__, __LINE__);
>> + =C2=A0 =C2=A0 }
>> + =C2=A0 =C2=A0 if (relation & ENABLE_FURTHER_CPUFREQ)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 no_cpufreq_access =3D 0;
>> + =C2=A0 =C2=A0 if (no_cpufreq_access =3D=3D 1) {
>> +#ifdef CONFIG_PM_VERBOSE
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printk(KERN_ERR "%s:%d d=
enied access to %s as it is disabled"
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0" temporarily\n", __FILE__, __LINE__, __=
func__);
>
> Use pr_err(...)
>
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
>> + =C2=A0 =C2=A0 if (cpufreq_frequency_table_target(policy, s5pv210_f=
req_table,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_freq, relation, &index)) {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D -EINVAL;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;
>> + =C2=A0 =C2=A0 }
>> +#ifdef CPUFREQ_DISABLE_100MHZ
>> + =C2=A0 =C2=A0 if (index =3D=3D L4)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 index =3D L3;
>> +#endif
>> +#ifdef CPUFREQ_DISABLE_1GHZ
>> + =C2=A0 =C2=A0 if (index =3D=3D L0)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 index =3D L1;
>> +#endif
>> +
>> + =C2=A0 =C2=A0 arm_clk =3D s5pv210_freq_table[index].frequency;
>> +
>> + =C2=A0 =C2=A0 s3c_freqs.freqs.new =3D arm_clk;
>> + =C2=A0 =C2=A0 s3c_freqs.freqs.cpu =3D 0;
>> +
>> + =C2=A0 =C2=A0 if (s3c_freqs.freqs.new =3D=3D s3c_freqs.freqs.old &=
&
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 initialized >=3D 2)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;
>> + =C2=A0 =C2=A0 else if (initialized < 2)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 initialized++;
>> +
>> + =C2=A0 =C2=A0 arm_volt =3D s5pv210_dvs_conf[index].arm_volt;
>> + =C2=A0 =C2=A0 int_volt =3D s5pv210_dvs_conf[index].int_volt;
>> +
>> + =C2=A0 =C2=A0 /* iNew clock information update */
>> + =C2=A0 =C2=A0 memcpy(&s3c_freqs.new, &s5pv210_clk_info[index],
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
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bus_speed_changing =3D 1=
;
>> +
>> + =C2=A0 =C2=A0 if (bus_speed_changing) {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Reconfigure DRAM refr=
esh counter value for minimum
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* temporary clock =
while changing divider.
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* expected clock i=
s 83MHz: 7.8usec/(1/83MHz) =3D 0x287
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0**/
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (pll_changing)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 __raw_writel(0x287, S5P_VA_DMC1 + 0x30);
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 __raw_writel(0x30c, S5P_VA_DMC1 + 0x30);
>> +
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __raw_writel(0x287, S5P_=
VA_DMC0 + 0x30);
>> + =C2=A0 =C2=A0 }
>> +
>> + =C2=A0 =C2=A0 /* APLL should be changed in this level
>> + =C2=A0 =C2=A0 =C2=A0* APLL -> MPLL(for stable transition) -> APLL
>> + =C2=A0 =C2=A0 =C2=A0* Some clock source's clock API =C2=A0are not =
prepared. Do not use clock API
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
=A0 | S5P_CLKDIV0_HCLK200_MASK | S5P_CLKDIV0_PCLK100_MASK
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | S5P_CLKDIV0_HCLK166_MASK | S5P_CLKDIV0_PCLK83_MASK
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | S5P_CLKDIV0_HCLK133_MASK | S5P_CLKDIV0_PCLK66_MASK);
>> +
>> + =C2=A0 =C2=A0 reg |=3D ((clkdiv_val[index][0]<<S5P_CLKDIV0_APLL_SH=
IFT)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | (clkdiv_val[index][1] << S5P_CLKDIV0_A2M_SHIFT)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | (clkdiv_val[index][2] << S5P_CLKDIV0_HCLK200_SHIFT)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | (clkdiv_val[index][3] << S5P_CLKDIV0_PCLK100_SHIFT)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | (clkdiv_val[index][4] << S5P_CLKDIV0_HCLK166_SHIFT)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | (clkdiv_val[index][5] << S5P_CLKDIV0_PCLK83_SHIFT)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | (clkdiv_val[index][6] << S5P_CLKDIV0_HCLK133_SHIFT)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | (clkdiv_val[index][7] << S5P_CLKDIV0_PCLK66_SHIFT));
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
>> + =C2=A0 =C2=A0 /* L4 level need to change memory bus speed,
>> + =C2=A0 =C2=A0 =C2=A0* hence onedram clock divier and
>> + =C2=A0 =C2=A0 =C2=A0* memory refresh parameter should be changed
>> + =C2=A0 =C2=A0 =C2=A0*/
>> + =C2=A0 =C2=A0 if (bus_speed_changing) {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D __raw_readl(S5P_=
CLK_DIV6);
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg &=3D ~S5P_CLKDIV6_ON=
EDRAM_MASK;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg |=3D (clkdiv_val[ind=
ex][8] << S5P_CLKDIV6_ONEDRAM_SHIFT);
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* ONEDRAM Clock Divider=
 Ratio: 7 for L4, 3 for Others */
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __raw_writel(reg, S5P_CL=
K_DIV6);
>> +
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 do {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 reg =3D __raw_readl(S5P_CLK_DIV_STAT1);
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } while (reg & (1 << 15)=
);
>> +
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Reconfigure DRAM refr=
esh counter value */
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (index !=3D L4) {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 /* DMC0: 166MHz
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* DMC1: 200MHz
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0**/
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 __raw_writel(0x618, S5P_VA_DMC1 + 0x30);
>> +#if !defined(CONFIG_S5PC110_H_TYPE)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 __raw_writel(0x50e, S5P_VA_DMC0 + 0x30);
>> +#else
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 __raw_writel(0x618, S5P_VA_DMC0 + 0x30);
>> +#endif
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 /* DMC0: 83MHz
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* DMC1: 100MHz
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0**/
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 __raw_writel(0x30c, S5P_VA_DMC1 + 0x30);
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 __raw_writel(0x287, S5P_VA_DMC0 + 0x30);
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
>> + =C2=A0 =C2=A0 }
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
>> +#ifdef CONFIG_CPU_FREQ_DEBUG
>> + =C2=A0 =C2=A0 printk(KERN_INFO "cpufreq: Performance changed[L%d]\=
n", index);
>
> pr_info
>
>> +#endif
>> + =C2=A0 =C2=A0 previous_arm_volt =3D s5pv210_dvs_conf[index].arm_vo=
lt;
>> +out:
>> + =C2=A0 =C2=A0 return ret;
>> +}
>> +
>> +
>> +#ifdef CONFIG_PM
>> +static int previous_frequency;
>> +
>> +static int s5pv210_cpufreq_suspend(struct cpufreq_policy *policy,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pm_message_t pmsg)
>> +{
>> + =C2=A0 =C2=A0 int ret =3D 0;
>> + =C2=A0 =C2=A0 printk(KERN_INFO "cpufreq: Entering suspend.\n");
>
> pr_info
>
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
>> +
>> + =C2=A0 =C2=A0 printk(KERN_INFO "cpufreq: Waking up from a suspend.=
\n");
>
> pr_info
>
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
>> + =C2=A0 =C2=A0 while (s5pv210_freq_table[i].frequency !=3D CPUFREQ_=
TABLE_END) {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (s5pv210_freq_table[i=
].frequency * 1000 =3D=3D rate) {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 level =3D s5pv210_freq_table[i].index;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 break;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i++;
>> + =C2=A0 =C2=A0 }
>> +
>> + =C2=A0 =C2=A0 if (level =3D=3D CPUFREQ_TABLE_END) { /* Not found *=
/
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printk(KERN_ERR "[%s:%d]=
 clock speed does not match: "
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "%d. Using L1 of 800MHz.\n",
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __FILE__, __LINE__, rate);
>
> pr_err
>
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 level =3D L1;
>> + =C2=A0 =C2=A0 }
>> +
>> + =C2=A0 =C2=A0 memcpy(&s3c_freqs.old, &s5pv210_clk_info[level],
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 sizeof(struct s3c_freq));
>> + =C2=A0 =C2=A0 previous_arm_volt =3D s5pv210_dvs_conf[level].arm_vo=
lt;
>> + =C2=A0 =C2=A0 return ret;
>> +}
>> +#endif
>> +
>> +
>> +static int __init s5pv210_cpu_init(struct cpufreq_policy *policy)
>> +{
>> + =C2=A0 =C2=A0 u32 rate ;
>> + =C2=A0 =C2=A0 int i, level =3D CPUFREQ_TABLE_END;
>> +
>> + =C2=A0 =C2=A0 printk(KERN_INFO "S5PV210 CPUFREQ %s:%d\n", __FILE__=
, __LINE__);
>
> pr_info
>
>> +#ifdef CONFIG_PM
>> + =C2=A0 =C2=A0 no_cpufreq_access =3D 0;
>> +#endif
>> +#ifdef CLK_OUT_PROBING
>> + =C2=A0 =C2=A0 reg =3D __raw_readl(S5P_CLK_OUT);
>> + =C2=A0 =C2=A0 reg &=3D ~(0x1f << 12 | 0xf << 20); /* CLKSEL and DI=
VVAL*/
>> + =C2=A0 =C2=A0 reg |=3D (0xf << 12 | 0x1 << 20); /* CLKSEL =3D ARMC=
LK/4, DIVVAL =3D 1 */
>> + =C2=A0 =C2=A0 /* Result =3D ARMCLK / 4 / ( 1 + 1 ) */
>> + =C2=A0 =C2=A0 __raw_writel(reg, S5P_CLK_OUT);
>> +#endif
>> + =C2=A0 =C2=A0 mpu_clk =3D clk_get(NULL, MPU_CLK);
>> + =C2=A0 =C2=A0 if (IS_ERR(mpu_clk)) {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printk(KERN_ERR "S5PV210=
 CPUFREQ cannot get MPU_CLK(%s)\n",
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MPU_CLK);
>
> pr_err
>
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return PTR_ERR(mpu_clk);
>> + =C2=A0 =C2=A0 }
>> +
>> + =C2=A0 =C2=A0 if (policy->cpu !=3D 0) {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printk(KERN_ERR "S5PV210=
 CPUFREQ cannot get proper cpu(%d)\n",
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 policy->cpu);
>
> pr_err
>
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;
>> + =C2=A0 =C2=A0 }
>> + =C2=A0 =C2=A0 policy->cur =3D policy->min =3D policy->max =3D s5pv=
210_getspeed(0);
>> +
>> + =C2=A0 =C2=A0 cpufreq_frequency_table_get_attr(s5pv210_freq_table,=
 policy->cpu);
>> +
>> + =C2=A0 =C2=A0 policy->cpuinfo.transition_latency =3D 40000; =C2=A0=
 =C2=A0 /*1us*/
>> +
>> + =C2=A0 =C2=A0 rate =3D clk_get_rate(mpu_clk);
>> + =C2=A0 =C2=A0 i =3D 0;
>> +
>> + =C2=A0 =C2=A0 while (s5pv210_freq_table[i].frequency !=3D CPUFREQ_=
TABLE_END) {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (s5pv210_freq_table[i=
].frequency * 1000 =3D=3D rate) {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 level =3D s5pv210_freq_table[i].index;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 break;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i++;
>> + =C2=A0 =C2=A0 }
>> +
>> + =C2=A0 =C2=A0 if (level =3D=3D CPUFREQ_TABLE_END) { /* Not found *=
/
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printk(KERN_ERR "[%s:%d]=
 clock speed does not match: "
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "%d. Using L1 of 800MHz.\n",
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __FILE__, __LINE__, rate);
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 level =3D L1;
>> + =C2=A0 =C2=A0 }
>> +
>> + =C2=A0 =C2=A0 printk(KERN_INFO "S5PV210 CPUFREQ Initialized.\n");
>
> pr_info
>
>> +
>> + =C2=A0 =C2=A0 memcpy(&s3c_freqs.old, &s5pv210_clk_info[level],
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 sizeof(struct s3c_freq));
>> + =C2=A0 =C2=A0 previous_arm_volt =3D s5pv210_dvs_conf[level].arm_vo=
lt;
>> +
>> + =C2=A0 =C2=A0 return cpufreq_frequency_table_cpuinfo(policy, s5pv2=
10_freq_table);
>> +}
>> +
>> +static struct cpufreq_driver s5pv210_driver =3D {
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
>> + =C2=A0 =C2=A0 printk(KERN_INFO "S5PV210 CPUFREQ Init.\n");
>
> pr_info
> Also, I guess one banner is enough?
>
>> + =C2=A0 =C2=A0 arm_regulator =3D regulator_get_exclusive(NULL, "vdd=
arm");
>> + =C2=A0 =C2=A0 if (IS_ERR(arm_regulator)) {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printk(KERN_ERR "failed =
to get regulater resource vddarm\n");
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto error;
>> + =C2=A0 =C2=A0 }
>> + =C2=A0 =C2=A0 internal_regulator =3D regulator_get_exclusive(NULL,=
 "vddint");
>> + =C2=A0 =C2=A0 if (IS_ERR(internal_regulator)) {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printk(KERN_ERR "failed =
to get regulater resource vddint\n");
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto error;
>> + =C2=A0 =C2=A0 }
>> + =C2=A0 =C2=A0 goto finish;
>> +error:
>> + =C2=A0 =C2=A0 printk(KERN_WARNING "Cannot get vddarm or vddint. CP=
UFREQ Will not"
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0" change the voltage.\n");
>
> pr_warn
>
>> +finish:
>> + =C2=A0 =C2=A0 return cpufreq_register_driver(&s5pv210_driver);
>> +}
>> +
>> +late_initcall(s5pv210_cpufreq_init);
>> diff --git a/arch/arm/mach-s5pv210/include/mach/cpu-freq.h b/arch/ar=
m/mach-s5pv210/include/mach/cpu-freq.h
>> new file mode 100644
>> index 0000000..d3c31b2
>> --- /dev/null
>> +++ b/arch/arm/mach-s5pv210/include/mach/cpu-freq.h
>> @@ -0,0 +1,50 @@
>> +/* arch/arm/mach-s5pv210/include/mach/cpu-freq.h
>> + *
>> + * Copyright (c) 2010 Samsung Electronics
>> + *
>> + * =C2=A0 MyungJoo Ham <myungjoo.ham@samsung.com>
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
>> +#ifndef _ARCH_ARM_MACH_S5PV210_INCLUDE_MACH_CPU_FREQ_H_
>> +#define _ARCH_ARM_MACH_S5PV210_INCLUDE_MACH_CPU_FREQ_H_
>> +
>> +#include <linux/cpufreq.h>
>> +
>> +#ifdef CONFIG_CPU_S5PV210
>> +
>> +#define USE_FREQ_TABLE
>> +
>> +#define KHZ_T =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1000
>> +
>> +#define MPU_CLK =C2=A0 =C2=A0 =C2=A0 =C2=A0 "armclk"
>> +
>> +enum perf_level {
>> + =C2=A0 =C2=A0 L0 =3D 0,
>> + =C2=A0 =C2=A0 L1,
>> + =C2=A0 =C2=A0 L2,
>> + =C2=A0 =C2=A0 L3,
>> + =C2=A0 =C2=A0 L4,
>> +};
>> +
>> +#define CLK_DIV0_MASK =C2=A0 ((0x7<<0)|(0x7<<8)|(0x7<<12)) =C2=A0 /=
* APLL,HCLK_MSYS,PCLK_MSYS mask value =C2=A0*/
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
>> +#endif
>> +
>> +
>> +#endif /* CONFIG_CPU_S5PV210 */
>> +#endif /* _ARCH_ARM_MACH_S5PV210_INCLUDE_MACH_CPU_FREQ_H_ */
>
>
> --
> Maurus Cuelenaere
>



--=20
MyungJoo Ham (=ED=95=A8=EB=AA=85=EC=A3=BC), Ph.D.
Mobile Software Platform Lab,
Digital Media and Communications (DMC) Business
Samsung Electronics
cell: 82-10-6714-2858
