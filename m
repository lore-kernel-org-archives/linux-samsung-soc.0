Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13011E936F8
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  6 Oct 2023 11:06:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231789AbjJFLGt (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 6 Oct 2023 07:06:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231312AbjJFLGr (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 6 Oct 2023 07:06:47 -0400
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B57D83
        for <linux-samsung-soc@vger.kernel.org>; Fri,  6 Oct 2023 04:06:46 -0700 (PDT)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20231006110644euoutp01fcc6dcbf8a288ae01ac6db3915dfcc2e~Lf-vtMn4X0299802998euoutp013
        for <linux-samsung-soc@vger.kernel.org>; Fri,  6 Oct 2023 11:06:44 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20231006110644euoutp01fcc6dcbf8a288ae01ac6db3915dfcc2e~Lf-vtMn4X0299802998euoutp013
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1696590404;
        bh=wc0Fkep9oQbMu+hN1ocKounAUNiX+CWVbsJYngOHgSE=;
        h=From:To:Cc:Subject:Date:References:From;
        b=ROKJ33moR34BpnAAFU96j880CagQtc9yR3zqCuQBjAOHHh9rAadX+3+1NHMjwlfex
         Qw/gqpGETY3xvaYfc1qk7n3OW5LyM60OAELcvi79GMmlDkyyWcEgWCnGGRKAL31LyJ
         f9RqI2DFOwYY0zDrO7uTStFB6O3b5yUGGvEIX5Es=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20231006110644eucas1p23411f2b3f9ea1cad8ce6139a04539a98~Lf-vbtaEj0813008130eucas1p2t;
        Fri,  6 Oct 2023 11:06:44 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 0D.E0.42423.44AEF156; Fri,  6
        Oct 2023 12:06:44 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20231006110643eucas1p11d87c94c0fc765bb856f373df553f003~Lf-vHaV503009830098eucas1p1U;
        Fri,  6 Oct 2023 11:06:43 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20231006110643eusmtrp2758a48dcfdbeaa8d5e2b9d82313f09da~Lf-vGyNRa0301403014eusmtrp2V;
        Fri,  6 Oct 2023 11:06:43 +0000 (GMT)
X-AuditID: cbfec7f2-a51ff7000002a5b7-fc-651fea44f4a4
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 5A.CA.10549.34AEF156; Fri,  6
        Oct 2023 12:06:43 +0100 (BST)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20231006110643eusmtip244b219833c924dc514609746b6d20a62~Lf-us8aX11319613196eusmtip2X;
        Fri,  6 Oct 2023 11:06:43 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] ARM: exynos_defconfig: add driver for ISL29018
Date:   Fri,  6 Oct 2023 13:06:31 +0200
Message-Id: <20231006110631.3204334-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmleLIzCtJLcpLzFFi42LZduznOV2XV/KpBndWClo8mLeNzeLvpGPs
        Fntfb2W32PT4GqvFjPP7mCzWHrnL7sDm8fvXJEaPO9f2sHlsXlLv0bdlFaPH501yAaxRXDYp
        qTmZZalF+nYJXBl7b/gVnGKt2PZ9EksD40uWLkYODgkBE4kHN9y7GLk4hARWMEps7N/LBuF8
        YZQ4enUmI4TzmVFietd5pi5GTrCOL6eOsUIkljNKnP82E6FlxvlP7CBVbAKGEl1vu9hAdogI
        eEssv6YIUsMssJ5R4tKXWawgNcIC9hKTG9cwg9gsAqoSvR+Xs4DYvEDxy+tns0Bsk5fYf/As
        M0RcUOLkzCdgcWagePPW2cwgQyUEJnJIrNmyEKrBRWLb48nMELawxKvjW9ghbBmJ/zvnM0E0
        tDNKLPh9H8qZwCjR8PwWI0SVtcSdc7/AzmYW0JRYv0sfIuwo8XrZbjZIiPFJ3HgrCHEEn8Sk
        bdOZIcK8Eh1tQhDVahKzjq+DW3vwwiWoczwkVnUcBvtdSCBWYv7XXqYJjAqzkLw2C8lrsxBu
        WMDIvIpRPLW0ODc9tdgwL7Vcrzgxt7g0L10vOT93EyMwvZz+d/zTDsa5rz7qHWJk4mA8xCjB
        wawkwpveIJMqxJuSWFmVWpQfX1Sak1p8iFGag0VJnFc1RT5VSCA9sSQ1OzW1ILUIJsvEwSnV
        wMRy0TxM38XEq9kywU7TLPHYO9N2kWUnJ6y1lvSsTnA7z29U0MzLrVpk4L66NuN4sN/WQ6zF
        oX0dbqdk+monlai4z8xMSjgtUp8eP922P9tn4S+nHn7Ln5Ze+9j6L4UdOrXxaKZNscjkpil8
        XAfn3Wv9sE0tkCssO3Mji1yjFh9LQl9P5nWVze+0y159K1yg+74ucVvcBzchViGFKSvOZ8q8
        /KIuY3Bc7+D+gM57uzf9OfA+5qrYRVdVjRtf9Caw5UVw8rQu6W7lX9GcuTsiVL9ru19Rh/CF
        eYzzZpZfqZzu6x139qNxoVzBJm8N0Ycstyc9vn6uYUeyyVJH9z81v5f2B3cvlvu6J/rlzOdK
        LMUZiYZazEXFiQBWfTmhngMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrELMWRmVeSWpSXmKPExsVy+t/xe7rOr+RTDaZctLR4MG8bm8XfScfY
        Lfa+3spusenxNVaLGef3MVmsPXKX3YHN4/evSYwed67tYfPYvKTeo2/LKkaPz5vkAlij9GyK
        8ktLUhUy8otLbJWiDS2M9AwtLfSMTCz1DI3NY62MTJX07WxSUnMyy1KL9O0S9DL23vArOMVa
        se37JJYGxpcsXYycHBICJhJfTh1j7WLk4hASWMooMa31LytEQkbi5LQGKFtY4s+1LjaIok+M
        EuffHWMGSbAJGEp0vQVJcHKICPhKNH/dADaJWWAjo8T+hS1gK4QF7CUmN64Ba2ARUJXo/bgc
        LM4LFL+8fjbUGfIS+w+eZYaIC0qcnPkELM4MFG/eOpt5AiPfLCSpWUhSCxiZVjGKpJYW56bn
        FhvqFSfmFpfmpesl5+duYgQG9rZjPzfvYJz36qPeIUYmDsZDjBIczEoivOkNMqlCvCmJlVWp
        RfnxRaU5qcWHGE2B7pvILCWanA+MrbySeEMzA1NDEzNLA1NLM2MlcV7Pgo5EIYH0xJLU7NTU
        gtQimD4mDk6pBibj5d42X4yNy6dvMtixc7W97dQjb5fP7RMLaRZ4c1Xddc4h1zQR7eS26J/X
        b30MyVdhYpZJvsrPbdLqdvpbiJno3hf2p24vXdXKXHv1/KRWxxt2LN5fA+ziNNlZu6+F8oW1
        /jmyR3RhcWuKmHnjbYdTVQuO9p+KC+CP4XF7LFNmxj3hyk2JfYK6wtKxwi9fe1ybJb2hdWH2
        KS6pYu+Oaz8/zT6dWdfq1y4/96pI+6mb0hduTfldvOF/9FSVmJl92/ijxAMzOeyfuj16xfyC
        mefa/1sOO+fvd5nou8D8le8PHVbndMGD/Vt0QlZ/2H5w5wIL6eSm+Jv9RzsXzV5d8ehbJXfE
        hfvrtu9tbXKS/qrEUpyRaKjFXFScCADFzzjP9QIAAA==
X-CMS-MailID: 20231006110643eucas1p11d87c94c0fc765bb856f373df553f003
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20231006110643eucas1p11d87c94c0fc765bb856f373df553f003
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20231006110643eucas1p11d87c94c0fc765bb856f373df553f003
References: <CGME20231006110643eucas1p11d87c94c0fc765bb856f373df553f003@eucas1p1.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Intersil 29018 light and proximity sensor is built into Exynos based
Peach-Pit/Pi Chromebooks, so enable driver for it to increase testing
coverage.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/configs/exynos_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
index 66ebb761126c..c98d5ff8a1ed 100644
--- a/arch/arm/configs/exynos_defconfig
+++ b/arch/arm/configs/exynos_defconfig
@@ -322,6 +322,7 @@ CONFIG_EXYNOS_ADC=y
 CONFIG_STMPE_ADC=y
 CONFIG_CM36651=y
 CONFIG_AK8975=y
+CONFIG_SENSORS_ISL29018=y
 CONFIG_PWM=y
 CONFIG_PWM_SAMSUNG=y
 CONFIG_PHY_EXYNOS5250_SATA=y
-- 
2.34.1

