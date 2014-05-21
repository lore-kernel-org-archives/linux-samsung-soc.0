From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [alsa-devel] [PATCH v2 1/2] ASoC: samsung: s3c24{xx, 12}-i2s: port to use generic dmaengine API
Date: Wed, 21 May 2014 17:56:41 +0200
Message-ID: <27469899.QpTIQjlnqG@phil>
References: <1400617569-7187-1-git-send-email-anarsoul@gmail.com> <45188858.i0tHnasRTk@phil> <CA+E=qVfXb2BeEsPcwnvKSiYRtP=HL6J_OLv+yrpg16kg74zJzQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:43369 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751148AbaEUPxT convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 May 2014 11:53:19 -0400
In-Reply-To: <CA+E=qVfXb2BeEsPcwnvKSiYRtP=HL6J_OLv+yrpg16kg74zJzQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vasily Khoruzhick <anarsoul@gmail.com>
Cc: Tomasz Figa <t.figa@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org, Kukjin Kim <kgene.kim@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, Lars-Peter Clausen <lars@metafoo.de>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

Am Mittwoch, 21. Mai 2014, 18:39:26 schrieb Vasily Khoruzhick:
> On Wed, May 21, 2014 at 6:29 PM, Heiko St=FCbner <heiko@sntech.de> wr=
ote:
> > Am Mittwoch, 21. Mai 2014, 17:07:47 schrieb Tomasz Figa:
> >> On 21.05.2014 16:53, Vasily Khoruzhick wrote:
> >> > On Wed, May 21, 2014 at 4:28 PM, Tomasz Figa <t.figa@samsung.com=
> wrote:
> >> >> Please remember to keep linux-samsung-soc ML on Cc when sending
> >> >> patches
> >> >> related to Samsung platforms. It is essential to let Samsung pe=
ople
> >> >> review them.
> >> >=20
> >> > Ok, I'll keep it in mind. I've just checked and get_maintainer.p=
l
> >> > outputs linux-samsung-soc ML for these
> >> > patches. I've omitted it occasionally, because it wasn't necessa=
ry to
> >> > keep it in CC back in 2011
> >> > (year of my last sound-related patch for s3c24xx).
> >> >=20
> >> >> Please resend the series with this in mind.
> >> >=20
> >> > Is it really necessary? This patch is supposed to go through ASo=
C
> >> > tree, not through Samsung's.
> >> > And I really doubt that Samsung guys test kernel for s3c24xx boa=
rds
> >> > nowadays.
> >>=20
> >> Maybe not test, but at least review the code. Also there might be =
other
> >> people following that list that might be interested in looking at =
this
> >> series, while not subscribed to alsa-devel - I can name at least H=
eiko
> >> St=FCbner, who should be able to test it on further s3c24xx-based =
boards.
> >=20
> > Sadly, I don't have a working sound setup on my 2 s3c boards.
>=20
> What are they btw? Is it too time-consuming to make sound working on =
them?
> It would be nice if anyone except me could test these patches.

Openmoko Freerunner (S3C2440) where there may be sound reachable somewa=
y and a=20
"Oyo" ebook-reader (S3C2416) whose i2s is I think compatible with the s=
3c64xx=20
instead of the s3c24xx ones and with a completely unsupported codec.

But in general I'm fairly confident that if you hear sounds on your dev=
ice your=20
conversion would be fine test-wise :-)


Heiko
