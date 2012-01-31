From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH 1/2] ARM: Exynos4: Make exynos4-dt compile again
Date: Tue, 31 Jan 2012 20:15:36 +0530
Message-ID: <CAJuYYwSVs4iRULAt5ARUC=yx2X1EVVLAogJNqAv9u_U9G_eVCA@mail.gmail.com>
References: <1328006193-13902-1-git-send-email-k.lewandowsk@samsung.com>
	<1328006193-13902-2-git-send-email-k.lewandowsk@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vx0-f174.google.com ([209.85.220.174]:64228 "EHLO
	mail-vx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753490Ab2AaOpi convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 31 Jan 2012 09:45:38 -0500
In-Reply-To: <1328006193-13902-2-git-send-email-k.lewandowsk@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Karol Lewandowski <k.lewandowsk@samsung.com>
Cc: m.szyprowski@samsung.com, linux-samsung-soc@vger.kernel.org, marc.zyngier@arm.com, linux-kernel@vger.kernel.org, kgene.kim@samsung.com, kyungmin.park@samsung.com

On 31 January 2012 16:06, Karol Lewandowski <k.lewandowsk@samsung.com> =
wrote:
> Commit cc511b8d84d8 ("ARM: 7257/1: EXYNOS: introduce
> arch/arm/mach-exynos/common.[ch]") replaced plat/exynos4.h with
> common.h, requiring all boards to be adjusted appropriately.
>
> This commit fixes exynos4-dt.c, missed out in original patch.
>
> Signed-off-by: Karol Lewandowski <k.lewandowsk@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> Cc: Thomas Abraham <thomas.abraham@linaro.org>
> Cc: Kukjin Kim <kgene.kim@samsung.com>
> ---
> =A0arch/arm/mach-exynos/mach-exynos4-dt.c | =A0 =A05 +++--
> =A01 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/mach-exynos/mach-exynos4-dt.c b/arch/arm/mach-e=
xynos/mach-exynos4-dt.c
> index 85fa027..98e79c9 100644
> --- a/arch/arm/mach-exynos/mach-exynos4-dt.c
> +++ b/arch/arm/mach-exynos/mach-exynos4-dt.c
> @@ -19,7 +19,8 @@
>
> =A0#include <plat/cpu.h>
> =A0#include <plat/regs-serial.h>
> -#include <plat/exynos4.h>
> +
> +#include "common.h"
>
> =A0/*
> =A0* The following lookup table is used to override device names when=
 devices
> @@ -60,7 +61,7 @@ static const struct of_dev_auxdata exynos4210_auxda=
ta_lookup[] __initconst =3D {
>
> =A0static void __init exynos4210_dt_map_io(void)
> =A0{
> - =A0 =A0 =A0 s5p_init_io(NULL, 0, S5P_VA_CHIPID);
> + =A0 =A0 =A0 exynos_init_io(NULL, 0);
> =A0 =A0 =A0 =A0s3c24xx_init_clocks(24000000);
> =A0}

Tested-by: Thomas Abraham <thomas.abraham@linaro.org>

Thanks,
Thomas.

>
> --
> 1.7.8.3
>
