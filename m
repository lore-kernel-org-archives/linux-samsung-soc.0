From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 2/2] ARM: S3C64XX: Hook up carrier class modules on
 Cragganmore
Date: Wed, 16 May 2012 15:21:52 +0900
Message-ID: <093301cd332c$2ed6d060$8c847120$%kim@samsung.com>
References: <1337016041-16096-1-git-send-email-broonie@opensource.wolfsonmicro.com>
 <1337016041-16096-2-git-send-email-broonie@opensource.wolfsonmicro.com>
 <07fc01cd3278$dbbf63f0$933e2bd0$%kim@samsung.com>
 <20120515173706.GD4140@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:32625 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757467Ab2EPGVt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 16 May 2012 02:21:49 -0400
Received: from epcpsbgm2.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M4300FRHQYVC5P0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 16 May 2012 15:21:48 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M43007KKR0CHR52@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 16 May 2012 15:21:48 +0900 (KST)
In-reply-to: <20120515173706.GD4140@opensource.wolfsonmicro.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Mark Brown' <broonie@opensource.wolfsonmicro.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, patches@opensource.wolfsonmicro.com

Mark Brown wrote:
> 
> On Tue, May 15, 2012 at 05:58:12PM +0900, Kukjin Kim wrote:
> 
> > Looks good to me, but there is no '{ I2C_BOARD_INFO("wlf-gf-module",
> 0x20) },' in my tree.
> 
> > Just adding address 0x22 stuff is enough now?
> 
> Yes, it is - sorry, context diff for another project.

OK, no problem.

Applied and thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
