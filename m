From: Kukjin Kim <kgene@kernel.org>
Subject: Re: [PATCH v3 2/2] ARM: EXYNOS: Use of_machine_is_compatible instead
 ofsoc_is_exynos4
Date: Thu, 14 May 2015 11:41:19 +0900
Message-ID: <55540B4F.6060607@kernel.org>
References: <1431307646-10779-1-git-send-email-k.kozlowski@samsung.com> <1431307646-10779-2-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:53311 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753839AbbENClw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 13 May 2015 22:41:52 -0400
In-Reply-To: <1431307646-10779-2-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>

On 05/11/15 10:27, Krzysztof Kozlowski wrote:
> of_machine_is_compatible() seems to be preferred over soc_is_exynos4().
> 
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> 
> ---
> Changes since v2:
> 1. New patch, requested by Kukjin Kim.
> ---
>  arch/arm/mach-exynos/exynos.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mach-exynos/exynos.c b/arch/arm/mach-exynos/exynos.c
> index c3bfbba3006d..5917a30eee33 100644
> --- a/arch/arm/mach-exynos/exynos.c
> +++ b/arch/arm/mach-exynos/exynos.c
> @@ -179,7 +179,7 @@ static void __init exynos_init_io(void)
>   */
>  void exynos_set_delayed_reset_assertion(bool enable)
>  {
> -	if (soc_is_exynos4()) {
> +	if (of_machine_is_compatible("samsung,exynos4")) {
>  		unsigned int tmp, core_id;
>  
>  		for (core_id = 0; core_id < num_possible_cpus(); core_id++) {

Maybe we need to change the compatible for exynos4415.dtsi? because no
exynos4 in the compatible...Applied, anyway.

Thanks,
Kukjin
