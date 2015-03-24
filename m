From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [PATCH] ARM: S3C64XX: Use fixed IRQ bases to avoid conflicts on
 Cragganmore
Date: Tue, 24 Mar 2015 22:03:20 +0900
Message-ID: <02e801d06632$e75527e0$b5ff77a0$@kernel.org>
References: <1427020841-24189-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <20150322160316.GB6643@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:52026 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752300AbbCXNDa (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 24 Mar 2015 09:03:30 -0400
In-reply-to: <20150322160316.GB6643@sirena.org.uk>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Mark Brown' <broonie@kernel.org>, 'Charles Keepax' <ckeepax@opensource.wolfsonmicro.com>
Cc: kgene@kernel.org, linux@arm.linux.org.uk, arnd@arndb.de, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com

Mark Brown wrote:
> 
> On Sun, Mar 22, 2015 at 10:40:41AM +0000, Charles Keepax wrote:
> > There are two PMICs on Cragganmore, currently one dynamically assign
> > its IRQ base and the other uses a fixed base. It is possible for the
> > statically assigned PMIC to fail if its IRQ is taken by the dynamically
> > assigned one. Fix this by statically assigning both the IRQ bases.
> >
> > Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
> 
> Reviwed-by: Mark Brown <broonie@kernel.org>
> 
Thanks for your review.

> This probably wants to go to stable as well.

OK, I'll.

Thanks,
Kukjin
