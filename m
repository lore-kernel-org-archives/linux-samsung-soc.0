Return-Path: <SRS0=ZqIQ=26=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4690C282DD
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  9 Jan 2020 21:18:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8446A2073A
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  9 Jan 2020 21:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578604716;
	bh=jrVfvp+e9h+2AmtydUAghLIE+M/WQkIoKpwscPAmfi8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=VBOg04GPr5QVcqpbr1rHzOSZCiClh9IDw2KvwCcNXRqvyEgSf9XCHR0WyVWkYzzNQ
	 xuiDzY9zSnFzYblNGvlDLoyC8P/874/JvX1GCrJAya5ChsSP1lQxeUyyf+04Nve+Ry
	 fPRQxIvvXZfMPB3n+7IVrhRofE9MvnEXy7GPoUyo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725971AbgAIVSg (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 9 Jan 2020 16:18:36 -0500
Received: from foss.arm.com ([217.140.110.172]:36852 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725829AbgAIVSg (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 9 Jan 2020 16:18:36 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A28B031B;
        Thu,  9 Jan 2020 13:18:35 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 25B623F534;
        Thu,  9 Jan 2020 13:18:35 -0800 (PST)
Date:   Thu, 9 Jan 2020 21:18:33 +0000
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
Message-ID: <20200109211832.GI3702@sirena.org.uk>
References: <20191219123709.GB5047@sirena.org.uk>
 <aba9f63c-d993-e54e-4daa-9dbc35d0683b@samsung.com>
 <20191219130559.GE5047@sirena.org.uk>
 <a10269be-8caf-6e07-71c6-582a1d2c1458@samsung.com>
 <CGME20191219191651epcas5p2ab8031875093df401d9182e7c491eb3d@epcas5p2.samsung.com>
 <20191219191646.GH5047@sirena.org.uk>
 <b0e57646-8a14-e6c0-9daa-28c353dcb77a@samsung.com>
 <31bde14e-1fef-264a-ba1e-fc3051506bf3@samsung.com>
 <20191220120154.GB4790@sirena.org.uk>
 <aed6ff4e-1c04-e20c-aa55-4f2b05952f38@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="oxV4ZoPwBLqAyY+a"
Content-Disposition: inline
In-Reply-To: <aed6ff4e-1c04-e20c-aa55-4f2b05952f38@samsung.com>
X-Cookie: Killing turkeys causes winter.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


--oxV4ZoPwBLqAyY+a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 08, 2020 at 12:54:30PM +0100, Marek Szyprowski wrote:
> On 20.12.2019 13:01, Mark Brown wrote:

> > OK, thanks - that's definitely not the recent refactorings then but
> > something that's been a problem for a long time.  I'm surprised nobody
> > else ran into anything if that's the case...

> It took me a while to get back into this issue and investigate it in=20
> details. It turned out to be an incorrect helper to get component object=
=20
> in max98090_dapm_put_enum_double() function. Following patches:=20
> https://lkml.org/lkml/2020/1/8/358 fix this and (independent) lockdep=20
> issues.

Great - I already applied those.  Thanks so much for taking the time to
dig into this and figure out what the underlying problem was!

--oxV4ZoPwBLqAyY+a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl4XmKgACgkQJNaLcl1U
h9BWQwf7BHTGKaPMG4wpsTigkhm128e94wCef8tBKBif+xS1hZL0TvxZZk0OpSDc
8kG+dxM64qp7AQio2LFSxFxyetR/E2U2NeZDfzQb1i1fsSYDC4SvKd9ah2LOqle4
p0xqJoRUwJT9AH2fT/TEy+H41dT6JLjeI+mU1fOd2U3QzWLn44+K0q9RDjNZr9o/
JGAXz+90+UwsrLgZv2+b12WePS9Meo+9D6uda4pqP8pUsrAyhtm+GwqTEx12nMuI
zecZrvny60em/OskNoClNCBkUEVXwgxQlm43kDxXXcHdHqnE0FS3zERcVyEHWjYK
zqQCFqhBWcY6X4wGKCdMDSeIOLVyaA==
=wRRf
-----END PGP SIGNATURE-----

--oxV4ZoPwBLqAyY+a--
