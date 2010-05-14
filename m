From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v2 2/9] ARM: SAMSUNG: Move mach/ts.h to plat/ts.h
Date: Fri, 14 May 2010 09:11:29 +0900
Message-ID: <009601caf2fa$037e6000$0a7b2000$%kim@samsung.com>
References: <008001caf29d$9a2f9f80$ce8ede80$%kim@samsung.com>
 <4BEC6F0C.2030202@ru.mvista.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:59822 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752864Ab0ENALe (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 13 May 2010 20:11:34 -0400
Received: from epmmp2 (mailout4.samsung.com [203.254.224.34])
 by mailout1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0L2D009M3V7900@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 14 May 2010 09:11:33 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L2D00L14V78WB@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 14 May 2010 09:11:33 +0900 (KST)
In-reply-to: <4BEC6F0C.2030202@ru.mvista.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sergei Shtylyov' <sshtylyov@mvista.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Ben Dooks' <ben-linux@fluff.org>

Sergei Shtylyov wrote:
> 
> Hello.
> 
> Kukjin Kim wrote:
> 
> > This patch has been merged into Ben Dooks' tree, for-2635/s3c64xx-ts.
> > So need to rebase this commit.
> 
> > ---
> > commit 34b01740be6e010976a2f5aa8f343d3b5dd6d278
> > Author: Maurus Cuelenaere <mcuelenaere@gmail.com>
> > Date:   Tue May 4 13:12:41 2010 +0200
> 
> >     ARM: SAMSUNG: Move mach/ts.h to plat/ts.h
> 
> >     This moves mach-s3c2410/include/mach/ts.h to
> > plat-samsung/include/plat/ts.h in
> >     order to prepare for s3c64xx support in the touchscreen driver.
> 
> >     Signed-off-by: Maurus Cuelenaere <mcuelenaere@gmail.com>
> >     Signed-off-by: Ben Dooks <ben-linux@fluff.org>
> > ---
> 
>    Where's the patch?


Hi,

The patch is in branch 'for-2635/s3c64xx-ts' of
git://git.fluff.org/bjdooks/linux

(http://lists.infradead.org/pipermail/linux-arm-kernel/2010-May/014148.html)


Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
