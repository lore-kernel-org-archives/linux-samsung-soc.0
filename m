From: Kukjin Kim <kgene@kernel.org>
Subject: Re: [PATCH 0/9] ARM: samsung: randconfig build fixes
Date: Tue, 03 Mar 2015 04:50:23 +0900
Message-ID: <54F4BEFF.30407@kernel.org>
References: <1423769746-582629-1-git-send-email-arnd@arndb.de> <0b2901d04b10$d571f680$8055e380$@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:49176 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753870AbbCBTu2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 Mar 2015 14:50:28 -0500
In-Reply-To: <0b2901d04b10$d571f680$8055e380$@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: 'Arnd Bergmann' <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Tomasz Figa' <tomasz.figa@gmail.com>, arm@kernel.org

On 02/18/15 09:21, Kukjin Kim wrote:
> Arnd Bergmann wrote:
>>
>> This is a set of mostly trivial build fixes for bugs I have encountered
>> in random configurations. I'm sending them separate from the other
>> platforms since we have a lot of them for the various samsung platforms
>> here.
>>
>> Kukjin, please pick them up into a fixes branch for 3.20 or send
>> an Ack so we can apply them directly.
>>
> Sure, I will create a branch for them in this week. IMO, would be better if I
> could make a non-critical fixes branch for v3.20 in Samsung tree for further
> other Samsung stuff for v3.20 ;)
> 
>> Let me know if anything looks wrong with some of the patches.
> 
> OK, if anything I'll let you know.
> 
> Thanks for your pointing out.
> Happy new year again! (Actually it's the Lunar New Year holidays now)
> 
> - Kukjin
> 
>> Arnd Bergmann (9):
>>   ARM: s3c64xx: add I2C dependencies where needed
>>   ARM: s3c64xx: fix building without CONFIG_PM_SLEEP
>>   ARM: s3c64xx: fix __initdata section mismatch
>>   ARM: s3c24xx: use SAMSUNG_WAKEMASK for s3c2416
>>   ARM: s3c24xx: fix building without PM_SLEEP
>>   ARM: s3c24xx: fix header file inclusions
>>   ARM: s3c24xx: avoid a Kconfig warning
>>   ARM: EXYNOS: suspend requires regulator access
>>   ARM: EXYNOS: make exynos 4210 cpuidle build without SMP

Arnd,

BTW, I can't see exynos related patches in my mailbox, I don't know the
reason...can you please re-send it?

Thanks,
Kukjin
