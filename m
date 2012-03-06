From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH 2/3] ARM: Exynos: fix SDHCI device names in regulator
 definitions
Date: Tue, 06 Mar 2012 02:06:28 -0800
Message-ID: <4F55E1A4.5050909@samsung.com>
References: <1330591221-31458-1-git-send-email-m.szyprowski@samsung.com> <1330591221-31458-3-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pw0-f46.google.com ([209.85.160.46]:47755 "EHLO
	mail-pw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758448Ab2CFKGc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 6 Mar 2012 05:06:32 -0500
Received: by pbcun15 with SMTP id un15so3898883pbc.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 06 Mar 2012 02:06:32 -0800 (PST)
In-Reply-To: <1330591221-31458-3-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Jaehoon Chung <jh80.chung@samsung.com>

On 03/01/12 00:40, Marek Szyprowski wrote:
> Patch 189eb7407 "ARM: EXYNOS: use 'exynos4-sdhci' as device name for sdhci
> controllers" changed the names of the SDHCI devices, but the author forgot
> to update the definitions for the regulator subsystem. This patch fixes
> this issue.
>
> Signed-off-by: Marek Szyprowski<m.szyprowski@samsung.com>
> Signed-off-by: Kyungmin Park<kyungmin.park@samsung.com>
> ---
>   arch/arm/mach-exynos/mach-nuri.c           |    4 ++--
>   arch/arm/mach-exynos/mach-universal_c210.c |    2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm/mach-exynos/mach-nuri.c b/arch/arm/mach-exynos/mach-nuri.c
> index 8c0479f..dd26581 100644
> --- a/arch/arm/mach-exynos/mach-nuri.c
> +++ b/arch/arm/mach-exynos/mach-nuri.c
> @@ -117,7 +117,7 @@ static struct s3c_sdhci_platdata nuri_hsmmc0_data __initdata = {
>   };
>
>   static struct regulator_consumer_supply emmc_supplies[] = {
> -	REGULATOR_SUPPLY("vmmc", "s3c-sdhci.0"),
> +	REGULATOR_SUPPLY("vmmc", "exynos4-sdhci.0"),
>   	REGULATOR_SUPPLY("vmmc", "dw_mmc"),
>   };
>
> @@ -417,7 +417,7 @@ static struct regulator_consumer_supply __initdata max8997_ldo12_[] = {
>   	REGULATOR_SUPPLY("vddio", "6-003c"), /* HDC802 */
>   };
>   static struct regulator_consumer_supply __initdata max8997_ldo13_[] = {
> -	REGULATOR_SUPPLY("vmmc", "s3c-sdhci.2"), /* TFLASH */
> +	REGULATOR_SUPPLY("vmmc", "exynos4-sdhci.2"), /* TFLASH */
>   };
>   static struct regulator_consumer_supply __initdata max8997_ldo14_[] = {
>   	REGULATOR_SUPPLY("inmotor", "max8997-haptic"),
> diff --git a/arch/arm/mach-exynos/mach-universal_c210.c b/arch/arm/mach-exynos/mach-universal_c210.c
> index 908624c..7cd738c 100644
> --- a/arch/arm/mach-exynos/mach-universal_c210.c
> +++ b/arch/arm/mach-exynos/mach-universal_c210.c
> @@ -750,7 +750,7 @@ static struct s3c_sdhci_platdata universal_hsmmc0_data __initdata = {
>   };
>
>   static struct regulator_consumer_supply mmc0_supplies[] = {
> -	REGULATOR_SUPPLY("vmmc", "s3c-sdhci.0"),
> +	REGULATOR_SUPPLY("vmmc", "exynos4-sdhci.0"),
>   };
>
>   static struct regulator_init_data mmc0_fixed_voltage_init_data = {

(Cc'ed Jaehoon Chung)

Oops, I looked at same patch from Jaehoon Chung just now and it could 
be. However, including same Signed-off-by from Kyungmin Park, it seems 
wrong. What's happened in your side?

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
