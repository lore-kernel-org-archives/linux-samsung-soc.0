From: MyungJoo Ham <myungjoo.ham@gmail.com>
Subject: Re: [PATCH 02/14] ARM: S5PV310: Removed unused clock
Date: Thu, 19 Aug 2010 11:57:14 +0900
Message-ID: <AANLkTinjDBxahumErXmXXDW2FLxFi6oXpu-jZa+xzYhF@mail.gmail.com>
References: <1282140084-10265-1-git-send-email-kgene.kim@samsung.com>
	<1282140084-10265-3-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1282140084-10265-3-git-send-email-kgene.kim@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Hello,

On Wed, Aug 18, 2010 at 11:01 PM, Kukjin Kim <kgene.kim@samsung.com> wrote:
> This pach removed unused clock on S5PV310/S5PC210.
>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>

In this patch, you've removed corem0, corem1, cores, periph, atclk,
and pclk_dbg, which are directly affected by cpu-freq drivers. As long
as CPUFREQ uses clocks under 800MHz, corem0, corem1, cores, and
periph's dividers should be updated and as long as CPUFREQ uses clocks
over 800MHz, atclk and pclk_dbg's dividers should also be updated.
Although in the cpu-freq patches of S5PV210, the cpu-freq driver did
not use the clock framework and accessed clock registers directly, I
thought cpu-freq should consider using the clock framework later as,
sometimes, other drivers and modules are interested in the values
related with this domain (e.g., for the stability issues,
suspend-to-mem/disk may want to read and save the clock rates of CPU).

Do you think CPUFREQ should keep accessing the clock registers
directly? or should start using clock frameworks later?

ps. If we are going to change the bus speed as well (as in S5PV210's
100MHz mode), we may need to access aclk_cored, aclk_corep, and
aclk_acp as well.

> ---
> =A0arch/arm/mach-s5pv310/clock.c | =A0126 +------------------------------=
----------
> =A01 files changed, 2 insertions(+), 124 deletions(-)
>
> diff --git a/arch/arm/mach-s5pv310/clock.c b/arch/arm/mach-s5pv310/clock.c
> index 77f2b4d..e3098d5 100644
> --- a/arch/arm/mach-s5pv310/clock.c
> +++ b/arch/arm/mach-s5pv310/clock.c
> @@ -96,60 +96,6 @@ static struct clksrc_clk clk_armclk =3D {
> =A0 =A0 =A0 =A0},
> =A0};
>
> -static struct clksrc_clk clk_aclk_corem0 =3D {
> - =A0 =A0 =A0 .clk =A0 =A0=3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "aclk_corem0",
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .id =A0 =A0 =A0 =A0 =A0 =A0 =3D -1,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .parent =A0 =A0 =A0 =A0 =3D &clk_coreclk.cl=
k,
> - =A0 =A0 =A0 },
> - =A0 =A0 =A0 .reg_div =A0 =A0 =A0 =A0=3D { .reg =3D S5P_CLKDIV_CPU, .shi=
ft =3D 4, .size =3D 3 },
> -};
> -
> -static struct clksrc_clk clk_aclk_cores =3D {
> - =A0 =A0 =A0 .clk =A0 =A0=3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "aclk_cores",
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .id =A0 =A0 =A0 =A0 =A0 =A0 =3D -1,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .parent =A0 =A0 =A0 =A0 =3D &clk_coreclk.cl=
k,
> - =A0 =A0 =A0 },
> - =A0 =A0 =A0 .reg_div =A0 =A0 =A0 =A0=3D { .reg =3D S5P_CLKDIV_CPU, .shi=
ft =3D 4, .size =3D 3 },
> -};
> -
> -static struct clksrc_clk clk_aclk_corem1 =3D {
> - =A0 =A0 =A0 .clk =A0 =A0=3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "aclk_corem1",
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .id =A0 =A0 =A0 =A0 =A0 =A0 =3D -1,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .parent =A0 =A0 =A0 =A0 =3D &clk_coreclk.cl=
k,
> - =A0 =A0 =A0 },
> - =A0 =A0 =A0 .reg_div =A0 =A0 =A0 =A0=3D { .reg =3D S5P_CLKDIV_CPU, .shi=
ft =3D 8, .size =3D 3 },
> -};
> -
> -static struct clksrc_clk clk_periphclk =3D {
> - =A0 =A0 =A0 .clk =A0 =A0=3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "periphclk",
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .id =A0 =A0 =A0 =A0 =A0 =A0 =3D -1,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .parent =A0 =A0 =A0 =A0 =3D &clk_coreclk.cl=
k,
> - =A0 =A0 =A0 },
> - =A0 =A0 =A0 .reg_div =A0 =A0 =A0 =A0=3D { .reg =3D S5P_CLKDIV_CPU, .shi=
ft =3D 12, .size =3D 3 },
> -};
> -
> -static struct clksrc_clk clk_atclk =3D {
> - =A0 =A0 =A0 .clk =A0 =A0=3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "atclk",
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .id =A0 =A0 =A0 =A0 =A0 =A0 =3D -1,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .parent =A0 =A0 =A0 =A0 =3D &clk_moutcore.c=
lk,
> - =A0 =A0 =A0 },
> - =A0 =A0 =A0 .reg_div =A0 =A0 =A0 =A0=3D { .reg =3D S5P_CLKDIV_CPU, .shi=
ft =3D 16, .size =3D 3 },
> -};
> -
> -static struct clksrc_clk clk_pclk_dbg =3D {
> - =A0 =A0 =A0 .clk =A0 =A0=3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "pclk_dbg",
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .id =A0 =A0 =A0 =A0 =A0 =A0 =3D -1,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .parent =A0 =A0 =A0 =A0 =3D &clk_atclk.clk,
> - =A0 =A0 =A0 },
> - =A0 =A0 =A0 .reg_div =A0 =A0 =A0 =A0=3D { .reg =3D S5P_CLKDIV_CPU, .shi=
ft =3D 20, .size =3D 3 },
> -};
> -
> =A0/* Core list of CMU_CORE side */
>
> =A0static struct clk *clkset_corebus_list[] =3D {
> @@ -180,42 +126,6 @@ static struct clksrc_clk clk_sclk_dmc =3D {
> =A0 =A0 =A0 =A0.reg_div =A0 =A0 =A0 =A0=3D { .reg =3D S5P_CLKDIV_CORE0, .=
shift =3D 12, .size =3D 3 },
> =A0};
>
> -static struct clksrc_clk clk_aclk_cored =3D {
> - =A0 =A0 =A0 .clk =A0 =A0=3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "aclk_cored",
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .id =A0 =A0 =A0 =A0 =A0 =A0 =3D -1,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .parent =A0 =A0 =A0 =A0 =3D &clk_sclk_dmc.c=
lk,
> - =A0 =A0 =A0 },
> - =A0 =A0 =A0 .reg_div =A0 =A0 =A0 =A0=3D { .reg =3D S5P_CLKDIV_CORE0, .s=
hift =3D 16, .size =3D 3 },
> -};
> -
> -static struct clksrc_clk clk_aclk_corep =3D {
> - =A0 =A0 =A0 .clk =A0 =A0=3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "aclk_corep",
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .id =A0 =A0 =A0 =A0 =A0 =A0 =3D -1,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .parent =A0 =A0 =A0 =A0 =3D &clk_aclk_cored=
.clk,
> - =A0 =A0 =A0 },
> - =A0 =A0 =A0 .reg_div =A0 =A0 =A0 =A0=3D { .reg =3D S5P_CLKDIV_CORE0, .s=
hift =3D 20, .size =3D 3 },
> -};
> -
> -static struct clksrc_clk clk_aclk_acp =3D {
> - =A0 =A0 =A0 .clk =A0 =A0=3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "aclk_acp",
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .id =A0 =A0 =A0 =A0 =A0 =A0 =3D -1,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .parent =A0 =A0 =A0 =A0 =3D &clk_mout_coreb=
us.clk,
> - =A0 =A0 =A0 },
> - =A0 =A0 =A0 .reg_div =A0 =A0 =A0 =A0=3D { .reg =3D S5P_CLKDIV_CORE0, .s=
hift =3D 0, .size =3D 3 },
> -};
> -
> -static struct clksrc_clk clk_pclk_acp =3D {
> - =A0 =A0 =A0 .clk =A0 =A0=3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "pclk_acp",
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .id =A0 =A0 =A0 =A0 =A0 =A0 =3D -1,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .parent =A0 =A0 =A0 =A0 =3D &clk_aclk_acp.c=
lk,
> - =A0 =A0 =A0 },
> - =A0 =A0 =A0 .reg_div =A0 =A0 =A0 =A0=3D { .reg =3D S5P_CLKDIV_CORE0, .s=
hift =3D 4, .size =3D 3 },
> -};
> -
> =A0/* Core list of CMU_TOP side */
>
> =A0static struct clk *clkset_aclk_top_list[] =3D {
> @@ -416,18 +326,8 @@ static struct clksrc_clk *sysclks[] =3D {
> =A0 =A0 =A0 =A0&clk_moutcore,
> =A0 =A0 =A0 =A0&clk_coreclk,
> =A0 =A0 =A0 =A0&clk_armclk,
> - =A0 =A0 =A0 &clk_aclk_corem0,
> - =A0 =A0 =A0 &clk_aclk_cores,
> - =A0 =A0 =A0 &clk_aclk_corem1,
> - =A0 =A0 =A0 &clk_periphclk,
> - =A0 =A0 =A0 &clk_atclk,
> - =A0 =A0 =A0 &clk_pclk_dbg,
> =A0 =A0 =A0 =A0&clk_mout_corebus,
> =A0 =A0 =A0 =A0&clk_sclk_dmc,
> - =A0 =A0 =A0 &clk_aclk_cored,
> - =A0 =A0 =A0 &clk_aclk_corep,
> - =A0 =A0 =A0 &clk_aclk_acp,
> - =A0 =A0 =A0 &clk_pclk_acp,
> =A0 =A0 =A0 =A0&clk_vpllsrc,
> =A0 =A0 =A0 =A0&clk_sclk_vpll,
> =A0 =A0 =A0 =A0&clk_aclk_200,
> @@ -446,15 +346,7 @@ void __init_or_cpufreq s5pv310_setup_clocks(void)
> =A0 =A0 =A0 =A0unsigned long vpllsrc;
> =A0 =A0 =A0 =A0unsigned long xtal;
> =A0 =A0 =A0 =A0unsigned long armclk;
> - =A0 =A0 =A0 unsigned long aclk_corem0;
> - =A0 =A0 =A0 unsigned long aclk_cores;
> - =A0 =A0 =A0 unsigned long aclk_corem1;
> - =A0 =A0 =A0 unsigned long periphclk;
> =A0 =A0 =A0 =A0unsigned long sclk_dmc;
> - =A0 =A0 =A0 unsigned long aclk_cored;
> - =A0 =A0 =A0 unsigned long aclk_corep;
> - =A0 =A0 =A0 unsigned long aclk_acp;
> - =A0 =A0 =A0 unsigned long pclk_acp;
> =A0 =A0 =A0 =A0unsigned int ptr;
>
> =A0 =A0 =A0 =A0printk(KERN_DEBUG "%s: registering clocks\n", __func__);
> @@ -485,26 +377,12 @@ void __init_or_cpufreq s5pv310_setup_clocks(void)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0apll, mpll, epll, vpll);
>
> =A0 =A0 =A0 =A0armclk =3D clk_get_rate(&clk_armclk.clk);
> - =A0 =A0 =A0 aclk_corem0 =3D clk_get_rate(&clk_aclk_corem0.clk);
> - =A0 =A0 =A0 aclk_cores =3D clk_get_rate(&clk_aclk_cores.clk);
> - =A0 =A0 =A0 aclk_corem1 =3D clk_get_rate(&clk_aclk_corem1.clk);
> - =A0 =A0 =A0 periphclk =3D clk_get_rate(&clk_periphclk.clk);
> =A0 =A0 =A0 =A0sclk_dmc =3D clk_get_rate(&clk_sclk_dmc.clk);
> - =A0 =A0 =A0 aclk_cored =3D clk_get_rate(&clk_aclk_cored.clk);
> - =A0 =A0 =A0 aclk_corep =3D clk_get_rate(&clk_aclk_corep.clk);
> - =A0 =A0 =A0 aclk_acp =3D clk_get_rate(&clk_aclk_acp.clk);
> - =A0 =A0 =A0 pclk_acp =3D clk_get_rate(&clk_pclk_acp.clk);
> -
> - =A0 =A0 =A0 printk(KERN_INFO "S5PV310: ARMCLK=3D%ld, COREM0=3D%ld, CORE=
S=3D%ld\n"
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"COREM1=3D%ld, PERI=3D%l=
d, DMC=3D%ld, CORED=3D%ld\n"
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"COREP=3D%ld, ACLK_ACP=
=3D%ld, PCLK_ACP=3D%ld",
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 armclk, aclk_corem0, aclk_c=
ores, aclk_corem1,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 periphclk, sclk_dmc, aclk_c=
ored, aclk_corep,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 aclk_acp, pclk_acp);
> +
> + =A0 =A0 =A0 printk(KERN_INFO "S5PV310: ARMCLK=3D%ld, DMC=3D%ld\n", armc=
lk, sclk_dmc);
>
> =A0 =A0 =A0 =A0clk_f.rate =3D armclk;
> =A0 =A0 =A0 =A0clk_h.rate =3D sclk_dmc;
> - =A0 =A0 =A0 clk_p.rate =3D periphclk;
>
> =A0 =A0 =A0 =A0for (ptr =3D 0; ptr < ARRAY_SIZE(clksrcs); ptr++)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0s3c_set_clksrc(&clksrcs[ptr], true);
> --
> 1.6.2.5
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>



-- =

MyungJoo Ham, Ph.D.
Mobile Software Platform Lab,
Digital Media and Communications (DMC) Business
Samsung Electronics
cell: 82-10-6714-2858
