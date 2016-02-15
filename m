From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 1/4] mfd: max77686: Add max77802 to I2C device ID table
Date: Mon, 15 Feb 2016 14:21:43 +0900
Message-ID: <56C16067.9020707@samsung.com>
References: <1455251419-8919-1-git-send-email-javier@osg.samsung.com>
 <1455251419-8919-2-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:54937 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751874AbcBOFVt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 15 Feb 2016 00:21:49 -0500
In-reply-to: <1455251419-8919-2-git-send-email-javier@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>, linux-kernel@vger.kernel.org
Cc: Andi Shyti <andi.shyti@samsung.com>, linux-samsung-soc@vger.kernel.org, Lee Jones <lee.jones@linaro.org>, Laxman Dewangan <ldewangan@nvidia.com>

On 12.02.2016 13:30, Javier Martinez Canillas wrote:
> The max77686 MFD driver supports both the Maxim 77686 and Maxim 77802
> PMICs but only the OF device table contains entries for both devices.
> 
> The max77802 entry is missing in the I2C device ID table which isn't
> a problem currently since the driver only supports DT but it will be
> needed if the driver is changed to be built as a module since the I2C
> core always reports a I2C modalias uevent so auto-load will not work.
> 
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
> ---
> 
>  drivers/mfd/max77686.c | 1 +
>  1 file changed, 1 insertion(+)


Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
