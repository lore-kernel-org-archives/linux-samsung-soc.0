Return-Path: <SRS0=wFHd=2I=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDA40C2D0CD
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 18 Dec 2019 16:26:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 92C00227BF
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 18 Dec 2019 16:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1576686360;
	bh=D5/Knsu61tYmLUbsJC2csZEaitNDOkGfwUwk5lSKLlA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=PdlkOCKKWdPtYRvGh7tZ5TAf9OYavR4zv5cSr8fhHSBVV4EInH781XO1FYZHSacmA
	 cwJLPqy946fg0HonB5zyyC8HhWqhC18Nnp28vHtvFGHUAVX+lt66LygGRqkEa0g+Fm
	 qpMrQNEgSVQqCtSz/s+d0EI8kfHXBoMHQW2C5ohI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727642AbfLRQYZ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 18 Dec 2019 11:24:25 -0500
Received: from foss.arm.com ([217.140.110.172]:51858 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727640AbfLRQYZ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 18 Dec 2019 11:24:25 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ACAAC31B;
        Wed, 18 Dec 2019 08:24:24 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2934F3F85C;
        Wed, 18 Dec 2019 08:24:24 -0800 (PST)
Date:   Wed, 18 Dec 2019 16:24:22 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Tzung-Bi Shih <tzungbi@google.com>,
        ALSA development <alsa-devel@alsa-project.org>,
        Dylan Reid <dgreid@google.com>,
        Jimmy Cheng-Yi Chiang <cychiang@google.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Takashi Iwai <tiwai@suse.de>
Subject: Re: [alsa-devel] [PATCH v2] ASoC: max98090: save and restore SHDN
 when changing sensitive registers
Message-ID: <20191218162422.GG3219@sirena.org.uk>
References: <CGME20191128152110epcas3p2b205b4b55f6d8bfac42fcb8faaade93c@epcas3p2.samsung.com>
 <20191128151908.180871-1-tzungbi@google.com>
 <8aceb9ec-aa6e-1fa4-cee9-e22084c141e8@samsung.com>
 <CA+Px+wXPa_cwdZUQfCx4jAhhj4Q9b7bNABUGazLKOJ7U5ae-mA@mail.gmail.com>
 <20191218132620.GE3219@sirena.org.uk>
 <f6453e48-cd95-6471-8945-4cc0ab3d04d9@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="4eRLI4hEmsdu6Npr"
Content-Disposition: inline
In-Reply-To: <f6453e48-cd95-6471-8945-4cc0ab3d04d9@samsung.com>
X-Cookie: Power is poison.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


--4eRLI4hEmsdu6Npr
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 18, 2019 at 03:48:14PM +0100, Marek Szyprowski wrote:
> On 18.12.2019 14:26, Mark Brown wrote:

> >> - snd_card_new( ) succeed in snd_soc_bind_card( ), so that userspace
> >> can see the control

> > This feels like snd_card_new() is being overly enthusiastic here, I'd
> > expect that we might have other problems elsewhere with that.  I'd not
> > expect userspace to see things until snd_card_register() since between
> > _new() and that we're in the process of building the card up.  Given
> > this we *will* need to handle partially constructed cards after all,
> > unless we change the ALSA core.  Takashi?
>=20
> I'm not sure if this is an issue about partially registered card. Here=20
> is the boot log:
>=20
> https://paste.debian.net/1121543/

> This oops happens when udev tries to do its job. The card is earlier=20
> fully registered and advertised by alsa:

> [=A0=A0=A0 3.501198] ALSA device list:
> [=A0=A0=A0 3.501300]=A0=A0 #0: Odroid-U3

That's not what the analysis I was replying to said :(

This log makes no sense to me, if this is the same card that was
registered and announced earlier what caused it to become unregistered
so that we are registering it now?

> If there are any useful logs for tracking this issue, let me know how to
> enable them, so I will provide more logs.

It'd be good to understand this unregistration/probe deferral for a
start...  when did the card get unregistered and why?

--4eRLI4hEmsdu6Npr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl36UrUACgkQJNaLcl1U
h9AdvQf/d6VYqwcgXnuFMs3zAieeQ+JuTqPm7FiB6AbcjqPAmL/PxvH+MArujCqk
WkeMBpwfCZpkhXspVR/yKG8maniKAmoV38Z/cBmcGv+aQrGmEuDzmLeidngPPr1H
DmyG9uZ3T1bz+zqnGmGid2lPN54VeEGgsdiO/u1Fh1EUHZ0Vej5UA9UPmtTWxzrN
lSp/mQE9ZJiqr8YhZtkUaRm2EU7tosw3RUnq2CjYg2faor9yZRFFa83+rSpojhCT
0I3DhUvxHw0QRo6bGMvR1RaGE+oeGHGVTtXO/BJk4r/IXOUXNC6ilVKQVamLnUbV
O6IFY/Q0mtgGEANxTjS/4F7HiO9piQ==
=BA/X
-----END PGP SIGNATURE-----

--4eRLI4hEmsdu6Npr--
