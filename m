From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [PATCH v5 7/9] mfd: cros_ec: Support multiple EC in a system
Date: Wed, 03 Jun 2015 16:08:16 +0200
Message-ID: <556F0A50.20600@collabora.co.uk>
References: <1433336644-20532-1-git-send-email-javier.martinez@collabora.co.uk> <1433336644-20532-8-git-send-email-javier.martinez@collabora.co.uk> <20150603134951.GD12304@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:42565 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755206AbbFCOIY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 3 Jun 2015 10:08:24 -0400
In-Reply-To: <20150603134951.GD12304@x1>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Samuel Ortiz <sameo@linux.intel.com>, Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, Bill Richardson <wfrichar@chromium.org>, Simon Glass <sjg@google.com>, Gwendal Grignou <gwendal@google.com>, Stephen Barber <smbarber@chromium.org>, Filipe Brandenburger <filbranden@google.com>, Todd Broch <tbroch@chromium.org>, Alexandru M Stan <amstan@chromium.org>, Heiko Stuebner <heiko@sntech.de>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Gwendal Grignou <gwendal@chromium.org>

Hello Lee,

On 06/03/2015 03:49 PM, Lee Jones wrote:

[...]

>>  
>>  int cros_ec_register(struct cros_ec_device *ec_dev)
>> @@ -52,14 +68,39 @@ int cros_ec_register(struct cros_ec_device *ec_dev)
>>  
>>  	cros_ec_query_all(ec_dev);
>>  
>> -	err = mfd_add_devices(dev, 0, cros_devs,
>> -			      ARRAY_SIZE(cros_devs),
>> +	if (IS_ENABLED(CONFIG_OF) && dev->of_node)
>> +		ec_p.ec_name = of_get_property(dev->of_node,
>> +					       "google,cros-ec-name", NULL);
> 
> NACK
> 
> You either need to obtain this another way, or have a chat with the DT
> Maintainers and explain why this platform is special enough to break
> the normal conventions.
> 
> HINT: I different compatible string is normally more amenable, but
> this will also require a DT ACK for me to take it through.
>

Ok, I'll just remove the property then. After all the driver only supports
two types of controllers currently, the normal host EC and the Power Delivery
(PD) one. And there isn't a DTS even in the downstream ChromiumOS tree that
is setting a different EC name right now.

I guess the idea of the binding was to make it future proof from when the
driver supports more types of controllers but I'll let Gwendal to comment on
this since he is the author of these patches.

>> +	if (!ec_p.ec_name)
>> +		ec_p.ec_name = CROS_EC_DEV_NAME;
>> +
>> +	err = mfd_add_devices(ec_dev->dev, PLATFORM_DEVID_AUTO, &ec_cell, 1,
>>  			      NULL, ec_dev->irq, NULL);
>>  	if (err) {
>> -		dev_err(dev, "failed to add mfd devices\n");
>> +		dev_err(dev, "failed to add ec\n");
> 
> Might be nice to expand 'ec' so your users have half a chance in
> deciphering what just went wrong.
>

I will, thanks a lot for your feedback.
 
> [...]
> 

Best regards,
Javier
