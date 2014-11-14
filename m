From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH v3] usb: dwc2/gadget: report disconnect event from 'end
 session' irq
Date: Fri, 14 Nov 2014 13:00:51 +0100
Message-ID: <5465EEF3.7060902@samsung.com>
References: <1413801940-31086-2-git-send-email-m.szyprowski@samsung.com>
 <1414742668-4107-1-git-send-email-m.szyprowski@samsung.com>
 <A2CA0424C0A6F04399FB9E1CD98E0304844E7F53@US01WEMBX2.internal.synopsys.com>
 <5464B496.9010000@samsung.com>
 <A2CA0424C0A6F04399FB9E1CD98E0304844EB622@US01WEMBX2.internal.synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:47779 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933262AbaKNMA4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 14 Nov 2014 07:00:56 -0500
In-reply-to: <A2CA0424C0A6F04399FB9E1CD98E0304844EB622@US01WEMBX2.internal.synopsys.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Paul Zimmerman <Paul.Zimmerman@synopsys.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
Cc: Kyungmin Park <kyungmin.park@samsung.com>, Robert Baldyga <r.baldyga@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Felipe Balbi <balbi@ti.com>

Hello,

On 2014-11-13 21:50, Paul Zimmerman wrote:
>> From: Marek Szyprowski [mailto:m.szyprowski@samsung.com]
>> Sent: Thursday, November 13, 2014 5:40 AM
>>
>> On 2014-10-31 19:15, Paul Zimmerman wrote:
>>>> From: Marek Szyprowski [mailto:m.szyprowski@samsung.com]
>>>> Sent: Friday, October 31, 2014 1:04 AM
>>>> To: linux-usb@vger.kernel.org; linux-samsung-soc@vger.kernel.org
>>>> Cc: Marek Szyprowski; Kyungmin Park; Robert Baldyga; Paul Zimmerman; Krzysztof Kozlowski; Felipe
>> Balbi
>>>> Subject: [PATCH v3] usb: dwc2/gadget: report disconnect event from 'end session' irq
>>>>
>>>> This patch adds a call to s3c_hsotg_disconnect() from 'end session'
>>>> interrupt (GOTGINT_SES_END_DET) to correctly notify gadget subsystem
>>>> about unplugged usb cable. 'disconnected' interrupt (DISCONNINT) might
>>>> look a bit more suitable for this event, but it is asserted only in
>>>> host mode, so in device mode we need to use something else.
>>>>
>>>> Additional check has been added in s3c_hsotg_disconnect() function
>>>> to ensure that the event is reported only once after successful device
>>>> enumeration.
>>>>
>>>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>>> ---
>>>>    drivers/usb/dwc2/core.h   |  1 +
>>>>    drivers/usb/dwc2/gadget.c | 10 ++++++++++
>>>>    2 files changed, 11 insertions(+)
>>>>
>>>> diff --git a/drivers/usb/dwc2/core.h b/drivers/usb/dwc2/core.h
>>>> index 55c90c53f2d6..b42df32e7737 100644
>>>> --- a/drivers/usb/dwc2/core.h
>>>> +++ b/drivers/usb/dwc2/core.h
>>>> @@ -212,6 +212,7 @@ struct s3c_hsotg {
>>>>    	struct usb_gadget       gadget;
>>>>    	unsigned int            setup;
>>>>    	unsigned long           last_rst;
>>>> +	unsigned int		address;
>>>>    	struct s3c_hsotg_ep     *eps;
>>>>    };
>>>>
>>>> diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
>>>> index fcd2bb55ccca..6304efba11aa 100644
>>>> --- a/drivers/usb/dwc2/gadget.c
>>>> +++ b/drivers/usb/dwc2/gadget.c
>>>> @@ -1114,6 +1114,7 @@ static void s3c_hsotg_process_control(struct s3c_hsotg *hsotg,
>>>>    				 DCFG_DEVADDR_SHIFT) & DCFG_DEVADDR_MASK;
>>>>    			writel(dcfg, hsotg->regs + DCFG);
>>>>
>>>> +			hsotg->address = ctrl->wValue;
>>>>    			dev_info(hsotg->dev, "new address %d\n", ctrl->wValue);
>>>>
>>>>    			ret = s3c_hsotg_send_reply(hsotg, ep0, NULL, 0);
>>>> @@ -2031,6 +2032,10 @@ static void s3c_hsotg_disconnect(struct s3c_hsotg *hsotg)
>>>>    {
>>>>    	unsigned ep;
>>>>
>>>> +	if (!hsotg->address)
>>>> +		return;
>>>> +
>>>> +	hsotg->address = 0;
>>>>    	for (ep = 0; ep < hsotg->num_of_eps; ep++)
>>>>    		kill_all_requests(hsotg, &hsotg->eps[ep], -ESHUTDOWN, true);
>>>>
>>>> @@ -2290,6 +2295,11 @@ irq_retry:
>>>>    		dev_info(hsotg->dev, "OTGInt: %08x\n", otgint);
>>>>
>>>>    		writel(otgint, hsotg->regs + GOTGINT);
>>>> +
>>>> +		if (otgint & GOTGINT_SES_END_DET) {
>>>> +			s3c_hsotg_disconnect(hsotg);
>>>> +			hsotg->gadget.speed = USB_SPEED_UNKNOWN;
>>>> +		}
>>>>    	}
>>>>
>>>>    	if (gintsts & GINTSTS_SESSREQINT) {
>>> I don't think this is right. The host can send control requests to
>>> the device before it sends a SetAddress to change from the default
>>> address of 0. So if a GOTGINT_SES_END_DET happens before the
>>> SetAddress, it will be ignored.
>>>
>>> Or am I missing something?
>> Well, right. However before finishing enumeration (setting the address)
>> host usually
>> only retrieves some usb descriptors what doesn't change the state of the
>> gadget.
>> Right now we always reported 'disconnected' event before setting the new
>> address,
>> what is a bit overkill (in some cases gadget driver got this even more
>> than once).
>> The above code handles all cases correctly and reports disconnect event
>> only once.
> Well, if the disconnect happens before the SetAddress, the disconnect
> won't be reported at all. Unless I'm reading the code wrong.

Ok, I found other way to ensure that disconnect event is reported only 
once.
I will post a patch in a few minutes.


Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
