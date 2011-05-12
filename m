From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 2/7] ASoC: Remove to support sound for S5PC100
Date: Thu, 12 May 2011 16:53:59 +0900
Message-ID: <03fa01cc1079$c2583670$4708a350$%kim@samsung.com>
References: <1305162674-25860-1-git-send-email-kgene.kim@samsung.com>
 <1305162674-25860-3-git-send-email-kgene.kim@samsung.com>
 <BANLkTinqyFCwp3FCOyW=gVhotd1p8DnDyw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:64955 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750919Ab1ELHyF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 May 2011 03:54:05 -0400
Received: from epcpsbgm1.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LL200I1ROLVHJR0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 12 May 2011 16:54:02 +0900 (KST)
Received: from DOKGENEKIM02 ([12.23.103.104])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LL2003PKOM2SI@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 12 May 2011 16:54:03 +0900 (KST)
In-reply-to: <BANLkTinqyFCwp3FCOyW=gVhotd1p8DnDyw@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Jassi Brar' <jassisinghbrar@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, 'Mark Brown' <broonie@opensource.wolfsonmicro.com>

Jassi Brar wrote:
> 
> On Thu, May 12, 2011 at 6:41 AM, Kukjin Kim <kgene.kim@samsung.com> wrote:
> > According to removing ARCH_S5PC100, we don't need to support
> > sound for S5PC100.
> >
> > Cc: Jassi Brar <jassisinghbrar@gmail.com>
> > Cc: Mark Brown <broonie@opensource.wolfsonmicro.com>
> > Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> > ---
> >  sound/soc/samsung/Kconfig |    2 +-
> 
Hi Jassi,

Oops...Yeah, you're right.
Thanks for your pointing out :)

Will update soon.

> You might also want to remove smdkc100 support from
>  sound/soc/samsung/smdk_wm9713.c
>  sound/soc/samsung/smdk_wm8580.c
> And three other references to smdkc100 in sound/soc/samsung/Kconfig

I found something for smdkc100 in smdk_wm8580.c but I'm not sure which should be removed in smdk_wm9713.c.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
