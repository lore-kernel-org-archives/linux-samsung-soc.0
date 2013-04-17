From: Will Deacon <will.deacon@arm.com>
Subject: Re: [Suggestion] ARM:S5pv210: compiling issue for s5pv210 by using
 randconfig
Date: Wed, 17 Apr 2013 11:01:36 +0100
Message-ID: <20130417100136.GB19492@mudshark.cambridge.arm.com>
References: <514FB202.3040807@asianux.com>
 <515BFA8D.2000204@asianux.com>
 <20130403101018.GE11040@mudshark.cambridge.arm.com>
 <515C047A.9010906@asianux.com>
 <516E6A8E.3000001@asianux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cam-admin0.cambridge.arm.com ([217.140.96.50]:40710 "EHLO
	cam-admin0.cambridge.arm.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1757991Ab3DQKCT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 17 Apr 2013 06:02:19 -0400
Content-Disposition: inline
In-Reply-To: <516E6A8E.3000001@asianux.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chen Gang <gang.chen@asianux.com>
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>, "dhowells@redhat.com" <dhowells@redhat.com>, "plagnioj@jcrosoft.com" <plagnioj@jcrosoft.com>, "kgene.kim@samsung.com" <kgene.kim@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, arnd@arndb.de

[adding Arnd, as he plays with randconfig too]

On Wed, Apr 17, 2013 at 10:25:34AM +0100, Chen Gang wrote:
> On 2013=E5=B9=B404=E6=9C=8803=E6=97=A5 18:29, Chen Gang wrote:
>   I repeat it again (but it report another location), and put the con=
fig as attachment.

Thanks.

>   when you have time, please help check (if you have no time, I shoul=
d try)
>=20
>   the below is the new related information:

[...]

> arm-linux-gnu-gcc -Wp,-MD,arch/arm/vfp/.vfphw.o.d  -nostdinc -isystem=
 /usr/lib/gcc/arm-linux-gnueabi/4.7.1/include -I/root/linux-next/arch/a=
rm/include -Iarch/arm/include/generated  -Iinclude -I/root/linux-next/a=
rch/arm/include/uapi -Iarch/arm/include/generated/uapi -I/root/linux-ne=
xt/include/uapi -Iinclude/generated/uapi -include /root/linux-next/incl=
ude/linux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-s5pv21=
0/include -Iarch/arm/plat-samsung/include  -D__ASSEMBLY__ -mabi=3Dapcs-=
gnu -mno-thumb-interwork -marm -D__LINUX_ARM_ARCH__=3D4 -march=3Darmv4t=
 -mtune=3Darm9tdmi -include asm/unified.h -Wa,-mfpu=3Dsoftvfp+vfp -mflo=
at-abi=3Dsoft        -c -o arch/arm/vfp/vfphw.o arch/arm/vfp/vfphw.S
>=20
>=20
>   compiling err:
>=20
> arch/arm/vfp/vfphw.S: Assembler messages:
> arch/arm/vfp/vfphw.S:295: Error: selected processor does not support =
ARM mode `mrrc p11,3,r0,r1,c0'
> arch/arm/vfp/vfphw.S:295: Error: selected processor does not support =
ARM mode `mrrc p11,3,r0,r1,c1'

The problem here is that you've ended up targetting a platform (s5pv210=
)
that selects CPU_V7. VFP is then subsequently selected, but CONFIG_MMU=3D=
n, so
7TDMI and 9TDMI (v4 CPUs, no VFP) are selectable. Selecting either of t=
hose,
causes these warnings.

Unfortunately, I'm not sure how best to fix this. Most of the !MMU CPUs=
 are
tied to a particular board (lots of `if ARCH_INTEGRATOR' predicates), b=
ut we
don't want to do that for 7tdmi.

If we could enforce the strict exclusion of {<=3D ARMv5} and {ARMv6+} i=
n the
Kconfig, that would solve your problem.

Will
