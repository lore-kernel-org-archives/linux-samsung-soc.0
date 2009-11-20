From: jassi brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH 01/20] ARM: S5PC100: use 0x30008000 as memory base
Date: Fri, 20 Nov 2009 23:42:36 +0900
Message-ID: <1b68c6790911200642j792834e9q47d605b80c2e36d2@mail.gmail.com>
References: <1258551194-16018-1-git-send-email-m.szyprowski@samsung.com>
	 <1258724572-19176-2-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f171.google.com ([209.85.222.171]:63906 "EHLO
	mail-pz0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753800AbZKTOma convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 20 Nov 2009 09:42:30 -0500
Received: by pzk1 with SMTP id 1so2438745pzk.33
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Nov 2009 06:42:37 -0800 (PST)
In-Reply-To: <1258724572-19176-2-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kyungmin.park@samsung.com, ben-linux@fluff.org

On Fri, Nov 20, 2009 at 10:42 PM, Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
> From: Kyungmin Park <kyungmin.park@samsung.com>
>
> We decided to use 0x3000'0000 as base memory address on S5PC1XX SoCs
> (s5pc100 and s5pc110).
you might as well want to explain the reason behind it, if any?

> A patch to u-boot that configures SMDKC100 board and sets base memory
> as 0x3000'0000 has been already posted.
>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
> =C2=A0arch/arm/mach-s5pc100/Makefile.boot =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 | =C2=A0 =C2=A04 ++--
> =C2=A0arch/arm/mach-s5pc100/include/mach/map.h =C2=A0 =C2=A0| =C2=A0 =
=C2=A02 +-
> =C2=A0arch/arm/mach-s5pc100/include/mach/memory.h | =C2=A0 =C2=A02 +-
> =C2=A03 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm/mach-s5pc100/Makefile.boot b/arch/arm/mach-s5pc=
100/Makefile.boot
> index ff90aa1..b0909e3 100644
> --- a/arch/arm/mach-s5pc100/Makefile.boot
> +++ b/arch/arm/mach-s5pc100/Makefile.boot
> @@ -1,2 +1,2 @@
> - =C2=A0 zreladdr-y =C2=A0:=3D 0x20008000
> -params_phys-y =C2=A0:=3D 0x20000100
> + =C2=A0 zreladdr-y =C2=A0:=3D 0x30008000
> +params_phys-y =C2=A0:=3D 0x30000100
> diff --git a/arch/arm/mach-s5pc100/include/mach/map.h b/arch/arm/mach=
-s5pc100/include/mach/map.h
> index 4681ebe..f90c033 100644
> --- a/arch/arm/mach-s5pc100/include/mach/map.h
> +++ b/arch/arm/mach-s5pc100/include/mach/map.h
> @@ -113,7 +113,7 @@
> =C2=A0#define S5PC100_PA_TSADC =C2=A0 =C2=A0 =C2=A0 (0xF3000000)
>
> =C2=A0/* ETC */
> -#define S5PC100_PA_SDRAM =C2=A0 =C2=A0 =C2=A0 (0x20000000)
> +#define S5PC100_PA_SDRAM =C2=A0 =C2=A0 =C2=A0 (0x30000000)
> =C2=A0#define S5PC1XX_PA_SDRAM =C2=A0 =C2=A0 =C2=A0 S5PC100_PA_SDRAM
>
> =C2=A0/* compatibility defines. */
> diff --git a/arch/arm/mach-s5pc100/include/mach/memory.h b/arch/arm/m=
ach-s5pc100/include/mach/memory.h
> index 4b60d18..21cc182 100644
> --- a/arch/arm/mach-s5pc100/include/mach/memory.h
> +++ b/arch/arm/mach-s5pc100/include/mach/memory.h
> @@ -13,6 +13,6 @@
> =C2=A0#ifndef __ASM_ARCH_MEMORY_H
> =C2=A0#define __ASM_ARCH_MEMORY_H
>
> -#define PHYS_OFFSET =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0UL(0x20=
000000)
> +#define PHYS_OFFSET =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0UL(0x30=
000000)
>
> =C2=A0#endif
> --
> 1.6.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =C2=A0http://vger.kernel.org/majordomo-info.ht=
ml
>
