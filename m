From: Kukjin Kim <kgene@kernel.org>
Subject: Re: [PATCH] ARM: fix exynos randconfig build error
Date: Tue, 03 Mar 2015 04:40:02 +0900
Message-ID: <54F4BC92.2050405@kernel.org>
References: <E1YQa78-0000O0-A4@rmk-PC.arm.linux.org.uk> <CAJKOXPf2F-g9fU9TrNXz8LPwp8fBNZ6NpaAoP15N0nbHWVesaw@mail.gmail.com> <54EF9091.30802@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:48242 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755222AbbCBTkN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 Mar 2015 14:40:13 -0500
In-Reply-To: <54EF9091.30802@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Russell King <rmk+kernel@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie@samsung.com>

On 02/27/15 06:30, Kukjin Kim wrote:
> On 02/25/15 20:46, Krzysztof Kozlowski wrote:
>> 2015-02-25 12:26 GMT+01:00 Russell King <rmk+kernel@arm.linux.org.uk>:
>>> The following error was observed with SMP=n in v4.0-rc1:
>>>
>>> arch/arm/mach-exynos/pm.c: In function 'exynos_cpu0_enter_aftr':
>>> arch/arm/mach-exynos/pm.c:246:4: error: implicit declaration of function 'arch_send_wakeup_ipi_mask' [-Werror=implicit-function-declaration]
>>>
>>> As the code unconditionally calls a function only available with SMP=y,
>>> make the Exynos PM support depend on SMP.
>>>
>>> Signed-off-by: Russell King <rmk+kernel@arm.linux.org.uk>
>>
>> Hi,
>>
>> Thanks for the patch but this already waits for Kukjin top be picked
>> up. The first patch was similar to yours (adds dependency on SMP),
>> sent on 4th of February:
>> https://patchwork.ozlabs.org/patch/436231/
>>
>> But later Bartlomiej fixed this in other way (allowing to use cpuidle
>> on non-SMP):
>> https://patchwork.ozlabs.org/patch/436445/
>>
>> Unfortunately none of them were picked up.
>>
> I've missed the fix, sorry.
> 
> BTW, as you know, all of exynos SoCs are based on SMP so generally (in
> normal case) there is no reason to use non-SMP on exynos
> platforms...even though I understand the build error should be fixed...
> 
> Anyway, I'll have a look Bart's patch and Russell's fix in this weekend.
> 

Firstly, let me take rmk's patch for the randconfig build error...BTW
I'm still wondering exynos stuff needs to support non-SMP and need to
think more about its usefulness?...

- Kukjin
