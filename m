From: Alim Akhtar <alim.akhtar@gmail.com>
Subject: Re: [PATCH V2 1/1] dmaengine/amba-pl08x: Add support for s3c64xx DMAC
Date: Wed, 28 Sep 2011 14:29:30 +0530
Message-ID: <CAGOxZ53Yu3fi7rNOMJ2BiT-vsFn2R9aGBTUc9s53AJsKa=AMBA@mail.gmail.com>
References: <1317189007-23033-1-git-send-email-alim.akhtar@samsung.com>
 <1317189007-23033-2-git-send-email-alim.akhtar@samsung.com> <CACRpkdZesKGuPGmUifLj4puN_e=kYAb4WyuQs+xERn9q7036rg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdZesKGuPGmUifLj4puN_e=kYAb4WyuQs+xERn9q7036rg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, linux-samsung-soc@vger.kernel.org, linux@arm.linux.org.uk, vinod.koul@intel.com, linux-kernel@vger.kernel.org, kgene.kim@samsung.com, dan.j.williams@intel.com, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

HI Linus,
Thanks for reviewing again.

On Wed, Sep 28, 2011 at 1:31 PM, Linus Walleij <linus.walleij@linaro.or=
g> wrote:
> Sorry if I missed a few nitpicks last time, anyway it's looking much =
better now:
>
> On Wed, Sep 28, 2011 at 7:50 AM, Alim Akhtar <alim.akhtar@samsung.com=
> wrote:
>> + =A0 =A0 =A0 /*
>> + =A0 =A0 =A0 =A0* Samsung pl080 DMAC has one exrta control register
>
> s/exrta/exstra
>
I will correct this.
>> + =A0 =A0 =A0 if (pl08x->vd->is_pl080_s3c) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 writel(txd->ccfg, phychan->base + PL08=
0S_CH_CONFIG);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 writel(lli->cctl1, phychan->base + PL0=
80S_CH_CONTROL2);
>> + =A0 =A0 =A0 } else
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 writel(txd->ccfg, phychan->base + PL08=
0_CH_CONFIG);
>
> What do you think about adding a field to the struct pl08x
> like
>
> u32 config_reg
>
> that we set to the proper config register (PL080S_CH_CONFIG or
> PL080_CH_CONFIG in probe(), so the above
> becomes the simpler variant:
>
> writel(txd->ccfg, phychan->base + pl08x->config_reg);
> if (pl08x->vd->is_pl080_s3c)
> =A0 =A0writel(lli->cctl1, phychan->base + PL080S_CH_CONTROL2);
>
I will try implement this way or as viresh has pointed out to remove
the code duplications.

>> + =A0 =A0 =A0 if (pl08x->vd->is_pl080_s3c) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 val =3D readl(phychan->base + PL080S_C=
H_CONFIG);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 while ((val & PL080_CONFIG_ACTIVE) ||
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (val & PL080_CONFIG_EN=
ABLE))
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 val =3D readl(phychan-=
>base + PL080S_CH_CONFIG);
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 writel(val | PL080_CONFIG_ENABLE,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 phychan->base + PL080S=
_CH_CONFIG);
>> + =A0 =A0 =A0 } else {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0val =3D readl(phychan->base + PL080_C=
H_CONFIG);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 while ((val & PL080_CO=
NFIG_ACTIVE) ||
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (val &=
 PL080_CONFIG_ENABLE))
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 val =3D=
 readl(phychan->base + PL080_CH_CONFIG);
>>
>> - =A0 =A0 =A0 writel(val | PL080_CONFIG_ENABLE, phychan->base + PL08=
0_CH_CONFIG);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 writel(val | PL080_CONFIG_ENABLE,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 phychan->base + PL080_=
CH_CONFIG);
>> + =A0 =A0 =A0 }
>
> This would also become much simpler with that approach I think...
>
OK, i will do that.
>> =A0 =A0 =A0 =A0/* Set the HALT bit and wait for the FIFO to drain */
>> - =A0 =A0 =A0 val =3D readl(ch->base + PL080_CH_CONFIG);
>> - =A0 =A0 =A0 val |=3D PL080_CONFIG_HALT;
>> - =A0 =A0 =A0 writel(val, ch->base + PL080_CH_CONFIG);
>> -
>> + =A0 =A0 =A0 if (pl08x->vd->is_pl080_s3c) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 val =3D readl(ch->base + PL080S_CH_CON=
=46IG);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 val |=3D PL080_CONFIG_HALT;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 writel(val, ch->base + PL080S_CH_CONFI=
G);
>> + =A0 =A0 =A0 } else {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 val =3D readl(ch->base + PL080_CH_CONF=
IG);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 val |=3D PL080_CONFIG_HALT;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 writel(val, ch->base + PL080_CH_CONFIG=
);
>> + =A0 =A0 =A0 }
>
> This would become simply:
>
> val =3D readl(ch->base + pl08x->config_reg);
> val |=3D PL080_CONFIG_HALT;
> writel(val, ch->base + pl08x->config_reg);
>
>
ok, i will do that.
>> =A0 =A0 =A0 =A0/* Clear the HALT bit */
>> - =A0 =A0 =A0 val =3D readl(ch->base + PL080_CH_CONFIG);
>> - =A0 =A0 =A0 val &=3D ~PL080_CONFIG_HALT;
>> - =A0 =A0 =A0 writel(val, ch->base + PL080_CH_CONFIG);
>> + =A0 =A0 =A0 if (pl08x->vd->is_pl080_s3c) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 val =3D readl(ch->base + PL080S_CH_CON=
=46IG);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 val &=3D ~PL080_CONFIG_HALT;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 writel(val, ch->base + PL080S_CH_CONFI=
G);
>> + =A0 =A0 =A0 } else {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 val =3D readl(ch->base + PL080_CH_CONF=
IG);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 val &=3D ~PL080_CONFIG_HALT;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 writel(val, ch->base + PL080_CH_CONFIG=
);
>> + =A0 =A0 =A0 }
>
> This would get rid of the if/else clauses
>
ok, understand
>> + =A0 =A0 =A0 if (pl08x->vd->is_pl080_s3c) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 u32 val =3D readl(ch->base + PL080S_CH=
_CONFIG);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 val &=3D ~(PL080_CONFIG_ENABLE | PL080=
_CONFIG_ERR_IRQ_MASK |
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 PL080_=
CONFIG_TC_IRQ_MASK);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 writel(val, ch->base + PL080S_CH_CONFI=
G);
>> + =A0 =A0 =A0 } else {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 u32 val =3D readl(ch->base + PL080_CH_=
CONFIG);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 val &=3D ~(PL080_CONFIG_ENABLE | PL080=
_CONFIG_ERR_IRQ_MASK |
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 PL080_=
CONFIG_TC_IRQ_MASK);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 writel(val, ch->base + PL080_CH_CONFIG=
);
>> + =A0 =A0 =A0 }
>
> As would this...
>
>> + =A0 =A0 =A0 /* Samsung DMAC is PL080 variant*/
>> + =A0 =A0 =A0 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .id =A0 =A0 =3D 0x00041082,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .mask =A0 =3D 0x000fffff,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .data =A0 =3D &vendor_pl080_s3c,
>
> Does the hardware realy have this primecell number or is it something=
 that is
> hardcoded from the board/device tree?
>
It is a hardcoded value as s3c64xx does not have Identification registe=
rs.

> If it is hardcoded then no objections.
>
> In the latter case, replace 0x41 (=3D 'A', ARM) with something like
> 0x55 'U' for Samsung or so. Or 0x51 'S'. Or whatever you like.
>
> Then add that to include/linux/amba/bus.h as
> AMBA_VENDOR_SAMSUNG =3D 0x55,
> so we have this under some kind of control.
>
> Yours,
> Linus Walleij
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>



--=20
aLim akHtaR
mAin hUn nA :-)
