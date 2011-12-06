From: Denis Kuzmenko <linux@solonet.org.ua>
Subject: Re: [PATCH resend2] s3c24xx: cpufreq: Fix compilation error when
 CONFIG_CPU_FREQ_S3C24XX_DEBUGFS selected.
Date: Wed, 07 Dec 2011 01:26:51 +0200
Message-ID: <4EDEA4BB.60807@solonet.org.ua>
References: <4EDD720B.5040607@solonet.org.ua> <02ef01ccb40a$9078f2e0$b16ad8a0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f46.google.com ([74.125.83.46]:40225 "EHLO
	mail-ee0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754392Ab1LFX35 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 6 Dec 2011 18:29:57 -0500
In-Reply-To: <02ef01ccb40a$9078f2e0$b16ad8a0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Russell King' <linux@arm.linux.org.uk>, 'Ben Dooks' <ben-linux@fluff.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org

On 12/06/2011 01:31 PM, Kukjin Kim wrote:
> Denis Kuzmenko wrote:
>>
>> Fix compilation error when CONFIG_CPU_FREQ_S3C24XX_DEBUGFS selected.
>>
>> Signed-off-by: Denis Kuzmenko <linux@solonet.org.ua>
>> ---
>>
>> Patch is against 3.2-rc3.
>> CONFIG_S3C2410_IOTIMING wasn't present in Kconfig but was referenced by
>> Makefile. Because of this the file s3c2410-iotiming.c was not ever
>> compiled
> 
> Well, there is 'S3C2410_IOTIMING' at arch/arm/plat-s3c24xx/Kconfig and it
> had dependency of 'CONFIG_CPU_FREQ_S3C24XX'...
> 

Yeah, I've missed that, thank you. I'll make a new version.

-- 
Best regards, Denis Kuzmenko.
