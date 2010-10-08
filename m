From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 3/10] ARM: S5PC100: Add SCLK_SPDIF clock
Date: Fri, 08 Oct 2010 19:51:27 +0900
Message-ID: <001f01cb66d6$c5c33410$51499c30$%kim@samsung.com>
References: <1286191550-22197-1-git-send-email-sw.youn@samsung.com>
 <1286192545-18327-1-git-send-email-sw.youn@samsung.com>
 <001901cb66d1$32db1e10$98915a30$%kim@samsung.com>
 <AANLkTinZuMkDNotnwDFS8_EPhbG+p_GWEZjU5thzvW++@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:43902 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752787Ab0JHKvN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 8 Oct 2010 06:51:13 -0400
Received: from epmmp2 (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L9Y007QKWTCGV60@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 08 Oct 2010 19:51:12 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L9Y003V8WTC5J@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 08 Oct 2010 19:51:12 +0900 (KST)
In-reply-to: <AANLkTinZuMkDNotnwDFS8_EPhbG+p_GWEZjU5thzvW++@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Seungwhan Youn' <claude.youn@gmail.com>
Cc: 'Seungwhan Youn' <sw.youn@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, ben-linux@fluff.org, lrg@slimlogic.co.uk, broonie@opensource.wolfsonmicro.com, jassi.brar@samsung.com

Seungwhan Youn wrote:
> 
> Hi,
> 
> >> +static int s5pc100_spdif_set_rate(struct clk *clk, unsigned long rate)
> >> +{
> >> +     struct clk *pclk;
> >> +     int ret;
> >> +
> >> +     pclk = clk_get_parent(clk);
> >> +     if (IS_ERR(pclk))
> >> +             return -EINVAL;
> >> +
> >> +     ret = pclk->ops->set_rate(pclk, rate);
> >> +     clk_put(pclk);
> >> +
> >> +     return ret;
> >
> > How about following?
> >
> > static int parent_set_rate(struct clk *clk, unsigned long rate)
> > {
> >        struct clk *p_clk;
> >        int ret;
> >
> >        p_clk = clk_get_parent(clk);
> >        ret = clk_set_rate(p_clk, rate);
> >
> >        clk_put(p_clk);
> >
> >        return ret;
> > }
> >
> > Hmm...isn't there any method?...
> 
> I think you mean is that adds a new clock api function that sets
> parent clock rate.(am I right?) But as you know, this also needs that

If possible?...yes.

> S/PDIF knows it's source clock can not set rate directly and set it's
> parent clock.
> 
Hmm...ok.

> Actually my point was that I want to make S/PDIF does not care about
> clock characteristics, so I did make it solve in clock part, not in
> audio driver. And also, I do not want to modify a common function
> 'clk_set_rate()' that can support jassi's opinion, because I'm not
> sure about side effect that I can not grantee it's safety with other
> drivers.
> 
Oh yes...it's expected recursive lockup or any side effect in this case.

Ok...Firstly will apply this...but we need to sort out this later.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
