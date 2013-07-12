From: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH] usb: phy: samsung-usb2: Toggle HSIC GPIO from device tree
Date: Fri, 12 Jul 2013 09:48:54 +0900
Message-ID: <001701ce7e99$95b2c460$c1184d20$@samsung.com>
References: <1373416455-30358-1-git-send-email-jwerner@chromium.org>
 <000901ce7dc8$90a819b0$b1f84d10$@samsung.com>
 <CAODwPW-=bo2BqcHopY32N76p6DDGNDmCrKFo1R4gEEZhsG-DYg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:33693 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932120Ab3GLAs4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 11 Jul 2013 20:48:56 -0400
In-reply-to: <CAODwPW-=bo2BqcHopY32N76p6DDGNDmCrKFo1R4gEEZhsG-DYg@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>, 'Dongjin Kim' <tobetter@gmail.com>
Cc: 'Julius Werner' <jwerner@chromium.org>, 'LKML' <linux-kernel@vger.kernel.org>, 'Felipe Balbi' <balbi@ti.com>, linux-usb@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org, 'Vivek Gautam' <gautam.vivek@samsung.com>, 'Praveen Paneri' <p.paneri@samsung.com>, 'Kukjin Kim' <kgene.kim@samsung.com>, 'Tushar Behera' <tushar.behera@linaro.org>, 'Doug Anderson' <dianders@chromium.org>, 'Olof Johansson' <olofj@chromium.org>, 'Vincent Palatin' <vpalatin@chromium.org>, 'Thomas Abraham' <thomas.abraham@linaro.org>, 'Fabio Estevam' <festevam@gmail.com>, 'Philipp Zabel' <p.zabel@pengutronix.de>, Yulgon Kim <yulgon.kim@samsung.com>, Jingoo Han <jg1.han@samsung.com>

On Friday, July 12, 2013 6:46 AM, Julius Werner wrote:
> 
> Hi Jingoo,
> 
> Yeah, I followed that discussion back then, but it seems to have
> stalled a little (at least the HSIC patches haven't been picked up in
> any kernel.org repo yet to my knowledge).
> 
> The problem is that I think these approaches cannot work reliably. I
> agree that it would be nice to control the HSIC device from its own
> driver, and have spent quite some time playing around with the
> usb/misc/usb3503.c driver to try to make this work... but there's a
> timing dependency here that you just can't model correctly with
> independent drivers.
> 
> If the HSIC device is already active during boot (e.g. because it was
> used by firmware), there's always a chance that the USB stack will
> come up before the driver that resets it does. The device will be
> enumerated as normal, and when the other driver later pulls the reset
> signal the USB stack will not notice because there is no real
> disconnect detection on HSIC. Only when you eventually try to send
> another transfer to the device will you start to get timeouts, and the
> newly reset device will not be able to reenumerate because the host
> never asks it to.
> 
> I really don't see how you could solve this without putting some kind
> of synchronization mechanism in the USB drivers. So this leaves
> ehci-s5p and phy-samsung-usb2 as the only possible places, and I chose
> the latter since all the host-side HSIC initialization is also there
> already. I think if you think of it as "reset whatever is on the other
> side of this PHY", it's okay to put it as an optional feature into the
> PHY driver.

CC'ed Tomasz Figa, Dongjin Kim, Yulgon Kim


Hi Tomasz, Dongjin,

Julius Werner wants to put 'SMSC 3503 hub reset on Arndale board'
to 'phy-samsung-usb*.c' files, because there is a timing dependency
above mentioned.
The following is the original patch sent by Julius Werner two day ago.
(http://www.spinics.net/lists/linux-samsung-soc/msg20250.html)

Previously, Olof mentioned that 'drivers/platform/arm/' would be used.
(http://patches.linaro.org/16856/)

Also, another way was mentioned by Fabio Estevam, using 
'drivers/reset/gpio-reset.c' which is not merged yet.
(http://permalink.gmane.org/gmane.linux.drivers.devicetree/36830)

I think that 'phy-samsung-usb*.c' files are not a good place.
However, Julius Werner's comment looks reasonable enough.

If you have a comment, please feel free to share it. :)
Thank you.

Best regards,
Jingoo Han
