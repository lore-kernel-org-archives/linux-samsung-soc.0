From: Naveen Krishna Ch <naveenkrishna.ch-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] i2c: exynos5: configure fifo_depth based on HSI2C
 module version
Date: Tue, 10 Dec 2013 10:26:40 +0530
Message-ID: <CAHfPSqCQZiMuH3S1eK2gqKShVjc+-BFZ8kkigTRDQyyETiPkQA@mail.gmail.com>
References: <1385100851-32254-1-git-send-email-ch.naveen@samsung.com> <1739891.MYO4PRtJOt@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1739891.MYO4PRtJOt@amdc1227>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, hs-ynQEQJNshbs@public.gmane.org, khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hello Tomasz,


On 9 December 2013 22:01, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
>
> Hi Naveen,
>
> On Friday 22 of November 2013 11:44:11 Naveen Krishna Chatradhi wrote:
> > fifo_depth of the HSI2C is not constant
> > Exynos5420 and Exynos5250 supports fifo_depth of 64bytes
> > Exynos5260 supports fifo_depth of 16bytes
> >
> > This patch configures the fifo_depth based on HSI2C modules version.
> > Signed-off-by: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> > ---
> >  drivers/i2c/busses/i2c-exynos5.c |   29 ++++++++++++++++++-----------
> >  1 file changed, 18 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-exynos5.c b/drivers/i2c/busses/i2c-exynos5.c
> > index cbb49e2..19277d8 100644
> > --- a/drivers/i2c/busses/i2c-exynos5.c
> > +++ b/drivers/i2c/busses/i2c-exynos5.c
> > @@ -77,12 +77,6 @@
> >  #define HSI2C_RXFIFO_TRIGGER_LEVEL(x)                ((x) << 4)
> >  #define HSI2C_TXFIFO_TRIGGER_LEVEL(x)                ((x) << 16)
> >
> > -/* As per user manual FIFO max depth is 64bytes */
> > -#define HSI2C_FIFO_MAX                               0x40
> > -/* default trigger levels for Tx and Rx FIFOs */
> > -#define HSI2C_DEF_TXFIFO_LVL                 (HSI2C_FIFO_MAX - 0x30)
> > -#define HSI2C_DEF_RXFIFO_LVL                 (HSI2C_FIFO_MAX - 0x10)
> > -
> >  /* I2C_TRAILING_CTL Register bits */
> >  #define HSI2C_TRAILING_COUNT                 (0xf)
> >
> > @@ -187,6 +181,9 @@ struct exynos5_i2c {
> >
> >       /* Version of HS-I2C Hardware */
> >       unsigned int            version;
> > +
> > +     /* FIFO depth */
> > +     unsigned int            fifo_depth;
> >  };
> >
> >  enum hsi2c_version {
> > @@ -437,7 +434,7 @@ static irqreturn_t exynos5_i2c_irq(int irqno, void *dev_id)
> >               fifo_status = readl(i2c->regs + HSI2C_FIFO_STATUS);
> >               fifo_level = HSI2C_TX_FIFO_LVL(fifo_status);
> >
> > -             len = HSI2C_FIFO_MAX - fifo_level;
> > +             len = i2c->fifo_depth - fifo_level;
> >               if (len > (i2c->msg->len - i2c->msg_ptr))
> >                       len = i2c->msg->len - i2c->msg_ptr;
> >
> > @@ -505,6 +502,7 @@ static void exynos5_i2c_message_start(struct exynos5_i2c *i2c, int stop)
> >       u32 i2c_auto_conf = 0;
> >       u32 fifo_ctl;
> >       unsigned long flags;
> > +     unsigned short trig_lvl;
> >
> >       i2c_ctl = readl(i2c->regs + HSI2C_CTL);
> >       i2c_ctl &= ~(HSI2C_TXCHON | HSI2C_RXCHON);
> > @@ -515,13 +513,19 @@ static void exynos5_i2c_message_start(struct exynos5_i2c *i2c, int stop)
> >
> >               i2c_auto_conf = HSI2C_READ_WRITE;
> >
> > -             fifo_ctl |= HSI2C_RXFIFO_TRIGGER_LEVEL(HSI2C_DEF_TXFIFO_LVL);
> > +             trig_lvl = (i2c->msg->len > i2c->fifo_depth) ?
> > +                     (i2c->fifo_depth * 3/4) : i2c->msg->len;
>
> This patch changes the fifo trigger level calculation (it's dependent now
> on message length), not just maximum fifo size, as the description says.
Actually, message->length need not be involved in this calculation.
Involving msg->len
will raise another interrupt for every small transactions. It better be avoided.
> It should be split into two separate patches, explaining why both changes
> are necessary.
I will split the fifo_depth configuration code along with comments addressed on
https://lkml.org/lkml/2013/11/22/31

I can think of 3 ways to address the h/w version changes
1. Compatible string as i implemented
2. Varient struct
3. Passing the information via device tree
How about passing fifo_depth from device tree information.

Currently, HSI2C Module on Exynso5260 is not another H/W version.
It only defer in fifo_depth and init sequence needs a reset.

>
>
> Best regards,
> Tomasz
>



-- 
Shine bright,
(: Nav :)
