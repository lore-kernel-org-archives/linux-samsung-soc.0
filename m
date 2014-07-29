From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] exynos: Support big endian mode in secondary_startup
Date: Wed, 30 Jul 2014 08:31:28 +0900
Message-ID: <012101cfab85$3a837ed0$af8a7c70$@samsung.com>
References: <1405958507-8606-1-git-send-email-broonie@kernel.org>
 <073c01cfa7c3$39ec6a10$adc53e30$@samsung.com>
 <20140725101643.GN17528@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:31431 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754407AbaG2Xbe (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 29 Jul 2014 19:31:34 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N9H00EKZYOKH8A0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 30 Jul 2014 08:31:32 +0900 (KST)
In-reply-to: <20140725101643.GN17528@sirena.org.uk>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Mark Brown' <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Victor Kamensky' <victor.kamensky@linaro.org>

Mark Brown wrote:
> 
> On Fri, Jul 25, 2014 at 01:45:14PM +0900, Kukjin Kim wrote:
> 
> > Basically, I have no objection on this, BTW is there any requirement to support
> > big endian on exynos stuff? Just wondering...
> 
> We've been using it for testing within Linaro.  I don't know of any real
> world users.

Mark, OK I see. I will apply.

Thanks,
Kukjin
