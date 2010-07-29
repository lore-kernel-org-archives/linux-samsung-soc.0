From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [rtc-linux] [PATCH v3 3/3] rtc: rtc-s3c: Add BCD register
	initialization codes
Date: Thu, 29 Jul 2010 14:35:28 +0900
Message-ID: <009b01cb2edf$dcefd140$96cf73c0$%kim@samsung.com>
References: <1280379570-6147-1-git-send-email-kgene.kim@samsung.com>
 <AANLkTimoyYGXc-bwQCOWFSBP+nWTVVri6ZMsNuwwYtC7@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:55440 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751117Ab0G2FfW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 29 Jul 2010 01:35:22 -0400
Received: from epmmp2 (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L6B001320UXLQ10@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 29 Jul 2010 14:35:21 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L6B00C3W0UX2M@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 29 Jul 2010 14:35:21 +0900 (KST)
In-reply-to: <AANLkTimoyYGXc-bwQCOWFSBP+nWTVVri6ZMsNuwwYtC7@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Wan ZongShun' <mcuos.com@gmail.com>, rtc-linux@googlegroups.com, 'Andrew Morton' <akpm@linux-foundation.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, p_gortmaker@yahoo.com, a.zummo@towertech.it, 'Taekgyun Ko' <taeggyun.ko@samsung.com>

Wan ZongShun wrote:
> 
> 2010/7/29 Kukjin Kim <kgene.kim@samsung.com>:
> > From: Taekgyun Ko <taeggyun.ko@samsung.com>
> >
> > RTC needs to be initialized when BCD registers have invalid value.
> >
> > Signed-off-by: Taekgyun Ko <taeggyun.ko@samsung.com>
> > Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> > Cc: Ben Dooks <ben-linux@fluff.org>
> > ---
> > Hi, Alessandro Zummo
> > Just moved the routine to support all Samsung SoCs' RTC.
> > Is still your ack valid?
> 
Hi Wan,

> Alessandro is busy, not every patch he can reviewed and acked,
> if nobody have any other suggestions about your patch, you can
> merge it. if you donot have specific git tree to merge it, you can get
> Andrew's help.
> 
Thanks for your rapid response. ;-)

(snip)

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
