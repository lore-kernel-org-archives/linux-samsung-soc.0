From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH v6 1/5] usb: phy: samsung: Introducing usb phy driver
 for hsotg
Date: Tue, 25 Sep 2012 07:18:57 -0500
Message-ID: <5061A131.9010905@gmail.com>
References: <1347886484-16064-1-git-send-email-p.paneri@samsung.com> <1347886484-16064-2-git-send-email-p.paneri@samsung.com> <50605A69.2070201@gmail.com> <CAD6zSYOABTwTGXgFwGwLX-NhjDjDvtqUDVYTMGDng3nuTgLeZg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f174.google.com ([209.85.214.174]:56939 "EHLO
	mail-ob0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753469Ab2IYMTA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 25 Sep 2012 08:19:00 -0400
In-Reply-To: <CAD6zSYOABTwTGXgFwGwLX-NhjDjDvtqUDVYTMGDng3nuTgLeZg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Praveen Paneri <p.paneri@samsung.com>
Cc: linux-usb@vger.kernel.org, l.majewski@samsung.com, kgene.kim@samsung.com, heiko@sntech.de, gregkh@linuxfoundation.org, devicetree-discuss@lists.ozlabs.org, broonie@opensource.wolfsonmicro.com, balbi@ti.com, grant.likely@secretlab.ca, kyungmin.park@samsung.com, linux-samsung-soc@vger.kernel.org, thomas.abraham@linaro.org, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org

On 09/25/2012 06:23 AM, Praveen Paneri wrote:
> Hi Rob,
> 
> On Mon, Sep 24, 2012 at 6:34 PM, Rob Herring <robherring2@gmail.com> wrote:
>> On 09/17/2012 07:54 AM, Praveen Paneri wrote:
>>> This driver uses usb_phy interface to interact with s3c-hsotg. Supports
>>> phy_init and phy_shutdown functions to enable/disable phy. Tested with
>>> smdk6410 and smdkv310. More SoCs can be brought under later.
>>>
>>> Signed-off-by: Praveen Paneri <p.paneri@samsung.com>
>>> Acked-by: Heiko Stuebner <heiko@sntech.de>
>>> ---
>>>  .../devicetree/bindings/usb/samsung-usbphy.txt     |    9 +
>>>  drivers/usb/phy/Kconfig                            |    8 +
>>>  drivers/usb/phy/Makefile                           |    1 +
>>>  drivers/usb/phy/samsung-usbphy.c                   |  360 ++++++++++++++++++++
>>>  include/linux/platform_data/samsung-usbphy.h       |   27 ++
>>>  5 files changed, 405 insertions(+), 0 deletions(-)
>>>  create mode 100644 Documentation/devicetree/bindings/usb/samsung-usbphy.txt
>>>  create mode 100644 drivers/usb/phy/samsung-usbphy.c
>>>  create mode 100644 include/linux/platform_data/samsung-usbphy.h
>>>
>>> diff --git a/Documentation/devicetree/bindings/usb/samsung-usbphy.txt b/Documentation/devicetree/bindings/usb/samsung-usbphy.txt
>>> new file mode 100644
>>> index 0000000..fefd9c8
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/usb/samsung-usbphy.txt
>>> @@ -0,0 +1,9 @@
>>> +* Samsung's usb phy transceiver
>>> +
>>> +The Samsung's phy transceiver is used for controlling usb otg phy for
>>> +s3c-hsotg usb device controller.
>>> +
>>> +Required properties:
>>> +- compatible : should be "samsung,exynos4210-usbphy"
>>> +- reg : base physical address of the phy registers and length of memory mapped
>>> +     region.
>>
>> What's missing here is describing the connection of phys to host
>> controllers. We've got several people adding usb phy bindings and need
>> to define them in a common way.
> yes! it just covers the generic binding. I will update it accordingly
> as the generic phy framework takes its final shape.

That sounds like the wrong way to define a binding... Figuring out how
to describe the h/w should not be dependent on changes in the kernel.
Bindings are an ABI and should not be evolving.

Rob
