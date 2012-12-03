From: Giridhar Maruthy <giridhar.maruthy@linaro.org>
Subject: [PATCH] I2C: EXYNOS: Add slave support to i2c
Date: Mon, 3 Dec 2012 21:16:22 +0900
Message-ID: <CAHuqX+EQ0pZnm27yAVqC=NRX8huQ5EvbC8PGn2G3xYw4D71gQA@mail.gmail.com>
References: <1354354961-28833-1-git-send-email-giridhar.maruthy@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1737196805838057481=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1354354961-28833-1-git-send-email-giridhar.maruthy@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: ben-linux@fluff.org, kgene.kim@samsung.com, khali@linux-fr.org, w.sang@pengutronix.de, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

--===============1737196805838057481==
Content-Type: multipart/alternative; boundary=047d7b604190b0c55104cff1b779

--047d7b604190b0c55104cff1b779
Content-Type: text/plain; charset=ISO-8859-1

This patch adds slave support to i2c. The dt entry i2c-mode
decides at probe time if the controller needs to work in
slave mode and the controller is accordingly programmed.

Signed-off-by: Giridhar Maruthy <giridhar.maruthy@linaro.org>
---
 drivers/i2c/busses/i2c-s3c2410.c |  100
++++++++++++++++++++++++++------------
 1 file changed, 68 insertions(+), 32 deletions(-)

diff --git a/drivers/i2c/busses/i2c-s3c2410.c
b/drivers/i2c/busses/i2c-s3c2410.c
index e93e7d6..d83a6d7 100644
--- a/drivers/i2c/busses/i2c-s3c2410.c
+++ b/drivers/i2c/busses/i2c-s3c2410.c
@@ -53,6 +53,9 @@
 /* Max time to wait for bus to become idle after a xfer (in us) */
 #define S3C2410_IDLE_TIMEOUT   5000

+/* To find the master/slave mode of current controller */
+#define is_master(i2c) (!i2c->i2c_mode)
+
 /* i2c controller state */
 enum s3c24xx_i2c_state {
        STATE_IDLE,
@@ -89,6 +92,8 @@ struct s3c24xx_i2c {
 #ifdef CONFIG_CPU_FREQ
        struct notifier_block   freq_transition;
 #endif
+       /* i2c_mode: 0 is for master; and 1 is for slave */
+       unsigned int            i2c_mode;
 };

 static struct platform_device_id s3c24xx_driver_ids[] = {
@@ -202,11 +207,21 @@ static void s3c24xx_i2c_message_start(struct
s3c24xx_i2c *i2c,
        stat = 0;
        stat |=  S3C2410_IICSTAT_TXRXEN;

-       if (msg->flags & I2C_M_RD) {
-               stat |= S3C2410_IICSTAT_MASTER_RX;
-               addr |= 1;
-       } else
-               stat |= S3C2410_IICSTAT_MASTER_TX;
+       if (is_master(i2c)) {
+               /* Master mode */
+               if (msg->flags & I2C_M_RD) {
+                       stat |= S3C2410_IICSTAT_MASTER_RX;
+                       addr |= 1;
+               } else
+                       stat |= S3C2410_IICSTAT_MASTER_TX;
+       } else {
+               /* Slave mode */
+               if (msg->flags & I2C_M_RD) {
+                       stat |= S3C2410_IICSTAT_SLAVE_RX;
+                       addr |= 1;
+               } else
+                       stat |= S3C2410_IICSTAT_SLAVE_TX;
+       }

        if (msg->flags & I2C_M_REV_DIR_ADDR)
                addr ^= 1;
@@ -228,8 +243,10 @@ static void s3c24xx_i2c_message_start(struct
s3c24xx_i2c *i2c,
        dev_dbg(i2c->dev, "iiccon, %08lx\n", iiccon);
        writel(iiccon, i2c->regs + S3C2410_IICCON);

-       stat |= S3C2410_IICSTAT_START;
-       writel(stat, i2c->regs + S3C2410_IICSTAT);
+       if (is_master(i2c)) {
+               stat |= S3C2410_IICSTAT_START;
+               writel(stat, i2c->regs + S3C2410_IICSTAT);
+       }
 }

 static inline void s3c24xx_i2c_stop(struct s3c24xx_i2c *i2c, int ret)
@@ -272,14 +289,19 @@ static inline void s3c24xx_i2c_stop(struct
s3c24xx_i2c *i2c, int ret)
         * devices, the host as Master and the HDMIPHY device as the slave.
         * Skipping the STOP condition has been tested on this bus and
works.
         */
-       if (i2c->quirks & QUIRK_HDMIPHY) {
-               /* Stop driving the I2C pins */
-               iicstat &= ~S3C2410_IICSTAT_TXRXEN;
-       } else {
-               /* stop the transfer */
-               iicstat &= ~S3C2410_IICSTAT_START;
+       if (is_master(i2c)) {
+               if (i2c->quirks & QUIRK_HDMIPHY) {
+                       /* Stop driving the I2C pins */
+                       iicstat &= ~S3C2410_IICSTAT_TXRXEN;
+               } else {
+                       /* stop the transfer */
+                       if (is_master(i2c)) {
+                               /* Start/Stop required only for master */
+                               iicstat &= ~S3C2410_IICSTAT_START;
+                       }
+               }
+               writel(iicstat, i2c->regs + S3C2410_IICSTAT);
        }
-       writel(iicstat, i2c->regs + S3C2410_IICSTAT);

        i2c->state = STATE_STOP;

@@ -348,7 +370,8 @@ static int i2c_s3c_irq_nextbyte(struct s3c24xx_i2c
*i2c, unsigned long iicstat)
                 */

                if (iicstat & S3C2410_IICSTAT_LASTBIT &&
-                   !(i2c->msg->flags & I2C_M_IGNORE_NAK)) {
+                   !(i2c->msg->flags & I2C_M_IGNORE_NAK) &&
+                   is_master(i2c)) {
                        /* ack was not received... */

                        dev_dbg(i2c->dev, "ack was not received\n");
@@ -380,7 +403,7 @@ static int i2c_s3c_irq_nextbyte(struct s3c24xx_i2c
*i2c, unsigned long iicstat)
                 * end of the message, and if so, work out what to do
                 */

-               if (!(i2c->msg->flags & I2C_M_IGNORE_NAK)) {
+               if (!(i2c->msg->flags & I2C_M_IGNORE_NAK) &&
is_master(i2c)) {
                        if (iicstat & S3C2410_IICSTAT_LASTBIT) {
                                dev_dbg(i2c->dev, "WRITE: No Ack\n");

@@ -432,7 +455,6 @@ static int i2c_s3c_irq_nextbyte(struct s3c24xx_i2c
*i2c, unsigned long iicstat)

                } else {
                        /* send stop */
-
                        s3c24xx_i2c_stop(i2c, 0);
                }
                break;
@@ -447,7 +469,7 @@ static int i2c_s3c_irq_nextbyte(struct s3c24xx_i2c
*i2c, unsigned long iicstat)
                i2c->msg->buf[i2c->msg_ptr++] = byte;

  prepare_read:
-               if (is_msglast(i2c)) {
+               if (is_msglast(i2c) && is_master(i2c)) {
                        /* last byte of buffer */

                        if (is_lastmsg(i2c))
@@ -612,11 +634,13 @@ static int s3c24xx_i2c_doxfer(struct s3c24xx_i2c *i2c,
        if (i2c->suspended)
                return -EIO;

-       ret = s3c24xx_i2c_set_master(i2c);
-       if (ret != 0) {
-               dev_err(i2c->dev, "cannot get bus (error %d)\n", ret);
-               ret = -EAGAIN;
-               goto out;
+       if (is_master(i2c)) {
+               ret = s3c24xx_i2c_set_master(i2c);
+               if (ret != 0) {
+                       dev_err(i2c->dev, "cannot get bus (error %d)\n",
ret);
+                       ret = -EAGAIN;
+                       goto out;
+               }
        }

        i2c->msg     = msgs;
@@ -628,23 +652,29 @@ static int s3c24xx_i2c_doxfer(struct s3c24xx_i2c *i2c,
        s3c24xx_i2c_enable_irq(i2c);
        s3c24xx_i2c_message_start(i2c, msgs);

-       timeout = wait_event_timeout(i2c->wait, i2c->msg_num == 0, HZ * 5);
+       if (is_master(i2c))
+               timeout = wait_event_timeout(i2c->wait,\
+                               i2c->msg_num == 0, HZ * 5);
+       else
+               wait_event_interruptible(i2c->wait, i2c->msg_num == 0);

        ret = i2c->msg_idx;

        /* having these next two as dev_err() makes life very
         * noisy when doing an i2cdetect */

-       if (timeout == 0)
-               dev_dbg(i2c->dev, "timeout\n");
-       else if (ret != num)
-               dev_dbg(i2c->dev, "incomplete xfer (%d)\n", ret);
+       if (is_master(i2c)) {
+               if (timeout == 0)
+                       dev_dbg(i2c->dev, "timeout\n");
+               else if (ret != num)
+                       dev_dbg(i2c->dev, "incomplete xfer (%d)\n", ret);

-       /* For QUIRK_HDMIPHY, bus is already disabled */
-       if (i2c->quirks & QUIRK_HDMIPHY)
-               goto out;
+               /* For QUIRK_HDMIPHY, bus is already disabled */
+               if (i2c->quirks & QUIRK_HDMIPHY)
+                       goto out;

-       s3c24xx_i2c_wait_idle(i2c);
+               s3c24xx_i2c_wait_idle(i2c);
+       }

  out:
        return ret;
@@ -963,6 +993,7 @@ s3c24xx_i2c_parse_dt(struct device_node *np, struct
s3c24xx_i2c *i2c)
        of_property_read_u32(np, "samsung,i2c-slave-addr",
&pdata->slave_addr);
        of_property_read_u32(np, "samsung,i2c-max-bus-freq",
                                (u32 *)&pdata->frequency);
+       of_property_read_u32(np, "samsung,i2c-mode", &i2c->i2c_mode);
 }
 #else
 static void
@@ -1004,6 +1035,10 @@ static int s3c24xx_i2c_probe(struct platform_device
*pdev)
                goto err_noclk;
        }

+       /* By default, i2c works in master mode */
+       /* This currently will be updated using DT */
+       i2c->i2c_mode   = 0;
+
        i2c->quirks = s3c24xx_get_device_quirks(pdev);
        if (pdata)
                memcpy(i2c->pdata, pdata, sizeof(*pdata));
@@ -1017,6 +1052,7 @@ static int s3c24xx_i2c_probe(struct platform_device
*pdev)
        i2c->adap.class   = I2C_CLASS_HWMON | I2C_CLASS_SPD;
        i2c->tx_setup     = 50;

+
        init_waitqueue_head(&i2c->wait);

        /* find the clock and enable it */
--
1.7.9.5

--047d7b604190b0c55104cff1b779
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">This patch adds slave support to i2c. The dt ent=
ry i2c-mode<br>decides at probe time if the controller needs to work in<br>=
slave mode and the controller is accordingly programmed.<br><br>Signed-off-=
by: Giridhar Maruthy &lt;<a href=3D"mailto:giridhar.maruthy@linaro.org" tar=
get=3D"_blank">giridhar.maruthy@linaro.org</a>&gt;<br>
---<br>=A0drivers/i2c/busses/i2c-s3c2410.c | =A0100 +++++++++++++++++++++++=
+++------------<br>=A01 file changed, 68 insertions(+), 32 deletions(-)<br>=
<br>diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-=
s3c2410.c<br>
index e93e7d6..d83a6d7 100644<br>--- a/drivers/i2c/busses/i2c-s3c2410.c<br>=
+++ b/drivers/i2c/busses/i2c-s3c2410.c<br>@@ -53,6 +53,9 @@<br>=A0/* Max ti=
me to wait for bus to become idle after a xfer (in us) */<br>=A0#define S3C=
2410_IDLE_TIMEOUT =A0 5000<br>
<br>+/* To find the master/slave mode of current controller */<br>+#define =
is_master(i2c) (!i2c-&gt;i2c_mode)<br>+<br>=A0/* i2c controller state */<br=
>=A0enum s3c24xx_i2c_state {<br>=A0 =A0 =A0 =A0 STATE_IDLE,<br>@@ -89,6 +92=
,8 @@ struct s3c24xx_i2c {<br>
=A0#ifdef CONFIG_CPU_FREQ<br>=A0 =A0 =A0 =A0 struct notifier_block =A0 freq=
_transition;<br>=A0#endif<br>+ =A0 =A0 =A0 /* i2c_mode: 0 is for master; an=
d 1 is for slave */<br>+ =A0 =A0 =A0 unsigned int =A0 =A0 =A0 =A0 =A0 =A0i2=
c_mode;<br>=A0};<br><br>=A0static struct platform_device_id s3c24xx_driver_=
ids[] =3D {<br>
@@ -202,11 +207,21 @@ static void s3c24xx_i2c_message_start(struct s3c24xx_=
i2c *i2c,<br>=A0 =A0 =A0 =A0 stat =3D 0;<br>=A0 =A0 =A0 =A0 stat |=3D =A0S3=
C2410_IICSTAT_TXRXEN;<br><br>- =A0 =A0 =A0 if (msg-&gt;flags &amp; I2C_M_RD=
) {<br>- =A0 =A0 =A0 =A0 =A0 =A0 =A0 stat |=3D S3C2410_IICSTAT_MASTER_RX;<b=
r>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 addr |=3D 1;<br>- =A0 =A0 =A0 } else<br>- =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 stat |=3D S3C2410_IICSTAT_MASTER_TX;<br>+ =A0 =A0 =
=A0 if (is_master(i2c)) {<br>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Master mode *=
/<br>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (msg-&gt;flags &amp; I2C_M_RD) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 stat |=3D S3C2410_IICSTAT_MAS=
TER_RX;<br>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 addr |=3D 1;<br>+ =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 } else<br>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 stat |=3D S3C2410_IICSTAT_MASTER_TX;<br>+ =A0 =A0 =A0 } else {<br>=
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Slave mode */<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (msg-&gt;flags &amp; I2C_M_RD) {<br>+ =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 stat |=3D S3C2410_IICSTAT_SLAVE_RX;=
<br>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 addr |=3D 1;<br>+ =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 } else<br>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 stat |=3D S3C2410_IICSTAT_SLAVE_TX;<br>
+ =A0 =A0 =A0 }<br><br>=A0 =A0 =A0 =A0 if (msg-&gt;flags &amp; I2C_M_REV_DI=
R_ADDR)<br>=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 addr ^=3D 1;<br>@@ -228,8 +243,1=
0 @@ static void s3c24xx_i2c_message_start(struct s3c24xx_i2c *i2c,<br>=A0 =
=A0 =A0 =A0 dev_dbg(i2c-&gt;dev, &quot;iiccon, %08lx\n&quot;, iiccon);<br>
=A0 =A0 =A0 =A0 writel(iiccon, i2c-&gt;regs + S3C2410_IICCON);<br><br>- =A0=
 =A0 =A0 stat |=3D S3C2410_IICSTAT_START;<br>- =A0 =A0 =A0 writel(stat, i2c=
-&gt;regs + S3C2410_IICSTAT);<br>+ =A0 =A0 =A0 if (is_master(i2c)) {<br>+ =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 stat |=3D S3C2410_IICSTAT_START;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 writel(stat, i2c-&gt;regs + S3C2410_IICSTAT);=
<br>+ =A0 =A0 =A0 }<br>=A0}<br><br>=A0static inline void s3c24xx_i2c_stop(s=
truct s3c24xx_i2c *i2c, int ret)<br>@@ -272,14 +289,19 @@ static inline voi=
d s3c24xx_i2c_stop(struct s3c24xx_i2c *i2c, int ret)<br>
=A0 =A0 =A0 =A0 =A0* devices, the host as Master and the HDMIPHY device as =
the slave.<br>=A0 =A0 =A0 =A0 =A0* Skipping the STOP condition has been tes=
ted on this bus and works.<br>=A0 =A0 =A0 =A0 =A0*/<br>- =A0 =A0 =A0 if (i2=
c-&gt;quirks &amp; QUIRK_HDMIPHY) {<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Stop driving the I2C pins */<br>- =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 iicstat &amp;=3D ~S3C2410_IICSTAT_TXRXEN;<br>- =A0 =A0 =
=A0 } else {<br>- =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* stop the transfer */<br>- =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 iicstat &amp;=3D ~S3C2410_IICSTAT_START;<br>
+ =A0 =A0 =A0 if (is_master(i2c)) {<br>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (i2=
c-&gt;quirks &amp; QUIRK_HDMIPHY) {<br>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 /* Stop driving the I2C pins */<br>+ =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 iicstat &amp;=3D ~S3C2410_IICSTAT_TXRXEN;<br>+ =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 } else {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* stop the transfer */<br>+ =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (is_master(i2c)) {<br>+ =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Start/Stop requi=
red only for master */<br>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 iicstat &amp;=3D ~S3C2410_IICSTAT_START;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }<br>+ =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 }<br>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 writel(iicstat, i2c-&gt;regs + S=
3C2410_IICSTAT);<br>=A0 =A0 =A0 =A0 }<br>- =A0 =A0 =A0 writel(iicstat, i2c-=
&gt;regs + S3C2410_IICSTAT);<br><br>=A0 =A0 =A0 =A0 i2c-&gt;state =3D STATE=
_STOP;<br>
<br>@@ -348,7 +370,8 @@ static int i2c_s3c_irq_nextbyte(struct s3c24xx_i2c =
*i2c, unsigned long iicstat)<br>=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*/<br><b=
r>=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (iicstat &amp; S3C2410_IICSTAT_LASTBIT=
 &amp;&amp;<br>- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 !(i2c-&gt;msg-&gt;flag=
s &amp; I2C_M_IGNORE_NAK)) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 !(i2c-&gt;msg-&gt;flags &amp; I2C_M_I=
GNORE_NAK) &amp;&amp;<br>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 is_master(i2=
c)) {<br>=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* ack was not rec=
eived... */<br><br>=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_dbg(=
i2c-&gt;dev, &quot;ack was not received\n&quot;);<br>
@@ -380,7 +403,7 @@ static int i2c_s3c_irq_nextbyte(struct s3c24xx_i2c *i2c=
, unsigned long iicstat)<br>=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* end of the=
 message, and if so, work out what to do<br>=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0*/<br><br>- =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!(i2c-&gt;msg-&gt;flags &am=
p; I2C_M_IGNORE_NAK)) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!(i2c-&gt;msg-&gt;flags &amp; I2C_M_IGNOR=
E_NAK) &amp;&amp; is_master(i2c)) {<br>=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 if (iicstat &amp; S3C2410_IICSTAT_LASTBIT) {<br>=A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_dbg(i2c-&gt;dev, &quot=
;WRITE: No Ack\n&quot;);<br>
<br>@@ -432,7 +455,6 @@ static int i2c_s3c_irq_nextbyte(struct s3c24xx_i2c =
*i2c, unsigned long iicstat)<br><br>=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 } else =
{<br>=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* send stop */<br>-<b=
r>=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c24xx_i2c_stop(i2c, 0);=
<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }<br>=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;=
<br>@@ -447,7 +469,7 @@ static int i2c_s3c_irq_nextbyte(struct s3c24xx_i2c =
*i2c, unsigned long iicstat)<br>=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 i2c-&gt;msg=
-&gt;buf[i2c-&gt;msg_ptr++] =3D byte;<br><br>=A0 prepare_read:<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (is_msglast(i2c)) {<br>+ =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 if (is_msglast(i2c) &amp;&amp; is_master(i2c)) {<br>=A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* last byte of buffer */<br><br>=A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (is_lastmsg(i2c))<br>@@ -612=
,11 +634,13 @@ static int s3c24xx_i2c_doxfer(struct s3c24xx_i2c *i2c,<br>
=A0 =A0 =A0 =A0 if (i2c-&gt;suspended)<br>=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 r=
eturn -EIO;<br><br>- =A0 =A0 =A0 ret =3D s3c24xx_i2c_set_master(i2c);<br>- =
=A0 =A0 =A0 if (ret !=3D 0) {<br>- =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(i2c-=
&gt;dev, &quot;cannot get bus (error %d)\n&quot;, ret);<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -EAGAIN;<br>- =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 goto out;<br>+ =A0 =A0 =A0 if (is_master(i2c)) {<br>+ =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 ret =3D s3c24xx_i2c_set_master(i2c);<br>+ =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 if (ret !=3D 0) {<br>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
dev_err(i2c-&gt;dev, &quot;cannot get bus (error %d)\n&quot;, ret);<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -EAGAIN;<br>+ =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto out;<br>+ =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 }<br>=A0 =A0 =A0 =A0 }<br><br>=A0 =A0 =A0 =A0 i2c-&gt;msg =A0 =A0 =3D =
msgs;<br>@@ -628,23 +652,29 @@ static int s3c24xx_i2c_doxfer(struct s3c24xx=
_i2c *i2c,<br>
=A0 =A0 =A0 =A0 s3c24xx_i2c_enable_irq(i2c);<br>=A0 =A0 =A0 =A0 s3c24xx_i2c=
_message_start(i2c, msgs);<br><br>- =A0 =A0 =A0 timeout =3D wait_event_time=
out(i2c-&gt;wait, i2c-&gt;msg_num =3D=3D 0, HZ * 5);<br>+ =A0 =A0 =A0 if (i=
s_master(i2c))<br>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 timeout =3D wait_event_time=
out(i2c-&gt;wait,\<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 i2c-&gt;msg_n=
um =3D=3D 0, HZ * 5);<br>+ =A0 =A0 =A0 else<br>+ =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 wait_event_interruptible(i2c-&gt;wait, i2c-&gt;msg_num =3D=3D 0);<br><b=
r>=A0 =A0 =A0 =A0 ret =3D i2c-&gt;msg_idx;<br><br>=A0 =A0 =A0 =A0 /* having=
 these next two as dev_err() makes life very<br>
=A0 =A0 =A0 =A0 =A0* noisy when doing an i2cdetect */<br><br>- =A0 =A0 =A0 =
if (timeout =3D=3D 0)<br>- =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_dbg(i2c-&gt;dev,=
 &quot;timeout\n&quot;);<br>- =A0 =A0 =A0 else if (ret !=3D num)<br>- =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 dev_dbg(i2c-&gt;dev, &quot;incomplete xfer (%d)\n&q=
uot;, ret);<br>
+ =A0 =A0 =A0 if (is_master(i2c)) {<br>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (ti=
meout =3D=3D 0)<br>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_dbg(i2=
c-&gt;dev, &quot;timeout\n&quot;);<br>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 else if=
 (ret !=3D num)<br>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_dbg(i2=
c-&gt;dev, &quot;incomplete xfer (%d)\n&quot;, ret);<br>
<br>- =A0 =A0 =A0 /* For QUIRK_HDMIPHY, bus is already disabled */<br>- =A0=
 =A0 =A0 if (i2c-&gt;quirks &amp; QUIRK_HDMIPHY)<br>- =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 goto out;<br>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* For QUIRK_HDMIPHY, bu=
s is already disabled */<br>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (i2c-&gt;quirk=
s &amp; QUIRK_HDMIPHY)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto out;<br><br>- =A0 =A0 =
=A0 s3c24xx_i2c_wait_idle(i2c);<br>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c24xx_i2=
c_wait_idle(i2c);<br>+ =A0 =A0 =A0 }<br><br>=A0 out:<br>=A0 =A0 =A0 =A0 ret=
urn ret;<br>@@ -963,6 +993,7 @@ s3c24xx_i2c_parse_dt(struct device_node *np=
, struct s3c24xx_i2c *i2c)<br>
=A0 =A0 =A0 =A0 of_property_read_u32(np, &quot;samsung,i2c-slave-addr&quot;=
, &amp;pdata-&gt;slave_addr);<br>=A0 =A0 =A0 =A0 of_property_read_u32(np, &=
quot;samsung,i2c-max-bus-freq&quot;,<br>=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (u32 *)&amp;pdata-&gt;frequency);<br>
+ =A0 =A0 =A0 of_property_read_u32(np, &quot;samsung,i2c-mode&quot;, &amp;i=
2c-&gt;i2c_mode);<br>=A0}<br>=A0#else<br>=A0static void<br>@@ -1004,6 +1035=
,10 @@ static int s3c24xx_i2c_probe(struct platform_device *pdev)<br>=A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 goto err_noclk;<br>
=A0 =A0 =A0 =A0 }<br><br>+ =A0 =A0 =A0 /* By default, i2c works in master m=
ode */<br>+ =A0 =A0 =A0 /* This currently will be updated using DT */<br>+ =
=A0 =A0 =A0 i2c-&gt;i2c_mode =A0 =3D 0;<br>+<br>=A0 =A0 =A0 =A0 i2c-&gt;qui=
rks =3D s3c24xx_get_device_quirks(pdev);<br>
=A0 =A0 =A0 =A0 if (pdata)<br>=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 memcpy(i2c-&g=
t;pdata, pdata, sizeof(*pdata));<br>@@ -1017,6 +1052,7 @@ static int s3c24x=
x_i2c_probe(struct platform_device *pdev)<br>=A0 =A0 =A0 =A0 i2c-&gt;adap.c=
lass =A0 =3D I2C_CLASS_HWMON | I2C_CLASS_SPD;<br>
=A0 =A0 =A0 =A0 i2c-&gt;tx_setup =A0 =A0 =3D 50;<br><br>+<br>=A0 =A0 =A0 =
=A0 init_waitqueue_head(&amp;i2c-&gt;wait);<br><br>=A0 =A0 =A0 =A0 /* find =
the clock and enable it */<br><span><font color=3D"#888888">--<br>1.7.9.5<b=
r><br></font></span></div><br>

--047d7b604190b0c55104cff1b779--


--===============1737196805838057481==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============1737196805838057481==--
