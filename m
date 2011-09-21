From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [RESEND PATCH 2/3] ARM: EXYNOS4: Update consistent DMA size to 8MB
Date: Wed, 21 Sep 2011 15:25:17 +0900
Message-ID: <CAH9JG2XegdW95MvFcstfrWOWsqQjJob9kiTwFq8tnZn_SbS+bQ@mail.gmail.com>
References: <1316583860-32510-1-git-send-email-hatim.rv@samsung.com>
	<1316583860-32510-3-git-send-email-hatim.rv@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f42.google.com ([209.85.210.42]:32845 "EHLO
	mail-pz0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751821Ab1IUGZS convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 Sep 2011 02:25:18 -0400
Received: by pzk1 with SMTP id 1so1285508pzk.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Sep 2011 23:25:18 -0700 (PDT)
In-Reply-To: <1316583860-32510-3-git-send-email-hatim.rv@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Hatim Ali <hatim.rv@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, t.stanislaws@samsung.com, mchehab@infradead.org, hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com, banajit.g@samsung.com

Hi,

As I know,  CONSISTENT_DMA_SIZE is removed, please use the updated APIs=
=2E

Thank you,
Kyungmin Park

On Wed, Sep 21, 2011 at 2:44 PM, Hatim Ali <hatim.rv@samsung.com> wrote=
:
> Change the consistent DMA allocation to 8MB to support the
> TVOUT driver.
>
> NOTE: Once CMA support is merged into mainline, we will use it for me=
mory
> allocation.
>
> Signed-off-by: Hatim Ali <hatim.rv@samsung.com>
> ---
> =A0arch/arm/mach-exynos4/include/mach/memory.h | =A0 =A02 ++
> =A01 files changed, 2 insertions(+), 0 deletions(-)
>
> diff --git a/arch/arm/mach-exynos4/include/mach/memory.h b/arch/arm/m=
ach-exynos4/include/mach/memory.h
> index 374ef2c..7549742 100644
> --- a/arch/arm/mach-exynos4/include/mach/memory.h
> +++ b/arch/arm/mach-exynos4/include/mach/memory.h
> @@ -15,6 +15,8 @@
>
> =A0#define PLAT_PHYS_OFFSET =A0 =A0 =A0 =A0 =A0 =A0 =A0 UL(0x40000000=
)
>
> +#define CONSISTENT_DMA_SIZE =A0 =A0 =A0 =A0 =A0 =A0SZ_8M
> +
> =A0/* Maximum of 256MiB in one bank */
> =A0#define MAX_PHYSMEM_BITS =A0 =A0 =A0 32
> =A0#define SECTION_SIZE_BITS =A0 =A0 =A028
> --
> 1.7.2.3
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
