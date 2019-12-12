Return-Path: <SRS0=7hfY=2C=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B47CEC43603
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 12 Dec 2019 16:48:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8857E21655
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 12 Dec 2019 16:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1576169292;
	bh=c1is5yWpQ/pjCV/lmKQ/sltbXOXLEPlFpvz/h8cdpUY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=qg6tE5MSuOzKe/N8BLLcaoQ7OoSdpwGyZfZBw75sUMfpe+BhkFyaw4efGGXibhH8e
	 vFpIPq1X3Fp7izKXUj2qDyz7A+1QgQy5GJA2pnTys6EYxla2NGUWHDzlHv1ROG8Yi+
	 Z+Z6TwotytRiyOL0rdQsNIFs/BJufcXzhMw16NGk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729776AbfLLQsM (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 12 Dec 2019 11:48:12 -0500
Received: from foss.arm.com ([217.140.110.172]:53180 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729762AbfLLQsM (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 12 Dec 2019 11:48:12 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6378930E;
        Thu, 12 Dec 2019 08:48:11 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D6B6C3F6CF;
        Thu, 12 Dec 2019 08:48:10 -0800 (PST)
Date:   Thu, 12 Dec 2019 16:48:09 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Tzung-Bi Shih <tzungbi@google.com>, alsa-devel@alsa-project.org,
        dgreid@google.com, cychiang@google.com,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        'Linux Samsung SOC' <linux-samsung-soc@vger.kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [alsa-devel] [PATCH v2] ASoC: max98090: save and restore SHDN
 when changing sensitive registers
Message-ID: <20191212164809.GH4310@sirena.org.uk>
References: <CGME20191128152110epcas3p2b205b4b55f6d8bfac42fcb8faaade93c@epcas3p2.samsung.com>
 <20191128151908.180871-1-tzungbi@google.com>
 <8aceb9ec-aa6e-1fa4-cee9-e22084c141e8@samsung.com>
 <129540e9-a4e8-3d01-41bc-e7c9c04bbefe@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="U3BNvdZEnlJXqmh+"
Content-Disposition: inline
In-Reply-To: <129540e9-a4e8-3d01-41bc-e7c9c04bbefe@samsung.com>
X-Cookie: We have DIFFERENT amounts of HAIR --
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


--U3BNvdZEnlJXqmh+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 12, 2019 at 05:02:50PM +0100, Marek Szyprowski wrote:
> On 12.12.2019 15:09, Marek Szyprowski wrote:

Please delete unneeded context from mails when replying.  Doing this
makes it much easier to find your reply in the message, helping ensure
it won't be missed by people scrolling through the irrelevant quoted
material.

> >> +static void max98090_shdn_save(struct max98090_priv *max98090)
> >> +{
> >> + mutex_lock(&max98090->component->card->dapm_mutex);

> The NULL pointer dereference demonstrated above is caused by=20
> max98090->component->card being NULL here. Adding a simple !=3D NULL chec=
k=20
> here and in the max98090_shdn_restore() function fixes the boot issue,=20
> although the deplock warning is still there. The question is that is the=
=20
> max98090->component->card being NULL is a normal case or something that=
=20
> needs further analysis.

It'd be good to get a bit more analysis, the _shdn_save() call looks to
have come from a userspace write and we shouldn't be exposing the card
and hence the controls on the card to userspace until it's fully
instantiated.

--U3BNvdZEnlJXqmh+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl3yb0gACgkQJNaLcl1U
h9C/Wgf/Y7I6BrvNaFrXEHzt/taVhn/ZZlQSgnHib0N9rpkW7Zf1L//y4/7mCnDu
qJGJ5JruhXB4XgVIlHKcLVOLf56SLMRIMyFg/hg92q0osUO1B3otOdzHRoWLXlms
VAJK9oarfeMgC3YZ3Z0DGKTUlpco0nl9QCs34Rv0E0Aff78l82UBpbDjjnntXGI+
ljNTxjoMrfsiyY4qORmoj8kOrEqamZPawYLLOxmyd9NKCbAldAOXj0cBJ82y8/ua
unOYRfbXfswv5Ah6w3xrjUo/2Zqbc9s1PgQl4J2pYxyROaIUA4LNdq3a1UUjRth2
BBzbbMKZt6G+oBpRzW9dAuknlEIwqA==
=5wJQ
-----END PGP SIGNATURE-----

--U3BNvdZEnlJXqmh+--
