From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [RFC PATCH 1/7] ARM: common: vic: Parse interrupt and resume
 masks from device tree
Date: Thu, 10 Jan 2013 11:03:14 +0000
Message-ID: <20130110110314.GH20956@opensource.wolfsonmicro.com>
References: <1357774909-29938-1-git-send-email-tomasz.figa@gmail.com>
 <1357774909-29938-2-git-send-email-tomasz.figa@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wayzTnRSUXKNfBqd"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:41644 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751354Ab3AJLDS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 Jan 2013 06:03:18 -0500
Content-Disposition: inline
In-Reply-To: <1357774909-29938-2-git-send-email-tomasz.figa@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, kwangwoo.lee@gmail.com, jacmet@sunsite.dk, augulis.darius@gmail.com, mcuelenaere@gmail.com, linux@arm.linux.org.uk


--wayzTnRSUXKNfBqd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 10, 2013 at 12:41:43AM +0100, Tomasz Figa wrote:

> +- interrupt-mask : Bit mask of valid interrupt sources (defaults to all valid)
> +- wakeup-mask : Bit mask of interrupt sources that can wake up the system
> +  (defaults to all allowed)

Should this really be configured in the VIC itself?  It seems like
something that might change at runtime (for example, due to the user
configuring wakes in sysfs).

--wayzTnRSUXKNfBqd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJQ7p/qAAoJELSic+t+oim9ZIAQAJrjZ6n9JmPEHA/Udtvgw9C4
SAZ/48TSsRfAeOKOBLhH0YtwQ5mWGhpnNkRRND7VBDoTqCO7iuBRIFSuD5SDW8Gc
YR+G/GjSdc6ljrqqKzS2J2hII6x3+t2MmFqVxsOkLX1ESSlZIBm++tKLn8A/nzIP
RIJloJmYm4sduhb6/z43cDyH6WekP20WrPoEca0LhvZmvW9ctH7Z3icGDlbQF6YZ
MKciFbzysSGmqWrC9k6h72FFPsrZj5px0mNg5TML+TcJLWjXFT4h9SC15Ycp++hp
lQ9no5b6sGr6dAi4HhbfHsFvKN+T5fUGGvP/IbkO9P0Pq+VRRc8zAA7qeciRD3NY
dcb9kVdIcL5WiQ4vrhOY04kEYWOsRGdP/pIecwFpq7i260C42gTeh2E6nsgS+wQ9
t6gt0VUhpSc1Q8bLkMC2axLp0WfmRBUpnKQpLXsIAd/gTFzMDwm7wuThAS60Kjh6
Z+PDn8Lh7W7dhwy1RsJ9DnSokHZnlbvB+ISEqmog5fXQBtU4tT79RtyiPor0rOtT
7LcWt0VPmDnQKRwibiwC17hutvqfD5+riMllm4TLWGW0V9AaKJhroyzWCutKP7HO
Ccc2t/RDMEietw22nCiy3u6nMnLi4B+/uAiX3yRrVPOd1J1WrNLVc9Ub6xKAhWse
HXL/LOWpcCnQ6/oPHRo/
=RQJ9
-----END PGP SIGNATURE-----

--wayzTnRSUXKNfBqd--
