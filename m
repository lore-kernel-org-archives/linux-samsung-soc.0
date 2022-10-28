Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42AD5ECAAA1
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 28 Oct 2022 19:26:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229802AbiJ1T00 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 28 Oct 2022 15:26:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229494AbiJ1T0Z (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 28 Oct 2022 15:26:25 -0400
X-Greylist: delayed 4199 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 28 Oct 2022 12:26:19 PDT
Received: from 14.mo581.mail-out.ovh.net (14.mo581.mail-out.ovh.net [178.33.251.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41DF82339BB
        for <linux-samsung-soc@vger.kernel.org>; Fri, 28 Oct 2022 12:26:18 -0700 (PDT)
Received: from player726.ha.ovh.net (unknown [10.111.172.1])
        by mo581.mail-out.ovh.net (Postfix) with ESMTP id 2B59525F08
        for <linux-samsung-soc@vger.kernel.org>; Fri, 28 Oct 2022 14:40:31 +0000 (UTC)
Received: from armadeus.com (atoulouse-656-1-53-167.w90-11.abo.wanadoo.fr [90.11.232.167])
        (Authenticated sender: sebastien.szymanski@armadeus.com)
        by player726.ha.ovh.net (Postfix) with ESMTPSA id 9D11A3027C682;
        Fri, 28 Oct 2022 14:40:06 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass (GARM-106R006ac69e528-1130-4c49-8acd-183c37d7f8d6,
                    C74AB133D8C85D7EA747E38E0BF9CEFC19178B59) smtp.auth=sebastien.szymanski@armadeus.com
X-OVh-ClientIp: 90.11.232.167
Message-ID: <4c9475d0-f76f-0c59-1208-6e5395496c9e@armadeus.com>
Date:   Fri, 28 Oct 2022 16:37:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Content-Language: en-US
To:     Jagan Teki <jagan@amarulasolutions.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
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
        Marek Vasut <marex@denx.de>
Cc:     Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>
References: <20221005151309.7278-1-jagan@amarulasolutions.com>
From:   =?UTF-8?Q?S=c3=a9bastien_Szymanski?= 
        <sebastien.szymanski@armadeus.com>
Subject: Re: [PATCH v7 00/10] drm: bridge: Add Samsung MIPI DSIM bridge
In-Reply-To: <20221005151309.7278-1-jagan@amarulasolutions.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 16851906856032857034
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvgedrtdeigdejjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfvvehfhffujggtgfesthekredttdefjeenucfhrhhomhepuforsggrshhtihgvnhcuufiihihmrghnshhkihcuoehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomheqnecuggftrfgrthhtvghrnhepteeuuedtffefgeeguedtheehleeggeduvdeukeeiteekgeekhfdugffgheehgeevnecuffhomhgrihhnpehgihhtlhgrsgdrtghomhenucfkphepuddvjedrtddrtddruddpledtrdduuddrvdefvddrudeijeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomheqpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqshgrmhhsuhhnghdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdpoffvtefjohhsthepmhhoheekuddpmhhouggvpehsmhhtphhouhht
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hello Jagan,

On 10/5/22 17:12, Jagan Teki wrote:
> This series supports common bridge support for Samsung MIPI DSIM
> which is used in Exynos and i.MX8MM SoC's.
> 
> The final bridge supports both the Exynos and i.MX8MM DSI devices.
> 
> Changes for v7:
> * fix the drm bridge attach chain for exynos drm dsi driver
> * fix the hw_type checking logic
> 
> Changes for v6:
> * handle previous bridge for exynos dsi while attaching bridge
> 
> Changes for v5:
> * bridge changes to support multi-arch
> * updated and clear commit messages
> * add hw_type via plat data
> * removed unneeded quirk
> * rebased on linux-next
> 
> Changes for v4:
> * include Inki Dae in MAINTAINERS
> * remove dsi_driver probe in exynos_drm_drv to support multi-arch build
> * update init handling to ensure host init done on first cmd transfer
> 
> Changes for v3:
> * fix the mult-arch build
> * fix dsi host init
> * updated commit messages
> 
> Changes for v2:
> * fix bridge handling
> * fix dsi host init
> * correct the commit messages
> 
> Patch 0001: 	Samsung DSIM bridge
> 
> Patch 0002:	PHY optional
> 
> Patch 0003:	OF-graph or Child node lookup
> 
> Patch 0004: 	DSI host initialization
> 
> Patch 0005:	atomic check
> 
> Patch 0006:	PMS_P offset via plat data
> 
> Patch 0007:	atomic_get_input_bus_fmts
> 
> Patch 0008:	input_bus_flags
> 
> Patch 0009:	document fsl,imx8mm-mipi-dsim
> 
> Patch 0010:	add i.MX8MM DSIM support
> 
> Tested in Engicam i.Core MX8M Mini SoM.
> 
> Repo:
> https://gitlab.com/openedev/kernel/-/commits/imx8mm-dsi-v7
> 
> Any inputs?

I tried this series on Armadeus OPOS8MM Dev (i.MX8MM) board with the 
PowerTrip PH720128T004-ZBC02 DSI panel  (720x1280, 2 lanes).

It works after I fixed the logic of some video mode flags:

in function samsung_dsim_init_link(struct samsung_dsim *dsi):

-if (!(dsi->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HFP))
+if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HFP)
	reg |= DSIM_HFP_MODE;

The bit has to be set to disable HFP.
Same logic for HPB, HSA and EOT packets.

Regards,

> Jagan.
> 
> Jagan Teki (10):
>    drm: bridge: Add Samsung DSIM bridge driver
>    drm: bridge: samsung-dsim: Lookup OF-graph or Child node devices
>    drm: bridge: samsung-dsim: Mark PHY as optional
>    drm: bridge: samsung-dsim: Handle proper DSI host initialization
>    drm: bridge: samsung-dsim: Add atomic_check
>    drm: bridge: samsung-dsim: Add platform PLL_P (PMS_P) offset
>    drm: bridge: samsung-dsim: Add atomic_get_input_bus_fmts
>    drm: bridge: samsung-dsim: Add input_bus_flags
>    dt-bindings: display: exynos: dsim: Add NXP i.MX8MM support
>    drm: bridge: samsung-dsim: Add i.MX8MM support
> 
>   .../bindings/display/exynos/exynos_dsim.txt   |    1 +
>   MAINTAINERS                                   |    9 +
>   drivers/gpu/drm/bridge/Kconfig                |   12 +
>   drivers/gpu/drm/bridge/Makefile               |    1 +
>   drivers/gpu/drm/bridge/samsung-dsim.c         | 1856 +++++++++++++++++
>   drivers/gpu/drm/exynos/Kconfig                |    1 +
>   drivers/gpu/drm/exynos/exynos_drm_dsi.c       | 1766 +---------------
>   include/drm/bridge/samsung-dsim.h             |  115 +
>   8 files changed, 2108 insertions(+), 1653 deletions(-)
>   create mode 100644 drivers/gpu/drm/bridge/samsung-dsim.c
>   create mode 100644 include/drm/bridge/samsung-dsim.h
> 

-- 
Sébastien Szymanski, Armadeus Systems
Software engineer

