From: Andi Shyti <andi.shyti@samsung.com>
Subject: Re: [RESEND PATCH] mfd: max77686: Use module_i2c_driver() instead of
 subsys initcall
Date: Tue, 05 Apr 2016 10:57:01 +0900
Message-ID: <20160405015701.GA4228@samsunx.samsung>
References: <1459809962-8883-1-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:57393 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932600AbcDEB5K (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 4 Apr 2016 21:57:10 -0400
Content-disposition: inline
In-reply-to: <1459809962-8883-1-git-send-email-javier@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Paul Gortmaker <paul.gortmaker@windriver.com>, Lee Jones <lee.jones@linaro.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Laxman Dewangan <ldewangan@nvidia.com>

Hi Javier,

> The driver's init and exit function don't do anything besides adding and
> deleting the I2C driver so the module_i2c_driver() macro could be used.
> 
> Currently is not being used because the driver is initialized at subsys
> initcall level, claiming that this is done to allow consumers devices to
> use the resources provided by this driver. But dependencies are in DT so
> manual ordering of init calls is not necessary any more.
> 
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>

Reviewed-by: Andi Shyti <andi.shyti@samsung.com>

Thanks,
Andi
