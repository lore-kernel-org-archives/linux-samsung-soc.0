From: Ajay kumar <ajaynumb@gmail.com>
Subject: Re: [PATCH 3/3] ARM: EXYNOS: Add g2d clock support for EXYNOS5
Date: Thu, 20 Dec 2012 18:20:14 +0530
Message-ID: <CAEC9eQNTiZGye9gQmkDWTcCajcPtVOfTHWW1c4LS1odAkrDVyA@mail.gmail.com>
References: <1354112989-3161-1-git-send-email-ajaykumar.rs@samsung.com>
	<1354112989-3161-3-git-send-email-ajaykumar.rs@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f178.google.com ([209.85.223.178]:63846 "EHLO
	mail-ie0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751623Ab2LTMuP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Dec 2012 07:50:15 -0500
Received: by mail-ie0-f178.google.com with SMTP id c12so4528608ieb.9
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Dec 2012 04:50:15 -0800 (PST)
In-Reply-To: <1354112989-3161-3-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ajay Kumar <ajaykumar.rs@samsung.com>
Cc: kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, thomas.abraham@linaro.org

ping.

On Wed, Nov 28, 2012 at 7:59 PM, Ajay Kumar <ajaykumar.rs@samsung.com> wrote:
> Add g2d clock instance for EXYNOS5 g2d controller.
>
> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> ---
>  arch/arm/mach-exynos/clock-exynos5.c |    4 ++++
>  1 files changed, 4 insertions(+), 0 deletions(-)
>
> diff --git a/arch/arm/mach-exynos/clock-exynos5.c b/arch/arm/mach-exynos/clock-exynos5.c
> index 5c63bc7..f16b027 100644
> --- a/arch/arm/mach-exynos/clock-exynos5.c
> +++ b/arch/arm/mach-exynos/clock-exynos5.c
> @@ -711,6 +711,10 @@ static struct clk exynos5_init_clocks_off[] = {
>                 .enable         = exynos5_clk_ip_disp1_ctrl,
>                 .ctrlbit        = (1 << 5),
>         }, {
> +               .name           = "fimg2d",
> +               .enable         = exynos5_clk_ip_acp_ctrl,
> +               .ctrlbit        = (1 << 3),
> +       }, {
>                 .name           = "dp",
>                 .devname        = "exynos-dp",
>                 .enable         = exynos5_clk_ip_disp1_ctrl,
> --
> 1.7.1
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
