From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v2] ARM: S3C64XX: Fix up IRQ mapping for balblair on
 Cragganmore
Date: Tue, 06 Nov 2012 19:52:06 +0900
Message-ID: <0be501cdbc0c$c3a4a870$4aedf950$%kim@samsung.com>
References: <1351861454-20032-1-git-send-email-dp@opensource.wolfsonmicro.com>
 <20121102142238.GX4413@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:53556 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751317Ab2KFKwO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 6 Nov 2012 05:52:14 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MD200NIPBIU4010@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 06 Nov 2012 19:52:07 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.199])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MD20084ABIUHHA0@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 06 Nov 2012 19:52:07 +0900 (KST)
In-reply-to: <20121102142238.GX4413@opensource.wolfsonmicro.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Mark Brown' <broonie@opensource.wolfsonmicro.com>, 'Dimitris Papastamos' <dp@opensource.wolfsonmicro.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, patches@opensource.wolfsonmicro.com

Mark Brown wrote:
> 
> On Fri, Nov 02, 2012 at 01:04:14PM +0000, Dimitris Papastamos wrote:
> > We are using S3C_EINT(4) instead of S3C_EINT(5).
> 
> Reviwed-by: Mark Brown <broonie@opensource.wolfsonmicro.com>

Reviewed-by?

Applied with fixing typo :-)

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
