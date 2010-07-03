From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [alsa-devel] [PATCH 1/2] ASoC: Add SmartQ sound driver
Date: Sat, 3 Jul 2010 01:15:40 +0100
Message-ID: <20100703001539.GA3869@sirena.org.uk>
References: <4c2e7f3e.887b0e0a.5935.3f95@mx.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:34562 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751512Ab0GCAPm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 2 Jul 2010 20:15:42 -0400
Content-Disposition: inline
In-Reply-To: <4c2e7f3e.887b0e0a.5935.3f95@mx.google.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Maurus Cuelenaere <mcuelenaere@gmail.com>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, Takashi Iwai <tiwai@suse.de>, linux-arm-kernel@lists.infradead.org, Liam Girdwood <lrg@slimlogic.co.uk>

On Sat, Jan 30, 2010 at 06:23:14PM +0100, Maurus Cuelenaere wrote:

Might want to check your mail setup - the date looks wrong.

> This adds sound support for the SmartQ board.
>=20
> The hardware consists of a S3C6410 coupled with a WM8987 over I=B2S. =
As there's
> no driver for the WM8987 currently, this uses the WM8750 driver (whic=
h should
> be register compatible).

There's no need to add a separate driver for a register compatible part=
,
just add the I2C/SPI IDs to the existing driver.  Otherwise we just
duplicate it redundantly.  Please update this and the comment in the
driver to reflect that.

Otherwise this looks OK, but there's a couple of things that it'd be
nice to update:

> +	dev_info(&smartq_snd_device->dev, "SmartQ WM8987 audio driver inite=
d\n");

Best to remove this, it gets a bit noisy.

> +MODULE_AUTHOR("Maurus Cuelenaere");

Better to add your mail address too.
