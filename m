From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH 18/33] ARM: S3C24XX: mach-qt2410: Use common macro to
 define resources
Date: Thu, 26 Apr 2012 08:49:01 +0530
Message-ID: <4F98BEA5.20108@linaro.org>
References: <1335327163-11794-1-git-send-email-tushar.behera@linaro.org> <1335327163-11794-19-git-send-email-tushar.behera@linaro.org> <4F982B8C.3050203@mvista.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:59938 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751522Ab2DZDTI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 Apr 2012 23:19:08 -0400
Received: by pbbro12 with SMTP id ro12so2222408pbb.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Apr 2012 20:19:08 -0700 (PDT)
In-Reply-To: <4F982B8C.3050203@mvista.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sergei Shtylyov <sshtylyov@mvista.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, linux@arm.linux.org.uk, Ben Dooks <ben-linux@fluff.org>, patches@linaro.org

On 04/25/2012 10:21 PM, Sergei Shtylyov wrote:
> Hello.
> 
> On 04/25/2012 08:12 AM, Tushar Behera wrote:
> 
>> CC: Ben Dooks<ben-linux@fluff.org>
>> CC: Kukjin Kim<kgene.kim@samsung.com>
>> Signed-off-by: Tushar Behera<tushar.behera@linaro.org>
>> ---
>>   arch/arm/mach-s3c24xx/mach-qt2410.c |   12 ++----------
>>   1 files changed, 2 insertions(+), 10 deletions(-)
> 
>> diff --git a/arch/arm/mach-s3c24xx/mach-qt2410.c
>> b/arch/arm/mach-s3c24xx/mach-qt2410.c
>> index 91c16d9..b868ddd 100644
>> --- a/arch/arm/mach-s3c24xx/mach-qt2410.c
>> +++ b/arch/arm/mach-s3c24xx/mach-qt2410.c
>> @@ -180,16 +180,8 @@ static struct s3c2410fb_mach_info qt2410_fb_info
>> __initdata = {
>>   /* CS8900 */
>>
>>   static struct resource qt2410_cs89x0_resources[] = {
>> -    [0] = {
>> -        .start    = 0x19000000,
>> -        .end    = 0x19000000 + 16,
> 
>    Are you sure there was no mistake here, with - 1 missing? It looks
> suspicious...
> 
I was not very sure here, whether the original author intended to have
the memory resource to be 16 byte wide or 17 byte wide. So I went with
the original implementation. Though I must agree, 16-byte width looks
more plausible.


>> -        .flags    = IORESOURCE_MEM,
>> -    },
>> -    [1] = {
>> -        .start    = IRQ_EINT9,
>> -        .end    = IRQ_EINT9,
>> -        .flags    = IORESOURCE_IRQ,
>> -    },
>> +    [0] = DEFINE_RES_MEM(0x19000000, 17),
>> +    [1] = DEFINE_RES_IRQ(IRQ_EINT9),
>>   };
>>
>>   static struct platform_device qt2410_cs89x0 = {
> 
> WBR, Sergei


-- 
Tushar Behera
