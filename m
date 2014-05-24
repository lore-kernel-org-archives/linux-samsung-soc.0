From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH] ARM: exynos: Fix kernel panic when unplugging CPU1 on
 4210
Date: Sat, 24 May 2014 19:31:40 +0200
Message-ID: <5380D77C.2020104@linaro.org>
References: <537FBE42.7050608@gmail.com> <1400952255-13750-1-git-send-email-daniel.lezcano@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f176.google.com ([74.125.82.176]:41402 "EHLO
	mail-we0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751231AbaEXRb1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 24 May 2014 13:31:27 -0400
Received: by mail-we0-f176.google.com with SMTP id q59so6272382wes.35
        for <linux-samsung-soc@vger.kernel.org>; Sat, 24 May 2014 10:31:25 -0700 (PDT)
In-Reply-To: <1400952255-13750-1-git-send-email-daniel.lezcano@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com, tomasz.figa@gmail.com
Cc: linux-samsung-soc@vger.kernel.org, rjw@rjwysocki.net, linaro-kernel@lists.linaro.org, linux-arm-kernel@lists.infradead.org, arnd.bergmann@linaro.org, sachin.kamat@linaro.org, heiko@sntech.de

On 05/24/2014 07:24 PM, Daniel Lezcano wrote:
> A look at the code reveals use of S5P_VA_SYSRAM macro, in case of cer=
tain SoC
> revisions, which is not valid any longer, after SYSRAM started to be =
mapped
> dynamically. The new dynamic mapping is stored in sysram_base_addr va=
riable,
> which is declared static in platsmp.c
>
> This fix makes sysram_base_addr non-static, declared it in common.h a=
nd used
> in pm.c instead of S5P_VA_SYSRAM.
>
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> Suggested-by: Tomasz Figa <t.figa@samsung.com>

Hi Kukjin,

with this fix I confirm cpuidle is working well with the AFTR state on=20
the exynos 4210.

Regards
   -- Daniel

> ---
>   arch/arm/mach-exynos/common.h  |    1 +
>   arch/arm/mach-exynos/platsmp.c |    2 +-
>   arch/arm/mach-exynos/pm.c      |    4 ++--
>   3 files changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm/mach-exynos/common.h b/arch/arm/mach-exynos/com=
mon.h
> index e2d0954..a012bc1 100644
> --- a/arch/arm/mach-exynos/common.h
> +++ b/arch/arm/mach-exynos/common.h
> @@ -88,6 +88,7 @@ void mct_init(void __iomem *base, int irq_g0, int i=
rq_l0, int irq_l1);
>
>   struct map_desc;
>   extern void __iomem *sysram_ns_base_addr;
> +extern void __iomem *sysram_base_addr;
>   void exynos_init_io(void);
>   void exynos_restart(enum reboot_mode mode, const char *cmd);
>   void exynos_cpuidle_init(void);
> diff --git a/arch/arm/mach-exynos/platsmp.c b/arch/arm/mach-exynos/pl=
atsmp.c
> index 9c16da2..f2bea78 100644
> --- a/arch/arm/mach-exynos/platsmp.c
> +++ b/arch/arm/mach-exynos/platsmp.c
> @@ -32,7 +32,7 @@
>
>   extern void exynos4_secondary_startup(void);
>
> -static void __iomem *sysram_base_addr;
> +void __iomem *sysram_base_addr;
>   void __iomem *sysram_ns_base_addr;
>
>   static void __init exynos_smp_prepare_sysram(void)
> diff --git a/arch/arm/mach-exynos/pm.c b/arch/arm/mach-exynos/pm.c
> index d10c351..87c0d34 100644
> --- a/arch/arm/mach-exynos/pm.c
> +++ b/arch/arm/mach-exynos/pm.c
> @@ -168,10 +168,10 @@ int exynos_cluster_power_state(int cluster)
>
>   #define EXYNOS_BOOT_VECTOR_ADDR	(samsung_rev() =3D=3D EXYNOS4210_RE=
V_1_1 ? \
>   			S5P_INFORM7 : (samsung_rev() =3D=3D EXYNOS4210_REV_1_0 ? \
> -			(S5P_VA_SYSRAM + 0x24) : S5P_INFORM0))
> +			(sysram_base_addr + 0x24) : S5P_INFORM0))
>   #define EXYNOS_BOOT_VECTOR_FLAG	(samsung_rev() =3D=3D EXYNOS4210_RE=
V_1_1 ? \
>   			S5P_INFORM6 : (samsung_rev() =3D=3D EXYNOS4210_REV_1_0 ? \
> -			(S5P_VA_SYSRAM + 0x20) : S5P_INFORM1))
> +			(sysram_base_addr + 0x20) : S5P_INFORM1))
>
>   #define S5P_CHECK_AFTR  0xFCBA0D10
>   #define S5P_CHECK_SLEEP 0x00000BAD
>


--=20
  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software fo=
r ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
