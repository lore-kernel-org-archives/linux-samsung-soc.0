From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [RESEND PATCH 1/5] clk: samsung: Use clk->base instead of directly using clk->con0 for PLL3xxx
Date: Fri, 24 May 2013 23:55:03 +0200
Message-ID: <4808417.0aThqqOIhP@flatron>
References: <1369391478-7665-1-git-send-email-vikas.sajjan@linaro.org> <1369391478-7665-2-git-send-email-vikas.sajjan@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bk0-f53.google.com ([209.85.214.53]:54037 "EHLO
	mail-bk0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755459Ab3EXVzJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 24 May 2013 17:55:09 -0400
Received: by mail-bk0-f53.google.com with SMTP id mx1so2805614bkb.12
        for <linux-samsung-soc@vger.kernel.org>; Fri, 24 May 2013 14:55:08 -0700 (PDT)
In-Reply-To: <1369391478-7665-2-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vikas Sajjan <vikas.sajjan@linaro.org>
Cc: yadi.brar01@gmail.com, linux-samsung-soc@vger.kernel.org, dianders@chromium.org, linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, mturquette@linaro.org, thomas.abraham@linaro.org

Hi,

On Friday 24 of May 2013 16:01:14 Vikas Sajjan wrote:
> From: Yadwinder Singh Brar <yadi.brar@samsung.com>
> 
> To factor out possible common code, this patch unifies the clk strutures
> used for PLL35xx & PLL36xx and usues clk->base instead of clk->con0.
> 
> Signed-off-by: Yadwinder Singh Brar <yadi.brar@samsung.com>
> ---
>  drivers/clk/samsung/clk-exynos4.c    |   10 ++++---
>  drivers/clk/samsung/clk-exynos5250.c |   14 ++++-----
>  drivers/clk/samsung/clk-pll.c        |   54
> ++++++++++++++++++---------------- drivers/clk/samsung/clk-pll.h       
> |    4 +--
>  4 files changed, 44 insertions(+), 38 deletions(-)
> 

Whether this patch really allows to factor out any significant amount of 
common code is rather discussible, but generally looks fine.

Reviewed-by: Tomasz Figa <t.figa@samsung.com>

Best regards,
Tomasz
