From: Giridhar Maruthy <giridhar.maruthy@linaro.org>
Subject: Re: [PATCH] I2C: EXYNOS: Add slave support to i2c
Date: Tue, 4 Dec 2012 07:46:56 +0900
Message-ID: <CAHuqX+GoS+zA-WiEnO9c8wNCaeNjJO1TPH-wNQCUv4BZ6JyThQ@mail.gmail.com>
References: <1354354961-28833-1-git-send-email-giridhar.maruthy@linaro.org>
 <CAHuqX+EQ0pZnm27yAVqC=NRX8huQ5EvbC8PGn2G3xYw4D71gQA@mail.gmail.com>
 <CAH9JG2VU7gLU-tdhUcGYtkn3aE5+CePKZD7U0OhpDMgJjARWyw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3322951267022153691=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAH9JG2VU7gLU-tdhUcGYtkn3aE5+CePKZD7U0OhpDMgJjARWyw@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kyungmin Park <kmpark@infradead.org>
Cc: linux-samsung-soc@vger.kernel.org, w.sang@pengutronix.de, linux-kernel@vger.kernel.org, kgene.kim@samsung.com, linux-i2c@vger.kernel.org, ben-linux@fluff.org, khali@linux-fr.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

--===============3322951267022153691==
Content-Type: multipart/alternative; boundary=047d7b625236c7793204cffa86f1

--047d7b625236c7793204cffa86f1
Content-Type: text/plain; charset=ISO-8859-1

Thank you Kyungmin Park for the review.

On 3 December 2012 22:28, Kyungmin Park <kmpark@infradead.org> wrote:

> Hi,
>
> On Mon, Dec 3, 2012 at 9:16 PM, Giridhar Maruthy
> <giridhar.maruthy@linaro.org> wrote:
> > This patch adds slave support to i2c. The dt entry i2c-mode
> > decides at probe time if the controller needs to work in
> > slave mode and the controller is accordingly programmed.
> >
> > Signed-off-by: Giridhar Maruthy <giridhar.maruthy@linaro.org>
> > ---
> >  drivers/i2c/busses/i2c-s3c2410.c |  100
> > ++++++++++++++++++++++++++------------
> >  1 file changed, 68 insertions(+), 32 deletions(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-s3c2410.c
> > b/drivers/i2c/busses/i2c-s3c2410.c
> > index e93e7d6..d83a6d7 100644
> > --- a/drivers/i2c/busses/i2c-s3c2410.c
> > +++ b/drivers/i2c/busses/i2c-s3c2410.c
> > @@ -53,6 +53,9 @@
> >  /* Max time to wait for bus to become idle after a xfer (in us) */
> >  #define S3C2410_IDLE_TIMEOUT   5000
> >
> > +/* To find the master/slave mode of current controller */
> > +#define is_master(i2c) (!i2c->i2c_mode)
> > +
> >  /* i2c controller state */
> >  enum s3c24xx_i2c_state {
> >         STATE_IDLE,
> > @@ -89,6 +92,8 @@ struct s3c24xx_i2c {
> >  #ifdef CONFIG_CPU_FREQ
> >         struct notifier_block   freq_transition;
> >  #endif
> > +       /* i2c_mode: 0 is for master; and 1 is for slave */
> > +       unsigned int            i2c_mode;
> If it's used for master or not, doesn't better to use 'is_master' or
> 'is_slave'? what's the meaning of 'i2c_mode'?
> and
> #define is_master(i2c) (i2c->is_master)
>

I thought mode indicates master mode or slave mode, but I agree 'is_master'
name is better. Will change that.

>
> Thank you,
> Kyungmin Park
>  >  };
> >
> >  static struct platform_device_id s3c24xx_driver_ids[] = {
> > @@ -202,11 +207,21 @@ static void s3c24xx_i2c_message_start(struct
> > s3c24xx_i2c *i2c,
> >         stat = 0;
> >         stat |=  S3C2410_IICSTAT_TXRXEN;
> >
> > -       if (msg->flags & I2C_M_RD) {
> > -               stat |= S3C2410_IICSTAT_MASTER_RX;
> > -               addr |= 1;
> > -       } else
> > -               stat |= S3C2410_IICSTAT_MASTER_TX;
> > +       if (is_master(i2c)) {
> > +               /* Master mode */
> > +               if (msg->flags & I2C_M_RD) {
> > +                       stat |= S3C2410_IICSTAT_MASTER_RX;
> > +                       addr |= 1;
> > +               } else
> > +                       stat |= S3C2410_IICSTAT_MASTER_TX;
> > +       } else {
> > +               /* Slave mode */
> > +               if (msg->flags & I2C_M_RD) {
> > +                       stat |= S3C2410_IICSTAT_SLAVE_RX;
> > +                       addr |= 1;
> > +               } else
> > +                       stat |= S3C2410_IICSTAT_SLAVE_TX;
> > +       }
> >
> >         if (msg->flags & I2C_M_REV_DIR_ADDR)
> >                 addr ^= 1;
> > @@ -228,8 +243,10 @@ static void s3c24xx_i2c_message_start(struct
> > s3c24xx_i2c *i2c,
> >         dev_dbg(i2c->dev, "iiccon, %08lx\n", iiccon);
> >         writel(iiccon, i2c->regs + S3C2410_IICCON);
> >
> > -       stat |= S3C2410_IICSTAT_START;
> > -       writel(stat, i2c->regs + S3C2410_IICSTAT);
> > +       if (is_master(i2c)) {
> > +               stat |= S3C2410_IICSTAT_START;
> > +               writel(stat, i2c->regs + S3C2410_IICSTAT);
> > +       }
> >  }
> >
> >  static inline void s3c24xx_i2c_stop(struct s3c24xx_i2c *i2c, int ret)
> > @@ -272,14 +289,19 @@ static inline void s3c24xx_i2c_stop(struct
> s3c24xx_i2c
> > *i2c, int ret)
> >          * devices, the host as Master and the HDMIPHY device as the
> slave.
> >          * Skipping the STOP condition has been tested on this bus and
> > works.
> >          */
> > -       if (i2c->quirks & QUIRK_HDMIPHY) {
> > -               /* Stop driving the I2C pins */
> > -               iicstat &= ~S3C2410_IICSTAT_TXRXEN;
> > -       } else {
> > -               /* stop the transfer */
> > -               iicstat &= ~S3C2410_IICSTAT_START;
> > +       if (is_master(i2c)) {
> > +               if (i2c->quirks & QUIRK_HDMIPHY) {
> > +                       /* Stop driving the I2C pins */
> > +                       iicstat &= ~S3C2410_IICSTAT_TXRXEN;
> > +               } else {
> > +                       /* stop the transfer */
> > +                       if (is_master(i2c)) {
> > +                               /* Start/Stop required only for master */
> > +                               iicstat &= ~S3C2410_IICSTAT_START;
> > +                       }
> > +               }
> > +               writel(iicstat, i2c->regs + S3C2410_IICSTAT);
> >         }
> > -       writel(iicstat, i2c->regs + S3C2410_IICSTAT);
> >
> >         i2c->state = STATE_STOP;
> >
> > @@ -348,7 +370,8 @@ static int i2c_s3c_irq_nextbyte(struct s3c24xx_i2c
> *i2c,
> > unsigned long iicstat)
> >                  */
> >
> >                 if (iicstat & S3C2410_IICSTAT_LASTBIT &&
> > -                   !(i2c->msg->flags & I2C_M_IGNORE_NAK)) {
> > +                   !(i2c->msg->flags & I2C_M_IGNORE_NAK) &&
> > +                   is_master(i2c)) {
> >                         /* ack was not received... */
> >
> >                         dev_dbg(i2c->dev, "ack was not received\n");
> > @@ -380,7 +403,7 @@ static int i2c_s3c_irq_nextbyte(struct s3c24xx_i2c
> *i2c,
> > unsigned long iicstat)
> >                  * end of the message, and if so, work out what to do
> >                  */
> >
> > -               if (!(i2c->msg->flags & I2C_M_IGNORE_NAK)) {
> > +               if (!(i2c->msg->flags & I2C_M_IGNORE_NAK) &&
> is_master(i2c))
> > {
> >                         if (iicstat & S3C2410_IICSTAT_LASTBIT) {
> >                                 dev_dbg(i2c->dev, "WRITE: No Ack\n");
> >
> > @@ -432,7 +455,6 @@ static int i2c_s3c_irq_nextbyte(struct s3c24xx_i2c
> *i2c,
> > unsigned long iicstat)
> >
> >                 } else {
> >                         /* send stop */
> > -
> >                         s3c24xx_i2c_stop(i2c, 0);
> >                 }
> >                 break;
> > @@ -447,7 +469,7 @@ static int i2c_s3c_irq_nextbyte(struct s3c24xx_i2c
> *i2c,
> > unsigned long iicstat)
> >                 i2c->msg->buf[i2c->msg_ptr++] = byte;
> >
> >   prepare_read:
> > -               if (is_msglast(i2c)) {
> > +               if (is_msglast(i2c) && is_master(i2c)) {
> >                         /* last byte of buffer */
> >
> >                         if (is_lastmsg(i2c))
> > @@ -612,11 +634,13 @@ static int s3c24xx_i2c_doxfer(struct s3c24xx_i2c
> *i2c,
> >         if (i2c->suspended)
> >                 return -EIO;
> >
> > -       ret = s3c24xx_i2c_set_master(i2c);
> > -       if (ret != 0) {
> > -               dev_err(i2c->dev, "cannot get bus (error %d)\n", ret);
> > -               ret = -EAGAIN;
> > -               goto out;
> > +       if (is_master(i2c)) {
> > +               ret = s3c24xx_i2c_set_master(i2c);
> > +               if (ret != 0) {
> > +                       dev_err(i2c->dev, "cannot get bus (error %d)\n",
> > ret);
> > +                       ret = -EAGAIN;
> > +                       goto out;
> > +               }
> >         }
> >
> >         i2c->msg     = msgs;
> > @@ -628,23 +652,29 @@ static int s3c24xx_i2c_doxfer(struct s3c24xx_i2c
> *i2c,
> >         s3c24xx_i2c_enable_irq(i2c);
> >         s3c24xx_i2c_message_start(i2c, msgs);
> >
> > -       timeout = wait_event_timeout(i2c->wait, i2c->msg_num == 0, HZ *
> 5);
> > +       if (is_master(i2c))
> > +               timeout = wait_event_timeout(i2c->wait,\
> > +                               i2c->msg_num == 0, HZ * 5);
> > +       else
> > +               wait_event_interruptible(i2c->wait, i2c->msg_num == 0);
> >
> >         ret = i2c->msg_idx;
> >
> >         /* having these next two as dev_err() makes life very
> >          * noisy when doing an i2cdetect */
> >
> > -       if (timeout == 0)
> > -               dev_dbg(i2c->dev, "timeout\n");
> > -       else if (ret != num)
> > -               dev_dbg(i2c->dev, "incomplete xfer (%d)\n", ret);
> > +       if (is_master(i2c)) {
> > +               if (timeout == 0)
> > +                       dev_dbg(i2c->dev, "timeout\n");
> > +               else if (ret != num)
> > +                       dev_dbg(i2c->dev, "incomplete xfer (%d)\n", ret);
> >
> > -       /* For QUIRK_HDMIPHY, bus is already disabled */
> > -       if (i2c->quirks & QUIRK_HDMIPHY)
> > -               goto out;
> > +               /* For QUIRK_HDMIPHY, bus is already disabled */
> > +               if (i2c->quirks & QUIRK_HDMIPHY)
> > +                       goto out;
> >
> > -       s3c24xx_i2c_wait_idle(i2c);
> > +               s3c24xx_i2c_wait_idle(i2c);
> > +       }
> >
> >   out:
> >         return ret;
> > @@ -963,6 +993,7 @@ s3c24xx_i2c_parse_dt(struct device_node *np, struct
> > s3c24xx_i2c *i2c)
> >         of_property_read_u32(np, "samsung,i2c-slave-addr",
> > &pdata->slave_addr);
> >         of_property_read_u32(np, "samsung,i2c-max-bus-freq",
> >                                 (u32 *)&pdata->frequency);
> > +       of_property_read_u32(np, "samsung,i2c-mode", &i2c->i2c_mode);
> >  }
> >  #else
> >  static void
> > @@ -1004,6 +1035,10 @@ static int s3c24xx_i2c_probe(struct
> platform_device
> > *pdev)
> >                 goto err_noclk;
> >         }
> >
> > +       /* By default, i2c works in master mode */
> > +       /* This currently will be updated using DT */
> > +       i2c->i2c_mode   = 0;
> > +
> >         i2c->quirks = s3c24xx_get_device_quirks(pdev);
> >         if (pdata)
> >                 memcpy(i2c->pdata, pdata, sizeof(*pdata));
> > @@ -1017,6 +1052,7 @@ static int s3c24xx_i2c_probe(struct platform_device
> > *pdev)
> >         i2c->adap.class   = I2C_CLASS_HWMON | I2C_CLASS_SPD;
> >         i2c->tx_setup     = 50;
> >
> > +
> >         init_waitqueue_head(&i2c->wait);
> >
> >         /* find the clock and enable it */
> > --
> > 1.7.9.5
> >
> >
> >
> > _______________________________________________
> > linux-arm-kernel mailing list
> > linux-arm-kernel@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> >
>

--047d7b625236c7793204cffa86f1
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Thank you Kyungmin Park for the review.<br><br>
<div class=3D"gmail_quote">On 3 December 2012 22:28, Kyungmin Park <span di=
r=3D"ltr">&lt;<a href=3D"mailto:kmpark@infradead.org" target=3D"_blank">kmp=
ark@infradead.org</a>&gt;</span> wrote:<br>
<blockquote style=3D"BORDER-LEFT:#ccc 1px solid;MARGIN:0px 0px 0px 0.8ex;PA=
DDING-LEFT:1ex" class=3D"gmail_quote">Hi,<br>
<div>
<div class=3D"h5"><br>On Mon, Dec 3, 2012 at 9:16 PM, Giridhar Maruthy<br>&=
lt;<a href=3D"mailto:giridhar.maruthy@linaro.org">giridhar.maruthy@linaro.o=
rg</a>&gt; wrote:<br>&gt; This patch adds slave support to i2c. The dt entr=
y i2c-mode<br>
&gt; decides at probe time if the controller needs to work in<br>&gt; slave=
 mode and the controller is accordingly programmed.<br>&gt;<br>&gt; Signed-=
off-by: Giridhar Maruthy &lt;<a href=3D"mailto:giridhar.maruthy@linaro.org"=
>giridhar.maruthy@linaro.org</a>&gt;<br>
&gt; ---<br>&gt; =A0drivers/i2c/busses/i2c-s3c2410.c | =A0100<br>&gt; +++++=
+++++++++++++++++++++------------<br>&gt; =A01 file changed, 68 insertions(=
+), 32 deletions(-)<br>&gt;<br>&gt; diff --git a/drivers/i2c/busses/i2c-s3c=
2410.c<br>
&gt; b/drivers/i2c/busses/i2c-s3c2410.c<br>&gt; index e93e7d6..d83a6d7 1006=
44<br>&gt; --- a/drivers/i2c/busses/i2c-s3c2410.c<br>&gt; +++ b/drivers/i2c=
/busses/i2c-s3c2410.c<br>&gt; @@ -53,6 +53,9 @@<br>&gt; =A0/* Max time to w=
ait for bus to become idle after a xfer (in us) */<br>
&gt; =A0#define S3C2410_IDLE_TIMEOUT =A0 5000<br>&gt;<br>&gt; +/* To find t=
he master/slave mode of current controller */<br>&gt; +#define is_master(i2=
c) (!i2c-&gt;i2c_mode)<br>&gt; +<br>&gt; =A0/* i2c controller state */<br>&=
gt; =A0enum s3c24xx_i2c_state {<br>
&gt; =A0 =A0 =A0 =A0 STATE_IDLE,<br>&gt; @@ -89,6 +92,8 @@ struct s3c24xx_i=
2c {<br>&gt; =A0#ifdef CONFIG_CPU_FREQ<br>&gt; =A0 =A0 =A0 =A0 struct notif=
ier_block =A0 freq_transition;<br>&gt; =A0#endif<br>&gt; + =A0 =A0 =A0 /* i=
2c_mode: 0 is for master; and 1 is for slave */<br>
&gt; + =A0 =A0 =A0 unsigned int =A0 =A0 =A0 =A0 =A0 =A0i2c_mode;<br></div><=
/div>If it&#39;s used for master or not, doesn&#39;t better to use &#39;is_=
master&#39; or<br>&#39;is_slave&#39;? what&#39;s the meaning of &#39;i2c_mo=
de&#39;?<br>and<br>
#define is_master(i2c) (i2c-&gt;is_master)<br></blockquote>
<div>=A0</div>
<div>I thought mode indicates master mode or slave mode, but I agree &#39;i=
s_master&#39; name is better. Will change that.</div>
<blockquote style=3D"BORDER-LEFT:#ccc 1px solid;MARGIN:0px 0px 0px 0.8ex;PA=
DDING-LEFT:1ex" class=3D"gmail_quote"><br>Thank you,<br>Kyungmin Park<br>
<div>
<div class=3D"h5">&gt; =A0};<br>&gt;<br>&gt; =A0static struct platform_devi=
ce_id s3c24xx_driver_ids[] =3D {<br>&gt; @@ -202,11 +207,21 @@ static void =
s3c24xx_i2c_message_start(struct<br>&gt; s3c24xx_i2c *i2c,<br>&gt; =A0 =A0 =
=A0 =A0 stat =3D 0;<br>
&gt; =A0 =A0 =A0 =A0 stat |=3D =A0S3C2410_IICSTAT_TXRXEN;<br>&gt;<br>&gt; -=
 =A0 =A0 =A0 if (msg-&gt;flags &amp; I2C_M_RD) {<br>&gt; - =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 stat |=3D S3C2410_IICSTAT_MASTER_RX;<br>&gt; - =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 addr |=3D 1;<br>&gt; - =A0 =A0 =A0 } else<br>
&gt; - =A0 =A0 =A0 =A0 =A0 =A0 =A0 stat |=3D S3C2410_IICSTAT_MASTER_TX;<br>=
&gt; + =A0 =A0 =A0 if (is_master(i2c)) {<br>&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 /* Master mode */<br>&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (msg-&gt;fla=
gs &amp; I2C_M_RD) {<br>&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
stat |=3D S3C2410_IICSTAT_MASTER_RX;<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 addr |=3D 1;<br>&gt; + =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 } else<br>&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 stat |=3D S3C2410_IICSTAT_MASTER_TX;<br>&gt; + =A0 =A0 =A0 =
} else {<br>&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Slave mode */<br>&gt; + =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 if (msg-&gt;flags &amp; I2C_M_RD) {<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 stat |=3D S3C2410_IICSTA=
T_SLAVE_RX;<br>&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 addr |=3D=
 1;<br>&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 } else<br>&gt; + =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 stat |=3D S3C2410_IICSTAT_SLAVE_TX;<br>&gt; + =
=A0 =A0 =A0 }<br>
&gt;<br>&gt; =A0 =A0 =A0 =A0 if (msg-&gt;flags &amp; I2C_M_REV_DIR_ADDR)<br=
>&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 addr ^=3D 1;<br>&gt; @@ -228,8 +243,1=
0 @@ static void s3c24xx_i2c_message_start(struct<br>&gt; s3c24xx_i2c *i2c,=
<br>&gt; =A0 =A0 =A0 =A0 dev_dbg(i2c-&gt;dev, &quot;iiccon, %08lx\n&quot;, =
iiccon);<br>
&gt; =A0 =A0 =A0 =A0 writel(iiccon, i2c-&gt;regs + S3C2410_IICCON);<br>&gt;=
<br>&gt; - =A0 =A0 =A0 stat |=3D S3C2410_IICSTAT_START;<br>&gt; - =A0 =A0 =
=A0 writel(stat, i2c-&gt;regs + S3C2410_IICSTAT);<br>&gt; + =A0 =A0 =A0 if =
(is_master(i2c)) {<br>&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 stat |=3D S3C2410_=
IICSTAT_START;<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 writel(stat, i2c-&gt;regs + S3C2410_IICS=
TAT);<br>&gt; + =A0 =A0 =A0 }<br>&gt; =A0}<br>&gt;<br>&gt; =A0static inline=
 void s3c24xx_i2c_stop(struct s3c24xx_i2c *i2c, int ret)<br>&gt; @@ -272,14=
 +289,19 @@ static inline void s3c24xx_i2c_stop(struct s3c24xx_i2c<br>
&gt; *i2c, int ret)<br>&gt; =A0 =A0 =A0 =A0 =A0* devices, the host as Maste=
r and the HDMIPHY device as the slave.<br>&gt; =A0 =A0 =A0 =A0 =A0* Skippin=
g the STOP condition has been tested on this bus and<br>&gt; works.<br>&gt;=
 =A0 =A0 =A0 =A0 =A0*/<br>
&gt; - =A0 =A0 =A0 if (i2c-&gt;quirks &amp; QUIRK_HDMIPHY) {<br>&gt; - =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 /* Stop driving the I2C pins */<br>&gt; - =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 iicstat &amp;=3D ~S3C2410_IICSTAT_TXRXEN;<br>&gt; - =A0=
 =A0 =A0 } else {<br>&gt; - =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* stop the transfe=
r */<br>
&gt; - =A0 =A0 =A0 =A0 =A0 =A0 =A0 iicstat &amp;=3D ~S3C2410_IICSTAT_START;=
<br>&gt; + =A0 =A0 =A0 if (is_master(i2c)) {<br>&gt; + =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 if (i2c-&gt;quirks &amp; QUIRK_HDMIPHY) {<br>&gt; + =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Stop driving the I2C pins */<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 iicstat &amp;=3D ~S3C241=
0_IICSTAT_TXRXEN;<br>&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 } else {<br>&gt; + =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* stop the transfer */<br>&gt;=
 + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (is_master(i2c)) {<br>&gt=
; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Start/St=
op required only for master */<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 iicstat =
&amp;=3D ~S3C2410_IICSTAT_START;<br>&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 }<br>&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }<br>&gt; + =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 writel(iicstat, i2c-&gt;regs + S3C2410_IICSTAT);<br>&gt; =
=A0 =A0 =A0 =A0 }<br>
&gt; - =A0 =A0 =A0 writel(iicstat, i2c-&gt;regs + S3C2410_IICSTAT);<br>&gt;=
<br>&gt; =A0 =A0 =A0 =A0 i2c-&gt;state =3D STATE_STOP;<br>&gt;<br>&gt; @@ -=
348,7 +370,8 @@ static int i2c_s3c_irq_nextbyte(struct s3c24xx_i2c *i2c,<br=
>&gt; unsigned long iicstat)<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*/<br>&gt;<br>&gt; =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 if (iicstat &amp; S3C2410_IICSTAT_LASTBIT &amp;&amp;<br>&gt=
; - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 !(i2c-&gt;msg-&gt;flags &amp; I2C_M=
_IGNORE_NAK)) {<br>&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 !(i2c-&gt;msg=
-&gt;flags &amp; I2C_M_IGNORE_NAK) &amp;&amp;<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 is_master(i2c)) {<br>&gt; =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* ack was not received... */<b=
r>&gt;<br>&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_dbg(i2c-=
&gt;dev, &quot;ack was not received\n&quot;);<br>&gt; @@ -380,7 +403,7 @@ s=
tatic int i2c_s3c_irq_nextbyte(struct s3c24xx_i2c *i2c,<br>
&gt; unsigned long iicstat)<br>&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* en=
d of the message, and if so, work out what to do<br>&gt; =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0*/<br>&gt;<br>&gt; - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!(i=
2c-&gt;msg-&gt;flags &amp; I2C_M_IGNORE_NAK)) {<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!(i2c-&gt;msg-&gt;flags &amp; I2C_M_=
IGNORE_NAK) &amp;&amp; is_master(i2c))<br>&gt; {<br>&gt; =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (iicstat &amp; S3C2410_IICSTAT_LASTBIT) =
{<br>&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 d=
ev_dbg(i2c-&gt;dev, &quot;WRITE: No Ack\n&quot;);<br>
&gt;<br>&gt; @@ -432,7 +455,6 @@ static int i2c_s3c_irq_nextbyte(struct s3c=
24xx_i2c *i2c,<br>&gt; unsigned long iicstat)<br>&gt;<br>&gt; =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 } else {<br>&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 /* send stop */<br>&gt; -<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c24xx_i2c_stop(i2c, =
0);<br>&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }<br>&gt; =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 break;<br>&gt; @@ -447,7 +469,7 @@ static int i2c_s3c_irq_nextb=
yte(struct s3c24xx_i2c *i2c,<br>&gt; unsigned long iicstat)<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 i2c-&gt;msg-&gt;buf[i2c-&gt;msg_ptr++]=
 =3D byte;<br>&gt;<br>&gt; =A0 prepare_read:<br>&gt; - =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 if (is_msglast(i2c)) {<br>&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (is=
_msglast(i2c) &amp;&amp; is_master(i2c)) {<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* last byte of buffer=
 */<br>&gt;<br>&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (is_=
lastmsg(i2c))<br>&gt; @@ -612,11 +634,13 @@ static int s3c24xx_i2c_doxfer(s=
truct s3c24xx_i2c *i2c,<br>&gt; =A0 =A0 =A0 =A0 if (i2c-&gt;suspended)<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EIO;<br>&gt;<br>&gt; - =A0 =A0=
 =A0 ret =3D s3c24xx_i2c_set_master(i2c);<br>&gt; - =A0 =A0 =A0 if (ret !=
=3D 0) {<br>&gt; - =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(i2c-&gt;dev, &quot;c=
annot get bus (error %d)\n&quot;, ret);<br>&gt; - =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 ret =3D -EAGAIN;<br>
&gt; - =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto out;<br>&gt; + =A0 =A0 =A0 if (is_m=
aster(i2c)) {<br>&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D s3c24xx_i2c_set=
_master(i2c);<br>&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (ret !=3D 0) {<br>&g=
t; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(i2c-&gt;dev, &quot=
;cannot get bus (error %d)\n&quot;,<br>
&gt; ret);<br>&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -E=
AGAIN;<br>&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto out;<br>&=
gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }<br>&gt; =A0 =A0 =A0 =A0 }<br>&gt;<br>&g=
t; =A0 =A0 =A0 =A0 i2c-&gt;msg =A0 =A0 =3D msgs;<br>&gt; @@ -628,23 +652,29=
 @@ static int s3c24xx_i2c_doxfer(struct s3c24xx_i2c *i2c,<br>
&gt; =A0 =A0 =A0 =A0 s3c24xx_i2c_enable_irq(i2c);<br>&gt; =A0 =A0 =A0 =A0 s=
3c24xx_i2c_message_start(i2c, msgs);<br>&gt;<br>&gt; - =A0 =A0 =A0 timeout =
=3D wait_event_timeout(i2c-&gt;wait, i2c-&gt;msg_num =3D=3D 0, HZ * 5);<br>=
&gt; + =A0 =A0 =A0 if (is_master(i2c))<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 timeout =3D wait_event_timeout(i2c-&gt;w=
ait,\<br>&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 i2c-&gt;msg_num =3D=3D 0, HZ * 5);<br>&gt; + =A0 =A0 =A0 else<br>&gt; + =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 wait_event_interruptible(i2c-&gt;wait, i2c-&gt;=
msg_num =3D=3D 0);<br>
&gt;<br>&gt; =A0 =A0 =A0 =A0 ret =3D i2c-&gt;msg_idx;<br>&gt;<br>&gt; =A0 =
=A0 =A0 =A0 /* having these next two as dev_err() makes life very<br>&gt; =
=A0 =A0 =A0 =A0 =A0* noisy when doing an i2cdetect */<br>&gt;<br>&gt; - =A0=
 =A0 =A0 if (timeout =3D=3D 0)<br>&gt; - =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_db=
g(i2c-&gt;dev, &quot;timeout\n&quot;);<br>
&gt; - =A0 =A0 =A0 else if (ret !=3D num)<br>&gt; - =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 dev_dbg(i2c-&gt;dev, &quot;incomplete xfer (%d)\n&quot;, ret);<br>&gt;=
 + =A0 =A0 =A0 if (is_master(i2c)) {<br>&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
if (timeout =3D=3D 0)<br>&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 dev_dbg(i2c-&gt;dev, &quot;timeout\n&quot;);<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 else if (ret !=3D num)<br>&gt; + =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_dbg(i2c-&gt;dev, &quot;incomplete =
xfer (%d)\n&quot;, ret);<br>&gt;<br>&gt; - =A0 =A0 =A0 /* For QUIRK_HDMIPHY=
, bus is already disabled */<br>&gt; - =A0 =A0 =A0 if (i2c-&gt;quirks &amp;=
 QUIRK_HDMIPHY)<br>
&gt; - =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto out;<br>&gt; + =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 /* For QUIRK_HDMIPHY, bus is already disabled */<br>&gt; + =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 if (i2c-&gt;quirks &amp; QUIRK_HDMIPHY)<br>&gt; + =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto out;<br>&gt;<br>
&gt; - =A0 =A0 =A0 s3c24xx_i2c_wait_idle(i2c);<br>&gt; + =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 s3c24xx_i2c_wait_idle(i2c);<br>&gt; + =A0 =A0 =A0 }<br>&gt;<br>=
&gt; =A0 out:<br>&gt; =A0 =A0 =A0 =A0 return ret;<br>&gt; @@ -963,6 +993,7 =
@@ s3c24xx_i2c_parse_dt(struct device_node *np, struct<br>
&gt; s3c24xx_i2c *i2c)<br>&gt; =A0 =A0 =A0 =A0 of_property_read_u32(np, &qu=
ot;samsung,i2c-slave-addr&quot;,<br>&gt; &amp;pdata-&gt;slave_addr);<br>&gt=
; =A0 =A0 =A0 =A0 of_property_read_u32(np, &quot;samsung,i2c-max-bus-freq&q=
uot;,<br>&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 (u32 *)&amp;pdata-&gt;frequency);<br>
&gt; + =A0 =A0 =A0 of_property_read_u32(np, &quot;samsung,i2c-mode&quot;, &=
amp;i2c-&gt;i2c_mode);<br>&gt; =A0}<br>&gt; =A0#else<br>&gt; =A0static void=
<br>&gt; @@ -1004,6 +1035,10 @@ static int s3c24xx_i2c_probe(struct platfor=
m_device<br>
&gt; *pdev)<br>&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto err_noclk;<br>&gt;=
 =A0 =A0 =A0 =A0 }<br>&gt;<br>&gt; + =A0 =A0 =A0 /* By default, i2c works i=
n master mode */<br>&gt; + =A0 =A0 =A0 /* This currently will be updated us=
ing DT */<br>&gt; + =A0 =A0 =A0 i2c-&gt;i2c_mode =A0 =3D 0;<br>
&gt; +<br>&gt; =A0 =A0 =A0 =A0 i2c-&gt;quirks =3D s3c24xx_get_device_quirks=
(pdev);<br>&gt; =A0 =A0 =A0 =A0 if (pdata)<br>&gt; =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 memcpy(i2c-&gt;pdata, pdata, sizeof(*pdata));<br>&gt; @@ -1017,6 +1=
052,7 @@ static int s3c24xx_i2c_probe(struct platform_device<br>
&gt; *pdev)<br>&gt; =A0 =A0 =A0 =A0 i2c-&gt;adap.class =A0 =3D I2C_CLASS_HW=
MON | I2C_CLASS_SPD;<br>&gt; =A0 =A0 =A0 =A0 i2c-&gt;tx_setup =A0 =A0 =3D 5=
0;<br>&gt;<br>&gt; +<br>&gt; =A0 =A0 =A0 =A0 init_waitqueue_head(&amp;i2c-&=
gt;wait);<br>&gt;<br>&gt; =A0 =A0 =A0 =A0 /* find the clock and enable it *=
/<br>
&gt; --<br>&gt; 1.7.9.5<br>&gt;<br>&gt;<br>&gt;<br></div></div>&gt; _______=
________________________________________<br>&gt; linux-arm-kernel mailing l=
ist<br>&gt; <a href=3D"mailto:linux-arm-kernel@lists.infradead.org">linux-a=
rm-kernel@lists.infradead.org</a><br>
&gt; <a href=3D"http://lists.infradead.org/mailman/listinfo/linux-arm-kerne=
l" target=3D"_blank">http://lists.infradead.org/mailman/listinfo/linux-arm-=
kernel</a><br>&gt;<br></blockquote></div><br>

--047d7b625236c7793204cffa86f1--


--===============3322951267022153691==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============3322951267022153691==--
