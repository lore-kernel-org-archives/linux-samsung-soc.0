From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: Exynos build failure in -next allmodconfig
Date: Tue, 16 Sep 2014 12:56:45 +0100
Message-ID: <20140916115645.GH12361@n2100.arm.linux.org.uk>
References: <E1XTTy1-0000vT-NC@cassiel.sirena.org.uk> <20140915163458.GS7960@sirena.org.uk> <20140915175709.GE12361@n2100.arm.linux.org.uk> <541822AC.8040805@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gw-1.arm.linux.org.uk ([78.32.30.217]:58542 "EHLO
	pandora.arm.linux.org.uk" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1754112AbaIPL4x (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 16 Sep 2014 07:56:53 -0400
Content-Disposition: inline
In-Reply-To: <541822AC.8040805@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof =?utf-8?Q?Koz=C5=82owski?= <k.kozlowski@samsung.com>
Cc: Mark Brown <broonie@kernel.org>, linux-samsung-soc@vger.kernel.org, linaro-kernel@lists.linaro.org, linux-arm-kernel@lists.infradead.org, kernel-build-reports@lists.linaro.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

On Tue, Sep 16, 2014 at 01:44:44PM +0200, Krzysztof Koz=C5=82owski wrot=
e:
> On 15.09.2014 19:57, Russell King - ARM Linux wrote:
>> On Mon, Sep 15, 2014 at 09:34:58AM -0700, Mark Brown wrote:
>>> On Mon, Sep 15, 2014 at 11:57:09AM +0100, Build bot for Mark Brown =
wrote:
>>>
>>> Today's -next got a build failure in ARM allmodconfig due to platsm=
p.c:
>>>
>>> | arch/arm/mach-exynos/platsmp.c:198:31: warning: incorrect type in=
 return expression (different address spaces)
>>> | arch/arm/mach-exynos/platsmp.c:198:31:    expected void [noderef]=
 <asn:2>*
>>> | arch/arm/mach-exynos/platsmp.c:198:31:    got void *
>>> | arch/arm/mach-exynos/platsmp.c:198:31: warning: incorrect type in=
 return expression (different address spaces)
>>> | arch/arm/mach-exynos/platsmp.c:198:31:    expected void [noderef]=
 <asn:2>*
>>> | arch/arm/mach-exynos/platsmp.c:198:31:    got void *
>>> |   CC      arch/arm/mach-exynos/platsmp.o
>>> | /tmp/ccC9fkwF.s: Assembler messages:
>>> | /tmp/ccC9fkwF.s:423: Error: selected processor does not support A=
RM mode `isb '
>>> | /tmp/ccC9fkwF.s:428: Error: selected processor does not support A=
RM mode `isb '
>>> | /tmp/ccC9fkwF.s:429: Error: selected processor does not support A=
RM mode `dsb '
>>> | scripts/Makefile.build:257: recipe for target 'arch/arm/mach-exyn=
os/platsmp.o' failed
>>>
>>> Looks like we need a compiler flags override for that file.
>>
>> Or.. the question is why a .c file is not using the proper macros.
>
> Actually I am the one to blame for build failure (commit: "ARM: EXYNO=
S: =20
> Move code from hotplug.c to platsmp.c"). The problem is =20
> v7_exit_coherency_flush() which I think does not make sense on ARMv6.
>
> I'll replace the ISB and DSB commands with macros but the real questi=
on =20
> is whether the mach-exynos/platsmp.c file and mach-exynos directory =20
> should be compiled when CONFIG_ARCH_EXYNOS is not defined?

It's entirely possible that a kernel will be configured to support ARMv=
6
and ARMv7, which can also include exynos support.  In this case, it wil=
l
be built using compiler flags for ARMv6, since ARMv7 is compatible with
the ARMv6 ISA (even though a few instructions are deprecated.)

--=20
=46TTC broadband for 0.8mile line: currently at 9.5Mbps down 400kbps up
according to speedtest.net.
