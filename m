From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH 16/33] ARM: S3C24XX: mach-osiris: Use common macro to
 define resources
Date: Thu, 26 Apr 2012 08:52:49 +0530
Message-ID: <4F98BF89.9070303@linaro.org>
References: <1335327163-11794-1-git-send-email-tushar.behera@linaro.org> <1335327163-11794-17-git-send-email-tushar.behera@linaro.org> <4F982C12.1020103@mvista.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f51.google.com ([209.85.210.51]:64317 "EHLO
	mail-pz0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751876Ab2DZDW5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 Apr 2012 23:22:57 -0400
Received: by dadz8 with SMTP id z8so930357dad.10
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Apr 2012 20:22:57 -0700 (PDT)
In-Reply-To: <4F982C12.1020103@mvista.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sergei Shtylyov <sshtylyov@mvista.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, linux@arm.linux.org.uk, Ben Dooks <ben-linux@fluff.org>, patches@linaro.org

On 04/25/2012 10:23 PM, Sergei Shtylyov wrote:
> Hello.
> 
> On 04/25/2012 08:12 AM, Tushar Behera wrote:
> 
>> CC: Ben Dooks<ben-linux@fluff.org>
>> CC: Kukjin Kim<kgene.kim@samsung.com>
>> Signed-off-by: Tushar Behera<tushar.behera@linaro.org>
>> ---
>>   arch/arm/mach-s3c24xx/mach-osiris.c |   12 ++----------
>>   1 files changed, 2 insertions(+), 10 deletions(-)
> 
>> diff --git a/arch/arm/mach-s3c24xx/mach-osiris.c
>> b/arch/arm/mach-s3c24xx/mach-osiris.c
>> index c5daeb6..95d0772 100644
>> --- a/arch/arm/mach-s3c24xx/mach-osiris.c
>> +++ b/arch/arm/mach-s3c24xx/mach-osiris.c
>> @@ -244,16 +244,8 @@ static struct s3c2410_platform_nand __initdata
>> osiris_nand_info = {
>>   /* PCMCIA control and configuration */
>>
>>   static struct resource osiris_pcmcia_resource[] = {
>> -    [0] = {
>> -        .start    = 0x0f000000,
>> -        .end    = 0x0f100000,
>> -        .flags    = IORESOURCE_MEM,
>> -    },
>> -    [1] = {
>> -        .start    = 0x0c000000,
>> -        .end    = 0x0c100000,
>> -        .flags    = IORESOURCE_MEM,
>> -    }
>> +    [0] = DEFINE_RES_MEM(0x0f000000, SZ_1M),
>> +    [1] = DEFINE_RES_MEM(0x0c000000, SZ_1M),
> 
>    You seem to be fixing the mistake in the original code where - 1 was
> missing in the '.end' initializers...
> 
I am not sure if the original author intended to have it SZ_1M byte wide
or (SZ_1M+1) byte wide. Since the later case seemed highly unlikely, I
went ahead with SZ_1M.

Although, I should have mentioned this in the commit log. :(

> WBR, Sergei


-- 
Tushar Behera
