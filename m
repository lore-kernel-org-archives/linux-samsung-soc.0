Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33145C38142
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 31 Jan 2023 12:46:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231405AbjAaMqC (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 31 Jan 2023 07:46:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230177AbjAaMqB (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 31 Jan 2023 07:46:01 -0500
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com [64.147.123.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79FD029435
        for <linux-samsung-soc@vger.kernel.org>; Tue, 31 Jan 2023 04:46:00 -0800 (PST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailnew.west.internal (Postfix) with ESMTP id ED7E52B066FA;
        Tue, 31 Jan 2023 07:45:53 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Tue, 31 Jan 2023 07:45:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm1; t=1675169153; x=
        1675176353; bh=PtYaZxMNlPd+V1POWIMFc+00gyDuCAmPoEPHzvrYLTY=; b=Y
        2rpavMmA6wrzSwSljI8brRDsxWI1aa0/CnLeZm8LQmBgidWUpAI6OOyXg4uauxAc
        UoVu+u7fyEc+97JUW6/Q1Lw0ZSS1EZyDDHMLXeiHh3SoZQRFZ2nH2B5NJTDUuIu9
        K6+IFc4Sf/jyNoV4p1KLzPu3UTGqw37wEu7jcbWy2ByOoNVY0KvrrK+puSLlao/Z
        W2WKYtf18lCLtFqVGB0qq6Tv+BRyY0R2JqZO6iRwvziVYpaerQ3E4stDpQ0BbZtg
        Nv0OnXeBGMYqGghCe/qw7P67eTPye6jC6V2ysWw6fPeL1mowgGqDwYAaozNQTLX0
        QS0qHicYBu8oMsKxm0nTA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1675169153; x=
        1675176353; bh=PtYaZxMNlPd+V1POWIMFc+00gyDuCAmPoEPHzvrYLTY=; b=c
        h81WKeuGP2BGjN2vQHQgyBaWZCweqrz6mR7hJeAF+amxmgD07U9kli0nakyaNMhJ
        Khqu+PJ9ksyOr2pZAmtGoyPa4DfnB96vPuTUAXU1ykKIBv4ll1y5+m9lJMacpvGv
        ZJGxPmeov9hzTCmzXTZTp3nBLLxDoX6hSpaInk3a+wWU7XScUkTP/l2cpnRBhYE0
        MsbUo02LL+bWtvA5dfnEyzpMQcwhNtcKVdRrFTAAHu/loKJJkfjBOQ6Wt2bq6o8l
        kjUeG9vuDz5QfsRF/UUpoFZWApFZXjMERRp7vFM106VtXf6Kvr/x/GyQrWdIDzb1
        Z0HODQusZLKof1f0XK0rA==
X-ME-Sender: <xms:gA3ZY39ABJWqg85jAQVkE6rACECTQzN-KVDMIEFUNLYMzQ2jcxIVMA>
    <xme:gA3ZYzusyyM8jxwVAFQ2vP3h5eU6ouhOStTd2BANH7N-u8wFp3owyBcwGMNIq7rSn
    aZpMMybGnERSR6B4WQ>
X-ME-Received: <xmr:gA3ZY1CvOSJs30u6KQbSOjvhbk9TqMsDfjzISQwqOO-CpOmkudIIb9T2v9l4WIrZvBrXz9iUHliKFqzK-ScUyMB1yfh_YDna7SZlp5YeZAjPzQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudefgedggeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggugfgjsehtqhertddttddvnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhephfduvdejlefhteetffdvgfeuhedvueeggfetheeihfektefftddtieff
    vddtueehnecuffhomhgrihhnpehgihhthhhusgdrtghomhdpfhhrvggvuggvshhkthhoph
    drohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
    pehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:gA3ZYzfxtKgO0R-PWSwvQDsA_9eq7pBv3jZhUFw0q3T1Zpqw-uzPJw>
    <xmx:gA3ZY8PiubIebRHN8gornKb8bagBb8VHDrA56ha5APpYrkXhnVu0sQ>
    <xmx:gA3ZY1lbi8FpQsQ9CrsA2Nb7cIWZaF87vuxbBHrU6ZqWoPuqO2L-RQ>
    <xmx:gQ3ZY4QdbUH7U4emnAc2SpTVMDSyxEHuAiDDGV1y-nxi10sZPNUODYRxbR4>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 31 Jan 2023 07:45:52 -0500 (EST)
Date:   Tue, 31 Jan 2023 13:45:50 +0100
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
Message-ID: <20230131124550.6oalx43vz26gi5wt@houat>
References: <20230123151212.269082-1-jagan@amarulasolutions.com>
 <20230123151212.269082-3-jagan@amarulasolutions.com>
 <20230126121227.qcnftqvgiz44egpg@houat>
 <CAMty3ZB6QiqgQN_zWEXULHiipQWU_VaWxDWf9W8OTVQvkACu5A@mail.gmail.com>
 <CAMty3ZDTuvYKQYpVnoUU_-b3znJiyR0yBADO-5_5+86KgwYv3Q@mail.gmail.com>
 <20230130125648.mlrtubymeooejvhg@houat>
 <CAMty3ZANxwUp8yOjo+EWHNngi7SoMYhm1FchM38v_EUDpLY7UQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAMty3ZANxwUp8yOjo+EWHNngi7SoMYhm1FchM38v_EUDpLY7UQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, Jan 30, 2023 at 06:54:54PM +0530, Jagan Teki wrote:
> On Mon, Jan 30, 2023 at 6:26 PM Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > On Fri, Jan 27, 2023 at 11:09:26PM +0530, Jagan Teki wrote:
> > > Hi,
> > >
> > > On Thu, Jan 26, 2023 at 8:48 PM Jagan Teki <jagan@amarulasolutions.co=
m> wrote:
> > > >
> > > > On Thu, Jan 26, 2023 at 5:42 PM Maxime Ripard <maxime@cerno.tech> w=
rote:
> > > > >
> > > > > Hi,
> > > > >
> > > > > On Mon, Jan 23, 2023 at 08:41:56PM +0530, Jagan Teki wrote:
> > > > > > Add devm OF helper to return the next DSI bridge in the chain.
> > > > > >
> > > > > > Unlike general bridge return helper devm_drm_of_get_bridge, this
> > > > > > helper uses the dsi specific panel_or_bridge helper to find the
> > > > > > next DSI device in the pipeline.
> > > > > >
> > > > > > Helper lookup a given child DSI node or a DT node's port and
> > > > > > endpoint number, find the connected node and return either
> > > > > > the associated struct drm_panel or drm_bridge device.
> > > > >
> > > > > I'm not sure that using a device managed helper is the right choi=
ce
> > > > > here. The bridge will stay longer than the backing device so it w=
ill
> > > > > create a use-after-free. You should probably use a DRM-managed ac=
tion
> > > > > here instead.
> > > >
> > > > Thanks for the comments. If I understand correctly we can use
> > > > drmm_panel_bridge_add instead devm_drm_panel_bridge_add once we fou=
nd
> > > > the panel or bridge - am I correct?
> > >
> > > Look like it is not possible to use DRM-managed action helper here as
> > > devm_drm_of_dsi_get_bridge is calling from the DSI host attach hook in
> > > which we cannot find drm_device pointer (as drm_device pointer is
> > > mandatory for using DRM-managed action).
> > > https://github.com/openedev/kernel/blob/imx8mm-dsi-v12/drivers/gpu/dr=
m/bridge/samsung-dsim.c#L1545
> > >
> > > Please check and correct me if I mentioned any incorrect details.
> >
> > You shouldn't call that function from attach anyway:
> > https://dri.freedesktop.org/docs/drm/gpu/drm-kms-helpers.html#special-c=
are-with-mipi-dsi-bridges
>=20
> True, If I remember we have bridges earlier to find the downstream
> bridge/panels from the bridge ops and attach the hook, if that is the
> case maybe we can use this DRM-managed action as we can get the
> drm_device pointer from the bridge pointer.

I'm not quite sure what you mean. You shouldn't retrieve the bridge from
the attach hook but from the probe / bind ones. If that's not working
for you, this is a bug in the documentation we should address.

> So, what is the best we can do here, add any TODO comment to follow up
> the same in the future or something else, please let me know?

Make it work in a safe way, as described in the documentation?

Maxime
