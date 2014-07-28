From: Sachin Kamat <spk.linux@gmail.com>
Subject: Re: [RESEND][PATCH 2/2] ARM: EXYNOS: Add exynos5260 PMU compatible
 string to DT match table
Date: Mon, 28 Jul 2014 20:57:35 +0530
Message-ID: <CAK5sBcEjgUAJEDHfFadaQ63j8W=Nggav1ZZzQjm-MdnAx7nJ4g@mail.gmail.com>
References: <1406551080-14821-1-git-send-email-vikas.sajjan@samsung.com>
	<1406551080-14821-3-git-send-email-vikas.sajjan@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f175.google.com ([209.85.217.175]:37723 "EHLO
	mail-lb0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753018AbaG1P1g (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 28 Jul 2014 11:27:36 -0400
Received: by mail-lb0-f175.google.com with SMTP id 10so5819366lbg.6
        for <linux-samsung-soc@vger.kernel.org>; Mon, 28 Jul 2014 08:27:35 -0700 (PDT)
In-Reply-To: <1406551080-14821-3-git-send-email-vikas.sajjan@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vikas Sajjan <vikas.sajjan@samsung.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, sunil joshi <joshi@samsung.com>, sajjan.linux@gmail.com, Doug Anderson <dianders@chromium.org>

 Hi Vikas,

On Mon, Jul 28, 2014 at 6:08 PM, Vikas Sajjan <vikas.sajjan@samsung.com> wrote:
> Exynos initialisation code now relies on obtaining the PMU address via
> DT, so add the exynos5260 PMU compatible string to DT match table.
>
> Signed-off-by: Vikas Sajjan <vikas.sajjan@samsung.com>
> ---
>  arch/arm/mach-exynos/exynos.c |    1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm/mach-exynos/exynos.c b/arch/arm/mach-exynos/exynos.c
> index df41bd1..e4f7270 100644
> --- a/arch/arm/mach-exynos/exynos.c
> +++ b/arch/arm/mach-exynos/exynos.c
> @@ -253,6 +253,7 @@ static const struct of_device_id exynos_dt_pmu_match[] = {
>         { .compatible = "samsung,exynos4412-pmu" },
>         { .compatible = "samsung,exynos5250-pmu" },
>         { .compatible = "samsung,exynos5420-pmu" },
> +       { .compatible = "samsung,exynos5260-pmu" },

Same comment as previous patch regarding order.

-- 
Regards,
Sachin.
