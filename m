Return-Path: <SRS0=zaGS=5L=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4966BC2D0E7
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 26 Mar 2020 09:46:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 120762078B
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 26 Mar 2020 09:46:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="tKiSiIWM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727729AbgCZJqk (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 26 Mar 2020 05:46:40 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:40666 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727699AbgCZJqh (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 26 Mar 2020 05:46:37 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20200326094636euoutp029d6537c7e749db4467ffe9329e57da0e~-0YzIDbq42204122041euoutp02F
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Mar 2020 09:46:36 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20200326094636euoutp029d6537c7e749db4467ffe9329e57da0e~-0YzIDbq42204122041euoutp02F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1585215996;
        bh=IYiPnFMVdj4AWZmUuJdjjsmxDZuQgtEqdhTjOCvlzjo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=tKiSiIWMmF3hs+dhsXnv+qmH/9QbpaJsj0IsasSFPP9lvn0jACKUGmLnKqoOaQutw
         6wFOfKOdvqTXDW6ETOYgAgxD5tdXVM9+x4Uw27szrcHz/qy3J0wqp3TZ0Tk6QK6lWc
         n8YUx5CLymi0jLQD9ro2jaTtrAm+AxE6Z8zI3G84=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200326094636eucas1p1da5e1f49a47c6e7c7957d90fb8153a22~-0Yy5ra4v2968629686eucas1p1w;
        Thu, 26 Mar 2020 09:46:36 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 7C.AD.60698.CF97C7E5; Thu, 26
        Mar 2020 09:46:36 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200326094635eucas1p2fab15692c98fc148388a6922dc0d121f~-0YykETzh2482724827eucas1p2Y;
        Thu, 26 Mar 2020 09:46:35 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200326094635eusmtrp142f54d389a9ef2fed4ed467c186fcfe8~-0Yyji22A3171231712eusmtrp1T;
        Thu, 26 Mar 2020 09:46:35 +0000 (GMT)
X-AuditID: cbfec7f5-a0fff7000001ed1a-a1-5e7c79fc46a7
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 4D.C2.07950.BF97C7E5; Thu, 26
        Mar 2020 09:46:35 +0000 (GMT)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200326094635eusmtip2d32d4001e2b355299012ad4c5a19cf62~-0YyQoKJZ2636726367eusmtip2r;
        Thu, 26 Mar 2020 09:46:35 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH 4/4] ARM: exynos_defconfig: Compile MAC80211/CFG80211 as
 modules
Date:   Thu, 26 Mar 2020 10:46:26 +0100
Message-Id: <20200326094626.28308-5-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200326094626.28308-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrJIsWRmVeSWpSXmKPExsWy7djP87p/KmviDL7/YrPYOGM9q8X1L89Z
        Lc6f38BuMeP8PiaLtUfusjuwemxa1cnm0bdlFaPH501yAcxRXDYpqTmZZalF+nYJXBnN/5vZ
        C+ZyVWxc/J6tgfEpRxcjJ4eEgInEr3vz2LsYuTiEBFYwSszeuYcRwvnCKNGw4BhU5jOjxOe/
        r9hgWs4tWwiVWM4oMfnjTFaQBFjLhTUsIDabgKFE19susAYRAVWJz20LwBqYBbYxSmzpfcAM
        khAWCJJY+/UCWAMLUNGUl11gg3gFbCVunz7DDLFNXmL1hgNgNqeAncTiad9YQAZJCJxhk/j3
        fQ9UkYvEl6kPoc4Tlnh1fAs7hC0jcXpyD1RDM6PEw3Nr2SGcHkaJy00zGCGqrCXunPsF1M0B
        dJ+mxPpd+hBhR4n1e6axgoQlBPgkbrwVBAkzA5mTtk1nhgjzSnS0CUFUq0nMOr4Obu3BC5eg
        TvOQOPHuBhMktCYySvScWcE2gVF+FsKyBYyMqxjFU0uLc9NTi43zUsv1ihNzi0vz0vWS83M3
        MQITwOl/x7/uYNz3J+kQowAHoxIPb4R5dZwQa2JZcWXuIUYJDmYlEd6nkTVxQrwpiZVVqUX5
        8UWlOanFhxilOViUxHmNF72MFRJITyxJzU5NLUgtgskycXBKNTBePf7nW+/VuI8bJ3QsiOJy
        f11zqnzvp71Hqx7WRK2Mdp6gm//62LvNBdtU/Dn3cX23Yas6OGHa3tWuR59q9XX9ll3YX/HA
        hq9/buNCvRfulmKnVhTP1hM5PdMn/t2EesZzzpZLdyxpuXtRSUD8cunuFCaPGYte2YdEbFJa
        ppprOyucc9u21z5RSizFGYmGWsxFxYkAhOgCIfwCAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFLMWRmVeSWpSXmKPExsVy+t/xe7q/K2viDA6e0LfYOGM9q8X1L89Z
        Lc6f38BuMeP8PiaLtUfusjuwemxa1cnm0bdlFaPH501yAcxRejZF+aUlqQoZ+cUltkrRhhZG
        eoaWFnpGJpZ6hsbmsVZGpkr6djYpqTmZZalF+nYJehnN/5vZC+ZyVWxc/J6tgfEpRxcjJ4eE
        gInEuWUL2bsYuTiEBJYyStx78JEZIiEjcXJaAyuELSzx51oXG0TRJ0aJjVf+giXYBAwlut6C
        JDg5RARUJT63LQCbxCywg1Fiy463YEXCAgESB9seg9ksQEVTXnaB2bwCthK3T5+B2iYvsXrD
        ATCbU8BOYvG0bywgthBQzcaHD5knMPItYGRYxSiSWlqcm55bbKRXnJhbXJqXrpecn7uJERiO
        24793LKDsetd8CFGAQ5GJR7eDZbVcUKsiWXFlbmHGCU4mJVEeJ9G1sQJ8aYkVlalFuXHF5Xm
        pBYfYjQFOmois5Rocj4wVvJK4g1NDc0tLA3Njc2NzSyUxHk7BA7GCAmkJ5akZqemFqQWwfQx
        cXBKNTCW+B3X0Hgf+UXs/oalU+7oG76x0I1dkjmpdPWB1QnT46+Eafxa7MDj/X6aqtx3p4Cj
        XdxJbyNyAx6ceJce5fvklJm78WvZ799YHmW5nV5b4GtrqL448iTzz3UPRDJyTH++qzkb3Ge8
        3Xyrodi0KMNJxQ9vTDictWbL5zMnQ6WdeVVrruXfd+dUYinOSDTUYi4qTgQAgNt+Jl0CAAA=
X-CMS-MailID: 20200326094635eucas1p2fab15692c98fc148388a6922dc0d121f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200326094635eucas1p2fab15692c98fc148388a6922dc0d121f
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200326094635eucas1p2fab15692c98fc148388a6922dc0d121f
References: <20200326094626.28308-1-m.szyprowski@samsung.com>
        <CGME20200326094635eucas1p2fab15692c98fc148388a6922dc0d121f@eucas1p2.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

MAC80211/CFG80211 framework requires loading regulatory.db from
/lib/firmware directory, so it makes very little sense to have it
built-in. Change it to be built as modules to let it properly load the
needed firmware/db files. As a side effect of this change, the size of
the compressed modules on SquashFS increased significantly from 27MiB
to 38MiB, so increase the size of BLK_DEV_RAM to allow the modules to
fit into it.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/configs/exynos_defconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
index 1ea2f87533ef..1bbbc677f0e3 100644
--- a/arch/arm/configs/exynos_defconfig
+++ b/arch/arm/configs/exynos_defconfig
@@ -79,8 +79,8 @@ CONFIG_BT_HCIVHCI=m
 CONFIG_BT_MRVL=m
 CONFIG_BT_MRVL_SDIO=m
 CONFIG_BT_ATH3K=m
-CONFIG_CFG80211=y
-CONFIG_MAC80211=y
+CONFIG_CFG80211=m
+CONFIG_MAC80211=m
 CONFIG_MAC80211_LEDS=y
 CONFIG_NFC=y
 CONFIG_NFC_DIGITAL=m
@@ -95,7 +95,7 @@ CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_BLK_DEV_CRYPTOLOOP=y
 CONFIG_BLK_DEV_RAM=y
-CONFIG_BLK_DEV_RAM_SIZE=32768
+CONFIG_BLK_DEV_RAM_SIZE=65536
 CONFIG_SCSI=y
 CONFIG_BLK_DEV_SD=y
 CONFIG_CHR_DEV_SG=y
-- 
2.17.1

