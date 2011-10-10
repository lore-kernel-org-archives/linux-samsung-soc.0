From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH V2 1/2] ARM: S3C2410: Add __init attribute to usb_simtec_init()
Date: Mon, 10 Oct 2011 09:39:30 +0530
Message-ID: <4E926FFA.9080208@linaro.org>
References: <1317988513-20800-1-git-send-email-tushar.behera@linaro.org> <1317988513-20800-2-git-send-email-tushar.behera@linaro.org> <4E905BAB.5060108@ru.mvista.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yx0-f174.google.com ([209.85.213.174]:36385 "EHLO
	mail-yx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750746Ab1JJEJg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 10 Oct 2011 00:09:36 -0400
Received: by yxl31 with SMTP id 31so5006951yxl.19
        for <linux-samsung-soc@vger.kernel.org>; Sun, 09 Oct 2011 21:09:35 -0700 (PDT)
In-Reply-To: <4E905BAB.5060108@ru.mvista.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sergei Shtylyov <sshtylyov@ru.mvista.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linaro-dev@lists.linaro.org, linux@arm.linux.org.uk, ben-linux@fluff.org, patches@linaro.org

Hi Sergei,

On Saturday 08 October 2011 07:48 PM, Sergei Shtylyov wrote:
> Hello.
>
> On 07-10-2011 15:55, Tushar Behera wrote:
>
>> usb_simtec_init() references s3c_ohci_set_platdata() which is defined
>> with __init attribute. Hence to remove section mismatch warning, __init
>> attribute is added to usb_simtec_init().
>
>> It removes following two warnigs.
>
>> WARNING: vmlinux.o(.text+0x1460c): Section mismatch in reference from
>> the function usb_simtec_init() to the function
>> .init.text:s3c_ohci_set_platdata()
>> The function usb_simtec_init() references the function
>> __init s3c_ohci_set_platdata().
>
>> WARNING: vmlinux.o(.text+0x14650): Section mismatch in reference from
>> the function usb_simtec_init() to the (unknown reference)
>> .init.data:(unknown)
>> The function usb_simtec_init() references the (unknown reference)
>> __initdata (unknown).
>
>> Signed-off-by: Tushar Behera<tushar.behera@linaro.org>
> [...]
>
>> diff --git a/arch/arm/mach-s3c2410/usb-simtec.h
>> b/arch/arm/mach-s3c2410/usb-simtec.h
>> index 03842ed..43cc88f 100644
>> --- a/arch/arm/mach-s3c2410/usb-simtec.h
>> +++ b/arch/arm/mach-s3c2410/usb-simtec.h
>> @@ -12,5 +12,5 @@
>> * published by the Free Software Foundation.
>> */
>>
>> -extern int usb_simtec_init(void);
>> +extern int __init usb_simtec_init(void);
>
> Function prototypes don't need to be annotated with __init.
>

I agree that function prototypes don't require to be annotated.

But, will it not be better to have same annotation for both function 
prototypes and the function definitions?

> WBR, Sergei
>

Thanks for your review.
-- 
Tushar Behera
