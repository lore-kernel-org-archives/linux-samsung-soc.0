From: Mark Brown <broonie@kernel.org>
Subject: Re: Broken device trees for exynos in linux-next
Date: Fri, 16 Aug 2013 01:35:57 +0100
Message-ID: <20130816003557.GJ30073@sirena.org.uk>
References: <CAOesGMgv9gTQ_NtaKZY_ZfLD1NBU19E-vaLaWwmvGJJB1MQrwg@mail.gmail.com>
 <13b101ce9a14$2cebd700$86c38500$@org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6J7GEvtanOfV9oXA"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:44650 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752540Ab3HPAhJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 15 Aug 2013 20:37:09 -0400
Content-Disposition: inline
In-Reply-To: <13b101ce9a14$2cebd700$86c38500$@org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: 'Olof Johansson' <olof@lixom.net>, 'Arnd Bergmann' <arnd@arndb.de>, Padmavathi Venna <padma.v@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org


--6J7GEvtanOfV9oXA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 16, 2013 at 09:04:28AM +0900, Kukjin Kim wrote:

> NO, the build breakage is due to commit 6187288f15bc ("ARM: dts: exynos5250:
> move common i2s properties to exynos5 dtsi" which is in Mark Brown's tree.

> Mark, pleaser revert it in your tree...

I'll do that but I don't know if that's then going to break anything
else.  This sort of bisection/cross tree issue does come up a lot with
the Samsung SoCs - it'd be good if you could remind the people working
on them about the need to make sure that when there are dependencies
they're handled when things are merged.

--6J7GEvtanOfV9oXA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJSDXPqAAoJELSic+t+oim9V0AP+wR31UkP07OzGq+crvrTAtWO
ioEGdY3qWunByLm94T50zjE8caZXbmNtI1p0sDvxD2PXCmIflytGvL6AZgxvWuOE
VFVSPV7dDV18lld7zcHWpAT7zKyU+qd7Nb4BygQWHh2Y1KybS1tACLlYhkp5qFhT
u3pZCcRANVUQvqrCgGaiG4OeasPrBU8zK8IzGyUtRCbFraROGm+VNYeA65kmE7Km
cH2hg83cAakOqHwU7DSXSIPBuI/IQ4R1HISk/55ZgUNiloiuT4uO1PhVgoOZyPR/
t43RbQDw7cjbp9QVZ5BwnGY7iz5U0wNpiuCYkKDw6wfzxeAvAVCuZ7jNITF0YShV
zxfBPGkCUsRSbx3wjm9bxmlQZ4qV3lOsp0HOm37z39gWrLch54pbuu43SF2JXbzA
KZflkg3YEVx3pSIBiLx2JQ/OLeF1a5oJlzLLQLxRMcTDHl2eyHzG56oUb3e1iQ4n
77ZUSSOyqSt80GGotItgYVWvelPqNv1Dm52AlSWIfXvALxVniSej/5ASPgPZCyNv
eboqR+erXhcPUtUFe60Y0/TWmP/ribPisjj7uROs4MqeCmSB3N61bYccRtxGRMrn
zzKptRTxtWhSVsqIiYejdsuHlPgChVgjkfUPBGnhhb1/ODQe1JfqaexrKhO9QVzb
lxDD3oHjCm443+7zWmpF
=gjn7
-----END PGP SIGNATURE-----

--6J7GEvtanOfV9oXA--
