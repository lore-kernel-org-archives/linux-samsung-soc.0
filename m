From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 4/4] mfd: max77686: Export OF module alias information
Date: Mon, 15 Feb 2016 15:55:35 +0900
Message-ID: <56C17667.3010409@samsung.com>
References: <1455251419-8919-1-git-send-email-javier@osg.samsung.com>
 <1455251419-8919-5-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:35986 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751868AbcBOGzl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 15 Feb 2016 01:55:41 -0500
In-reply-to: <1455251419-8919-5-git-send-email-javier@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>, linux-kernel@vger.kernel.org
Cc: Andi Shyti <andi.shyti@samsung.com>, linux-samsung-soc@vger.kernel.org, Lee Jones <lee.jones@linaro.org>, Laxman Dewangan <ldewangan@nvidia.com>

On 12.02.2016 13:30, Javier Martinez Canillas wrote:
> When the device is registered via OF, the OF table is used to match the
> driver instead of the I2C device ID table but the entries in the latter
> are used as aliasses to load the module if the driver was not built-in.
> 
> This is because the I2C core always reports an I2C module alias instead
> of an OF one but that could change so it is better to always export it.
> 
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
> 
> ---
> 
>  drivers/mfd/max77686.c | 1 +
>  1 file changed, 1 insertion(+)
>

Makes sense,
Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
