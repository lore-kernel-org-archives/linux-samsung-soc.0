From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH] ARM: S5PV210: Fix on SECTION_SIZE_BITS on
	S5PV210/S5PC110.
Date: Tue, 6 Jul 2010 14:33:43 +0900
Message-ID: <AANLkTimqquLc7lW7TdMD2q84d4uATvHKppt5gVfKcMFT@mail.gmail.com>
References: <1278391007-11144-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-px0-f174.google.com ([209.85.212.174]:59221 "EHLO
	mail-px0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751684Ab0GFFdo convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 6 Jul 2010 01:33:44 -0400
Received: by pxi14 with SMTP id 14so1941658pxi.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 05 Jul 2010 22:33:44 -0700 (PDT)
In-Reply-To: <1278391007-11144-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

On Tue, Jul 6, 2010 at 1:36 PM, Kukjin Kim <kgene.kim@samsung.com> wrot=
e:
> This patch fixes on SECTION_SIZE_BITS for Sparsemem on S5PV210/S5PC11=
0.
> Because smallest size of a bank on S5PV210/S5PC110 is aligned by 16MB=
=2E
> So each section's maximum size should be 16MB.

Could you explain what's the problem?

Even though 80MiB is used at logical size. it used the physical 128MiB
so. it's reasonable to use 128MiB align instead of 16MiB. Are there
boards use 64MiB or less?

I think if decrease the SECTIONS_SIZE_BITS, it wastes the memory.

Thank you,
Kyungmin Park

>
> Reported-by: Kyongho Cho <pullip.cho@samsung.com>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
> =A0arch/arm/mach-s5pv210/include/mach/memory.h | =A0 =A08 ++++++--
> =A01 files changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/mach-s5pv210/include/mach/memory.h b/arch/arm/m=
ach-s5pv210/include/mach/memory.h
> index 379117e..4a372d8 100644
> --- a/arch/arm/mach-s5pv210/include/mach/memory.h
> +++ b/arch/arm/mach-s5pv210/include/mach/memory.h
> @@ -16,8 +16,12 @@
> =A0#define PHYS_OFFSET =A0 =A0 =A0 =A0 =A0 =A0UL(0x20000000)
> =A0#define CONSISTENT_DMA_SIZE =A0 =A0(SZ_8M + SZ_4M + SZ_2M)
>
> -/* Maximum of 256MiB in one bank */
> +/* Sparsemem support. Each section is a maximum of 16MB.
> + * Because there are many different memory type on S5PC110(MCP),
> + * and there is a case that having 80MB, 128MB or 256MB in one
> + * bank.
> +*/
> =A0#define MAX_PHYSMEM_BITS =A0 =A0 =A0 32
> -#define SECTION_SIZE_BITS =A0 =A0 =A028
> +#define SECTION_SIZE_BITS =A0 =A0 =A024
>
> =A0#endif /* __ASM_ARCH_MEMORY_H */
> --
> 1.6.2.5
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
