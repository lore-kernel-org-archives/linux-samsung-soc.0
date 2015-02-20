From: Tushar Behera <trblinux@gmail.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: max98088: Add master clock handling
Date: Fri, 20 Feb 2015 08:57:39 +0530
Message-ID: <54E6A9AB.4070401@gmail.com>
References: <1424283959-16289-3-git-send-email-afaerber@suse.de> <1424373526-4135-1-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f175.google.com ([209.85.192.175]:34342 "EHLO
	mail-pd0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752314AbbBTD1q (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 19 Feb 2015 22:27:46 -0500
In-Reply-To: <1424373526-4135-1-git-send-email-afaerber@suse.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>, Sangbeom Kim <sbkim73@samsung.com>, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org
Cc: devicetree@vger.kernel.org, Doug Anderson <dianders@chromium.org>, Vincent Palatin <vpalatin@chromium.org>, Lars-Peter Clausen <lars@metafoo.de>, Takashi Iwai <tiwai@suse.de>, Xiubo Li <Li.Xiubo@freescale.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, linux-arm-kernel@lists.infradead.org, Tushar Behera <tushar.behera@linaro.org>

On 02/20/2015 12:48 AM, Andreas F=C3=A4rber wrote:
> If master clock is provided through device tree, then update
> the master clock frequency during set_sysclk.
>=20
> Cc: Tushar Behera <tushar.behera@linaro.org>
> Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
> ---
>  sound/soc/codecs/max98088.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>=20

Looks good.

Acked-by: Tushar Behera <trblinux@gmail.com>

--=20
Tushar Behera
