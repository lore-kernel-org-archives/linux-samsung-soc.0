Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B69B6C56201
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 12 Nov 2020 11:54:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6761C2220B
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 12 Nov 2020 11:54:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="dlMPUIoj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727916AbgKLLyJ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 12 Nov 2020 06:54:09 -0500
Received: from mailout2.w1.samsung.com ([210.118.77.12]:42477 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728202AbgKLLvy (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 12 Nov 2020 06:51:54 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20201112115124euoutp0277925571407ff7763650b51685a4a681~GwGtMuq8j2695026950euoutp02y
        for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Nov 2020 11:51:24 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20201112115124euoutp0277925571407ff7763650b51685a4a681~GwGtMuq8j2695026950euoutp02y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1605181884;
        bh=4fyCws4IJ/FYfmeubIZmsDv7F8YQu+sqPMRSahhjyO0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=dlMPUIojXEHmfHpDR69CpTGYydXLv7isQje2Un6d4U0ortFQkr5aEnCxUDlyUqZW9
         4CBzjfKDbT+OmiT8qBj1gfhPECGOoO8f9MxAb3KXqyroUIhB80ijdWR5nbtRQmK1Jy
         NXn0Ua24nDduvfUTxRXzdpieiRG2WeAa4p+Wouzw=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20201112115110eucas1p2d1dd008558d1f4ed3684ce050c0238c2~GwGgMO08L2190821908eucas1p2d;
        Thu, 12 Nov 2020 11:51:10 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 3B.E6.27958.EA12DAF5; Thu, 12
        Nov 2020 11:51:10 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20201112115109eucas1p190980b0cfd73d205d5fbc1b9bdd97214~GwGflQEs42862728627eucas1p1m;
        Thu, 12 Nov 2020 11:51:09 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20201112115109eusmtrp1cf3063c4a34d98eb9646b431872356b6~GwGfkV-zq1853418534eusmtrp1R;
        Thu, 12 Nov 2020 11:51:09 +0000 (GMT)
X-AuditID: cbfec7f2-efdff70000006d36-4e-5fad21aed13b
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 64.B7.16282.DA12DAF5; Thu, 12
        Nov 2020 11:51:09 +0000 (GMT)
Received: from localhost (unknown [106.120.51.46]) by eusmtip1.samsung.com
        (KnoxPortal) with ESMTPA id
        20201112115109eusmtip198c7ec6cdce933431d0ca1a56145255e~GwGfXrHyW0079100791eusmtip1D;
        Thu, 12 Nov 2020 11:51:09 +0000 (GMT)
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
Subject: [PATCH v6 5/5] ARM: defconfig: Enable ax88796c driver
Date:   Thu, 12 Nov 2020 12:51:06 +0100
Message-Id: <20201112115106.16224-6-l.stelmach@samsung.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201112115106.16224-1-l.stelmach@samsung.com>
MIME-Version: 1.0
Organization: Samsung R&D Institute Poland
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrLKsWRmVeSWpSXmKPExsWy7djPc7rrFNfGG3w+y2tx/u4hZouNM9az
        Wsw538JiMf/IOVaLRe9nsFpce3uH1aL/8Wtmi/PnN7BbXNjWx2px89AKRotNj6+xWlzeNYfN
        Ysb5fUwWh6buZbRYe+Quu8WxBWIWrXuPsDsIely+dpHZY8vKm0weO2fdZffYtKqTzWPzknqP
        nTs+M3n0bVnF6PF5k1wARxSXTUpqTmZZapG+XQJXRs/uC2wFrZwVGyasYG5g/M3excjBISFg
        InGsz6KLkYtDSGAFo8S8G6+ZIZwvjBLXN8A4nxklJi05A9dx9l8+RHw5o8TVpgamLkZOIOc5
        o0TDaVUQm03AUaJ/6QlWkCIRgXvMEuvbHzCCOMwC+xgldt6bwgxSJSxgJ7Hl2XZmkKksAqoS
        c/tjQMK8AtYSXxufsYPYEgLyEu3Lt7OB2JwCNhJLb15kh6gRlDg58wkLiM0voCWxpuk6mM0M
        VN+8dTYzRO9uTomnd3IgbBeJddMWskDYwhKvjm+Bmi8jcXpyDwvEY/USkyeZgZwpIdDDKLFt
        zg+oemuJO+d+sYHUMAtoSqzfpQ8RdpRonXkTGiZ8EjfeCkJcwCcxadt0Zogwr0RHmxBEtYrE
        uv49UAOlJHpfrWCcwKg0C8kvs5DcPwth1wJG5lWM4qmlxbnpqcWGeanlesWJucWleel6yfm5
        mxiBKe70v+OfdjDOffVR7xAjEwfjIUYJDmYlEV5lhzXxQrwpiZVVqUX58UWlOanFhxilOViU
        xHlXzQZKCaQnlqRmp6YWpBbBZJk4OKUamKQjk+4JlK0rLTpdW+M+JUybUX32pz93cr5EnRG/
        t2z2+igezeKf/jJyNwSvdayZd6ZHO3X6H95kowX7jLQDJh6/cp09nXNLKndDe0KgZ5/Ijvn2
        Vzp79tWqZIbFzHNwVRLrYa+/trjq0WZ1ydXt/ofnTG1ZF7amwNl08f1rwrsNZtYn+pgf/NW/
        /mDWHJXrSd8CpkaW3rqh4dh8IkRnfcv2GXw9l8Lm5D/6zmxQ92UlK2Ppnz/Wx4rydjCZ3fuf
        M+PRw/j3iW+8lvHmrd3VU9gTJn5H3I7zgX+/8ISJImlPXU9zH3y40PSI84Qdi/+l6v472he8
        aRln4KsTM1SUHlQevLPum75TUadO8iyza0osxRmJhlrMRcWJAPPgw17gAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrAIsWRmVeSWpSXmKPExsVy+t/xu7prFdfGG8xepWxx/u4hZouNM9az
        Wsw538JiMf/IOVaLRe9nsFpce3uH1aL/8Wtmi/PnN7BbXNjWx2px89AKRotNj6+xWlzeNYfN
        Ysb5fUwWh6buZbRYe+Quu8WxBWIWrXuPsDsIely+dpHZY8vKm0weO2fdZffYtKqTzWPzknqP
        nTs+M3n0bVnF6PF5k1wAR5SeTVF+aUmqQkZ+cYmtUrShhZGeoaWFnpGJpZ6hsXmslZGpkr6d
        TUpqTmZZapG+XYJeRs/uC2wFrZwVGyasYG5g/M3excjBISFgInH2X34XIxeHkMBSRok/jTtZ
        IOJSEivnpncxcgKZwhJ/rnWxQdQ8ZZS42jeHDSTBJuAo0b/0BCtIQkTgDbNE07237CAOs8A+
        Ron9Rxezg1QJC9hJbHm2nRlkKouAqsTc/hiQMK+AtcTXxmfsEBvkJdqXbwcbyilgI7H05kWw
        uBBQTevMz+wQ9YISJ2c+ATuOWUBdYv08IZAwv4CWxJqm6ywgNjPQmOats5knMArNQtIxC6Fj
        FpKqBYzMqxhFUkuLc9Nzi430ihNzi0vz0vWS83M3MQKjetuxn1t2MK589VHvECMTB+MhRgkO
        ZiURXmWHNfFCvCmJlVWpRfnxRaU5qcWHGE2BHpvILCWanA9MK3kl8YZmBqaGJmaWBqaWZsZK
        4rwmR4CaBNITS1KzU1MLUotg+pg4OKUamEJ+rzh14WuC/fQSiYtSu1aaWBd9Xnul2lh6rX7b
        7MbrBU+dHnj/skkLb/+4dEFzwVH/ngcnZ22xUa+4fVtPLbpE75zNajv93tI/vj7cs1wjFI/3
        PV+WfZv1i7CC7QGVgz+PXWFZ3v8jyfiqrnjz9+NfihUyf86YoHVvPjvvnFjnvta6/DvNPsZL
        Hz44bZ+2vcP8XmH1av7fj2PWd8gdVbnzNU/j8Q/hsN++Cu2H3X9sks164GuyZsrRO+vWnmh2
        V/3y55lHkVNpYqOlQptj5APnaXysn86w/o4Puey5Pvn3JztWj9uXlqjuSHhqkZB4uUrQVb4s
        6WSSQi/vv+W7K5f+Wnntn91a3W+dE6cIOCmxFGckGmoxFxUnAgC6heBmcwMAAA==
X-CMS-MailID: 20201112115109eucas1p190980b0cfd73d205d5fbc1b9bdd97214
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20201112115109eucas1p190980b0cfd73d205d5fbc1b9bdd97214
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20201112115109eucas1p190980b0cfd73d205d5fbc1b9bdd97214
References: <20201112115106.16224-1-l.stelmach@samsung.com>
        <CGME20201112115109eucas1p190980b0cfd73d205d5fbc1b9bdd97214@eucas1p1.samsung.com>
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

