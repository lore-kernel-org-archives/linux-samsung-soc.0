From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH] i2c: s3c2410: dont need CPU_FREQ transitions for exynos
 series
Date: Sat, 12 Oct 2013 04:22:04 +0200
Message-ID: <3245175.os31ym2KFi@amdn883>
References: <1381490814-20890-1-git-send-email-ch.naveen@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:20034 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751318Ab3JLCWI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 11 Oct 2013 22:22:08 -0400
In-reply-to: <1381490814-20890-1-git-send-email-ch.naveen@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, wsa@the-dreams.de, khali@linux-fr.org, ben-linux@fluff.org, grant.likely@secretlab.ca, devicetree-discuss@lists.ozlabs.org, sjg@chromium.org, naveenkrishna.ch@gmail.com, broonie@opensource.wolfsonmicro.com, diander@google.com, cpgs@samsung.com

Hi Naveen,

On Friday 11 of October 2013 16:56:54 Naveen Krishna Chatradhi wrote:
> The exynos5 i2c clock is based on a fixed 66 MHz peripheral clock, and
> therefore is completely independent of the cpu frequency.
> Thus, registering for a CPU freq notifier is very wasteful.
> 
> This patch modifes the code such that, i2c bus registers to
> cpu_freq_transition only for non Exynos SoCs.
> 
> This change should save a bunch of cpufreq transitions calls
> which does not apply to exynos SoCs.

The idea is fine, although...

> Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
> ---
>  drivers/i2c/busses/i2c-s3c2410.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
> index cab1c91..d062fa7 100644
> --- a/drivers/i2c/busses/i2c-s3c2410.c
> +++ b/drivers/i2c/busses/i2c-s3c2410.c
> @@ -123,7 +123,7 @@ struct s3c24xx_i2c {
>  	struct s3c2410_platform_i2c	*pdata;
>  	int			gpios[2];
>  	struct pinctrl          *pctrl;
> -#ifdef CONFIG_CPU_FREQ
> +#if defined(CONFIG_CPU_FREQ) && !defined(CONFIG_ARCH_EXYNOS)

...this is not a good coding practice, especially when already having
multiplatform kernels in sight.

The best way would be to check on which SoC we are running at runtime,
but since this might need changing a lot of code, then at least I would
change this from !defined(EXYNOS) to defined(S3C24XX), so it is not being
compiled in when S3C24XX support is not enabled and if it's enabled then
the notifier will be registered as a safe fallback that will run correctly
on all platforms.

Best regards,
Tomasz
