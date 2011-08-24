From: Boojin Kim <boojin.kim@samsung.com>
Subject: RE: [PATCH 1/3] DMA: PL330: Infer transfer direction from transfer
 request instead of platform data
Date: Wed, 24 Aug 2011 13:00:49 +0900
Message-ID: <000b01cc6212$694c8e60$3be5ab20$%kim@samsung.com>
References: <1314050385-9617-1-git-send-email-thomas.abraham@linaro.org>
 <1314050385-9617-2-git-send-email-thomas.abraham@linaro.org>
 <000601cc61fc$201ac560$60505020$%kim@samsung.com>
 <CAJuYYwQ0cKw_069V9Ci0rdfM+vESkbcGXnLj+xV68kf85VngKA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=EUC-KR
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:55288 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750803Ab1HXEA4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 24 Aug 2011 00:00:56 -0400
Received: from epcpsbgm2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LQE009ZFZ52NTJ0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 24 Aug 2011 13:00:50 +0900 (KST)
Received: from DOBOOJINKIM03 (12-23-120-72.csky.net [12.23.120.72])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LQE003JIZ5EC7@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 24 Aug 2011 13:00:50 +0900 (KST)
In-reply-to: <CAJuYYwQ0cKw_069V9Ci0rdfM+vESkbcGXnLj+xV68kf85VngKA@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Thomas Abraham' <thomas.abraham@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, vinod.koul@intel.com, 'Jassi Brar' <jassisinghbrar@gmail.com>

Thomas Abraham wrote:
> Sent: Wednesday, August 24, 2011 12:23 PM
> To: Boojin Kim
> Cc: linux-arm-kernel@lists.infradead.org; linux-samsung-
> soc@vger.kernel.org; kgene.kim@samsung.com; vinod.koul@intel.com;
> Jassi Brar
> Subject: Re: [PATCH 1/3] DMA: PL330: Infer transfer direction from
> transfer request instead of platform data
>
> Hi Boojin,
>
> On 24 August 2011 06:51, Boojin Kim <boojin.kim@samsung.com> wrote:
> > Thomas Abraham wrote:
> >> Sent: Tuesday, August 23, 2011 7:00 AM
> >> To: linux-arm-kernel@lists.infradead.org
> >> Cc: linux-samsung-soc@vger.kernel.org; kgene.kim@samsung.com;
> >> vinod.koul@intel.com; Jassi Brar; Boojin Kim
> >> Subject: [PATCH 1/3] DMA: PL330: Infer transfer direction from
> >> transfer request instead of platform data
> >>
> >> The transfer direction for a channel can be inferred from the
> transfer
> >> request and the need for specifying transfer direction in platfrom
> >> data
> >> can be eliminated. So the structure definition 'struct
> dma_pl330_peri'
> >> is no longer required.
> >>
> >> With the 'struct dma_pl330_peri' removed, the dma controller
> transfer
> >> capabilities cannot be inferred any longer. Hence, the dma
> controller
> >> capabilities is specified using platforme data.
> >>
> >> Cc: Jassi Brar <jassisinghbrar@gmail.com>
> >> Cc: Boojin Kim <boojin.kim@samsung.com>
> >> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
> >> ---
> >> =A0drivers/dma/pl330.c =A0 =A0 =A0 =A0| =A0 56 ++++++++-----------=
---------------
> ----
> >> ------
> >> =A0include/linux/amba/pl330.h | =A0 14 +++--------
> >> =A02 files changed, 14 insertions(+), 56 deletions(-)
> >>
>
> [...]
>
> >> =A0 =A0 =A0 for (i =3D 0; i < num_chan; i++) {
> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 pch =3D &pdmac->peripherals[i];
> >> - =A0 =A0 =A0 =A0 =A0 =A0 if (pdat) {
> >> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct dma_pl330_peri *p=
eri =3D &pdat->peri[i];
> >> -
> >> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 switch (peri->rqtype) {
> >> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 case MEMTOMEM:
> >> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dma_cap_=
set(DMA_MEMCPY, pd->cap_mask);
> >> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> >> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 case MEMTODEV:
> >> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 case DEVTOMEM:
> >> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dma_cap_=
set(DMA_SLAVE, pd->cap_mask);
> >> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dma_cap_=
set(DMA_CYCLIC, pd->cap_mask);
> >> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> > If remove capabilities setting, dmaengine() doesn't search the
> channel that
> > client requests with specific capability.
> > So, I think dma_request_channel() would fail.
>
> The capabilities is now supplied using platform data. There is a new
> member 'cap_mask' added to the pl330 driver platform data structure.
> The capabilities for a pl330 controller can be specified using
> cap_mask. For exynos4, the capabilities is set up in the
> exynos4_dma_init function. These changes are part of the third patch
> in this patchset.
>
> Thanks for your review.
>
> Regards,
> Thomas.
Okay, It's good to me.
Thanks,
Boojin

>
> [...]
> --
> To unsubscribe from this list: send the line "unsubscribe linux-
> samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
