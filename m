From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 00/13] ARM: S5P64X0: Add new S5P6450 Support
Date: Thu, 02 Sep 2010 19:21:10 +0900
Message-ID: <005201cb4a88$93214570$b963d050$%kim@samsung.com>
References: <1283324960-21629-1-git-send-email-kgene.kim@samsung.com>
 <20100901114518.GA20737@trinity.fluff.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:17461 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752790Ab0IBKVA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 2 Sep 2010 06:21:00 -0400
Received: from epmmp1 (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L84000JX7EY8900@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 02 Sep 2010 19:20:58 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L84002QM7EYTS@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 02 Sep 2010 19:20:58 +0900 (KST)
In-reply-to: <20100901114518.GA20737@trinity.fluff.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Ben Dooks' <ben-linux@fluff.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Ben Dooks wrote:
> 
Hi ;-)

> On Wed, Sep 01, 2010 at 04:09:07PM +0900, Kukjin Kim wrote:
> > This patches add basic support for Samsung S5P6450 SoC.
> >
> > Basically this patch moves mach-s5p6440 (ARCH_S5P6440) to mach-s5p64x0
> > (ARCH_S5P64X0) to support Samsung's new S5P6450 SoC. The
> ARCH_S5P64X0
> > can support S5P6440 and S5P6450 with one kernel image. It is tested on
> > SMDK6440(S5P6440) and SMDK6450(S5P6450) with s5p64x0_defconfig. And
> > this patch changes s5p6440_defconfig to s5p64x0_defconfig for S5P64X0.
> 
> What about the s5p6442?
> 
S5P6440 and S5P6450 are each other similar, but S5P6442 differs much with
it.
,,,so remains some issues for it now.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
