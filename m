From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH 1/1] i2c: Kconfig: Enable HSI2C for Exynos5 platform
Date: Mon, 4 Aug 2014 23:21:13 +0200
Message-ID: <20140804212113.GA2730@katana>
References: <1403690523-1863-1-git-send-email-sachin.kamat@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="J/dobhs11T7y2rNN"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:38940 "EHLO pokefinder.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752497AbaHDVVS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 4 Aug 2014 17:21:18 -0400
Content-Disposition: inline
In-Reply-To: <1403690523-1863-1-git-send-email-sachin.kamat@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@samsung.com>
Cc: linux-i2c@vger.kernel.org, linux-samsung-soc@vger.kernel.org, spk.linux@gmail.com, kgene.kim@samsung.com, Doug Anderson <dianders@chromium.org>


--J/dobhs11T7y2rNN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 25, 2014 at 03:32:03PM +0530, Sachin Kamat wrote:
> All Exynos5 platforms have HSI2C controllers and are needed by
> various IPs connected to the boards based on these SoCs. Thus
> select this by default for Exynos5 platforms.
>=20
> Signed-off-by: Sachin Kamat <sachin.kamat@samsung.com>
> Cc: Doug Anderson <dianders@chromium.org>

Applied to for-next, thanks!


--J/dobhs11T7y2rNN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJT3/lJAAoJEBQN5MwUoCm2unoP/3BVg+T0z6QzLLeeOY1PzZ0a
InCpJafFb8pdVfFc+Aq6M2wrez4rt2hKeqaX13TsHxvG9iNnY2vB1CtNd19MhSa9
0Djcp6zOhYn7aOot0Ps4Ql1TnDqH9VhUv8ysTAedqcZPeb/5gc/g8l5CgHSeFYTb
R8ObQVbpTAJecUQpc5+YCFSaJk1WYXW/QKFd0MCX8RSoIclJne93mPLULCsUeRPQ
6qhSYuVvUsS9GHhzh4q4iOLTCK8nemZkElSW8Bm7CD3syWwLyxS5h8J7mreXOZ5o
hwbtGmkvFp73XzKfBop9ac9BQom1vjjY64IaqL/HF9/2zPL40vuLsF50v0CxrSVO
V3r7MyKtfj2CJApy02YuQGKgoDQM6TcGnZ2ZUSYK5kz9kL0mOv0D6cXwD8/CGxGs
81kwF+gTXivpkyRbL80UoZ5rY3pdoxiOQz6NEwUuMuREKKFsyCMQ4BHcuLIDufJX
jcCevqYA/ivwqQOADfHjf0NxNLIRA7kTy7Nj2l0Aekp1LD/2pniBGzVy/H1fTDqk
sgmEK/J9Pad0Pct5KHt82hiHc/YGAMxFkmJL+iLwR3cW2jmf+tmBBK6SRMziDOfn
6Zn+TLf8IuCT+1dWDEz9IvGTmQD+AqzpdlJxPh1zddck6NTPSTUlKQ1eDlpZryqy
GGOWNKb2hUtmm3LNYTxj
=ObFw
-----END PGP SIGNATURE-----

--J/dobhs11T7y2rNN--
