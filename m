Received: from mta0.migadu.com (out-93.mta0.migadu.com [91.218.175.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A504A8A3C
	for <linux-samsung-soc@vger.kernel.org>; Thu,  1 Oct 2026 09:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790848734; cv=none; b=CJeuYULiv4HLiFV6dumjhFeSwZzN/5H/AlN4K1Z1sWCm29zN8J9uqF9/4/entuePsVSRWmoRXfOcLwDe602aAxvL8dNTY5vS1mdVNzjdicJGCUwa0rDjOSgVhNj/kZ9wtzc1E+Tj5+ETmMzptX5jER1d0XikZTwhnbMj3UVxksA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790848734; c=relaxed/simple;
	bh=VYkw38vXccedXe7/VFxScAzP/yByphJr6jcUEvgt6sI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d9g7HEeYs2PPL1b+3Em+4r/jQT+4pQUEiZjp6BUS7NC1MfDee+vVZve21AyEUeJZdMAZrlfIWhGn1kgHc3Nn8QDkx/8ycruoXfFNu4dJrGorf5SuQBbBT+kARzXFBlIMR7pqJLU1f4V+2vvzN9tA58gw+cVCD+aayKXejXNGQmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=grimler.se; spf=pass smtp.mailfrom=grimler.se; dkim=pass (1024-bit key) header.d=grimler.se header.i=@grimler.se header.b=gvIzqcsS; arc=none smtp.client-ip=91.218.175.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=grimler.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=grimler.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=grimler.se header.i=@grimler.se header.b="gvIzqcsS"
X-Envelope-To: linux-samsung-soc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=VYkw38vXccedXe7/VFxScAzP/yByphJr6jcUEvgt6sI=;
 c=simple/simple; d=grimler.se;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790848727; v=1; x=1791453527;
 b=gvIzqcsSpGGSd8xwJV8LAQidmX6DpJW8w3rXWgBLsrQjKn0CcozqHAA5bZhGQXJbQWoF2VCm
 9HT50gMS9iMtGeZYt/bnWorP1qqY8iAeMoy4Fg4emewtflElWuGDt/y4twkhsXkuWBrAHwZxDjc
 mKvYg/3ZhqqHna25vhoxw3SI=
X-Envelope-To: linux-samsung-soc@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 75f6aa3334aa47bb;
	Thu, 01 Oct 2026 09:58:47 +0000
X-Mizu-Trace-ID: 75f6aa3334aa47bb
X-Migadu-Flow: FLOW_OUT
Date: Thu, 1 Oct 2026 11:58:44 +0200
From: Henrik Grimler <henrik@grimler.se>
To: Kian <kianprogramer@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: Samsung Galaxy J7 Pro =?utf-8?Q?=28j7y?=
 =?utf-8?B?MTdsdGUpIOKAlA==?= Upstream Linux support
Message-ID: <20261001095838.GA26093@localhost>
References: <CAC-nSOxO_9tSE8jNGGQZKPtiKPq0qn2sgGWppzD_8yu1q=Wamg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="b0uKHmnE8itGM4fo"
Content-Disposition: inline
In-Reply-To: <CAC-nSOxO_9tSE8jNGGQZKPtiKPq0qn2sgGWppzD_8yu1q=Wamg@mail.gmail.com>

--b0uKHmnE8itGM4fo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Kian,

On Thu, Oct 01, 2026 at 10:33:42AM +0330, Kian wrote:
> Hello,
>=20
> I am reaching out regarding mainline Linux support for the Samsung
> Galaxy J7 Pro (SM-J730F, j7y17lte), which is based on the Samsung
> Exynos 7870 SoC.
>=20
> The Exynos 7870 already has upstream Linux support and ongoing
> community development, including Device Tree support for the SoC and
> several devices based on it.
>=20
> There have also been several community projects and attempts
> specifically targeting the J7 Pro. For example, there are existing
> Device Tree sources such as exynos7870-j7y17lte.dts, previous attempts
> to boot newer Linux kernels on the device, and Linux/postmarketOS work
> targeting the actual J7 Pro hardware.
>=20
> These projects are useful starting points, but each of them has its
> own limitations, missing functionality, or unresolved issues,

I think you are misunderstanding the community projects. They are
missing features or have unresolved issues because no one has had
time, or the skills, or the interest, to work on the
features/issues. Issues or regressions happen with mainline linux as
well, and there is no guarantee that anyone has time or interest to
discover and investigate issues for older devices here
either.

> and none of them provides complete upstream support for the J7 Pro.

"complete upstream support" would be the (un-achievable?) end-goal, of
course none of them prove complete upstream support.

> I can provide links to these projects and repositories so that the
> existing work can be reviewed and compared.
>=20
> Rather than creating yet another unofficial downstream kernel or
> another separate community project with its own limitations,

Ok, but how will you test your patches? It seems a lot easier to test
the kernel together with a community project rather than writing your
own initfs and rootfs and essentially inventing yet another community
project in the process.

> I would like to try to bring the existing work together and work
> toward proper upstream Linux support for the device.

PostmarketOS (now re-branded as Nura [1]) encourages contributors to
send their patches upstream, a lot of time has been spent on writing
wiki pages about the upstreaming process, and creating a mainlining
guide [2, 3]. I suggest you read the guide and reach out to the other
people working on exynos7xxx devices.

> Would someone familiar with the Exynos 7870 platform and Samsung
> Device Trees be interested in reviewing the existing J7 Pro work and
> assessing what is still required for mainline support?

Rather than thinking about what is missing you should start testing a
small barebone .dts for your device (maybe with uart/serial and/or
framebuffer support and not much else), and add more features when you
have had the time to properly test and verify them. This is where
community projects are useful, you can collaborate with others that
are working on the same or similar devices and test&develop features
together.

> I own a physical SM-J730F and have access to the actual device for
> development and testing. I can provide the links to the existing
> community projects, Device Tree sources, repositories, and other
> relevant work.
>=20
> I am willing to do anything that is reasonably within my ability to
> help with the upstreaming effort. I can perform hardware testing,
> collect boot logs and dmesg output, investigate hardware and Device
> Tree information, reproduce issues, test kernel and Device Tree
> changes, test patches on the actual device, and provide reproducible
> test results. If additional information or specific tests are needed,
> I am also willing to carry them out and learn whatever is necessary to
> help with the development process.

Sounds great, only thing missing is then to create the dts for the
device, and probably add support for your device to some drivers. Most
likely no one here will prepare patches for you, so this is a great
opportunity for you to learn how to do those things.

Again, I suggest you get involved with a community project and learn
=66rom, and together with, the other people interested in adding support
upstream for similar devices. Nura(/PostmarketOS) for example has an
active exynos-arm64 community that work on exynos7xxx and other arm64
SOCs, please check out their matrix chat [4].

[1] https://nura.eco/blog/2026/09/27/nura-rename/
[2] https://wiki.nura.eco/wiki/Mainlining
[3] https://wiki.nura.eco/wiki/Mainlining_Guide
[4] https://matrix.to/#/#exynos-arm64-mainline:nope.chat

Best regards,
Henrik Grimler

> I do not want to simply create another unofficial project for the J7
> Pro. My goal is to make use of the work that already exists, identify
> what is missing or needs to be fixed, and help move the device toward
> a clean and maintainable upstream implementation.
>=20
> If there is interest in working on this, I can provide the relevant
> project and repository links, Device Tree sources, logs, and any other
> hardware information I have available.
>=20
> I would be very interested in helping bring the J7 Pro into the
> upstream Linux ecosystem, and I am willing to contribute wherever I
> can.
>=20
> Thank you for your time and for your work on Samsung Exynos support in
> the Linux kernel.
>=20
> Best regards,
>=20
> A J7 Pro owner and contributor
>=20


--b0uKHmnE8itGM4fo
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQFPBAEBCAA5FiEELH8prpeJH2QZqeLNsAduSQtxYWsFAmq+Ls8bFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMywyAAoJELAHbkkLcWFrMpoH/3YTAonzJUvyMR20bMRs
XLof7AyQYLp166+NuMBl+deKA43RWChRBVa/bSyYLk2PCKhBr2jLnTdCeytS9lw7
W10wlz5ZuD/3BsfTOycoeMDv1P09quljdMHjPTUTHIcOIpGFlWPiO27m1jSYg9Pd
02Tg5uFELeBSwUV6aAoS0P1V946aIGRZr+lne5gaSYqPAGdbk+HK3bNK1o09S4G4
f0Ubi1KBzfNuvDZeQULuVwqM6eVPafkRP0Xsy/xC9vdXQWLr3cgJ7tUPrvIIseJX
XjGRbMi5l9QchODnV0/32SFW88V5coUvL/54+NIkmZAv1MYMYaX9beGcYKMyMURk
zWI=
=xrL4
-----END PGP SIGNATURE-----

--b0uKHmnE8itGM4fo--
