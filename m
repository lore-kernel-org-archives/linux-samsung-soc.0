From: Ben Gamari <bgamari.foss@gmail.com>
Subject: Re: [RFC 0/5] ARM: EXYNOS: ODROID-XU DT and LEDs
Date: Sat, 14 Mar 2015 15:13:29 -0400
Message-ID: <87oanv9yue.fsf@gmail.com>
References: <1406549892-5558-1-git-send-email-afaerber@suse.de> <53D9CA35.1030800@suse.de>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha1; protocol="application/pgp-signature"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qg0-f49.google.com ([209.85.192.49]:33240 "EHLO
	mail-qg0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751296AbbCNTNn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 14 Mar 2015 15:13:43 -0400
In-Reply-To: <53D9CA35.1030800@suse.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>, linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>
Cc: Humberto Naves <hsnaves@gmail.com>, Tarek Dakhran <t.dakhran@samsung.com>, Kevin Hilman <khilman@linaro.org>, linux-kernel@vger.kernel.org, Hakjoo Kim <ruppi.kim@hardkernel.com>, linux-arm-kernel@lists.infradead.org

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Andreas F=C3=A4rber <afaerber@suse.de> writes:

> Kukjin,
>
> Am 28.07.2014 14:18, schrieb Andreas F=C3=A4rber:
>> Hello,
>>=20
>> This series adds a dedicated ODROID-XU device tree and enhances it with=
=20
>> LED configuration, to match the downstream 3.14 based behavior.
>>=20
>> It had turned out less trivial than I initially thought as the whole=20
>> pinctrl stuff is still missing. I thus cherry-pick two downstream commit=
s.
>>=20
>> Hakjoo, can you please reply with a Signed-off-by to your patches
>> so that we can get them into upstream? Thanks in advance!
>
> FTR, Hakjoo Kim did reply with signed off patches (thanks again!) and
> updated their branch accordingly:
>
> https://github.com/hardkernel/linux/commits/odroid-3.14.y-linaro
> https://github.com/hardkernel/linux/commit/53edc3da0d1da287517681b47daf36=
679637b6ba
> https://github.com/hardkernel/linux/commit/afdc310e47e4d1799719566bfb5a47=
c55141a7cb
>
>> Andreas F=C3=A4rber (3):
>>   ARM: dts: exynos5410: Clean up SMDK5410 indentation
>>   ARM: dts: exynos5410: Prepare ODROID-XU device tree
>
> The functional changes below haven't been reviewed yet, but could you
> consider applying trivial patches 1-2?
>
> Regards,
> Andreas
>
>>   ARM: dts: exynos5410: Add ODROID-XU LEDs
>>=20
>> Hakjoo Kim (2):
>>   pinctrl: exynos: add exynos5410 SoC specific data
>>   ARM: dts: add pinctrl support to Exynos5410
>>=20

What happened with this set? It appears that 1-2 were never merged nor
was there any review of the remaining patches.

Cheers,

=2D Ben

--=-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJVBIhaAAoJEHPt6ejPuu8BFs0H/ixCGCZdcCiFhD7tWfk/2M+4
dl0W9Ch17sGkAKudS62UiJE9P4zVXZRoPc36bBDl6BuBQvq4z/HWAhNWyJS+hMLE
lQ8NgNaBxckGD4KXSfKvmXB6G6lPGGC1NFEhWLsYe9k/R/AlF1SfiNL3Jh9/WYXj
IjocZD8K7y2XkCsuRTVcGCP7lVvYGiLFzovcCchD4LJwK155UPdseM648nUNDoWc
oOe67Cs6WHY2urMpYaTR0iAhysVS8LpGqtUORCjwLqQZ9P8nWe5nZIeJWvNTxNoH
Tn4qwgPXgpcCp8CotamvGOnqFE5YiOmtyw/f1+RiNTp5Gd9ijbOHWCw2/pqPOdc=
=jV6+
-----END PGP SIGNATURE-----
--=-=-=--
