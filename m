Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F6F1C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  5 May 2022 11:55:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232930AbiEEL7P (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 5 May 2022 07:59:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232409AbiEEL7N (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 5 May 2022 07:59:13 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8994F9FFA
        for <linux-samsung-soc@vger.kernel.org>; Thu,  5 May 2022 04:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1651751732; x=1683287732;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ll69+c2JFgiuAsv/a/yUH9KQKD/0Hm7Y+hTHpdDWlN0=;
  b=NaiEHzCLFNBKrZg57p6NnTQCgf9P5k0MWpxNNIXPBRhT2mWKFc+96P2Z
   cUTck3mHLq+q2f51Rt5iuf4JrEK1KMzp2XCSqy8QWF9RQYmgPmZdTVT9N
   WzrE9aXUg+W0ucQTPSm0ORPZA8vIi2w6iBZNVgn9HJ8qaC+S3SW4NSIas
   wZL3KbblbvsUu8osq1NoSEutDlBTL5iUYeCkaUWE+lUucZ8IJfgN6HNQ+
   uwgQq7dfw8pSIEKy7AK6v8Mwf2sKfTQXDT281VPJ/ZcW1FVvAPc5hk8ET
   l0qV/oQCft7ZY6TuyfeBZ7rdaUogy/NjIwBjIPhS7HIUn3kT4/dPYUtzS
   A==;
X-IronPort-AV: E=Sophos;i="5.91,201,1647298800"; 
   d="scan'208";a="23694909"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 05 May 2022 13:55:29 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 05 May 2022 13:55:29 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Thu, 05 May 2022 13:55:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1651751729; x=1683287729;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ll69+c2JFgiuAsv/a/yUH9KQKD/0Hm7Y+hTHpdDWlN0=;
  b=eNi0iykwygKrpzWmQOxrtsSWCesXcs1nxPPhCqFo9CYMSFKi/nWGFLhw
   k4vrm3jdX/KUFD0Aq56F4OhAD77vHdxsuRtayKWVxqgN1/qMebnL+9DU+
   uAzL+mMIBpucD8yyRxYygdlVt0pIZm4q+r5bh0r4ZVFqXwFoY4C1hkqSl
   ige2ZkJSdODHTavP3zQOnfWDzg9Djs3Mr6uLpNh/9ULZDhsSTtG8AY7oS
   cV7OSa40S7+jK5JFBEebwSUUjR26zKG1rHdh84zrwgPFruEbp6Ag7XaPe
   bt6VmVGGHtoWZuQNE2SNktFeHNVfaTI2alGW69bNt9K9m/Y+mLI3GcWU3
   g==;
X-IronPort-AV: E=Sophos;i="5.91,201,1647298800"; 
   d="scan'208";a="23694908"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 05 May 2022 13:55:29 +0200
Received: from steina-w.localnet (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id DDECA280070;
        Thu,  5 May 2022 13:55:28 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
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
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
        linux-arm-kernel@lists.infradead.org,
        Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>
Subject: Re: (EXT) Re: (EXT) [PATCH v2 00/12] drm: bridge: Add Samsung MIPI DSIM bridge
Date:   Thu, 05 May 2022 13:55:26 +0200
Message-ID: <3104069.5fSG56mABF@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <CAMty3ZAuTzdzj9v4weqJfxQKhM57XuwSzSAX86NHTcCp14uBBw@mail.gmail.com>
References: <20220504114021.33265-1-jagan@amarulasolutions.com> <2184168.iZASKD2KPV@steina-w> <CAMty3ZAuTzdzj9v4weqJfxQKhM57XuwSzSAX86NHTcCp14uBBw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Am Donnerstag, 5. Mai 2022, 09:38:48 CEST schrieb Jagan Teki:
> On Thu, May 5, 2022 at 12:57 PM Alexander Stein
> 
> <alexander.stein@ew.tq-group.com> wrote:
> > Hello Jagan,
> > 
> > thanks for the second version of this patchset.
> > 
> > Am Mittwoch, 4. Mai 2022, 13:40:09 CEST schrieb Jagan Teki:
> > > This series supports common bridge support for Samsung MIPI DSIM
> > > which is used in Exynos and i.MX8MM SoC's.
> > > 
> > > Previous v1 can be available here [1].
> > > 
> > > The final bridge supports both the Exynos and i.MX8MM DSI devices.
> > > 
> > > On, summary this patch-set break the entire DSIM driver into
> > > - platform specific glue code for platform ops, component_ops.
> > > - common bridge driver which handle platform glue init and invoke.
> > > 
> > > Patch 0000:   Samsung DSIM bridge
> > > 
> > > Patch 0001:   Common lookup code for OF-graph or child
> > > 
> > > Patch 0002:   platform init flag via driver_data
> > > 
> > > Patch 0003/10:  bridge fixes, atomic API's
> > > 
> > > Patch 0011:   document fsl,imx8mm-mipi-dsim
> > > 
> > > Patch 0012:   add i.MX8MM DSIM support
> > > 
> > > Tested in Engicam i.Core MX8M Mini SoM.
> > > 
> > > Anyone interested, please have a look on this repo [2]
> > > 
> > > [2] https://github.com/openedev/kernel/tree/imx8mm-dsi-v2
> > > [1]
> > > https://patchwork.kernel.org/project/dri-devel/cover/20220408162108.1845
> > > 83-> 1-jagan@amarulasolutions.com/
> > > 
> > > Any inputs?
> > 
> > I was able to get my LVDS display running using this driver and an LVDS
> > bridge. Actually my setup is similar to yours. My chain is like this:
> > MIPI-DSI -> sn65dsi83 -> LVDS panel
> > I noticed some things though:
> > My setup only works if I use less than 4 lanes. See [1]. When using 4
> > lanes
> > the image is flickering, but the content is "visible". Your DT has only 2
> > lanes configured, do you have the possibility to use 4 lanes? I have no
> > idea how to tackle this. It might be the DSIM side or the bridge side.
> > Apparently the downstream kernel from NXP supports 4 lanes, if I can trust
> > the config. I have no way to verify this though.
> 
> What is dsi_lvds_bridge node? have you added your dts changes on top
> of imx8mm-dsi-v2 branch I'm pointing it.
> 
> I will check 4 lanes and let you know.
> 
> > Another thing is I get the following warning
> > 
> > > sn65dsi83 2-002d: Unsupported LVDS bus format 0x100a, please check
> > > output
> > 
> > bridge driver. Falling back to SPWG24.
> 
> This couldn't be much affected but will fix it.

I found the cause. You need the following diff:
----8<-----
diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/
samsung-dsim.c
index 138323dec0eb..7fb96dc7bb2e 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1427,7 +1427,7 @@ static int samsung_dsim_attach(struct drm_bridge 
*bridge,
 {
        struct samsung_dsim *dsi = bridge_to_dsi(bridge);
 
-       return drm_bridge_attach(bridge->encoder, dsi->out_bridge, NULL, 
flags);
+       return drm_bridge_attach(bridge->encoder, dsi->out_bridge, bridge, 
flags);
 }
 
 static const struct drm_bridge_funcs samsung_dsim_bridge_funcs = {
----8<-----

Best regards,
Alexander



