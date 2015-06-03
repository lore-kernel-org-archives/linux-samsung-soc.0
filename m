From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [PATCH v4 6/8] mfd: cros_ec: Support multiple EC in a system
Date: Wed, 03 Jun 2015 13:49:03 +0200
Message-ID: <556EE9AF.6030303@collabora.co.uk>
References: <1433232671-27679-1-git-send-email-javier.martinez@collabora.co.uk> <1433232671-27679-7-git-send-email-javier.martinez@collabora.co.uk> <20150603085340.GL3329@x1> <556ED303.6090401@collabora.co.uk> <20150603112741.GA12304@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:42356 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755059AbbFCLtK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 3 Jun 2015 07:49:10 -0400
In-Reply-To: <20150603112741.GA12304@x1>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Samuel Ortiz <sameo@linux.intel.com>, Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, Bill Richardson <wfrichar@chromium.org>, Simon Glass <sjg@google.com>, Gwendal Grignou <gwendal@google.com>, Stephen Barber <smbarber@chromium.org>, Filipe Brandenburger <filbranden@google.com>, Todd Broch <tbroch@chromium.org>, Alexandru M Stan <amstan@chromium.org>, Heiko Stuebner <heiko@sntech.de>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Gwendal Grignou <gwendal@chromium.org>

Hello Lee,

On 06/03/2015 01:27 PM, Lee Jones wrote:
> On Wed, 03 Jun 2015, Javier Martinez Canillas wrote:

[snip]

>> >>  
>> >> -	err = mfd_add_devices(dev, 0, cros_devs,
>> >> -			      ARRAY_SIZE(cros_devs),
>> >> +	if (IS_ENABLED(CONFIG_OF) && dev->of_node)
>> >> +		ec_p.ec_name = of_get_property(dev->of_node, "devname",
>> >> +					       NULL);
>> > 
>> > Has this binding already been accepted?  We don't normally allow
>> > "device name"properties in DT.
>> > 
>> 
>> Sigh, I now noticed that I missed the DT binding change when originally
>> forward porting the patches from the downstream ChromiumOS tree. I'm so
>> sorry about that.
>> 
>> ChromiumOS tree has in Documentation/devicetree/bindings/mfd/cros-ec.txt:
>> 
>> Optional properties (All):
>> - devname: name of the EC. Can be based on its function: for instance,
>>   for Sensor Hub, 'cros_sh', for Power Delivery MCU 'cros_pd'.
>>   If not present, 'cros_ec' can be assumed.
>> 
>> When you say that normally device names are not allowed in DT, do you mean
>> that "devname" is a too generic property name? (which I totally agree) or
>> that DT bindings shouldn't have a property to change a device's name for
>> something more descriptive?
>> 
>> Because for example, the regulator bindings has a "regulator-name" property.
>> If you agree I can change the property to "google,cros-ec-name" which should
>> be more precise.
> 
> I mean, no names of devices are allowed in Device Tree:
> 
>   `git grep name -- arch/arm/boot/dts/ | grep dev`
> 

Ok, but do you agree on having a "google,cros-ec-name" (with no dev on it)
property to define the resource name just like regulators have "regulator-name"
that changes what is shown in /sys/kernel/debug/regulator/$name?

Otherwise all the EC's will be named cros_ec or regardless of their function
and this is shown in both /dev/$name and /sys/class/chromeos/$name.

Best regards,
Javier
