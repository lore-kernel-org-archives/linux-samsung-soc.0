From: Alim Akhtar <alim.akhtar@gmail.com>
Subject: Re: [PATCH 12/15] spi/s3c64xx: Add support DMA engine API
Date: Fri, 19 Aug 2011 16:00:49 +0530
Message-ID: <CAGOxZ51uW6Gnr3o4rhgJaZXM7ZbbgM1hyejbNeWPNVM_Q_78vQ@mail.gmail.com>
References: <1311744697-10264-1-git-send-email-boojin.kim@samsung.com>
 <1311744697-10264-13-git-send-email-boojin.kim@samsung.com>
 <CABb+yY3-d0xTO+s0cCPXPW8qGpTH5G2U+bp-0z4Se47eVvJ__w@mail.gmail.com> <CAGOxZ53BRa1=Bnb==jNg_dD0XT2pMSPo=QoHF++LnT6r5kO_Mw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vw0-f46.google.com ([209.85.212.46]:40281 "EHLO
	mail-vw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752054Ab1HSKba convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 19 Aug 2011 06:31:30 -0400
Received: by vws1 with SMTP id 1so2276167vws.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 19 Aug 2011 03:31:29 -0700 (PDT)
In-Reply-To: <CAGOxZ53BRa1=Bnb==jNg_dD0XT2pMSPo=QoHF++LnT6r5kO_Mw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jassi Brar <jassisinghbrar@gmail.com>, Boojin Kim <boojin.kim@samsung.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, Vinod Koul <vinod.koul@intel.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Grant Likely <grant.likely@secretlab.ca>, linux-samsung-soc@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>, banajit.g@samsung.com, viresh kumar <viresh.kumar@st.com>

On Tue, Aug 9, 2011 at 9:43 AM, Alim Akhtar <alim.akhtar@gmail.com> wro=
te:
> On Mon, Aug 8, 2011 at 11:17 PM, Jassi Brar <jassisinghbrar@gmail.com=
> wrote:
>> On Wed, Jul 27, 2011 at 11:01 AM, Boojin Kim <boojin.kim@samsung.com=
> wrote:
>>> This patch adds to support DMA generic API to transfer raw
>>> SPI data. Basiclly the spi driver uses DMA generic API if
>>> architecture supports it. Otherwise, uses Samsung specific
>>> S3C-PL330 APIs.
>>>
>>> Signed-off-by: Boojin Kim <boojin.kim@samsung.com>
>>> Acked-by: Grant Likely <grant.likely@secretlab.ca>
>>> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
>>> ---
>>> =A0drivers/spi/spi_s3c64xx.c | =A0141 ++++++++++++++++++++++-------=
----------------
>>> =A01 files changed, 69 insertions(+), 72 deletions(-)
>>>
>>> diff --git a/drivers/spi/spi_s3c64xx.c b/drivers/spi/spi_s3c64xx.c
>>> index 8945e20..a4cf76a 100644
>>> --- a/drivers/spi/spi_s3c64xx.c
>>> +++ b/drivers/spi/spi_s3c64xx.c
>>> @@ -172,6 +172,9 @@ struct s3c64xx_spi_driver_data {
>>> =A0 =A0 =A0 =A0unsigned =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0state;
>>> =A0 =A0 =A0 =A0unsigned =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0cur_mode, cur_bpw;
>>> =A0 =A0 =A0 =A0unsigned =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0cur_speed;
>>> + =A0 =A0 =A0 unsigned =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0rx_ch;
>>> + =A0 =A0 =A0 unsigned =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0tx_ch;
>>> + =A0 =A0 =A0 struct samsung_dma_ops =A0 =A0 =A0 =A0 =A0*ops;
>>> =A0};
>>>
>>> =A0static struct s3c2410_dma_client s3c64xx_spi_dma_client =3D {
>>> @@ -227,6 +230,38 @@ static void flush_fifo(struct s3c64xx_spi_driv=
er_data *sdd)
>>> =A0 =A0 =A0 =A0writel(val, regs + S3C64XX_SPI_CH_CFG);
>>> =A0}
>>>
>>> +static void s3c64xx_spi_dma_rxcb(void *data)
>>> +{
>>> + =A0 =A0 =A0 struct s3c64xx_spi_driver_data *sdd
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =3D (struct s3c64xx_spi_driver_data *=
)data;
>> void* doesn't need typecasting (same for all such occurances)
>> IIRC someone already pointed it out?
>>
>>
>>> + =A0 =A0 =A0 unsigned long flags;
>>> +
>>> + =A0 =A0 =A0 spin_lock_irqsave(&sdd->lock, flags);
>>> +
>>> + =A0 =A0 =A0 sdd->state &=3D ~RXBUSY;
>>> + =A0 =A0 =A0 /* If the other done */
>>> + =A0 =A0 =A0 if (!(sdd->state & TXBUSY))
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 complete(&sdd->xfer_completion);
>>> +
>>> + =A0 =A0 =A0 spin_unlock_irqrestore(&sdd->lock, flags);
>>> +}
>>> +
>>> +static void s3c64xx_spi_dma_txcb(void *data)
>>> +{
>>> + =A0 =A0 =A0 struct s3c64xx_spi_driver_data *sdd
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =3D (struct s3c64xx_spi_driver_data *=
)data;
>>> + =A0 =A0 =A0 unsigned long flags;
>>> +
>>> + =A0 =A0 =A0 spin_lock_irqsave(&sdd->lock, flags);
>>> +
>>> + =A0 =A0 =A0 sdd->state &=3D ~TXBUSY;
>>> + =A0 =A0 =A0 /* If the other done */
>>> + =A0 =A0 =A0 if (!(sdd->state & RXBUSY))
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 complete(&sdd->xfer_completion);
>>> +
>>> + =A0 =A0 =A0 spin_unlock_irqrestore(&sdd->lock, flags);
>>> +}
>>> +
>>> =A0static void enable_datapath(struct s3c64xx_spi_driver_data *sdd,
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0stru=
ct spi_device *spi,
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0stru=
ct spi_transfer *xfer, int dma_mode)
>>> @@ -234,6 +269,7 @@ static void enable_datapath(struct s3c64xx_spi_=
driver_data *sdd,
>>> =A0 =A0 =A0 =A0struct s3c64xx_spi_info *sci =3D sdd->cntrlr_info;
>>> =A0 =A0 =A0 =A0void __iomem *regs =3D sdd->regs;
>>> =A0 =A0 =A0 =A0u32 modecfg, chcfg;
>>> + =A0 =A0 =A0 struct samsung_dma_prep_info info;
>>>
>>> =A0 =A0 =A0 =A0modecfg =3D readl(regs + S3C64XX_SPI_MODE_CFG);
>>> =A0 =A0 =A0 =A0modecfg &=3D ~(S3C64XX_SPI_MODE_TXDMA_ON | S3C64XX_S=
PI_MODE_RXDMA_ON);
>>> @@ -259,10 +295,14 @@ static void enable_datapath(struct s3c64xx_sp=
i_driver_data *sdd,
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0chcfg |=3D S3C64XX_SPI_CH_TXCH_ON;
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (dma_mode) {
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0modecfg |=3D S3C64XX=
_SPI_MODE_TXDMA_ON;
>>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c2410_dma_config(sd=
d->tx_dmach, sdd->cur_bpw / 8);
>>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c2410_dma_enqueue(s=
dd->tx_dmach, (void *)sdd,
>>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 xfer->tx_dma, xfer->len);
>>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c2410_dma_ctrl(sdd-=
>tx_dmach, S3C2410_DMAOP_START);
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 info.cap =3D DMA_SLAV=
E;
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 info.direction =3D DM=
A_TO_DEVICE;
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 info.buf =3D xfer->tx=
_dma;
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 info.len =3D xfer->le=
n;
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 info.fp =3D s3c64xx_s=
pi_dma_txcb;
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 info.fp_param =3D sdd=
;
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 sdd->ops->prepare(sdd=
->tx_ch, &info);
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 sdd->ops->trigger(sdd=
->tx_ch);
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0} else {
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0switch (sdd->cur_bpw=
) {
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0case 32:
>>> @@ -294,10 +334,14 @@ static void enable_datapath(struct s3c64xx_sp=
i_driver_data *sdd,
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0writel(((xfer->len *=
 8 / sdd->cur_bpw) & 0xffff)
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0| S3C64XX_SPI_PACKET_CNT_EN,
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0regs + S3C64XX_SPI_PACKET_CNT);
>>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c2410_dma_config(sd=
d->rx_dmach, sdd->cur_bpw / 8);
>>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c2410_dma_enqueue(s=
dd->rx_dmach, (void *)sdd,
>>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 xfer->rx_dma, xfer->len);
>>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c2410_dma_ctrl(sdd-=
>rx_dmach, S3C2410_DMAOP_START);
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 info.cap =3D DMA_SLAV=
E;
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 info.direction =3D DM=
A_FROM_DEVICE;
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 info.buf =3D xfer->rx=
_dma;
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 info.len =3D xfer->le=
n;
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 info.fp =3D s3c64xx_s=
pi_dma_rxcb;
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 info.fp_param =3D sdd=
;
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 sdd->ops->prepare(sdd=
->rx_ch, &info);
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 sdd->ops->trigger(sdd=
->rx_ch);
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
>>> =A0 =A0 =A0 =A0}
>>>
>>> @@ -483,46 +527,6 @@ static void s3c64xx_spi_config(struct s3c64xx_=
spi_driver_data *sdd)
>>> =A0 =A0 =A0 =A0}
>>> =A0}
>>>
>>> -static void s3c64xx_spi_dma_rxcb(struct s3c2410_dma_chan *chan, vo=
id *buf_id,
>>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0in=
t size, enum s3c2410_dma_buffresult res)
>>> -{
>>> - =A0 =A0 =A0 struct s3c64xx_spi_driver_data *sdd =3D buf_id;
>>> - =A0 =A0 =A0 unsigned long flags;
>>> -
>>> - =A0 =A0 =A0 spin_lock_irqsave(&sdd->lock, flags);
>>> -
>>> - =A0 =A0 =A0 if (res =3D=3D S3C2410_RES_OK)
>>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 sdd->state &=3D ~RXBUSY;
>>> - =A0 =A0 =A0 else
>>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(&sdd->pdev->dev, "DmaAbrtRx-%=
d\n", size);
>>> -
>>> - =A0 =A0 =A0 /* If the other done */
>>> - =A0 =A0 =A0 if (!(sdd->state & TXBUSY))
>>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 complete(&sdd->xfer_completion);
>>> -
>>> - =A0 =A0 =A0 spin_unlock_irqrestore(&sdd->lock, flags);
>>> -}
>>> -
>>> -static void s3c64xx_spi_dma_txcb(struct s3c2410_dma_chan *chan, vo=
id *buf_id,
>>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0in=
t size, enum s3c2410_dma_buffresult res)
>>> -{
>>> - =A0 =A0 =A0 struct s3c64xx_spi_driver_data *sdd =3D buf_id;
>>> - =A0 =A0 =A0 unsigned long flags;
>>> -
>>> - =A0 =A0 =A0 spin_lock_irqsave(&sdd->lock, flags);
>>> -
>>> - =A0 =A0 =A0 if (res =3D=3D S3C2410_RES_OK)
>>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 sdd->state &=3D ~TXBUSY;
>>> - =A0 =A0 =A0 else
>>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(&sdd->pdev->dev, "DmaAbrtTx-%=
d \n", size);
>>> -
>>> - =A0 =A0 =A0 /* If the other done */
>>> - =A0 =A0 =A0 if (!(sdd->state & RXBUSY))
>>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 complete(&sdd->xfer_completion);
>>> -
>>> - =A0 =A0 =A0 spin_unlock_irqrestore(&sdd->lock, flags);
>>> -}
>>> -
>>> =A0#define XFER_DMAADDR_INVALID DMA_BIT_MASK(32)
>>>
>>> =A0static int s3c64xx_spi_map_mssg(struct s3c64xx_spi_driver_data *=
sdd,
>>> @@ -697,12 +701,10 @@ static void handle_msg(struct s3c64xx_spi_dri=
ver_data *sdd,
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (use_dma) {
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (=
xfer->tx_buf !=3D NULL
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0&& (sdd->state & TXBUSY))
>>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 s3c2410_dma_ctrl(sdd->tx_dmach,
>>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 S3C2410_DMAOP_FLUSH);
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 sdd->ops->stop(sdd->tx_ch);
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (=
xfer->rx_buf !=3D NULL
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0&& (sdd->state & RXBUSY))
>>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 s3c2410_dma_ctrl(sdd->rx_dmach,
>>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 S3C2410_DMAOP_FLUSH);
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 sdd->ops->stop(sdd->rx_ch);
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
>>>
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto out;
>>> @@ -742,24 +744,19 @@ out:
>>>
>>> =A0static int acquire_dma(struct s3c64xx_spi_driver_data *sdd)
>>> =A0{
>>> - =A0 =A0 =A0 if (s3c2410_dma_request(sdd->rx_dmach,
>>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 &s3c64xx_spi_dma_client, NULL) < 0) {
>>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(&sdd->pdev->dev, "cannot get =
RxDMA\n");
>>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 0;
>>> - =A0 =A0 =A0 }
>>> - =A0 =A0 =A0 s3c2410_dma_set_buffdone_fn(sdd->rx_dmach, s3c64xx_sp=
i_dma_rxcb);
>>> - =A0 =A0 =A0 s3c2410_dma_devconfig(sdd->rx_dmach, S3C2410_DMASRC_H=
W,
>>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 sdd->sfr_start + S3C64XX_SPI_RX_DATA);
>>> -
>>> - =A0 =A0 =A0 if (s3c2410_dma_request(sdd->tx_dmach,
>>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 &s3c64xx_spi_dma_client, NULL) < 0) {
>>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(&sdd->pdev->dev, "cannot get =
TxDMA\n");
>>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c2410_dma_free(sdd->rx_dmach, &s3c6=
4xx_spi_dma_client);
>>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 0;
>>> - =A0 =A0 =A0 }
>>> - =A0 =A0 =A0 s3c2410_dma_set_buffdone_fn(sdd->tx_dmach, s3c64xx_sp=
i_dma_txcb);
>>> - =A0 =A0 =A0 s3c2410_dma_devconfig(sdd->tx_dmach, S3C2410_DMASRC_M=
EM,
>>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 sdd->sfr_start + S3C64XX_SPI_TX_DATA);
>>> +
>>> + =A0 =A0 =A0 struct samsung_dma_info info;
>>> + =A0 =A0 =A0 sdd->ops =3D samsung_dma_get_ops();
>>> +
>>> + =A0 =A0 =A0 info.cap =3D DMA_SLAVE;
>>> + =A0 =A0 =A0 info.client =3D &s3c64xx_spi_dma_client;
>>> + =A0 =A0 =A0 info.direction =3D DMA_FROM_DEVICE;
>>> + =A0 =A0 =A0 info.fifo =3D sdd->sfr_start + S3C64XX_SPI_RX_DATA;
>>> + =A0 =A0 =A0 info.width =3D sdd->cur_bpw / 8;
>>> + =A0 =A0 =A0 sdd->rx_ch =3D sdd->ops->request(sdd->rx_dmach, &info=
);
>>> + =A0 =A0 =A0 info.direction =3D DMA_TO_DEVICE;
>>> + =A0 =A0 =A0 info.fifo =3D sdd->sfr_start + S3C64XX_SPI_TX_DATA;
>>> + =A0 =A0 =A0 sdd->tx_ch =3D sdd->ops->request(sdd->tx_dmach, &info=
);
>>>
>>> =A0 =A0 =A0 =A0return 1;
>>> =A0}
>>> @@ -800,8 +797,8 @@ static void s3c64xx_spi_work(struct work_struct=
 *work)
>>> =A0 =A0 =A0 =A0spin_unlock_irqrestore(&sdd->lock, flags);
>>>
>>> =A0 =A0 =A0 =A0/* Free DMA channels */
>>> - =A0 =A0 =A0 s3c2410_dma_free(sdd->tx_dmach, &s3c64xx_spi_dma_clie=
nt);
>>> - =A0 =A0 =A0 s3c2410_dma_free(sdd->rx_dmach, &s3c64xx_spi_dma_clie=
nt);
>>> + =A0 =A0 =A0 sdd->ops->release(sdd->rx_ch, &s3c64xx_spi_dma_client=
);
>>> + =A0 =A0 =A0 sdd->ops->release(sdd->tx_ch, &s3c64xx_spi_dma_client=
);
>>> =A0}
>>
>> Btw, this spi driver is for S3C64xx(with pl080) and S5P(with pl330)
>> series, both of which
>> have DMAENGINE drivers. May be it could be directly switched to usin=
g
>> those, rather than
>> via Samsung's wrapper driver.
>> Or am I overlooking something ?
> Exactly, spi_s3c64xx.c (including Sound driver) can not be used with
> pl080 and pl330 (DMAENGINE drivers) as it is.
> Recently I was trying to use PL080 DMAENGINE driver, and i was ended
> up using some #ifdef in the spi driver.
> something like
> #ifdef CONFIG_PL080
> sdd->tx_dmac.bus_id =3D dmatx_res->name;
> sdd->rx_dmac.bus_id =3D dmarx_res->name;
> #else
> sdd->tx_dmac.bus_id =3D dmatx_res->start;
> sdd->tx_dmac.bus_id =3D dmatx_res->start;
> #endif
>
> This is because, Pl080 handle the channel as a char *(name) and pl330
> expect the channel to be enum (a number).
>
> I think the solution could be changes in the either of these drivers
> to follow some symmetry or we will be ending up with
> two client driver for the same device or writing up some unnecessary
> warper code or finally using some #ifdef.
>
> Please suggest if you guys have any other idea/approach to handle suc=
h
> kind of situation.
>
> Below is the git diff of spi_s3c64xx driver using with PL080 DMAENGIN=
E driver.
> This patch is against kgene's next-samsung-dma-v4
> ---------------------------------------------------------------------=
---------------------------------------------
> diff --git a/drivers/spi/spi_s3c64xx.c b/drivers/spi/spi_s3c64xx.c
> index a4cf76a..f7b9c37 100644
> --- a/drivers/spi/spi_s3c64xx.c
> +++ b/drivers/spi/spi_s3c64xx.c
> @@ -24,6 +24,7 @@
> =A0#include <linux/delay.h>
> =A0#include <linux/clk.h>
> =A0#include <linux/dma-mapping.h>
> +#include <linux/amba/pl08x.h>
> =A0#include <linux/platform_device.h>
> =A0#include <linux/spi/spi.h>
>
> @@ -165,8 +166,13 @@ struct s3c64xx_spi_driver_data {
> =A0 =A0 =A0 =A0struct work_struct =A0 =A0 =A0 =A0 =A0 =A0 =A0work;
> =A0 =A0 =A0 =A0struct list_head =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0queue;
> =A0 =A0 =A0 =A0spinlock_t =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
lock;
> +#ifdef CONFIG_DMADEV_PL080
> + =A0 =A0 =A0 struct pl08x_channel_data =A0 =A0 =A0 rx_dmach;
> + =A0 =A0 =A0 struct pl08x_channel_data =A0 =A0 =A0 tx_dmach;
> +#else
> =A0 =A0 =A0 =A0enum dma_ch =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 rx=
_dmach;
> =A0 =A0 =A0 =A0enum dma_ch =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 tx=
_dmach;
> +#endif
> =A0 =A0 =A0 =A0unsigned long =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 sfr_=
start;
> =A0 =A0 =A0 =A0struct completion =A0 =A0 =A0 =A0 =A0 =A0 =A0 xfer_com=
pletion;
> =A0 =A0 =A0 =A0unsigned =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
state;
> @@ -753,10 +759,18 @@ static int acquire_dma(struct
> s3c64xx_spi_driver_data *sdd)
> =A0 =A0 =A0 =A0info.direction =3D DMA_FROM_DEVICE;
> =A0 =A0 =A0 =A0info.fifo =3D sdd->sfr_start + S3C64XX_SPI_RX_DATA;
> =A0 =A0 =A0 =A0info.width =3D sdd->cur_bpw / 8;
> +#ifdef CONFIG_DMADEV_PL080
> + =A0 =A0 =A0 sdd->rx_ch =3D sdd->ops->request(sdd->rx_dmach.bus_id, =
&info);
> +#else
> =A0 =A0 =A0 =A0sdd->rx_ch =3D sdd->ops->request(sdd->rx_dmach, &info)=
;
> +#endif
> =A0 =A0 =A0 =A0info.direction =3D DMA_TO_DEVICE;
> =A0 =A0 =A0 =A0info.fifo =3D sdd->sfr_start + S3C64XX_SPI_TX_DATA;
> - =A0 =A0 =A0 sdd->tx_ch =3D sdd->ops->request(sdd->tx_dmach, &info);
> +#ifdef CONFIG_DMADEV_PL080
> + =A0 =A0 =A0 sdd->tx_ch =3D sdd->ops->request(sdd->tx_dmach.bus_id, =
&info);
> +#else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 sdd->tx_ch =3D sdd->ops->request(sdd->t=
x_dmach, &info);
> +#endif
>
> =A0 =A0 =A0 =A0return 1;
> =A0}
> @@ -982,7 +996,6 @@ static int __init s3c64xx_spi_probe(struct
> platform_device *pdev)
> =A0 =A0 =A0 =A0}
>
> =A0 =A0 =A0 =A0/* Check for availability of necessary resource */
> -
> =A0 =A0 =A0 =A0dmatx_res =3D platform_get_resource(pdev, IORESOURCE_D=
MA, 0);
> =A0 =A0 =A0 =A0if (dmatx_res =3D=3D NULL) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dev_err(&pdev->dev, "Unable to get SPI=
-Tx dma resource\n");
> @@ -1015,9 +1028,13 @@ static int __init s3c64xx_spi_probe(struct
> platform_device *pdev)
> =A0 =A0 =A0 =A0sdd->cntrlr_info =3D sci;
> =A0 =A0 =A0 =A0sdd->pdev =3D pdev;
> =A0 =A0 =A0 =A0sdd->sfr_start =3D mem_res->start;
> +#ifdef CONFIG_DMADEV_PL080
> + =A0 =A0 =A0 sdd->tx_dmach.bus_id =3D dmatx_res->name;
> + =A0 =A0 =A0 sdd->rx_dmach.bus_id =3D dmarx_res->name;
> +#else
> =A0 =A0 =A0 =A0sdd->tx_dmach =3D dmatx_res->start;
> =A0 =A0 =A0 =A0sdd->rx_dmach =3D dmarx_res->start;
> -
> +#endif
> =A0 =A0 =A0 =A0sdd->cur_bpw =3D 8;
>
> =A0 =A0 =A0 =A0master->bus_num =3D pdev->id;
> @@ -1105,7 +1122,6 @@ static int __init s3c64xx_spi_probe(struct
> platform_device *pdev)
> =A0 =A0 =A0 =A0dev_dbg(&pdev->dev, "\tIOmem=3D[0x%x-0x%x]\tDMA=3D[Rx-=
%d, Tx-%d]\n",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0mem_res->end, mem_res->start,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0sdd->rx_dmach, sdd->tx_dmach);
> -
> =A0 =A0 =A0 =A0return 0;
>
> =A0err8:
> ---------------------------------------------------------------------=
-------------------------------------------------
>
Hi All,
Any suggestions/comments on my concerns?

Thanks!
> Regards,
> Alim
>
>
>
>> _______________________________________________
>> linux-arm-kernel mailing list
>> linux-arm-kernel@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>>
>
