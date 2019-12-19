Return-Path: <SRS0=HBcY=2J=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA03FC2D0C0
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 19 Dec 2019 12:37:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8ABD5222C2
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 19 Dec 2019 12:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1576759034;
	bh=HfXFwm2OTVOtOEegELMeB2WDHLuPSp3FdYVhwyoA4LE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=DVIU1q3wWPUDgAkB8pr+KJbuBJZjup+fSR0JX2d6JP2nz4ax2MycqwDzDI6jFX4N9
	 RynJbbx0spA8WUYSubtZq3G2DOMogJ/139nFPIdzpJToC8fvb+vPAbndkevl5neXFf
	 CUsyGbm6EM1IzkMU0wYMXGwTFliqcg6AlqvPWkrQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726818AbfLSMhO (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 19 Dec 2019 07:37:14 -0500
Received: from foss.arm.com ([217.140.110.172]:38328 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726699AbfLSMhN (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 19 Dec 2019 07:37:13 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 069DB31B;
        Thu, 19 Dec 2019 04:37:13 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CF9E83F719;
        Thu, 19 Dec 2019 04:37:11 -0800 (PST)
Date:   Thu, 19 Dec 2019 12:37:09 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Tzung-Bi Shih <tzungbi@google.com>,
        ALSA development <alsa-devel@alsa-project.org>,
        Dylan Reid <dgreid@google.com>,
        Jimmy Cheng-Yi Chiang <cychiang@google.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Takashi Iwai <tiwai@suse.de>
Subject: Re: [alsa-devel] [PATCH v2] ASoC: max98090: save and restore SHDN
 when changing sensitive registers
Message-ID: <20191219123709.GB5047@sirena.org.uk>
References: <CGME20191128152110epcas3p2b205b4b55f6d8bfac42fcb8faaade93c@epcas3p2.samsung.com>
 <20191128151908.180871-1-tzungbi@google.com>
 <8aceb9ec-aa6e-1fa4-cee9-e22084c141e8@samsung.com>
 <CA+Px+wXPa_cwdZUQfCx4jAhhj4Q9b7bNABUGazLKOJ7U5ae-mA@mail.gmail.com>
 <20191218132620.GE3219@sirena.org.uk>
 <f6453e48-cd95-6471-8945-4cc0ab3d04d9@samsung.com>
 <20191218162422.GG3219@sirena.org.uk>
 <ef908cb8-875e-4339-33bd-5997b594f022@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="i9LlY+UWpKt15+FH"
Content-Disposition: inline
In-Reply-To: <ef908cb8-875e-4339-33bd-5997b594f022@samsung.com>
X-Cookie: I smell a RANCID CORN DOG!
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


--i9LlY+UWpKt15+FH
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 19, 2019 at 09:03:42AM +0100, Marek Szyprowski wrote:
> On 18.12.2019 17:24, Mark Brown wrote:

> I've checked again the exact probe order and here is what happens in the=
=20
> system:

> 1. first call to odroid_audio_probe() is just after:
>=20
> [    2.942428] samsung-i2s 3830000.i2s-sec: DMA channels sourced from dev=
ice 3830000.i2s

> 2. That time, i2s dai and max98090 devices are already registered.=20
> However the snd_soc_of_get_dai_link_codecs() return -EPROBE_DEFER,=20
> because it cannot get the HDMI codec component.

> 3. HDMI codec is being registered when Exynos DRM initializes. This=20
> happens later:

> [=A0=A0=A0 3.127833] [drm] Initialized exynos 1.1.0 20180330 for exynos-d=
rm on=20
> minor 0

> 4. Then odroid_audio_probe() is called again from the deferred probe=20
> worker and succeeds:

> [=A0=A0=A0 3.501198] ALSA device list:
> [=A0=A0=A0 3.501300]=A0=A0 #0: Odroid-U3

> 5. Then userspace starts:

> [=A0=A0=A0 3.603825] Run /sbin/init as init process
>=20
> 6. when userspace init scripts (alsactl) enumerates devices in the=20
> system the lockdep warning is triggered:
>=20
> [   10.068990] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [   10.070970] WARNING: possible circular locking dependency detected
> [   10.077136] 5.5.0-rc2-next-20191218 #7188 Not tainted
> [   10.082168] ------------------------------------------------------
> [   10.088332] alsactl/1106 is trying to acquire lock:
>=20
> 7. then alsa utils probably tries to load the saved values for the contro=
ls, what triggers the NULL ptr dereference:
>=20
> [....] Setting up ALSA...[   10.502672] 8<--- cut here ---
> [   10.502772] Unable to handle kernel NULL pointer dereference at virtua=
l address 000000b0

OK, so this is probably related to some of Morimoto-san's bisections.
Is there any chance you coudld do a bisect to try to isolate where
things go wrong?

--i9LlY+UWpKt15+FH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl37bvUACgkQJNaLcl1U
h9CEAAf/XSI9nZq2Qput3O4cSd2w21qYD50j3CftlQ347thnlUCneiNqxxLoWUIG
kNUK471Pr8mg+1sxXoyr6LUxFbFXLngFWkLW4ZJavXxqpPp88Sx9xXltUnp15grV
tGPqRfguiytnGnOxNdTNYrJ3UFlnO/3PzMTMc/624RTXclOPHkG+IfS0UnX+w58O
w65cgWyJXq6cI3PGkk3wkVJ148iYzIjRlNW9l3HOZF8uEXmmPK4mvuKZlgr9Jrdh
Zcbj0F+w0G9C7Ex8pWL9ZZoHQ7oxmCby3QLv6+vMUOvb2pfudDDOAKPyIc1C9f18
T1B3AMPS0eMM39HYyVYOwMbD7VmJIw==
=VJv5
-----END PGP SIGNATURE-----

--i9LlY+UWpKt15+FH--
