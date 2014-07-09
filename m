From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [PATCH v7 18/24] mfd: max77686: Add Maxim 77802 PMIC support
Date: Wed, 09 Jul 2014 20:43:47 +0200
Message-ID: <53BD8D63.1080005@collabora.co.uk>
References: <1404505467-26526-1-git-send-email-javier.martinez@collabora.co.uk> <1404505467-26526-19-git-send-email-javier.martinez@collabora.co.uk> <20140709153146.GJ2635@lee--X1>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:41704 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755337AbaGISny (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 9 Jul 2014 14:43:54 -0400
In-Reply-To: <20140709153146.GJ2635@lee--X1>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Mark Brown <broonie@kernel.org>, Mike Turquette <mturquette@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Alessandro Zummo <a.zummo@towertech.it>, Kukjin Kim <kgene.kim@samsung.com>, Doug Anderson <dianders@chromium.org>, Olof Johansson <olof@lixom.net>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Yadwinder Singh Brar <yadi.brar01@gmail.com>, Tushar Behera <trblinux@gmail.com>, Andreas Farber <afaerber@suse.de>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

Hello Lee,

On 07/09/2014 05:31 PM, Lee Jones wrote:
> On Fri, 04 Jul 2014, Javier Martinez Canillas wrote:
>> Maxim MAX77802 is a power management chip that contains 10 high
>> efficiency Buck regulators, 32 Low-dropout (LDO) regulators used
>> to power up application processors and peripherals, a 2-channel
>> 32kHz clock outputs, a Real-Time-Clock (RTC) and a I2C interface
>> to program the individual regulators, clocks outputs and the RTC.
>> 
>> This patch adds support for MAX77802 to the MAX77686 driver and is
>> based on a driver added to the Chrome OS kernel 3.8 by Simon Glass.
>> 
>> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
>> Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>> ---
> 
> [...]
> 
>>  static const struct i2c_device_id max77686_i2c_id[] = {
>>  	{ "max77686", TYPE_MAX77686 },
>> +	{ "max77802", TYPE_MAX77802 },
>>  	{ }
> 
> There's no point in filling this in.  Just empty it completely.
> 

Ok, I won't fill this

> Once you've done that, resubmit the patchset with my:
> 
> Acked-by: Lee Jones <lee.jones@linaro.org>
> 

Thanks a lot.

Best regards,
Javier
