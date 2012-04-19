From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH 03/12] ARM: Exynos5: Add watchdog timer clock instance
Date: Wed, 18 Apr 2012 17:28:44 -0700
Message-ID: <4F8F5C3C.2050803@samsung.com>
References: <1334641595-25301-1-git-send-email-thomas.abraham@linaro.org> <1334641595-25301-4-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=EUC-KR
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f52.google.com ([209.85.210.52]:33230 "EHLO
	mail-pz0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751125Ab2DSA2p (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 18 Apr 2012 20:28:45 -0400
Received: by dake40 with SMTP id e40so10563877dak.11
        for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Apr 2012 17:28:45 -0700 (PDT)
In-Reply-To: <1334641595-25301-4-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org

Thomas Abraham wrote:
> Add watchdog timer clock instance for Exynos5 watchdog controller.
> 
> Signed-off-by: Thomas Abraham<thomas.abraham@linaro.org>
> ---
>   arch/arm/mach-exynos/clock-exynos5.c |    5 +++++
>   1 files changed, 5 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos/clock-exynos5.c b/arch/arm/mach-exynos/clock-exynos5.c
> index ad3bec4..662615d 100644
> --- a/arch/arm/mach-exynos/clock-exynos5.c
> +++ b/arch/arm/mach-exynos/clock-exynos5.c
> @@ -474,6 +474,11 @@ static struct clk exynos5_init_clocks_off[] = {
>   		.enable		= exynos5_clk_ip_peris_ctrl,
>   		.ctrlbit	= (1<<  20),
>   	}, {
> +		.name		= "watchdog",
> +		.parent		=&exynos5_clk_aclk_66.clk,
> +		.enable		= exynos5_clk_ip_peris_ctrl,
> +		.ctrlbit	= (1<<  19),
> +	}, {
>   		.name		= "hsmmc",
>   		.devname	= "exynos4-sdhci.0",
>   		.parent		=&exynos5_clk_aclk_200.clk,

Looks ok, will apply.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
