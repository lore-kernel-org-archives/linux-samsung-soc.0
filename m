From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: RE: [PATCH 0/7] ARM: SAMSUNG: Cleanup SPI platform specific code
Date: Thu, 30 Jun 2011 11:25:34 +0200
Message-ID: <005701cc3707$aa914e50$ffb3eaf0$%szyprowski@samsung.com>
References: <1309436723-662-1-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:33723 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754954Ab1F3JZm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 30 Jun 2011 05:25:42 -0400
Received: from spt2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
 by mailout2.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0LNL00D4VJITMW@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 30 Jun 2011 10:25:41 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LNL00FITJIR6E@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 30 Jun 2011 10:25:39 +0100 (BST)
In-reply-to: <1309436723-662-1-git-send-email-padma.v@samsung.com>
Content-language: pl
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Padmavathi Venna' <padma.v@samsung.com>, kgene.kim@samsung.com, jassisinghbrar@gmail.com, sbkim73@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Hello,

On Thursday, June 30, 2011 2:25 PM Padmavathi Venna wrote:

> This patchset does the following:
> 
> 1. Move duplicated code to common place
> [PATCH 1/7] ARM: SAMSUNG: Move SPI device definitions to plat-samsung
> SPI platform devices are defined in respective machine folder of
> Samsung S3C64XX and S5P series SoCs.This is duplicated for every SoC.
> So all SPI platform devices are moved to a common place.
> 
> [PATCH 2/7] ARM: SAMSUNG: Define common macro for SPI physical address
> 
> [PATCH 3/7] ARM: SAMSUNG: Add SPI clock definitions for SAMSUNG SoCs
> Each SoC has it's own set of clock sources for SPI.So they are defined in
> respective machine folder.
> 
> [PATCH 4/7] ARM: SAMSUNG: Create SPI device setup files in
> respective machine folder
> 
> [PATCH 5/7] ARM: SAMSUNG: Add SPI platform specific code
> As SPI platform devices are moved to common place some platform specific
> code need to be initialized in the respective machine file.
> 
> [PATCH 6/7] SPI: S5PC100: Enable the SPI driver for S5PC100
> 
> [PATCH 7/7] SPI: S5PV210: Enable the SPI driver for S5PV210

These patch set improves a bit platform part of SPI driver, but I really
wonder if we really need to pass so many SoC version specific data 
with platform data. Are all these data (clock list, fifo parameters)
specific to SoC version or particular board configuration/implementation?

Maybe it will be much easier to convert the SPI driver to use driver id 
feature and use different platform id's for each SoC version? (please 
refer to drivers/video/s3c-fb.c and plat-samsung/include/plat/fb-core.h
for more information). This will remove the need for SoC specific
parameters in platform data and will group all version dependent 
information in the driver.

Best regards
-- 
Marek Szyprowski
Samsung Poland R&D Center
