From: Chen Gang <gang.chen@asianux.com>
Subject: Re: [Suggestion] ARM:S5pv210: compiling issue for s5pv210 by using
 randconfig
Date: Wed, 17 Apr 2013 19:07:40 +0800
Message-ID: <516E827C.3050807@asianux.com>
References: <514FB202.3040807@asianux.com> <516E6A8E.3000001@asianux.com> <20130417100136.GB19492@mudshark.cambridge.arm.com> <201304171253.20284.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from intranet.asianux.com ([58.214.24.6]:41011 "EHLO
	intranet.asianux.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934715Ab3DQLIX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 17 Apr 2013 07:08:23 -0400
In-Reply-To: <201304171253.20284.arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Will Deacon <will.deacon@arm.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, "dhowells@redhat.com" <dhowells@redhat.com>, "plagnioj@jcrosoft.com" <plagnioj@jcrosoft.com>, "kgene.kim@samsung.com" <kgene.kim@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On 2013=E5=B9=B404=E6=9C=8817=E6=97=A5 18:53, Arnd Bergmann wrote:
> On Wednesday 17 April 2013, Will Deacon wrote:
>>> > > arm-linux-gnu-gcc -Wp,-MD,arch/arm/vfp/.vfphw.o.d  -nostdinc -i=
system /usr/lib/gcc/arm-linux-gnueabi/4.7.1/include -I/root/linux-next/=
arch/arm/include -Iarch/arm/include/generated  -Iinclude -I/root/linux-=
next/arch/arm/include/uapi -Iarch/arm/include/generated/uapi -I/root/li=
nux-next/include/uapi -Iinclude/generated/uapi -include /root/linux-nex=
t/include/linux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-=
s5pv210/include -Iarch/arm/plat-samsung/include  -D__ASSEMBLY__ -mabi=3D=
apcs-gnu -mno-thumb-interwork -marm -D__LINUX_ARM_ARCH__=3D4 -march=3Da=
rmv4t -mtune=3Darm9tdmi -include asm/unified.h -Wa,-mfpu=3Dsoftvfp+vfp =
-mfloat-abi=3Dsoft        -c -o arch/arm/vfp/vfphw.o arch/arm/vfp/vfphw=
=2ES
>>> > >=20
>>> > >=20
>>> > >   compiling err:
>>> > >=20
>>> > > arch/arm/vfp/vfphw.S: Assembler messages:
>>> > > arch/arm/vfp/vfphw.S:295: Error: selected processor does not su=
pport ARM mode `mrrc p11,3,r0,r1,c0'
>>> > > arch/arm/vfp/vfphw.S:295: Error: selected processor does not su=
pport ARM mode `mrrc p11,3,r0,r1,c1'
>> >=20
>> > The problem here is that you've ended up targetting a platform (s5=
pv210)
>> > that selects CPU_V7. VFP is then subsequently selected, but CONFIG=
_MMU=3Dn, so
>> > 7TDMI and 9TDMI (v4 CPUs, no VFP) are selectable. Selecting either=
 of those,
>> > causes these warnings.
>> >=20
>> > Unfortunately, I'm not sure how best to fix this. Most of the !MMU=
 CPUs are
>> > tied to a particular board (lots of `if ARCH_INTEGRATOR' predicate=
s), but we
>> > don't want to do that for 7tdmi.
>> >=20
>> > If we could enforce the strict exclusion of {<=3D ARMv5} and {ARMv=
6+} in the
>> > Kconfig, that would solve your problem.
> I have not tried to get no-MMU kernels to build in general. I think t=
he way
> it should be done is to not offer any user-selectable CPU types at al=
l but
> always select the CPU from the board.
>=20
> For randconfig tests, I would recommend turning on CONFIG_MMU uncondi=
tionally
> using an appropriate KCONFIG_ALLCONFIG=3D file.
>=20
> The alternative is to use the patch below, but it may be incomplete: =
I could
> not find anything other than AT91x40 in the kernel that actually has =
an
> ARM7TDMI or ARM9TDMI.
>=20
> 	Arnd

  it seems we really need think of the design carefully.

  I think we can assume that the crazy users (e.g. me) want to let
randconfig on each arm platform (scan one by one) to intend to make iss=
ues.

  :-)

gchen.

>=20
> diff --git a/arch/arm/mach-at91/Kconfig.non_dt b/arch/arm/mach-at91/K=
config.non_dt
> index 6c24985..dc972e1 100644
> --- a/arch/arm/mach-at91/Kconfig.non_dt
> +++ b/arch/arm/mach-at91/Kconfig.non_dt
> @@ -47,6 +47,7 @@ config ARCH_AT91X40
>  	select ARCH_USES_GETTIMEOFFSET
>  	select MULTI_IRQ_HANDLER
>  	select SPARSE_IRQ
> +	select CPU_ARM7TDMI
> =20
>  endchoice
> =20
> diff --git a/arch/arm/mm/Kconfig b/arch/arm/mm/Kconfig
> index 84af266..c5e4ef0 100644
> --- a/arch/arm/mm/Kconfig
> +++ b/arch/arm/mm/Kconfig
> @@ -6,7 +6,6 @@ comment "Processor Type"
> =20
>  # ARM7TDMI
>  config CPU_ARM7TDMI
> -	bool "Support ARM7TDMI processor"
>  	depends on !MMU
>  	select CPU_32v4T
>  	select CPU_ABRT_LV4T
> @@ -56,7 +55,6 @@ config CPU_ARM740T
> =20
>  # ARM9TDMI
>  config CPU_ARM9TDMI
> -	bool "Support ARM9TDMI processor"
>  	depends on !MMU
>  	select CPU_32v4T
>  	select CPU_ABRT_NOMMU
>=20
>=20


--=20
Chen Gang

Asianux Corporation
