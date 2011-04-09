From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH] ASoC: SAMSUNG: Fix the inverted clocks handling for pcm driver
Date: Sat, 9 Apr 2011 10:15:48 +0530
Message-ID: <BANLkTinbH6AUKvSxu4xa4U=UEZd4zvT-Qg@mail.gmail.com>
References: <1302314038-11398-1-git-send-email-sbkim73@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:62175 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751375Ab1DIEpu convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 9 Apr 2011 00:45:50 -0400
Received: by bwz15 with SMTP id 15so3297196bwz.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 08 Apr 2011 21:45:49 -0700 (PDT)
In-Reply-To: <1302314038-11398-1-git-send-email-sbkim73@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sangbeom Kim <sbkim73@samsung.com>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, lrg@slimlogic.co.uk, broonie@opensource.wolfsonmicro.com, kgene.kim@samsung.com, ben-linux@fluff.org

On Sat, Apr 9, 2011 at 7:23 AM, Sangbeom Kim <sbkim73@samsung.com> wrot=
e:
> Fix the inverted clocks handling for pcm cpu driver.
> By using SND_SOC_DAIFMT_NB_NF, Audio noise can be generated on SMDK.
>
> Signed-off-by: Sangbeom Kim <sbkim73@samsung.com>
> ---
> =C2=A0sound/soc/samsung/pcm.c | =C2=A0 =C2=A04 ++--
> =C2=A01 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/sound/soc/samsung/pcm.c b/sound/soc/samsung/pcm.c
> index 38aac7d..9c7e8b4 100644
> --- a/sound/soc/samsung/pcm.c
> +++ b/sound/soc/samsung/pcm.c
> @@ -350,8 +350,8 @@ static int s3c_pcm_set_fmt(struct snd_soc_dai *cp=
u_dai,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0ctl =3D readl(regs + S3C_PCM_CTL);
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
> - =C2=A0 =C2=A0 =C2=A0 case SND_SOC_DAIFMT_NB_NF:
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Nothing to do, =
NB_NF by default */
> + =C2=A0 =C2=A0 =C2=A0 case SND_SOC_DAIFMT_IB_NF:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Nothing to do, =
IB_NF by default */

Assuming you already compared screenshot
of a scope and what's mentioned in the manual for IB_NF  ...

Acked-by: Jassi Brar <jassisinghbrar@gmail.com>
