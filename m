From: Naveen Krishna Ch <naveenkrishna.ch@gmail.com>
Subject: Re: [PATCH] ASoC: SAMSUNG: 24-bit audio playback on Exynos4210
Date: Wed, 13 Jul 2011 17:18:47 +0530
Message-ID: <CAHfPSqDdxzGrMWZziZogoRBJXEoaUtPKxbpUi9AX8-=j4yRULw@mail.gmail.com>
References: <1310556126-13784-1-git-send-email-giridhar.maruthy@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:60375 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965051Ab1GMLtH convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 13 Jul 2011 07:49:07 -0400
Received: by iwn6 with SMTP id 6so5501150iwn.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 13 Jul 2011 04:49:07 -0700 (PDT)
In-Reply-To: <1310556126-13784-1-git-send-email-giridhar.maruthy@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Giridhar Maruthy <giridhar.maruthy@linaro.org>
Cc: jassisinghbrar@gmail.com, linux-samsung-soc@vger.kernel.org, dp@opensource.wolfsonmicro.com, Kyung-Kwee.Ryu@wolfsonmicro.com, broonie@opensource.wolfsonmicro.com

It works fine with this change.

On 13 July 2011 16:52, Giridhar Maruthy <giridhar.maruthy@linaro.org> w=
rote:
> Using 256fs or 512fs will result in distortion of 24-bit
> audio samples. This is because the lrclk generated is not
> proper. Using 384 fs generates proper output.
>
> Signed-off-by: Giridhar Maruthy <giridhar.maruthy@linaro.org>
> ---
> =A0sound/soc/samsung/smdk_wm8994.c | =A0 =A05 ++++-
> =A01 files changed, 4 insertions(+), 1 deletions(-)
>
> diff --git a/sound/soc/samsung/smdk_wm8994.c b/sound/soc/samsung/smdk=
_wm8994.c
> index e7c1009..45fbe2b 100644
> --- a/sound/soc/samsung/smdk_wm8994.c
> +++ b/sound/soc/samsung/smdk_wm8994.c
> @@ -8,6 +8,7 @@
> =A0*/
>
> =A0#include "../codecs/wm8994.h"
> +#include <sound/pcm_params.h>
>
> =A0/*
> =A0 * Default CFG switch settings to use this driver:
> @@ -44,7 +45,9 @@ static int smdk_hw_params(struct snd_pcm_substream =
*substream,
> =A0 =A0 =A0 =A0int ret;
>
> =A0 =A0 =A0 =A0/* AIF1CLK should be >=3D3MHz for optimal performance =
*/
> - =A0 =A0 =A0 if (params_rate(params) =3D=3D 8000 || params_rate(para=
ms) =3D=3D 11025)
> + =A0 =A0 =A0 if (params_format(params) =3D=3D SNDRV_PCM_FORMAT_S24_L=
E)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pll_out =3D params_rate(params) * 384;
> + =A0 =A0 =A0 else if (params_rate(params) =3D=3D 8000 || params_rate=
(params) =3D=3D 11025)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pll_out =3D params_rate(params) * 512;
> =A0 =A0 =A0 =A0else
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pll_out =3D params_rate(params) * 256;
> --
> 1.7.4.1
>
>



--=20
Shine bright,
(: Nav :)
