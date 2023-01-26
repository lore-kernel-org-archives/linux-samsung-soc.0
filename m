Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5C01C05027
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 26 Jan 2023 12:12:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237059AbjAZMMe (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 26 Jan 2023 07:12:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237060AbjAZMMd (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 26 Jan 2023 07:12:33 -0500
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com [66.111.4.221])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E26D69B26
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Jan 2023 04:12:32 -0800 (PST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
        by mailnew.nyi.internal (Postfix) with ESMTP id 43C895832A4;
        Thu, 26 Jan 2023 07:12:31 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Thu, 26 Jan 2023 07:12:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm1; t=1674735151; x=1674742351; bh=h+X9F9/Ov3
        IoqHzLlmAlnrB+n/1ONiXGP4XLtnNsEs0=; b=RaU6rHlVnmR2CkA2ZCRURML+2m
        ZGBoei4WU6RaehRFjBSb1MNGTH5cs3h3PMHBYaBOc60bU5rM4ibTYqmMp0RQ94CO
        Ly4Vy9+e+Aoks5S7VbirSvI6VQekNoka78VBbklummZQ4UbmggbXki0r+jNG4oMn
        4xuIOU9aBFVPyCqV84r7E4R503cliAF1K+5n/Dn8jBr9qeKnlXrvQb03unp6/0RD
        xMGIqHP74vzijeCt68FjOpdp4E/sG7f440oUtA32GBiEUYej3JcbEJVT6fycBoDX
        9kVykq8Z2Kyt0AjGJ7f5gEcEwZoOkA4uqj+eP+NtmTEhR2yuNxQgLAUurz7g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; t=1674735151; x=1674742351; bh=h+X9F9/Ov3IoqHzLlmAlnrB+n/1O
        NiXGP4XLtnNsEs0=; b=OepO88OFz7am6UzIu+uLKplQPHEmKFoyeLtcozGpww7O
        qCBW55gMdLkU2USaER/65dBx1MNU+3KNw+0T80Fev0C6b/VK9lfuxyC5GC0BT1E2
        SIiTNYCzvoncOg4SpotgWSssVPxP7c3oajfw19oFnHADyN7YZz6PFHuZnlo2mNa1
        nYKaYf+elxDQspdO5HBd7w3fDGcVi7umcj0dfip12DGLzOPI8vFTzYmG2743cWbk
        26pmV4SylnrW6lMz6XV+Ik0fOWwgkFsATDVqkM9bW2cLX9soss1ufKF78HO+9VIZ
        P8wjPcE5Zz/UcE32k4aDzWSywWPKcD8gX1m6SBbkhA==
X-ME-Sender: <xms:LW7SYxvBEipxjqKRqHkqFoOp6UuV8K6SdgJZFz9DIm6rsfitJSoY-w>
    <xme:LW7SY6eWVHq5YN6hXCXaYL2bmupkFsj8N9ynb99Wum3_IZPWJqTigmmhUG7V0uh7t
    PUydpv0x2PMSF-TFao>
X-ME-Received: <xmr:LW7SY0yHssCE_h0ClVzcVpTILope-i0mLg_TiraZpaFKJn_ua0H8AQqHre4nMgbGKczzrS-dmuD0TAeiyJY33cO_34WFOatQzL9wZmYHiixOcw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddvgedgfeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeetfefffefgkedtfefgledugfdtjeefjedvtddtkeetieffjedvgfehheff
    hfevudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:LW7SY4NPhVicQxU9rt06Uf0U4KJYIVQUYrtpZ-WoH4AHEqfYoAvgsQ>
    <xmx:LW7SYx9ROpl3gX3enIZEM0y-y-6FHsCmEx5BYD_SkVvEP0SBqP41Pw>
    <xmx:LW7SY4UAMc4YfeX4Wgls7CMsGT7K4ozLSTK1QRbEV4PNgzZBJu1MEA>
    <xmx:L27SYwA-J4c7cGshqKZSWzZAsplL3FKf6uyFbxQS1WFrGr0A4eZ3wQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 26 Jan 2023 07:12:29 -0500 (EST)
Date:   Thu, 26 Jan 2023 13:12:27 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     Jagan Teki <jagan@amarulasolutions.com>
Cc:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Inki Dae <inki.dae@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Fancy Fang <chen.fang@nxp.com>,
        Tim Harvey <tharvey@gateworks.com>,
        Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
        Adam Ford <aford173@gmail.com>,
        Neil Armstrong <narmstrong@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
        Marek Vasut <marex@denx.de>,
        Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [RESEND PATCH v11 02/18] drm: bridge: panel: Add
 devm_drm_of_dsi_get_bridge helper
Message-ID: <20230126121227.qcnftqvgiz44egpg@houat>
References: <20230123151212.269082-1-jagan@amarulasolutions.com>
 <20230123151212.269082-3-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="4plkw473wjs2mrvy"
Content-Disposition: inline
In-Reply-To: <20230123151212.269082-3-jagan@amarulasolutions.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


--4plkw473wjs2mrvy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Jan 23, 2023 at 08:41:56PM +0530, Jagan Teki wrote:
> Add devm OF helper to return the next DSI bridge in the chain.
>=20
> Unlike general bridge return helper devm_drm_of_get_bridge, this
> helper uses the dsi specific panel_or_bridge helper to find the
> next DSI device in the pipeline.
>=20
> Helper lookup a given child DSI node or a DT node's port and
> endpoint number, find the connected node and return either
> the associated struct drm_panel or drm_bridge device.

I'm not sure that using a device managed helper is the right choice
here. The bridge will stay longer than the backing device so it will
create a use-after-free. You should probably use a DRM-managed action
here instead.

Maxime

--4plkw473wjs2mrvy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY9JuKwAKCRDj7w1vZxhR
xSymAQC9Iq3pCnbt2LojyWMd4OEfhmUAFJqWCxCseECQy70ryAD+LHI6RQQqM3gO
Ic/5QXBWP5sANjuX8q+Tjb7h4dQsXg8=
=eyo5
-----END PGP SIGNATURE-----

--4plkw473wjs2mrvy--
