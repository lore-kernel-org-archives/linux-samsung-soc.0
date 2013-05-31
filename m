From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v3 2/6] clk: samsung: Add support to register rate_table
 for PLL3xxx
Date: Fri, 31 May 2013 10:08:39 -0700
Message-ID: <CAD=FV=XnzS8TuvtGRrZ+jN=8AUYr-imL1bRsdWY3BDQVwm615g@mail.gmail.com>
References: <1370003496-19288-1-git-send-email-vikas.sajjan@linaro.org>
	<1370003496-19288-3-git-send-email-vikas.sajjan@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-la0-f50.google.com ([209.85.215.50]:63095 "EHLO
	mail-la0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751311Ab3EaRIk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 31 May 2013 13:08:40 -0400
Received: by mail-la0-f50.google.com with SMTP id ed20so1575370lab.23
        for <linux-samsung-soc@vger.kernel.org>; Fri, 31 May 2013 10:08:39 -0700 (PDT)
In-Reply-To: <1370003496-19288-3-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vikas Sajjan <vikas.sajjan@linaro.org>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Yadwinder Singh Brar <yadi.brar01@gmail.com>, Mike Turquette <mturquette@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Thomas Abraham <thomas.abraham@linaro.org>, Patch Tracking <patches@linaro.org>, linaro-kernel@lists.linaro.org

Vikas and Yadwinder,

On Fri, May 31, 2013 at 5:31 AM, Vikas Sajjan <vikas.sajjan@linaro.org> wrote:
> From: Yadwinder Singh Brar <yadi.brar@samsung.com>
>
> This patch defines a common rate_table which will contain recommended p, m, s,
> k values for supported rates that needs to be changed for changing
> corresponding PLL's rate.
>
> Signed-off-by: Yadwinder Singh Brar <yadi.brar@samsung.com>
> ---
>  drivers/clk/samsung/clk-exynos4.c    |    8 ++++----
>  drivers/clk/samsung/clk-exynos5250.c |   14 +++++++-------
>  drivers/clk/samsung/clk-pll.c        |   14 ++++++++++++--
>  drivers/clk/samsung/clk-pll.h        |   35 ++++++++++++++++++++++++++++++++--
>  4 files changed, 56 insertions(+), 15 deletions(-)

This looks good to me.  Hopefully Tomasz agrees.  Tomasz: if you
haven't been following this thread, see
<https://patchwork.kernel.org/patch/2643351/> for how we resolved the
constant vs. calculated input clock.

Reviewed-by: Doug Anderson <dianders@chromium.org>
