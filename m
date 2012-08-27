From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH v3 1/3] ARM: Samsung: Add support for MSHC controller
 clocks
Date: Mon, 27 Aug 2012 16:15:26 -0700
Message-ID: <503BFF8E.80503@samsung.com>
References: <1345982371-26483-1-git-send-email-thomas.abraham@linaro.org> <1345982371-26483-2-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:42741 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754153Ab2H0XP3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 27 Aug 2012 19:15:29 -0400
Received: by dady13 with SMTP id y13so2864770dad.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Aug 2012 16:15:29 -0700 (PDT)
In-Reply-To: <1345982371-26483-2-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, cjb@laptop.org, kgene.kim@samsung.com, girish.shivananjappa@linaro.org, jh80.chung@samsung.com, tgih.jun@samsung.com, patches@linaro.org

On 08/26/12 04:59, Thomas Abraham wrote:
> Add clock instances for bus interface unit clock and card interface unit
> clock of the all four MSHC controller instances.
>
> Signed-off-by: Abhilash Kesavan<a.kesavan@samsung.com>
> Signed-off-by: Thomas Abraham<thomas.abraham@linaro.org>
> ---
>   arch/arm/mach-exynos/clock-exynos5.c |   45 ++++++++++++----------------------
>   1 files changed, 16 insertions(+), 29 deletions(-)
>
> diff --git a/arch/arm/mach-exynos/clock-exynos5.c b/arch/arm/mach-exynos/clock-exynos5.c
> index 3b00e29..16d8bef 100644
> --- a/arch/arm/mach-exynos/clock-exynos5.c
> +++ b/arch/arm/mach-exynos/clock-exynos5.c
> @@ -564,35 +564,30 @@ static struct clk exynos5_init_clocks_off[] = {
>   		.enable		= exynos5_clk_ip_peris_ctrl,
>   		.ctrlbit	= (1<<  19),
>   	}, {
> -		.name		= "hsmmc",
> -		.devname	= "exynos4-sdhci.0",
> +		.name		= "biu",

I have no idea why we change the clock name to 'biu' (bus interface 
unit). Just let me know.

[...]

>   static struct clksrc_clk exynos5_clk_sclk_mmc0 = {
>   	.clk	= {
> -		.name		= "sclk_mmc",
> -		.devname	= "exynos4-sdhci.0",
> +		.name		= "ciu",

Same as above.

[...]

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
