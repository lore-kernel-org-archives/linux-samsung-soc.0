From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH V2] ARM: EXYNOS4: Add machine support for 7" LCD on ORIGEN
Date: Thu, 15 Sep 2011 13:50:04 +0900
Message-ID: <00a001cc7362$ef937770$ceba6650$%kim@samsung.com>
References: <1315998112-31395-1-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:34344 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751716Ab1IOEuH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 15 Sep 2011 00:50:07 -0400
Received: from epcpsbgm1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LRJ0055ES1FHK80@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 15 Sep 2011 13:50:05 +0900 (KST)
Received: from kgenekim ([12.23.120.114])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LRJ0068SS3GRM40@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Thu, 15 Sep 2011 13:50:05 +0900 (KST)
In-reply-to: <1315998112-31395-1-git-send-email-tushar.behera@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tushar Behera' <tushar.behera@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: linaro-dev@lists.linaro.org, patches@linaro.org

Tushar Behera wrote:
> 
> ORIGEN board is fitted with 7" LCD panel HV070WSA. The pixel
> resolution of the LCD panel is 1024x600.
> 
> Also power domain device for LCD0 is registered.
> 
> Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
> ---
> Changes for V2:
> 	* Added power domain device registration for LCD0
> 
> The patch is rebased on [1]. For proper working of LCD on ORIGEN,
> following patches are needed. These patches are already submitted to
> the mailing list.
> 
> a. ARM: EXYNOS4: Add PWM backlight support on Origen
> 	Author: Giridhar Maruthy

As I said, it is already in my tree.

> b. ARM: EXYNOS4: Configure MAX8997 PMIC for Origen
> 	Author: Inderpal Singh

Will review it.

(snip)

> +
> +static struct s3c_fb_pd_win origen_fb_win0 = {
> +	.win_mode = {
> +		.left_margin	= 64,
> +		.right_margin	= 16,
> +		.upper_margin	= 64,
> +		.lower_margin	= 16,
> +		.hsync_len	= 48,
> +		.vsync_len	= 3,
> +		.xres		= 1024,
> +		.yres		= 600,
> +		.refresh	= 60,

We don't need to add '.refresh' here because its default value is 60.

> +	},
> +	.max_bpp		= 32,
> +	.default_bpp		= 24,
> +};

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
