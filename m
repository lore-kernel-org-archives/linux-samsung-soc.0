From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [rtc-linux] [PATCH v2 3/3] rtc: rtc-s3c: Add BCD register
	initialization codes
Date: Wed, 28 Jul 2010 13:30:49 +0900
Message-ID: <007901cb2e0d$ac1faa40$045efec0$%kim@samsung.com>
References: <1280235553-27369-1-git-send-email-kgene.kim@samsung.com>
 <20100727194611.04486f92@linux.lan.towertech.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:10522 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750930Ab0G1Eaq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 Jul 2010 00:30:46 -0400
Received: from epmmp2 (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L69004DX3780O20@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 28 Jul 2010 13:30:44 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L6900ICX3786R@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 28 Jul 2010 13:30:44 +0900 (KST)
In-reply-to: <20100727194611.04486f92@linux.lan.towertech.it>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Alessandro Zummo' <a.zummo@towertech.it>, rtc-linux@googlegroups.com
Cc: p_gortmaker@yahoo.com, linux-samsung-soc@vger.kernel.org, 'Taekgyun Ko' <taeggyun.ko@samsung.com>, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org

Alessandro Zummo wrote:
> 
> On Tue, 27 Jul 2010 21:59:13 +0900
> Kukjin Kim <kgene.kim@samsung.com> wrote:
> 
> > From: Taekgyun Ko <taeggyun.ko@samsung.com>
> >
> > RTC needs to be initialized when BCD registers have invalid value.
> >
> > Signed-off-by: Taekgyun Ko <taeggyun.ko@samsung.com>
> > Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> 
> 
>  Acked-by: Alessandro Zummo <a.zummo@towertech.it>
> 
Thanks for your ack.

So...which subsystem tree is appropriate for this?

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
