From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH] ARM:SAMSUNG: Move S3C DMA driver to drivers/dma
Date: Tue, 7 Jun 2011 23:36:14 +0100
Message-ID: <20110607223614.GC28451@n2100.arm.linux.org.uk>
References: <1307432901-22781-1-git-send-email-alim.akhtar@samsung.com> <BANLkTintADbXSiV07VTMbFfmUV+4-q2-gw@mail.gmail.com> <BANLkTimjWNf3PxHXj3o5qubH5g7gMHjhFg@mail.gmail.com> <20110607081527.GB20929@n2100.arm.linux.org.uk> <BANLkTin66PhYGmVSOJcuZr8wDH_iNgjhZQ@mail.gmail.com> <20110607182923.GA28451@n2100.arm.linux.org.uk> <BANLkTikLFCyzU3UApjjwfX0Vjujo9WAFZA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:43856 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751321Ab1FGWgy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 7 Jun 2011 18:36:54 -0400
Content-Disposition: inline
In-Reply-To: <BANLkTikLFCyzU3UApjjwfX0Vjujo9WAFZA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Kyungmin Park <kmpark@infradead.org>, linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, Jassi Brar <jassi.brar@samsung.com>, root <alim.akhtar@samsung.com>

On Wed, Jun 08, 2011 at 01:16:40AM +0530, Jassi Brar wrote:
> IMHO Samsung SoC team (not his majesty Mr Kyungmin Park) are justified
> if they are not so eager right now. Since I no more would have to spend
> sleepless nights over
> SPDIF underruns, I can side with what Kukjin Kim(Samsung maintainer)
> decides, who has to live with the results.

Well, the question is _when_ will these things happen in the Samsung
world?

I see no effort from the Samsung folk to even start considering moving
to common APIs - I see precisely the opposite.  They seem to have a
strong desire to invent their own new APIs all the time rather than
look at existing APIs and discuss how they can be used or adapted so
they work for Samsung.

That is not sustainable, and if it continues, it will probably result
in Samsung stuff being chucked out of mainline.  We are most definitely
at the point where custom APIs are no longer permissible, especially
for any new SoCs.
