From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 0/3] ARM: Removing ARCH_S5P6442
Date: Wed, 18 May 2011 17:05:12 +0900
Message-ID: <000e01cc1532$51ee1f90$f5ca5eb0$%kim@samsung.com>
References: <1305162489-25499-1-git-send-email-kgene.kim@samsung.com>
 <20110517183518.GB933@localhost.ucw.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:35990 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751573Ab1ERIFR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 18 May 2011 04:05:17 -0400
Received: from epcpsbgm1.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LLD00MDDT4LRNH0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 18 May 2011 17:05:15 +0900 (KST)
Received: from kgenekim ([12.23.119.139])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LLD003FET4R8C@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 18 May 2011 17:05:15 +0900 (KST)
In-reply-to: <20110517183518.GB933@localhost.ucw.cz>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Pavel Machek' <pavel@ucw.cz>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

Pavel Machek wrote:
> 
> On Thu 2011-05-12 10:08:06, Kukjin Kim wrote:
> > This patch remvoes mach-s5p6442 directory for ARCH_S5P6442 in arch/arm.
> 
> Why remove it? No users? Broken? ...?
> 
Hmm...do you want to keep it in upcoming mainline?

Actually, it works fine current mainline on smdk6442. Of course, every
features/devices is not supported yet.

I'm not sure how many developers/companies use it current mainline now but
at least as I know, no one would do it soon.

S5P6442 and S5PC100 were selected when I thought about removing
mach-s5pxxxx.
As you know, I got concerns about C100, but 6442 and I agree with their
opinions.

If S5P6442 is really required later, I think, we can implement it with other
S5P64XX :)

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
