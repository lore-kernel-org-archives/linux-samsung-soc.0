From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [PATCH v2 03/10] mfd: cros_ec: Instantiate sub-devices from device
 tree
Date: Wed, 13 May 2015 13:43:47 +0200
Message-ID: <555338F3.8030507@collabora.co.uk>
References: <1431166241-15775-1-git-send-email-javier.martinez@collabora.co.uk> <1431166241-15775-4-git-send-email-javier.martinez@collabora.co.uk> <20150513113200.GJ3394@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:45546 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753445AbbEMLny (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 13 May 2015 07:43:54 -0400
In-Reply-To: <20150513113200.GJ3394@x1>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Samuel Ortiz <sameo@linux.intel.com>, Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, Bill Richardson <wfrichar@chromium.org>, Simon Glass <sjg@google.com>, Gwendal Grignou <gwendal@google.com>, Stephen Barber <smbarber@chromium.org>, Filipe Brandenburger <filbranden@google.com>, Todd Broch <tbroch@chromium.org>, Alexandru M Stan <amstan@chromium.org>, Heiko Stuebner <heiko@sntech.de>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

Hello Lee,

On 05/13/2015 01:32 PM, Lee Jones wrote:
> On Sat, 09 May 2015, Javier Martinez Canillas wrote:
> 
>> From: Todd Broch <tbroch@chromium.org>
>> 
>> If the EC device tree node has sub-nodes, try to instantiate them as
>> MFD sub-devices.  We can configure the EC features provided by the board.
>> 
>> Signed-off-by: Todd Broch <tbroch@chromium.org>
>> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
>> Tested-by: Heiko Stuebner <heiko@sntech.de>
>> Reviewed-by: Gwendal Grignou <gwendal@chromium.org>
>> Tested-by: Gwendal Grignou <gwendal@chromium.org>
>> ---
>> 
>> Changes since v1:
>>   - Added Heiko Stuebner and Gwendal Grignou Tested-by tag
>>   - Added Gwendal Grignou Reviewed-by tag
>>   - Use automatic device ID instead of 1 as suggested by Lee Jones
>>   - Remove #ifdeffery and check for of_node to register sub-devices
>>     Suggested by Lee Jones
>> ---
>>  drivers/mfd/cros_ec.c | 22 +++++++++++-----------
>>  1 file changed, 11 insertions(+), 11 deletions(-)
>> 
>> diff --git a/drivers/mfd/cros_ec.c b/drivers/mfd/cros_ec.c
>> index c4aecc6f8373..1574a9352a6d 100644
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
>> +		.id = PLATFORM_DEVID_AUTO,
>>  	},
>>  };
>>  
>> @@ -150,6 +141,15 @@ int cros_ec_register(struct cros_ec_device *ec_dev)
>>  		return err;
>>  	}
>>  
>> +	if (IS_ENABLED(CONFIG_OF) && dev->of_node) {
> 
> You don't need to check for OF.  of_node will be NULL if OF isn't
> enabled.
>

Yes, you don't need it but IS_ENABLED(CONFIG_OF) causes the check to be
optimized away by the compiler if CONFIG_OF is not enabled AFAIK.

Without the IS_ENABLED(CONFIG_OF) check, this becomes a pointless pointer
check that will always evaluate to false on systems without CONFIG_OF
since as you said of_node will be present when CONFIG_OF is not enabled.
But the compiler has no way to know it will always be NULL to optimize it
away AFAICT.
 
>> +		err = of_platform_populate(dev->of_node, NULL, NULL, dev);
>> +		if (err) {
>> +			mfd_remove_devices(dev);
>> +			dev_err(dev, "Failed to register sub-devices\n");
>> +			return err;
>> +		}
>> +	}
>> +
>>  	dev_info(dev, "Chrome EC device registered\n");
>>  
>>  	return 0;
> 

Best regards,
Javier
