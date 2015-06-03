From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [PATCH v4 6/8] mfd: cros_ec: Support multiple EC in a system
Date: Wed, 03 Jun 2015 12:12:19 +0200
Message-ID: <556ED303.6090401@collabora.co.uk>
References: <1433232671-27679-1-git-send-email-javier.martinez@collabora.co.uk> <1433232671-27679-7-git-send-email-javier.martinez@collabora.co.uk> <20150603085340.GL3329@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:42194 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751741AbbFCKMY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 3 Jun 2015 06:12:24 -0400
In-Reply-To: <20150603085340.GL3329@x1>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Samuel Ortiz <sameo@linux.intel.com>, Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, Bill Richardson <wfrichar@chromium.org>, Simon Glass <sjg@google.com>, Gwendal Grignou <gwendal@google.com>, Stephen Barber <smbarber@chromium.org>, Filipe Brandenburger <filbranden@google.com>, Todd Broch <tbroch@chromium.org>, Alexandru M Stan <amstan@chromium.org>, Heiko Stuebner <heiko@sntech.de>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Gwendal Grignou <gwendal@chromium.org>

Hello Lee,

Thanks a lot for your feedback.

On 06/03/2015 10:53 AM, Lee Jones wrote:
> On Tue, 02 Jun 2015, Javier Martinez Canillas wrote:
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
>> Changes since v3:
>>  - Add defines for the EC and PD index constants.
>>  - Remove cros_ec_dev_register() and declare the mfd_cells as static structs.
>>    Suggested by Lee Jones.
>>  - Add a new line before the return statement in cros_ec_dev_register().
>>    Suggested by Lee Jones.
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
>>  drivers/mfd/cros_ec.c                      |  59 +++++++++++--
>>  drivers/mfd/cros_ec_i2c.c                  |   1 -
>>  drivers/mfd/cros_ec_spi.c                  |   1 -
>>  drivers/platform/chrome/cros_ec_dev.c      | 128 ++++++++++++++++++++---------
>>  drivers/platform/chrome/cros_ec_dev.h      |   7 --
>>  drivers/platform/chrome/cros_ec_lightbar.c |  75 +++++++++--------
>>  drivers/platform/chrome/cros_ec_lpc.c      |   1 -
>>  drivers/platform/chrome/cros_ec_sysfs.c    |  48 +++++------
>>  include/linux/mfd/cros_ec.h                |  44 ++++++++--
>>  10 files changed, 240 insertions(+), 126 deletions(-)
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
>> index 08d82bfc5268..4fbb4ce8f81e 100644
>> --- a/drivers/mfd/cros_ec.c
>> +++ b/drivers/mfd/cros_ec.c
>> @@ -24,11 +24,29 @@
>>  #include <linux/mfd/core.h>
>>  #include <linux/mfd/cros_ec.h>
>>  
>> -static const struct mfd_cell cros_devs[] = {
>> -	{
>> -		.name = "cros-ec-ctl",
>> -		.id = PLATFORM_DEVID_AUTO,
>> -	},
>> +#define CROS_EC_DEV_EC_INDEX 0
>> +#define CROS_EC_DEV_PD_INDEX 1
>> +
>> +struct cros_ec_platform ec_p = {
>> +	.cmd_offset = EC_CMD_PASSTHRU_OFFSET(CROS_EC_DEV_EC_INDEX),
>> +};
>> +
>> +struct cros_ec_platform pd_p = {
>> +	.cmd_offset = EC_CMD_PASSTHRU_OFFSET(CROS_EC_DEV_PD_INDEX),
>> +};
>> +
>> +struct mfd_cell ec_cell = {
>> +	.name = "cros-ec-ctl",
>> +	.id = PLATFORM_DEVID_AUTO,
>> +	.platform_data = &ec_p,
>> +	.pdata_size = sizeof(ec_p),
>> +};
>> +
>> +struct mfd_cell ec_pd_cell = {
>> +	.name = "cros-ec-ctl",
>> +	.id = PLATFORM_DEVID_AUTO,
>> +	.platform_data = &pd_p,
>> +	.pdata_size = sizeof(pd_p),
>>  };
>>  
>>  int cros_ec_register(struct cros_ec_device *ec_dev)
>> @@ -52,14 +70,39 @@ int cros_ec_register(struct cros_ec_device *ec_dev)
>>  
>>  	cros_ec_query_all(ec_dev);
>>  
>> -	err = mfd_add_devices(dev, 0, cros_devs,
>> -			      ARRAY_SIZE(cros_devs),
>> +	if (IS_ENABLED(CONFIG_OF) && dev->of_node)
>> +		ec_p.ec_name = of_get_property(dev->of_node, "devname",
>> +					       NULL);
> 
> Has this binding already been accepted?  We don't normally allow
> "device name"properties in DT.
> 

Sigh, I now noticed that I missed the DT binding change when originally
forward porting the patches from the downstream ChromiumOS tree. I'm so
sorry about that.

ChromiumOS tree has in Documentation/devicetree/bindings/mfd/cros-ec.txt:

Optional properties (All):
- devname: name of the EC. Can be based on its function: for instance,
  for Sensor Hub, 'cros_sh', for Power Delivery MCU 'cros_pd'.
  If not present, 'cros_ec' can be assumed.

When you say that normally device names are not allowed in DT, do you mean
that "devname" is a too generic property name? (which I totally agree) or
that DT bindings shouldn't have a property to change a device's name for
something more descriptive?

Because for example, the regulator bindings has a "regulator-name" property.
If you agree I can change the property to "google,cros-ec-name" which should
be more precise.

>> +	if (!ec_p.ec_name)
>> +		ec_p.ec_name = CROS_EC_DEV_NAME;
>> +
>> +	err = mfd_add_devices(ec_dev->dev, CROS_EC_DEV_EC_INDEX, &ec_cell, 1,
>>  			      NULL, ec_dev->irq, NULL);
> 
> Take a look at how 'id' (second argument) is handled in mfd-core, then
> try to figure out why what you're doing is not correct.
>

I see, so I should not set the struct mfd_cell .id to PLATFORM_DEVID_AUTO and
just pass PLATFORM_DEVID_AUTO to mfd_add_devices() so platform_device_add()
automatically allocates a device ID and sets pdev->id_auto = true.

It was only working because CROS_EC_DEV_EC_INDEX was zero so id + cell->id
was still PLATFORM_DEVID_AUTO but for CROS_EC_DEV_PD_INDEX, it was set to
PLATFORM_DEVID_NONE...

I'll change that, thanks for pointing it out.

>>  	if (err) {
>> -		dev_err(dev, "failed to add mfd devices\n");
>> +		dev_err(dev, "failed to add ec\n");
>>  		return err;
>>  	}
> 
> [...]
> 

Best regards,
Javier
