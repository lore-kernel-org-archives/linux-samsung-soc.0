From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [PATCH] ARM: EXYNOS: Handle of of_iomap() failure
Date: Tue, 03 Feb 2015 12:20:19 +0900
Message-ID: <054001d03f60$58535150$08f9f3f0$@kernel.org>
References: <1421077065-30175-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:57631 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751133AbbBCDUY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 Feb 2015 22:20:24 -0500
In-reply-to: <1421077065-30175-1-git-send-email-k.kozlowski@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Krzysztof Kozlowski' <k.kozlowski@samsung.com>, 'Russell King' <linux@arm.linux.org.uk>, 'Kukjin Kim' <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

Krzysztof Kozlowski wrote:
> 
> Prevent possible NULL pointer dereference if of_iomap() fails. Handle
> the error by skipping such power domain.
> 
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> ---
>  arch/arm/mach-exynos/pm_domains.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm/mach-exynos/pm_domains.c b/arch/arm/mach-exynos/pm_domains.c
> index 20f267121b3e..fd7640a6b503 100644
> --- a/arch/arm/mach-exynos/pm_domains.c
> +++ b/arch/arm/mach-exynos/pm_domains.c
> @@ -128,6 +128,13 @@ static __init int exynos4_pm_init_power_domain(void)
>  		pd->pd.name = kstrdup(np->name, GFP_KERNEL);
>  		pd->name = pd->pd.name;
>  		pd->base = of_iomap(np, 0);
> +		if (!pd->base) {
> +			dev_warn(&pdev->dev, "Failed to map memory\n");
> +			kfree(pd);
> +			of_node_put(np);
> +			continue;
> +		}
> +
>  		pd->pd.power_off = exynos_pd_power_off;
>  		pd->pd.power_on = exynos_pd_power_on;
> 
> --

Looks good and applied. BTW if we need more error handling like this, how about
error handling for failing of of_find_device_by_node() something like following?

diff --git a/arch/arm/mach-exynos/pm_domains.c b/arch/arm/mach-exynos/pm_domains.c
index 20f2671..234f967 100644
--- a/arch/arm/mach-exynos/pm_domains.c
+++ b/arch/arm/mach-exynos/pm_domains.c
@@ -116,6 +116,10 @@ static __init int exynos4_pm_init_power_domain(void)
 		struct device *dev;

 		pdev = of_find_device_by_node(np);
+		if (!pdev) {
+			/* error handling */
+		}
+
 		dev = &pdev->dev;

 		pd = kzalloc(sizeof(*pd), GFP_KERNEL);

I mean I'm not sure how many error/exception handling is required...

Note you can see your patch in Samsung tree tonight in my time.

Thanks, Kukjin
