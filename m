From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [PATCH v3 6/7] mfd: cros_ec: Support multiple EC in a system
Date: Thu, 28 May 2015 16:00:47 +0200
Message-ID: <55671F8F.1090500@collabora.co.uk>
References: <1432309340-13688-1-git-send-email-javier.martinez@collabora.co.uk> <1432309340-13688-7-git-send-email-javier.martinez@collabora.co.uk> <20150527091154.GX11677@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:35305 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753904AbbE1OAx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 28 May 2015 10:00:53 -0400
In-Reply-To: <20150527091154.GX11677@x1>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Samuel Ortiz <sameo@linux.intel.com>, Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, Bill Richardson <wfrichar@chromium.org>, Simon Glass <sjg@google.com>, Gwendal Grignou <gwendal@google.com>, Stephen Barber <smbarber@chromium.org>, Filipe Brandenburger <filbranden@google.com>, Todd Broch <tbroch@chromium.org>, Alexandru M Stan <amstan@chromium.org>, Heiko Stuebner <heiko@sntech.de>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Gwendal Grignou <gwendal@chromium.org>

Hello Lee,

Thanks a lot for your feedback.

On 05/27/2015 11:11 AM, Lee Jones wrote:
> On Fri, 22 May 2015, Javier Martinez Canillas wrote:
> 
>> From: Gwendal Grignou <gwendal@chromium.org>
>> 
>> Chromebooks can have more than one Embedded Controller so the
>> cros_ec device id has to be incremented for each EC registered.
>> 
>> Add code to handle multiple EC. First ec found is cros-ec0,
>> second cros-ec1 and so on.
>> 
>> Add a new structure to represent multiple EC as different char
>> devices (e.g: /dev/cros_ec, /dev/cros_pd). It connects to
>> cros_ec_device and allows sysfs inferface for cros_pd.
>> 
>> Also reduce number of allocated objects, make chromeos sysfs
>> class object a static and add refcounting to prevent object
>> deletion while command is in progress.
>> 
>> Signed-off-by: Gwendal Grignou <gwendal@chromium.org>
>> Reviewed-by: Dmitry Torokhov <dtor@chromium.org>
>> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
>> ---
>> 
>> Changes since v2: None
>> 
>> Changes since v1:
>>   - Squash patch that adds support to represent EC's as different
>>     char devices (e.g: /dev/cros_ec, /dev/cros_pd):
>>     https://chromium-review.googlesource.com/#/c/217297/
>>     Suggested by Gwendal Grignou
>>   - Use cros_ec instead of cros-ec in the subject line to be consistent.
>>     Suggested by Gwendal Grignou
>> ---
>>  drivers/input/keyboard/cros_ec_keyb.c      |   2 +-
>>  drivers/mfd/cros_ec.c                      |  66 +++++++++++++--
>>  drivers/mfd/cros_ec_i2c.c                  |   1 -
>>  drivers/mfd/cros_ec_spi.c                  |   1 -
>>  drivers/platform/chrome/cros_ec_dev.c      | 128 ++++++++++++++++++++---------
>>  drivers/platform/chrome/cros_ec_dev.h      |   7 --
>>  drivers/platform/chrome/cros_ec_lightbar.c |  75 +++++++++--------
>>  drivers/platform/chrome/cros_ec_lpc.c      |   1 -
>>  drivers/platform/chrome/cros_ec_sysfs.c    |  48 +++++------
>>  include/linux/mfd/cros_ec.h                |  44 ++++++++--
>>  10 files changed, 247 insertions(+), 126 deletions(-)
>> 
>> diff --git a/drivers/input/keyboard/cros_ec_keyb.c b/drivers/input/keyboard/cros_ec_keyb.c
>> index 974154a74505..b01966dc7eb3 100644
>> --- a/drivers/input/keyboard/cros_ec_keyb.c
>> +++ b/drivers/input/keyboard/cros_ec_keyb.c
>> @@ -275,7 +275,7 @@ static int cros_ec_keyb_probe(struct platform_device *pdev)
>>  	ckdev->dev = dev;
>>  	dev_set_drvdata(&pdev->dev, ckdev);
>>  
>> -	idev->name = ec->ec_name;
>> +	idev->name = CROS_EC_DEV_NAME;
>>  	idev->phys = ec->phys_name;
>>  	__set_bit(EV_REP, idev->evbit);
>>  
>> diff --git a/drivers/mfd/cros_ec.c b/drivers/mfd/cros_ec.c
>> index 08d82bfc5268..99292bc2fe5f 100644
>> --- a/drivers/mfd/cros_ec.c
>> +++ b/drivers/mfd/cros_ec.c
>> @@ -24,12 +24,48 @@
>>  #include <linux/mfd/core.h>
>>  #include <linux/mfd/cros_ec.h>
>>  
>> -static const struct mfd_cell cros_devs[] = {
>> -	{
>> +static int dev_id;
>> +
>> +static int cros_ec_dev_register(struct cros_ec_device *ec_dev,
>> +				int dev_id, int devidx)
> 
> What's the difference between dev_id and devidx.
> 
> Confusing don't you think?

dev_id is the id that mfd_add_devices() expects and devidx is the ChromeOS
EC device index. Since the first EC is called "cros_ec" and the second one
is called "cros_pd".

I'll rename devidx to ec_dev_index to make it more clear.

> 
>> +{
>> +	struct device *dev = ec_dev->dev;
>> +	struct cros_ec_platform ec_p = {
>> +		.cmd_offset = 0,
>> +	};
>> +
>> +	struct mfd_cell ec_cell = {
>>  		.name = "cros-ec-ctl",
>>  		.id = PLATFORM_DEVID_AUTO,
>> -	},
>> -};
>> +		.platform_data = &ec_p,
>> +		.pdata_size = sizeof(ec_p),
>> +	};
> 
> Why have you bought this into here?  The convention is usually to have
> this at the top of the file, outside any functions.  Declaring and
> initialising structs inside functions makes things looks messy IMHO.
>

The problem is that not all ChromeOS EC have a chained Power Delivery (PD)
EC so on runtime the Application Processor (AP) asks the host EC if there
is a PD and only in that case calls cros_ec_dev_register() for the PD EC.

That's why the struct mfd_cell is allocated inside the function as a stack
local variable and is not declared as a static mfd cells array at the top
as it is in other MFD drivers.

> 
> 
>> +	switch (devidx) {
>> +	case 0:
> 
> Please define these.  I have no idea what devidx 0 or 1 is.
>

Ok, those are just a device index but I'll define it as CROS_EC_DEV_EC_INDEX
and CROS_EC_DEV_PD_INDEX to make it more readable.

>> +		if (IS_ENABLED(CONFIG_OF) && dev->of_node) {
>> +			ec_p.ec_name = of_get_property(dev->of_node, "devname",
>> +						       NULL);
>> +			if (ec_p.ec_name == NULL) {
> 
> if (!ec_p.ec_name)
>

Ok.

>> +				dev_dbg(dev,
>> +					"Device name not found, using default");
>> +				ec_p.ec_name = CROS_EC_DEV_NAME;
>> +			}
>> +		} else {
>> +			ec_p.ec_name = CROS_EC_DEV_NAME;
>> +		}
> 
> I'd save yourself a few lines and do:
> 
> if (OF)
>    name = get_name();
> 
> if (!name)
>    name = DEFAULT_NAME;
> 
> Then rid the 'else'.  Rid the dev_dbg() too if you can.
>

Ok.

>> +		break;
>> +	case 1:
>> +		ec_p.ec_name = CROS_EC_DEV_PD_NAME;
>> +		break;
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +
>> +	ec_p.cmd_offset = EC_CMD_PASSTHRU_OFFSET(devidx);
> 
> '\n' here.
>

Ok.

>> +	return mfd_add_devices(dev, dev_id, &ec_cell, 1,
>> +			       NULL, ec_dev->irq, NULL);
>> +}
>>  
>>  int cros_ec_register(struct cros_ec_device *ec_dev)
>>  {
>> @@ -52,14 +88,28 @@ int cros_ec_register(struct cros_ec_device *ec_dev)
>>  
>>  	cros_ec_query_all(ec_dev);
>>  
>> -	err = mfd_add_devices(dev, 0, cros_devs,
>> -			      ARRAY_SIZE(cros_devs),
>> -			      NULL, ec_dev->irq, NULL);
>> +	err = cros_ec_dev_register(ec_dev, dev_id++, 0);
>>  	if (err) {
>> -		dev_err(dev, "failed to add mfd devices\n");
>> +		dev_err(dev, "failed to add ec\n");
>>  		return err;
>>  	}
>>  
>> +	if (ec_dev->max_passthru) {
>> +		/*
>> +		 * Register a PD device as well on top of this device.
>> +		 * We make the following assumptions:
>> +		 * - behind an EC, we have a pd
>> +		 * - only one device added.
>> +		 * - the EC is responsive at init time (it is not true for a
>> +		 *   sensor hub.
>> +		 */
>> +		err = cros_ec_dev_register(ec_dev, dev_id++, 1);
> 
> I don't really like this devidx business.  Just keep it simple and
> define more than one mfd_cell structure.
>

I explained to you that this is done because the number of cells depends on
the system. I can have an array of mfd_cell structures and use the index to
register but I don't think that is easier to understand.

>> +		if (err) {
>> +			dev_err(dev, "failed to add additional ec\n");
>> +			return err;
>> +		}
>> +	}
>> +
>>  	if (IS_ENABLED(CONFIG_OF) && dev->of_node) {
>>  		err = of_platform_populate(dev->of_node, NULL, NULL, dev);
>>  		if (err) {
> 

Best regards,
Javier
