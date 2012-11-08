From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: dts: exynos4: Add support for Exynos4x12 SoCs
Date: Thu, 08 Nov 2012 13:52:40 +0900
Message-ID: <0cee01cdbd6c$e1852750$a48f75f0$%kim@samsung.com>
References: <1351089359-7318-1-git-send-email-t.figa@samsung.com>
 <0c4501cdbc8f$5336add0$f9a40970$%kim@samsung.com> <3301517.VQVR99BHPc@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:53473 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753467Ab2KHEwl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 7 Nov 2012 23:52:41 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MD5006S1K7RQVN0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 08 Nov 2012 13:52:40 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.199])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MD500BNWK7RCR30@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 08 Nov 2012 13:52:40 +0900 (KST)
In-reply-to: <3301517.VQVR99BHPc@amdc1227>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tomasz Figa' <t.figa@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kyungmin.park@samsung.com, m.szyprowski@samsung.com, tomasz.figa@gmail.com, thomas.abraham@linaro.org

Tomasz Figa wrote:
> >
> > [...]
> >
> > > +/include/ "exynos4x12-pinctrl.dtsi"
> >
> > BTW, I think, above line should be added when exynos4x12-pinctrl patches
> > applied.
> 
> Yes, you are right. Seems like a rebase error on my side. Can you fix it
> or should I send a fixed version?
> 
I did, thanks ;-)

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
