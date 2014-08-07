From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [PATCH v6 00/10] ARM: dts: exynos: Prepare Spring
Date: Thu, 07 Aug 2014 10:40:36 +0200
Message-ID: <53E33B84.2010108@collabora.co.uk>
References: <1406940750-15880-1-git-send-email-afaerber@suse.de>	<53DC4E41.4050200@collabora.co.uk>	<CAD=FV=V_vXZLMaTMFdgr62=zRXucZA6D3PvS0Mb40he0ShHTfA@mail.gmail.com>	<53DCBC84.8080600@suse.de> <CAD=FV=WFNW_5KZvLMk0kK1JQsdWLeo2kCjpQsFuxKNSnOKzfgw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:35344 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753416AbaHGIkn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 7 Aug 2014 04:40:43 -0400
In-Reply-To: <CAD=FV=WFNW_5KZvLMk0kK1JQsdWLeo2kCjpQsFuxKNSnOKzfgw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>, =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Stephan van Schaik <stephan@synkhronix.com>, Vincent Palatin <vpalatin@chromium.org>, Tomasz Figa <t.figa@samsung.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>

Hello,

On 08/04/2014 05:42 PM, Doug Anderson wrote:
> 
> 
>> For the touchpad it seems DT support has landed in the input tree as
>> "atmel,maxtouch". Backporting just that patch does not make it work
>> though. (Tried the rejected pinctrl approach to be on the safe side.)
>> https://code.google.com/p/chromium/issues/detail?id=371114
>> https://patchwork.kernel.org/patch/3976801/
> 
> This is the same work as needed for pit and pi, I believe.  Perhaps
> Javier or Dmitry has this on their todo list?
> 
> 

I posted a couple of patches that allowed me to have the atmel touchpad working
on Peach Pit. I found two issues while testing the driver:

a) The device keycode event capabilities are hardcoded in the downstream Chrome
OS driver while the mainline driver expect these to be defined in the DT. The
property is called "linux,gpio-keymap" since it seems that the actual
implementation is using a set of GPIOs. But this is handled by the firmware
since the kernel just read a status register from the atmel T9 object.

I found the property confusing at first since it didn't have anything to do with
Linux GPIO so posted a patch to add an example to the DT binding doc in order to
make it easier to understand [0].

b) The driver overwrites the edge/level flags parsed by OF core and expects that
the IRQ type will be passed using platform data. The downstream Chrome OS driver
defaults the type to IRQF_TRIGGER_FALLING if this is not provided while the
mainline does not have a default so it's just 0 (IRQ_TYPE_NONE).

This is fixed by reading back the IRQ type from the struct irq_data when parsing
the DT data [1].

The DTS changes to make the atmel touchpad work on Peach Pit were posted in [2].
Changes for Pi were included as well since it should be the same but it was not
tested since I don't have access to that machine, testing will be highly
appreciated.

> 
> -Doug
> 

Thanks a lot and best regards,
Javier

[0]: https://lkml.org/lkml/2014/8/6/584
[1]: https://lkml.org/lkml/2014/8/7/82
[2]: https://lkml.org/lkml/2014/8/6/589
