From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Cleanup Samsung stuff
Date: Tue, 19 Apr 2011 10:46:47 +0900
Message-ID: <012801cbfe33$a76fa490$f64eedb0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:27344 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753010Ab1DSBqy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 18 Apr 2011 21:46:54 -0400
Received: from epmmp1 (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LJV004QWMA3OFC0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 19 Apr 2011 10:46:51 +0900 (KST)
Received: from DOKGENEKIM02 ([12.23.103.104])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LJV00FH8MA30X@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 19 Apr 2011 10:46:51 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'LAK' <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc@vger.kernel.org
Cc: 'Ben Dooks' <ben-linux@fluff.org>, 'Russell King' <rmk+kernel@arm.linux.org.uk>

Hi all,

I think, you know about current situation of Linux ARM world.

So...

As Russell suggested, I also will focus on consolidations and bug fixes for
Samsung stuff for a while so don't complain about missing new stuff. In my
opinion, we can keep going it later...

As a note, I'm doing(or preparing) following at the moment.

- Removing some "mach-s5pxxxx"s
- Removing useless header files in include/{mach,plat} of Samsung
- Samsung GPIO stuff cleanup/consolidation
- Samsung DMA stuff consolidation?
- Device tree (with Linaro)
- and so on...

If required anything else, please let me know.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
