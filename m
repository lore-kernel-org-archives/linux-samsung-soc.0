From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 0/2] ARM: EXYNOS: G2D clock support to Exynos4
Date: Mon, 2 Jul 2012 11:04:23 +0530
Message-ID: <CAK9yfHz14cYUqKj_QHCMcEJRQa5Hdq61fS5NJ5VHahSt_emDvA@mail.gmail.com>
References: <1337314071-15305-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f174.google.com ([209.85.220.174]:39352 "EHLO
	mail-vc0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755090Ab2GBFeY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 Jul 2012 01:34:24 -0400
Received: by vcbf11 with SMTP id f11so3297453vcb.19
        for <linux-samsung-soc@vger.kernel.org>; Sun, 01 Jul 2012 22:34:23 -0700 (PDT)
In-Reply-To: <1337314071-15305-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

ping ...

On 18/05/2012, Sachin Kamat <sachin.kamat@linaro.org> wrote:
> This patch series moves the SoC specific G2D clock entries from common clock
>
> file (clock-exynos4.c) to Exynos4210 specific clock file
> (clock-exynos4210.c)
> since G2D clock registers are different in Exynos4210 and Exynos4X12 SoCs
> and adds support for Exynos4x12 G2D clock.
>
> This series is based on Kukjin Kim's latest for-next branch.
>
> Sachin Kamat (2):
>   ARM: EXYNOS: Move G2D clock entries to clock-exynos4210.c file
>   ARM: EXYNOS: Add G2D related clock entries for SMDK4X12
>
>  arch/arm/mach-exynos/clock-exynos4.c    |   41
> +-----------------------------
>  arch/arm/mach-exynos/clock-exynos4.h    |    3 ++
>  arch/arm/mach-exynos/clock-exynos4210.c |   37
> ++++++++++++++++++++++++++++
>  arch/arm/mach-exynos/clock-exynos4212.c |   41
> +++++++++++++++++++++++++++++-
>  4 files changed, 81 insertions(+), 41 deletions(-)
>
> --
> 1.7.4.1
>
>


-- 
With warm regards,
Sachin
