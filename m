From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: Chromebook snow issues
Date: Tue, 29 Sep 2015 17:35:50 +0200
Message-ID: <560AAFD6.4020400@samsung.com>
References: <20150929094358.584e862c@recife.lan> <560A942F.2030206@samsung.com>
 <20150929110140.24724c04@recife.lan> <560AA11A.6000904@samsung.com>
 <20150929114256.40994f49@recife.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:57776 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934005AbbI2Pgo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 29 Sep 2015 11:36:44 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NVG00LRH3D6R110@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 29 Sep 2015 16:36:42 +0100 (BST)
In-reply-to: <20150929114256.40994f49@recife.lan>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab@osg.samsung.com>
Cc: Javier Martinez Canillas <javier@osg.samsung.com>, Kamil Debski <k.debski@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

On 29/09/15 16:42, Mauro Carvalho Chehab wrote:
> Em Tue, 29 Sep 2015 16:32:58 +0200
> Sylwester Nawrocki <s.nawrocki@samsung.com> escreveu:
> 
>> > Adding linux-samsung-soc mailing list at Cc.
> 
> Never mind. My mistake: I forgot to reinstall the modules (mwifiex and mfc
> drivers were compiled as such).
> 
> It is working.
> 
> I guess the only remaining thing is to add the dependency of EXYNOS_IOMMU
> to the MFC driver.

Sounds good. The patches I pointed out are only a workaround, in general
MFC should also work without IOMMU. As the driver handles also SoCs without
a SYSMMU hardware support adding such a Kconfig entry would not be correct.

-- 
Regards,
Sylwester
