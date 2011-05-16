From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 2/7] ASoC: Remove to support sound for S5PC100
Date: Mon, 16 May 2011 16:19:06 +0900
Message-ID: <002201cc1399$8c39bd20$a4ad3760$%kim@samsung.com>
References: <1305162674-25860-1-git-send-email-kgene.kim@samsung.com>
 <1305162674-25860-3-git-send-email-kgene.kim@samsung.com>
 <BANLkTinqyFCwp3FCOyW=gVhotd1p8DnDyw@mail.gmail.com>
 <03fa01cc1079$c2583670$4708a350$%kim@samsung.com>
 <BANLkTimZnzfWuKB+J0z7YT-0ZT_B5_OvBQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:55910 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752003Ab1EPHTa (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 16 May 2011 03:19:30 -0400
Received: from epcpsbgm2.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LLA001C01NVRYD0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 16 May 2011 16:19:09 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LLA00GTA1NXO3@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 16 May 2011 16:19:09 +0900 (KST)
In-reply-to: <BANLkTimZnzfWuKB+J0z7YT-0ZT_B5_OvBQ@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Jassi Brar' <jassisinghbrar@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, 'Mark Brown' <broonie@opensource.wolfsonmicro.com>

Jassi Brar wrote:
> 
> On Thu, May 12, 2011 at 1:23 PM, Kukjin Kim <kgene.kim@samsung.com> wrote:
> 
> >> You might also want to remove smdkc100 support from
> >>  sound/soc/samsung/smdk_wm9713.c
> >>  sound/soc/samsung/smdk_wm8580.c
> >> And three other references to smdkc100 in sound/soc/samsung/Kconfig
> >
> > I found something for smdkc100 in smdk_wm8580.c but I'm not sure which
> should be removed in smdk_wm9713.c.
> >
> 
> Just the comment about jumper settings on smdkc100
> otherwise it gives wrong impression that the board is supported.

Ok, I agree.

But I'm not sure what is required for it.
Could you please let me know about it after discussion of removing C100?

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
