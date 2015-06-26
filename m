From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: clk: samsung: add infrastructure to register cpu clocks
Date: Fri, 26 Jun 2015 13:47:32 +0300
Message-ID: <20150626104732.GO30834@mwanda>
References: <20150626095444.GA30810@mwanda>
 <CAJKOXPfyw=1kh4DkC3j7FCXcERecBWgGVcN6bYvrBZQVjeo=Bg@mail.gmail.com>
 <2521313.Iak1gZLfIu@amdc1976>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from aserp1040.oracle.com ([141.146.126.69]:51642 "EHLO
	aserp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751585AbbFZKrr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 26 Jun 2015 06:47:47 -0400
Content-Disposition: inline
In-Reply-To: <2521313.Iak1gZLfIu@amdc1976>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, thomas.ab@samsung.com, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org

On Fri, Jun 26, 2015 at 12:20:35PM +0200, Bartlomiej Zolnierkiewicz wrote:
> 
> Hi,
> 
> On Friday, June 26, 2015 07:03:25 PM Krzysztof Kozlowski wrote:
> > 2015-06-26 18:54 GMT+09:00 Dan Carpenter <dan.carpenter@oracle.com>:
> > > Hello Thomas Abraham,
> > >
> > > The patch ddeac8d968d4: "clk: samsung: add infrastructure to register
> > > cpu clocks" from Apr 3, 2015, leads to the following static checker
> > > warning:
> > >
> > >         drivers/clk/samsung/clk-cpu.c:164 exynos_cpuclk_pre_rate_change()
> > >         warn: test_bit() takes a bit number
> > >
> > > drivers/clk/samsung/clk-cpu.c
> > >    158          /*
> > >    159           * For the selected PLL clock frequency, get the pre-defined divider
> > >    160           * values. If the clock for sclk_hpm is not sourced from apll, then
> > >    161           * the values for DIV_COPY and DIV_HPM dividers need not be set.
> > >    162           */
> > >    163          div0 = cfg_data->div0;
> > >    164          if (test_bit(CLK_CPU_HAS_DIV1, &cpuclk->flags)) {
> > >                              ^^^^^^^^^^^^^^^^
> > > CLK_CPU_HAS_DIV1 is (1 << 0).  We sometimes used it correctly as a mask
> > > and sometimes incorrectly (like here) as a bit number.
> 
> Fortunately the current value of this flag is "1" so test_bit() still
> works correctly.  I'll fix it up later anyway.  Thanks for catching it.

I don't think it works, although I may have misread.  We set BIT(0) in
exynos4_clk_init() but we test BIT(1) here.

regards,
dan carpenter
