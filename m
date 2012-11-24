From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH V3] ARM: EXYNOS5: Add clocks for EXYNOS5 Audio Subsystem.
Date: Sat, 24 Nov 2012 11:10:39 +0900
Message-ID: <122b01cdc9e8$e6287860$b2796920$%kim@samsung.com>
References: <1352176731-16199-1-git-send-email-padma.v@samsung.com>
 <000401cdc95c$c2aec420$480c4c60$@com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:19872 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932609Ab2KXCKl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 Nov 2012 21:10:41 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MDY00ABJZDKS590@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 24 Nov 2012 11:10:39 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.199])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MDY009R0ZDPVX60@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 24 Nov 2012 11:10:39 +0900 (KST)
In-reply-to: <000401cdc95c$c2aec420$480c4c60$@com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sangbeom Kim' <sbkim73@samsung.com>, 'Padmavathi Venna' <padma.v@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, olofj@google.com

Sangbeom Kim wrote:
> 
> On Tue, Nov 6, 2012 at 1:39 PM, Padmavathi Venna wrote:
> 
> > -----Original Message-----
> > From: Padmavathi Venna [mailto:padma.v@samsung.com]
> > Sent: Tuesday, November 06, 2012 1:39 PM
> > To: linux-arm-kernel@lists.infradead.org; linux-samsung-
> soc@vger.kernel.org
> > Cc: padma.v@samsung.com; sbkim73@samsung.com; ben-linux@fluff.org;
> kgene.kim@samsung.com;
> > olofj@google.com
> > Subject: [PATCH V3] ARM: EXYNOS5: Add clocks for EXYNOS5 Audio
Subsystem.
> >
> > This patch adds all the required clock instances for audio
> > subsystem and adds the clock alias names for sclk-i2s and
> > i2s-bus clks. This patch also do the static mapping
> > of audss clock base address to control audss clocks in CMU
> > clock framework.
> >
> > Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
> 
> Acked-by: Sangbeom Kim <sbkim73@samsung.com>
> 
Applied, thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
