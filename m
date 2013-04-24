From: Chen Gang <gang.chen@asianux.com>
Subject: Re: [PATCH] ARM: Kconfig: let ARM9TDMI and ARM7TDMI invisible.
Date: Wed, 24 Apr 2013 12:16:10 +0800
Message-ID: <51775C8A.2090701@asianux.com>
References: <514FB202.3040807@asianux.com> <515BFA8D.2000204@asianux.com> <20130403101018.GE11040@mudshark.cambridge.arm.com> <515C047A.9010906@asianux.com> <516E6A8E.3000001@asianux.com> <20130417100243.GV14496@n2100.arm.linux.org.uk> <5174D4FA.70404@asianux.com> <51775BB3.6000607@asianux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from intranet.asianux.com ([58.214.24.6]:29876 "EHLO
	intranet.asianux.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750778Ab3DXEQ4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 24 Apr 2013 00:16:56 -0400
In-Reply-To: <51775BB3.6000607@asianux.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Will Deacon <will.deacon@arm.com>, "dhowells@redhat.com" <dhowells@redhat.com>, "plagnioj@jcrosoft.com" <plagnioj@jcrosoft.com>, "kgene.kim@samsung.com" <kgene.kim@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Arnd Bergmann <arnd@arndb.de>


Oh, sorry, I forgot to disable word wrap, I should send patch v2 again.

=46or this patch itself, I just copy it from Russell's and Arnd's, and
want it to be applied.


On 2013=E5=B9=B404=E6=9C=8824=E6=97=A5 12:12, Chen Gang wrote:
>=20
> If CONFIG_MMU is disabled, it will let ARM9TDMI and ARM7TDMI visible,
> but in fact, only AT91X40 need ARM7TDMI, so not need let them visible=
=2E
>=20
> Signed-off-by: Chen Gang <gang.chen@asianux.com>
> ---
>  arch/arm/mach-at91/Kconfig.non_dt |    1 +
>  arch/arm/mm/Kconfig               |    4 ++--
>  2 files changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/arm/mach-at91/Kconfig.non_dt
> b/arch/arm/mach-at91/Kconfig.non_dt
> index 6c24985..dc972e1 100644
> --- a/arch/arm/mach-at91/Kconfig.non_dt
> +++ b/arch/arm/mach-at91/Kconfig.non_dt
> @@ -47,6 +47,7 @@ config ARCH_AT91X40
>  	select ARCH_USES_GETTIMEOFFSET
>  	select MULTI_IRQ_HANDLER
>  	select SPARSE_IRQ
> +	select CPU_ARM7TDMI
>=20
>  endchoice
>=20
> diff --git a/arch/arm/mm/Kconfig b/arch/arm/mm/Kconfig
> index 9e8101e..3397d05 100644
> --- a/arch/arm/mm/Kconfig
> +++ b/arch/arm/mm/Kconfig
> @@ -6,7 +6,7 @@ comment "Processor Type"
>=20
>  # ARM7TDMI
>  config CPU_ARM7TDMI
> -	bool "Support ARM7TDMI processor"
> +	bool
>  	depends on !MMU
>  	select CPU_32v4T
>  	select CPU_ABRT_LV4T
> @@ -56,7 +56,7 @@ config CPU_ARM740T
>=20
>  # ARM9TDMI
>  config CPU_ARM9TDMI
> -	bool "Support ARM9TDMI processor"
> +	bool
>  	depends on !MMU
>  	select CPU_32v4T
>  	select CPU_ABRT_NOMMU
>=20


--=20
Chen Gang

Asianux Corporation
