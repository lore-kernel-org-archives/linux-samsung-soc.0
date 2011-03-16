From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 0/2] ARM: EXYNOS4: Enhancement of System MMU
Date: Wed, 16 Mar 2011 14:59:42 +0900
Message-ID: <001801cbe39f$5b307a40$11916ec0$%kim@samsung.com>
References: <1299460768-4077-1-git-send-email-pullip.cho@samsung.com>
 <011701cbe315$e9677140$bc3653c0$%kim@samsung.com>
 <AANLkTin7w=KYuLYS=vtcQo3nbLAxJPxLTQCTRGt9x6VL@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:8345 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751445Ab1CPF7w (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 16 Mar 2011 01:59:52 -0400
Received: from epmmp1 (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LI400043ZBOSYE0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 16 Mar 2011 14:59:48 +0900 (KST)
Received: from DOKGENEKIM02 ([12.23.103.104])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LI400ED5ZBNFG@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 16 Mar 2011 14:59:48 +0900 (KST)
In-reply-to: <AANLkTin7w=KYuLYS=vtcQo3nbLAxJPxLTQCTRGt9x6VL@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kyungmin Park' <kmpark@infradead.org>
Cc: 'KyongHo Cho' <pullip.cho@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, 'Marek Szyprowski' <m.szyprowski@samsung.com>, 'Russell King - ARM Linux' <linux@arm.linux.org.uk>

Kyungmin Park wrote:
> 
> > Cc'ed Marek.
> >
> > As I said before, Marek's SystemMMU driver has some problems.
> >
> > One is that it allocates 4MB virtual memory at once. It is really a
problem
> > because, the device memory manager must knows the peculiarity and
handles
> > it. Otherwise, page tables can be overwritten...
> 
> Are there device drivers using system MMU at mainline? or example codes?
> In case of Marek's patches, he posted drivers codes and tested at
> multimedia stack.
> 
> Another one is what's the difference between MFC drivers case and
SystemMMU
> one?
> 
This driver does not have dependency on other device drivers, I thought.

> and I hope you read this mail thread.
> http://www.mentby.com/Group/linux-kernel/patch-maintainers-update-msm-
> maintainers.html
> 
> Cite from Linus words.
> Actually, "the community" (not that there really is any such cohesive
> thing) generally asks that vendors be "involved". Not that vendors be
> "exclusively in control". There's a big difference.
> 
Already I read his comments at that time.

> I feel you control the s5p codes for vendor purpose.
> 
I'm afraid that you think so. I will try my best to advancement of Linux.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
