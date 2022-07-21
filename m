Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA8ECC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 21 Jul 2022 07:19:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229605AbiGUHTY (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 21 Jul 2022 03:19:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229724AbiGUHTX (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 21 Jul 2022 03:19:23 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C1877B7B6
        for <linux-samsung-soc@vger.kernel.org>; Thu, 21 Jul 2022 00:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1658387961; x=1689923961;
  h=subject:from:to:cc:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YesWfDoB09rlru1yg9XVWrqQi6CAgpKuiyUgxeX+fRM=;
  b=ap7GuRZ/epJW/nyn7H7SItGJa5jMHG59Zl5H+dA4xiIoD+2d8BvKjiq2
   FY6uEGSHeefViZ5TDd1zK9/NmGhhINPd8JnPMiIewtZR61qoJAIfO8RWz
   x5kuDDafhNWpk27mv5UwFNOkwOIcGV3XsU/6c61B0fWcLzb1KicfvqS19
   9KdsZ/KaZMhZ8P8oGHtXhOTJZdspZ9at0BcTELpjA8ywibQe4jgOYegb9
   vq4zdWAuDfcubjowFnLD3BF2QPwB8f7Be7DZcPD5a9ZkavwBb3k9jUZqm
   3nNSgN9MxS/KlAmHwsYnlxRoUSZLOQ6De4erEk6kXQd32CRKqiVQ23Qyg
   A==;
X-IronPort-AV: E=Sophos;i="5.92,288,1650924000"; 
   d="scan'208";a="25174755"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 21 Jul 2022 09:19:19 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 21 Jul 2022 09:19:19 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Thu, 21 Jul 2022 09:19:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1658387959; x=1689923959;
  h=from:to:cc:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding:subject;
  bh=YesWfDoB09rlru1yg9XVWrqQi6CAgpKuiyUgxeX+fRM=;
  b=kw54iJZtc+tF6sc8VIFhmbJjiR8VlB6yKWRQ+oT25RONVW7O50NtbdrT
   dQtXKl8vELVvZGWB25/NCeFowXUdEpjfu/H8B+rSCp2EfbCB/tD2xQB8f
   2b2vWUdPnMRjCcrDoNEfbx3nXx6hlYE1UpMIbG5Hudcr2Dq4KK2rH2eJM
   6ixdcNFDdJEewYM6x5KhSxppz9HxxqedKu/KQxkEVSk6KmbCZTHBuNJwt
   LvkzKkdnwBu2a6W6QkOUkaoqcudAvyOBiy5A8Hl4JzASsZqhfn8YcvktY
   j63iOPDuB3di/h0hvqNmPHSrjZqldLIzZFW+df0WcyE+EHKX37phk+3xT
   A==;
X-IronPort-AV: E=Sophos;i="5.92,288,1650924000"; 
   d="scan'208";a="25174754"
Subject: Re: [PATCH v3 00/13] drm: bridge: Add Samsung MIPI DSIM bridge
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 21 Jul 2022 09:19:19 +0200
Received: from steina-w.localnet (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id B6101280056;
        Thu, 21 Jul 2022 09:19:18 +0200 (CEST)
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
        Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org,
        linux-samsung-soc@vger.kernel.org,
        Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel@lists.freedesktop.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        linux-arm-kernel@lists.infradead.org,
        Jagan Teki <jagan@amarulasolutions.com>
Date:   Thu, 21 Jul 2022 09:19:16 +0200
Message-ID: <7188447.DvuYhMxLoT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20220720155210.365977-1-jagan@amarulasolutions.com>
References: <20220720155210.365977-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Jagan,

thanks for the update.

Am Mittwoch, 20. Juli 2022, 17:51:57 CEST schrieb Jagan Teki:
> This series supports common bridge support for Samsung MIPI DSIM
> which is used in Exynos and i.MX8MM SoC's.
> 
> Previous v2 can be available here [1].
> 
> The final bridge supports both the Exynos and i.MX8MM DSI devices.
> 
> On, summary this patch-set break the entire DSIM driver into
> - platform specific glue code for platform ops, component_ops.
> - common bridge driver which handle platform glue init and invoke.
> 
> Patch 0001:	Restore proper bridge chain in exynos_dsi
> 
> Patch 0002: 	Samsung DSIM bridge
> 
> Patch 0003:	Common lookup code for OF-graph or child
> 
> Patch 0004: 	plat_data quirk flag via driver_data
> 
> Patch 0005/11:  bridge fixes, atomic API's
> 
> Patch 0012:	document fsl,imx8mm-mipi-dsim
> 
> Patch 0013:	add i.MX8MM DSIM support
> 
> Tested in Engicam i.Core MX8M Mini SoM.
> 
> Anyone interested, please have a look on this repo [2]
> 
> [2] https://github.com/openedev/kernel/tree/imx8mm-dsi-v2

I suspect you meant https://github.com/openedev/kernel/tree/imx8mm-dsi-v3

Using this v3:
Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
on TQMa8MxML + MBa8Mx.

> [1]
> https://patchwork.kernel.org/project/dri-devel/cover/20220504114021.33265-1
> -jagan@amarulasolutions.com/
> 
> Any inputs?
> Jagan.
> 
> Jagan Teki (12):
>   drm: bridge: Add Samsung DSIM bridge driver
>   drm: bridge: samsung-dsim: Lookup OF-graph or Child node devices
>   drm: bridge: samsung-dsim: Handle platform init via driver_data
>   drm: bridge: samsung-dsim: Mark PHY as optional
>   drm: bridge: samsung-dsim: Add DSI init in bridge pre_enable()
>   drm: bridge: samsung-dsim: Fix PLL_P (PMS_P) offset
>   drm: bridge: samsung-dsim: Add module init, exit
>   drm: bridge: samsung-dsim: Add atomic_check
>   drm: bridge: samsung-dsim: Add atomic_get_input_bus_fmts
>   drm: bridge: samsung-dsim: Add input_bus_flags
>   dt-bindings: display: exynos: dsim: Add NXP i.MX8MM support
>   drm: bridge: samsung-dsim: Add i.MX8MM support
> 
> Marek Szyprowski (1):
>   drm: exynos: dsi: Restore proper bridge chain order
> 
>  .../bindings/display/exynos/exynos_dsim.txt   |    1 +
>  MAINTAINERS                                   |    8 +
>  drivers/gpu/drm/bridge/Kconfig                |   12 +
>  drivers/gpu/drm/bridge/Makefile               |    1 +
>  drivers/gpu/drm/bridge/samsung-dsim.c         | 1850 +++++++++++++++++
>  drivers/gpu/drm/exynos/Kconfig                |    1 +
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c       | 1717 +--------------
>  include/drm/bridge/samsung-dsim.h             |  106 +
>  8 files changed, 2042 insertions(+), 1654 deletions(-)
>  create mode 100644 drivers/gpu/drm/bridge/samsung-dsim.c
>  create mode 100644 include/drm/bridge/samsung-dsim.h




