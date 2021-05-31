Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2905C47080
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 31 May 2021 21:41:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A402E61159
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 31 May 2021 21:41:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232102AbhEaVnU (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 31 May 2021 17:43:20 -0400
Received: from mailout3.samsung.com ([203.254.224.33]:57588 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231377AbhEaVnU (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 31 May 2021 17:43:20 -0400
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20210531214138epoutp03429c89b507d2a822d985e0d0764f4d10~ERLI40bM22230622306epoutp03X
        for <linux-samsung-soc@vger.kernel.org>; Mon, 31 May 2021 21:41:38 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20210531214138epoutp03429c89b507d2a822d985e0d0764f4d10~ERLI40bM22230622306epoutp03X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1622497298;
        bh=xbmc5wIqKEfUFYKOhh0IRxmokDrQ20wOpZo1J0r3Shc=;
        h=From:To:Cc:Subject:Date:References:From;
        b=TPDvyfE5OSGDa3Vbj0/pMuOMpqk0Ncyq9B8F4o9eStRLJwPQ9kzTx7q2OKQSk8Ten
         zE+KwSPKFKSFwN8McZNJzCE7ND4RlBeRkY+JVuJVmbiVxCIjBWsaJGxwNjIPBl3u6E
         M+eAyG4xBBltkYBR6CtZnQEU5wPl11q8Kq9z/MXg=
Received: from epsmges5p3new.samsung.com (unknown [182.195.42.75]) by
        epcas5p3.samsung.com (KnoxPortal) with ESMTP id
        20210531214137epcas5p34f3f64da946ce9aada5fe993a68a2cb4~ERLIXk6c11491014910epcas5p32;
        Mon, 31 May 2021 21:41:37 +0000 (GMT)
Received: from epcas5p1.samsung.com ( [182.195.41.39]) by
        epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
        58.1B.09835.11855B06; Tue,  1 Jun 2021 06:41:37 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
        20210531165414epcas5p1aae4ea3815fcbadad8b48a9210742489~ENQN5bgEs1332813328epcas5p1D;
        Mon, 31 May 2021 16:54:14 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20210531165414epsmtrp147a9ce6b9a0b4ce0a8bc106fc64e28d9~ENQN4sY-d0730807308epsmtrp1H;
        Mon, 31 May 2021 16:54:14 +0000 (GMT)
X-AuditID: b6c32a4b-7dfff7000000266b-05-60b55811a091
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        09.FD.08637.6B415B06; Tue,  1 Jun 2021 01:54:14 +0900 (KST)
Received: from Jaguar.sa.corp.samsungelectronics.net (unknown
        [107.108.73.139]) by epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20210531165413epsmtip1b7a5b9f88e942d605f0623e41ad1fa9e~ENQM58FSQ2067920679epsmtip1U;
        Mon, 31 May 2021 16:54:13 +0000 (GMT)
From:   Alim Akhtar <alim.akhtar@samsung.com>
To:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        catalin.marinas@arm.com
Cc:     krzk@kernel.org, linux-samsung-soc@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>
Subject: [PATCH] arm64: defconfig: Enable Exynos UFS driver
Date:   Mon, 31 May 2021 22:30:57 +0530
Message-Id: <20210531170057.7730-1-alim.akhtar@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrPIsWRmVeSWpSXmKPExsWy7bCmuq5gxNYEg32PxSwezNvGZvF+WQ+j
        xfnzG9gtNj2+xmpxedccNosZ5/cxObB5rJm3htFj06pONo/NS+o9+rasYvT4vEkugDWKyyYl
        NSezLLVI3y6BK+Pw+XVsBX/ZKw7fmcXawPiLrYuRk0NCwERi25kbrF2MXBxCArsZJeZ9b2KE
        cD4xSlyaeJoZwvnGKPH8621mmJbFp1qZQGwhgb2MEm+bQyGKWpgkDt59AzaXTUBb4u70LWBF
        IgKJEn8X3mQFsZkF4iVa+1eBxYUFrCV+3FsBNJSDg0VAVWLZJiuQMC9QeOfkF0wQu+QlVm84
        ALV3GbvEkVniELaLxNl5H6BeEJZ4dXwLO4QtJfGyv40dZKSEQLZEzy5jiHCNxNJ5x1ggbHuJ
        A1fmsICUMAtoSqzfpQ8RlpWYemodE8SRfBK9v59AXcArsWMejK0q0fzuKtQYaYmJ3d2sELaH
        xJTtW1ghIRIrcWlxL/MERtlZCBsWMDKuYpRMLSjOTU8tNi0wzkst1ytOzC0uzUvXS87P3cQI
        jnMt7x2Mjx580DvEyMTBeIhRgoNZSYT3TMXGBCHelMTKqtSi/Pii0pzU4kOM0hwsSuK8Kx5O
        ThASSE8sSc1OTS1ILYLJMnFwSjUwJfXH/284dXiORNKnjJv1D1PTUu8ujyiTebrSdd+8uknP
        ys/I1PLrzIlJqutxLNtbcKIitpLL8GvWhr3dp5Z8MeiPSV1y7xAPw44zfY1TJhtvuukr737u
        tfa1GUuZ9r4+FerzxZNLwGll0LyWe7Fnjz8/dvWB4b0LNoGCzDdUVtzpKbz1xfHglJxLHb/n
        rc7WVuO8kR+668/j3KNJQg8X+Pz6uOZUCpdP9xd+s/pQhrLWd9+EXLR+Lt6SfPE7m2/3nAR/
        p12/5md4fha4umPb8Zlv+v5VLVP6d2raWjv3GyHHrcP+WVe8NHySI3Dr4nSvfXNmvGqb8MyI
        Mf3Agia9uilcz74tNK+awVWh1fdhEacSS3FGoqEWc1FxIgAl1nN2YgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrOJMWRmVeSWpSXmKPExsWy7bCSnO42ka0JBqsWals8mLeNzeL9sh5G
        i/PnN7BbbHp8jdXi8q45bBYzzu9jcmDzWDNvDaPHplWdbB6bl9R79G1ZxejxeZNcAGsUl01K
        ak5mWWqRvl0CV8bh8+vYCv6yVxy+M4u1gfEXWxcjJ4eEgInE4lOtTF2MXBxCArsZJY41XmSG
        SEhLXN84gR3CFpZY+e85mC0k0MQkceShBYjNJqAtcXf6FiYQW0QgWaJr3Ucwm1kgUeLu05ks
        ILawgLXEj3srgGZycLAIqEos22QFEuYFCu+c/IIJYry8xOoNB5gnMPIsYGRYxSiZWlCcm55b
        bFhgmJdarlecmFtcmpeul5yfu4kRHDZamjsYt6/6oHeIkYmD8RCjBAezkgjvmYqNCUK8KYmV
        ValF+fFFpTmpxYcYpTlYlMR5L3SdjBcSSE8sSc1OTS1ILYLJMnFwSjUwHc25c3D7pBObcw+8
        8L23iSH178+KgAncikuSZXiv3YvRFOewD553dr5ozTU7/ZayC0vCQvMv7p1Vd3zxdYVSj8It
        elouogwx3den8wbbuKns5Nxxr4jn3sHfps53NNqDwpiOnIh8cHpN5bG/kpK5X/QuH/weZbV7
        5tXlVw/9D/ui3rsgKkA07HKRD5erf7k+c+Pewi0Grw5JHc37OcG4zsQ9UWvyrtS9astvzvc5
        mJ/jMSPnVr25xS91RSOztYotdeGOh05tUL56kU87UWbl/suPQgWqhGtCJX8Uv+560flb4qH7
        jZrmq1Hp9y3eM8U9zJ77u6xs2o1XTDaSNkI/uMWnXCg24L+U7uqndF9YiaU4I9FQi7moOBEA
        pDeUAIoCAAA=
X-CMS-MailID: 20210531165414epcas5p1aae4ea3815fcbadad8b48a9210742489
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
X-CMS-RootMailID: 20210531165414epcas5p1aae4ea3815fcbadad8b48a9210742489
References: <CGME20210531165414epcas5p1aae4ea3815fcbadad8b48a9210742489@epcas5p1.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Enable the Exynos UFS controller and PHY configs. They need to be
buildin to ensure UFS devices gets detected on exynos7 and its
variant boards.

Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 08c6f769df9a..f9938e0eb720 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -289,6 +289,7 @@ CONFIG_SCSI_UFSHCD=y
 CONFIG_SCSI_UFSHCD_PLATFORM=y
 CONFIG_SCSI_UFS_QCOM=m
 CONFIG_SCSI_UFS_HISI=y
+CONFIG_SCSI_UFS_EXYNOS=y
 CONFIG_ATA=y
 CONFIG_SATA_AHCI=y
 CONFIG_SATA_AHCI_PLATFORM=y
@@ -1110,6 +1111,7 @@ CONFIG_PHY_ROCKCHIP_INNO_USB2=y
 CONFIG_PHY_ROCKCHIP_INNO_DSIDPHY=m
 CONFIG_PHY_ROCKCHIP_PCIE=m
 CONFIG_PHY_ROCKCHIP_TYPEC=y
+CONFIG_PHY_SAMSUNG_UFS=y
 CONFIG_PHY_UNIPHIER_USB2=y
 CONFIG_PHY_UNIPHIER_USB3=y
 CONFIG_PHY_TEGRA_XUSB=y

base-commit: c4681547bcce777daf576925a966ffa824edd09d
-- 
2.17.1

