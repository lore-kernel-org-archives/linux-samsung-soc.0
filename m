From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [GIT PULL] Samsung S5P for v3.1 merge window
Date: Fri, 19 Aug 2011 15:42:08 +0900
Message-ID: <002501cc5e3b$1e35b760$5aa12620$%kim@samsung.com>
References: <001101cc478b$d48983f0$7d9c8bd0$%kim@samsung.com>
 <4E4E0096.2060907@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:10177 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751150Ab1HSGmL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 19 Aug 2011 02:42:11 -0400
Received: from epcpsbgm2.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LQ500F2ZX6JI310@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 19 Aug 2011 15:42:09 +0900 (KST)
Received: from kgenekim (12-23-120-114.csky.net [12.23.120.114])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LQ5008O5XA91W@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 19 Aug 2011 15:42:09 +0900 (KST)
In-reply-to: <4E4E0096.2060907@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tushar Behera' <tushar.behera@linaro.org>, 'Arnd Bergmann' <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Russell King' <rmk@arm.linux.org.uk>, 'Ben Dooks' <ben-linux@fluff.org>

Tushar Behera wrote:
> 
> Hi Arnd,
> 
> On Thursday 21 July 2011 03:21 PM, Kukjin Kim wrote:
> > Hi Arnd
> >
> > Please pull Samsung S5P updates from:
> >
> > git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> > for-arm-soc
> >
> > Or if you want to merge each branch into arm-soc, please use following.
> > As per your suggestion, I made following branches in my tree...
> >
> > - next-samsung-cleanup for arm-soc/next/cleanup
> > - next-samsung-devel for arm-soc/next/devel
> > - next-samsung-soc for arm-soc/next/soc (nothing)
> > - next-samsung-board for arm-soc/next/board
> > - and so on...
> >
> (snip)
> >
> > JeongHyeon Kim (1):
> >        ARM: EXYNOS4: Add support for ORIGEN board
> >
> I can't find this patch in the 3.1-rc1 release. Does it need some rework?
> 
Hi

Yes, you're right, and I already informed that to Arnd at the end of last
merge window. As I know, he will take care of it.

As a note, you can keep going on development of ORIGEN against on my
for-next before merging it in mainline.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
