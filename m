From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH RESEND 1/4] clk: clk-s2mps11: Refactor for including
 support for  other MFD clocks
Date: Wed, 29 Jan 2014 11:29:04 +0100
Message-ID: <1390991344.2207.8.camel@AMDC1943>
References: <m8Uox-5kN-11@gated-at.bofh.it> <mtgmt-44E-3@gated-at.bofh.it>
 <mtgmu-44E-27@gated-at.bofh.it> <muwSe-WJ-17@gated-at.bofh.it>
 <muCkW-RP-15@gated-at.bofh.it> <mva3f-bR-7@gated-at.bofh.it>
 <mvd17-4vW-3@gated-at.bofh.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:13335 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750882AbaA2K3J (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 29 Jan 2014 05:29:09 -0500
In-reply-to: <mvd17-4vW-3@gated-at.bofh.it>
References: <m8Uox-5kN-11@gated-at.bofh.it> <mtgmt-44E-3@gated-at.bofh.it>
 <mtgmu-44E-27@gated-at.bofh.it> <muwSe-WJ-17@gated-at.bofh.it>
 <muCkW-RP-15@gated-at.bofh.it> <mva3f-bR-7@gated-at.bofh.it>
 <mvd17-4vW-3@gated-at.bofh.it>
In-reply-to: <mvd17-4vW-3@gated-at.bofh.it>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mike Turquette <mturquette@linaro.org>
Cc: lkml <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Lee Jones <lee.jones@linaro.org>, Kgene Kim <kgene.kim@samsung.com>, Patch Tracking <patches@linaro.org>, Mark Brown <broonie@kernel.org>, Tushar Behera <tushar.behera@linaro.org>

Hi,

> 
> Quoting Mark Brown (2013-12-31 08:09:16)
> > On Mon, Dec 30, 2013 at 09:33:50AM +0530, Tushar Behera wrote:
> > 
> > > Commit 1b1ccee1e821 "mfd: s2mps11: Fix build after regmap field rename
> > > in sec-core.c" is also touching this file, which is in Mark's tree
> > > right now. If I rebase
> > 
> > It's been in Linus' tree for a while now.
> 
> OK, so I merged the two patches into clk-next, then merged clk-next into
> next-20131224 and the merge is super trivial to resolve. So I propose
> that we just let it get resolved in linux-next the usual way.
> 
> Any objections? If not I'll take these two patches into clk-next.

Did you merged these patches into clk-next? Unfortunately I couldn't
find them (clk-next, next).

I am asking because I want to send patches with support for S2MPS14
clock (based on these patches).

Best regards,
Krzysztof
