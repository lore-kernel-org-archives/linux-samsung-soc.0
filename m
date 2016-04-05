From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [RESEND PATCH] mfd: max77686: Use module_i2c_driver() instead of
 subsys initcall
Date: Tue, 05 Apr 2016 10:47:33 +0900
Message-ID: <57031935.7090006@samsung.com>
References: <1459809962-8883-1-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:12915 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751318AbcDEBrx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 4 Apr 2016 21:47:53 -0400
In-reply-to: <1459809962-8883-1-git-send-email-javier@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>, linux-kernel@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org, Andi Shyti <andi.shyti@samsung.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, Lee Jones <lee.jones@linaro.org>, Laxman Dewangan <ldewangan@nvidia.com>

On 05.04.2016 07:46, Javier Martinez Canillas wrote:
> The driver's init and exit function don't do anything besides adding and
> deleting the I2C driver so the module_i2c_driver() macro could be used.
> 
> Currently is not being used because the driver is initialized at subsys
> initcall level, claiming that this is done to allow consumers devices to
> use the resources provided by this driver. But dependencies are in DT so
> manual ordering of init calls is not necessary any more.
> 
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
> 
> ---
> 
> Changes in the resend:
> - Change commit message to make clear that dependencies are in DT instead
>   giving the impression that it was wishful thinking (Krzysztof Kozlowski).
> 
> Hello,
> 
> This patch was first sent as a part of a bigger series to allow the
> max77686 MFD driver to be built as a module [0]. The other patches
> were already picked but $SUBJECT wasn't, probably because there was
> a dependency with a patch on the exynos thermal driver [1].
> 
> But the exynos thermal patches also landed in mainline so I think it
> should be safe to merged $SUBJECT now.
> 
> [0]: https://lkml.org/lkml/2016/2/11/857
> [1]: https://lkml.org/lkml/2016/2/18/592
> 
> Best regards,
> Javier
> 
>  drivers/mfd/max77686.c | 13 +------------
>  1 file changed, 1 insertion(+), 12 deletions(-)
> 

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>



Best regards,

Krzysztof
