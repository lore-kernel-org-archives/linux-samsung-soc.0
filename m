From: =?UTF-8?B?S3J6eXN6dG9mIEtvesWCb3dza2k=?= <k.kozlowski@samsung.com>
Subject: Re: Exynos build failure in -next allmodconfig
Date: Tue, 16 Sep 2014 13:44:44 +0200
Message-ID: <541822AC.8040805@samsung.com>
References: <E1XTTy1-0000vT-NC@cassiel.sirena.org.uk>
 <20140915163458.GS7960@sirena.org.uk>
 <20140915175709.GE12361@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:57572 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751229AbaIPLos (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 16 Sep 2014 07:44:48 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NBZ00409SRDGBB0@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 16 Sep 2014 12:47:37 +0100 (BST)
In-reply-to: <20140915175709.GE12361@n2100.arm.linux.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>, Mark Brown <broonie@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linaro-kernel@lists.linaro.org, linux-arm-kernel@lists.infradead.org, kernel-build-reports@lists.linaro.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

On 15.09.2014 19:57, Russell King - ARM Linux wrote:
> On Mon, Sep 15, 2014 at 09:34:58AM -0700, Mark Brown wrote:
>> On Mon, Sep 15, 2014 at 11:57:09AM +0100, Build bot for Mark Brown wrote:
>>
>> Today's -next got a build failure in ARM allmodconfig due to platsmp.c:
>>
>> | arch/arm/mach-exynos/platsmp.c:198:31: warning: incorrect type in return expression (different address spaces)
>> | arch/arm/mach-exynos/platsmp.c:198:31:    expected void [noderef] <asn:2>*
>> | arch/arm/mach-exynos/platsmp.c:198:31:    got void *
>> | arch/arm/mach-exynos/platsmp.c:198:31: warning: incorrect type in return expression (different address spaces)
>> | arch/arm/mach-exynos/platsmp.c:198:31:    expected void [noderef] <asn:2>*
>> | arch/arm/mach-exynos/platsmp.c:198:31:    got void *
>> |   CC      arch/arm/mach-exynos/platsmp.o
>> | /tmp/ccC9fkwF.s: Assembler messages:
>> | /tmp/ccC9fkwF.s:423: Error: selected processor does not support ARM mode `isb '
>> | /tmp/ccC9fkwF.s:428: Error: selected processor does not support ARM mode `isb '
>> | /tmp/ccC9fkwF.s:429: Error: selected processor does not support ARM mode `dsb '
>> | scripts/Makefile.build:257: recipe for target 'arch/arm/mach-exynos/platsmp.o' failed
>>
>> Looks like we need a compiler flags override for that file.
>
> Or.. the question is why a .c file is not using the proper macros.

Actually I am the one to blame for build failure (commit: "ARM: EXYNOS: 
Move code from hotplug.c to platsmp.c"). The problem is 
v7_exit_coherency_flush() which I think does not make sense on ARMv6.

I'll replace the ISB and DSB commands with macros but the real question 
is whether the mach-exynos/platsmp.c file and mach-exynos directory 
should be compiled when CONFIG_ARCH_EXYNOS is not defined?

Best regards,
Krzysztof
