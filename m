Return-Path: <SRS0=H6Ng=EP=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B89E7C388F9
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  9 Nov 2020 03:08:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6999B206E3
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  9 Nov 2020 03:08:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="oB8NI/co"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728802AbgKIDIZ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 8 Nov 2020 22:08:25 -0500
Received: from mailout4.samsung.com ([203.254.224.34]:55058 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728038AbgKIDIZ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 8 Nov 2020 22:08:25 -0500
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20201109030821epoutp04ea256a37d91721a6335aad4200088662~FuCLKQeSq2875328753epoutp04f
        for <linux-samsung-soc@vger.kernel.org>; Mon,  9 Nov 2020 03:08:21 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20201109030821epoutp04ea256a37d91721a6335aad4200088662~FuCLKQeSq2875328753epoutp04f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1604891301;
        bh=iN175+o25AiyeTOhQpKmUZPL8SS5wnrxAwJKHaxIXo4=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=oB8NI/cog6sY8cLrz+MSULBvrsgCKiKlRlxNZHfAcWL/lpZ/Loq8G7+tKGsZFrlVf
         oPQ07y00eYj9eO4wNz/0tqyrUEDclWEAhGvnOReMa9dMUSGIX2e2c+7sokX5RAYqv4
         9qhrKyX912jkYBFCwyrjE4oXn36u7syauJ2YjmuM=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
        epcas1p1.samsung.com (KnoxPortal) with ESMTP id
        20201109030821epcas1p1cef846a4d200995e59e808005e078a26~FuCKeeGQa0100501005epcas1p11;
        Mon,  9 Nov 2020 03:08:21 +0000 (GMT)
Received: from epsmges1p2.samsung.com (unknown [182.195.40.154]) by
        epsnrtp3.localdomain (Postfix) with ESMTP id 4CTwtB1pdnzMqYkV; Mon,  9 Nov
        2020 03:08:18 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
        epsmges1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        70.63.63458.2A2B8AF5; Mon,  9 Nov 2020 12:08:18 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20201109030817epcas1p2a192d63831b5f69ae881d21a771d35b2~FuCHZR4xR1273612736epcas1p2P;
        Mon,  9 Nov 2020 03:08:17 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20201109030817epsmtrp1bf3aa7489878c95cd7338d79ca033e69~FuCHYgyIY0554005540epsmtrp1J;
        Mon,  9 Nov 2020 03:08:17 +0000 (GMT)
X-AuditID: b6c32a36-6c9ff7000000f7e2-30-5fa8b2a28b1e
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        48.D1.08745.1A2B8AF5; Mon,  9 Nov 2020 12:08:17 +0900 (KST)
Received: from [10.113.221.211] (unknown [10.113.221.211]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20201109030817epsmtip241a264b23edf2feb9cab0e41a4d479f4~FuCHJl94n1670516705epsmtip2h;
        Mon,  9 Nov 2020 03:08:17 +0000 (GMT)
Subject: Re: [PATCH v2 00/16] drm/exynos: Convert driver to drm bridge
To:     Michael Tretter <m.tretter@pengutronix.de>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc:     kernel@pengutronix.de, Laurent.pinchart@ideasonboard.com,
        krzk@kernel.org, narmstrong@baylibre.com, b.zolnierkie@samsung.com,
        sylvester.nawrocki@gmail.com, a.hajda@samsung.com,
        jy0922.shim@samsung.com, sw0312.kim@samsung.com
From:   Inki Dae <inki.dae@samsung.com>
Message-ID: <fa535450-cd68-415f-5c48-a4f753b2b70b@samsung.com>
Date:   Mon, 9 Nov 2020 12:15:39 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
        Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200911135413.3654800-1-m.tretter@pengutronix.de>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrHJsWRmVeSWpSXmKPExsWy7bCmge6iTSviDf4fYLW4te4cq8XGGetZ
        La58fc9m8eLeRRaLVVN3slicP7+B3aJz4hJ2ixnn9zFZbFsBVHeoL9pixuSXbBbzPu9kcuDx
        eH+jld1j56y77B6zO2ayemxa1cnmcb/7OJNH/18Dj74tqxg9Pm+SC+CIyrbJSE1MSS1SSM1L
        zk/JzEu3VfIOjneONzUzMNQ1tLQwV1LIS8xNtVVy8QnQdcvMATpWSaEsMacUKBSQWFyspG9n
        U5RfWpKqkJFfXGKrlFqQklNgWaBXnJhbXJqXrpecn2tlaGBgZApUmJCdMaVrN2PBObmKHSv6
        WBsYF0t0MXJySAiYSEy+9Jiti5GLQ0hgB6PErgfTWSGcT4wS1xetY4ZwPjNK7GzvYodpuXxt
        GZgtJLCLUWLy5SqIoveMEr8vrmMCSQgLuEk8OXMcyObgEBEokXjzyBukhlngFaPEjsWtLCA1
        bAKqEhNX3GcDsXkF7CSmPr0E1ssioCJxr3EumC0qECFxvHsyO0SNoMTJmU/AejkFHCR2z30C
        VsMsIC5x68l8KFteonnrbGaIQ49wSCybbgBhu0hMWHQP6gFhiVfHt0DZUhIv+9vYQY6TEGhm
        lJg44zQThNPBKHH38XUWiCpjif1LJ4N9wyygKbF+lz5EWFFi5++5jBCL+STefe1hBSmREOCV
        6GgTgihRkjh28QYjhC0hcWHJRDYI20Pi0PJXbBMYFWcheW0WkndmIXlnFsLiBYwsqxjFUguK
        c9NTiw0LjJBjexMjOCFrme1gnPT2g94hRiYOxkOMEhzMSiK8LS7L4oV4UxIrq1KL8uOLSnNS
        iw8xmgIDeyKzlGhyPjAn5JXEG5oaGRsbW5gYmpkaGiqJ8/7R7ogXEkhPLEnNTk0tSC2C6WPi
        4JRqYJr9em3LSqtHjcdXqczzlnRSOmqzskVDvWlSad6fSf5MU+ZF8Ji+Fi1rzwm9F7a9Pumk
        4aJlyuFGXSwy0rv3V91U/6bGYfb2fWXam2TmY7Nl5ldr+5ydM/v8RvlzrYqm0YotZZ1xBfWS
        597t89RbUJ9Xt7erYfUpcWbmj2kSnIyMYRxzC5WqOE3FHGs+PTt2ft5re6HVy5X9l9fWRf27
        HG7dtk945RcJqQd/QqQ3iO3eUN7D+cY7zC/klZL0zAX77p1JzW77rv8l5v0NhkdPv5/dfLxw
        MYPqp5OTMp5su7J0YaTEt9BLRy5W6990nlv9zfLwoQhnz/Pu0RVmmUbX6xl19DXV0sJlnkzg
        mlGjp8RSnJFoqMVcVJwIAIpXLVBRBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprLIsWRmVeSWpSXmKPExsWy7bCSvO7CTSviDfoeqlvcWneO1WLjjPWs
        Fle+vmezeHHvIovFqqk7WSzOn9/AbtE5cQm7xYzz+5gstq0AqjvUF20xY/JLNot5n3cyOfB4
        vL/Ryu6xc9Zddo/ZHTNZPTat6mTzuN99nMmj/6+BR9+WVYwenzfJBXBEcdmkpOZklqUW6dsl
        cGVM6drNWHBOrmLHij7WBsbFEl2MnBwSAiYSl68tY+9i5OIQEtjBKLF9zh2WLkYOoISExJat
        HBCmsMThw8UQJW8ZJe4v/cUC0iss4Cbx5MxxJhBbRKBE4tO5R0wgRcwCrxgl9ne+ZoPomMwo
        8X7VUXaQKjYBVYmJK+6zgdi8AnYSU59eAutmEVCRuNc4F8wWFYiQaLn/hx2iRlDi5MwnYNs4
        BRwkds99AlbDLKAu8WfeJWYIW1zi1pP5UHF5ieats5knMArNQtI+C0nLLCQts5C0LGBkWcUo
        mVpQnJueW2xYYJSXWq5XnJhbXJqXrpecn7uJERyDWlo7GPes+qB3iJGJg/EQowQHs5IIb4vL
        sngh3pTEyqrUovz4otKc1OJDjNIcLErivF9nLYwTEkhPLEnNTk0tSC2CyTJxcEo1MBXmXGF2
        KjIOW2j03oElTHvq3Kl9C1MZj1jkqp9MvNHEKjTx/F7f9jqOxJtLrTkWbBCx6LhTGcAf18y2
        SXW5wqLS7pqjvWwCi4NPNZu03t2i5bTK6byQK+csb2Fdu/dKT0ME13dztj5NfGz2fP+7qv/r
        1p013rBDI662IUHDrvKxqUXG563v2eVs9e4u+T2J73nad+7f6aHPgxZ8suX5eVlV/b23QmTr
        kmeaFcvm50wOu5N8vMcx5rXMBLvVVk56S/WtVva1Pltu5ti0N7HgzCyvR3Iuu5X7JznO6TGY
        qPg98FHl58xZTzh5Kr9JXrBkXHPagaWra9Yb28ra+wKewcqKOab5OvMbl3BeYf2nxFKckWio
        xVxUnAgANtsQhDADAAA=
X-CMS-MailID: 20201109030817epcas1p2a192d63831b5f69ae881d21a771d35b2
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200911165401epcas1p3c7ee84dd01db93f472d6fa21c1100f29
References: <CGME20200911165401epcas1p3c7ee84dd01db93f472d6fa21c1100f29@epcas1p3.samsung.com>
        <20200911135413.3654800-1-m.tretter@pengutronix.de>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Michael,

Thanks for your contribution.

20. 9. 11. 오후 10:53에 Michael Tretter 이(가) 쓴 글:
> This is v2 of the series to convert the Exynos MIPI DSI driver into a drm
> bridge and make it usable with other drivers. Although the driver is
> converted, it still supports the component framework API to stay compliant
> with the Exynos DRM driver.
> 
> The Exynos MIPI DSI Phy is also found on the i.MX8M Mini. However, on the
> i.MX8M Mini, the bridge is driven by an LCDIF display controller instead of
> the Exynos Decon. The driver for the LCDIF does not use the component
> framework, but uses drm bridges.
> 
> I don't have any Exynos SoC to actually test the series. I build a dummy to
> test the bridge with a component driver, to make sure that at least the
> initialization is working. Furthermore, tested the driver as a bridge with a
> few additional unfinished patches on the i.MX8M Mini EVK. However, somebody
> should verify that the driver is still working on Exynos hardware.
> 
> I also changed the order of the patches to first make the driver more platform
> independent (patches 2 to 8), then convert to a drm bridge driver (patches 10

Just a fundamental question,
A MIPI-DSI(Display Serial Interface) bus device would be one of an encoder type of devices not bridge such as DSI to LVDS and LVDS to DSI bridge devices, and also image enhancer and image compressor in case of Exynos.
Why do you want to convert such MIPI-DSI driver to bridge type of driver? Seems not sensible. The reason would be just to share MIPI-DSI phy driver for Exynos with i.MX8M Mini?

Thanks,
Inki Dae


> to 13) and finally expose the API, split the code and move the platform
> independent driver to the bridges (patches 14 - 16). Hopefully this simplifies
> testing/bisecting and helps me to understand potential error reports.
> 
> Also I added host_ops for attach/detach and the tearing effect handler to make
> the calls into the platform code more visible.
> 
> Furthermore, the series should now apply to linux-next and correctly build the
> exynos_defconfig.
> 
> Thanks,
> 
> Michael
> 
> Changelog:
> 
> v2:
> - rebase on linux-next
> - verify with exynos_defconfig
> - fix crashes reported by Marek Szyprowski Exynos3250-based Rinato
> - reorder patches
> - add host_ops for platform specific code
> - roughly test component framework integration with dummy
> 
> Michael Tretter (16):
>   drm/encoder: remove obsolete documentation of bridge
>   drm/exynos: remove in_bridge_node from exynos_dsi
>   drm/exynos: use exynos_dsi as drvdata
>   drm/exynos: extract helper functions for probe
>   drm/exynos: move dsi host registration to probe
>   drm/exynos: shift register values to fields on write
>   drm/exynos: use identifier instead of register offsets
>   drm/exynos: add host_ops callback for platform drivers
>   drm/exynos: add callback for tearing effect handler
>   drm/exynos: implement a drm bridge
>   drm/exynos: convert encoder functions to bridge function
>   drm/exynos: configure mode on drm bridge
>   drm/exynos: get encoder from bridge whenever possible
>   drm/exynos: add API functions for platform drivers
>   drm/exynos: split out platform specific code
>   drm/exynos: move bridge driver to bridges
> 
>  drivers/gpu/drm/bridge/Kconfig          |    9 +
>  drivers/gpu/drm/bridge/Makefile         |    1 +
>  drivers/gpu/drm/bridge/samsung-dsim.c   | 1790 +++++++++++++++++++++
>  drivers/gpu/drm/exynos/Kconfig          |    5 +-
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c | 1927 ++---------------------
>  include/drm/bridge/samsung-dsim.h       |   64 +
>  include/drm/drm_encoder.h               |    1 -
>  7 files changed, 2027 insertions(+), 1770 deletions(-)
>  create mode 100644 drivers/gpu/drm/bridge/samsung-dsim.c
>  create mode 100644 include/drm/bridge/samsung-dsim.h
> 
