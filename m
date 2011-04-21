From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: Cleanup Samsung stuff
Date: Thu, 21 Apr 2011 19:57:17 +0900
Message-ID: <031601cc0012$e58769d0$b0963d70$%kim@samsung.com>
References: <012801cbfe33$a76fa490$f64eedb0$%kim@samsung.com>
 <9fibsi$eg5ubh@out1.ip07ir2.opaltelecom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:61107 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750939Ab1DUK51 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 21 Apr 2011 06:57:27 -0400
Received: from epcpsbgm1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LK000HEP13EUZ30@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 21 Apr 2011 19:57:25 +0900 (KST)
Received: from DOKGENEKIM02 ([12.23.103.104])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LK0007DY13N2R@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 21 Apr 2011 19:57:25 +0900 (KST)
In-reply-to: <9fibsi$eg5ubh@out1.ip07ir2.opaltelecom.net>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Nick Pelling' <nickpelling@nanodome.com>, 'LAK' <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc@vger.kernel.org

Nick Pelling wrote:
> 
> Hi Kgene,
> 
Hi :)

> At 10:46 19/04/2011 +0900, Kukjin Kim wrote:
> >As a note, I'm doing(or preparing) following at the moment.
> >- Removing some "mach-s5pxxxx"s
> 
> Are you planning to remove mach-s5pc100? If yes, is this with the
> intention of reducing arch/arm code size (by merging, say, with the
> s5pc110 tree), or because of some upcoming Samsung EOL event? :-(
> 
Hmm...There is no decisions about that yet. Just I'm thinking and checking
the status of each ARCH(mach-xxxx).
Of course, if any updates, will inform here.

> (I'm building security cameras based on the s5pc100, working with
> mach-s5pc100 issues every day).
> 
Only for S5PC100?

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
