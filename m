From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 6/7] ARM: EXYNOS4: Add save/restore for more ARM	registers
Date: Thu, 23 Jun 2011 15:39:02 +0900
Message-ID: <015801cc3170$42695800$c73c0800$%kim@samsung.com>
References: <1308732405-16664-1-git-send-email-kgene.kim@samsung.com>
 <1308732405-16664-7-git-send-email-kgene.kim@samsung.com>
 <20110622145452.GR23234@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:30219 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755672Ab1FWGjM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 23 Jun 2011 02:39:12 -0400
Received: from epcpsbgm1.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LN800700D4FL4K0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 23 Jun 2011 15:39:11 +0900 (KST)
Received: from kgenekim ([12.23.119.139])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LN800GTJD5AM7@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 23 Jun 2011 15:39:10 +0900 (KST)
In-reply-to: <20110622145452.GR23234@n2100.arm.linux.org.uk>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Russell King - ARM Linux' <linux@arm.linux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Jaecheol Lee' <jc.lee@samsung.com>, ben-linux@fluff.org

Russell King - ARM Linux wrote:
> 
> On Wed, Jun 22, 2011 at 05:46:44PM +0900, Kukjin Kim wrote:
> > From: Jaecheol Lee <jc.lee@samsung.com>
> >
> > This patch adds save/restore for Power Control Register and
> > Diagnostic Register.
> 
> NAK.  Please see my further suspend consolidation patches posted earlier.
> I've also recently (last few days) moved these further forward and this
> code no longer exists in this file (all it contains is the early
> resume stuff.)
> 
Oops :(
OK, will re-work based on latest rmk/for-next :)

> My guess is that these two registers are samsung specific, and so they
> should be saved and restored by higher level code (eg, a syscore_ops
> for exynos4 specific stuff.)

Let me think again.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
