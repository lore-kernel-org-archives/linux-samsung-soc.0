From: Vikas Sajjan <sajjan.linux@gmail.com>
Subject: Re: [PATCH 0/2] Add GPLL, APLL, KPLL, EPLL and VPLL freq table for
 exynos5420 and exynos5250
Date: Wed, 14 Aug 2013 10:36:53 +0530
Message-ID: <CAGm_ybjdmO3Oisco7eYbQ3=bLjsAi7A4mt8R53tqM=z96m0QjA@mail.gmail.com>
References: <1376301734-21847-1-git-send-email-vikas.sajjan@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f177.google.com ([209.85.212.177]:42431 "EHLO
	mail-wi0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751848Ab3HNFGy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Aug 2013 01:06:54 -0400
Received: by mail-wi0-f177.google.com with SMTP id hq12so1474092wib.4
        for <linux-samsung-soc@vger.kernel.org>; Tue, 13 Aug 2013 22:06:53 -0700 (PDT)
In-Reply-To: <1376301734-21847-1-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mike Turquette <mturquette@linaro.org>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Doug Anderson <dianders@chromium.org>, patches@linaro.org, linaro-kernel@lists.linaro.org

Hi Mike,

On Mon, Aug 12, 2013 at 3:32 PM, Vikas Sajjan <vikas.sajjan@linaro.org> wrote:
> Adds GPLL, APLL, KPLL, EPLL and VPLL freq table for exynos5420 and exynos5250.
>
> is rebased on Mike's
> https://git.linaro.org/gitweb?p=people/mturquette/linux.git;a=shortlog;h=refs/heads/clk-next
>
>
> Vikas Sajjan (2):
>   clk: samsung: Add GPLL freq table for exynos5250 SoC
>   clk: samsung: Add APLL, KPLL, EPLL and VPLL freq table for exynos5420
>     SoC
>
>  drivers/clk/samsung/clk-exynos5250.c |   19 +++++++-
>  drivers/clk/samsung/clk-exynos5420.c |   81 ++++++++++++++++++++++++++++++++++
>  2 files changed, 99 insertions(+), 1 deletion(-)
>

Can you apply this patchset.

> --
> 1.7.9.5
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
