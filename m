From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH 1/4] ARM: SAMSUNG: Move the start address of Samsung SoCs'
 VA space
Date: Tue, 5 Oct 2010 13:06:25 +0900
Message-ID: <AANLkTikfjiKunxZdWwbUi3cbj-20U=Fb1sO8j+Hcr8iy@mail.gmail.com>
References: <1286244398-9333-1-git-send-email-kgene.kim@samsung.com>
	<1286244398-9333-2-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:36123 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750716Ab0JEEG0 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Oct 2010 00:06:26 -0400
Received: by bwz11 with SMTP id 11so4274660bwz.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 04 Oct 2010 21:06:25 -0700 (PDT)
In-Reply-To: <1286244398-9333-2-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

On Tue, Oct 5, 2010 at 11:06 AM, Kukjin Kim <kgene.kim@samsung.com> wro=
te:
> This patch moves the start address of Samsung SoCs' VA space so that
> can use more vmalloc()/ioremap() space. Of course need to change the
> VMALLOC_END for it.
> Actually Samsung SoCs' VA space (free for platform use area) becomes
> 80MiB with this patch, it's enough.
>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> Cc: Ben Dooks <ben-linux@fluff.org>
> ---
> =C2=A0arch/arm/plat-samsung/include/plat/map-base.h | =C2=A0 =C2=A04 =
++--
> =C2=A01 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/plat-samsung/include/plat/map-base.h b/arch/arm=
/plat-samsung/include/plat/map-base.h
> index 250be31..86f66be 100644
> --- a/arch/arm/plat-samsung/include/plat/map-base.h
> +++ b/arch/arm/plat-samsung/include/plat/map-base.h
> @@ -14,7 +14,7 @@
> =C2=A0#ifndef __ASM_PLAT_MAP_H
> =C2=A0#define __ASM_PLAT_MAP_H __FILE__
>
> -/* Fit all our registers in at 0xF4000000 upwards, trying to use as
> +/* Fit all our registers in at 0xFA000000 upwards, trying to use as
> =C2=A0* little of the VA space as possible so vmalloc and friends hav=
e a
> =C2=A0* better chance of getting memory.
> =C2=A0*
> @@ -22,7 +22,7 @@
> =C2=A0* an single MOVS instruction (ie, only 8 bits of set data)
> =C2=A0*/
>
> -#define S3C_ADDR_BASE =C2=A0(0xF4000000)
> +#define S3C_ADDR_BASE =C2=A0(0xFA000000)

maybe you could drop the brackets from the address value
