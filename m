From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 5/5] ARM: SAMSUNG: Add to enable/disable clock on S3C PL330
Date: Thu, 21 Oct 2010 11:41:23 +0900
Message-ID: <030301cb70c9$759a3950$60ceabf0$%kim@samsung.com>
References: <1287622713-1657-1-git-send-email-kgene.kim@samsung.com>
 <1287622713-1657-6-git-send-email-kgene.kim@samsung.com>
 <AANLkTi=ZTBuPBDL4MZ7MPn3Ha_cNhyShosyzn8q6QF3N@mail.gmail.com>
 <AANLkTimbHbO77POKuu=3XAO6Cq7UaAjJ291hwQqKTcNW@mail.gmail.com>
 <AANLkTinaDckVpJhadBcnhccdougyCG-FbXe23dh=_ep8@mail.gmail.com>
 <AANLkTinYHSUP5AspWbzD8hfKJtEaFAfcUYC0sOPy+WKX@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:17159 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757042Ab0JUClG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 20 Oct 2010 22:41:06 -0400
Received: from epmmp1 (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0LAM00LUBCSGCY00@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 21 Oct 2010 11:41:04 +0900 (KST)
Received: from DOKGENEKIM02 ([12.23.103.104])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LAM00M6ZCSF5B@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 21 Oct 2010 11:41:04 +0900 (KST)
In-reply-to: <AANLkTinYHSUP5AspWbzD8hfKJtEaFAfcUYC0sOPy+WKX@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Jassi Brar' <jassisinghbrar@gmail.com>, 'Kyungmin Park' <kmpark@infradead.org>
Cc: linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org, 'Seungwhan Youn' <sw.youn@samsung.com>

Jassi Brar wrote:
> 
> On Thu, Oct 21, 2010 at 10:49 AM, Kyungmin Park <kmpark@infradead.org> wrote:
> >>> Can you make it REAL clock gating, enable clock only when using?
> >>
> >> Of course we can. But that will need some intrusive changes.
> >> Later, we'll implement that desirable feature.
> >> For now, many SoCs don't detect PL330 since the clocks are gated
> >> by default and we don't enable them in driver. So, this is just to get
> >> latest SoCs' PL330 working.
> >
> > I see even though I don't know "later" is how much
> 
> We (apparently) don't have fixed policy about which devices have their clocks
> enabled by default and which don't.
> So, by default PL330 clock is enabled on some platforms and not on others.
> This patch only makes sure the PL330 works on all platforms at boot-time.
> 
> 
> > and include the s5pc210 code also at this patchset.
> Yes, all platforms should be enabled for PL330 driver.

If we want to use S5PV310/S5PC210 DMA now, need implementation some stuff of it.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
