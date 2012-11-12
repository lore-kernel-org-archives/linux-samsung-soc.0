From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 2/4] gpio: samsung: Skip registration if pinctrl driver is
 present on Exynos4x12
Date: Mon, 12 Nov 2012 14:03:05 +0900
Message-ID: <004b01cdc093$00424140$00c6c3c0$%kim@samsung.com>
References: <1351089457-8205-1-git-send-email-t.figa@samsung.com>
 <1351089457-8205-3-git-send-email-t.figa@samsung.com>
 <CACRpkdYNDSp0K3wpvUem9ecsW-JQ9L6aKqaOmHNUR65DQTMNHA@mail.gmail.com>
 <0c5301cdbca2$30320240$909606c0$%kim@samsung.com>
 <CACRpkdaOpzFvs_wqy9sdrmx1=wEs5uxqfh_rOrKxLTXV-q1K2Q@mail.gmail.com>
 <0e8301cdbe62$56a1d010$03e57030$%kim@samsung.com>
 <CACRpkdZGu2VfP-EzAOxK3947x6Pd78bh=TWDK98iXwkJx2WiTQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:36011 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750709Ab2KLFDU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 12 Nov 2012 00:03:20 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MDC005L6ZD1ORG0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 12 Nov 2012 14:03:06 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.199])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MDC00A72ZD5ZLB0@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 12 Nov 2012 14:03:06 +0900 (KST)
In-reply-to: <CACRpkdZGu2VfP-EzAOxK3947x6Pd78bh=TWDK98iXwkJx2WiTQ@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Linus Walleij' <linus.walleij@linaro.org>, 'Axel Lin' <axel.lin@ingics.com>
Cc: 'Tomasz Figa' <t.figa@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, tomasz.figa@gmail.com, thomas.abraham@linaro.org

Linus Walleij wrote:
> 
> >
> > Can you drop above 3 commits in your tree? If many conflicts happens
> during
> > rebasing, how about that I merge your pinctrl/samsung branch into
> Samsung
> > tree?...
> 
> Why not :-)
> 
> I have removed the samsung branch from my for-next to avoid
> clashes.
> 
Thanks ;-)

> So please bring the samsung branch into you tree and fix
> everything up there.
> 
I did.

> Axel Lin has sent some tree-wide cleanups but let's hope they don't
> hit samsung so much, or they will need to be postponed/dropped.
> 
OK, I see.

Thanks again.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
