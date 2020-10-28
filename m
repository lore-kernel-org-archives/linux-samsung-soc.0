Return-Path: <SRS0=zATP=EE=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9166AC4363A
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 29 Oct 2020 02:04:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4E834208C3
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 29 Oct 2020 02:04:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="IDdCaDw6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726138AbgJ2CEN (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 28 Oct 2020 22:04:13 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:34231 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727269AbgJ1Vkx (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 28 Oct 2020 17:40:53 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20201028214030euoutp01589080bf97bc3b32c482351f98c1f94d~CRdx_gojK2166421664euoutp01W
        for <linux-samsung-soc@vger.kernel.org>; Wed, 28 Oct 2020 21:40:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20201028214030euoutp01589080bf97bc3b32c482351f98c1f94d~CRdx_gojK2166421664euoutp01W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1603921230;
        bh=4fyCws4IJ/FYfmeubIZmsDv7F8YQu+sqPMRSahhjyO0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=IDdCaDw6DRX9p4kROFfT4ceJWDgtTfNB33gomCzTGx0IzEWFGSKVYzDfMEOVQROIN
         TEB9N8bDPqX+nNQPsxtSGU3zpQXk8IJI7EBIRRDd6KMNzHukG9oDurEc1H1IhOoHaG
         x2mKlToQLsgOFK859XhbQNwFW9phRI/YHStL8qZc=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20201028214018eucas1p16eee6fcda557e98dec14f6861eaf7274~CRdnGPahs3058930589eucas1p1h;
        Wed, 28 Oct 2020 21:40:18 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id BB.36.05997.245E99F5; Wed, 28
        Oct 2020 21:40:18 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20201028214017eucas1p16bc64d4596386177f4060689a6443098~CRdmEdCK52052320523eucas1p1U;
        Wed, 28 Oct 2020 21:40:17 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20201028214017eusmtrp1ccc4abba573ee34c02d6ee34245e1355~CRdmA4lDU0596205962eusmtrp1B;
        Wed, 28 Oct 2020 21:40:17 +0000 (GMT)
X-AuditID: cbfec7f4-677ff7000000176d-49-5f99e542dd5f
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 58.7B.06017.145E99F5; Wed, 28
        Oct 2020 21:40:17 +0000 (GMT)
Received: from localhost (unknown [106.120.51.46]) by eusmtip1.samsung.com
        (KnoxPortal) with ESMTPA id
        20201028214017eusmtip182cf6dbc79ac87bf6453515fd0add79f~CRdltmZ-21306413064eusmtip1f;
        Wed, 28 Oct 2020 21:40:17 +0000 (GMT)
From:   =?UTF-8?q?=C5=81ukasz=20Stelmach?= <l.stelmach@samsung.com>
To:     Andrew Lunn <andrew@lunn.ch>, jim.cromie@gmail.com,
        Heiner Kallweit <hkallweit1@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Cc:     =?UTF-8?q?Bart=C5=82omiej=20=C5=BBolnierkiewicz?= 
        <b.zolnierkie@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        =?UTF-8?q?=C5=81ukasz=20Stelmach?= <l.stelmach@samsung.com>
Subject: [PATCH v4 5/5] ARM: defconfig: Enable ax88796c driver
Date:   Wed, 28 Oct 2020 22:40:12 +0100
Message-Id: <20201028214012.9712-6-l.stelmach@samsung.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201028214012.9712-1-l.stelmach@samsung.com>
MIME-Version: 1.0
Organization: Samsung R&D Institute Poland
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02SazBUYRjHe53LHmo5lvJGZdpRE01IMu/QGExqPzRTM9WHmLA4YVqX2YPS
        F0ZJSRiXWpsircgQljb3MZshya5GuYxLJmQoNEMXudTuHqa+/Z7n/f+f5//MvBQmGCGsqYio
        WEYaJZYISRNc1bGsOeQzlR/o/KbEFWlH1RiqkVURqEB7A0eF7RoCFS/ICNQ/N0KgzIkvGNJq
        q3moV5VBoCF1GUDKiX4C9TUWkEimbTVC6rwWgCrbR3moo2gHSmlp53mZi/r632GiumdDRqIG
        +ShPpCy/TYpqFYmihvpFI1FGXTkQLSr3nKH8TI6FMpKIeEbq5BlkEp7e1EvGpBhfrc4qw5LA
        Ci8NGFOQdoXypDU8DZhQAroMwLW2FYIrlgDsSyvZKBYBnG1+CDYteYsyUs8CuhTAhtbzHE8D
        OPUqRM8k7Q0zS14bzJb0GAarUseBvsDoVp1hLBfTqyxoT/hkcNgwFaf3wfmSZlzPfNod3qsc
        J7lttjC19KWBjWkPOLnURHAac9iVP2nQm9EOsCJ5wMCYTn/9xQOM8+ZRsObOWY6PQ80nxcbR
        FnC2s26Dd8HunHSdl9JxIszJdtPnhHQ6gKqCXzin8YAjmt+kXoPR9rCq0Ylre8PPyQqSs5rC
        wTlzLoEpzFbdx7g2H966KeDUdvB5ZvPGQGt4d7YMZAGh/L9b5P/ll//bVQSwcmDFxLGRYQzr
        EsVccWTFkWxcVJhjSHSkEuj+XPd651I9aFwNVgOaAsJt/N7h/EABIY5nEyLVAFKY0JLv09Md
        IOCHihOuMdLoQGmchGHVwIbChVb8I8UzFwV0mDiWucwwMYx089WIMrZOAi7s0ZadLsoedNB7
        9+P9AQGpW23aDnT+UOVW2M3/xDslXyUT53hvbSpPkN/9T50mR9ng2Ko/1bYL2z/IwrtWpym3
        fn5h0KC7bEqTNTS8dyA+Q9VqWj6zHOxkw/d/+u2Rc3LLpZPvqQv2W7rWZxW+IV6+seZ+g4Uz
        Zqu9H2vT/SqLhTgbLj7sgElZ8V/02KohbwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrPIsWRmVeSWpSXmKPExsVy+t/xu7qOT2fGG2yeo2px/u4hZouNM9az
        Wsw538JiMf/IOVaLRe9nsFpce3uH1aL/8Wtmi/PnN7BbXNjWx2px89AKRotNj6+xWlzeNYfN
        Ysb5fUwWh6buZbRYe+Quu8WxBWIWrXuPsDsIely+dpHZY8vKm0weO2fdZffYtKqTzWPzknqP
        nTs+M3n0bVnF6PF5k1wAR5SeTVF+aUmqQkZ+cYmtUrShhZGeoaWFnpGJpZ6hsXmslZGpkr6d
        TUpqTmZZapG+XYJeRs/uC2wFrZwVGyasYG5g/M3excjJISFgIjH18wy2LkYuDiGBpYwSU3/9
        YOli5ABKSEmsnJsOUSMs8edaF1TNU0aJS/2L2EASbAKOEv1LT7CCJEQE3jBLNN17yw7iMAvs
        Y5TYf3Qx2AphATuJxTduM4LYLAKqEu+W7mEBsXkFrCSmrX3ABrFCXqJ9+XYwm1PAWuLJl92s
        ILYQUM3Pb23sEPWCEidnPgG7jllAXWL9PCGQML+AlsSaputgI5mBxjRvnc08gVFoFpKOWQgd
        s5BULWBkXsUoklpanJueW2ykV5yYW1yal66XnJ+7iREY2duO/dyyg7HrXfAhRgEORiUe3gu3
        Z8YLsSaWFVfmHmKU4GBWEuF1Ons6Tog3JbGyKrUoP76oNCe1+BCjKdCbE5mlRJPzgUknryTe
        0NTQ3MLS0NzY3NjMQkmct0PgYIyQQHpiSWp2ampBahFMHxMHp1QD4+kW4wPuO1SY55lZn+hf
        m/0w5dbFwI8mn22/LpUS2PulmdPS5MKeyqXFmp+LLjHPaPweJHTFMFlMmu/gwzSTxPN7Zk97
        dS9TeZ/qznfWuZEVp+IbZ7+VmBdX8PjFJg33P6ai++aviFq9ZHrKugCu3S9Xd5RtXmKtE8PG
        9d/Qw+T+pxMPtwUIFCqxFGckGmoxFxUnAgBePp6cAgMAAA==
X-CMS-MailID: 20201028214017eucas1p16bc64d4596386177f4060689a6443098
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20201028214017eucas1p16bc64d4596386177f4060689a6443098
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20201028214017eucas1p16bc64d4596386177f4060689a6443098
References: <20201028214012.9712-1-l.stelmach@samsung.com>
        <CGME20201028214017eucas1p16bc64d4596386177f4060689a6443098@eucas1p1.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Enable ax88796c driver for the ethernet chip on Exynos3250-based
ARTIK5 boards.

Signed-off-by: Łukasz Stelmach <l.stelmach@samsung.com>
---
 arch/arm/configs/exynos_defconfig   | 2 ++
 arch/arm/configs/multi_v7_defconfig | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
index cf82c9d23a08..1ee902d01eef 100644
--- a/arch/arm/configs/exynos_defconfig
+++ b/arch/arm/configs/exynos_defconfig
@@ -107,6 +107,8 @@ CONFIG_MD=y
 CONFIG_BLK_DEV_DM=y
 CONFIG_DM_CRYPT=m
 CONFIG_NETDEVICES=y
+CONFIG_NET_VENDOR_ASIX=y
+CONFIG_SPI_AX88796C=y
 CONFIG_SMSC911X=y
 CONFIG_USB_RTL8150=m
 CONFIG_USB_RTL8152=y
diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index e731cdf7c88c..dad53846f58f 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -243,6 +243,8 @@ CONFIG_SATA_HIGHBANK=y
 CONFIG_SATA_MV=y
 CONFIG_SATA_RCAR=y
 CONFIG_NETDEVICES=y
+CONFIG_NET_VENDOR_ASIX=y
+CONFIG_SPI_AX88796C=m
 CONFIG_VIRTIO_NET=y
 CONFIG_B53_SPI_DRIVER=m
 CONFIG_B53_MDIO_DRIVER=m
-- 
2.26.2

