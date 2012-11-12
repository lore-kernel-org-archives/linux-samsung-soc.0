From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH v3 4/6] ARM: EXYNOS: Add support for Exynos secure	firmware
Date: Mon, 12 Nov 2012 11:09:59 +0100
Message-ID: <1632996.MFS2BfkxD2@amdc1227>
References: <1351178560-19188-1-git-send-email-t.figa@samsung.com>
 <1351178560-19188-5-git-send-email-t.figa@samsung.com>
 <20121112095114.GD28327@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:35651 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750929Ab2KLKKe (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 12 Nov 2012 05:10:34 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MDD009L7DKTJ2X0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 12 Nov 2012 19:10:05 +0900 (KST)
Received: from amdc1227.localnet ([106.116.147.199])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MDD002O1DKRTM60@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 12 Nov 2012 19:10:05 +0900 (KST)
In-reply-to: <20121112095114.GD28327@n2100.arm.linux.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kyungmin.park@samsung.com, kgene.kim@samsung.com, arnd@arndb.de, olof@lixom.net, m.szyprowski@samsung.com, tomasz.figa@gmail.com

Hi Russel,

On Monday 12 of November 2012 09:51:14 Russell King - ARM Linux wrote:
> > +
> > +static int exynos_cpu_boot(int cpu)
> > +{
> > +	exynos_smc(SMC_CMD_CPU1BOOT, cpu, 0, 0);
> > +	return 0;
> > +}
> 
> Same for this (though, what _exactly_ is 'cpu', is it the physical CPU
> number or the logical CPU number?)

Yes, it's the physical CPU number.

> > +
> > +static int exynos_cpu_boot_reg(int cpu, void __iomem **ptr)
> > +{
> > +	*ptr = S5P_VA_SYSRAM_NS + 0x1c + 4*cpu;
> > +	return 0;
> > +}
> 
> This is really bad.  What's it trying to do?  What is the significance
> of the 'ptr' returned?  What if a platform doesn't have a boot register?

It returns a pointer to the area where boot code (secondary startup) 
address must be stored.

This callback (just as all the firmware callbacks) is optional, if it is 
not appropriate for given platform, it will not use it.

However, now when I think of it, it may be better to just add a callback 
like set_boot_addr(cpu, addr), which would set boot address of given CPU 
without exporting address of its boot register outside firmware code. Are 
you OK with this kind of approach?


Best regards,
-- 
Tomasz Figa
Samsung Poland R&D Center
SW Solution Development, Linux Platform
