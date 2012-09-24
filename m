From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 4/5] ARM: EXYNOS: Add support for Exynos secure firmware
Date: Mon, 24 Sep 2012 16:39:11 +0200
Message-ID: <1503070.mCpo7P41ro@amdc1227>
References: <1347524018-19301-1-git-send-email-t.figa@samsung.com>
 <1347524018-19301-5-git-send-email-t.figa@samsung.com>
 <20120916004455.GD7028@quad.lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:18591 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755956Ab2IXOjU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 24 Sep 2012 10:39:20 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MAU003DMZDJ1720@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 24 Sep 2012 23:39:19 +0900 (KST)
Received: from amdc1227.localnet ([106.116.147.199])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MAU00HYFZDH9530@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 24 Sep 2012 23:39:19 +0900 (KST)
In-reply-to: <20120916004455.GD7028@quad.lixom.net>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kyungmin.park@samsung.com, kgene.kim@samsung.com, linux@arm.linux.org.uk, arnd@arndb.de

Hi Olof,

On Saturday 15 of September 2012 17:44:55 Olof Johansson wrote:
> On Thu, Sep 13, 2012 at 10:13:37AM +0200, Tomasz Figa wrote:
> > +static void __iomem *exynos_cpu_boot_reg(int cpu)
> > +{
> > +	return S5P_VA_SYSRAM_NS + 0x1c + 4*cpu;
> > +}
> 
> This communication area in sysram should probably be seen as a part of
> the firmware interface. It should thus be defined as part of the binding
> instead, i.e.  through a reg property or similar there. That also would
> make it easy to convert to using ioremap() instead of iodesc tables,
> which always a nice thing.

I have tried to get around the need of statical mapping for SYSRAM, but the 
firmware has to be initialized very early, before low level L2x0 cache 
initialization (which is an early initcall, so it has to be in init_early 
machine callback) and at that time ioremap is not available yet.

I think we should just allow this additional static mapping, I don't see 
any sane way of mapping it dynamically, at least at the moment.

Best regards,
-- 
Tomasz Figa
Samsung Poland R&D Center
