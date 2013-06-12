From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v4 1/6] clk: samsung: Use clk->base instead of directly
 using clk->con0 for PLL3xxx
Date: Wed, 12 Jun 2013 14:50:29 -0700
Message-ID: <CAD=FV=XKjYBzgBwY+CnUZyzyBzgGN88Y39n=tABgAH5aU3gSkQ@mail.gmail.com>
References: <1370272196-4346-1-git-send-email-yadi.brar@samsung.com>
	<1370272196-4346-2-git-send-email-yadi.brar@samsung.com>
	<CAD=FV=VTLkH9oDqr263Kyv=wCEbuQ40VL7mtC73SCMt20NPwgQ@mail.gmail.com>
	<1501124.EVQA8KO0ic@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-la0-f43.google.com ([209.85.215.43]:62979 "EHLO
	mail-la0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755220Ab3FLVub (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Jun 2013 17:50:31 -0400
Received: by mail-la0-f43.google.com with SMTP id gw10so8312163lab.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Jun 2013 14:50:29 -0700 (PDT)
In-Reply-To: <1501124.EVQA8KO0ic@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Yadwinder Singh Brar <yadi.brar@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>, Mike Turquette <mturquette@linaro.org>, Thomas Abraham <thomas.abraham@linaro.org>, Tomasz Figa <t.figa@samsung.com>, Vikas Sajjan <vikas.sajjan@linaro.org>, Patch Tracking <patches@linaro.org>, Andrew Bresticker <abrestic@chromium.org>

Tomasz,

On Wed, Jun 12, 2013 at 2:19 PM, Tomasz Figa <tomasz.figa@gmail.com> wrote:
> Hmm, if done properly, it could simplify PLL registration in SoC clock
> initialization code a lot.
>
> I'm not sure if this is really the best solution (feel free to suggest
> anything better), but we could put PLLs in an array, like other clocks,
> e.g.
>
>         ... exynos4210_pll_clks[] = {
>                 CLK_PLL45XX(...),
>                 CLK_PLL45XX(...),
>                 CLK_PLL46XX(...),
>                 CLK_PLL46XX(...),
>         };
>
> and then just call a helper like
>
>         samsung_clk_register_pll(exynos4210_pll_clks,
>                         ARRAY_SIZE(exynos4210_pll_clks));

Something like that looks like what I was thinking.  I'd have to see
it actually coded up to see if there's something I'm missing that
would prevent us from doing that, but I don't see anything.

-Doug
