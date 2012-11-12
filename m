From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH v3 0/6] ARM: EXYNOS: Add secure firmware support
Date: Mon, 12 Nov 2012 11:14:41 +0100
Message-ID: <3879194.hz9mrTmL6z@amdc1227>
References: <1351178560-19188-1-git-send-email-t.figa@samsung.com>
 <006501cdc0a8$d880c990$89825cb0$%kim@samsung.com>
 <20121112095530.GF28327@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:36194 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750888Ab2KLKRt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 12 Nov 2012 05:17:49 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MDD00CA1DSFKWX0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 12 Nov 2012 19:14:46 +0900 (KST)
Received: from amdc1227.localnet ([106.116.147.199])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MDD004HTDSK1Y00@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 12 Nov 2012 19:14:46 +0900 (KST)
In-reply-to: <20121112095530.GF28327@n2100.arm.linux.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kyungmin.park@samsung.com, arnd@arndb.de, olof@lixom.net, m.szyprowski@samsung.com, tomasz.figa@gmail.com

On Monday 12 of November 2012 09:55:30 Russell King - ARM Linux wrote:
> On Mon, Nov 12, 2012 at 04:39:28PM +0900, Kukjin Kim wrote:
> > (+ Russell King)
> 
> I think there's still an amount of work to do here; it's not a generic
> interface at the moment because it makes some assumptions about how
> things are done (eg, it assumes that there _will_ be a CPU boot
> register; that is not always true.
> 
> Moreover, the 'cpu' arguments given seem to be uncertain whether they're
> logical CPU numbers or physical CPU numbers.
> 
> Lastly, where is this interface actually documented?  It's just a bunch
> of code _without_ _any_ documentation.  That means people will interpret
> it differently, and it'll get used differently from platform to
> platform.
> 
> Let's have some documentation on this.

Right, I will include documentation in next version of this patchset.

Best regards,
-- 
Tomasz Figa
Samsung Poland R&D Center
SW Solution Development, Linux Platform
