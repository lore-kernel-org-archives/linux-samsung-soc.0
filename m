From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: S5PV210: Fix PL330 DMA controller clkdev entries
Date: Mon, 04 Mar 2013 22:00:39 +0900
Message-ID: <008001ce18d8$451527e0$cf3f77a0$%kim@samsung.com>
References: <1362227906-13921-1-git-send-email-s.nawrocki@samsung.com>
 <51321326.6050800@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:35298 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758228Ab3CDNAl convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 4 Mar 2013 08:00:41 -0500
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MJ500K8R04VVEB0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 04 Mar 2013 22:00:39 +0900 (KST)
In-reply-to: <51321326.6050800@gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Lonsn' <lonsn2005@gmail.com>, 'Sylwester Nawrocki' <sylvester.nawrocki@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 'Sylwester Nawrocki' <s.nawrocki@samsung.com>, 'Inderpal Singh' <inderpal.singh@linaro.org>, 'Boojin Kim' <boojin.kim@samsung.com>

Lonsn wrote:
>=20
> =E4=BA=8E 2013/3/2 20:38, Sylwester Nawrocki =E5=86=99=E9=81=93:
> > Since the DMA controller clocks are managed at amba bus level,
> > the PL330 device clocks handling has been removed from the driver
> > in commit 7c71b8eb268ee38235f7e924d943ea9d90e59469
> > DMA: PL330: Remove redundant runtime_suspend/resume functions
> >
> > However, this left the S5PV210 platform with only clkdev entries
> > linking "apb_pclk" clock conn_id to a dummy clock, rather than
> > to corresponding platform PL330 DMAC clock.
> > As a result the DMA controller is now attempted to be used on
> > S5PV210 with the clock disabled and the driver fails with an
> > error:
> >
> > dma-pl330 dma-pl330.0: PERIPH_ID 0x0, PCELL_ID 0x0 !
> > dma-pl330: probe of dma-pl330.0 failed with error -22
> > dma-pl330 dma-pl330.1: PERIPH_ID 0x0, PCELL_ID 0x0 !
> > dma-pl330: probe of dma-pl330.1 failed with error -22
> >
> > Fix this by adding "apb_pclk" clkdev entries for the Peripheral
> > DMA controllers 0/1 and removing the dummy apb_pclk clock.
> >
> > Reported-by: Lonsn <lonsn2005@gmail.com>
> > Cc: Inderpal Singh <inderpal.singh@linaro.org>
> > Cc: Boojin Kim <boojin.kim@samsung.com>
> > Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> > ---
> >
> > Lonsn, could you check if this patch solves the problem for you,
> > please ? Any Tested-by are welcome.
> > I didn't test this patch on any hardware yet. Once it is confirmed
> > I would resend it, also for stable kernels. It seems this issue is
> > present since v3.7.
> >
> Sylwester, I have tested this patch and confirmed it's OK in my S5PV2=
10
> platform.
>=20

Looks good to me, applied into -fixes.

Sylwester, why did you want to re-send this patch?

Thanks.

- Kukjin
