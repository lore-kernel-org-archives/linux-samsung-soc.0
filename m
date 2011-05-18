From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 0/7] ARM: Removing ARCH_S5PC100
Date: Wed, 18 May 2011 17:44:03 +0900
Message-ID: <001201cc1537$bfb24e20$3f16ea60$%kim@samsung.com>
References: <1305162674-25860-1-git-send-email-kgene.kim@samsung.com>
 <20110517121948.GE2737@game.jcrosoft.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:15577 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754277Ab1ERIoJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 18 May 2011 04:44:09 -0400
Received: from epcpsbgm1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LLD0098MUWQSQA0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 18 May 2011 17:44:07 +0900 (KST)
Received: from kgenekim ([12.23.119.139])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LLD00GZ9UXIPY@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 18 May 2011 17:44:07 +0900 (KST)
In-reply-to: <20110517121948.GE2737@game.jcrosoft.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Jean-Christophe PLAGNIOL-VILLARD' <plagnioj@jcrosoft.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

Jean-Christophe PLAGNIOL-VILLARD wrote:
> 
> HI,
> 
Hi,

> 	why do you remove it?
> 
Thanks for your concerns :)

I think it's rather premature to decide it at this time.
So this is dropped at this moment...but as a note, I will implement this
into other samsung stuff next time :)

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

> On 10:11 Thu 12 May     , Kukjin Kim wrote:
> > This patch remvoes mach-s5pc100 directory for ARCH_S5PC100 in arch/arm.
> >
> > If any problems, please let me know immediately.
> >
> > [PATCH 1/7] ARM: S5PC100: Removing ARCH_S5PC100
> > [PATCH 2/7] ASoC: Remove to support sound for S5PC100
> > [PATCH 3/7] [media] s5p-fimc: Remove to support fimc for S5PC100
> > [PATCH 4/7] mtd: OneNAND: Remove to support onenand for S5PC100
> > [PATCH 5/7] tty: Remove to support serial for S5PC100
> > [PATCH 6/7] video: s3c-fb: Remove to support fb for S5PC100
> > [PATCH 7/7] libata: Remove to support pata for S5PC100
