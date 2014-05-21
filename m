From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [alsa-devel] [PATCH v2 1/2] ASoC: samsung: s3c24{xx, 12}-i2s: port to use generic dmaengine API
Date: Wed, 21 May 2014 17:29:41 +0200
Message-ID: <45188858.i0tHnasRTk@phil>
References: <1400617569-7187-1-git-send-email-anarsoul@gmail.com> <CA+E=qVd_M5wes5rwU0pkR7-4FDS8J-XKfajV7-efTtm=sy2==g@mail.gmail.com> <537CC143.9050307@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:43030 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752181AbaEUP0W convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 May 2014 11:26:22 -0400
In-Reply-To: <537CC143.9050307@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: Vasily Khoruzhick <anarsoul@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org, Kukjin Kim <kgene.kim@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, Lars-Peter Clausen <lars@metafoo.de>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

Am Mittwoch, 21. Mai 2014, 17:07:47 schrieb Tomasz Figa:
> On 21.05.2014 16:53, Vasily Khoruzhick wrote:
> > On Wed, May 21, 2014 at 4:28 PM, Tomasz Figa <t.figa@samsung.com> w=
rote:
> >> Please remember to keep linux-samsung-soc ML on Cc when sending pa=
tches
> >> related to Samsung platforms. It is essential to let Samsung peopl=
e
> >> review them.
> >=20
> > Ok, I'll keep it in mind. I've just checked and get_maintainer.pl
> > outputs linux-samsung-soc ML for these
> > patches. I've omitted it occasionally, because it wasn't necessary =
to
> > keep it in CC back in 2011
> > (year of my last sound-related patch for s3c24xx).
> >=20
> >> Please resend the series with this in mind.
> >=20
> > Is it really necessary? This patch is supposed to go through ASoC
> > tree, not through Samsung's.
> > And I really doubt that Samsung guys test kernel for s3c24xx boards
> > nowadays.
> Maybe not test, but at least review the code. Also there might be oth=
er
> people following that list that might be interested in looking at thi=
s
> series, while not subscribed to alsa-devel - I can name at least Heik=
o
> St=FCbner, who should be able to test it on further s3c24xx-based boa=
rds.

Sadly, I don't have a working sound setup on my 2 s3c boards.


Heiko
