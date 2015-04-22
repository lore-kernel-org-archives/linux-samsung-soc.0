From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH v2] i2c: Mark adapter devices with pm_runtime_no_callbacks
Date: Wed, 22 Apr 2015 09:54:06 +0200
Message-ID: <20150422075406.GE1511@katana>
References: <1429185919-26098-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+SfteS7bOf3dGlBC"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:35025 "EHLO pokefinder.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S964935AbbDVHyM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 22 Apr 2015 03:54:12 -0400
Content-Disposition: inline
In-Reply-To: <1429185919-26098-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Cc: kgene@kernel.org, linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org, lars@metafoo.de


--+SfteS7bOf3dGlBC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 16, 2015 at 01:05:19PM +0100, Charles Keepax wrote:
> Commit 523c5b89640e ("i2c: Remove support for legacy PM") removed the PM
> ops from the bus type, which causes the pm operations on the s3c2410
> adapter device to fail (-ENOSUPP in rpm_callback). The adapter device
> doesn't get bound to a driver and as such can't have its own pm_runtime
> callbacks. Previously this was fine as the bus callbacks would have been
> used, but now this can cause devices which use PM runtime and are
> attached over I2C to fail to resume.
>=20
> This commit fixes this issue by marking all adapter devices with
> pm_runtime_no_callbacks, since they can't have any.
>=20
> Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>

Applied to for-current, thanks!

Will push out somewhat later today. Lars-Peter, if you'd like to donate
some ack/review tag until then, this would be much appreciated.


--+SfteS7bOf3dGlBC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVN1OeAAoJEBQN5MwUoCm2pj0P/jTp93AHDWFbJHqUUTrnOvi3
hhkRcY7Ao/oJJRx1HiHQb+btlhex6ftsAxNFihWxYKgLR7XLGOB+H8/1jp07F7W8
yRc8b6ElrXP9YQhalJ/KWGt0o9oCHryB23BTss5ZUdF6EPjZh667sbrvPx/9QIW/
Tv1fgkkoO0aF/KXbcY6SeHd3eOkluqzXNHo+T4b7NUElvmG1TUQyJtKMubVKaJR6
GpjkSfE/PHtpnRMmc8KwF3jDoD8XH3OZPSYbywumcKVPtp9W4+XXWljj4ML7FlKF
PSNvQrU8ZJD/i5r1PEIXZ+O5n5vrQycexiHbKe4GZ4ZXNYAfjR5GodoWZLFWJ3BH
rIK0ugSWrC00BGJ+JI/GOk9FwecTh/WMHtfZkAntqp5DmW7nJFguij3JDh8su9gj
jzM+WLOyS0//sKh9g/dgeVbF3anpUTQOq0H0Gww7wcFy7XN6sEHMlj6SnnrArXb0
Z1Sc2IXVkRXRtrLdPfbbXL2drFf9s3TMpYGWvuz3uYD2s0KoNcC5SfGAU5i/lNNl
WiyF2IUctJsGb2U+DUyVvTwb759plHkG2XfsYbbRRz3RjH0cKaEdmaciEcvpdx5+
rW6mmND2yqM67C9egrSxi5UxPAoAzFLpu66wchzzcoHcQiYX7T74uBNQ3ZG5oxyj
zR3R7T81sxpXD/vpvQ0Y
=Q6rN
-----END PGP SIGNATURE-----

--+SfteS7bOf3dGlBC--
