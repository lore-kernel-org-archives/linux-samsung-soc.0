From: Chen Gang <gang.chen@asianux.com>
Subject: Re: [Suggestion] ARM:S5pv210: compiling issue for s5pv210 by using
 randconfig
Date: Wed, 03 Apr 2013 17:46:53 +0800
Message-ID: <515BFA8D.2000204@asianux.com>
References: <514FB202.3040807@asianux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from intranet.asianux.com ([58.214.24.6]:15309 "EHLO
	intranet.asianux.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757815Ab3DCJrZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 3 Apr 2013 05:47:25 -0400
In-Reply-To: <514FB202.3040807@asianux.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>, Will Deacon <will.deacon@arm.com>, dhowells@redhat.com, plagnioj@jcrosoft.com, "kgene.kim@samsung.com" <kgene.kim@samsung.com>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

Hello Maintainers:

  when you have time, could you help to check this suggestion ?

  if we really need treat it as an issue, and also no one have time to
fix it, I should try.


  thanks.

gchen.

On 2013=E5=B9=B403=E6=9C=8825=E6=97=A5 10:10, Chen Gang wrote:
> Hello Maintainers:
>=20
>   is it an issue that need solving ?
>=20
>   :-)
>=20
>=20
> details:
>=20
>   make:
>     make V=3D1 EXTRA_CFLAGS=3D-W ARCH=3Darm randconfig
>     make V=3D1 EXTRA_CFLAGS=3D-W ARCH=3Darm menuconfig
>       set arm-linux-gnu-  for "Cross-compiler tool prefix"
>       set "Samsung S5PV210/S5PC210" for "ARM system type"
>     make V=3D1 EXTRA_CFLAGS=3D-W ARCH=3Darm
>=20
>=20
>   err:
>     arch/arm/kernel/entry-armv.S: Assembler messages:
>     arch/arm/kernel/entry-armv.S:207: Error: selected processor does =
not support ARM mode `clrex'
>     arch/arm/kernel/entry-armv.S:231: Error: selected processor does =
not support ARM mode `clrex'
>     arch/arm/kernel/entry-armv.S:314: Error: selected processor does =
not support ARM mode `clrex'
>     arch/arm/kernel/entry-armv.S:335: Error: selected processor does =
not support ARM mode `clrex'
>     arch/arm/kernel/entry-armv.S:813: Error: selected processor does =
not support ARM mode `ldrd r4,r5,[r0]'
>     arch/arm/kernel/entry-armv.S:814: Error: selected processor does =
not support ARM mode `ldrd r6,r7,[r1]'
>     arch/arm/kernel/entry-armv.S:816: Error: selected processor does =
not support ARM mode `ldrexd r0,r1,[r2]'
>     arch/arm/kernel/entry-armv.S:819: Error: selected processor does =
not support ARM mode `strexdeq r3,r6,r7,[r2]'
>     make[1]: *** [arch/arm/kernel/entry-armv.o] Error 1
>     make: *** [arch/arm/kernel] Error 2
>=20
>   related gcc command:
> arm-linux-gnu-gcc -Wp,-MD,arch/arm/kernel/.entry-armv.o.d  -nostdinc =
-isystem /usr/lib/gcc/arm-linux-gnueabi/4.7.1/include -I/android/public=
-kernel/linux-next/arch/arm/include -Iarch/arm/include/generated  -Iinc=
lude -I/android/public-kernel/linux-next/arch/arm/include/uapi -Iarch/a=
rm/include/generated/uapi -I/android/public-kernel/linux-next/include/u=
api -Iinclude/generated/uapi -include /android/public-kernel/linux-next=
/include/linux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-s=
5pv210/include -Iarch/arm/plat-samsung/include  -D__ASSEMBLY__ -mabi=3D=
apcs-gnu -mno-thumb-interwork -marm -D__LINUX_ARM_ARCH__=3D4 -march=3Da=
rmv4t -mtune=3Darm9tdmi -include asm/unified.h -msoft-float          -c=
 -o arch/arm/kernel/entry-armv.o arch/arm/kernel/entry-armv.S
>=20
>=20
>=20
>   thanks.
>=20


--=20
Chen Gang

Asianux Corporation
