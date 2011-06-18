From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH V2 2/4] ASoC: SAMSUNG: Add I2S0 internal dma driver
Date: Sat, 18 Jun 2011 14:28:38 +0530
Message-ID: <BANLkTi=R=B6rmAg7nPQP3wBMkrQcrqGfyw@mail.gmail.com>
References: <1308127407-22458-1-git-send-email-sbkim73@samsung.com>
	<1308127407-22458-3-git-send-email-sbkim73@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:44279 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751526Ab1FRI6k convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 18 Jun 2011 04:58:40 -0400
Received: by bwz15 with SMTP id 15so1259365bwz.19
        for <linux-samsung-soc@vger.kernel.org>; Sat, 18 Jun 2011 01:58:39 -0700 (PDT)
In-Reply-To: <1308127407-22458-3-git-send-email-sbkim73@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sangbeom Kim <sbkim73@samsung.com>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, lrg@slimlogic.co.uk, broonie@opensource.wolfsonmicro.com, kgene.kim@samsung.com

On Wed, Jun 15, 2011 at 2:13 PM, Sangbeom Kim <sbkim73@samsung.com> wro=
te:

> + =C2=A0 =C2=A0 =C2=A0 .channels_min =3D 2,
> + =C2=A0 =C2=A0 =C2=A0 .channels_max =3D 2,
> + =C2=A0 =C2=A0 =C2=A0 .buffer_bytes_max =3D MAX_IDMA_BUFFER,
> + =C2=A0 =C2=A0 =C2=A0 .period_bytes_min =3D 128,
> + =C2=A0 =C2=A0 =C2=A0 .period_bytes_max =3D MAX_IDMA_PERIOD,
> + =C2=A0 =C2=A0 =C2=A0 .periods_min =3D 1,
> + =C2=A0 =C2=A0 =C2=A0 .periods_max =3D 2,
> +};
The settings here don't ensure ring buffer is always MAX_IDMA_BUFFER.
Whereas you assume that in 'iis_irq'.


> +
> +void i2sdma_getpos(dma_addr_t *src, struct snd_pcm_substream *substr=
eam)
> +{
> + =C2=A0 =C2=A0 =C2=A0 struct idma_ctrl *prtd =3D substream->runtime-=
>private_data;
> +
> + =C2=A0 =C2=A0 =C2=A0 if (prtd && (prtd->state & ST_RUNNING))
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *src =3D idma.lp_t=
x_addr +
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 (readl(idma.regs + I2STRNCNT) & 0xffffff) * 4;
> + =C2=A0 =C2=A0 =C2=A0 else
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *src =3D idma.lp_t=
x_addr;
> +}
Why do we need this function ?


> +
> +static int idma_hw_params(struct snd_pcm_substream *substream,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct snd_pcm_hw_params *params)
> +{
> + =C2=A0 =C2=A0 =C2=A0 struct snd_pcm_runtime *runtime =3D substream-=
>runtime;
> + =C2=A0 =C2=A0 =C2=A0 struct idma_ctrl *prtd =3D substream->runtime-=
>private_data;
> +
> + =C2=A0 =C2=A0 =C2=A0 dev_dbg(dev, "Entered %s\n", __func__);
> +
> + =C2=A0 =C2=A0 =C2=A0 snd_pcm_set_runtime_buffer(substream, &substre=
am->dma_buffer);
> + =C2=A0 =C2=A0 =C2=A0 runtime->dma_bytes =3D params_buffer_bytes(par=
ams);
> +
> + =C2=A0 =C2=A0 =C2=A0 prtd->start =3D prtd->pos =3D runtime->dma_add=
r;
> + =C2=A0 =C2=A0 =C2=A0 prtd->period =3D params_periods(params);
> + =C2=A0 =C2=A0 =C2=A0 prtd->periodsz =3D params_period_bytes(params)=
;
> + =C2=A0 =C2=A0 =C2=A0 prtd->end =3D idma.lp_tx_addr + runtime->dma_b=
ytes;
     prtd->end =3D runtime->dma_addr + runtime->dma_bytes;   makes bett=
er sense


> +static snd_pcm_uframes_t
> + =C2=A0 =C2=A0 =C2=A0 idma_pointer(struct snd_pcm_substream *substre=
am)
> +{
> + =C2=A0 =C2=A0 =C2=A0 struct snd_pcm_runtime *runtime =3D substream-=
>runtime;
> + =C2=A0 =C2=A0 =C2=A0 struct idma_ctrl *prtd =3D runtime->private_da=
ta;
> + =C2=A0 =C2=A0 =C2=A0 dma_addr_t src;
> + =C2=A0 =C2=A0 =C2=A0 unsigned long res;
> +
> + =C2=A0 =C2=A0 =C2=A0 dev_dbg(dev, "Entered %s\n", __func__);
> +
> + =C2=A0 =C2=A0 =C2=A0 spin_lock(&prtd->lock);
> +
> + =C2=A0 =C2=A0 =C2=A0 idma_getpos(&src);
> + =C2=A0 =C2=A0 =C2=A0 res =3D src - prtd->start;
> +
> + =C2=A0 =C2=A0 =C2=A0 spin_unlock(&prtd->lock);
> +
> + =C2=A0 =C2=A0 =C2=A0 dev_dbg(dev, "Pointer %x \n", src);
> +
> + =C2=A0 =C2=A0 =C2=A0 if (res >=3D snd_pcm_lib_buffer_bytes(substrea=
m)) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (res =3D=3D snd=
_pcm_lib_buffer_bytes(substream))
        This second check is redundant.


+static irqreturn_t iis_irq(int irqno, void *dev_id)
+{
+       struct idma_ctrl *prtd =3D (struct idma_ctrl *)dev_id;
+       u32 iiscon, iisahb, val, addr;
+
+       iisahb  =3D readl(idma.regs + I2SAHB);
+       iiscon  =3D readl(idma.regs + I2SCON);
+
+       val =3D (iisahb & AHB_LVL0INT) ? AHB_CLRLVL0INT : 0;
+
+       if (val) {
+               iisahb |=3D val;
+               writel(iisahb, idma.regs + I2SAHB);
+
+               addr =3D readl(idma.regs + I2SLVL0ADDR) - idma.lp_tx_ad=
dr;
+               addr +=3D prtd->period;
+               addr %=3D MAX_IDMA_BUFFER;
+               addr +=3D idma.lp_tx_addr;
+
+               writel(addr, idma.regs + I2SLVL0ADDR);
+
+               if (prtd->cb) {
+                       if (iisahb & AHB_LVL0INT)
   iisahb will always have the AHB_LVL0INT bit set at this point.


> +void idma_reg_init(void *regs)
> +{
> + =C2=A0 =C2=A0 =C2=A0 spin_lock_init(&idma.lock);
> + =C2=A0 =C2=A0 =C2=A0 idma.regs =3D regs;
> +}
> +
Why initialize lock twice, here ...

> +void idma_addr_init(dma_addr_t addr)
> +{
> + =C2=A0 =C2=A0 =C2=A0 spin_lock_init(&idma.lock);
> + =C2=A0 =C2=A0 =C2=A0 idma.lp_tx_addr =3D addr;
> +}
=2E.. and here.
And we might have races here - there is no mechanism to ensure these
functions are called before idma.lp_tx_addr and idma.regs are used.
Also, please try to merge them into one function.


> +MODULE_DESCRIPTION("Samsung ASoC IDMA Driver");
> +MODULE_LICENSE("GPL");
The MODULE_AUTHOR field is missing here.


Thnx,
-j
