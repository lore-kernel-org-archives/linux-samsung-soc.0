From: Chen Gang <gang.chen@asianux.com>
Subject: Re: [Suggestion] ARM:S5pv210: compiling issue for s5pv210 by using
 randconfig
Date: Mon, 22 Apr 2013 14:13:14 +0800
Message-ID: <5174D4FA.70404@asianux.com>
References: <514FB202.3040807@asianux.com> <515BFA8D.2000204@asianux.com> <20130403101018.GE11040@mudshark.cambridge.arm.com> <515C047A.9010906@asianux.com> <516E6A8E.3000001@asianux.com> <20130417100243.GV14496@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from intranet.asianux.com ([58.214.24.6]:62481 "EHLO
	intranet.asianux.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752667Ab3DVGOA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Apr 2013 02:14:00 -0400
In-Reply-To: <20130417100243.GV14496@n2100.arm.linux.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Will Deacon <will.deacon@arm.com>, "dhowells@redhat.com" <dhowells@redhat.com>, "plagnioj@jcrosoft.com" <plagnioj@jcrosoft.com>, "kgene.kim@samsung.com" <kgene.kim@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Arnd Bergmann <arnd@arndb.de>"plagnioj@jcrosoft.com" <plagnioj@jcrosoft.com>

On 2013=E5=B9=B404=E6=9C=8817=E6=97=A5 18:02, Russell King - ARM Linux =
wrote:
> On Wed, Apr 17, 2013 at 05:25:34PM +0800, Chen Gang wrote:
>> CONFIG_CPU_ARM7TDMI=3Dy
>> CONFIG_CPU_ARM9TDMI=3Dy
>> CONFIG_CPU_V7=3Dy
>> CONFIG_CPU_32v4T=3Dy
>> CONFIG_CPU_32v6K=3Dy
>> CONFIG_CPU_32v7=3Dy
>=20
> This is an invalid configuration.  A single kernel can not support AR=
Mv7
> and ARMv4T simultaneously.
>=20
> The problem is caused by MMU=3Dn, which exposes the CPU_ARM7TDMI and
> CPU_ARM9TDMI options, which in turn select 32v4T.  This is in turn
> caused by the incomplete integration of uclinux.
>=20
> I think the only thing which can be done is to remove the ARM9TDMI
> support code, which doesn't seem to be used by anything, and adjust
> ARM7TDMI so that it isn't visible, but is selected by ARCH_AT91X40
> (which seems to be its only user.)
>=20
> Here's the slightly smaller version of that:
>=20

  I apply your patch below.
  and also let CONFIG_MMU=3Dy in menuconfig (just Arnd suggested).
  it passes compilation.

  I prefer to let the patch below to integrate into next-tree.
  if I should do it (e.g. need send the patch again in normal way), I
should try.

  thanks.


gchen.


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
> index cb812a1..deb6c6a 100644
> --- a/arch/arm/mm/Kconfig
> +++ b/arch/arm/mm/Kconfig
> @@ -6,7 +6,7 @@ comment "Processor Type"
> =20
>  # ARM7TDMI
>  config CPU_ARM7TDMI
> -	bool "Support ARM7TDMI processor"
> +	bool
>  	depends on !MMU
>  	select CPU_32v4T
>  	select CPU_ABRT_LV4T
> @@ -56,7 +56,7 @@ config CPU_ARM740T
> =20
>  # ARM9TDMI
>  config CPU_ARM9TDMI
> -	bool "Support ARM9TDMI processor"
> +	bool
>  	depends on !MMU
>  	select CPU_32v4T
>  	select CPU_ABRT_NOMMU
>=20
>=20
>=20


--=20
Chen Gang

Asianux Corporation
