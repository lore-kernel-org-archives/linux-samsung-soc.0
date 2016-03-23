From: Thierry Reding <treding@nvidia.com>
Subject: Re: Who is going to merge it [Was: Re: [PATCH v14 0/17] Add Analogix
 Core Display Port Driver]
Date: Wed, 23 Mar 2016 16:49:00 +0100
Message-ID: <20160323154859.GB9442@ulmo.nvidia.com>
References: <1455534485-1154-1-git-send-email-ykk@rock-chips.com>
 <1919945.Y1tg0YzXlm@diego>
 <56F1CAEB.3080701@samsung.com>
 <8949624.HmxDpZAlt2@diego>
 <56F1D0AD.8030905@samsung.com>
 <20160322233906.GP19428@n2100.arm.linux.org.uk>
 <56F1DB27.4040001@samsung.com>
 <20160323000835.GQ19428@n2100.arm.linux.org.uk>
 <CAPM=9tz9_rbGJFuv-+YN=Sicfng++tHTDLrOX5Ohtwft+VnwtA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TRYliJ5NKNqkz5bu"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from hqemgate16.nvidia.com ([216.228.121.65]:7955 "EHLO
	hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752849AbcCWPtL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 23 Mar 2016 11:49:11 -0400
In-Reply-To: <CAPM=9tz9_rbGJFuv-+YN=Sicfng++tHTDLrOX5Ohtwft+VnwtA@mail.gmail.com>
Content-Disposition: inline
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Dave Airlie <airlied@gmail.com>
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>, Inki Dae <inki.dae@samsung.com>, Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, David Airlie <airlied@linux.ie>, Mark Yao <mark.yao@rock-chips.com>, Ajay Kumar <ajaykumar.rs@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>, Doug Anderson <dianders@chromium.org>, Jingoo Han <jingoohan1@gmail.com>, Yakir Yang <ykk@rock-chips.com>, Andrzej Hajda <a.hajda@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>"open list:ARM/Rockchip SoC..." <l>

--TRYliJ5NKNqkz5bu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 23, 2016 at 10:41:58AM +1000, Dave Airlie wrote:
> >
> >> So although it's small framework or just subdirectory, we would need
> >> someone who can manage the framework to avoid further confusion if
> >> necessary.
> >
> > So maybe it just doesn't need a maintainer, and maybe those the owner
> > of the bridge driver should be responsible for choosing the tree which
> > it's merged through along with updates.  That's how dw-hdmi has been
> > managed on the whole.
> >
> > It also means that the bridge driver maintainer is able to test changes
> > to the bridge driver, rather than having some over-arching bridge
> > subdirectory maintainer who doesn't have a clue whether the changes
> > work on the hardware.
> >
> > IMHO, having bridge driver authors/maintainers look after their own
> > code has many advantages.
>=20
> The author just send me a pull request with acks from a git tree
> that hopefully both people agreed and tested from. No need to
> send this via another maintainer layer.

I have in the past "maintained" bridge drivers as part of the panel
tree, but I have no objections at all for this to go in via one of the
trees where it is used and can actually be tested.

Thierry

--TRYliJ5NKNqkz5bu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJW8rroAAoJEN0jrNd/PrOhdf4QAKBFIkm9CJfQeE5LyQUFFCRT
F+0X/DUvdDtrzTiPxhlZ70+oMJzFimZXLn2N/usTuaJRwph2zUnsoZVG5DlDqp1U
ye9SOAjCSCd7znRIvcKRxsnN0nMNTCYU4sCxzt5MzXZxbREsP/RloYMNOYRS0Zjx
fsElUcmgCa/PfaUiqfDpQPzS0vjbu63GwUsgrmkMEIpNwzuKSUabg3JUI7ryHUwh
TQV2XAEotVF02bmzHMnH/9e+sZjlz7XOfz6izTP91mHbOcSwPr1wmLZny10PiN3E
dVSe7tObP9o+UqHGdyGNasyDe7Q/UyZCViXVDEahGKqfH+6BXOpgXonnXto8HIcc
53k2ohVD/boI2RzKQXOycVMDUQlqZUS/3xyo5YPI1FNFDYgU53nHL8PcZUNF5wO4
Uf1kK5ofAjKxe7KaEvTA7qb2Stax7nuGjh+NqQmXXQzFqg5CSq+nKA7mfZV3hipi
1nLujxW0kWKkiwMxQpt2NuCQIu4F9Vb2hj65rMrPKlQLOhs7zlpa9XNl0ZtoTz/5
wFhBNG08UgMx/AKRSxUSrLws0W6zxnMDJs+MOt1JTdJbR1BfhTzTlw4Eus5aE37t
DjPEaPz1hBd9G0xCWaw+s0++CBE6PknqJHvN+anMQfb1WIJWGLF0Y5APGys4/nNc
6eqLMqm8Zb4bjCvGR9Ei
=HAAB
-----END PGP SIGNATURE-----

--TRYliJ5NKNqkz5bu--
