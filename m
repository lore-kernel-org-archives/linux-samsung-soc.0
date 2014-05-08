From: Byungho An <bh74.an@samsung.com>
Subject: RE: [PATCH] net: sxgbe: Added tail point update
Date: Thu, 08 May 2014 10:20:12 +0900
Message-ID: <002f01cf6a5b$a92e3660$fb8aa320$%an@samsung.com>
References: <008b01cf69cc$4d304e50$e790eaf0$%an@samsung.com>
 <CAGVrzcaic-rrbRg2CpvzpyTpt0iRtX9=QE8WLpR3Eep=8w5czQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <netdev-owner@vger.kernel.org>
In-reply-to: <CAGVrzcaic-rrbRg2CpvzpyTpt0iRtX9=QE8WLpR3Eep=8w5czQ@mail.gmail.com>
Content-language: ko
Sender: netdev-owner@vger.kernel.org
To: 'Florian Fainelli' <f.fainelli@gmail.com>
Cc: 'netdev' <netdev@vger.kernel.org>, linux-samsung-soc@vger.kernel.org, 'David Miller' <davem@davemloft.net>, "'ks.giri'" <ks.giri@samsung.com>, "'vipul.pandya'" <vipul.pandya@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org


Florian Fainelli wrote: 
> 2014-05-07 1:14 GMT-07:00 Byungho An <bh74.an@samsung.com>:
> >
> > This patch adds tail point update function for rx path
> > after rx_refill function. It indicates tail point for rx dma.
> >
> > Signed-off-by: Byungho An <bh74.an@samsung.com>
> > ---
> >  drivers/net/ethernet/samsung/sxgbe/sxgbe_dma.c  |   14 +++++++++++++-
> >  drivers/net/ethernet/samsung/sxgbe/sxgbe_dma.h  |    4 ++++
> >  drivers/net/ethernet/samsung/sxgbe/sxgbe_main.c |    5 +++++
> >  3 files changed, 22 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/net/ethernet/samsung/sxgbe/sxgbe_dma.c
> b/drivers/net/ethernet/samsung/sxgbe/sxgbe_dma.c
> > index 49240c9..249b0e0 100644
> > --- a/drivers/net/ethernet/samsung/sxgbe/sxgbe_dma.c
> > +++ b/drivers/net/ethernet/samsung/sxgbe/sxgbe_dma.c
> > @@ -112,7 +112,7 @@ static void sxgbe_dma_channel_init(void __iomem
> *ioaddr, int cha_num,
> >
> >         dma_addr = dma_rx + ((r_rsize - 1) * SXGBE_DESC_SIZE_BYTES);
> >         writel(lower_32_bits(dma_addr),
> > -              ioaddr + SXGBE_DMA_CHA_RXDESC_LADD_REG(cha_num));
> > +              ioaddr + SXGBE_DMA_CHA_RXDESC_TAILPTR_REG(cha_num));
> >         /* program the ring sizes */
> >         writel(t_rsize - 1, ioaddr +
> SXGBE_DMA_CHA_TXDESC_RINGLEN_REG(cha_num));
> >         writel(r_rsize - 1, ioaddr +
> SXGBE_DMA_CHA_RXDESC_RINGLEN_REG(cha_num));
> > @@ -370,6 +370,17 @@ static void sxgbe_enable_tso(void __iomem *ioaddr,
> u8 chan_num)
> >         writel(ctrl, ioaddr + SXGBE_DMA_CHA_TXCTL_REG(chan_num));
> >  }
> >
> > +static void sxgbe_dma_update_rxdesc_tail_ptr(void __iomem *ioaddr, u8
> chan_num,
> > +                                             dma_addr_t dma_rx_phy, int cur_rx,
> > +                                             int rxsize)
> 
> I think that at some point you should revisit your abstraction, all
> the patches that I see do take a void __iomem * argument as the first
> function argument, you should probably use your driver private context
> here. The day you support a different version of the hardware, there
> might be other differences that need to be taken care of.
> 
I agree with you, it would be more robust for different version of the hardware and make simple function argument.
But most functions of this driver deal with read/write register using ioaddr.
As of now I think it is enough but I'll consider it later.

[snip]

> 
> 
> --
> Florian
