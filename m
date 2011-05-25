From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH 7/7] ARM: Exynos4: Add clkdev support
Date: Wed, 25 May 2011 14:34:37 -0700
Message-ID: <4DDD75ED.2010805@samsung.com>
References: <1305839906-1815-1-git-send-email-thomas.ab@samsung.com> <1305839906-1815-8-git-send-email-thomas.ab@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pv0-f174.google.com ([74.125.83.174]:55013 "EHLO
	mail-pv0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755011Ab1EYVek (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 May 2011 17:34:40 -0400
Received: by pvg12 with SMTP id 12so31736pvg.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 May 2011 14:34:40 -0700 (PDT)
In-Reply-To: <1305839906-1815-8-git-send-email-thomas.ab@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.ab@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com

On 05/19/11 14:18, Thomas Abraham wrote:
> Add clkdev support for Samsung's Exynos4 platform.
>
> Signed-off-by: Thomas Abraham<thomas.ab@samsung.com>
> ---
>   arch/arm/Kconfig                            |    1 +
>   arch/arm/mach-exynos4/clock.c               |   63 +++++++++++++++++++++++++--
>   arch/arm/mach-exynos4/include/mach/clkdev.h |    7 +++
>   arch/arm/mach-exynos4/time.c                |    2 +
>   4 files changed, 69 insertions(+), 4 deletions(-)
>   create mode 100644 arch/arm/mach-exynos4/include/mach/clkdev.h
>

(snip)

> -		.name		= "hsmmc",
> -		.id		= 4,
> +		.name		= "dwmmc",
> +		.id		= -1,

This change should be split :)

(snip)

> @@ -1072,8 +1127,8 @@ static struct clksrc_clk clksrcs[] = {
>   		.reg_div = { .reg = S5P_CLKDIV_FSYS2, .shift = 24, .size = 8 },
>   	}, {
>   		.clk		= {
> -			.name		= "sclk_mmc",
> -			.id		= 4,
> +			.name		= "sclk_dwmmc",
> +			.id		= -1,

Same as above.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
