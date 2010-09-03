From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: SAMSUNG: Removed redunt zreladdr in Makefile.boot
Date: Sat, 04 Sep 2010 06:36:40 +0900
Message-ID: <01dd01cb4bb0$1c124dc0$5436e940$%kim@samsung.com>
References: <1283470043-16050-1-git-send-email-kgene.kim@samsung.com>
 <20100903074247.GG26319@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:23586 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757535Ab0ICVgb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 3 Sep 2010 17:36:31 -0400
Received: from epmmp2 (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L860051UXCTGJ30@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 04 Sep 2010 06:36:29 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L86004J3XCTG6@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 04 Sep 2010 06:36:29 +0900 (KST)
In-reply-to: <20100903074247.GG26319@n2100.arm.linux.org.uk>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Russell King - ARM Linux' <linux@arm.linux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

Russell King wrote:
> 
Hi ;-)

> On Fri, Sep 03, 2010 at 08:27:23AM +0900, Kukjin Kim wrote:
> > Because can be calculated ZREADDR now, removed redunt zreladdr
> > definitions in each Makefile.boot of Samsung architectures.
> 
> I'd suggest holding off on this.  CONFIG_ZRELADDR has a few problems
> at the moment that need fixing - and if there's no movement to fix
> them, it'll be reverted.

Ok...And I will check its progress in the mailing list.

Have a nice weekend.
Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
