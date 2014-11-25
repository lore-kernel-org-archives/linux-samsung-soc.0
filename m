From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [RFC 2/2] clk: samsung: Fix clock disable failure because domain
 being gated
Date: Tue, 25 Nov 2014 13:19:05 +0100
Message-ID: <1416917945.29431.6.camel@AMDC1943>
References: <1416842312-4405-1-git-send-email-k.kozlowski@samsung.com>
 <1416842312-4405-3-git-send-email-k.kozlowski@samsung.com>
 <CA+Ln22FTJ8AwNOq+jrA6dK=4ziGFwFT+Ofjr2zE4z=8B4f3QJw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:26182 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750984AbaKYMTJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 25 Nov 2014 07:19:09 -0500
In-reply-to: <CA+Ln22FTJ8AwNOq+jrA6dK=4ziGFwFT+Ofjr2zE4z=8B4f3QJw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Mike Turquette <mturquette@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Kukjin Kim <kgene@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Vivek Gautam <gautam.vivek@samsung.com>, Kevin Hilman <khilman@kernel.org>

On wto, 2014-11-25 at 20:35 +0900, Tomasz Figa wrote:
> Hi Krzysztof,
> 
> Please see my comments inline.
> 
> 2014-11-25 0:18 GMT+09:00 Krzysztof Kozlowski <k.kozlowski@samsung.com>:
> > +static int audss_clk_gate_enable(struct clk_hw *hw)
> > +{
> > +       int ret;
> > +
> > +       if (!IS_ERR(pll_in))
> > +               clk_prepare_enable(pll_in);
> 
> Calling clk_prepare_enable() from enable() callback doesn't look like
> a good idea, because enabling is not supposed to sleep, while
> preparing might do so.

Right.

> I guess you have to pre-prepare this clock in probe and then only call
> enable here.

Yes, the prepare won't have any negative effect on energy usage anyway.

> 
> > +       ret = clk_gate_ops.enable(hw);
> > +       if (!IS_ERR(pll_in))
> > +               clk_disable_unprepare(pll_in);
> > +
> > +       return ret;
> > +}
> 
> [snip]
> 
> > +/* TODO: Also mux and div */
> > +const struct clk_ops audss_clk_gate_ops = {
> 
> nit: static const probably?

Yes.

> 
> > +       .enable = audss_clk_gate_enable,
> > +       .disable = audss_clk_gate_disable,
> > +       .is_enabled = audss_clk_gate_is_enabled,
> > +};
> 
> As for the approach itself, maybe you should simply register fully
> custom clocks with clk_register(), without altering
> clk_register_gate() at all and simply calling gate ops whenever
> necessary? I don't know, just a loose idea.

Initially that seemed to me the simplest way to encapsulate gate_ops
calls. However in that approach I should also change clk_register_mux
and clk_register_divider... which complicates this patch and maybe your
idea will be simpler overall.

> By the way, this issue could be probably solved by integrating generic
> clocks with regmap API, since regmap-mmio can automatically control a
> clock.

Indeed but this looks like much bigger task.

Anyway thanks for feedback. I'll prepare another version.

Best regards,
Krzysztof
