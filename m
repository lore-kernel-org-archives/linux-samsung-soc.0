From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [RFC PATCH 1/7] ARM: common: vic: Parse interrupt and resume
 masks from device tree
Date: Thu, 10 Jan 2013 11:24:58 +0000
Message-ID: <20130110112458.GK20956@opensource.wolfsonmicro.com>
References: <1357774909-29938-1-git-send-email-tomasz.figa@gmail.com>
 <1357774909-29938-2-git-send-email-tomasz.figa@gmail.com>
 <20130110110314.GH20956@opensource.wolfsonmicro.com>
 <25622346.hsAr9IOJWj@flatron>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lildS9pRFgpM/xzO"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:58004 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753561Ab3AJLZB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 Jan 2013 06:25:01 -0500
Content-Disposition: inline
In-Reply-To: <25622346.hsAr9IOJWj@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, kwangwoo.lee@gmail.com, jacmet@sunsite.dk, augulis.darius@gmail.com, mcuelenaere@gmail.com, linux@arm.linux.org.uk


--lildS9pRFgpM/xzO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 10, 2013 at 12:10:38PM +0100, Tomasz Figa wrote:

> This is not the runtime interrupt/wakeup mask, but a global mask of=20
> available interrupt/wakeup lines on particular platform, which still have=
=20
> to be configured and enabled appropriately by user.

Ah, OK.

Reviewed-by: Mark Brown <broonie@opensource.wolfsonmicro.com>

--lildS9pRFgpM/xzO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJQ7qT+AAoJELSic+t+oim981kP/0J+Qy1FpeC1W2toi9x/u8Mb
nOoS8+UdOrZy9FseeHMTNDdmEwbJ9X9zi31xOwSQju16T+XwEL0bBqzAqiDHXMFJ
UUgKXYXr4pZE3tzngVnEcOUW9DVR9El13N37R5KhpKeSgwFLeRt947ru+FcJp6gS
9o126Hk4VT5Ft/d8xylEBWEOlfKtV3i7bRyNEevnAjcyxEBEBDTWzB1/MMcG+kf2
4Ft7Ac3kD6R+rTI+UGCOcZ7hNMgk+2hEHn6TTzFMBP1SZXLkuo7HECsLZjNbQQoi
PHX0B0JP4cRe5PusCe4O2pQTmjROkUSNWNpjaAiWWBGuXgtpe2fLMtdDplptzAJ9
meSrMnhwKuH+AsbMvSmE8wMSe9MXeh6D2Cab8f8TuoGJSVVS+EMUYUxck299WfgL
Td6nF8fw3Ml1ehOnxNgj1SrqDuDdjMP6vpyvytzK7VyA53UuX9yU5otIMtlAlpbC
/1ClIToUy0jL4mh5+uHWNInDOBhlHOUzPz7JRJHs6NtMFWKpMqxL+LvuNfsKeuRU
6XSr3OKLV+rlIRN8CDPp+bPhwxKlxAgaTQZ1laMKo8IIwCUjubi3CWfQGau18GiY
pgV6epcpCq98vEV9VCAr+Ebm3x6+gmUqFMlr4JzMsDD9/gms9ew9lfw/Z/WZBJvD
vgt1DqjWnhSRQDdPLDnP
=f6sk
-----END PGP SIGNATURE-----

--lildS9pRFgpM/xzO--
