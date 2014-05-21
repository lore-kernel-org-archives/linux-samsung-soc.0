From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 1/1] ARM: EXYNOS: Fix compilation warning
Date: Wed, 21 May 2014 16:56:33 +0530
Message-ID: <CAK9yfHyFEb3hchLLndfqW1xOHD59d_bsFMA4k5MLJ8Hgpx7Ekw@mail.gmail.com>
References: <1399282008-9738-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f50.google.com ([209.85.219.50]:36187 "EHLO
	mail-oa0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752874AbaEUL0f convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 May 2014 07:26:35 -0400
Received: by mail-oa0-f50.google.com with SMTP id i7so2063917oag.9
        for <linux-samsung-soc@vger.kernel.org>; Wed, 21 May 2014 04:26:33 -0700 (PDT)
In-Reply-To: <1399282008-9738-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Sachin Kamat <sachin.kamat@linaro.org>, Rob Herring <robh@kernel.org>

On 5 May 2014 14:56, Sachin Kamat <sachin.kamat@linaro.org> wrote:
> of_get_flat_dt_prop return type is now const.
> Fixes the following compilation warning introduced by commit 9d0c4dfe=
dd96
> ("of/fdt: update of_get_flat_dt_prop in prep for libfdt")
>
> arch/arm/mach-exynos/exynos.c:259:6: warning:
> assignment discards =E2=80=98const=E2=80=99 qualifier from pointer ta=
rget type [enabled by default]
>
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> Cc: Rob Herring <robh@kernel.org>
> ---
> Based on linux-next (20140505)
> ---
>  arch/arm/mach-exynos/exynos.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/mach-exynos/exynos.c b/arch/arm/mach-exynos/exy=
nos.c
> index 77293d39dfc9..f356c67a1fa9 100644
> --- a/arch/arm/mach-exynos/exynos.c
> +++ b/arch/arm/mach-exynos/exynos.c
> @@ -249,7 +249,7 @@ static int __init exynos_fdt_map_chipid(unsigned =
long node, const char *uname,
>                                         int depth, void *data)
>  {
>         struct map_desc iodesc;
> -       __be32 *reg;
> +       const __be32 *reg;
>         int len;
>
>         if (!of_flat_dt_is_compatible(node, "samsung,exynos4210-chipi=
d") &&
> --
> 1.7.9.5
>

Ping. This warning is still seen in latest linux-next.

--=20
With warm regards,
Sachin
