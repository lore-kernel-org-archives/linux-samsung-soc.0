From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2 1/5] clk: samsung: Use clk->base instead of directly
 using clk->con0 for PLL3xxx
Date: Wed, 29 May 2013 10:58:02 -0700
Message-ID: <CAD=FV=XAc0R4gHrogYE3gAp5ANWFfo2UT0LCkhn3eVV0b5ukxQ@mail.gmail.com>
References: <1369834677-20312-1-git-send-email-vikas.sajjan@linaro.org>
	<1369834677-20312-2-git-send-email-vikas.sajjan@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-la0-f43.google.com ([209.85.215.43]:46375 "EHLO
	mail-la0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934981Ab3E2R6H (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 29 May 2013 13:58:07 -0400
Received: by mail-la0-f43.google.com with SMTP id ez20so8999632lab.30
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 May 2013 10:58:04 -0700 (PDT)
In-Reply-To: <1369834677-20312-2-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vikas Sajjan <vikas.sajjan@linaro.org>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <t.figa@samsung.com>, yadi.brar01@gmail.com, Mike Turquette <mturquette@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Thomas Abraham <thomas.abraham@linaro.org>, Patch Tracking <patches@linaro.org>, linaro-kernel@lists.linaro.org

Vikas / Yadwinder,

On Wed, May 29, 2013 at 6:37 AM, Vikas Sajjan <vikas.sajjan@linaro.org> wrote:
> From: Yadwinder Singh Brar <yadi.brar@samsung.com>
>
> To factor out possible common code, this patch unifies the clk strutures used
> for PLL35xx & PLL36xx and usues clk->base instead of clk->con0.
>
> Reviewed-by: Tomasz Figa <t.figa@samsung.com>
> Signed-off-by: Yadwinder Singh Brar <yadi.brar@samsung.com>
> ---
>  drivers/clk/samsung/clk-exynos4.c    |   10 ++++---
>  drivers/clk/samsung/clk-exynos5250.c |   14 ++++-----
>  drivers/clk/samsung/clk-pll.c        |   54 ++++++++++++++++++----------------
>  drivers/clk/samsung/clk-pll.h        |    4 +--
>  4 files changed, 44 insertions(+), 38 deletions(-)

I've run with this patch atop our CCF backport on 3.8 on on
exynos5250-snow.  It works and looks good to me.  We're planning to
put this patch into our tree at
<https://gerrit.chromium.org/gerrit/#/c/56740>.

Reviewed-by: Doug Anderson <dianders@chromium.org>
Tested-by: Doug Anderson <dianders@chromium.org>
