From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH V2 1/4] ASoC: SAMSUNG: Modify I2S driver to support idma
Date: Sat, 18 Jun 2011 14:16:15 +0530
Message-ID: <BANLkTimiJu_V8aGd9KvSVsTSEKzZp3M9SQ@mail.gmail.com>
References: <1308127407-22458-1-git-send-email-sbkim73@samsung.com>
	<1308127407-22458-2-git-send-email-sbkim73@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:37956 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751196Ab1FRIqQ convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 18 Jun 2011 04:46:16 -0400
Received: by bwz15 with SMTP id 15so1256259bwz.19
        for <linux-samsung-soc@vger.kernel.org>; Sat, 18 Jun 2011 01:46:15 -0700 (PDT)
In-Reply-To: <1308127407-22458-2-git-send-email-sbkim73@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sangbeom Kim <sbkim73@samsung.com>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, lrg@slimlogic.co.uk, broonie@opensource.wolfsonmicro.com, kgene.kim@samsung.com

On Wed, Jun 15, 2011 at 2:13 PM, Sangbeom Kim <sbkim73@samsung.com> wro=
te:

> +#define AHB_INTENLVL0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(1 << 24)
> +#define AHB_LVL0INT =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(1 << 2=
0)
> +#define AHB_CLRLVL0INT =C2=A0 =C2=A0 =C2=A0 =C2=A0 (1 << 16)
> +#define AHB_DMARLD =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (1 << 5=
)
> +#define AHB_INTMASK =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(1 << 3=
)
> +#define AHB_DMAEN =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(1=
 << 0)
> +#define AHB_LVLINTMASK =C2=A0 =C2=A0 =C2=A0 =C2=A0 (0xf << 20)
> +
> +#define I2SSIZE_TRNMSK =C2=A0 =C2=A0 =C2=A0 =C2=A0 (0xffff)
> +#define I2SSIZE_SHIFT =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(16)
Not serious but ....
a) Let us please get over our infatuation with such parentheses :)
b) Ideally these _new_ definitions should have been added separate to
this moving.


> diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
> index 992a732..2fc2428 100644
> --- a/sound/soc/samsung/i2s.c
> +++ b/sound/soc/samsung/i2s.c
> @@ -9,7 +9,7 @@
> =C2=A0* it under the terms of the GNU General Public License version =
2 as
> =C2=A0* published by the Free Software Foundation.
> =C2=A0*/
> -
> +#define DEBUG
Usually we don't do it by default.


> +#define ST_RUNNING =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (1<<0)
> +#define ST_OPENED =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(1=
<<1)
why do we need these two defines ?


 @@ -646,6 +548,7 @@ static int i2s_hw_params(struct snd_pcm_substream
*substream,
> =C2=A0{
> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct i2s_dai *i2s =3D to_info(dai);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 mod =3D readl(i2s->addr + I2SMOD);
> + =C2=A0 =C2=A0 =C2=A0 u32 ahb =3D readl(i2s->addr + I2SAHB);
Please realize that this function is common for even s3c24xx, for
which this is invalid AHB read
and all other subsequent ops.

> @@ -702,6 +605,13 @@ static int i2s_hw_params(struct snd_pcm_substrea=
m *substream,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0params_format(params));
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL=
;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0}
> +
> + =C2=A0 =C2=A0 =C2=A0 if (is_secondary(i2s)) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ahb |=3D (AHB_DMAR=
LD | AHB_INTMASK);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mod |=3D MOD_TXS_I=
DMA;
> + =C2=A0 =C2=A0 =C2=A0 }
> +
> + =C2=A0 =C2=A0 =C2=A0 writel(ahb, i2s->addr + I2SAHB);
=2E.. this too.
