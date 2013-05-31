From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v3 4/6] clk: samsung: Add set_rate() clk_ops for PLL36xx
Date: Fri, 31 May 2013 10:15:11 -0700
Message-ID: <CAD=FV=XP3s+uJL+31XFz6r=BW5mGXDiK8EMT04rRwNf-XFa8qw@mail.gmail.com>
References: <1370003496-19288-1-git-send-email-vikas.sajjan@linaro.org>
	<1370003496-19288-5-git-send-email-vikas.sajjan@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-la0-f54.google.com ([209.85.215.54]:51143 "EHLO
	mail-la0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753061Ab3EaRPN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 31 May 2013 13:15:13 -0400
Received: by mail-la0-f54.google.com with SMTP id ec20so459491lab.13
        for <linux-samsung-soc@vger.kernel.org>; Fri, 31 May 2013 10:15:12 -0700 (PDT)
In-Reply-To: <1370003496-19288-5-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vikas Sajjan <vikas.sajjan@linaro.org>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Yadwinder Singh Brar <yadi.brar01@gmail.com>, Mike Turquette <mturquette@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Thomas Abraham <thomas.abraham@linaro.org>, Patch Tracking <patches@linaro.org>, linaro-kernel@lists.linaro.org

Vikas and Yadwinder,

On Fri, May 31, 2013 at 5:31 AM, Vikas Sajjan <vikas.sajjan@linaro.org> wrote:
>  struct clk * __init samsung_clk_register_pll36xx(const char *name,
> @@ -264,6 +318,11 @@ struct clk * __init samsung_clk_register_pll36xx(const char *name,
>         init.parent_names = &pname;
>         init.num_parents = 1;
>
> +       if (rate_table && rate_count)
> +               init.ops = &samsung_pll36xx_clk_ops;
> +       else
> +               init.ops = &samsung_pll36xx_clk_min_ops;
> +
>         pll->hw.init = &init;
>         pll->base = base;
>         pll->rate_table = rate_table;

Interesting.  In the gerrit review you sent for v2 you properly
removed the line:

  init.ops = &samsung_pll36xx_clk_ops;

...but the v2 you posted upstream didn't have that removal.  You've
also lost it in v3.  Perhaps you can add that back in?  I'll do it
locally before applying.


-Doug
