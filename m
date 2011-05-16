From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: RE: [PATCH 0/7] ARM: Removing ARCH_S5PC100
Date: Mon, 16 May 2011 18:48:38 +0200
Message-ID: <000901cc13e9$1a9a2880$4fce7980$%szyprowski@samsung.com>
References: <1305162674-25860-1-git-send-email-kgene.kim@samsung.com>
 <201105131555.42860.anarsoul@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:45316 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750876Ab1EPQsn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 16 May 2011 12:48:43 -0400
Received: from eu_spt1 ([210.118.77.14]) by mailout4.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0LLA00DGJS16LSA0@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 16 May 2011 17:48:42 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LLA00KJ4S15R1@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 16 May 2011 17:48:41 +0100 (BST)
In-reply-to: <201105131555.42860.anarsoul@gmail.com>
Content-language: pl
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Vasily Khoruzhick' <anarsoul@gmail.com>, linux-arm-kernel@lists.infradead.org
Cc: 'Kukjin Kim' <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, 'Kyungmin Park' <kyungmin.park@samsung.com>

Hello,

On Friday, May 13, 2011 2:56 PM Vasily Khoruzhick wrote:

> On Thursday 12 May 2011 04:11:07 Kukjin Kim wrote:
> > This patch remvoes mach-s5pc100 directory for ARCH_S5PC100 in arch/arm.
> 
> Hm, what's the point of removing this code?

May I also ask the same? What's the point in removing WORKING support for
the whole SoC series? There are some S5PC100 based boards available on the
market and they are still being used for embedded Linux development.

The issues with ARM kernel tree is not about the number of supported
SoCs/sub-platform but the fact that a lots of code is somehow duplicated
between different arm sub-architecture. The goal is to identify such code
and unify it. There have been a lot of discussion about this on Linaro
Meeting in Budapest. For more information please take a look at etherpad
notes available here:

http://summit.ubuntu.com/uds-o/track/linaro-kernel/

(etherpad links for each session are available via 'notepad' image near
the session title).

I recommend to read all the notes from all five 'Arm Linus Interface'
sessions. 

Best regards
-- 
Marek Szyprowski
Samsung Poland R&D Center
