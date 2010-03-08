From: Ben Dooks <ben-linux@fluff.org>
Subject: Re: [PATCH v2] Fix GPIOs bank H and J not being preserved during
	suspend
Date: Mon, 8 Mar 2010 16:16:05 +0000
Message-ID: <20100308161604.GF24864@trinity.fluff.org>
References: <cabda6421003080317t37124990v72ac56906719c091@mail.gmail.com> <1268047288-11166-1-git-send-email-chripell@fsfe.org> <20100308155522.GE24864@trinity.fluff.org> <cabda6421003080814j2e17b664x1806a418928e09d4@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:32904 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755437Ab0CHQQH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 8 Mar 2010 11:16:07 -0500
Content-Disposition: inline
In-Reply-To: <cabda6421003080814j2e17b664x1806a418928e09d4@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: christian pellegrin <chripell@fsfe.org>
Cc: Ben Dooks <ben-linux@fluff.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On Mon, Mar 08, 2010 at 05:14:05PM +0100, christian pellegrin wrote:
> On Mon, Mar 8, 2010 at 4:55 PM, Ben Dooks <ben-linux@fluff.org> wrote:
> >
> > Still not getting why you're changing this from x, to x - 1.
> >
> 
> ok: the reason is that gpio_nr is already incremented by one in the
> for instruction. So gpio_nr is not pointing to the first pin of a bank
> after the first iteration. Of course this doesn't matter because we
> don't have 32 banks of gpio pins and s3c_gpiolib_getchip works even if
> we point to a pin in the middle of a bank. But if we get a s3c device
> with more than 32 banks the 33rd will be skipped. Or at least this is
> the reason why I did this, maybe I'm mistaken.
> 
> Anyway this is a minor point, I fixed it when catching why bank H was
> not preserved (and so my serial console ttyS1 was dead).

Can we have that as a seperate patch with that information in it, to show
what is being changed. Thanks.

-- 
Ben

Q:      What's a light-year?
A:      One-third less calories than a regular year.
