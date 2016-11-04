From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH RFC 5/7] ASoC: samsung: pcm: Do not use platform_data for
 DMA parameters
Date: Fri, 4 Nov 2016 11:13:38 -0600
Message-ID: <20161104171338.njzghp46o3oxur3c@sirena.org.uk>
References: <1478276094-19135-1-git-send-email-s.nawrocki@samsung.com>
 <1478276094-19135-7-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="7oepufhamvtnk2gc"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:58858 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756955AbcKDRNt (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 4 Nov 2016 13:13:49 -0400
Content-Disposition: inline
In-Reply-To: <1478276094-19135-7-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org, vinod.koul@intel.com, ckeepax@opensource.wolfsonmicro.com, ym0914@gmail.com, arnd@arndb.de, kgene@kernel.org, javier@osg.samsung.com, andi.shyti@samsung.com, sbkim73@samsung.com


--7oepufhamvtnk2gc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 04, 2016 at 05:14:52PM +0100, Sylwester Nawrocki wrote:
> All related platforms use either devicetree or the DMA slave
> map API for mapping DMA channels to slave devices so we can now
> stop using platform_data for passing DMA details.

Acked-by: Mark Brown <broonie@kernel.org>

--7oepufhamvtnk2gc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAABCAAGBQJYHMHCAAoJECTWi3JdVIfQpy4H/RlKSoBl3Dy7MfU5xE0WtOHM
in1gI5eb6sKsD7I9CAESnGq6X9yhU/+JhWCP02d1J6ovnwxVve85zte9gkVX95H3
y2JEqgfwRAH6x9srfYEUHMUqXKbk2/bPbtNTMP0UKBoqAzbKBAooxzyugJ/yAJ52
KKsSo1UOVN1tea3fhZYxq9rvQagJl7t3GhiNJ9tGzfcdmVO5wF4tTw2oOJMTGE88
4ykf5qXYkNufsVhLuc4J1cgF30kKisskDXZE5k1FZQ5Q+qtqVCPcwHSI64zJJtiq
bhinwpw7b23nak4YSmyS/mZS5b0/RNGoeqfezV7aq/QJc0lG/EGITZ94nsBKM0Q=
=uzV6
-----END PGP SIGNATURE-----

--7oepufhamvtnk2gc--
