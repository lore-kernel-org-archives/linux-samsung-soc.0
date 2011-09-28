From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V2 1/1] dmaengine/amba-pl08x: Add support for s3c64xx DMAC
Date: Wed, 28 Sep 2011 10:01:16 +0200
Message-ID: <CACRpkdZesKGuPGmUifLj4puN_e=kYAb4WyuQs+xERn9q7036rg@mail.gmail.com>
References: <1317189007-23033-1-git-send-email-alim.akhtar@samsung.com>
	<1317189007-23033-2-git-send-email-alim.akhtar@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1317189007-23033-2-git-send-email-alim.akhtar@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux@arm.linux.org.uk, vinod.koul@intel.com, linux-kernel@vger.kernel.org, kgene.kim@samsung.com, dan.j.williams@intel.com, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Sorry if I missed a few nitpicks last time, anyway it's looking much better=
 now:

On Wed, Sep 28, 2011 at 7:50 AM, Alim Akhtar <alim.akhtar@samsung.com> wrot=
e:
> + =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0* Samsung pl080 DMAC has one exrta control register

s/exrta/exstra

> + =A0 =A0 =A0 if (pl08x->vd->is_pl080_s3c) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 writel(txd->ccfg, phychan->base + PL080S_CH=
_CONFIG);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 writel(lli->cctl1, phychan->base + PL080S_C=
H_CONTROL2);
> + =A0 =A0 =A0 } else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 writel(txd->ccfg, phychan->base + PL080_CH_=
CONFIG);

What do you think about adding a field to the struct pl08x
like

u32 config_reg

that we set to the proper config register (PL080S_CH_CONFIG or
PL080_CH_CONFIG in probe(), so the above
becomes the simpler variant:

writel(txd->ccfg, phychan->base + pl08x->config_reg);
if (pl08x->vd->is_pl080_s3c)
    writel(lli->cctl1, phychan->base + PL080S_CH_CONTROL2);

> + =A0 =A0 =A0 if (pl08x->vd->is_pl080_s3c) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 val =3D readl(phychan->base + PL080S_CH_CON=
FIG);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 while ((val & PL080_CONFIG_ACTIVE) ||
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (val & PL080_CONFIG_ENABLE))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 val =3D readl(phychan->base=
 + PL080S_CH_CONFIG);
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 writel(val | PL080_CONFIG_ENABLE,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 phychan->base + PL080S_CH_C=
ONFIG);
> + =A0 =A0 =A0 } else {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0val =3D readl(phychan->base + PL080_CH_CON=
FIG);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 while ((val & PL080_CONFIG_=
ACTIVE) ||
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (val & PL08=
0_CONFIG_ENABLE))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 val =3D rea=
dl(phychan->base + PL080_CH_CONFIG);
>
> - =A0 =A0 =A0 writel(val | PL080_CONFIG_ENABLE, phychan->base + PL080_CH_=
CONFIG);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 writel(val | PL080_CONFIG_ENABLE,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 phychan->base + PL080_CH_CO=
NFIG);
> + =A0 =A0 =A0 }

This would also become much simpler with that approach I think...

> =A0 =A0 =A0 =A0/* Set the HALT bit and wait for the FIFO to drain */
> - =A0 =A0 =A0 val =3D readl(ch->base + PL080_CH_CONFIG);
> - =A0 =A0 =A0 val |=3D PL080_CONFIG_HALT;
> - =A0 =A0 =A0 writel(val, ch->base + PL080_CH_CONFIG);
> -
> + =A0 =A0 =A0 if (pl08x->vd->is_pl080_s3c) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 val =3D readl(ch->base + PL080S_CH_CONFIG);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 val |=3D PL080_CONFIG_HALT;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 writel(val, ch->base + PL080S_CH_CONFIG);
> + =A0 =A0 =A0 } else {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 val =3D readl(ch->base + PL080_CH_CONFIG);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 val |=3D PL080_CONFIG_HALT;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 writel(val, ch->base + PL080_CH_CONFIG);
> + =A0 =A0 =A0 }

This would become simply:

val =3D readl(ch->base + pl08x->config_reg);
val |=3D PL080_CONFIG_HALT;
writel(val, ch->base + pl08x->config_reg);


> =A0 =A0 =A0 =A0/* Clear the HALT bit */
> - =A0 =A0 =A0 val =3D readl(ch->base + PL080_CH_CONFIG);
> - =A0 =A0 =A0 val &=3D ~PL080_CONFIG_HALT;
> - =A0 =A0 =A0 writel(val, ch->base + PL080_CH_CONFIG);
> + =A0 =A0 =A0 if (pl08x->vd->is_pl080_s3c) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 val =3D readl(ch->base + PL080S_CH_CONFIG);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 val &=3D ~PL080_CONFIG_HALT;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 writel(val, ch->base + PL080S_CH_CONFIG);
> + =A0 =A0 =A0 } else {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 val =3D readl(ch->base + PL080_CH_CONFIG);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 val &=3D ~PL080_CONFIG_HALT;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 writel(val, ch->base + PL080_CH_CONFIG);
> + =A0 =A0 =A0 }

This would get rid of the if/else clauses

> + =A0 =A0 =A0 if (pl08x->vd->is_pl080_s3c) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 u32 val =3D readl(ch->base + PL080S_CH_CONF=
IG);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 val &=3D ~(PL080_CONFIG_ENABLE | PL080_CONF=
IG_ERR_IRQ_MASK |
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 PL080_CONFI=
G_TC_IRQ_MASK);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 writel(val, ch->base + PL080S_CH_CONFIG);
> + =A0 =A0 =A0 } else {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 u32 val =3D readl(ch->base + PL080_CH_CONFI=
G);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 val &=3D ~(PL080_CONFIG_ENABLE | PL080_CONF=
IG_ERR_IRQ_MASK |
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 PL080_CONFI=
G_TC_IRQ_MASK);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 writel(val, ch->base + PL080_CH_CONFIG);
> + =A0 =A0 =A0 }

As would this...

> + =A0 =A0 =A0 /* Samsung DMAC is PL080 variant*/
> + =A0 =A0 =A0 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .id =A0 =A0 =3D 0x00041082,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .mask =A0 =3D 0x000fffff,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .data =A0 =3D &vendor_pl080_s3c,

Does the hardware realy have this primecell number or is it something that =
is
hardcoded from the board/device tree?

If it is hardcoded then no objections.

In the latter case, replace 0x41 (=3D 'A', ARM) with something like
0x55 'U' for Samsung or so. Or 0x51 'S'. Or whatever you like.

Then add that to include/linux/amba/bus.h as
AMBA_VENDOR_SAMSUNG =3D 0x55,
so we have this under some kind of control.

Yours,
Linus Walleij
