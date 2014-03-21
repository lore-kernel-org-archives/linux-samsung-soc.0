From: Byungho An <bh74.an@samsung.com>
Subject: RE: [PATCH V8 4/7] net: sxgbe: add EEE(Energy Efficient Ethernet) for
 Samsung sxgbe
Date: Fri, 21 Mar 2014 07:24:28 -0700
Message-ID: <004601cf4511$46c8a970$d459fc50$@samsung.com>
References: <012f01cf4461$7ac68220$70538660$@samsung.com>
 <20140321110423.GN23372@e106331-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-reply-to: <20140321110423.GN23372@e106331-lin.cambridge.arm.com>
Content-language: en-us
Sender: netdev-owner@vger.kernel.org
To: 'Mark Rutland' <mark.rutland@arm.com>
Cc: 'netdev' <netdev@vger.kernel.org>, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 'David Miller' <davem@davemloft.net>, 'GIRISH K S' <ks.giri@samsung.com>, 'SIVAREDDY KALLAM' <siva.kallam@samsung.com>, 'Vipul Chandrakant' <vipul.pandya@samsung.com>, 'Ilho Lee' <ilho215.lee@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org


Mark Rutland <mark.rutland@arm.com> wrote:
> On Thu, Mar 20, 2014 at 05:26:06PM +0000, Byungho An wrote:
> > From: Girish K S <ks.giri@samsung.com>
> >
> > Added support for the EEE(Energy Efficient Ethernet) in 10G ethernet
driver.
> >
> > Signed-off-by: Girish K S <ks.giri@samsung.com>
> > Neatening-by: Joe Perches <joe@perches.com>
> > Signed-off-by: Byungho An <bh74.an@samsung.com>
> > ---
> >  drivers/net/ethernet/samsung/sxgbe/sxgbe_common.h  |   53 +++++++
> >  drivers/net/ethernet/samsung/sxgbe/sxgbe_core.c    |   86 +++++++++-
> >  drivers/net/ethernet/samsung/sxgbe/sxgbe_ethtool.c |   47 ++++++
> >  drivers/net/ethernet/samsung/sxgbe/sxgbe_main.c    |  165
> +++++++++++++++++++-
> >  .../net/ethernet/samsung/sxgbe/sxgbe_platform.c    |    4 +
> >  drivers/net/ethernet/samsung/sxgbe/sxgbe_reg.h     |    5 +
> >  6 files changed, 358 insertions(+), 2 deletions(-)
> 
> [...]
> 
> > diff --git a/drivers/net/ethernet/samsung/sxgbe/sxgbe_platform.c
> > b/drivers/net/ethernet/samsung/sxgbe/sxgbe_platform.c
> > index e410d84..b23ec57 100644
> > --- a/drivers/net/ethernet/samsung/sxgbe/sxgbe_platform.c
> > +++ b/drivers/net/ethernet/samsung/sxgbe/sxgbe_platform.c
> > @@ -160,6 +160,10 @@ static int sxgbe_platform_probe(struct
> platform_device *pdev)
> >                 }
> >         }
> >
> > +       priv->lpi_irq = irq_of_parse_and_map(dev->of_node, loop++);
> 
> You can use platform_get_irq(pdev, loop++) here. The interrupts have already
> been parsed elsewhere.
OK.

> 
> Cheers,
> Mark.
> --
> To unsubscribe from this list: send the line "unsubscribe netdev" in the
body of
> a message to majordomo@vger.kernel.org More majordomo info at
> http://vger.kernel.org/majordomo-info.html
