From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH v2 06/10] usb: dwc2/gadget: decouple setting
 soft-disconnect from s3c_hsotg_core_init
Date: Mon, 27 Oct 2014 14:52:58 +0100
Message-ID: <544E4E3A.7090905@samsung.com>
References: <1413801940-31086-1-git-send-email-m.szyprowski@samsung.com>
 <1413801940-31086-7-git-send-email-m.szyprowski@samsung.com>
 <A2CA0424C0A6F04399FB9E1CD98E0304844E5B97@US01WEMBX2.internal.synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:46480 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752778AbaJ0NxD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 27 Oct 2014 09:53:03 -0400
In-reply-to: <A2CA0424C0A6F04399FB9E1CD98E0304844E5B97@US01WEMBX2.internal.synopsys.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Paul Zimmerman <Paul.Zimmerman@synopsys.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
Cc: Felipe Balbi <balbi@ti.com>, Kyungmin Park <kyungmin.park@samsung.com>, Robert Baldyga <r.baldyga@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>

Hello,

On 2014-10-25 02:35, Paul Zimmerman wrote:
>> From: Marek Szyprowski [mailto:m.szyprowski@samsung.com]
>> Sent: Monday, October 20, 2014 3:46 AM
>>
>> This patch changes s3c_hsotg_core_init function to leave hardware in
>> soft disconnect mode, so the moment of coupling the hardware to the usb
>> bus can be later controlled by the separate functions for enabling and
>> disabling soft disconnect mode. This patch is a preparation to rework
>> pullup() method.
>>
>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> ---
>>   drivers/usb/dwc2/gadget.c | 22 +++++++++++++++++-----
>>   1 file changed, 17 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
>> index c1dad46bbbdd..5eb2473031c4 100644
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
> I'm not really happy with adding more uses of these __orr32, __bic32
> functions. When I first saw those, I went 'wtf?", because with the
> assembly-sounding names, they look like some special ARM instruction
> or something.
>
> But I guess cleaning that up can wait for a future patch series, so OK.

Those functions are really convenient, but I agree we need a better 
names for
them.

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
>> @@ -2981,7 +2991,8 @@ static int s3c_hsotg_pullup(struct usb_gadget *gadget, int is_on)
>>   	if (is_on) {
>>   		s3c_hsotg_phy_enable(hsotg);
>>   		clk_enable(hsotg->clk);
>> -		s3c_hsotg_core_init(hsotg);
>> +		s3c_hsotg_core_init_disconnected(hsotg);
>> +		s3c_hsotg_core_connect(hsotg);
>>   	} else {
>>   		clk_disable(hsotg->clk);
>>   		s3c_hsotg_phy_disable(hsotg);
>> @@ -3668,7 +3679,8 @@ static int s3c_hsotg_resume(struct platform_device *pdev)
>>
>>   	spin_lock_irqsave(&hsotg->lock, flags);
>>   	s3c_hsotg_phy_enable(hsotg);
>> -	s3c_hsotg_core_init(hsotg);
>> +	s3c_hsotg_core_init_disconnected(hsotg);
>> +	s3c_hsotg_core_connect(hsotg);
>>   	spin_unlock_irqrestore(&hsotg->lock, flags);
>>
>>   	return ret;
> Acked-by: Paul Zimmerman <paulz@synopsys.com>

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
