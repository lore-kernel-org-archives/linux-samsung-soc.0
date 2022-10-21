Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62437C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 21 Oct 2022 11:54:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229936AbiJULyB (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 21 Oct 2022 07:54:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229691AbiJULyA (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 21 Oct 2022 07:54:00 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5719D24C95E;
        Fri, 21 Oct 2022 04:53:59 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E78F661E3D;
        Fri, 21 Oct 2022 11:53:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B40DC433D7;
        Fri, 21 Oct 2022 11:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666353238;
        bh=KJhnl0M5yBG2dD3JOiVvCDClcYtjP++x/Ni7GrtQW2k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=t81YNIzDw5GjXfpGl7y1vzZy959OrQi2J3gywq6fAWQf9WgVWvLTqdAXKv6Zb3C5+
         yAze1TdE41wibkVTyT5B1IRhzTqXBFIDQ19OwRhH87adZZxQ5Ka5Pao3i0LPxLOeJq
         xaLFPEYzrIMzMJSvOAkEVVmWNVskQGZ8D2ghozaqODi32+f5Ymbv+jxOIn0glBSioy
         5Iay+9eK3JgR6eFRmZvYY0YipKkzclFJLSqqw6ttAN+sK/cWrlHEvuTFJUdwbVIqD0
         EvGLCY02aglGYrBmh0PK5Fklx+Qtreru6BRy/3lafQuDc0Ot7AhHQyKdLcEL5wK5he
         OeTM7tMiobvpA==
Date:   Fri, 21 Oct 2022 12:53:51 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>
Cc:     lgirdwood@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, s.nawrocki@samsung.com,
        perex@perex.cz, tiwai@suse.com, pankaj.dubey@samsung.com,
        alim.akhtar@samsung.com, rcsekar@samsung.com,
        aswani.reddy@samsung.com, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 2/6] ASoC: samsung: i2s: configure PSR from sound card
Message-ID: <Y1KIT4nk7C8SQ45x@sirena.org.uk>
References: <20221014102151.108539-1-p.rajanbabu@samsung.com>
 <CGME20221014104857epcas5p2a275a1d606ca066227228d13bcf5b120@epcas5p2.samsung.com>
 <20221014102151.108539-3-p.rajanbabu@samsung.com>
 <Y0lPz91gbovAub9D@sirena.org.uk>
 <04a101d8e523$30804b80$9180e280$@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="0NRq6XULMyp1OM7X"
Content-Disposition: inline
In-Reply-To: <04a101d8e523$30804b80$9180e280$@samsung.com>
X-Cookie: PURGE COMPLETE.
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


--0NRq6XULMyp1OM7X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 21, 2022 at 01:30:25PM +0530, Padmanabhan Rajanbabu wrote:

> We can overcome this scenario to an extent if we can get a flexibility to
> Configure both PSR as well as RFS.

Why does it make sense for the machine driver to worry about this rather
than having the I2S controller driver configure the clock tree?

--0NRq6XULMyp1OM7X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmNSiE4ACgkQJNaLcl1U
h9AGOgf+IEqa8qDBK4xEe3hcK5GsxodK66zuf2kT88FfCFha0D2TVSs+NPkpUn7L
pZwG9CQwoe46jn3+jqPpW4zRh+R16km+qTITXYDB47Q1nhWLfniJDVVTdPe1QH+/
8kdEv3iM6CHGUDqbQli1zATLN2a31b0BMEqRIgMacO9cjxTUYGZAjFxnh3CB9LAp
Chcs+uexRoy6Rm7hhJswsqSM7fvq5HkJDgaTD8hoyd/03jvUpkapl3TWF/mbDgKG
Tu8SyfBzJU1bmmc5NXKX+FSuywemGUsfYTLt+8A693mt/ogxKQROj1SIOi3Mbzgl
hJd7F0TXV8+UxhsaY8JDMmTv6W6MEQ==
=kBk6
-----END PGP SIGNATURE-----

--0NRq6XULMyp1OM7X--
