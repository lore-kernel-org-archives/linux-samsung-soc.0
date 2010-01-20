From: Ben Dooks <ben-linux@fluff.org>
Subject: git pre-commit hook running checkpatch.pl
Date: Wed, 20 Jan 2010 02:02:02 +0000
Message-ID: <20100120020202.GE26562@trinity.fluff.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DocE+STaALJfprDB"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:58646 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754033Ab0ATCCI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 19 Jan 2010 21:02:08 -0500
Content-Disposition: inline
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, Linux Samsung SoC <linux-samsung-soc@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>


--DocE+STaALJfprDB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

I've written a git pre-commit[1] hook which stops any commits happening if
checkpatch.pl reports problems with the patch. Any comments?

[1] http://www.fluff.org/ben/linux/githooks/pre-commit

--=20
Ben

Q:      What's a light-year?
A:      One-third less calories than a regular year.


--DocE+STaALJfprDB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iD8DBQFLVmQaJZCApG2L7OYRAoX+AJ9nPRUmdDpLmJ+Uj1Nst/f1bQswrQCcC7gq
RFWd5CyZXe4O7WzLvYSwpZ8=
=JC9a
-----END PGP SIGNATURE-----

--DocE+STaALJfprDB--
