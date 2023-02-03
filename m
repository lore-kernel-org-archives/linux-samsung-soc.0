Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06935C61DA4
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  3 Feb 2023 10:49:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232445AbjBCKts (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 3 Feb 2023 05:49:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232204AbjBCKtq (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 3 Feb 2023 05:49:46 -0500
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com [66.111.4.230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41B5F25B91
        for <linux-samsung-soc@vger.kernel.org>; Fri,  3 Feb 2023 02:49:45 -0800 (PST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailnew.nyi.internal (Postfix) with ESMTP id 9A3C658209F;
        Fri,  3 Feb 2023 05:49:42 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Fri, 03 Feb 2023 05:49:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm1; t=1675421382; x=1675428582; bh=yvL0l19VJJ
        XBxKQq/BXhwJb8ezgmbi+o9ivTHqH+pAI=; b=efySe7lD2pH0pmeno345B6+lqA
        a0IylWbdOYWUAajm8EZVt4DXuLYUUwqD2JG+9fF8apRPyf805K3CcMiNZ8nN0Go1
        uxTqr5RUj9p2hlIIxuLSV8vOHurS0LoTk+nq+91f1HYnVcW4cm4gSOq0t3PRaCGt
        n/fZDpboai4zZjz81JPOx8nDJA+ODeYMF/fbG8SzLi8i5pTeLvJVVTCmVsgeOzOq
        m0nL8JefJ3xb1jm8L51Na7GK075C00IPfntn4LqTCAONIqmaFF19jKwdsvHj0Qmv
        THrByUCht38vJzAdOdUR9j0dcPJPpSLZipR52B47CuJB01nwuj9LpMwUSGoQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; t=1675421382; x=1675428582; bh=yvL0l19VJJXBxKQq/BXhwJb8ezgm
        bi+o9ivTHqH+pAI=; b=QMLVJk/qryrAuk00EEO81fFlRysXdycGlEk5vdbTpXNE
        Dl86CTdN8Rhoznpr41nGZtNJSjNGdTVko0MfhxMIP/vm1UgCyRJ4cxWenpmV8//h
        YnbVVKn/vnOcnBvrup1SsMYBlciJpPyf3JpA9gl5IPV7ye2Ic7Pb5WEY9LLor7Yk
        VdRJwhDdfXt9d/UAhGD2OG7cbPFYQ3WNo+k9IJ5mHh83eesCFdj0WeB660AKAuMH
        avOLzfiZD6T2HL2ZVakxF4F9VsorVOSO6bDraZkD+ViQvqr5vXhBymA4p3YyH8Td
        Ix288954hPW3Wvb/Q0cWjjoWyYzV1uWrhkjhGBFp8A==
X-ME-Sender: <xms:xebcY8O54oRog5dnLSdK-LcmeQem4SEm5_dEc86Z45e648hIWEJXRA>
    <xme:xebcYy9mKOn1sJk3tz3Fk_88v0pAXZ7VKin1hAbd8M3ss1lKI3RNeWJQ41xXjaK1z
    K5TvSTZjp_i_zBUqgw>
X-ME-Received: <xmr:xebcYzQUtn4gPt6ySk9PCs2bJD4kfsQJ2pwdJKKDDQgGq8Fbdpr0tq5HYk3KxJKcupyTTwGgjh8lCYd_Tp8Z1WjwQPdUNCSQqewglPNLbjj0tQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudegtddgudejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeetfefffefgkedtfefgledugfdtjeefjedvtddtkeetieffjedvgfehheff
    hfevudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:xebcY0u-gIZjn4onnhOaI6vcyja7WohiwC4Dz-ZK5OLTl1aYrRe8ow>
    <xmx:xebcY0csMKMCi9KcIHMbM4GXZQnqdQWE6SByj1bJqe8x-UbxE7OhGg>
    <xmx:xebcY41ApafhBqOFJDsEa12QRW7g4h49odRdbipX8L2tWoYDmpjZig>
    <xmx:xubcY-jdGK8Ge0P58y8088-olEt21vO0ZvZkxUUPIbNNxbLTyViAxg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 3 Feb 2023 05:49:40 -0500 (EST)
Date:   Fri, 3 Feb 2023 11:49:38 +0100
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
Message-ID: <20230203104938.qink5iuibxux2bjz@houat>
References: <20230123151212.269082-1-jagan@amarulasolutions.com>
 <20230123151212.269082-3-jagan@amarulasolutions.com>
 <20230126121227.qcnftqvgiz44egpg@houat>
 <CAMty3ZB6QiqgQN_zWEXULHiipQWU_VaWxDWf9W8OTVQvkACu5A@mail.gmail.com>
 <20230130125828.qkqsq6ax5mojkdbq@houat>
 <CAMty3ZD82xZnRxuTq2RdEGAJcEgnaJhKX3CDWGNeSWSQD7xNxg@mail.gmail.com>
 <20230203082607.xu6xv7c6eq2yq64c@houat>
 <CAMty3ZCYi7k=MdxZA-VMW6tfU1tqu7vrwUQyj25Oyssc0HTOKQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="doe3r4breiuybzvc"
Content-Disposition: inline
In-Reply-To: <CAMty3ZCYi7k=MdxZA-VMW6tfU1tqu7vrwUQyj25Oyssc0HTOKQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


--doe3r4breiuybzvc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 03, 2023 at 04:13:49PM +0530, Jagan Teki wrote:
> On Fri, Feb 3, 2023 at 1:56 PM Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > On Thu, Feb 02, 2023 at 10:22:42PM +0530, Jagan Teki wrote:
> > > Hi Maxime,
> > >
> > > On Mon, Jan 30, 2023 at 6:28 PM Maxime Ripard <maxime@cerno.tech> wro=
te:
> > > >
> > > > On Thu, Jan 26, 2023 at 08:48:48PM +0530, Jagan Teki wrote:
> > > > > On Thu, Jan 26, 2023 at 5:42 PM Maxime Ripard <maxime@cerno.tech>=
 wrote:
> > > > > >
> > > > > > Hi,
> > > > > >
> > > > > > On Mon, Jan 23, 2023 at 08:41:56PM +0530, Jagan Teki wrote:
> > > > > > > Add devm OF helper to return the next DSI bridge in the chain.
> > > > > > >
> > > > > > > Unlike general bridge return helper devm_drm_of_get_bridge, t=
his
> > > > > > > helper uses the dsi specific panel_or_bridge helper to find t=
he
> > > > > > > next DSI device in the pipeline.
> > > > > > >
> > > > > > > Helper lookup a given child DSI node or a DT node's port and
> > > > > > > endpoint number, find the connected node and return either
> > > > > > > the associated struct drm_panel or drm_bridge device.
> > > > > >
> > > > > > I'm not sure that using a device managed helper is the right ch=
oice
> > > > > > here. The bridge will stay longer than the backing device so it=
 will
> > > > > > create a use-after-free. You should probably use a DRM-managed =
action
> > > > > > here instead.
> > > > >
> > > > > Thanks for the comments. If I understand correctly we can use
> > > > > drmm_panel_bridge_add instead devm_drm_panel_bridge_add once we f=
ound
> > > > > the panel or bridge - am I correct?
> > > >
> > > > It's not that we can, it's that the devm_panel_bridge_add is unsafe:
> > > > when the module is removed the device will go away and all the devm
> > > > resources freed, but the DRM device sticks around until the last
> > > > application with a fd open closes that fd.
> > >
> > > Would you please check this, Here I'm trying to do
> > >
> > > 1. find a panel or bridge
> > > 2. if panel add it as a panel bridge
> > > 3. add DRM-managed action with the help of bridge->dev after step 2.
> >
> > The logic is sound in your patch
> >
> > > Didn't test the behavior, just wanted to check whether it can be a
> > > possibility to use bridge->dev as this dev is assigned with
> > > encoder->dev during the bridge attach the chain. Please check and let
> > > me know.
> > >
> > > struct drm_bridge *devm_drm_of_dsi_get_bridge(struct device *dev,
> > >                                               struct device_node *np,
> > >                                               u32 port, u32 endpoint)
> > > {
> > >         struct drm_bridge *bridge;
> > >         struct drm_panel *panel;
> > >         int ret;
> > >
> > >         ret =3D drm_of_dsi_find_panel_or_bridge(np, port, endpoint,
> > >                                               &panel, &bridge);
> > >         if (ret)
> > >                 return ERR_PTR(ret);
> > >
> > >         if (panel)
> > >                 bridge =3D devm_drm_panel_bridge_add(dev, panel);
> > >
> > >         if (IS_ERR(bridge))
> > >                 return bridge;
> > >
> > >         ret =3D drmm_add_action_or_reset(bridge->dev,
> > > drmm_drm_panel_bridge_release,
> > >                                        bridge);
> > >         if (ret)
> > >                 return ERR_PTR(ret);
> > >
> > >         return bridge;
> > > }
> >
> > It's the implementation that isn't. You cannot use a devm hook to
> > register a KMS structure, so it's not that you should add a
> > drmm_add_action call, it's that you shouldn't call
> > devm_drm_panel_bridge_add in the first place.
>=20
> I think it is because the remove action helper uses
> drm_panel_bridge_remove instead of devm hook.
> >
> > So either you use drm_panel_bridge_add and a custom drmm action, or you
> > add a drmm_panel_bridge_add function and use it.
>=20
> It is not possible to use this helper as it is expecting drm_device

It's definitely possible, just change the prototype of the function to
take a drm_device pointer, just like any other drmm_* function.

Maxime

--doe3r4breiuybzvc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY9zmwgAKCRDj7w1vZxhR
xWhVAP0WZvYRtLQDu9AeTTcnVstYNCUtT0aImbDc0Ebv27ctNgD/VQ/6YJI2AdOB
fFqQPPKqZucc2abWUHHxQgSUz/TdFgM=
=JlRp
-----END PGP SIGNATURE-----

--doe3r4breiuybzvc--
