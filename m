From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] ARM: exynos: Bring back reboot on Exynos5410
Date: Thu, 29 Oct 2015 10:41:52 +0900
Message-ID: <56317960.9070608@samsung.com>
References: <1446024965-8508-1-git-send-email-p.fedin@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:8567 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756577AbbJ2Bl4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 Oct 2015 21:41:56 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NWY00MQJKPUGTA0@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 29 Oct 2015 01:41:54 +0000 (GMT)
In-reply-to: <1446024965-8508-1-git-send-email-p.fedin@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pavel Fedin <p.fedin@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Kukjin Kim <kgene@kernel.org>

On 28.10.2015 18:36, Pavel Fedin wrote:
> Since 8cfc7fdd33080e30b86d21b1a8c9ad0686427ddc ("ARM: EXYNOS: move restart

This should be sufficient (although full is okay as well):
$ git config core.abbrev 12

> code into pmu driver") PMU support is required in order for the reboot to
> work. Unfortunately, there is currently no PMU support for 5410.
> 
> This patch adds exynos5410-pmu to the list of recognized devices. It is
> okay for the code to have empty struct exynos_pmu_data, in this case only
> minimal support is enabled. This is enough for SWRESET to work.
> 
> Signed-off-by: Pavel Fedin <p.fedin@samsung.com>

This definitely looks like a fix for a regression, so:
Cc: <stable@vger.kernel.org>
Fixes: 8cfc7fdd3308 ("ARM: EXYNOS: move restart code into pmu driver")

> ---
>  arch/arm/mach-exynos/pmu.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm/mach-exynos/pmu.c b/arch/arm/mach-exynos/pmu.c
> index de68938..7b9e33c 100644
> --- a/arch/arm/mach-exynos/pmu.c
> +++ b/arch/arm/mach-exynos/pmu.c
> @@ -908,6 +908,10 @@ static const struct exynos_pmu_data exynos5250_pmu_data = {
>  	.powerdown_conf	= exynos5_powerdown_conf,
>  };
>  
> +static struct exynos_pmu_data exynos5410_pmu_data = {
> +	/* Only SWRESET is currently supported on 5410 */
> +};

static const struct

With these changes:
Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>


Best regards,
Krzysztof
