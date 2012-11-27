From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [GIT PULL 3/3] Samsung exynos5440 for v3.8
Date: Tue, 27 Nov 2012 09:39:01 +0900
Message-ID: <15c801cdcc37$984bbb60$c8e33220$%kim@samsung.com>
References: <10d401cdc91b$09fe1980$1dfa4c80$%kim@samsung.com>
 <20121126083232.GH9580@quad.lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:41182 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755180Ab2K0AjD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 26 Nov 2012 19:39:03 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0ME400I0CF2CLAD0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 27 Nov 2012 09:39:01 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.199])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0ME40085SF51KW30@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 27 Nov 2012 09:39:01 +0900 (KST)
In-reply-to: <20121126083232.GH9580@quad.lixom.net>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Olof Johansson' <olof@lixom.net>
Cc: 'Arnd Bergmann' <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Olof Johansson wrote:
> 
> On Fri, Nov 23, 2012 at 10:37:03AM +0900, Kukjin Kim wrote:
> > Arnd, Olof,
> >
> > This is adding support for exynos5440, including Quad ARM Cortex-A15
> cores
> > and its reference board SSDK5440.
> >
> > Note, at this moment, just enabled minimal system part for initial
> kernel
> > boot and pinctrl driver.
> >
> > Please pull from:
> > git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> > next/soc-exynos5440
> 
> Merged. This caused some new conflicts with previous samsung contents,
> since
> you add DT contents in several branches, etc. Please try to work on
> getting
> your amount of conflicts down a bit.
> 
Oops could be, it's my fault. Sorry for inconvenience.

> If you want a good example to look at, see how Tony Lindgren handles OMAP.
> He's juggling a large number of topics with nearly no conflicts left
> for us to resolve at our level, by making sure new work is based on
> appropriate base branches.
> 
Sure, I will.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
