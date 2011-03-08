From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: RE: [PATCH 0/2] ARM: EXYNOS4: Enhancement of System MMU
Date: Tue, 08 Mar 2011 15:16:11 +0100
Message-ID: <000701cbdd9b$634c3840$29e4a8c0$%szyprowski@samsung.com>
References: <1299460768-4077-1-git-send-email-pullip.cho@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ks_c_5601-1987
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:19974 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754370Ab1CHOQ1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 8 Mar 2011 09:16:27 -0500
Received: from epmmp1 (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LHQ000EASZBY930@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 08 Mar 2011 23:16:23 +0900 (KST)
Received: from AMDC159 ([106.116.37.153])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LHQ00G67SZ0LA@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 08 Mar 2011 23:16:23 +0900 (KST)
In-reply-to: <1299460768-4077-1-git-send-email-pullip.cho@samsung.com>
Content-language: pl
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'KyongHo Cho' <pullip.cho@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, kgene.kim@samsung.com, =?ks_c_5601-1987?B?J7TrwM6x4ic=?= <inki.dae@samsung.com>, =?ks_c_5601-1987?B?J7Ctuc6x1Cc=?= <mk7.kang@samsung.com>, Andrzej Pietrasiewicz <andrzej.p@samsung.com>

Hello,

On Monday, March 07, 2011 2:19 AM KyongHo Cho wrote:

> This patch includes the following enhancements for System MMU:
> - Enhanced readability
> - Removal of unused data structures or their members
> - Simplified function definitions
> - Corrections of some logical errors
> - Full compliance with Linux coding style
> - Simpler way of registering callback functions of System MMU faults
> - Add clock gating for System MMU

Thanks for updating the driver, I have however some comments.

EXYNOS4 platform has total of 16 sysmmu blocks. Each of them is exactly the
same - each has a register region, an interrupt and clock. However your driver
uses a single platform device for all 16 units and a large resource array (see
arch/arm/mach-exynos4). This approach also complicates the clock management 
(you need to create custom names for sysmmu clocks, this will cause a lot of
problems in the future update to clkdev!). This also heavily complicates the
driver (you need the arrays of all the resources all over the driver) and is
against the Linux driver model. In the proper model one should create a
platform driver for a single module and instantiate it many times for each hw
module found in the system. For a reference please take a look at the sysmmu
Andrzej has developed in parallel to You: 
http://www.mail-archive.com/linux-media@vger.kernel.org/msg28871.html

For a reference please also check the Samsung Power Domains driver 
(arch/arm/mach-exynos4/dev-pd.c and arch/arm/plat-s5p/pd.c).

The second problem I've noticed is the s5p_sysmmu_set_tablebase_pgd() call. 
In my opinion it simplifies the sysmmu api too much. This function assumes
that the sysmmu client (i.e. a multimedia device driver or videobuf2-allocator
or vcmm) has a knowledge about the pgd/pte descriptors format. As you know the
format of pgd/pte descriptors is hardware dependent (it may even change in the
future version of SoCs), so constructing the pgd and pte tables is a low-level
operation that should be performed by sysmmu driver. Keeping this call in the
current form results in a requirement that each sysmmu client MUST know the
hardware details of the sysmmu module. In my opinion SysMMU client should only
manage the virtual space and have the ability to add or remove a mapping for
particular range of pages/memory on particular sysmmu chip. 

Best regards
--
Marek Szyprowski
Samsung Poland R&D Center
