From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 2/4] mfd: max77686: Use module_i2c_driver() instead of
 subsys initcall
Date: Mon, 15 Feb 2016 15:54:38 +0900
Message-ID: <56C1762E.9040208@samsung.com>
References: <1455251419-8919-1-git-send-email-javier@osg.samsung.com>
 <1455251419-8919-3-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:57128 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751631AbcBOGyp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 15 Feb 2016 01:54:45 -0500
In-reply-to: <1455251419-8919-3-git-send-email-javier@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>, linux-kernel@vger.kernel.org
Cc: Andi Shyti <andi.shyti@samsung.com>, linux-samsung-soc@vger.kernel.org, Lee Jones <lee.jones@linaro.org>, Laxman Dewangan <ldewangan@nvidia.com>

On 12.02.2016 13:30, Javier Martinez Canillas wrote:
> The driver's init and exit function don't do anything besides adding and
> deleting the I2C driver so the module_i2c_driver() macro could be used.
> 
> Currently is not being used because the driver is initialized at subsys
> initcall level, claiming that this is done to allow consumers devices to
> use the resources provided by this driver. But dependencies should be in
> the DT and consumers drivers should not rely in the registration order.
> 
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
> ---
> 
>  drivers/mfd/max77686.c | 13 +------------
>  1 file changed, 1 insertion(+), 12 deletions(-)
> 

In the past not all dependencies supported deferred probing so such
ordering was required.

I don't like the "dependencies should be in DT" reason for the change...
because it is kind of wishful thinking. Yeah, the dependencies should be
in DT, but are they?

Instead *please check it* and write:
"Dependencies are in DT so manual ordering of init calls is not
necessary any more".

My fast tests of this patch shown that it works good... but some more
thorough tests should be done.

Best regards,
Krzysztof
