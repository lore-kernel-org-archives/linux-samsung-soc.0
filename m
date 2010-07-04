From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 2/3] ASoC: Add SmartQ sound driver
Date: Sun, 4 Jul 2010 18:05:50 +0900
Message-ID: <20100704090549.GD16825@opensource.wolfsonmicro.com>
References: <4c2e8856.487e0e0a.3bb5.3ec0@mx.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:40514 "EHLO
	opensource2.wolfsonmicro.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1756915Ab0GDJGq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 4 Jul 2010 05:06:46 -0400
Content-Disposition: inline
In-Reply-To: <4c2e8856.487e0e0a.3bb5.3ec0@mx.google.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Maurus Cuelenaere <mcuelenaere@gmail.com>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Liam Girdwood <lrg@slimlogic.co.uk>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>

On Sat, Jul 03, 2010 at 02:46:12AM +0200, Maurus Cuelenaere wrote:
> This adds sound support for the SmartQ board.
>=20
> The hardware consists of a S3C6410 coupled with a WM8987 over I=B2S. =
The WM8750
> driver is used for driving the WM8987, as they are register compatibl=
e.

I've applied this, but...

> +static struct snd_soc_jack_pin smartq_jack_pins[] =3D {
> +	/* Disable speaker when headphone is plugged in */
> +	{
> +		.pin	=3D "Internal Speaker",
> +		.mask	=3D SND_JACK_HEADPHONE,
> +		.invert	=3D true,
> +	},
> +};

=2E..it probably also make sense to disable the headphone output when t=
he
headphone is not plugged in to save power?
