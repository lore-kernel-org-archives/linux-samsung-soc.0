From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: Samsung S5P: Unify defines for both gpio interrupt
 types
Date: Thu, 30 Sep 2010 20:45:36 +0900
Message-ID: <00a801cb6095$0212ef20$0638cd60$%kim@samsung.com>
References: <1285841906-21194-1-git-send-email-m.szyprowski@samsung.com>
 <00a501cb6091$e25692c0$a703b840$%kim@samsung.com>
 <00e101cb6093$34f4d270$9ede7750$%szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:52416 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755096Ab0I3LpW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 30 Sep 2010 07:45:22 -0400
Received: from epmmp1 (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L9K00C825ZKGV30@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 30 Sep 2010 20:45:20 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L9K00G3Z5ZK8D@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 30 Sep 2010 20:45:20 +0900 (KST)
In-reply-to: <00e101cb6093$34f4d270$9ede7750$%szyprowski@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Marek Szyprowski' <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kyungmin.park@samsung.com, ben-linux@fluff.org

Marek Szyprowski wrote:
> 
> Hello,
> 
Hi,

(snip)

> >
> > Ok..firstly looks ok to me now.
> > But I don't know...in the future may have to revert back due to S5P64XX.
> 
> Well, these defines are used only by plat-s5p/irq-{eint,gpioint}.c. These
generic
> functions cannot be used for S5P64XX anyway, because it has S3C64XX style
of
> gpio
> registers afair. IMHO this shouldn't be a problem. Just S5P64XX would need
to
> provide it's own code for gpio/ext interrupts (or share the code with
s3c64xx
> somehow).
> 
Yes, you're right. It seems to have been useless worry.
However, it is likely to think of once again later.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
