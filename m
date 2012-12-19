From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH] gpio: samsung: remove exynos_gpio_cfg
Date: Wed, 19 Dec 2012 22:22:55 +0000
Message-ID: <20121219222255.49E263E0AD6@localhost>
References: <1355481842-17952-1-git-send-email-jy0922.shim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f178.google.com ([74.125.82.178]:46804 "EHLO
	mail-we0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751390Ab2LSWW7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 19 Dec 2012 17:22:59 -0500
Received: by mail-we0-f178.google.com with SMTP id x43so1245551wey.37
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Dec 2012 14:22:58 -0800 (PST)
In-Reply-To: <1355481842-17952-1-git-send-email-jy0922.shim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Joonyoung Shim <jy0922.shim@samsung.com>, linus.walleij@linaro.org
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, kgene.kim@samsung.com, kyungmin.park@samsung.com

On Fri, 14 Dec 2012 19:44:01 +0900, Joonyoung Shim <jy0922.shim@samsung.com> wrote:
> The exynos_gpio_cfg can be substituted to samsung_gpio_cfgs[8].
> 
> Signed-off-by: Joonyoung Shim <jy0922.shim@samsung.com>

Hi Joonyoung,

I need some help here. I don't understand what this patch is for or how
it works. The commit text above doesn't give me enough information to
evaluate the patch. What is the intent here? Why is samsung_gpio_cfgs[8]
more correct than exynos_gpio_cfg?

g.
