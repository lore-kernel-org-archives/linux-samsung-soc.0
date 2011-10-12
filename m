From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH v6 03/10] ARM: EXYNOS4: Modify platform data for pl330 driver
Date: Wed, 12 Oct 2011 13:43:32 +0530
Message-ID: <CAJuYYwSP9Lg+SzS9x1Nz8rF55-SBuhQwKnuTDfHE--a3uEDjcg@mail.gmail.com>
References: <1318270538-30450-1-git-send-email-thomas.abraham@linaro.org>
	<1318270538-30450-2-git-send-email-thomas.abraham@linaro.org>
	<1318270538-30450-3-git-send-email-thomas.abraham@linaro.org>
	<1318270538-30450-4-git-send-email-thomas.abraham@linaro.org>
	<CAJuYYwRLGZ9Mt5vedM9cOaPu-9cH_41GC=XPTS80y9vUxr=gQw@mail.gmail.com>
	<001801cc88b6$2023e330$606ba990$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-gx0-f174.google.com ([209.85.161.174]:44350 "EHLO
	mail-gx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751001Ab1JLINd convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Oct 2011 04:13:33 -0400
Received: by ggnv2 with SMTP id v2so435359ggn.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Oct 2011 01:13:32 -0700 (PDT)
In-Reply-To: <001801cc88b6$2023e330$606ba990$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Boojin Kim <boojin.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, vinod.koul@intel.com, Jassi Brar <jassisinghbrar@gmail.com>

Dear Boojin Kim,

2011/10/12 Boojin Kim <boojin.kim@samsung.com>:
> Thomas Abraham wrote:
>>
>> Dear Mr. Kim,
>>
>> On 10 October 2011 23:45, Thomas Abraham <thomas.abraham@linaro.org>
>> wrote:
>> > With the 'struct dma_pl330_peri' removed, the platfrom data for dm=
a
>> > driver can be simplified to a simple list of peripheral request id=
s.
>> >
>> > Cc: Jassi Brar <jassisinghbrar@gmail.com>
>> > Cc: Boojin Kim <boojin.kim@samsung.com>
>> > Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
>> > Acked-by: Kukjin Kim <kgene.kim@samsung.com>
>> > Acked-by: Grant Likely <grant.likely@secretlab.ca>
>> > ---
>> > =A0arch/arm/mach-exynos4/dma.c | =A0223 ++++++++++++--------------=
-------
>> ----------
>> > =A01 files changed, 62 insertions(+), 161 deletions(-)
>> >
>> > diff --git a/arch/arm/mach-exynos4/dma.c b/arch/arm/mach-
>> exynos4/dma.c
>> > index 9667c61..c3c0d17 100644
>> > --- a/arch/arm/mach-exynos4/dma.c
>> > +++ b/arch/arm/mach-exynos4/dma.c
>> > @@ -35,95 +35,40 @@
>> >
>> > =A0static u64 dma_dmamask =3D DMA_BIT_MASK(32);
>> >
>> > -struct dma_pl330_peri pdma0_peri[28] =3D {
>> > - =A0 =A0 =A0 {
>> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_PCM0_RX,
>> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .rqtype =3D DEVTOMEM,
>> > - =A0 =A0 =A0 }, {
>> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_PCM0_TX,
>> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .rqtype =3D MEMTODEV,
>> > - =A0 =A0 =A0 }, {
>> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_PCM2_RX,
>> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .rqtype =3D DEVTOMEM,
>> > - =A0 =A0 =A0 }, {
>> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_PCM2_TX,
>> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .rqtype =3D MEMTODEV,
>> > - =A0 =A0 =A0 }, {
>> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_MSM_REQ0,
>> > - =A0 =A0 =A0 }, {
>> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_MSM_REQ2,
>> > - =A0 =A0 =A0 }, {
>> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_SPI0_RX,
>> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .rqtype =3D DEVTOMEM,
>> > - =A0 =A0 =A0 }, {
>> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_SPI0_TX,
>> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .rqtype =3D MEMTODEV,
>> > - =A0 =A0 =A0 }, {
>> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_SPI2_RX,
>> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .rqtype =3D DEVTOMEM,
>> > - =A0 =A0 =A0 }, {
>> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_SPI2_TX,
>> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .rqtype =3D MEMTODEV,
>> > - =A0 =A0 =A0 }, {
>> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_I2S0S_TX,
>> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .rqtype =3D MEMTODEV,
>> > - =A0 =A0 =A0 }, {
>> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_I2S0_RX,
>> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .rqtype =3D DEVTOMEM,
>> > - =A0 =A0 =A0 }, {
>> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_I2S0_TX,
>> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .rqtype =3D MEMTODEV,
>> > - =A0 =A0 =A0 }, {
>> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_UART0_RX,
>> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .rqtype =3D DEVTOMEM,
>> > - =A0 =A0 =A0 }, {
>> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_UART0_TX,
>> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .rqtype =3D MEMTODEV,
>> > - =A0 =A0 =A0 }, {
>> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_UART2_RX,
>> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .rqtype =3D DEVTOMEM,
>> > - =A0 =A0 =A0 }, {
>> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_UART2_TX,
>> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .rqtype =3D MEMTODEV,
>> > - =A0 =A0 =A0 }, {
>> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_UART4_RX,
>> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .rqtype =3D DEVTOMEM,
>> > - =A0 =A0 =A0 }, {
>> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_UART4_TX,
>> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .rqtype =3D MEMTODEV,
>> > - =A0 =A0 =A0 }, {
>> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_SLIMBUS0_RX,
>> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .rqtype =3D DEVTOMEM,
>> > - =A0 =A0 =A0 }, {
>> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_SLIMBUS0_TX,
>> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .rqtype =3D MEMTODEV,
>> > - =A0 =A0 =A0 }, {
>> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_SLIMBUS2_RX,
>> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .rqtype =3D DEVTOMEM,
>> > - =A0 =A0 =A0 }, {
>> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_SLIMBUS2_TX,
>> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .rqtype =3D MEMTODEV,
>> > - =A0 =A0 =A0 }, {
>> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_SLIMBUS4_RX,
>> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .rqtype =3D DEVTOMEM,
>> > - =A0 =A0 =A0 }, {
>> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_SLIMBUS4_TX,
>> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .rqtype =3D MEMTODEV,
>> > - =A0 =A0 =A0 }, {
>> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_AC97_MICIN,
>> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .rqtype =3D DEVTOMEM,
>> > - =A0 =A0 =A0 }, {
>> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_AC97_PCMIN,
>> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .rqtype =3D DEVTOMEM,
>> > - =A0 =A0 =A0 }, {
>> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_AC97_PCMOUT,
>> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .rqtype =3D MEMTODEV,
>> > - =A0 =A0 =A0 },
>> > +u8 pdma0_peri[] =3D {
>> > + =A0 =A0 =A0 DMACH_PCM0_RX,
>> > + =A0 =A0 =A0 DMACH_PCM0_TX,
>> > + =A0 =A0 =A0 DMACH_PCM2_RX,
>> > + =A0 =A0 =A0 DMACH_PCM2_TX,
>> > + =A0 =A0 =A0 DMACH_MSM_REQ0,
>> > + =A0 =A0 =A0 DMACH_MSM_REQ2,
>> > + =A0 =A0 =A0 DMACH_SPI0_RX,
>> > + =A0 =A0 =A0 DMACH_SPI0_TX,
>> > + =A0 =A0 =A0 DMACH_SPI2_RX,
>> > + =A0 =A0 =A0 DMACH_SPI2_TX,
>> > + =A0 =A0 =A0 DMACH_I2S0S_TX,
>> > + =A0 =A0 =A0 DMACH_I2S0_RX,
>> > + =A0 =A0 =A0 DMACH_I2S0_TX,
>>
>> As you have suggested, I have rechecked the platform data for all s5=
p
>> platforms in this patchset. Here, DMACH_I2S2_RX (event id 13) and
>> DMACH_I2S2_TX (event id 14) of DMAC[0] are missing as per the
>> exynos4210 user manual. But these where missing in the original code
>> as well which this patch modified. If possible, could you please let
>> me know if DMACH_I2S2_RX and DMACH_I2S2_TX are indeed event id 13 an=
d
>> 14 in DMAC[0].
>
> Yes, DMACH_I2S2_RX and DMACH_I2X2_TX are missed from my patch.
> Can you modify it although you are inconvenient ?

Thank you for letting me know about these event numbers.

Yes. I can modify this patch and s5pc100 patch for Anca's comment and
send these two updated patches after testing.

Thanks,
Thomas.

>
> Thanks..
> Boojin
>
>>
>> I have rechecked the other s5p platform data for dmac (s5p64x0,
>> s5pc100, s5pv210). Apart from the typo pointed out by Anca for
>> s5pc100, there are no other issues.
>>
>> Thanks,
>> Thomas.
>>
>> > + =A0 =A0 =A0 DMACH_UART0_RX,
>> > + =A0 =A0 =A0 DMACH_UART0_TX,
>> > + =A0 =A0 =A0 DMACH_UART2_RX,
>> > + =A0 =A0 =A0 DMACH_UART2_TX,
>> > + =A0 =A0 =A0 DMACH_UART4_RX,
>> > + =A0 =A0 =A0 DMACH_UART4_TX,
>> > + =A0 =A0 =A0 DMACH_SLIMBUS0_RX,
>> > + =A0 =A0 =A0 DMACH_SLIMBUS0_TX,
>> > + =A0 =A0 =A0 DMACH_SLIMBUS2_RX,
>> > + =A0 =A0 =A0 DMACH_SLIMBUS2_TX,
>> > + =A0 =A0 =A0 DMACH_SLIMBUS4_RX,
>> > + =A0 =A0 =A0 DMACH_SLIMBUS4_TX,
>> > + =A0 =A0 =A0 DMACH_AC97_MICIN,
>> > + =A0 =A0 =A0 DMACH_AC97_PCMIN,
>> > + =A0 =A0 =A0 DMACH_AC97_PCMOUT,
>> > =A0};
>> >
>> > =A0struct dma_pl330_platdata exynos4_pdma0_pdata =3D {
>> > =A0 =A0 =A0 =A0.nr_valid_peri =3D ARRAY_SIZE(pdma0_peri),
>> > - =A0 =A0 =A0 .peri =3D pdma0_peri,
>> > + =A0 =A0 =A0 .peri_id =3D pdma0_peri,
>> > =A0};
>> >
>>
>> [...]
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-
>> samsung-soc" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
>
>
