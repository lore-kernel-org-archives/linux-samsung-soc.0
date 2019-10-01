Return-Path: <SRS0=5wrF=X2=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44607C352AA
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  1 Oct 2019 11:22:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1B49F21924
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  1 Oct 2019 11:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1569928932;
	bh=/MXmDTCuqE0gEOwe0PmTAXgQo3P3m/dh91Ugl2Lf4YQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=fuo998irIqCz7cFXef9luNbQOcgeBFTNshgKCOxIQ/pJGHbGB44nc5qnEKAdmz5zl
	 e/wFgMANOmxEHlbCk/oiuaYXmptq25ykJGiPp4DWUt1FFOufClwXWPzxD6ZrLDE9DZ
	 ESwCktyoFTLNxJEuhP1ASLOCRfFb2rVrwCZrnu/s=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731112AbfJALWL (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 1 Oct 2019 07:22:11 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:36822 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725839AbfJALWL (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 1 Oct 2019 07:22:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=7heQPGkIVbEFXhU3j/wrPl6TKVDDlgqYAUYzvbl/ugY=; b=iQMAS7INtS2rc5uNSAbs2fFFW
        m0Y8QbxuankG2so1itRjNFr/UV1KO+ApQ1bzmzwAK9JRvpat5Ev88U6AGFj0laAEyAprsmxstN58P
        q669/FzUnY/ztiAnrnxJ6cGX4cdOtxoY8MbCyT0lWquF7XBt9iIjwRYHg1XBbLN45Ih/0=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=ypsilon.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1iFGED-0004Ol-TW; Tue, 01 Oct 2019 11:22:01 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id 63663274299F; Tue,  1 Oct 2019 12:22:01 +0100 (BST)
Date:   Tue, 1 Oct 2019 12:22:01 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     krzk@kernel.org, lgirdwood@gmail.com,
        ckeepax@opensource.cirrus.com, sbkim73@samsung.com,
        alsa-devel@alsa-project.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, patches@opensource.cirrus.com,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com,
        m.szyprowski@samsung.com
Subject: Re: [PATCH v2 07/10] ASoC: samsung: arndale: Add support for WM1811
 CODEC
Message-ID: <20191001112201.GB5618@sirena.co.uk>
References: <20190920130218.32690-1-s.nawrocki@samsung.com>
 <CGME20190920130321eucas1p2efe85adb3df4c546a7d81326b4c75873@eucas1p2.samsung.com>
 <20190920130218.32690-8-s.nawrocki@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="oC1+HKm2/end4ao3"
Content-Disposition: inline
In-Reply-To: <20190920130218.32690-8-s.nawrocki@samsung.com>
X-Cookie: Dyslexics have more fnu.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org
Message-ID: <20191001112201.mC2GOpO4g2RHsgAcqegoeHt4f9-ek8bjnI3QBMYGl3o@z>


--oC1+HKm2/end4ao3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 20, 2019 at 03:02:16PM +0200, Sylwester Nawrocki wrote:
> The Arndale boards come with different types of the audio daughter
> board.  In order to support the WM1811 one we add new definition of
> an ASoC card which will be registered when the driver matches on
> "samsung,arndale-wm1811" compatible.  There is no runtime detection of
> the audio daughter board type at the moment, compatible string of the
> audio card needs to be adjusted in DT, e.g. by the bootloader,
> depending on actual audio board (CODEC) used.

This doesn't apply against current code, please check and resend.

--oC1+HKm2/end4ao3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2TNtgACgkQJNaLcl1U
h9AYyAf/cMh/RnJSb91Y7ASAzq4JnJLv6QETGdT6/F2YvFYHwLw+XV88qB33VsOC
L9Xn5gOJxnSo/ewhwjmL2MyE8c7BOVuw7DUzg0hBhcmvFCb/AqZstgmedz0xWn4X
jaDpSyvvkCINxkOfmGc/7LFulw9q8tXAyLiBVKcvaqUiUXJwETSDJ1VSZVm12Fnk
lsLUyL+fE1bOUxBEwJhv3FiiUAyVj13mVfPN4xEWVY0JJHoe+YcN+HrYfHVcCwPo
vEVsnqVg4TV0ziGgzjW8nW4aHH6doqdnsojCOunjsTPhMqAVFwoTRF7xnSQgyFSJ
YPG6Fg/jY/DKErg6HcpOgX0em+1s+w==
=G3VW
-----END PGP SIGNATURE-----

--oC1+HKm2/end4ao3--
