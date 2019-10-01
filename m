Return-Path: <SRS0=5wrF=X2=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53242C388F3
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  1 Oct 2019 11:22:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2856A21924
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  1 Oct 2019 11:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1569928920;
	bh=WP08K81EP8nRSl3NecDTAL6O6lhtnramqxO7uUpAriw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=Q9VRW9tvc8p/lTYHcBrSw6KWguKkKqhrGwNDaxe0P3gw60ZXJhiLLg96ggErbabmN
	 zHG9As1sQg/sx+dljRZxhrURwuyuZYShPcKLKjjb9SrYkYfKk+0HLTYK0vx9W4U2H8
	 wUsU4Bd7xjG1WhV4kjcRNRb6KfETZsO1DFmPyekg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731839AbfJALV7 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 1 Oct 2019 07:21:59 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:36444 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725839AbfJALV6 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 1 Oct 2019 07:21:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=WP08K81EP8nRSl3NecDTAL6O6lhtnramqxO7uUpAriw=; b=tqz2dO5eKDmISNQTeYJ2MH6GC
        03ziUcUXkSlarqF15sDoo7Q/ZXlc5BXRQJioCbeaJhkUSTPxhv9s3xKHdKl5e4aoe2/0RwcMrrp72
        7VRX1VWWlK+ybEScOSHExQMH8Wy/pH/U9uHa4fkXHJ9peDwhUUi9j2WvkCm92xPCFatbI=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=ypsilon.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1iFGE0-0004OZ-Ax; Tue, 01 Oct 2019 11:21:48 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id 7E257274299F; Tue,  1 Oct 2019 12:21:47 +0100 (BST)
Date:   Tue, 1 Oct 2019 12:21:47 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     krzk@kernel.org, lgirdwood@gmail.com,
        ckeepax@opensource.cirrus.com, sbkim73@samsung.com,
        alsa-devel@alsa-project.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, patches@opensource.cirrus.com,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com,
        m.szyprowski@samsung.com
Subject: Re: [PATCH v2 05/10] ASoC: samsung: arndale: Simplify DAI link
 initialization
Message-ID: <20191001112147.GA5618@sirena.co.uk>
References: <20190920130218.32690-1-s.nawrocki@samsung.com>
 <CGME20190920130318eucas1p126cc8be60118ffbf1f332626dde1c05a@eucas1p1.samsung.com>
 <20190920130218.32690-6-s.nawrocki@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="TB36FDmn/VVEgNH/"
Content-Disposition: inline
In-Reply-To: <20190920130218.32690-6-s.nawrocki@samsung.com>
X-Cookie: Dyslexics have more fnu.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org
Message-ID: <20191001112147.bbx7Oz2vpyL-pspFWPg0KBWqH6C4Jb7I_qKFhfzSFsA@z>


--TB36FDmn/VVEgNH/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 20, 2019 at 03:02:14PM +0200, Sylwester Nawrocki wrote:
> There is only one DAI link so we can drop an unnecessary loop statement.
> Use card->dai_link in place of direct static arndale_rt5631_dai[] array
> dereference as a prerequisite for adding support for other CODECs.
> Unnecessary assignment of dai_link->codecs->name to NULL is removed.

This doesn't apply against current code, please check and resend.

--TB36FDmn/VVEgNH/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2TNsoACgkQJNaLcl1U
h9B8Jgf/QOtwWNhy8BAfZQIc2REqWPl8fmuaapDD6MEvJOA3b+piDx2e6Q9YvKjq
afK2TLU5HN42PJIr5MTFPljexJovF0uhsmzekrLgYPV9UJR6KzsnoMtWq0aIccyu
KFRsyntw3MK+Ot9TxDVIpK/tGC4s2rAV+hJO7XV/t0V62Z3r91t0Ncp+wVxibwga
rxG4oFnwQYNp8aIpzKNc4GOqJ0W1A/5JOgUALtMlGtk6W7FJqOg4xmLsQH8TG1ne
j5YN7VCoJnki8nFk1JjiikxYYcvSLjxuB0nD/GlbBnP5McroJrCrKV/nJSooYkwd
+Sp8RijARqOYXpEbsVnN8K+DflY9pw==
=RFd7
-----END PGP SIGNATURE-----

--TB36FDmn/VVEgNH/--
