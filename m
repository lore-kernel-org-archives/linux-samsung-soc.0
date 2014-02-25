From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 0/2] ARM: SAMSUNG: move all arches to generic uncompress.h
Date: Tue, 25 Feb 2014 15:17:05 +0100
Message-ID: <3158811.UU2ZyPShVi@phil>
References: <3594365.ORKU4Q2jDp@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:34960 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752072AbaBYORq convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 25 Feb 2014 09:17:46 -0500
In-Reply-To: <3594365.ORKU4Q2jDp@phil>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, tomasz.figa@gmail.com, Sachin Kamat <sachin.kamat@linaro.org>, Arnd Bergmann <arnd@arndb.de>

Am Sonntag, 16. Februar 2014, 18:32:24 schrieb Heiko St=FCbner:
> On 2014-01-06 Sachin Kamat posted two patches converting Exynos to us=
e
> the generic uncompress.h.
>=20
> But in fact all Samsung platforms can go this route, as all Samsung
> uncompress.h files are simply used to set up the serial port.
>=20
> As the original patches were not yet applied, this series includes th=
e
> original Exynos-specific change.
>=20
> Tested on a s3c2416 and s3c2442 based machine.

ping?


Thanks
Heiko
