From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 4/5] ARM: EXYNOS: Add support for Exynos secure firmware
Date: Wed, 19 Sep 2012 12:10:35 +0200
Message-ID: <3910462.8Opr7bJoeX@amdc1227>
References: <1347524018-19301-1-git-send-email-t.figa@samsung.com>
 <1347524018-19301-5-git-send-email-t.figa@samsung.com>
 <20120916004455.GD7028@quad.lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:13945 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756081Ab2ISKKn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 19 Sep 2012 06:10:43 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MAL0036TDJLT2M0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 19 Sep 2012 19:10:41 +0900 (KST)
Received: from amdc1227.localnet ([106.116.147.199])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MAL00JBLDLRQ950@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 19 Sep 2012 19:10:41 +0900 (KST)
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

The problem with SYSRAM_NS is that it might be also used in other code, not 
related to firmware only. I don't know exactly all the use cases for it.

Is it really a big problem or we could let it be for now, merge the patches 
for firmware and then convert SYSRAM_NS to dynamic mapping when its 
situation clarifies?

Best regards,
-- 
Tomasz Figa
Samsung Poland R&D Center
