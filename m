From: Boojin Kim <boojin.kim@samsung.com>
Subject: RE: [PATCH v6 03/10] ARM: EXYNOS4: Modify platform data for pl330
 driver
Date: Wed, 12 Oct 2011 17:08:28 +0900
Message-ID: <001801cc88b6$2023e330$606ba990$%kim@samsung.com>
References: <1318270538-30450-1-git-send-email-thomas.abraham@linaro.org>
 <1318270538-30450-2-git-send-email-thomas.abraham@linaro.org>
 <1318270538-30450-3-git-send-email-thomas.abraham@linaro.org>
 <1318270538-30450-4-git-send-email-thomas.abraham@linaro.org>
 <CAJuYYwRLGZ9Mt5vedM9cOaPu-9cH_41GC=XPTS80y9vUxr=gQw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=EUC-KR
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:21986 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751566Ab1JLIIa (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Oct 2011 04:08:30 -0400
Received: from epcpsbgm2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LSY002YE191Q3C0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 12 Oct 2011 17:08:29 +0900 (KST)
Received: from DOBOOJINKIM03 ([12.23.120.72])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LSY008QR1A57670@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Wed, 12 Oct 2011 17:08:29 +0900 (KST)
In-reply-to: <CAJuYYwRLGZ9Mt5vedM9cOaPu-9cH_41GC=XPTS80y9vUxr=gQw@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Thomas Abraham' <thomas.abraham@linaro.org>, linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, vinod.koul@intel.com, 'Jassi Brar' <jassisinghbrar@gmail.com>

Thomas Abraham wrote:
>
> Dear Mr. Kim,
>
> On 10 October 2011 23:45, Thomas Abraham <thomas.abraham@linaro.org>
> wrote:
> > With the 'struct dma_pl330_peri' removed, the platfrom data for dma
> > driver can be simplified to a simple list of peripheral request ids=
=2E
> >
> > Cc: Jassi Brar <jassisinghbrar@gmail.com>
> > Cc: Boojin Kim <boojin.kim@samsung.com>
> > Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
> > Acked-by: Kukjin Kim <kgene.kim@samsung.com>
> > Acked-by: Grant Likely <grant.likely@secretlab.ca>
> > ---
> > =A0arch/arm/mach-exynos4/dma.c | =A0223 ++++++++++++---------------=
------
> ----------
> > =A01 files changed, 62 insertions(+), 161 deletions(-)
> >
> > diff --git a/arch/arm/mach-exynos4/dma.c b/arch/arm/mach-
> exynos4/dma.c
> > index 9667c61..c3c0d17 100644
> > --- a/arch/arm/mach-exynos4/dma.c
> > +++ b/arch/arm/mach-exynos4/dma.c
> > @@ -35,95 +35,40 @@
> >
> > =A0static u64 dma_dmamask =3D DMA_BIT_MASK(32);
> >
> > -struct dma_pl330_peri pdma0_peri[28] =3D {
> > - =A0 =A0 =A0 {
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_PCM0_RX,
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .rqtype =3D DEVTOMEM,
> > - =A0 =A0 =A0 }, {
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_PCM0_TX,
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .rqtype =3D MEMTODEV,
> > - =A0 =A0 =A0 }, {
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_PCM2_RX,
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .rqtype =3D DEVTOMEM,
> > - =A0 =A0 =A0 }, {
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_PCM2_TX,
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .rqtype =3D MEMTODEV,
> > - =A0 =A0 =A0 }, {
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_MSM_REQ0,
> > - =A0 =A0 =A0 }, {
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_MSM_REQ2,
> > - =A0 =A0 =A0 }, {
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_SPI0_RX,
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .rqtype =3D DEVTOMEM,
> > - =A0 =A0 =A0 }, {
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_SPI0_TX,
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .rqtype =3D MEMTODEV,
> > - =A0 =A0 =A0 }, {
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_SPI2_RX,
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .rqtype =3D DEVTOMEM,
> > - =A0 =A0 =A0 }, {
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_SPI2_TX,
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .rqtype =3D MEMTODEV,
> > - =A0 =A0 =A0 }, {
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_I2S0S_TX,
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .rqtype =3D MEMTODEV,
> > - =A0 =A0 =A0 }, {
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_I2S0_RX,
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .rqtype =3D DEVTOMEM,
> > - =A0 =A0 =A0 }, {
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_I2S0_TX,
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .rqtype =3D MEMTODEV,
> > - =A0 =A0 =A0 }, {
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_UART0_RX,
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .rqtype =3D DEVTOMEM,
> > - =A0 =A0 =A0 }, {
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_UART0_TX,
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .rqtype =3D MEMTODEV,
> > - =A0 =A0 =A0 }, {
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_UART2_RX,
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .rqtype =3D DEVTOMEM,
> > - =A0 =A0 =A0 }, {
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_UART2_TX,
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .rqtype =3D MEMTODEV,
> > - =A0 =A0 =A0 }, {
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_UART4_RX,
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .rqtype =3D DEVTOMEM,
> > - =A0 =A0 =A0 }, {
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_UART4_TX,
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .rqtype =3D MEMTODEV,
> > - =A0 =A0 =A0 }, {
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_SLIMBUS0_RX,
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .rqtype =3D DEVTOMEM,
> > - =A0 =A0 =A0 }, {
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_SLIMBUS0_TX,
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .rqtype =3D MEMTODEV,
> > - =A0 =A0 =A0 }, {
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_SLIMBUS2_RX,
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .rqtype =3D DEVTOMEM,
> > - =A0 =A0 =A0 }, {
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_SLIMBUS2_TX,
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .rqtype =3D MEMTODEV,
> > - =A0 =A0 =A0 }, {
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_SLIMBUS4_RX,
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .rqtype =3D DEVTOMEM,
> > - =A0 =A0 =A0 }, {
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_SLIMBUS4_TX,
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .rqtype =3D MEMTODEV,
> > - =A0 =A0 =A0 }, {
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_AC97_MICIN,
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .rqtype =3D DEVTOMEM,
> > - =A0 =A0 =A0 }, {
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_AC97_PCMIN,
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .rqtype =3D DEVTOMEM,
> > - =A0 =A0 =A0 }, {
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_AC97_PCMOUT,
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .rqtype =3D MEMTODEV,
> > - =A0 =A0 =A0 },
> > +u8 pdma0_peri[] =3D {
> > + =A0 =A0 =A0 DMACH_PCM0_RX,
> > + =A0 =A0 =A0 DMACH_PCM0_TX,
> > + =A0 =A0 =A0 DMACH_PCM2_RX,
> > + =A0 =A0 =A0 DMACH_PCM2_TX,
> > + =A0 =A0 =A0 DMACH_MSM_REQ0,
> > + =A0 =A0 =A0 DMACH_MSM_REQ2,
> > + =A0 =A0 =A0 DMACH_SPI0_RX,
> > + =A0 =A0 =A0 DMACH_SPI0_TX,
> > + =A0 =A0 =A0 DMACH_SPI2_RX,
> > + =A0 =A0 =A0 DMACH_SPI2_TX,
> > + =A0 =A0 =A0 DMACH_I2S0S_TX,
> > + =A0 =A0 =A0 DMACH_I2S0_RX,
> > + =A0 =A0 =A0 DMACH_I2S0_TX,
>
> As you have suggested, I have rechecked the platform data for all s5p
> platforms in this patchset. Here, DMACH_I2S2_RX (event id 13) and
> DMACH_I2S2_TX (event id 14) of DMAC[0] are missing as per the
> exynos4210 user manual. But these where missing in the original code
> as well which this patch modified. If possible, could you please let
> me know if DMACH_I2S2_RX and DMACH_I2S2_TX are indeed event id 13 and
> 14 in DMAC[0].

Yes, DMACH_I2S2_RX and DMACH_I2X2_TX are missed from my patch.
Can you modify it although you are inconvenient ?

Thanks..
Boojin

>
> I have rechecked the other s5p platform data for dmac (s5p64x0,
> s5pc100, s5pv210). Apart from the typo pointed out by Anca for
> s5pc100, there are no other issues.
>
> Thanks,
> Thomas.
>
> > + =A0 =A0 =A0 DMACH_UART0_RX,
> > + =A0 =A0 =A0 DMACH_UART0_TX,
> > + =A0 =A0 =A0 DMACH_UART2_RX,
> > + =A0 =A0 =A0 DMACH_UART2_TX,
> > + =A0 =A0 =A0 DMACH_UART4_RX,
> > + =A0 =A0 =A0 DMACH_UART4_TX,
> > + =A0 =A0 =A0 DMACH_SLIMBUS0_RX,
> > + =A0 =A0 =A0 DMACH_SLIMBUS0_TX,
> > + =A0 =A0 =A0 DMACH_SLIMBUS2_RX,
> > + =A0 =A0 =A0 DMACH_SLIMBUS2_TX,
> > + =A0 =A0 =A0 DMACH_SLIMBUS4_RX,
> > + =A0 =A0 =A0 DMACH_SLIMBUS4_TX,
> > + =A0 =A0 =A0 DMACH_AC97_MICIN,
> > + =A0 =A0 =A0 DMACH_AC97_PCMIN,
> > + =A0 =A0 =A0 DMACH_AC97_PCMOUT,
> > =A0};
> >
> > =A0struct dma_pl330_platdata exynos4_pdma0_pdata =3D {
> > =A0 =A0 =A0 =A0.nr_valid_peri =3D ARRAY_SIZE(pdma0_peri),
> > - =A0 =A0 =A0 .peri =3D pdma0_peri,
> > + =A0 =A0 =A0 .peri_id =3D pdma0_peri,
> > =A0};
> >
>
> [...]
> --
> To unsubscribe from this list: send the line "unsubscribe linux-
> samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
