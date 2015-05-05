From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [RESEND PATCH 3/8] mfd: cros_ec: Instantiate sub-devices from
 device tree
Date: Tue, 05 May 2015 11:21:42 +0200
Message-ID: <55488BA6.9030500@collabora.co.uk>
References: <1428336906-14906-1-git-send-email-javier.martinez@collabora.co.uk> <1428336906-14906-4-git-send-email-javier.martinez@collabora.co.uk> <20150429103943.GV9169@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:34327 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1030978AbbEEJVr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 May 2015 05:21:47 -0400
In-Reply-To: <20150429103943.GV9169@x1>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, Bill Richardson <wfrichar@chromium.org>, Simon Glass <sjg@google.com>, Gwendal Grignou <gwendal@google.com>, Stephen Barber <smbarber@chromium.org>, Filipe Brandenburger <filbranden@google.com>, Todd Broch <tbroch@chromium.org>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

Hello Lee,

On 04/29/2015 12:39 PM, Lee Jones wrote:
> On Mon, 06 Apr 2015, Javier Martinez Canillas wrote:
> 
>> From: Todd Broch <tbroch@chromium.org>
>> 
>> If the EC device tree node has sub-nodes, try to instantiate them as
>> MFD sub-devices.  We can configure the EC features provided by the board.
>> 
>> Signed-off-by: Todd Broch <tbroch@chromium.org>
>> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
>> ---
>>  drivers/mfd/cros_ec.c | 22 +++++++++++-----------
>>  1 file changed, 11 insertions(+), 11 deletions(-)
>> 
>> diff --git a/drivers/mfd/cros_ec.c b/drivers/mfd/cros_ec.c
>> index c4aecc6f8373..8aa83b91e25c 100644
>> --- a/drivers/mfd/cros_ec.c
>> +++ b/drivers/mfd/cros_ec.c
>> @@ -17,6 +17,7 @@
>>   * battery charging and regulator control, firmware update.
>>   */
>>  
>> +#include <linux/of_platform.h>
>>  #include <linux/interrupt.h>
>>  #include <linux/slab.h>
>>  #include <linux/module.h>
>> @@ -109,18 +110,8 @@ EXPORT_SYMBOL(cros_ec_cmd_xfer);
>>  
>>  static const struct mfd_cell cros_devs[] = {
>>  	{
>> -		.name = "cros-ec-keyb",
>> -		.id = 1,
>> -		.of_compatible = "google,cros-ec-keyb",
>> -	},
>> -	{
>> -		.name = "cros-ec-i2c-tunnel",
>> -		.id = 2,
>> -		.of_compatible = "google,cros-ec-i2c-tunnel",
>> -	},
>> -	{
>>  		.name = "cros-ec-ctl",
>> -		.id = 3,
>> +		.id = 1,
> 
> Can't you use PLATFORM_DEVID_AUTO?
>

Yes, I think that will work as well so I'll change it.
 
>>  	},
>>  };
>>  
>> @@ -150,6 +141,15 @@ int cros_ec_register(struct cros_ec_device *ec_dev)
>>  		return err;
>>  	}
>>  
>> +#ifdef CONFIG_OF
>> +	err = of_platform_populate(dev->of_node, NULL, NULL, dev);
>> +	if (err) {
>> +		mfd_remove_devices(dev);
>> +		dev_err(dev, "Failed to register sub-devices\n");
>> +		return err;
>> +	}
>> +#endif
> 
> And if we don't support OF?
>

These sub-devices are only present on machines that support OF so
is more flexible to use of_platform_populate() to register those.

Both machines using and not using DT, register a cros-ec-ctl which
is still a mfd_cell in the cros_devs array.

>>  	dev_info(dev, "Chrome EC device registered\n");
>>  
>>  	return 0;
> 

Best regards,
Javier
