Return-Path: <SRS0=5wrF=X2=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D4D9C352AA
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  1 Oct 2019 17:56:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 754572190F
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  1 Oct 2019 17:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1569952572;
	bh=09IA50iWj5UoOe6NoCLmvomcEfiW34UyApOZnOL+2Z4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=IzKggr5GGmh7gM4cIkPBl1zPo7todD2cN7wlu4X6Djekb1meN5LzEGnKhIV868WMa
	 5EfFLjHavtm33mrD+8eOjAD8ZNVGucn6MbNo8s3fD3uLIj59IAhwiSqRTf2wC+wdQt
	 6EGdhfNWgMX8Wz8tiSXs5CK7gKmoOmoE5lsjv0G8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726554AbfJAR4M (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 1 Oct 2019 13:56:12 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:50482 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726402AbfJAR4L (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 1 Oct 2019 13:56:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=77rfPmQCy4NXwloZ4biLbH0UoWsY3hytG2t401n/afc=; b=eI2nep1RAhBR2abcugd1/Ea6s
        rfSgWdDz2KAaU2EOkXu1FHsMVCt4LY2BtmwcRr1KnqMiDc1Fkm2phQOq/BxW++5cUO1PJk2zTGVmG
        x/U6KJoQnO9U3OgeXlpjA4vFOPi72QbhbMeKhKt09Ie9yHnU6K8B0DO/ejuOkLsQ1VSx4=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=ypsilon.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1iFMNW-0005s6-1a; Tue, 01 Oct 2019 17:56:02 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id 8191727429C0; Tue,  1 Oct 2019 18:56:01 +0100 (BST)
Date:   Tue, 1 Oct 2019 18:56:01 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     krzk@kernel.org, lgirdwood@gmail.com,
        ckeepax@opensource.cirrus.com, sbkim73@samsung.com,
        alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com,
        m.szyprowski@samsung.com
Subject: Re: [PATCH v3 RESEND 1/3] ASoC: samsung: arndale: Simplify DAI link
 initialization
Message-ID: <20191001175601.GB14762@sirena.co.uk>
References: <CGME20191001123637eucas1p25c7551d4c967e4a2855f6c8d3b096ff5@eucas1p2.samsung.com>
 <20191001123625.19370-1-s.nawrocki@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="QKdGvSO+nmPlgiQ/"
Content-Disposition: inline
In-Reply-To: <20191001123625.19370-1-s.nawrocki@samsung.com>
X-Cookie: Happiness is twin floppies.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org
Message-ID: <20191001175601.X8NQbr3J3xgTLOFiVJT_jrdsV66PE2hte0DCa5srZd8@z>


--QKdGvSO+nmPlgiQ/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 01, 2019 at 02:36:23PM +0200, Sylwester Nawrocki wrote:

> Changes since v1:
>  - rebased due to reordering patches in the series

These still don't apply, please check and resend specifying what you're
basing them on - I don't think this is an ordering issue.

--QKdGvSO+nmPlgiQ/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2TkzAACgkQJNaLcl1U
h9CUywf/abOQN54gj8rAY85VcxKmxrItf1FNrBL2z0rFILYKV38ByUMbaQN/JVVu
shCwNnjyFJxrrVJJkd/S9UyQNZUSzoHLHCfhaAtwqNVsHAJpH5bUxSgkVNODw39H
w6tUOpW2N1Y6ty1twaaOxAhMUM0UmFfnDSL1oQEYiRcOnTbUBJaUmqKB3VZDm565
nBhbBhYIdIFMkgQk8FsP3wlAAvOhRmSIwd6asxxbgw+7QCVC2qQzssNNFfTs8p/F
bcQ/MqECHte1NoQaq3ripZM47/JcCTylz952igL+3ksBpdBTP/a8XmQrwA3jXprj
zHSqIDv1k9Dkd6sYolAYzv14oA8b9w==
=y3H6
-----END PGP SIGNATURE-----

--QKdGvSO+nmPlgiQ/--
