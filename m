From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH] gpio: samsung: remove exynos_gpio_cfg
Date: Fri, 14 Dec 2012 13:09:10 +0100
Message-ID: <135551836.smSUskQTBC@amdc1227>
References: <1355481842-17952-1-git-send-email-jy0922.shim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:16229 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751529Ab2LNMJR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 14 Dec 2012 07:09:17 -0500
In-reply-to: <1355481842-17952-1-git-send-email-jy0922.shim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Joonyoung Shim <jy0922.shim@samsung.com>
Cc: grant.likely@secretlab.ca, linus.walleij@linaro.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, kgene.kim@samsung.com, kyungmin.park@samsung.com

Hi Joonyoung,

On Friday 14 of December 2012 19:44:01 Joonyoung Shim wrote:
> The exynos_gpio_cfg can be substituted to samsung_gpio_cfgs[8].
> 
> Signed-off-by: Joonyoung Shim <jy0922.shim@samsung.com>

Since recently Thomas Abraham posted patches for pin control support of 
Exynos5250, basically making the legacy GPIO support useless, I think 
there is no need to extend it.

Instead existing boards should be made to use the pinctrl driver.

Best regards,
-- 
Tomasz Figa
Samsung Poland R&D Center
SW Solution Development, Linux Platform
