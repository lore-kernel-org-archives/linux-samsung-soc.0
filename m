From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v3 3/6] clk: samsung: Add set_rate() clk_ops for PLL35xx
Date: Fri, 31 May 2013 10:10:58 -0700
Message-ID: <CAD=FV=UuEYCjaiTHn0B2iBUyKqA+KcbGWMu4iTNhSDFPz3311w@mail.gmail.com>
References: <1370003496-19288-1-git-send-email-vikas.sajjan@linaro.org>
	<1370003496-19288-4-git-send-email-vikas.sajjan@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-la0-f50.google.com ([209.85.215.50]:43261 "EHLO
	mail-la0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756196Ab3EaRLB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 31 May 2013 13:11:01 -0400
Received: by mail-la0-f50.google.com with SMTP id ed20so1617416lab.9
        for <linux-samsung-soc@vger.kernel.org>; Fri, 31 May 2013 10:10:58 -0700 (PDT)
In-Reply-To: <1370003496-19288-4-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vikas Sajjan <vikas.sajjan@linaro.org>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Yadwinder Singh Brar <yadi.brar01@gmail.com>, Mike Turquette <mturquette@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Thomas Abraham <thomas.abraham@linaro.org>, Patch Tracking <patches@linaro.org>, linaro-kernel@lists.linaro.org

Vikas and Yadwinder,

On Fri, May 31, 2013 at 5:31 AM, Vikas Sajjan <vikas.sajjan@linaro.org> wrote:
> +static long samsung_pll_round_rate(struct clk_hw *hw,
> +                       unsigned long drate, unsigned long *prate)
> +{
> +       struct samsung_clk_pll *pll = to_clk_pll(hw);
> +       const struct samsung_pll_rate_table *rate_table = pll->rate_table;
> +       int i;
> +
> +       /* Assumming rate_table is in descending order */
> +       for (i = 0; i < pll->rate_count; i++) {
> +               if (drate >= rate_table[i].rate)
> +                       return rate_table[i].rate;
> +       }
> +
> +       /* return minimum supported value */
> +       return rate_table[i - 1].rate;
> +}
>  /*
>   * PLL35xx Clock Type
>   */

You seem to have lost a carriage return between v2 and v3.  I will add
it locally before applying.  This still looks good though and already
has my Reviewed-by.

-Doug
