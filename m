From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v2] ARM: EXYNOS4: enabled lcd and backlight in NURI board
Date: Mon, 07 Mar 2011 16:11:24 +0900
Message-ID: <032401cbdc96$e134f360$a39eda20$%kim@samsung.com>
References: <1299460218-22748-1-git-send-email-dh09.lee@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:49799 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751289Ab1CGHOs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 7 Mar 2011 02:14:48 -0500
Received: from epmmp2 (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LHO00B57EN5OS00@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 07 Mar 2011 16:11:29 +0900 (KST)
Received: from DOKGENEKIM02 ([12.23.103.104])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LHO0005DEN5AQ@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 07 Mar 2011 16:11:29 +0900 (KST)
In-reply-to: <1299460218-22748-1-git-send-email-dh09.lee@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Donghwa Lee' <dh09.lee@samsung.com>, kyungmin.park@samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

Donghwa Lee wrote:
> 
> This patch enables lcd and backlight drivers in NURI board.
> 
> Signed-off-by: Donghwa Lee <dh09.lee@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
> Changes since v1:
> - Adds backlight platform data to control brightness and GPIO
> - Modify inappropriate function name and remove useless codes.
> - And so on.
> 
>  arch/arm/mach-exynos4/Kconfig     |    1 +
>  arch/arm/mach-exynos4/mach-nuri.c |   81
> +++++++++++++++++++++++++++++++++++++
>  2 files changed, 82 insertions(+), 0 deletions(-)

Thanks for re-work :)
There are small comments below.

(snip)

> +static void nuri_lcd_power_on(struct plat_lcd_data *pd, unsigned int
power)
> +{
> +	int gpio = EXYNOS4_GPE1(5);
> +
> +	if (power)
> +		gpio_direction_output(gpio, 1);
> +	else
> +		gpio_direction_output(gpio, 0);

	gpio_direction_output(gpio, power);

> +}
> +
> +static int nuri_bl_init(struct device *dev)
> +{
> +	int ret, gpio = EXYNOS4_GPE2(3);
> +
> +	ret = gpio_request(gpio, "LCD_LDO_EN");
> +	if (!ret)
> +		gpio_direction_output(gpio, 0);
> +
> +	return 0;

	return ret;

> +}

(snip)

> +static struct platform_device nuri_lcd_device = {
> +	.name			= "platform-lcd",
> +	.id			= -1,
> +	.dev			= {
> +		.platform_data	= (void *) &nuri_lcd_platform_data,

		.platform_data = &nuri_lcd_platform_data,

> +	},
> +};

(snip)

You used gpio_request() for EXYNOS4_GPE2(3) and EXYNOS4_GPE1(5), but
EXYNOS4_GPE1(5). Is there any reason or policy for it?


Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
