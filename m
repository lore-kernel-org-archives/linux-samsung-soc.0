From: MyungJoo Ham <myungjoo.ham@gmail.com>
Subject: Re: [PATCH 1/7] ARM: EXYNOS4: Add external GIC io memory mapping
Date: Thu, 30 Jun 2011 15:54:37 +0900
Message-ID: <BANLkTikYvCVVZP+z06466x1maEi3CDcq5w@mail.gmail.com>
References: <1308555258-4322-1-git-send-email-chaos.youn@samsung.com>
	<1308555258-4322-2-git-send-email-chaos.youn@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:62172 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754227Ab1F3Gyi convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 30 Jun 2011 02:54:38 -0400
Received: by bwd5 with SMTP id 5so1581354bwd.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Jun 2011 23:54:37 -0700 (PDT)
In-Reply-To: <1308555258-4322-2-git-send-email-chaos.youn@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Changhwan Youn <chaos.youn@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, ben-linux@fluff.org

On Mon, Jun 20, 2011 at 4:34 PM, Changhwan Youn <chaos.youn@samsung.com=
> wrote:
> This patch adds external GIC io memory mapping
> to support external GIC on EXYNOS4.
>
> Signed-off-by: Changhwan Youn <chaos.youn@samsung.com>
> ---
> =A0arch/arm/mach-exynos4/cpu.c =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 10 ++=
++++++++
> =A0arch/arm/mach-exynos4/include/mach/map.h | =A0 =A05 +++--
> =A0arch/arm/plat-s5p/include/plat/map-s5p.h | =A0 =A05 +++--
> =A03 files changed, 16 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm/mach-exynos4/cpu.c b/arch/arm/mach-exynos4/cpu.=
c
> index 1196f39..6a1ed74 100644
> --- a/arch/arm/mach-exynos4/cpu.c
> +++ b/arch/arm/mach-exynos4/cpu.c
> @@ -107,6 +107,16 @@ static struct map_desc exynos4_iodesc[] __initda=
ta =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.pfn =A0 =A0 =A0 =A0 =A0 =A0=3D __phys=
_to_pfn(EXYNOS4_PA_AUDSS),
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.length =A0 =A0 =A0 =A0 =3D SZ_1K,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.type =A0 =A0 =A0 =A0 =A0 =3D MT_DEVIC=
E,
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .virtual =A0 =A0 =A0 =A0=3D (unsigned l=
ong)S5P_VA_GIC_CPU,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pfn =A0 =A0 =A0 =A0 =A0 =A0=3D __phys_=
to_pfn(EXYNOS4_PA_GIC_CPU),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .length =A0 =A0 =A0 =A0 =3D SZ_64K,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .type =A0 =A0 =A0 =A0 =A0 =3D MT_DEVICE=
,
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .virtual =A0 =A0 =A0 =A0=3D (unsigned l=
ong)S5P_VA_GIC_DIST,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pfn =A0 =A0 =A0 =A0 =A0 =A0=3D __phys_=
to_pfn(EXYNOS4_PA_GIC_DIST),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .length =A0 =A0 =A0 =A0 =3D SZ_64K,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .type =A0 =A0 =A0 =A0 =A0 =3D MT_DEVICE=
,
> =A0 =A0 =A0 =A0},
> =A0};
>
> diff --git a/arch/arm/mach-exynos4/include/mach/map.h b/arch/arm/mach=
-exynos4/include/mach/map.h
> index 57d8074..9d5d797 100644
> --- a/arch/arm/mach-exynos4/include/mach/map.h
> +++ b/arch/arm/mach-exynos4/include/mach/map.h
> @@ -61,10 +61,11 @@
>
> =A0#define EXYNOS4_PA_COMBINER =A0 =A0 =A0 =A0 =A0 =A00x10448000

Isn't this 0x10440000 if we are going to use External GIC?

The user manual says it's 0x10440000 for Ext-GIC and 0x10448000 for
Internal-GIC.


--=20
MyungJoo Ham, Ph.D.
Mobile Software Platform Lab,
Digital Media and Communications (DMC) Business
Samsung Electronics
cell: 82-10-6714-2858
