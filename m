From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH] ASoC: SAMSUNG: 24-bit audio playback on Exynos4210
Date: Wed, 13 Jul 2011 19:36:51 +0530
Message-ID: <CABb+yY17WxP7qCbH=QoQyGY3DuH85-0zMS5O2UugQe9_djUGgw@mail.gmail.com>
References: <1310556126-13784-1-git-send-email-giridhar.maruthy@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:34634 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754572Ab1GMOGx convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 13 Jul 2011 10:06:53 -0400
Received: by bwd5 with SMTP id 5so4862580bwd.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 13 Jul 2011 07:06:52 -0700 (PDT)
In-Reply-To: <1310556126-13784-1-git-send-email-giridhar.maruthy@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Giridhar Maruthy <giridhar.maruthy@linaro.org>
Cc: naveenkrishna.ch@gmail.com, linux-samsung-soc@vger.kernel.org, dp@opensource.wolfsonmicro.com, Kyung-Kwee.Ryu@wolfsonmicro.com, broonie@opensource.wolfsonmicro.com

On Wed, Jul 13, 2011 at 4:52 PM, Giridhar Maruthy
<giridhar.maruthy@linaro.org> wrote:
> Using 256fs or 512fs will result in distortion of 24-bit
> audio samples. This is because the lrclk generated is not
> proper. Using 384 fs generates proper output.
>
> Signed-off-by: Giridhar Maruthy <giridhar.maruthy@linaro.org>
> ---
> =C2=A0sound/soc/samsung/smdk_wm8994.c | =C2=A0 =C2=A05 ++++-
> =C2=A01 files changed, 4 insertions(+), 1 deletions(-)
>
> diff --git a/sound/soc/samsung/smdk_wm8994.c b/sound/soc/samsung/smdk=
_wm8994.c
> index e7c1009..45fbe2b 100644
> --- a/sound/soc/samsung/smdk_wm8994.c
> +++ b/sound/soc/samsung/smdk_wm8994.c
> @@ -8,6 +8,7 @@
> =C2=A0*/
>
> =C2=A0#include "../codecs/wm8994.h"
> +#include <sound/pcm_params.h>
>
> =C2=A0/*
> =C2=A0 * Default CFG switch settings to use this driver:
> @@ -44,7 +45,9 @@ static int smdk_hw_params(struct snd_pcm_substream =
*substream,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0/* AIF1CLK should be >=3D3MHz for optimal =
performance */
> - =C2=A0 =C2=A0 =C2=A0 if (params_rate(params) =3D=3D 8000 || params_=
rate(params) =3D=3D 11025)
> + =C2=A0 =C2=A0 =C2=A0 if (params_format(params) =3D=3D SNDRV_PCM_FOR=
MAT_S24_LE)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pll_out =3D params=
_rate(params) * 384;
> + =C2=A0 =C2=A0 =C2=A0 else if (params_rate(params) =3D=3D 8000 || pa=
rams_rate(params) =3D=3D 11025)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pll_out =3D pa=
rams_rate(params) * 512;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0else
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pll_out =3D pa=
rams_rate(params) * 256;

It might be a good idea to maintain a matrix of sample rates and sizes
tested cleanly.
Thanks,
Jassi
