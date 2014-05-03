From: Arun Kumar K <arun.kk@samsung.com>
Subject: Re: [PATCH 1/3] clk: exynos5420: Add 5800 specific clocks
Date: Sat, 3 May 2014 17:36:00 +0530
Message-ID: <CALt3h79RoDdxH3E6pv9ZKt+4UBabfLt7tHP8Eb1vDxDoybe6Ww@mail.gmail.com>
References: <1399035821-25096-1-git-send-email-arun.kk@samsung.com>
	<1399035821-25096-2-git-send-email-arun.kk@samsung.com>
	<5363D497.6090001@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f170.google.com ([209.85.220.170]:49247 "EHLO
	mail-vc0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751023AbaECMGB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 3 May 2014 08:06:01 -0400
In-Reply-To: <5363D497.6090001@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Doug Anderson <dianders@chromium.org>, Olof Johansson <olofj@google.com>, Tomasz Figa <t.figa@samsung.com>, Sachin Kamat <sachin.kamat@linaro.org>, Tushar Behera <tushar.behera@linaro.org>, Shaik Ameer Basha <shaik.ameer@samsung.com>, Rahul Sharma <rahul.sharma@samsung.com>

Hi Tomasz,

Thanks for the review.

On Fri, May 2, 2014 at 10:53 PM, Tomasz Figa <tomasz.figa@gmail.com> wrote:
> Hi Arun, Alim,
>
>
> On 02.05.2014 15:03, Arun Kumar K wrote:
>>
>> From: Alim Akhtar <alim.akhtar@samsung.com>
>>
>> Exynos5800 clock structure is mostly similar to 5420 with only
>> a small delta changes. So the 5420 clock file is re-used for
>> 5800 also. The common clocks for both are seggreagated and few
>> clocks which are different for both are separately initialized.
>
>
> Let's start with a general comment to this patch first. Have you consulted
> this with Shaik and Rahul (on CC) who are currently doing a quite heavy
> lifting of this driver to make sure that your work don't cause conflicts?
>

Yes I am aware of that series and I can post another version
which is based on that series if that is almost ready to be taken.

> Also please see some more specific comments inline.
>
>
>>
>> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
>> Signed-off-by: Arun Kumar K <arun.kk@samsung.com>
>> ---
>>   .../devicetree/bindings/clock/exynos5420-clock.txt |    3 +-
>>   drivers/clk/samsung/clk-exynos5420.c               |  192
>> +++++++++++++++-----
>>   include/dt-bindings/clock/exynos5420.h             |    1 +
>>   3 files changed, 150 insertions(+), 46 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/exynos5420-clock.txt
>> b/Documentation/devicetree/bindings/clock/exynos5420-clock.txt
>> index ca88c97..d54f42c 100644
>> --- a/Documentation/devicetree/bindings/clock/exynos5420-clock.txt
>> +++ b/Documentation/devicetree/bindings/clock/exynos5420-clock.txt
>> @@ -1,12 +1,13 @@
>>   * Samsung Exynos5420 Clock Controller
>>
>>   The Exynos5420 clock controller generates and supplies clock to various
>> -controllers within the Exynos5420 SoC.
>> +controllers within the Exynos5420 SoC and for the Exynos5800 SoC.
>>
>>   Required Properties:
>>
>>   - compatible: should be one of the following.
>>     - "samsung,exynos5420-clock" - controller compatible with Exynos5420
>> SoC.
>> +  - "samsung,exynos5800-clock" - controller compatible with Exynos5800
>> SoC.
>>
>>   - reg: physical base address of the controller and length of memory
>> mapped
>>     region.
>> diff --git a/drivers/clk/samsung/clk-exynos5420.c
>> b/drivers/clk/samsung/clk-exynos5420.c
>> index 60b2681..0543cb7 100644
>> --- a/drivers/clk/samsung/clk-exynos5420.c
>> +++ b/drivers/clk/samsung/clk-exynos5420.c
>> @@ -51,6 +51,7 @@
>>   #define SRC_TOP5              0x10214
>>   #define SRC_TOP6              0x10218
>>   #define SRC_TOP7              0x1021c
>> +#define SRC_TOP9               0x10224 /* 5800 specific */
>>   #define SRC_DISP10            0x1022c
>>   #define SRC_MAU                       0x10240
>>   #define SRC_FSYS              0x10244
>> @@ -59,6 +60,7 @@
>>   #define SRC_TOP10             0x10280
>>   #define SRC_TOP11             0x10284
>>   #define SRC_TOP12             0x10288
>> +#define SRC_TOP13              0x1028c /* 5800 specific */
>>   #define       SRC_MASK_DISP10         0x1032c
>>   #define SRC_MASK_FSYS         0x10340
>>   #define SRC_MASK_PERIC0               0x10350
>> @@ -66,6 +68,7 @@
>>   #define DIV_TOP0              0x10500
>>   #define DIV_TOP1              0x10504
>>   #define DIV_TOP2              0x10508
>> +#define DIV_TOP9               0x10524 /* 5800 specific */
>>   #define DIV_DISP10            0x1052c
>>   #define DIV_MAU                       0x10544
>>   #define DIV_FSYS0             0x10548
>> @@ -102,8 +105,14 @@
>>   #define SRC_KFC                       0x28200
>>   #define DIV_KFC0              0x28500
>>
>> +/* Exynos5x SoC type */
>> +enum exynos5x_soc {
>> +       EXYNOS5420,
>> +       EXYNOS5800,
>> +};
>> +
>>   /* list of PLLs */
>> -enum exynos5420_plls {
>> +enum exynos5x_plls {
>>         apll, cpll, dpll, epll, rpll, ipll, spll, vpll, mpll,
>>         bpll, kpll,
>>         nr_plls                 /* number of PLLs */
>> @@ -112,13 +121,13 @@ enum exynos5420_plls {
>>   static void __iomem *reg_base;
>>
>>   #ifdef CONFIG_PM_SLEEP
>> -static struct samsung_clk_reg_dump *exynos5420_save;
>> +static struct samsung_clk_reg_dump *exynos5x_save;
>>
>>   /*
>>    * list of controller registers to be saved and restored during a
>>    * suspend/resume cycle.
>>    */
>> -static unsigned long exynos5420_clk_regs[] __initdata = {
>> +static unsigned long exynos5x_clk_regs[] __initdata = {
>>         SRC_CPU,
>>         DIV_CPU0,
>>         DIV_CPU1,
>> @@ -182,16 +191,16 @@ static unsigned long exynos5420_clk_regs[]
>> __initdata = {
>>
>>   static int exynos5420_clk_suspend(void)
>>   {
>> -       samsung_clk_save(reg_base, exynos5420_save,
>> -                               ARRAY_SIZE(exynos5420_clk_regs));
>> +       samsung_clk_save(reg_base, exynos5x_save,
>> +                               ARRAY_SIZE(exynos5x_clk_regs));
>
>
> Don't you need to handle save and restore of 5800-specific registers as
> well? You can see Exynos4 clock driver for an example of handling such
> setup.
>

Ok will make the change.

>
>>
>>         return 0;
>>   }
>>
>>   static void exynos5420_clk_resume(void)
>>   {
>> -       samsung_clk_restore(reg_base, exynos5420_save,
>> -                               ARRAY_SIZE(exynos5420_clk_regs));
>> +       samsung_clk_restore(reg_base, exynos5x_save,
>> +                               ARRAY_SIZE(exynos5x_clk_regs));
>
>
> Ditto.
>
>
>>   }
>>
>>   static struct syscore_ops exynos5420_clk_syscore_ops = {
>> @@ -201,9 +210,9 @@ static struct syscore_ops exynos5420_clk_syscore_ops =
>> {
>>
>>   static void exynos5420_clk_sleep_init(void)
>>   {
>> -       exynos5420_save = samsung_clk_alloc_reg_dump(exynos5420_clk_regs,
>> -                                       ARRAY_SIZE(exynos5420_clk_regs));
>> -       if (!exynos5420_save) {
>> +       exynos5x_save = samsung_clk_alloc_reg_dump(exynos5x_clk_regs,
>> +                                       ARRAY_SIZE(exynos5x_clk_regs));
>> +       if (!exynos5x_save) {
>>                 pr_warn("%s: failed to allocate sleep save data, no sleep
>> support!\n",
>>                         __func__);
>>                 return;
>> @@ -296,13 +305,29 @@ PNAME(hdmi_p)     = { "dout_hdmi_pixel",
>> "sclk_hdmiphy" };
>>   PNAME(maudio0_p)      = { "fin_pll", "maudio_clk", "sclk_dpll",
>> "sclk_mpll",
>>                           "sclk_spll", "sclk_ipll", "sclk_epll",
>> "sclk_rpll" };
>>
>> +/* List of parents specific to exynos5800 */
>> +PNAME(mout_epll2_5800_p)       = { "mout_sclk_epll", "ffactor_dout_epll2"
>> };
>> +PNAME(mout_group1_5800_p)      = { "mout_sclk_cpll", "mout_sclk_dpll",
>> +                               "mout_sclk_mpll", "ffactor_dout_spll2" };
>> +PNAME(mout_group3_5800_p)      = { "mout_sclk_cpll", "mout_sclk_dpll",
>> +                                       "mout_sclk_mpll",
>> "ffactor_dout_spll2",
>> +                                       "mout_epll2" };
>> +PNAME(mout_group5_5800_p)      = { "mout_sclk_cpll", "mout_sclk_dpll",
>> +                                       "mout_sclk_mpll", "mout_sclk_spll"
>> };
>> +PNAME(mout_group6_5800_p)      = { "mout_sclk_ipll", "mout_sclk_dpll",
>> +                               "mout_sclk_mpll", "ffactor_dout_spll2" };
>> +PNAME(mout_group8_5800_p)      = { "dout_aclk432_scaler", "dout_sclk_sw"
>> };
>> +PNAME(mout_group9_5800_p)      = { "dout_osc_div",
>> "mout_sw_aclk432_scaler" };
>> +
>>   /* fixed rate clocks generated outside the soc */
>> -static struct samsung_fixed_rate_clock exynos5420_fixed_rate_ext_clks[]
>> __initdata = {
>> +static struct
>> +samsung_fixed_rate_clock exynos5x_fixed_rate_ext_clks[] __initdata = {
>
>
> This is kind of strange way of wrapping long lines. I'd say that at least
> struct should be in the same line as samsung_fixed_rate_clock, so that could
> be at least kind of readable.
>

Ok will do that.

>
>>         FRATE(CLK_FIN_PLL, "fin_pll", NULL, CLK_IS_ROOT, 0),
>>   };
>>
>>   /* fixed rate clocks generated inside the soc */
>> -static struct samsung_fixed_rate_clock exynos5420_fixed_rate_clks[]
>> __initdata = {
>> +static struct
>> +samsung_fixed_rate_clock exynos5x_fixed_rate_clks[] __initdata = {
>
>
> Ditto.
>
>
>>         FRATE(CLK_SCLK_HDMIPHY, "sclk_hdmiphy", NULL, CLK_IS_ROOT,
>> 24000000),
>>         FRATE(0, "sclk_pwi", NULL, CLK_IS_ROOT, 24000000),
>>         FRATE(0, "sclk_usbh20", NULL, CLK_IS_ROOT, 48000000),
>> @@ -310,39 +335,88 @@ static struct samsung_fixed_rate_clock
>> exynos5420_fixed_rate_clks[] __initdata =
>>         FRATE(0, "sclk_usbh20_scan_clk", NULL, CLK_IS_ROOT, 480000000),
>>   };
>>
>> -static struct samsung_fixed_factor_clock exynos5420_fixed_factor_clks[]
>> __initdata = {
>> +static struct
>> +samsung_fixed_factor_clock exynos5x_fixed_factor_clks[] __initdata = {
>
>
> Ditto (and the same for other numerous instances of this below).
>
>
>>         FFACTOR(0, "sclk_hsic_12m", "fin_pll", 1, 2, 0),
>>   };
>>
>> -static struct samsung_mux_clock exynos5420_mux_clks[] __initdata = {
>> -       MUX(0, "mout_mspll_kfc", mspll_cpu_p, SRC_TOP7, 8, 2),
>> -       MUX(0, "mout_mspll_cpu", mspll_cpu_p, SRC_TOP7, 12, 2),
>> -       MUX(0, "mout_apll", apll_p, SRC_CPU, 0, 1),
>> -       MUX(0, "mout_cpu", cpu_p, SRC_CPU, 16, 1),
>> -       MUX(0, "mout_kpll", kpll_p, SRC_KFC, 0, 1),
>> -       MUX(0, "mout_cpu_kfc", kfc_p, SRC_KFC, 16, 1),
>> +static struct
>> +samsung_fixed_factor_clock exynos5800_fixed_factor_clks[] __initdata = {
>> +       FFACTOR(0, "ffactor_dout_epll2", "mout_sclk_epll", 1, 2, 0),
>> +       FFACTOR(0, "ffactor_dout_spll2", "mout_sclk_spll", 1, 2, 0),
>
>
> I don't think you need the "ffactor_" prefix in the name. I assume
> "dout_epll2" and "dout_spll2" are the names listed in the datasheet. Is that
> correct?
>

Yes. I will drop the ffactor_ prefix.

> Best regards,
> Tomasz
