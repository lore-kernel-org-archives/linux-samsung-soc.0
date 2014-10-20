From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH 6/9] usb: dwc2/gadget: decouple setting soft disconnect
 from s3c_hsotg_core_init
Date: Mon, 20 Oct 2014 12:46:17 +0200
Message-ID: <5444E7F9.1060709@samsung.com>
References: <1413464285-24172-1-git-send-email-m.szyprowski@samsung.com>
 <1413464285-24172-7-git-send-email-m.szyprowski@samsung.com>
 <20141016133826.GI3480@saruman>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:16297 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753672AbaJTKqU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 20 Oct 2014 06:46:20 -0400
In-reply-to: <20141016133826.GI3480@saruman>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: balbi@ti.com
Cc: linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Robert Baldyga <r.baldyga@samsung.com>, Paul Zimmerman <paulz@synopsys.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>

Hello,

On 2014-10-16 15:38, Felipe Balbi wrote:
> On Thu, Oct 16, 2014 at 02:58:02PM +0200, Marek Szyprowski wrote:
>> This patch changes s3c_hsotg_core_init function to leave hardware in
>> soft disconnect mode, so the actual moment of coupling the hardware to
>> the usb bus can be later controlled by the driver in the more accurate
> what is this "more accurate way" you talk about ? Why is it more
> accurate ? Perhaps you have failed some USB Certification test ? Which
> test id was that ? Why did it fail ? and why does this patch solve the
> issue ?

This patch is just a preparation for the next patches, which introduces 
usage
of soft-disconnect feature in pullup() method.

>> way. For this purpose, separate functions for enabling and disabling
>> soft disconnect mode have been added.
>>
>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> ---
>>   drivers/usb/dwc2/gadget.c | 22 +++++++++++++++++-----
>>   1 file changed, 17 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
>> index 1ba0682fb252..d039334967d7 100644
>> --- a/drivers/usb/dwc2/gadget.c
>> +++ b/drivers/usb/dwc2/gadget.c
>> @@ -2124,7 +2124,7 @@ static int s3c_hsotg_corereset(struct s3c_hsotg *hsotg)
>>    *
>>    * Issue a soft reset to the core, and await the core finishing it.
>>    */
>> -static void s3c_hsotg_core_init(struct s3c_hsotg *hsotg)
>> +static void s3c_hsotg_core_init_disconnected(struct s3c_hsotg *hsotg)
>>   {
>>   	s3c_hsotg_corereset(hsotg);
>>   
>> @@ -2241,14 +2241,23 @@ static void s3c_hsotg_core_init(struct s3c_hsotg *hsotg)
>>   		readl(hsotg->regs + DOEPCTL0));
>>   
>>   	/* clear global NAKs */
>> -	writel(DCTL_CGOUTNAK | DCTL_CGNPINNAK,
>> +	writel(DCTL_CGOUTNAK | DCTL_CGNPINNAK | DCTL_SFTDISCON,
>>   	       hsotg->regs + DCTL);
>>   
>>   	/* must be at-least 3ms to allow bus to see disconnect */
>>   	mdelay(3);
>>   
>>   	hsotg->last_rst = jiffies;
>> +}
>> +
>> +static void s3c_hsotg_core_disconnect(struct s3c_hsotg *hsotg)
>> +{
>> +	/* set the soft-disconnect bit */
>> +	__orr32(hsotg->regs + DCTL, DCTL_SFTDISCON);
>> +}
>>   
>> +static void s3c_hsotg_core_connect(struct s3c_hsotg *hsotg)
>> +{
>>   	/* remove the soft-disconnect and let's go */
>>   	__bic32(hsotg->regs + DCTL, DCTL_SFTDISCON);
>>   }
>> @@ -2348,7 +2357,8 @@ irq_retry:
>>   				kill_all_requests(hsotg, &hsotg->eps[0],
>>   							  -ECONNRESET, true);
>>   
>> -				s3c_hsotg_core_init(hsotg);
>> +				s3c_hsotg_core_init_disconnected(hsotg);
>> +				s3c_hsotg_core_connect(hsotg);
>>   			}
>>   		}
>>   	}
>> @@ -2983,7 +2993,8 @@ static int s3c_hsotg_pullup(struct usb_gadget *gadget, int is_on)
>>   	if (is_on) {
>>   		s3c_hsotg_phy_enable(hsotg);
>>   		clk_enable(hsotg->clk);
>> -		s3c_hsotg_core_init(hsotg);
>> +		s3c_hsotg_core_init_disconnected(hsotg);
>> +		s3c_hsotg_core_connect(hsotg);
>>   	} else {
>>   		clk_disable(hsotg->clk);
>>   		s3c_hsotg_phy_disable(hsotg);
>> @@ -3670,7 +3681,8 @@ static int s3c_hsotg_resume(struct platform_device *pdev)
>>   
>>   	spin_lock_irqsave(&hsotg->lock, flags);
>>   	s3c_hsotg_phy_enable(hsotg);
>> -	s3c_hsotg_core_init(hsotg);
>> +	s3c_hsotg_core_init_disconnect(hsotg);
>> +	s3c_hsotg_core_connect(hsotg);
>>   	spin_unlock_irqrestore(&hsotg->lock, flags);
>>   
>>   	return ret;
>> -- 
>> 1.9.2
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-usb" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
