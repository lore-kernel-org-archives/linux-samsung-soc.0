From: KyongHo Cho <pullip.cho@samsung.com>
Subject: Re: [RESEND][PATCH] ARM: Exynos4: fixed SYSMMU setup definition to
 mate parameter name
Date: Mon, 27 Aug 2012 20:59:50 +0900
Message-ID: <CAHQjnONVGq4faWbwg8C+fA4MFKQH1CWarJueLjdgU2ebYwFbGw@mail.gmail.com>
References: <1346050903-4450-1-git-send-email-sw0312.kim@samsung.com>
	<1346051491-5131-1-git-send-email-sw0312.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f174.google.com ([209.85.217.174]:62919 "EHLO
	mail-lb0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750928Ab2H0L7w (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 27 Aug 2012 07:59:52 -0400
Received: by lbbgj3 with SMTP id gj3so2439893lbb.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Aug 2012 04:59:51 -0700 (PDT)
In-Reply-To: <1346051491-5131-1-git-send-email-sw0312.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Seung-Woo Kim <sw0312.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, kyungmin.park@samsung.com

On Mon, Aug 27, 2012 at 4:11 PM, Seung-Woo Kim <sw0312.kim@samsung.com> wrote:
> This is trivial patch to mate parameter name between iommu api enabled case and
> disabled case.
>
> Signed-off-by: Seung-Woo Kim <sw0312.kim@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
> Sorry about typo in previous patch.
>
>  arch/arm/mach-exynos/include/mach/sysmmu.h |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/arch/arm/mach-exynos/include/mach/sysmmu.h b/arch/arm/mach-exynos/include/mach/sysmmu.h
> index 998daf2..81e4c66 100644
> --- a/arch/arm/mach-exynos/include/mach/sysmmu.h
> +++ b/arch/arm/mach-exynos/include/mach/sysmmu.h
> @@ -58,7 +58,7 @@ static inline void platform_set_sysmmu(
>  #endif
>
>  #else /* !CONFIG_EXYNOS_DEV_SYSMMU */
> -#define platform_set_sysmmu(dev, sysmmu) do { } while (0)
> +#define platform_set_sysmmu(sysmmu, dev) do { } while (0)
>  #endif
>

Thank you for your correction.

KyongHo
