From: MyungJoo Ham <myungjoo.ham@samsung.com>
Subject: Re: [PATCH 2/3] ARM: EXYNOS4: Suspend to RAM Support
Date: Wed, 9 Mar 2011 14:42:55 +0900
Message-ID: <AANLkTikNu89XxoZ70PVH1MPXA7FBOGaiViovxmO7=t_E@mail.gmail.com>
References: <1299636521-4831-1-git-send-email-jc.lee@samsung.com>
	<1299636521-4831-3-git-send-email-jc.lee@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:50178 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750980Ab1CIFm5 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 9 Mar 2011 00:42:57 -0500
Received: by fxm17 with SMTP id 17so165458fxm.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 08 Mar 2011 21:42:56 -0800 (PST)
In-Reply-To: <1299636521-4831-3-git-send-email-jc.lee@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jaecheol Lee <jc.lee@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, ben-linux@fluff.org, =?UTF-8?B?7ZWo66qF7KO8?= <myungjoo.ham@gmail.com>

On Wed, Mar 9, 2011 at 11:08 AM, Jaecheol Lee <jc.lee@samsung.com> wrot=
e:
> This patch adds support suspend to ram for EXYNOS4210.
> As a note, this includes function of outer cache flush
> because it is used before entering PM.
>
> Signed-off-by: Jaecheol Lee <jc.lee@samsung.com>
> ---
> =C2=A0arch/arm/mach-exynos4/Makefile =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A01 +
> =C2=A0arch/arm/mach-exynos4/include/mach/pm-core.h =C2=A0 =C2=A0| =C2=
=A0 50 +++
> =C2=A0arch/arm/mach-exynos4/include/mach/regs-clock.h | =C2=A0 =C2=A0=
9 +-
> =C2=A0arch/arm/mach-exynos4/pm.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0419 +++++++++++++++++++++=
++
> =C2=A0arch/arm/mach-exynos4/sleep.S =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0171 +++++++++
> =C2=A0arch/arm/plat-samsung/include/plat/cpu.h =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| =C2=A0 =C2=A01 +
> =C2=A0arch/arm/plat-samsung/pm.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A03 +
> =C2=A07 files changed, 652 insertions(+), 2 deletions(-)
> =C2=A0create mode 100644 arch/arm/mach-exynos4/include/mach/pm-core.h
> =C2=A0create mode 100644 arch/arm/mach-exynos4/pm.c
> =C2=A0create mode 100644 arch/arm/mach-exynos4/sleep.S
>
> diff --git a/arch/arm/mach-exynos4/Makefile b/arch/arm/mach-exynos4/M=
akefile
[]

> diff --git a/arch/arm/mach-exynos4/include/mach/pm-core.h b/arch/arm/=
mach-exynos4/include/mach/pm-core.h
[]

> diff --git a/arch/arm/mach-exynos4/include/mach/regs-clock.h b/arch/a=
rm/mach-exynos4/include/mach/regs-clock.h
[]

> diff --git a/arch/arm/mach-exynos4/pm.c b/arch/arm/mach-exynos4/pm.c
> new file mode 100644
> index 0000000..fb5065b
> --- /dev/null
> +++ b/arch/arm/mach-exynos4/pm.c
[]

> +       { .reg =3D S5P_PCIE_MEM_LOWPWR                    , .val =3D =
0x0, },
> +       { .reg =3D S5P_SATA_MEM_LOWPWR                    , .val =3D =
0x0, },
> +       { .reg =3D S5P_PAD_RETENTION_DRAM_LOWPWR          , .val =3D =
0x0, },
> +       { .reg =3D S5P_PAD_RETENTION_MAUDIO_LOWPWR        , .val =3D =
0x0, },

Probably, it's ok to choose not to write codes for exceptions of some
chip revisions, in EVT 1.0 (tested and not applied in EVT0, not tested
in EVT1.1), we had to set S5P_PAD_RETENTION_MAUDIO_LOWPWR 0x1.
Otherwise, the sound didn't work after an instance of resume (which
worked in EVT0)


[]

> +
> +static struct sleep_save exynos4_core_save[] =3D {
> + =C2=A0 =C2=A0 =C2=A0 /* CMU side */
> + =C2=A0 =C2=A0 =C2=A0 SAVE_ITEM(S5P_CLKDIV_LEFTBUS),
> + =C2=A0 =C2=A0 =C2=A0 SAVE_ITEM(S5P_CLKDIV_RIGHTBUS),
=2E..
> + =C2=A0 =C2=A0 =C2=A0 SAVE_ITEM(S5P_CLKDIV_CPU),
> + =C2=A0 =C2=A0 =C2=A0 SAVE_ITEM(S5P_CLKGATE_SCLKCPU),

In this list, how about adding the following CMU registers for core_sav=
e[]?
S5P_CLKSRC_LEFTBUS,
S5P_CLKGATE_IP_LEFTBUS,
S5P_CLKOUT_CMU_LEFTBUS,
S5P_CLKSRC_RIGHTBUS,
S5P_CLKGATE_IP_RIGHTBUS,
S5P_CLKOUT_CMU_RIGHTBUS,
S5P_EPLL_LOCK,
S5P_VPLL_LOCK,
S5P_VPLL_CON0,
S5P_VPLL_CON1,
S5P_CLKSRC_TV,
S5P_CLKSRC_G3D,
S5P_CLKDIV_TV,
S5P_CLKDIV_MFC,
S5P_CLKDIV_G3D,
S5P_CLKSRC_MASK_CAM,
S5P_CLKDIV2_RATIO,
S5P_CLKGATE_IP_TV,
S5P_CLKGATE_IP_G3D,
S5P_CLKGATE_IP_GPS,
S5P_CLKGATE_BLOCK,
S5P_CLKOUT_CMU_TOP,
S5P_CLKDIV_DMC1,
S5P_CLKGATE_IP_DMC,
S5P_CLKOUT_CMU_DMC,
S5P_APLL_LOCK,
S5P_MPLL_LOCK,
S5P_APLL_CON0,
S5P_APLL_CON1,
S5P_MPLL_CON0,
S5P_MPLL_CON1,
S5P_CLKDIV_CPU1,
S5P_CLKGATE_IP_CPU,
S5P_CLKOUT_CMU_CPU,

and some of PMU registers (mainly "CONTROL" and "CONFIGURATION" registe=
rs)?

> +
> + =C2=A0 =C2=A0 =C2=A0 /* GIC side */
> + =C2=A0 =C2=A0 =C2=A0 SAVE_ITEM(S5P_VA_GIC_CPU + 0x000),
> + =C2=A0 =C2=A0 =C2=A0 SAVE_ITEM(S5P_VA_GIC_CPU + 0x004),
> + =C2=A0 =C2=A0 =C2=A0 SAVE_ITEM(S5P_VA_GIC_CPU + 0x008),
> + =C2=A0 =C2=A0 =C2=A0 SAVE_ITEM(S5P_VA_GIC_CPU + 0x00C),
> + =C2=A0 =C2=A0 =C2=A0 SAVE_ITEM(S5P_VA_GIC_CPU + 0x014),
> + =C2=A0 =C2=A0 =C2=A0 SAVE_ITEM(S5P_VA_GIC_CPU + 0x018),
> + =C2=A0 =C2=A0 =C2=A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x000),
> + =C2=A0 =C2=A0 =C2=A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x004),
> + =C2=A0 =C2=A0 =C2=A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x100),
> + =C2=A0 =C2=A0 =C2=A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x104),
> + =C2=A0 =C2=A0 =C2=A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x108),
> + =C2=A0 =C2=A0 =C2=A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x300),
> + =C2=A0 =C2=A0 =C2=A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x304),
> + =C2=A0 =C2=A0 =C2=A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x308),
> + =C2=A0 =C2=A0 =C2=A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x400),
> + =C2=A0 =C2=A0 =C2=A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x404),
> + =C2=A0 =C2=A0 =C2=A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x408),
> + =C2=A0 =C2=A0 =C2=A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x40C),
> + =C2=A0 =C2=A0 =C2=A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x410),
> + =C2=A0 =C2=A0 =C2=A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x414),
> + =C2=A0 =C2=A0 =C2=A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x418),
> + =C2=A0 =C2=A0 =C2=A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x41C),
> + =C2=A0 =C2=A0 =C2=A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x420),
> + =C2=A0 =C2=A0 =C2=A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x424),
> + =C2=A0 =C2=A0 =C2=A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x428),
> + =C2=A0 =C2=A0 =C2=A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x42C),
> + =C2=A0 =C2=A0 =C2=A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x430),
> + =C2=A0 =C2=A0 =C2=A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x434),
> + =C2=A0 =C2=A0 =C2=A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x438),
> + =C2=A0 =C2=A0 =C2=A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x43C),
> + =C2=A0 =C2=A0 =C2=A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x440),
> + =C2=A0 =C2=A0 =C2=A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x444),
> + =C2=A0 =C2=A0 =C2=A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x448),
> + =C2=A0 =C2=A0 =C2=A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x44C),
> + =C2=A0 =C2=A0 =C2=A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x450),
> + =C2=A0 =C2=A0 =C2=A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x454),
> + =C2=A0 =C2=A0 =C2=A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x458),
> + =C2=A0 =C2=A0 =C2=A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x45C),
> +
> + =C2=A0 =C2=A0 =C2=A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x800),
> + =C2=A0 =C2=A0 =C2=A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x804),
> + =C2=A0 =C2=A0 =C2=A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x808),
> + =C2=A0 =C2=A0 =C2=A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x80C),
> + =C2=A0 =C2=A0 =C2=A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x810),
> + =C2=A0 =C2=A0 =C2=A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x814),
> + =C2=A0 =C2=A0 =C2=A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x818),
> + =C2=A0 =C2=A0 =C2=A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x81C),
> + =C2=A0 =C2=A0 =C2=A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x820),
> + =C2=A0 =C2=A0 =C2=A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x824),
> + =C2=A0 =C2=A0 =C2=A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x828),
> + =C2=A0 =C2=A0 =C2=A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x82C),
> + =C2=A0 =C2=A0 =C2=A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x830),
> + =C2=A0 =C2=A0 =C2=A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x834),
> + =C2=A0 =C2=A0 =C2=A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x838),
> + =C2=A0 =C2=A0 =C2=A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x83C),
> + =C2=A0 =C2=A0 =C2=A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x840),
> + =C2=A0 =C2=A0 =C2=A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x844),
> + =C2=A0 =C2=A0 =C2=A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x848),
> + =C2=A0 =C2=A0 =C2=A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x84C),
> + =C2=A0 =C2=A0 =C2=A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x850),
> + =C2=A0 =C2=A0 =C2=A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x854),
> + =C2=A0 =C2=A0 =C2=A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x858),
> + =C2=A0 =C2=A0 =C2=A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x85C),
> +
> + =C2=A0 =C2=A0 =C2=A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0xC00),
> + =C2=A0 =C2=A0 =C2=A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0xC04),
> + =C2=A0 =C2=A0 =C2=A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0xC08),
> + =C2=A0 =C2=A0 =C2=A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0xC0C),
> + =C2=A0 =C2=A0 =C2=A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0xC10),
> + =C2=A0 =C2=A0 =C2=A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0xC14),
> +
> + =C2=A0 =C2=A0 =C2=A0 SAVE_ITEM(S5P_VA_COMBINER_BASE + 0x000),
> + =C2=A0 =C2=A0 =C2=A0 SAVE_ITEM(S5P_VA_COMBINER_BASE + 0x010),
> + =C2=A0 =C2=A0 =C2=A0 SAVE_ITEM(S5P_VA_COMBINER_BASE + 0x020),
> + =C2=A0 =C2=A0 =C2=A0 SAVE_ITEM(S5P_VA_COMBINER_BASE + 0x030),
> + =C2=A0 =C2=A0 =C2=A0 SAVE_ITEM(S5P_VA_COMBINER_BASE + 0x040),
> + =C2=A0 =C2=A0 =C2=A0 SAVE_ITEM(S5P_VA_COMBINER_BASE + 0x050),
> + =C2=A0 =C2=A0 =C2=A0 SAVE_ITEM(S5P_VA_COMBINER_BASE + 0x060),
> + =C2=A0 =C2=A0 =C2=A0 SAVE_ITEM(S5P_VA_COMBINER_BASE + 0x070),
> + =C2=A0 =C2=A0 =C2=A0 SAVE_ITEM(S5P_VA_COMBINER_BASE + 0x080),
> + =C2=A0 =C2=A0 =C2=A0 SAVE_ITEM(S5P_VA_COMBINER_BASE + 0x090),
> +};
> +
> +static struct sleep_save exynos4_l2cc_save[] =3D {
> + =C2=A0 =C2=A0 =C2=A0 SAVE_ITEM(S5P_VA_L2CC + L2X0_TAG_LATENCY_CTRL)=
,
> + =C2=A0 =C2=A0 =C2=A0 SAVE_ITEM(S5P_VA_L2CC + L2X0_DATA_LATENCY_CTRL=
),
> + =C2=A0 =C2=A0 =C2=A0 SAVE_ITEM(S5P_VA_L2CC + L2X0_PREFETCH_CTRL),
> + =C2=A0 =C2=A0 =C2=A0 SAVE_ITEM(S5P_VA_L2CC + L2X0_POWER_CTRL),
> + =C2=A0 =C2=A0 =C2=A0 SAVE_ITEM(S5P_VA_L2CC + L2X0_AUX_CTRL),
> +};
> +
> +void exynos4_cpu_suspend(void)
> +{
> + =C2=A0 =C2=A0 =C2=A0 unsigned long tmp;
> + =C2=A0 =C2=A0 =C2=A0 unsigned long mask =3D 0xFFFFFFFF;
> +
> + =C2=A0 =C2=A0 =C2=A0 /* Before enter central sequence mode, clock s=
rc register have to set */
> +
> + =C2=A0 =C2=A0 =C2=A0 s3c_pm_do_restore_core(exynos4_set_clksrc, ARR=
AY_SIZE(exynos4_set_clksrc));
> +
> + =C2=A0 =C2=A0 =C2=A0 /* Setting Central Sequence Register for power=
 down mode */
> +
> + =C2=A0 =C2=A0 =C2=A0 tmp =3D __raw_readl(S5P_CENTRAL_SEQ_CONFIGURAT=
ION);
> + =C2=A0 =C2=A0 =C2=A0 tmp &=3D ~(S5P_CENTRAL_LOWPWR_CFG);
> + =C2=A0 =C2=A0 =C2=A0 __raw_writel(tmp, S5P_CENTRAL_SEQ_CONFIGURATIO=
N);
> +
> + =C2=A0 =C2=A0 =C2=A0 /* Setting Central Sequence option Register */
> +
> + =C2=A0 =C2=A0 =C2=A0 tmp =3D __raw_readl(S5P_CENTRAL_SEQ_OPTION);
> + =C2=A0 =C2=A0 =C2=A0 tmp &=3D ~(S5P_USE_MASK);
> + =C2=A0 =C2=A0 =C2=A0 tmp |=3D S5P_USE_STANDBY_WFI0;
> + =C2=A0 =C2=A0 =C2=A0 __raw_writel(tmp, S5P_CENTRAL_SEQ_OPTION);
> +
> + =C2=A0 =C2=A0 =C2=A0 /* Clear all interrupt pending to avoid early =
wakeup */
> +
> + =C2=A0 =C2=A0 =C2=A0 __raw_writel(mask, (S5P_VA_GIC_DIST + 0x280));
> + =C2=A0 =C2=A0 =C2=A0 __raw_writel(mask, (S5P_VA_GIC_DIST + 0x284));
> + =C2=A0 =C2=A0 =C2=A0 __raw_writel(mask, (S5P_VA_GIC_DIST + 0x288));
> +
> + =C2=A0 =C2=A0 =C2=A0 /* Disable all interrupt */
> +
> + =C2=A0 =C2=A0 =C2=A0 __raw_writel(0x0, (S5P_VA_GIC_CPU + 0x000));
> + =C2=A0 =C2=A0 =C2=A0 __raw_writel(0x0, (S5P_VA_GIC_DIST + 0x000));
> + =C2=A0 =C2=A0 =C2=A0 __raw_writel(mask, (S5P_VA_GIC_DIST + 0x184));
> + =C2=A0 =C2=A0 =C2=A0 __raw_writel(mask, (S5P_VA_GIC_DIST + 0x188));
> +
> + =C2=A0 =C2=A0 =C2=A0 /* issue the standby signal into the pm unit. =
*/
> + =C2=A0 =C2=A0 =C2=A0 cpu_do_idle();
> +
> + =C2=A0 =C2=A0 =C2=A0 /* we should never get past here */
> + =C2=A0 =C2=A0 =C2=A0 panic("sleep resumed to originator?");
> +}

You may need to ensure EPLL and VPLL are ON when you entering sleep.
When I've tested with "NURI" board, it was ok to turn them off while
the system is running; however, when entering a suspend-to-RAM, they
should be turned on.

> +
> +static void exynos4_pm_prepare(void)
> +{
> + =C2=A0 =C2=A0 =C2=A0 u32 tmp;
> +
> + =C2=A0 =C2=A0 =C2=A0 s3c_pm_do_save(exynos4_core_save, ARRAY_SIZE(e=
xynos4_core_save));
> + =C2=A0 =C2=A0 =C2=A0 s3c_pm_do_save(exynos4_l2cc_save, ARRAY_SIZE(e=
xynos4_l2cc_save));
> +
> + =C2=A0 =C2=A0 =C2=A0 tmp =3D __raw_readl(S5P_INFORM1);
> +
> + =C2=A0 =C2=A0 =C2=A0 /* Set value of power down register for sleep =
mode */
> +
> + =C2=A0 =C2=A0 =C2=A0 s3c_pm_do_restore_core(exynos4_sleep, ARRAY_SI=
ZE(exynos4_sleep));
> + =C2=A0 =C2=A0 =C2=A0 __raw_writel(S5P_CHECK_SLEEP, S5P_INFORM1);
> +
> + =C2=A0 =C2=A0 =C2=A0 /* ensure at least INFORM0 has the resume addr=
ess */
> +
> + =C2=A0 =C2=A0 =C2=A0 __raw_writel(virt_to_phys(s3c_cpu_resume), S5P=
_INFORM0);
> +}
> +
> +static int exynos4_pm_add(struct sys_device *sysdev)
> +{
> + =C2=A0 =C2=A0 =C2=A0 pm_cpu_prep =3D exynos4_pm_prepare;
> + =C2=A0 =C2=A0 =C2=A0 pm_cpu_sleep =3D exynos4_cpu_suspend;
> +
> + =C2=A0 =C2=A0 =C2=A0 return 0;
> +}
> +
> +/* This function copy from linux/arch/arm/kernel/smp_scu.c */
> +
> +void exynos4_scu_enable(void __iomem *scu_base)
> +{
> + =C2=A0 =C2=A0 =C2=A0 u32 scu_ctrl;
> +
> + =C2=A0 =C2=A0 =C2=A0 scu_ctrl =3D __raw_readl(scu_base);
> + =C2=A0 =C2=A0 =C2=A0 /* already enabled? */
> + =C2=A0 =C2=A0 =C2=A0 if (scu_ctrl & 1)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;
> +
> + =C2=A0 =C2=A0 =C2=A0 scu_ctrl |=3D 1;
> + =C2=A0 =C2=A0 =C2=A0 __raw_writel(scu_ctrl, scu_base);
> +
> + =C2=A0 =C2=A0 =C2=A0 /*
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0* Ensure that the data accessed by CPU0 =
before the SCU was
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0* initialised is visible to the other CP=
Us.
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0*/
> + =C2=A0 =C2=A0 =C2=A0 flush_cache_all();
> +}
> +
> +static int exynos4_pm_resume(struct sys_device *dev)
> +{
> + =C2=A0 =C2=A0 =C2=A0 unsigned int tmp;
> + =C2=A0 =C2=A0 =C2=A0 unsigned long mask =3D 0xFFFFFFFF;
> +
> + =C2=A0 =C2=A0 =C2=A0 /* For release retention */
> +
> + =C2=A0 =C2=A0 =C2=A0 __raw_writel((1 << 28), S5P_PAD_RET_GPIO_OPTIO=
N);
> + =C2=A0 =C2=A0 =C2=A0 __raw_writel((1 << 28), S5P_PAD_RET_UART_OPTIO=
N);
> + =C2=A0 =C2=A0 =C2=A0 __raw_writel((1 << 28), S5P_PAD_RET_MMCA_OPTIO=
N);
> + =C2=A0 =C2=A0 =C2=A0 __raw_writel((1 << 28), S5P_PAD_RET_MMCB_OPTIO=
N);
> + =C2=A0 =C2=A0 =C2=A0 __raw_writel((1 << 28), S5P_PAD_RET_EBIA_OPTIO=
N);
> + =C2=A0 =C2=A0 =C2=A0 __raw_writel((1 << 28), S5P_PAD_RET_EBIB_OPTIO=
N);
> +
> + =C2=A0 =C2=A0 =C2=A0 s3c_pm_do_restore_core(exynos4_core_save, ARRA=
Y_SIZE(exynos4_core_save));
> +
> + =C2=A0 =C2=A0 =C2=A0 /* Clear External Interrupt Pending */
> +
> + =C2=A0 =C2=A0 =C2=A0 __raw_writel(mask, S5P_EINT_PEND(0));
> + =C2=A0 =C2=A0 =C2=A0 __raw_writel(mask, S5P_EINT_PEND(1));
> + =C2=A0 =C2=A0 =C2=A0 __raw_writel(mask, S5P_EINT_PEND(2));
> + =C2=A0 =C2=A0 =C2=A0 __raw_writel(mask, S5P_EINT_PEND(3));
> +
> + =C2=A0 =C2=A0 =C2=A0 exynos4_scu_enable(S5P_VA_SCU);
> +
> +#ifdef CONFIG_CACHE_L2X0
> + =C2=A0 =C2=A0 =C2=A0 s3c_pm_do_restore_core(exynos4_l2cc_save, ARRA=
Y_SIZE(exynos4_l2cc_save));
> + =C2=A0 =C2=A0 =C2=A0 outer_cache.inv_all();
> + =C2=A0 =C2=A0 =C2=A0 /* enable L2X0*/
> + =C2=A0 =C2=A0 =C2=A0 writel_relaxed(1, S5P_VA_L2CC + L2X0_CTRL);
> +#endif
> +
> + =C2=A0 =C2=A0 =C2=A0 return 0;
> +}
> +
> +static struct sysdev_driver exynos4_pm_driver =3D {
> + =C2=A0 =C2=A0 =C2=A0 .add =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D exynos4_pm_add,
> + =C2=A0 =C2=A0 =C2=A0 .resume =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D exynos=
4_pm_resume,
> +};
> +
> +static __init int exynos4_pm_drvinit(void)
> +{
> + =C2=A0 =C2=A0 =C2=A0 unsigned int tmp;
> +
> + =C2=A0 =C2=A0 =C2=A0 s3c_pm_init();
> +
> + =C2=A0 =C2=A0 =C2=A0 /* All wakeup disable */
> +
> + =C2=A0 =C2=A0 =C2=A0 tmp =3D __raw_readl(S5P_WAKEUP_MASK);
> + =C2=A0 =C2=A0 =C2=A0 tmp |=3D ((0xFF << 8) | (0x1F << 1));
> + =C2=A0 =C2=A0 =C2=A0 __raw_writel(tmp, S5P_WAKEUP_MASK);
> +
> + =C2=A0 =C2=A0 =C2=A0 return sysdev_driver_register(&exynos4_sysclas=
s, &exynos4_pm_driver);
> +}
> +arch_initcall(exynos4_pm_drvinit);
> diff --git a/arch/arm/mach-exynos4/sleep.S b/arch/arm/mach-exynos4/sl=
eep.S
> new file mode 100644
> index 0000000..dd6d31e
> --- /dev/null
> +++ b/arch/arm/mach-exynos4/sleep.S
> @@ -0,0 +1,171 @@
> +/* linux/arch/arm/mach-exynos4/sleep.S
> + *
> + * Copyright (c) 2011 Samsung Electronics Co., Ltd.
> + * =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 http://www.samsung.com
> + *
> + * EXYNOS4210 power Manager (Suspend-To-RAM) support
> + * Based on S3C2410 sleep code by:
> + * =C2=A0 =C2=A0 Ben Dooks, (c) 2004 Simtec Electronics
> + *
> + * Based on PXA/SA1100 sleep code by:
> + * =C2=A0 =C2=A0 Nicolas Pitre, (c) 2002 Monta Vista Software Inc
> + * =C2=A0 =C2=A0 Cliff Brake, (c) 2001
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License as published=
 by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. =C2=A0See th=
e
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program; if not, write to the Free Software
> + * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA =C2=A002=
111-1307 =C2=A0USA
> +*/
> +
> +#include <linux/linkage.h>
> +#include <asm/assembler.h>
> +#include <asm/memory.h>
> +
> + =C2=A0 =C2=A0 =C2=A0 .text
> +
> + =C2=A0 =C2=A0 =C2=A0 /*
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0* s3c_cpu_save
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0*
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0* entry:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0* =C2=A0 =C2=A0 =C2=A0r0 =3D save addres=
s (virtual addr of s3c_sleep_save_phys)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0*/
> +
> +ENTRY(s3c_cpu_save)
> +
> + =C2=A0 =C2=A0 =C2=A0 stmfd =C2=A0 sp!, { r3 - r12, lr }
> +
> + =C2=A0 =C2=A0 =C2=A0 mrc =C2=A0 =C2=A0 p15, 0, r4, c13, c0, 0 =C2=A0=
@ FCSE/PID
> + =C2=A0 =C2=A0 =C2=A0 mrc =C2=A0 =C2=A0 p15, 0, r5, c3, c0, 0 =C2=A0=
 @ Domain ID
> + =C2=A0 =C2=A0 =C2=A0 mrc =C2=A0 =C2=A0 p15, 0, r6, c2, c0, 0 =C2=A0=
 @ Translation Table BASE0
> + =C2=A0 =C2=A0 =C2=A0 mrc =C2=A0 =C2=A0 p15, 0, r7, c2, c0, 1 =C2=A0=
 @ Translation Table BASE1
> + =C2=A0 =C2=A0 =C2=A0 mrc =C2=A0 =C2=A0 p15, 0, r8, c2, c0, 2 =C2=A0=
 @ Translation Table Control
> + =C2=A0 =C2=A0 =C2=A0 mrc =C2=A0 =C2=A0 p15, 0, r9, c1, c0, 0 =C2=A0=
 @ Control register
> + =C2=A0 =C2=A0 =C2=A0 mrc =C2=A0 =C2=A0 p15, 0, r10, c1, c0, 1 =C2=A0=
@ Auxiliary control register
> + =C2=A0 =C2=A0 =C2=A0 mrc =C2=A0 =C2=A0 p15, 0, r11, c1, c0, 2 =C2=A0=
@ Co-processor access controls
> + =C2=A0 =C2=A0 =C2=A0 mrc =C2=A0 =C2=A0 p15, 0, r12, c10, c2, 0 @ Re=
ad PRRR
> + =C2=A0 =C2=A0 =C2=A0 mrc =C2=A0 =C2=A0 p15, 0, r3, c10, c2, 1 =C2=A0=
@ READ NMRR
> +
> + =C2=A0 =C2=A0 =C2=A0 stmia =C2=A0 r0, { r3 - r13 }
> +
> + =C2=A0 =C2=A0 =C2=A0 bl =C2=A0 =C2=A0 =C2=A0s3c_pm_cb_flushcache
> +
> + =C2=A0 =C2=A0 =C2=A0 ldr =C2=A0 =C2=A0 r0, =3Dpm_cpu_sleep
> + =C2=A0 =C2=A0 =C2=A0 ldr =C2=A0 =C2=A0 r0, [ r0 ]
> + =C2=A0 =C2=A0 =C2=A0 mov =C2=A0 =C2=A0 pc, r0
> +
> +resume_with_mmu:
> + =C2=A0 =C2=A0 =C2=A0 /* After MMU is turned on, restore the previou=
s MMU table */
> + =C2=A0 =C2=A0 =C2=A0 ldr =C2=A0 =C2=A0 r9 , =3D(PAGE_OFFSET - PHYS_=
OFFSET)
> + =C2=A0 =C2=A0 =C2=A0 add =C2=A0 =C2=A0 r4, r4, r9
> + =C2=A0 =C2=A0 =C2=A0 str =C2=A0 =C2=A0 r12, [r4]
> +
> + =C2=A0 =C2=A0 =C2=A0 ldmfd =C2=A0 sp!, { r3 - r12, pc }
> +
> + =C2=A0 =C2=A0 =C2=A0 .ltorg
> +
> + =C2=A0 =C2=A0 =C2=A0 .data
> +
> + =C2=A0 =C2=A0 =C2=A0 .global s3c_sleep_save_phys
> +s3c_sleep_save_phys:
> + =C2=A0 =C2=A0 =C2=A0 .word =C2=A0 0
> +
> + =C2=A0 =C2=A0 =C2=A0 /*
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0* sleep magic, to allow the bootloader t=
o check for an valid
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0* image to resume to. Must be the first =
word before the
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0* s3c_cpu_resume entry.
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0*/
> +
> + =C2=A0 =C2=A0 =C2=A0 .word =C2=A0 0x2bedf00d
> +
> + =C2=A0 =C2=A0 =C2=A0 /*
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0* s3c_cpu_resume
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0*
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0* resume code entry for bootloader to ca=
ll
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0*
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0* we must put this code here in the data=
 segment as we have no
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0* other way of restoring the stack point=
er after sleep, and we
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0* must not write to the code segment (co=
de is read-only)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0*/
> +
> +ENTRY(s3c_cpu_resume)
> + =C2=A0 =C2=A0 =C2=A0 mov =C2=A0 =C2=A0 r0, #PSR_I_BIT | PSR_F_BIT |=
 SVC_MODE
> + =C2=A0 =C2=A0 =C2=A0 msr =C2=A0 =C2=A0 cpsr_c, r0
> +
> + =C2=A0 =C2=A0 =C2=A0 mov =C2=A0 =C2=A0 r1, #0
> + =C2=A0 =C2=A0 =C2=A0 mcr =C2=A0 =C2=A0 p15, 0, r1, c8, c7, 0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 @ invalidate TLBs
> + =C2=A0 =C2=A0 =C2=A0 mcr =C2=A0 =C2=A0 p15, 0, r1, c7, c5, 0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 @ invalidate I Cache
> +
> + =C2=A0 =C2=A0 =C2=A0 ldr =C2=A0 =C2=A0 r0, s3c_sleep_save_phys =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 @ address of restore block
> + =C2=A0 =C2=A0 =C2=A0 ldmia =C2=A0 r0, { r3 - r13 }
> +
> + =C2=A0 =C2=A0 =C2=A0 mcr =C2=A0 =C2=A0 p15, 0, r4, c13, c0, 0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0@ FCSE/PID
> + =C2=A0 =C2=A0 =C2=A0 mcr =C2=A0 =C2=A0 p15, 0, r5, c3, c0, 0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 @ Domain ID
> +
> + =C2=A0 =C2=A0 =C2=A0 mcr =C2=A0 =C2=A0 p15, 0, r8, c2, c0, 2 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 @ Translation Table Control
> + =C2=A0 =C2=A0 =C2=A0 mcr =C2=A0 =C2=A0 p15, 0, r7, c2, c0, 1 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 @ Translation Table BASE1
> + =C2=A0 =C2=A0 =C2=A0 mcr =C2=A0 =C2=A0 p15, 0, r6, c2, c0, 0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 @ Translation Table BASE0
> +
> + =C2=A0 =C2=A0 =C2=A0 mcr =C2=A0 =C2=A0 p15, 0, r10, c1, c0, 1 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0@ Auxiliary control register
> +
> + =C2=A0 =C2=A0 =C2=A0 mov =C2=A0 =C2=A0 r0, #0
> + =C2=A0 =C2=A0 =C2=A0 mcr =C2=A0 =C2=A0 p15, 0, r0, c8, c7, 0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 @ Invalidate I & D TLB
> +
> + =C2=A0 =C2=A0 =C2=A0 mov =C2=A0 =C2=A0 r0, #0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0@ =
restore copro access
> + =C2=A0 =C2=A0 =C2=A0 mcr =C2=A0 =C2=A0 p15, 0, r11, c1, c0, 2 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0@ Co-processor access
> + =C2=A0 =C2=A0 =C2=A0 mcr =C2=A0 =C2=A0 p15, 0, r0, c7, c5, 4
> +
> + =C2=A0 =C2=A0 =C2=A0 mcr =C2=A0 =C2=A0 p15, 0, r12, c10, c2, 0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 @ write PRRR
> + =C2=A0 =C2=A0 =C2=A0 mcr =C2=A0 =C2=A0 p15, 0, r3, c10, c2, 1 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0@ write NMRR
> +
> + =C2=A0 =C2=A0 =C2=A0 /*
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0* In Cortex-A8, when MMU is turned on, t=
he pipeline is flushed.
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0* And there are no valid entries in the =
MMU table at this point.
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0* So before turning on the MMU, the MMU =
entry for the DRAM address
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0* range is added. After the MMU is turne=
d on, the other entries
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0* in the MMU table will be restored.
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0*/
> +
> + =C2=A0 =C2=A0 =C2=A0 /* r6 =3D Translation Table BASE0 */
> + =C2=A0 =C2=A0 =C2=A0 mov =C2=A0 =C2=A0 r4, r6
> + =C2=A0 =C2=A0 =C2=A0 mov =C2=A0 =C2=A0 r4, r4, LSR #14
> + =C2=A0 =C2=A0 =C2=A0 mov =C2=A0 =C2=A0 r4, r4, LSL #14
> +
> + =C2=A0 =C2=A0 =C2=A0 /* Load address for adding to MMU table list *=
/
> + =C2=A0 =C2=A0 =C2=A0 ldr =C2=A0 =C2=A0 r11, =3D0x10020800 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0@ INFORM0 reg.
> + =C2=A0 =C2=A0 =C2=A0 ldr =C2=A0 =C2=A0 r10, [r11, #0]
> + =C2=A0 =C2=A0 =C2=A0 mov =C2=A0 =C2=A0 r10, r10, LSR #18
> + =C2=A0 =C2=A0 =C2=A0 bic =C2=A0 =C2=A0 r10, r10, #0x3
> + =C2=A0 =C2=A0 =C2=A0 orr =C2=A0 =C2=A0 r4, r4, r10
> +
> + =C2=A0 =C2=A0 =C2=A0 /* Calculate MMU table entry */
> + =C2=A0 =C2=A0 =C2=A0 mov =C2=A0 =C2=A0 r10, r10, LSL #18
> + =C2=A0 =C2=A0 =C2=A0 ldr =C2=A0 =C2=A0 r5, =3D0x40E
> + =C2=A0 =C2=A0 =C2=A0 orr =C2=A0 =C2=A0 r10, r10, r5
> +
> + =C2=A0 =C2=A0 =C2=A0 /* Back up originally data */
> + =C2=A0 =C2=A0 =C2=A0 ldr =C2=A0 =C2=A0 r12, [r4]
> +
> + =C2=A0 =C2=A0 =C2=A0 /* Add calculated MMU table entry into MMU tab=
le list */
> + =C2=A0 =C2=A0 =C2=A0 str =C2=A0 =C2=A0 r10, [r4]
> +
> + =C2=A0 =C2=A0 =C2=A0 ldr =C2=A0 =C2=A0 r2, =3Dresume_with_mmu
> + =C2=A0 =C2=A0 =C2=A0 mcr =C2=A0 =C2=A0 p15, 0, r9, c1, c0, 0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 @ turn on MMU, etc
> +
> + =C2=A0 =C2=A0 =C2=A0 nop
> + =C2=A0 =C2=A0 =C2=A0 nop
> + =C2=A0 =C2=A0 =C2=A0 nop
> + =C2=A0 =C2=A0 =C2=A0 nop
> + =C2=A0 =C2=A0 =C2=A0 nop =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 @ second-to-last before mmu
> +
> + =C2=A0 =C2=A0 =C2=A0 mov =C2=A0 =C2=A0 pc, r2 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0@ =
go back to virtual address
> +
> + =C2=A0 =C2=A0 =C2=A0 .ltorg
> diff --git a/arch/arm/plat-samsung/include/plat/cpu.h b/arch/arm/plat=
-samsung/include/plat/cpu.h
> index 9addb3d..cedfff5 100644
> --- a/arch/arm/plat-samsung/include/plat/cpu.h
> +++ b/arch/arm/plat-samsung/include/plat/cpu.h
> @@ -82,6 +82,7 @@ extern struct sysdev_class s3c64xx_sysclass;
> =C2=A0extern struct sysdev_class s5p64x0_sysclass;
> =C2=A0extern struct sysdev_class s5p6442_sysclass;
> =C2=A0extern struct sysdev_class s5pv210_sysclass;
> +extern struct sysdev_class exynos4_sysclass;
>
> =C2=A0extern void (*s5pc1xx_idle)(void);
>
> diff --git a/arch/arm/plat-samsung/pm.c b/arch/arm/plat-samsung/pm.c
> index 02d531f..c24b6c2 100644
> --- a/arch/arm/plat-samsung/pm.c
> +++ b/arch/arm/plat-samsung/pm.c
> @@ -340,6 +340,9 @@ static int s3c_pm_enter(suspend_state_t state)
> =C2=A0void s3c_pm_cb_flushcache(void)
> =C2=A0{
> =C2=A0 =C2=A0 =C2=A0 =C2=A0flush_cache_all();
> +#ifdef CONFIG_OUTER_CACHE
> + =C2=A0 =C2=A0 =C2=A0 outer_flush_all();
> +#endif
> =C2=A0}
>
> =C2=A0static int s3c_pm_prepare(void)
> --
> 1.7.1
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
