From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH 8/9] usb: dwc2/gadget: fix calls to phy control functions
 in suspend/resume code
Date: Mon, 20 Oct 2014 12:46:23 +0200
Message-ID: <5444E7FF.7080809@samsung.com>
References: <1413464285-24172-1-git-send-email-m.szyprowski@samsung.com>
 <1413464285-24172-9-git-send-email-m.szyprowski@samsung.com>
 <20141016134240.GK3480@saruman>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:34024 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753679AbaJTKq0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 20 Oct 2014 06:46:26 -0400
In-reply-to: <20141016134240.GK3480@saruman>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: balbi@ti.com
Cc: linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Robert Baldyga <r.baldyga@samsung.com>, Paul Zimmerman <paulz@synopsys.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>

Hello,

On 2014-10-16 15:42, Felipe Balbi wrote:
> On Thu, Oct 16, 2014 at 02:58:04PM +0200, Marek Szyprowski wrote:
>> This patch moves calls to phy enable/disable out of spinlock protected
>> blocks in device suspend/resume to fix incorrect caller context. Phy
>> related functions must not be called from atomic context.
>>
>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> ---
>>   drivers/usb/dwc2/gadget.c | 9 ++++++---
>>   1 file changed, 6 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
>> index cdf417a7ae63..052b1a857291 100644
>> --- a/drivers/usb/dwc2/gadget.c
>> +++ b/drivers/usb/dwc2/gadget.c
>> @@ -3656,11 +3656,13 @@ static int s3c_hsotg_suspend(struct platform_device *pdev, pm_message_t state)
>>   			 hsotg->driver->driver.name);
>>   
>>   	spin_lock_irqsave(&hsotg->lock, flags);
>> +	s3c_hsotg_core_disconnect(hsotg);
>>   	s3c_hsotg_disconnect(hsotg);
>> -	s3c_hsotg_phy_disable(hsotg);
>>   	hsotg->gadget.speed = USB_SPEED_UNKNOWN;
>>   	spin_unlock_irqrestore(&hsotg->lock, flags);
>>   
>> +	s3c_hsotg_phy_disable(hsotg);
> this is aching to have a locked version as well as an unlocked version.
> Look at what you do here. There's a minor race when you release that
> spinlock. By the time ->suspend() is called, IRQs are not yet disabled.

s3c_hsotg_core_disconnect() disconnects the udc hardware from the usb bus, so even
if the irq comes before s3c_hsotg_phy_disable(), nothing wrong happens, because the
driver state is already set to disconnected.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
