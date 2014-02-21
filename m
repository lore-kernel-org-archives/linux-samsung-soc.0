From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 1/1] ARM: EXYNOS: Consolidate CPU init code
Date: Fri, 21 Feb 2014 17:45:34 +0100
Message-ID: <530782AE.4060500@samsung.com>
References: <1390391342-4344-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:64943 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932740AbaBUQpj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 21 Feb 2014 11:45:39 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N1C005OEUJXQU20@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 21 Feb 2014 16:45:33 +0000 (GMT)
In-reply-to: <1390391342-4344-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, patches@linaro.org

Hi Sachin,

On 22.01.2014 12:49, Sachin Kamat wrote:
> cpu_table was used to distinguish between different Exynos4 and 5 SoCs
> and assign the the initialization and io mapping pointers based on type.
> exynos_init is dummy and no longer needed as we do a DT based booting.
> By having a common io mapping function we can get rid of the whole
> table and avoid populating it for every SoC.
>
> Tested on Exynos4210, 5250 and 5420 based boards.
>
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>   arch/arm/mach-exynos/common.c |   93 ++++++++---------------------------------
>   1 file changed, 17 insertions(+), 76 deletions(-)

On Exynos4412-based Trats2 board:

Tested-by: Tomasz Figa <t.figa@samsung.com>

However, please see one minor comment inline.

> diff --git a/arch/arm/mach-exynos/common.c b/arch/arm/mach-exynos/common.c
> index f18be40e5b21..02d0aaa7af59 100644
> --- a/arch/arm/mach-exynos/common.c
> +++ b/arch/arm/mach-exynos/common.c
> @@ -48,55 +48,7 @@
>   #define L2_AUX_VAL 0x7C470001
>   #define L2_AUX_MASK 0xC200ffff
>
> -static const char name_exynos4210[] = "EXYNOS4210";
> -static const char name_exynos4212[] = "EXYNOS4212";
> -static const char name_exynos4412[] = "EXYNOS4412";
> -static const char name_exynos5250[] = "EXYNOS5250";
> -static const char name_exynos5420[] = "EXYNOS5420";
> -static const char name_exynos5440[] = "EXYNOS5440";
> -
> -static void exynos4_map_io(void);
> -static void exynos5_map_io(void);
> -static int exynos_init(void);
> -
> -static struct cpu_table cpu_ids[] __initdata = {
> -	{
> -		.idcode		= EXYNOS4210_CPU_ID,
> -		.idmask		= EXYNOS4_CPU_MASK,
> -		.map_io		= exynos4_map_io,
> -		.init		= exynos_init,
> -		.name		= name_exynos4210,
> -	}, {
> -		.idcode		= EXYNOS4212_CPU_ID,
> -		.idmask		= EXYNOS4_CPU_MASK,
> -		.map_io		= exynos4_map_io,
> -		.init		= exynos_init,
> -		.name		= name_exynos4212,
> -	}, {
> -		.idcode		= EXYNOS4412_CPU_ID,
> -		.idmask		= EXYNOS4_CPU_MASK,
> -		.map_io		= exynos4_map_io,
> -		.init		= exynos_init,
> -		.name		= name_exynos4412,
> -	}, {
> -		.idcode		= EXYNOS5250_SOC_ID,
> -		.idmask		= EXYNOS5_SOC_MASK,
> -		.map_io		= exynos5_map_io,
> -		.init		= exynos_init,
> -		.name		= name_exynos5250,
> -	}, {
> -		.idcode		= EXYNOS5420_SOC_ID,
> -		.idmask		= EXYNOS5_SOC_MASK,
> -		.map_io		= exynos5_map_io,
> -		.init		= exynos_init,
> -		.name		= name_exynos5420,
> -	}, {
> -		.idcode		= EXYNOS5440_SOC_ID,
> -		.idmask		= EXYNOS5_SOC_MASK,
> -		.init		= exynos_init,
> -		.name		= name_exynos5440,
> -	},
> -};
> +static void exynos_map_io(void);

cosmetic: Instead of adding forward declaration, the resulting 
exynos_map_io() function could be simply merged with exynos_init_io().

Best regards,
Tomasz
