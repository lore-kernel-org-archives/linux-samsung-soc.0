From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH] ARM: S3C24XX: Fix Section mismatch
Date: Wed, 07 Mar 2012 03:41:22 -0800
Message-ID: <4F574962.9020801@samsung.com>
References: <1331116612-14491-1-git-send-email-kgene.kim@samsung.com> <20120307112219.GR17370@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-tul01m020-f174.google.com ([209.85.214.174]:56095 "EHLO
	mail-tul01m020-f174.google.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1756590Ab2CGLl0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 7 Mar 2012 06:41:26 -0500
Received: by obbuo6 with SMTP id uo6so6798033obb.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 07 Mar 2012 03:41:25 -0800 (PST)
In-Reply-To: <20120307112219.GR17370@n2100.arm.linux.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On 03/07/12 03:22, Russell King - ARM Linux wrote:
> On Wed, Mar 07, 2012 at 02:36:52AM -0800, Kukjin Kim wrote:
>> WARNING: arch/arm/mach-s3c24xx/built-in.o(.data+0xf44): Section mismatch in reference
>> from the variable s3c2416_irq_interface to the function .init.text:s3c2416_irq_add()
>> The variable s3c2416_irq_interface references
>> the function __init s3c2416_irq_add()
>> If the reference is valid then annotate the
>> variable with __init* or __refdata (see linux/init.h) or name the variable:
>> *_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console
>>
>> WARNING: arch/arm/mach-s3c24xx/built-in.o(.data+0x1b80): Section mismatch in reference
>> from the variable s3c2443_irq_interface to the function .init.text:s3c2443_irq_add()
>> The variable s3c2443_irq_interface references
>> the function __init s3c2443_irq_add()
>> If the reference is valid then annotate the
>> variable with __init* or __refdata (see linux/init.h) or name the variable:
>> *_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console
>
>> diff --git a/arch/arm/mach-s3c24xx/irq-s3c2416.c b/arch/arm/mach-s3c24xx/irq-s3c2416.c
>> index b8a5836..59b7632 100644
>> --- a/arch/arm/mach-s3c24xx/irq-s3c2416.c
>> +++ b/arch/arm/mach-s3c24xx/irq-s3c2416.c
>> @@ -310,7 +310,7 @@ static int __init s3c2416_irq_add(struct device *dev)
>>   	return 0;
>>   }
>>
>> -static struct subsys_interface s3c2416_irq_interface = {
>> +static struct subsys_interface s3c2416_irq_interface __initdata = {
>>   	.name		= "s3c2416_irq",
>>   	.subsys		=&s3c2416_subsys,
>>   	.add_dev	= s3c2416_irq_add,
>> diff --git a/arch/arm/mach-s3c24xx/irq-s3c2443.c b/arch/arm/mach-s3c24xx/irq-s3c2443.c
>> index 35e4ff2..439f186 100644
>> --- a/arch/arm/mach-s3c24xx/irq-s3c2443.c
>> +++ b/arch/arm/mach-s3c24xx/irq-s3c2443.c
>> @@ -265,7 +265,7 @@ static int __init s3c2443_irq_add(struct device *dev)
>>   	return 0;
>>   }
>>
>> -static struct subsys_interface s3c2443_irq_interface = {
>> +static struct subsys_interface s3c2443_irq_interface __initdata = {
>>   	.name		= "s3c2443_irq",
>>   	.subsys		=&s3c2443_subsys,
>>   	.add_dev	= s3c2443_irq_add,
>
> You register these structures with some other bit of code.  That other
> bit of code adds these structures to a list. You then mark them as
> __initdata, which means they get freed and the memory reused.  That
> corrupts the list beneath the other code.
>
> So, clearly, both of these are wrong.

Oops, I see. Let me check it again.
Thanks for pointing out.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
