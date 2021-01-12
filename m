Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31950C4160E
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 12 Jan 2021 21:43:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0C00523122
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 12 Jan 2021 21:43:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438132AbhALVh0 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 12 Jan 2021 16:37:26 -0500
Received: from ozlabs.org ([203.11.71.1]:58291 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2437081AbhALU6L (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 12 Jan 2021 15:58:11 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DFjZJ1JDbz9sWk;
        Wed, 13 Jan 2021 07:57:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1610485049;
        bh=oOt9UC3bfgNLTO1XfajBqrAQGTUzyQ0gZrLFC6E3HKU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Hv1aowxpQ+GcGQfyulfIc1P1mB3L6lGbSlN5XXUsET7xYh1wkqDT0x80p8aZPvq1i
         2HTwdUHTD2S43mwoK7jW08qs/SnxBF6H3u2cIboP5QIwNeyA/jtbs3U8cTknHK78dB
         Z9OrIql/t1s8V1mzT7RdF+MWtnXevTBc50ONHqDBqstOjaVD+5Z0JHv0NMhr0OKMa2
         8j4YRR8rOsbQawaCwbtT/qkPG1pWVAj7bBMDgnGP+ILpHLtPEteoU4nM0ZjXkLTgah
         oyCYQXJCXVN20UCtTuetN/8DKj6mcc5RfIlk0OMEz4J3nOw/7eJWCUGnXDPY7F2gbp
         olsd3EKG41vFw==
Date:   Wed, 13 Jan 2021 07:57:26 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-samsung-soc@vger.kernel.org, kvm@vger.kernel.org,
        Daniel Vetter <daniel.vetter@ffwll.ch>, linux-mm@kvack.org,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v7 00/17] follow_pfn and other iomap races
Message-ID: <20210113075726.2ffaef97@canb.auug.org.au>
In-Reply-To: <X/2jC9kBBQCfbC3d@phenom.ffwll.local>
References: <20201127164131.2244124-1-daniel.vetter@ffwll.ch>
        <X/2jC9kBBQCfbC3d@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3kQvshNRwSzGT637_7v3ycs";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

--Sig_/3kQvshNRwSzGT637_7v3ycs
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

On Tue, 12 Jan 2021 14:24:27 +0100 Daniel Vetter <daniel@ffwll.ch> wrote:
>=20
> As Jason suggested, I've pulled the first 1 patches into a topic branch.
>=20
> Stephen, can you please add the below to linux-next for the 5.12 merge
> window?
>=20
> git://anongit.freedesktop.org/drm/drm topic/iomem-mmap-vs-gup

Added from today.

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgement of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window.=20

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
        Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and=20
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

--=20
Cheers,
Stephen Rothwell=20
sfr@canb.auug.org.au

--Sig_/3kQvshNRwSzGT637_7v3ycs
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/+DTYACgkQAVBC80lX
0GxNGgf9EtCDsHg2G5ATJxLMpj0++NlXWmIf8gLWRE7OQLpBu+7tP4EgP4BGf0B6
XKm8FFDJGaYQ+dRRCMllLCFLfjZsxDDRqyQxAZ0TeZNIIW8gBLIHfC73jlqv9i5N
q43QxSqU2CatsUkqt0P9G4JeE5mvDmgr6p4b4Webza6UBzqVvRNLxctL+OP7h+1f
p9kM7E1sHfUofXAeBYGp0DBtEPDzxBjwyyQlcIknDJtNwPMUet2tPvL9Z8nUoODF
z4upF0XEmm4ijYuHOfdxpKg2wHObICkSlbE1sMPs6jb6+DAaW7auRagOsyejlShO
HQrjuzmMDQGxl5vGPO1+K8ZQFRxudg==
=AR5e
-----END PGP SIGNATURE-----

--Sig_/3kQvshNRwSzGT637_7v3ycs--
