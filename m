Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87029C61DA4
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 30 Jan 2023 12:59:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236690AbjA3M7d (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 30 Jan 2023 07:59:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235504AbjA3M7c (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 30 Jan 2023 07:59:32 -0500
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com [66.111.4.229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 004A538665
        for <linux-samsung-soc@vger.kernel.org>; Mon, 30 Jan 2023 04:58:55 -0800 (PST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
        by mailnew.nyi.internal (Postfix) with ESMTP id 1926B582282;
        Mon, 30 Jan 2023 07:58:30 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Mon, 30 Jan 2023 07:58:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm1; t=1675083510; x=
        1675090710; bh=53rVXwlYlsFng8t5pHWKg2MIJxmNnLUwuFkZj4u4pFc=; b=J
        29+54jAlHYmGRXiCwzNZfVRGWLyeLTe28rRLzjF73vzpAPEn7DGnKTKutMChWV7f
        irwR0CcZebbLlQx3Q5GNUvaJGyZ52BVFLEUlRLVgTODqAZPUdq3/r0+dXQzK1C03
        WwE4wEoXcoSvcyu+i54UaxnaB69dSRWYkcyK7PHV093y69hdINSdpVuNNLjIAiaS
        N9p6Q6LUvE17hjTHZ20WpowESHMaRTesBOJUtSNTCO9Tx8qXqxN5+tU9grdfx6dS
        vO+oPhfgrLbL636T6o1KnETlqI9cbzJku6K4oVx5qaebsaDeL8tDVHlS3wgDczp9
        O2mZ/uwA0cYnE6p8BdKLQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1675083510; x=
        1675090710; bh=53rVXwlYlsFng8t5pHWKg2MIJxmNnLUwuFkZj4u4pFc=; b=m
        oXSd9d67ZYDMVn5jAVk8GyI3u8VwZqugxCL2f8XJgemR/6cX6ro4Bi/PT3mzRLz/
        SOZldaskhZWAhdQz1GK0wQTArefkuycxea3CpebvajZQ5ubBT2B+hDBUCliY2FCr
        73sUElbmVnaoOg/KoSnIhHBC3IgH/vBGnjFNnqAjLWM7wXpfwuZ61wWlphYEXSYF
        utcJDl/oYFKiOvDoFoHv7fA1W6nZea2nJgyYYzp9n6XRTpWiZtENqQtqzMF3OjoH
        0P8GTggVOjYXLXJONcllEJawR/zjoDWPbi2RzRLNKlPrctf2lm4oRecDG8qVujJB
        LlRal2FKmL0N8Ck9iIfOA==
X-ME-Sender: <xms:9b7XY9llLbS4rxMFsvR4MjZTP4MpqKsGp85HHUsfW9a9GgF7kenQDQ>
    <xme:9b7XY41v19rRnKqYCvKlbIMg3wlN41iSH7wSZKHJEzHaGrdx5iJChj7NN8NTxL20s
    bz8EvcvdTvz513yFzY>
X-ME-Received: <xmr:9b7XYzqFT88veX3wyrMfw-LkL_RRvT-kX0_alL0Q75qGeO3HYcCEkO1sidpACZ-w-yxExeq3HndqTyxA0UEmiy3VPCK0XBBHKJSiEB6P5LQ1oA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudefvddggeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggugfgjsehtqhertddttddvnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnheptefgleeggfegkeekgffgleduieduffejffegveevkeejudektdduueet
    feetfefgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:9b7XY9lB6RhJJJXzoe9y1HTSjKxyXi95tk1gE60_6lJpFfOh6pDrwQ>
    <xmx:9b7XY73DyUr6A-ZJROHTvAn1Jg2w820Ia-Zkt8UOyiIS8ycbNovVHg>
    <xmx:9b7XY8vB5vaW_w_2Ow1v-lntW-fDcwFBuHG5APhiJHN1kVSeFbr6ig>
    <xmx:9r7XYy7CP7NMDtbdLzenZdqVleKo60Q1aZiOdiVikevZu7PmhrJL0A>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 30 Jan 2023 07:58:29 -0500 (EST)
Date:   Mon, 30 Jan 2023 13:58:28 +0100
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
Message-ID: <20230130125828.qkqsq6ax5mojkdbq@houat>
References: <20230123151212.269082-1-jagan@amarulasolutions.com>
 <20230123151212.269082-3-jagan@amarulasolutions.com>
 <20230126121227.qcnftqvgiz44egpg@houat>
 <CAMty3ZB6QiqgQN_zWEXULHiipQWU_VaWxDWf9W8OTVQvkACu5A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAMty3ZB6QiqgQN_zWEXULHiipQWU_VaWxDWf9W8OTVQvkACu5A@mail.gmail.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, Jan 26, 2023 at 08:48:48PM +0530, Jagan Teki wrote:
> On Thu, Jan 26, 2023 at 5:42 PM Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > Hi,
> >
> > On Mon, Jan 23, 2023 at 08:41:56PM +0530, Jagan Teki wrote:
> > > Add devm OF helper to return the next DSI bridge in the chain.
> > >
> > > Unlike general bridge return helper devm_drm_of_get_bridge, this
> > > helper uses the dsi specific panel_or_bridge helper to find the
> > > next DSI device in the pipeline.
> > >
> > > Helper lookup a given child DSI node or a DT node's port and
> > > endpoint number, find the connected node and return either
> > > the associated struct drm_panel or drm_bridge device.
> >
> > I'm not sure that using a device managed helper is the right choice
> > here. The bridge will stay longer than the backing device so it will
> > create a use-after-free. You should probably use a DRM-managed action
> > here instead.
>=20
> Thanks for the comments. If I understand correctly we can use
> drmm_panel_bridge_add instead devm_drm_panel_bridge_add once we found
> the panel or bridge - am I correct?

It's not that we can, it's that the devm_panel_bridge_add is unsafe:
when the module is removed the device will go away and all the devm
resources freed, but the DRM device sticks around until the last
application with a fd open closes that fd.

Maxime
