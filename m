Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15B85C64EC4
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  3 Mar 2023 15:00:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231272AbjCCPA1 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 3 Mar 2023 10:00:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231348AbjCCPAZ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 3 Mar 2023 10:00:25 -0500
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E83560AB2
        for <linux-samsung-soc@vger.kernel.org>; Fri,  3 Mar 2023 07:00:23 -0800 (PST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id E9BFF5C00E4;
        Fri,  3 Mar 2023 10:00:21 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Fri, 03 Mar 2023 10:00:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-type:content-type:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; t=1677855621; x=1677942021; bh=/a
        d5zk+oTKY8I6mE2wrWG3Y1HiEywah0yEHOGabDF8o=; b=BFOf4KWCQHPgH8YVye
        zJNidvlDVneiwwjHR1UAxc8ufrcPTecfxa36Pt8KoW3K5S0O3RKhEZIwjTNh96W9
        71uqps0r8WNeWJhmN0Yczu65bNMfCeIQaCZzOX3Bo5iNBkLLkievnAiEwQfmmuy8
        sY40kq/r+qLENeIAUm+QoMgyISOHWzgK12Zq6cvyzMIfICY4gAmo+nVvUcFw1C+E
        9Yw2uHrNGmwVYipWbNQg3Kkdys7tgVyf9Aujk7G6/HDQ3jeXCDpSJEM6P/rk682d
        90A815/adzefgiAconf4QclAJx6Rpme9k8j15kYOJKWSGG8rGELt/bI2iVks5aTu
        2rKw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; t=1677855621; x=1677942021; bh=/ad5zk+oTKY8I
        6mE2wrWG3Y1HiEywah0yEHOGabDF8o=; b=VPjTMuST5MIbO6Ru8xQdkzQf0M950
        STPAArM+BZl22mhNkgkhGOXNRWwStJGrdcumF15iGvcgevFfji6tOvLOslN9kZI7
        xyWysl39bvobrUINsAj3lCUR9e9yferaPtNJXoQLz25VAaqmH1c2DyoWtD9anjgC
        LRd/bF8Mnr4I7RglosFo9vLOaF1EOlHC8xEr+mW4Mt46BZtXVJxissHY/nu0v5da
        v/6PLV1Y9RmQSNC9ikNx3tRR8IX2h9qseR58OTXVfpNtz7ekdEw5YVv9d+36bg+a
        TIcjqjF+HB1YdvbT6YNwV7hwNvvDlgneIbuPuSmHyzCbltWXcqQPIcrZQ==
X-ME-Sender: <xms:hQsCZFdsmf2wsxNcpV6-8bZ6lEAdCaMQcjt8f3I18moKS-q96VSzLQ>
    <xme:hQsCZDNn02t8e4TTOhvm4t5BhW8ErFsGyQyf5Sg1jWTIdWNWABey7tyavtEF-j4qU
    aIkXS75MlEAlLGfqoc>
X-ME-Received: <xmr:hQsCZOgaHyw3aW8U4PXUrsXf80h-weE7toBh18xjHc2dqo2A26A42pmtksdSzLN-x-_sUHR2Yu7A42kX31CkkXq25mqZmVQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudelledgieehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeetfefffefgkedtfefgledugfdtjeefjedvtddtkeetieffjedvgfehheff
    hfevudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:hQsCZO9QLv6ocs91nVbAJQZbrpAHW0fbmtyCvQ5vzlRoW-5qIoyF6A>
    <xmx:hQsCZBv0BvHUTgI59J5KCONFFSo48p1o8MTIYoKcOdL7jVUa9owdDA>
    <xmx:hQsCZNHNENMgCKqmcpJzsiBleAr65N-eaB12-FCbLRbuG1pRv8uEnA>
    <xmx:hQsCZC5gqqaK7tFoH3C-sPf25N6MqP_aF8BKNXffL1INxYimkxMjAA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 3 Mar 2023 10:00:20 -0500 (EST)
Date:   Fri, 3 Mar 2023 16:00:19 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     Jagan Teki <jagan@amarulasolutions.com>
Cc:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Inki Dae <inki.dae@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Marek Vasut <marex@denx.de>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Tim Harvey <tharvey@gateworks.com>,
        Adam Ford <aford173@gmail.com>,
        Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-amarula <linux-amarula@amarulasolutions.com>
Subject: Re: [PATCH v15 08/16] drm: exynos: dsi: Add input_bus_flags
Message-ID: <20230303150019.bqxhaqtwwr5xiep4@houat>
References: <20230303145138.29233-1-jagan@amarulasolutions.com>
 <20230303145138.29233-9-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="p2kp7ijdcum4fsll"
Content-Disposition: inline
In-Reply-To: <20230303145138.29233-9-jagan@amarulasolutions.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


--p2kp7ijdcum4fsll
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 03, 2023 at 08:21:30PM +0530, Jagan Teki wrote:
> LCDIF-DSIM glue logic inverts the HS/VS/DE signals and expecting
> the i.MX8M Mini/Nano DSI host to add additional Data Enable signal
> active low (DE_LOW). This makes the valid data transfer on each
> horizontal line.
>=20
> So, add additional bus flags DE_LOW setting via input_bus_flags
> for i.MX8M Mini/Nano platforms.
>=20
> Reviewed-by: Marek Vasut <marex@denx.de>
> Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> Suggested-by: Marek Vasut <marex@denx.de>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
> Changes for v15, v13:
> - none
> Changes for v12:
> - collect RB from Marek
> Changes for v11:
> - collect RB from Frieder
> Changes for v10, v9:
> - none
> Changes for v8:
> - add DE_LOW for i.MX8M Mini/Nano platforms.
> Changes for v7, v6:
> - none
> Changes for v5:
> - rebased based on updated bridge changes
> Changes for v4 - v1:
> - none
>=20
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/ex=
ynos/exynos_drm_dsi.c
> index 796480e4a18b..5d971b607e1a 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> @@ -1736,6 +1736,10 @@ static const struct component_ops exynos_dsi_compo=
nent_ops =3D {
>  	.unbind	=3D exynos_dsi_unbind,
>  };
> =20
> +static const struct drm_bridge_timings dsim_bridge_timings_de_low =3D {
> +	.input_bus_flags =3D DRM_BUS_FLAG_DE_LOW,
> +};
> +
>  static int exynos_dsi_probe(struct platform_device *pdev)
>  {
>  	struct device *dev =3D &pdev->dev;
> @@ -1822,6 +1826,10 @@ static int exynos_dsi_probe(struct platform_device=
 *pdev)
>  	dsi->bridge.type =3D DRM_MODE_CONNECTOR_DSI;
>  	dsi->bridge.pre_enable_prev_first =3D true;
> =20
> +	/* DE_LOW: i.MX8M Mini/Nano LCDIF-DSIM glue logic inverts HS/VS/DE */
> +	if (dsi->plat_data->hw_type =3D=3D DSIM_TYPE_IMX8MM)

That commit isn't bisectable, you add that enum variant in the last
patch so this won't compile.

Maxime

--p2kp7ijdcum4fsll
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZAILgwAKCRDj7w1vZxhR
xZUZAQCM4FqrQtYAFkLQVHbtAL94C04iZcE9JCM+Yg+Y2a+9LgD+JheRmqxnRwWq
ABFtk7YN80U5E0S2vEZ7lrbUA4JP0AE=
=0hmg
-----END PGP SIGNATURE-----

--p2kp7ijdcum4fsll--
