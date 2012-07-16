From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 2/2] spi/s3c64xx: Expand S3C64XX_SPI_{DE,}ACT macros at
 call sites
Date: Tue, 17 Jul 2012 08:52:20 +0900
Message-ID: <144001cd63ae$0a31af20$1e950d60$%kim@samsung.com>
References: <1340889811-7524-1-git-send-email-broonie@opensource.wolfsonmicro.com>
 <1340889811-7524-2-git-send-email-broonie@opensource.wolfsonmicro.com>
 <CACRpkdaC3mXcgTib3JWOjuvaWU_NEcg1JCV-4QNS4EcAAZzCJQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:27376 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751802Ab2GPXwW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 16 Jul 2012 19:52:22 -0400
Received: from epcpsbgm1.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M7A00CAD2ASL4A0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 17 Jul 2012 08:52:20 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M7A00C2Y2B8PO00@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 17 Jul 2012 08:52:20 +0900 (KST)
In-reply-to: <CACRpkdaC3mXcgTib3JWOjuvaWU_NEcg1JCV-4QNS4EcAAZzCJQ@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Linus Walleij' <linus.walleij@linaro.org>, 'Mark Brown' <broonie@opensource.wolfsonmicro.com>
Cc: 'Grant Likely' <grant.likely@secretlab.ca>, linux-samsung-soc@vger.kernel.org, spi-devel-general@lists.sourceforge.net

Linus Walleij wrote:
> 
> On Thu, Jun 28, 2012 at 3:23 PM, Mark Brown
> <broonie@opensource.wolfsonmicro.com> wrote:
> 
> > They have very few users and they're both just doing a single register
> > write so the advantage of having the macro is a bit limited. An inline
> > function might make sense but it's as easy to just do the writes
> directly.
> >
> > Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
> 
> Much clearer.
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> 
Yeah, I agree, looks good to me.

But I think, nobody takes this series...?

So may I take then send this series via samsung tree? Because for samsung
spi dt, the file has been touched in samsung tree so it helps to avoid bad
conflicts.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
