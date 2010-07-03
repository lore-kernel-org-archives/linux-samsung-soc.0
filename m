From: Maurus Cuelenaere <mcuelenaere@gmail.com>
Subject: Re: [alsa-devel] [PATCH 1/2] ASoC: Add SmartQ sound driver
Date: Sat, 03 Jul 2010 02:22:44 +0200
Message-ID: <4C2E82D4.90801@gmail.com>
References: <4c2e7f3e.887b0e0a.5935.3f95@mx.google.com> <20100703001539.GA3869@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ew0-f46.google.com ([209.85.215.46]:44146 "EHLO
	mail-ew0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753150Ab0GCAWs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 2 Jul 2010 20:22:48 -0400
Received: by ewy23 with SMTP id 23so1173549ewy.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 02 Jul 2010 17:22:46 -0700 (PDT)
In-Reply-To: <20100703001539.GA3869@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, Takashi Iwai <tiwai@suse.de>, linux-arm-kernel@lists.infradead.org, Liam Girdwood <lrg@slimlogic.co.uk>

 Op 03-07-10 02:15, Mark Brown schreef:
> On Sat, Jan 30, 2010 at 06:23:14PM +0100, Maurus Cuelenaere wrote:
>
> Might want to check your mail setup - the date looks wrong.

Looks like it picked the date I first started this commit, will correct=
 it next time.

>> This adds sound support for the SmartQ board.
>>
>> The hardware consists of a S3C6410 coupled with a WM8987 over I=B2S.=
 As there's
>> no driver for the WM8987 currently, this uses the WM8750 driver (whi=
ch should
>> be register compatible).
> There's no need to add a separate driver for a register compatible pa=
rt,
> just add the I2C/SPI IDs to the existing driver.  Otherwise we just
> duplicate it redundantly.  Please update this and the comment in the
> driver to reflect that.

Ok, will do.

> Otherwise this looks OK, but there's a couple of things that it'd be
> nice to update:
>
>> +	dev_info(&smartq_snd_device->dev, "SmartQ WM8987 audio driver init=
ed\n");
> Best to remove this, it gets a bit noisy.

Ok.

>> +MODULE_AUTHOR("Maurus Cuelenaere");
> Better to add your mail address too.

Ok.

--=20
Maurus Cuelenaere
