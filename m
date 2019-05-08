From: =?iso-8859-1?Q?M=E5ns_Rullg=E5rd?= <mans@mansr.com>
Subject: Re: [PATCH v2] usb: core: verify devicetree nodes for disabled interfaces
Date: Wed, 08 May 2019 16:27:37 +0100
Message-ID: <yw1xpnotufti.fsf@mansr.com>
References: <106fc58c-1a4f-6605-41d7-b6031c5751a3@samsung.com>
        <CGME20190508104442eucas1p2ebdffa348465f2c28177601014614853@eucas1p2.samsung.com>
        <20190508104434.3409-1-m.szyprowski@samsung.com>
        <yw1xtve5uq1y.fsf@mansr.com>
        <e7f32280-57ec-6298-1a5d-8d2d4dc26667@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <e7f32280-57ec-6298-1a5d-8d2d4dc26667@samsung.com> (Marek
        Szyprowski's message of "Wed, 8 May 2019 15:49:22 +0200")
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Markus Reichl <m.reichl@fivetechno.de>, Krzysztof Kozlowski <krzk@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Marek Szyprowski <m.szyprowski@samsung.com> writes:

> Hi
>
> On 2019-05-08 13:46, Måns Rullgård wrote:
>> Marek Szyprowski <m.szyprowski@samsung.com> writes:
>>> Commit 01fdf179f4b0 ("usb: core: skip interfaces disabled in devicetree")
>>> add support for disabling given USB device interface by adding nodes to
>>> the USB host controller device. The mentioned commit however identifies
>>> the given USB interface node only by the 'reg' property in the host
>>> controller children nodes and then checks for their the 'status'. The USB
>>> device interface nodes however also has to have a 'compatible' property as
>>> described in Documentation/devicetree/bindings/usb/usb-device.txt. This is
>>> important, because USB host controller might have child-nodes for other
>>> purposes. For example, Exynos EHCI and OHCI drivers already define
>>> child-nodes for each physical root hub port and assigns respective PHY
>>> controller and parameters for them. This conflicts with the proposed
>>> approach and verifying for the presence of the compatible property fixes
>>> this issue without changing the bindings and the way the PHY controllers
>>> are handled by Exynos EHCI/OHCI drivers.
>>>
>>> Reported-by: Markus Reichl <m.reichl@fivetechno.de>
>>> Fixes: 01fdf179f4b0 ("usb: core: skip interfaces disabled in devicetree")
>>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>> ---
>>>   drivers/usb/core/message.c | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/drivers/usb/core/message.c b/drivers/usb/core/message.c
>>> index e844bb7b5676..6f7d047392bd 100644
>>> --- a/drivers/usb/core/message.c
>>> +++ b/drivers/usb/core/message.c
>>> @@ -2009,6 +2009,7 @@ int usb_set_configuration(struct usb_device *dev, int configuration)
>>>   		struct usb_interface *intf = cp->interface[i];
>>>
>>>   		if (intf->dev.of_node &&
>>> +		    of_find_property(intf->dev.of_node, "compatible", NULL) &&
>>>   		    !of_device_is_available(intf->dev.of_node)) {
>>>   			dev_info(&dev->dev, "skipping disabled interface %d\n",
>>>   				 intf->cur_altsetting->desc.bInterfaceNumber);
>>> -- 
>> I don't think this is the right approach.  We don't want to be adding
>> such checks everywhere the of_node is used.  A better way might be to
>> not set of_node at all in the absence of a proper "compatible" string.
>
> Right, this will be a better approach. I've just checked the code and a 
> simple check for 'compatible' property presence can be easily added in 
> drivers/usb/core/of.c in usb_of_get_device_node() and 
> usb_of_get_interface_node() functions.
>
> The second check could be added in drivers/usb/core/hub.c in 
> usb_new_device() - to ensure that the device's vid/pid matches of_node 
> compatible string.
>
> Is this okay? Or just add a latter one?

I'm not sure where the best place to check is.  Someone else will have
to weigh in on that.

>> Then there's the problem of how to resolve the incompatibility between
>> the generic USB and Exynos bindings.  One possible fix could be to use
>> a child node of the controller node to represent the root hub.  Since
>> the driver currently doesn't work at all if a devicetree has nodes for
>> USB devices, there should be no compatibility concerns.
>
> So far we don't have any use case for adding devicetree nodes for usb 
> devices under Exynos EHCI/OHCI hcd, so this shouldn't be a problem for now.

None that you know of, that is.  Regardless, the bindings are
inconsistent, and that needs to be fixed.

-- 
Måns Rullgård
