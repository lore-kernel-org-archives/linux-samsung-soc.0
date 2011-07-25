From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH V4 06/14] ARM: SAMSUNG: Add common DMA operations
Date: Mon, 25 Jul 2011 17:21:44 +0530
Message-ID: <CABb+yY0nWLpdVGqTJPO2YwkGWiDw5tRjC2xn7Le0bO0ZNFHC_g@mail.gmail.com>
References: <1311557312-26107-1-git-send-email-boojin.kim@samsung.com>
	<1311557312-26107-7-git-send-email-boojin.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ew0-f46.google.com ([209.85.215.46]:55562 "EHLO
	mail-ew0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750890Ab1GYLvp convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 25 Jul 2011 07:51:45 -0400
Received: by ewy4 with SMTP id 4so2373984ewy.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 25 Jul 2011 04:51:44 -0700 (PDT)
In-Reply-To: <1311557312-26107-7-git-send-email-boojin.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Boojin Kim <boojin.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>, Kukjin Kim <kgene.kim@samsung.com>, Grant Likely <grant.likely@secretlab.ca>, Mark Brown <broonie@opensource.wolfsonmicro.com>

On Mon, Jul 25, 2011 at 6:58 AM, Boojin Kim <boojin.kim@samsung.com> wr=
ote:

> +
> +static bool pl330_filter(struct dma_chan *chan, void *param)
> +{
> + =C2=A0 =C2=A0 =C2=A0 struct dma_pl330_peri *peri =3D (struct dma_pl=
330_peri *)chan->private;
> + =C2=A0 =C2=A0 =C2=A0 unsigned dma_ch =3D (unsigned)param;
> +
> + =C2=A0 =C2=A0 =C2=A0 if (peri->peri_id !=3D dma_ch)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;
> +
> + =C2=A0 =C2=A0 =C2=A0 return true;
> +}
This is what I meant... if we keep chan_id for paltform assigned IDs,
these filter functions could simply become

static bool pl330_filter(struct dma_chan *chan, void *param)
{
        return chan->chan_id =3D=3D param
}

And ideally in the long run, we could just drop the filter callback
and add expected channel ID to the request_channel call.



> +
> +static inline int s3c_dma_trigger(unsigned ch)
> +{
> + =C2=A0 =C2=A0 =C2=A0 return s3c2410_dma_ctrl(ch, S3C2410_DMAOP_STAR=
T);
> +}
> +
> +static inline int s3c_dma_started(unsigned ch)
> +{
> + =C2=A0 =C2=A0 =C2=A0 return s3c2410_dma_ctrl(ch, S3C2410_DMAOP_STAR=
TED);
> +}
> +
> +static inline int s3c_dma_flush(unsigned ch)
> +{
> + =C2=A0 =C2=A0 =C2=A0 return s3c2410_dma_ctrl(ch, S3C2410_DMAOP_FLUS=
H);
> +}
> +
> +static inline int s3c_dma_stop(unsigned ch)
> +{
> + =C2=A0 =C2=A0 =C2=A0 return s3c2410_dma_ctrl(ch, S3C2410_DMAOP_STOP=
);
> +}
> +
> +static struct samsung_dma_ops s3c_dma_ops =3D {
> + =C2=A0 =C2=A0 =C2=A0 .request =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D s3c_dm=
a_request,
> + =C2=A0 =C2=A0 =C2=A0 .release =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D s3c_dm=
a_release,
> + =C2=A0 =C2=A0 =C2=A0 .prepare =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D s3c_dm=
a_prepare,
> + =C2=A0 =C2=A0 =C2=A0 .trigger =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D s3c_dm=
a_trigger,
> + =C2=A0 =C2=A0 =C2=A0 .started =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D s3c_dm=
a_started,
> + =C2=A0 =C2=A0 =C2=A0 .flush =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D s=
3c_dma_flush,
> + =C2=A0 =C2=A0 =C2=A0 .stop =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D s=
3c_dma_stop,

These last 4 should be gnereallized into one callback with OP argument.
