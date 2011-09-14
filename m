From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH V4 5/6] ARM: S5P6440: Add LCD-LTE480 and enable Framebuffer
 support
Date: Wed, 14 Sep 2011 22:06:06 +0900
Message-ID: <008701cc72df$108e5aa0$31ab0fe0$%kim@samsung.com>
References: <1315591301-17166-1-git-send-email-ajaykumar.rs@samsung.com>
 <1315591301-17166-6-git-send-email-ajaykumar.rs@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:59331 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932412Ab1INNGI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Sep 2011 09:06:08 -0400
Received: from epcpsbgm1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LRI001RWKE6LF60@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 14 Sep 2011 22:06:06 +0900 (KST)
Received: from kgenekim (12-23-120-114.csky.net [12.23.120.114])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LRI00LHTKE6SW@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 14 Sep 2011 22:06:07 +0900 (KST)
In-reply-to: <1315591301-17166-6-git-send-email-ajaykumar.rs@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Ajay Kumar' <ajaykumar.rs@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, jg1.han@samsung.com, m.szyprowski@samsung.com

Ajay Kumar wrote:
> 
> This patch:
> 	-- Adds platform device support for LCD-LTE480.
> 	-- Adds platform data for FB with win_mode and default_bpp.
> 	-- Enables FB device support and platform-lcd support.
> 	-- Adds SPCON settings for LCD.
> 
> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> ---
>  arch/arm/mach-s5p64x0/Kconfig                  |    2 +
>  arch/arm/mach-s5p64x0/include/mach/regs-gpio.h |    4 +
>  arch/arm/mach-s5p64x0/mach-smdk6440.c          |   75
> ++++++++++++++++++++++++
>  3 files changed, 81 insertions(+), 0 deletions(-)
> 

(snip)

> +#include <plat/regs-fb.h>

Should be <plat/regs-fb-v4.h>?

(snip)

> +/* Frame Buffer */
> +static struct s3c_fb_pd_win smdk6440_fb_win0 = {
> +	.win_mode = {
> +		.left_margin	= 8,
> +		.right_margin	= 13,
> +		.upper_margin	= 7,
> +		.lower_margin	= 5,
> +		.hsync_len	= 3,
> +		.vsync_len	= 1,
> +		.xres		= 800,
> +		.yres		= 480,
> +		.refresh	= 60,

if its value is 60, we don't need .refresh here.

(snip)


Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
