Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769C621323A;
	Tue,  4 Feb 2025 18:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738692811; cv=none; b=XN7T/PiGGrMx1MZez/x+yBJmtQxbteoU9kOvqfvumYq40/niOewsP9hZ8p7mDin9gCFOcqthc7BhaMvfD0GeLZwV1SfLus/Bho1Ml37oalzJ+CqS+S4FNIPdLVE/Hsag5bZjmO9ten20rl9faImHIdX2tWspyF3yN/UZevMMz6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738692811; c=relaxed/simple;
	bh=kng2DyWqA6JNggrFjlRb12di5rEVwAZW0UowZQv67Dk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pYZIITLzNShzOaCVaWeaCrz9o2ozvW+T6N7Jnfjmc+NLbK2Fd2d52CKfGo61P5M6nCrfk6//hMbZraSwG4HrDuZIkaKcR3rJqqAmhUST9ZHmHs58fGMfV5Y879lIvX+/pFRJCEzWNtY0PZ17uUavueGPuxF/Kmup3gYDvCijrpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hf5aon4q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hf5aon4q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C6E4C4CEDF;
	Tue,  4 Feb 2025 18:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738692810;
	bh=kng2DyWqA6JNggrFjlRb12di5rEVwAZW0UowZQv67Dk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hf5aon4qmPlqr4e++nSMJgvbrB3O224PLfXIuYjCkj744Yg2dzK+Z2AIkiAIFElBm
	 rNWNNLp3/rANocqTUJU+tJr55DRrrqRyDCgR8gH+wFbfyA30meY7LQVluU6wlCnYCH
	 JRdZ4FChhk1gugaCtikxrEBZy/29ZMCsYmsfYXR35qlgqeOtAQWAKY0qI3SttiSShq
	 3ES8dyRIsIPqQ0suLHUWJm/gyRUgh4bTtqMwZPkgrusWj7NiAHLIhxmszAOdq/1cRz
	 lxW4jZC34BX2o0e1AMSp43157jv5chMWOF5W8clTvycuQSTHWn4MvMsI1nQwEh33tO
	 j1TvVDDYwMLNg==
Date: Tue, 4 Feb 2025 18:13:26 +0000
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Kaustabh Chakraborty <kauschluss@disroot.org>,
	Rob Herring <robh@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sergey Lisov <sleirsgoevy@gmail.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Add chip ID for Exynos7870 SoC
Message-ID: <20250204-stump-irritably-9a888742b1f7@spud>
References: <20250204-exynos7870-chipid-v1-0-0bf2db08e621@disroot.org>
 <339ea40f-6bc7-42ad-a5c2-f57b3be8cc39@kernel.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="t2zFMrcacXUKjbe6"
Content-Disposition: inline
In-Reply-To: <339ea40f-6bc7-42ad-a5c2-f57b3be8cc39@kernel.org>


--t2zFMrcacXUKjbe6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 04, 2025 at 08:53:31AM +0100, Krzysztof Kozlowski wrote:
> On 03/02/2025 21:32, Kaustabh Chakraborty wrote:
> > This patch series is a part of Exynos7870 upstreaming.
> >=20
> > Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> > ---
> > Kaustabh Chakraborty (2):
> >       dt-bindings: hwinfo: samsung,exynos-chipid: add exynos7870-chipid=
 compatible
> >       soc: samsung: exynos-chipid: add support for exynos7870
> >=20
> >  Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml | =
1 +
> >  drivers/soc/samsung/exynos-chipid.c                                 | =
1 +
> >  2 files changed, 2 insertions(+)
>=20
> When I asked to split, I said per subsystem. Soc is one subsystem.
> Everything targeting SoC should be in one patchset. get_maintainers.pl
> tells the name of the subsystem and its maintainers.
>=20
> If there is going to be resend/new version, combine patchsets for soc
> into one patchset (just like the example I gave last time).

And please send patches to the address people list in maintainers, don't
modify the addresses.

--t2zFMrcacXUKjbe6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ6JYxgAKCRB4tDGHoIJi
0jLeAQDdvqoiOqQKqVa5LNCQXQV66EX+r7UEIBsCt9LVGuMpewEAw0yZ2uQRkO3F
3PnnDGci0d1yk9WSOgA3ys9/3IWmagU=
=OWFK
-----END PGP SIGNATURE-----

--t2zFMrcacXUKjbe6--
