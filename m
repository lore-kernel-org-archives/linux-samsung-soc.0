From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [alsa-devel] [PATCH v2 1/2] ASoC: samsung: s3c24{xx, 12}-i2s: port to use generic dmaengine API
Date: Wed, 21 May 2014 18:24:32 +0200
Message-ID: <1736816.ReELmLitPm@phil>
References: <1400617569-7187-1-git-send-email-anarsoul@gmail.com> <27469899.QpTIQjlnqG@phil> <CA+E=qVdnNPyR8NL2gxrt_rptjxB3RROYjSRe3rkHH-JLq==oFg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:43693 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751137AbaEUQVK convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 May 2014 12:21:10 -0400
In-Reply-To: <CA+E=qVdnNPyR8NL2gxrt_rptjxB3RROYjSRe3rkHH-JLq==oFg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vasily Khoruzhick <anarsoul@gmail.com>
Cc: Tomasz Figa <t.figa@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org, Kukjin Kim <kgene.kim@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, Lars-Peter Clausen <lars@metafoo.de>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

Am Mittwoch, 21. Mai 2014, 19:09:19 schrieb Vasily Khoruzhick:
> On Wed, May 21, 2014 at 6:56 PM, Heiko St=FCbner <heiko@sntech.de> wr=
ote:
> > Openmoko Freerunner (S3C2440) where there may be sound reachable so=
meway
> > and a "Oyo" ebook-reader (S3C2416) whose i2s is I think compatible =
with
> > the s3c64xx instead of the s3c24xx ones and with a completely unsup=
ported
> > codec.
> Freerunner is s3c2442, and actually I can test s3c2442 on my iPAQ rx1=
950.
> s3c2416 may be supported by s3c2412-i2s, I have no spec at the hand,
> so I can't check.

I'm quite sure, s3c2416 shares the s3c64xx i2s ... at some point I matc=
hed the=20
registers and it also shares the hsspi, sdhci and fb drivers with the n=
ewer=20
generations (s3c64xx onward).

Heiko
