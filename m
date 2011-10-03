From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH] ARM: S3C2410: Remove section mismatch warning
Date: Mon, 03 Oct 2011 17:04:57 +0530
Message-ID: <4E899DE1.6020608@linaro.org>
References: <1317634841-23339-1-git-send-email-tushar.behera@linaro.org> <20111003095933.GC11710@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qy0-f174.google.com ([209.85.216.174]:35045 "EHLO
	mail-qy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753264Ab1JCLfD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 3 Oct 2011 07:35:03 -0400
Received: by qyk30 with SMTP id 30so1922086qyk.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 03 Oct 2011 04:35:02 -0700 (PDT)
In-Reply-To: <20111003095933.GC11710@n2100.arm.linux.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, "patches@linaro.org" <patches@linaro.org>, linaro-dev@lists.linaro.org, ben-linux@fluff.org

Hi Russell,

On Monday 03 October 2011 03:29 PM, Russell King - ARM Linux wrote:
> On Mon, Oct 03, 2011 at 03:10:41PM +0530, Tushar Behera wrote:
>> Some of the functions and structures did not have _init or __initdata
>> attributes, even though they were referenced from functions / structures
>> with those attribute, resulting in section mismatches.
>
> Firstly - it's a good idea to include the warnings which you're fixing
> in the commit log text, so that people know exactly what is being fixed.
>
Thanks for your review.

Sure, I will add it in next revision.

[ snip ]

>> diff --git a/arch/arm/mach-s3c2416/irq.c b/arch/arm/mach-s3c2416/irq.c
>> index 28ad20d..153cb2f 100644
>> --- a/arch/arm/mach-s3c2416/irq.c
>> +++ b/arch/arm/mach-s3c2416/irq.c
>> @@ -234,7 +234,7 @@ static int __init s3c2416_irq_add(struct sys_device *sysdev)
>>   	return 0;
>>   }
>>
>> -static struct sysdev_driver s3c2416_irq_driver = {
>> +static struct sysdev_driver s3c2416_irq_driver __initdata = {
>>   	.add		= s3c2416_irq_add,
>>   };
>>
>
> I remain entirely unconvinced that this is correct.  As a result of
> the "sysdev_driver_register(&s3c2416_sysclass,&s3c2416_irq_driver);"
> call, this structure is placed on a list.
>
> If this structure is marked __initdata, then the memory behind the
> structure will be freed and overwritten - however, it's still on a
> list which might be walked.  Such a walk would cause a kernel oops
> or might even be an exploitable security hole if that page ends up
> in userspace - especially as said structure contains function calls
> which would be called in privileged mode.
>

The function s3c2416_irq_add() is defined with __init attribute. Also a 
cascade of functions called from s3c2416_irq_add() are also defined with 
__init attribute.

Would it be a good idea to remove __init attribute of all these 
functions (there are 2 of them) called from s3c2416_irq_add() instead?

> The same comment applies to the other sysdev driver structures you're
> marking __initdata too.

-- 
Tushar Behera
