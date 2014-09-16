From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: Exynos build failure in -next allmodconfig
Date: Tue, 16 Sep 2014 14:01:02 +0200
Message-ID: <5418267E.8070501@gmail.com>
References: <E1XTTy1-0000vT-NC@cassiel.sirena.org.uk> <20140915163458.GS7960@sirena.org.uk> <20140915175709.GE12361@n2100.arm.linux.org.uk> <541822AC.8040805@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f169.google.com ([74.125.82.169]:46664 "EHLO
	mail-we0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753173AbaIPMBM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 16 Sep 2014 08:01:12 -0400
Received: by mail-we0-f169.google.com with SMTP id w61so5630636wes.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 16 Sep 2014 05:01:05 -0700 (PDT)
In-Reply-To: <541822AC.8040805@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?B?S3J6eXN6dG9mIEtvesWCb3dza2k=?= <k.kozlowski@samsung.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Mark Brown <broonie@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linaro-kernel@lists.linaro.org, linux-arm-kernel@lists.infradead.org, kernel-build-reports@lists.linaro.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

On 16.09.2014 13:44, Krzysztof Koz=C5=82owski wrote:
> On 15.09.2014 19:57, Russell King - ARM Linux wrote:
>> On Mon, Sep 15, 2014 at 09:34:58AM -0700, Mark Brown wrote:
>>> On Mon, Sep 15, 2014 at 11:57:09AM +0100, Build bot for Mark Brown
>>> wrote:
>>>
>>> Today's -next got a build failure in ARM allmodconfig due to platsm=
p.c:
>>>
>>> | arch/arm/mach-exynos/platsmp.c:198:31: warning: incorrect type in
>>> return expression (different address spaces)
>>> | arch/arm/mach-exynos/platsmp.c:198:31:    expected void [noderef]
>>> <asn:2>*
>>> | arch/arm/mach-exynos/platsmp.c:198:31:    got void *
>>> | arch/arm/mach-exynos/platsmp.c:198:31: warning: incorrect type in
>>> return expression (different address spaces)
>>> | arch/arm/mach-exynos/platsmp.c:198:31:    expected void [noderef]
>>> <asn:2>*
>>> | arch/arm/mach-exynos/platsmp.c:198:31:    got void *
>>> |   CC      arch/arm/mach-exynos/platsmp.o
>>> | /tmp/ccC9fkwF.s: Assembler messages:
>>> | /tmp/ccC9fkwF.s:423: Error: selected processor does not support A=
RM
>>> mode `isb '
>>> | /tmp/ccC9fkwF.s:428: Error: selected processor does not support A=
RM
>>> mode `isb '
>>> | /tmp/ccC9fkwF.s:429: Error: selected processor does not support A=
RM
>>> mode `dsb '
>>> | scripts/Makefile.build:257: recipe for target
>>> 'arch/arm/mach-exynos/platsmp.o' failed
>>>
>>> Looks like we need a compiler flags override for that file.
>>
>> Or.. the question is why a .c file is not using the proper macros.
>=20
> Actually I am the one to blame for build failure (commit: "ARM: EXYNO=
S:
> Move code from hotplug.c to platsmp.c"). The problem is
> v7_exit_coherency_flush() which I think does not make sense on ARMv6.
>=20
> I'll replace the ISB and DSB commands with macros but the real questi=
on
> is whether the mach-exynos/platsmp.c file and mach-exynos directory
> should be compiled when CONFIG_ARCH_EXYNOS is not defined?

I think the problematic case here is v6+v7 multiplatform, where even
though CONFIG_ARCH_EXYNOS is defined, compiler flags for lowest common
denominator (v6) must be used. Using appropriate macros should fix the
problem indeed.

Best regards,
Tomasz
