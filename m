From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [PATCH v3 6/6] mfd: cros_ec: Instantiate sub-devices from device
 tree
Date: Thu, 18 Sep 2014 09:49:28 +0200
Message-ID: <541A8E88.6050707@collabora.co.uk>
References: <1410428289-18229-1-git-send-email-javier.martinez@collabora.co.uk> <1410428289-18229-7-git-send-email-javier.martinez@collabora.co.uk> <20140917163114.GL30918@lee--X1>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:40724 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750738AbaIRHtf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 18 Sep 2014 03:49:35 -0400
In-Reply-To: <20140917163114.GL30918@lee--X1>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Wolfram Sang <wsa@the-dreams.de>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Doug Anderson <dianders@chromium.org>, Simon Glass <sjg@chromium.org>, Bill Richardson <wfrichar@chromium.org>, Andrew Bresticker <abrestic@chromium.org>, Derek Basehore <dbasehore@chromium.org>, Todd Broch <tbroch@chromium.org>, Olof Johansson <olof@lixom.net>, Andreas Faerber <afaerber@suse.de>, linux-i2c@vger.kernel.org, linux-samsung-soc@vger.kernel.org

Hello Lee,

On 09/17/2014 06:31 PM, Lee Jones wrote:
>>  
>> -static const struct mfd_cell cros_devs[] = {
>> -	{
>> -		.name = "cros-ec-keyb",
>> -		.id = 1,
>> -		.of_compatible = "google,cros-ec-keyb",
>> -	},
>> -	{
>> -		.name = "cros-ec-i2c-tunnel",
>> -		.id = 2,
>> -		.of_compatible = "google,cros-ec-i2c-tunnel",
>> -	},
>> -};
>> -
>>  int cros_ec_register(struct cros_ec_device *ec_dev)
>>  {
>>  	struct device *dev = ec_dev->dev;
>> +	struct device_node *node = dev->of_node;
>>  	int err = 0;
>>  
>>  	if (ec_dev->din_size) {
>> @@ -140,12 +129,12 @@ int cros_ec_register(struct cros_ec_device *ec_dev)
>>  
>>  	mutex_init(&ec_dev->lock);
>>  
>> -	err = mfd_add_devices(dev, 0, cros_devs,
>> -			      ARRAY_SIZE(cros_devs),
>> -			      NULL, ec_dev->irq, NULL);
>> -	if (err) {
>> -		dev_err(dev, "failed to add mfd devices\n");
>> -		return err;
> 
> So these devices will only ever probe with DT now ...
>

Well, these are preparatory patches to reduce the delta between upstream and
the downstream so the missing functionality could be added. One of the missing
drivers is the cros_ec_dev.c [0] which allows user-space to access the
ChromeOS Embedded Controller using a virtual character device (/dev/cros_ec).

Since that is a virtual device, it does not fit on the DT which only describes
hw and also is used on x86 machines so that subdevice is still probed using
mfd_add_devices() and the mfd_cells array is not empty in the downstream
cros_ec driver [1].

That's why I didn't just made the cros_ec MFD to depend on OF, since I didn't
want to diverge too much from the downstream driver because the idea of the
series was to reduce the difference in order to add the missing bits on top.

>> +	if (node) {
> 
> So it would be wrong for dev->of_node not to be populated.
> 

As explained above, DT, non-DT and x86 platforms instantiate the cros-ec-dev
cells but DT platforms can define other child nodes. But I can remove the
conditional if you want and reintroduce it once cros-ec-dev support is added.

>> +		err = of_platform_populate(node, NULL, NULL, dev);
>> +		if (err) {
>> +			dev_err(dev, "Failed to register subordinate devices");
>> +			return err;
>> +		}
>>  	}
>>  
>>  	dev_info(dev, "Chrome EC device registered\n");
> 

Best regards,
Javier

[0]:
https://chromium.googlesource.com/chromiumos/third_party/kernel/+/chromeos-3.8/drivers/mfd/cros_ec_dev.c
[1]:
https://chromium.googlesource.com/chromiumos/third_party/kernel/+/chromeos-3.8/drivers/mfd/cros_ec.c#93
