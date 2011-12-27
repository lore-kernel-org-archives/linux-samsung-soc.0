From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 09/12] ARM: EXYNOS: introduce
	arch/arm/mach-exynos/common.[ch]
Date: Tue, 27 Dec 2011 16:31:52 +0900
Message-ID: <08f401ccc469$9a93a800$cfbaf800$%kim@samsung.com>
References: <1324385316-6052-1-git-send-email-kgene.kim@samsung.com>
 <1324385316-6052-10-git-send-email-kgene.kim@samsung.com>
 <20111223191935.GS2577@n2100.arm.linux.org.uk>
 <088101ccc1d8$d2023b00$7606b100$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:26969 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751884Ab1L0Hb7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 27 Dec 2011 02:31:59 -0500
Received: from epcpsbgm2.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LWU00KG3Q7P7380@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 27 Dec 2011 16:31:55 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.114])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LWU00CWIQ940C50@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Tue, 27 Dec 2011 16:31:55 +0900 (KST)
In-reply-to: <088101ccc1d8$d2023b00$7606b100$%kim@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kukjin Kim' <kgene.kim@samsung.com>, 'Russell King - ARM Linux' <linux@arm.linux.org.uk>, 'Nicolas Pitre' <nico@fluxnic.net>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

Kukjin Kim wrote:
> 
> Russell King - ARM Linux wrote:
> >

> > It looks like there's some changes made to exynos stuff between -rc1
> 
> Yes, some bug has been fixed after -rc1...
> 

Hi Russell,

It is not a bug fix after -rc1 in mainline and the changes are from Marc's
commit db0d4db2 ("ARM: gic: allow GIC to support non-banked setups") and
Axel's bug fixes on Marc's patch which are in your devel-stable branch.

If this patch is not on top of Marc's patch, you can meet conflicts when you
merge the reset branch. Nevertheless, I'm sending the cleaned patch(7257/1
and 7258/1) which can be applied based on your restart-cleanup so that you
can apply this easily anyway and in addition, you can apply other
patches(7254/1, 7255/1 and 7256/1) as well.

I think, expected conflicts when you merge your branches can be fixed and if
any problems, please let me know.

As a note, since local common.[ch] which are not based on current samsung
tree have been introduced, we will meet conflicts between this series and my
tree and of course, I will fix then.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
