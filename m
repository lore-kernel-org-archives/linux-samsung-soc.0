From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 2/2] ARM: S3C64XX: Hook up carrier class modules on
 Cragganmore
Date: Tue, 15 May 2012 18:37:09 +0100
Message-ID: <20120515173706.GD4140@opensource.wolfsonmicro.com>
References: <1337016041-16096-1-git-send-email-broonie@opensource.wolfsonmicro.com>
 <1337016041-16096-2-git-send-email-broonie@opensource.wolfsonmicro.com>
 <07fc01cd3278$dbbf63f0$933e2bd0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="SO98HVl1bnMOfKZd"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:60827 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S966081Ab2EORhM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 May 2012 13:37:12 -0400
Content-Disposition: inline
In-Reply-To: <07fc01cd3278$dbbf63f0$933e2bd0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, patches@opensource.wolfsonmicro.com


--SO98HVl1bnMOfKZd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 15, 2012 at 05:58:12PM +0900, Kukjin Kim wrote:

> Looks good to me, but there is no '{ I2C_BOARD_INFO("wlf-gf-module", 0x20) },' in my tree.

> Just adding address 0x22 stuff is enough now?

Yes, it is - sorry, context diff for another project.

--SO98HVl1bnMOfKZd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJPspQ4AAoJEBus8iNuMP3dDBwQAJ29Nh132OKBytiE+lbyHtpq
fPBspjtMdPXJuTl3ihxI5fBMLkQRNjGA6guXEEVipyiPH3UEqbhaLhgye6T5FeR3
CccqgBuDkJGoiSsQDBWfC6Cl9pTn/ZEcEo0Ug4C2gltgyepR+ZGZIKxgiawn+JyV
gQshiw81r5WTrydMEDRSxdnSFpUkqS5xeAQqnEWMyqRBkU/+4OLdEh8I69Pwq7KQ
FuqJBHsiV48xDCruoR8uRnHI3PNqth3ebmEN1Yfz9bAGf+TG16JVZhLHchvbQ2VN
vBuRU2+eRuj+JqIOCPEthHaQWZCCVvy1sMbtl499tP8doyUVTManOkSIVu6mSnKC
5zM+5abtVLPt0ALcB1Q47NXLSsFWphT27HtPyUVoLFaXdOrSZhQ8Bjiox+Semxay
gGTs+6T38jf+8DgAieIpelFcf5z4TBk5nWyFrd4U8QWvGySw3nJd6PBSB3MkQcef
n22j2yg+8dHzgggAAX9T2y2jxvhvg2NsFNgiO9XnNezK87s0rH9IBYzYJV2ZlI9m
zI/l9P/CjdYzKvQ+DAU53plYfgbh6EiWmBrGWNAtoHpq3LWhBnln9DPM/lJabjXk
9LiKFZM3kV1PCbZM3qYHh+lQUCpiKyPOwd/Dja0O/esKRE/RakOrMcq11KJJblEg
x9vEaiaqMgQ9mPVMShcq
=Jx5U
-----END PGP SIGNATURE-----

--SO98HVl1bnMOfKZd--
