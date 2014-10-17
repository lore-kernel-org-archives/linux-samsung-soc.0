From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH 1/9] usb: dwc2/gadget: report disconnect event from 'end
 session' irq
Date: Fri, 17 Oct 2014 12:35:39 +0200
Message-ID: <5440F0FB.609@samsung.com>
References: <1413464285-24172-1-git-send-email-m.szyprowski@samsung.com>
 <1413464285-24172-2-git-send-email-m.szyprowski@samsung.com>
 <20141016133339.GF3480@saruman>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:34247 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751650AbaJQKfn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 17 Oct 2014 06:35:43 -0400
In-reply-to: <20141016133339.GF3480@saruman>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: balbi@ti.com
Cc: linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Robert Baldyga <r.baldyga@samsung.com>, Paul Zimmerman <paulz@synopsys.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>

Hello,

On 2014-10-16 15:33, Felipe Balbi wrote:
> On Thu, Oct 16, 2014 at 02:57:57PM +0200, Marek Szyprowski wrote:
>> This patch adds a call to s3c_hsotg_disconnect() from 'end session'
>> interrupt to correctly notify gadget subsystem about unplugged usb
>> cable.
>>
>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> ---
>>   drivers/usb/dwc2/gadget.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
>> index 7b5856fadd93..119c8a3effc2 100644
>> --- a/drivers/usb/dwc2/gadget.c
>> +++ b/drivers/usb/dwc2/gadget.c
>> @@ -2279,6 +2279,12 @@ irq_retry:
>>   		dev_info(hsotg->dev, "OTGInt: %08x\n", otgint);
>>   
>>   		writel(otgint, hsotg->regs + GOTGINT);
>> +
>> +		if (otgint & GOTGINT_SES_END_DET) {
> looks like this should be done for GINTSTS_DISCONNINT.

I also would like to report it from that interrupt, but according to 
DWC2 databook
(version 2.81a) and my observations on Samsung Exynos SoCs, DISCONNINT 
interrupt
is asserted only in host mode, so in device mode we need to use 
something else.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
