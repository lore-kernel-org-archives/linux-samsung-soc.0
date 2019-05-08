From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH] usb: core: verify devicetree nodes for disabled
 interfaces
Date: Wed, 8 May 2019 12:14:20 +0200
Message-ID: <106fc58c-1a4f-6605-41d7-b6031c5751a3@samsung.com>
References: <CGME20190507125630eucas1p1c5fd171a8dc2a6b8eb9dd317fe245f0c@eucas1p1.samsung.com>
        <20190507125615.9381-1-m.szyprowski@samsung.com>
        <yw1xy33iv1lq.fsf@mansr.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <yw1xy33iv1lq.fsf@mansr.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?TcOlbnMgUnVsbGfDpXJk?= <mans@mansr.com>
Cc: linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Markus Reichl <m.reichl@fivetechno.de>, Krzysztof Kozlowski <krzk@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi

On 2019-05-07 15:24, Måns Rullgård wrote:
> Marek Szyprowski <m.szyprowski@samsung.com> writes:
>> Commit 01fdf179f4b0 ("usb: core: skip interfaces disabled in devicetree")
>> add support for disabling given USB device interface by adding nodes to
>> the USB host controller device. The mentioned commit however identifies
>> the given USB interface node only by the 'reg' property in the host
>> controller children nodes and then checks for their the 'status'. The USB
>> device interface nodes however also has to have a 'compatible' property as
>> described in Documentation/devicetree/bindings/usb/usb-device.txt. This is
>> important, because USB host controller might have child-nodes for other
>> purposes. For example, Exynos EHCI and OHCI drivers already define
>> child-nodes for each physical root hub port and assigns respective PHY
>> controller and parameters for them. This conflicts with the proposed
>> approach and verifying for the presence of the compatible property fixes
>> this issue without changing the devicetree bindings and the way the PHY
>> controllers are handled by Exynos EHCI/OHCI drivers.
>>
>> Reported-by: Markus Reichl <m.reichl@fivetechno.de>
>> Fixes: 01fdf179f4b0 ("usb: core: skip interfaces disabled in devicetree")
>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> ---
>>   drivers/usb/core/message.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/usb/core/message.c b/drivers/usb/core/message.c
>> index 82239f27c4cc..cd455c4add25 100644
>> --- a/drivers/usb/core/message.c
>> +++ b/drivers/usb/core/message.c
>> @@ -2007,6 +2007,7 @@ int usb_set_configuration(struct usb_device *dev, int configuration)
>>   		struct usb_interface *intf = cp->interface[i];
>>
>>   		if (intf->dev.of_node &&
>> +		    of_device_is_compatible(intf->dev.of_node, NULL) &&
>>   		    !of_device_is_available(intf->dev.of_node)) {
>>   			dev_info(&dev->dev, "skipping disabled interface %d\n",
>>   				 intf->cur_altsetting->desc.bInterfaceNumber);
>> -- 
> This doesn't look right.  of_device_is_compatible() with a NULL compat
> argument always returns zero.

Right, my fault. I missed that. of_find_property(intf->dev.of_node, 
"compatible", NULL) is the correct check.


> There also seems to be a broader incompatibility between the generic USB
> bindings and the use of child nodes in the Exynos bindings.

True, but frankly I have no idea how to fix this in a better way.

Exynos EHCI/OHCI bindings predates the generic USB device bindings and 
now we can only mitigate the damage caused by this conflict.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
