Return-Path: <SRS0=HBcY=2J=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 321CBC43603
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 19 Dec 2019 13:06:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EF90320684
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 19 Dec 2019 13:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1576760763;
	bh=oVarDt40Neq0a7Blhta+Ks4RnwtlAbQWaWj8VLJOEpY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=INJ+YyQpEEB1OlfI9qoJMrg+QqbJ/ndt1AbEzzyQxLUPvyHS3KPnBn2LlBTakZjkk
	 pONhJWHqSiBIvXVOaTg95IP3fzDfh/AoKd+g4s6vcPLL2lF2tUar9174uKDY9+Z9QU
	 1mdP8OwmFTPdO8bVu9HHc1Uuz+tm7nwFXi8UXqJA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726719AbfLSNGC (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 19 Dec 2019 08:06:02 -0500
Received: from foss.arm.com ([217.140.110.172]:38566 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726701AbfLSNGC (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 19 Dec 2019 08:06:02 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CEE3031B;
        Thu, 19 Dec 2019 05:06:01 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4E5783F719;
        Thu, 19 Dec 2019 05:06:01 -0800 (PST)
Date:   Thu, 19 Dec 2019 13:05:59 +0000
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
Message-ID: <20191219130559.GE5047@sirena.org.uk>
References: <CGME20191128152110epcas3p2b205b4b55f6d8bfac42fcb8faaade93c@epcas3p2.samsung.com>
 <20191128151908.180871-1-tzungbi@google.com>
 <8aceb9ec-aa6e-1fa4-cee9-e22084c141e8@samsung.com>
 <CA+Px+wXPa_cwdZUQfCx4jAhhj4Q9b7bNABUGazLKOJ7U5ae-mA@mail.gmail.com>
 <20191218132620.GE3219@sirena.org.uk>
 <f6453e48-cd95-6471-8945-4cc0ab3d04d9@samsung.com>
 <20191218162422.GG3219@sirena.org.uk>
 <ef908cb8-875e-4339-33bd-5997b594f022@samsung.com>
 <20191219123709.GB5047@sirena.org.uk>
 <aba9f63c-d993-e54e-4daa-9dbc35d0683b@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ILuaRSyQpoVaJ1HG"
Content-Disposition: inline
In-Reply-To: <aba9f63c-d993-e54e-4daa-9dbc35d0683b@samsung.com>
X-Cookie: I smell a RANCID CORN DOG!
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


--ILuaRSyQpoVaJ1HG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 19, 2019 at 01:54:37PM +0100, Marek Szyprowski wrote:

> I can do the bisect, but please let me know exactly what to bisect.

> The initial bisection I did was from v5.5-rc1 to linux-next and pointed=
=20
> to the $subject commit.

You can't trigger this via any other mechanism, all the other controls
are fine?  There's *clearly* no issue with what the commit is doing,
it's just flagging up that the card is not set.

--ILuaRSyQpoVaJ1HG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl37dbYACgkQJNaLcl1U
h9CULQf8Cf4H9g1G0O9dE06LsPe2es8RMG+o2fIRt91+QvNY4t3srp8g2LryVeDn
B5Jfc5oq3WkKuEfhkQqdz7UrWquX69dRaBsj8r5GP5Jib9QwauBIJ1H5VpbqZaj0
rfpjHzAs88qbQPdyUvKZPIYtT7eTytWO6F7idYyZX0MZ7tXKv8H3DWEzgmR335D6
p3z7W+u36fEPmBJzCmA2Kdz9zmVHLyP/hm6WVr/rEuKTT3YfM1BwMzqTnppGmwSD
LLWzxZtwuCJKS4DQ/0QeJX+6yqcJIiX7RCvaR5PCrWfNdb6GYFnqVatpcRhtY5O9
Txfhiy9t+GS7YJHJwrgI35zHIPT7Aw==
=ge2e
-----END PGP SIGNATURE-----

--ILuaRSyQpoVaJ1HG--
