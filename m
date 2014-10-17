From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH 3/9] usb: dwc2/gadget: fix support for soft_connect udc
 framework feature
Date: Fri, 17 Oct 2014 12:43:48 +0200
Message-ID: <5440F2E4.3030901@samsung.com>
References: <1413464285-24172-1-git-send-email-m.szyprowski@samsung.com>
 <1413464285-24172-4-git-send-email-m.szyprowski@samsung.com>
 <20141016133610.GH3480@saruman>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:34661 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751632AbaJQKnv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 17 Oct 2014 06:43:51 -0400
In-reply-to: <20141016133610.GH3480@saruman>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: balbi@ti.com
Cc: linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Robert Baldyga <r.baldyga@samsung.com>, Paul Zimmerman <paulz@synopsys.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>

Hello,

On 2014-10-16 15:36, Felipe Balbi wrote:
> On Thu, Oct 16, 2014 at 02:57:59PM +0200, Marek Szyprowski wrote:
>> Enabling and disabling usb gadget by writing to
>> /sys/class/udc/*hsotg/soft_connect results in calling udc_start/udc_stop
>> functions with the same usb gadget driver, so the driver should not WARN
>> about such case.
>>
>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> ---
>>   drivers/usb/dwc2/gadget.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
>> index 8870e38c1d82..37fda4c03397 100644
>> --- a/drivers/usb/dwc2/gadget.c
>> +++ b/drivers/usb/dwc2/gadget.c
>> @@ -2892,7 +2892,7 @@ static int s3c_hsotg_udc_start(struct usb_gadget *gadget,
>>   		return -EINVAL;
>>   	}
>>   
>> -	WARN_ON(hsotg->driver);
>> +	WARN_ON(hsotg->driver && hsotg->driver != driver);
> the bug is in your ->udc_stop(). You should clear hsotg->driver to NULL
> there.

Ok, I will change udc_stop() to always zero hsotg->driver, like other udc
drivers. I was a bit confused by the fact that udc core passes driver to
udc_stop(), when called from soft_connect and NULL on gadget removal.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
