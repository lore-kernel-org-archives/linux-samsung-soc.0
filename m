Return-Path: <SRS0=V4sZ=4Q=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3888FC3F2CD
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 28 Feb 2020 14:55:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D2DE1246A8
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 28 Feb 2020 14:55:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="EN08DauY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726805AbgB1OzS (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 28 Feb 2020 09:55:18 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11]:59444 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726788AbgB1OzS (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 28 Feb 2020 09:55:18 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20200228145516euoutp0191e8ed1cb6fa7a3b43c078833fe9a71d~3mLmPpWqF1022410224euoutp010
        for <linux-samsung-soc@vger.kernel.org>; Fri, 28 Feb 2020 14:55:16 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20200228145516euoutp0191e8ed1cb6fa7a3b43c078833fe9a71d~3mLmPpWqF1022410224euoutp010
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1582901716;
        bh=PTKZSn+P1tJgveSJbvDp4Ja8+SjDXQKy8OZnr66O2wM=;
        h=From:To:Cc:Subject:Date:References:From;
        b=EN08DauYbSa2RvHQNI/JsPNcGukcFEi7Z6ANCW+Uj8orO7xt0Qwq6U3vF7LG6pzol
         lT4GLreiEuVrG4HPkOWixEo1qHhH95AwyBUzfyh4ei0frQNll+1LuhwPFUZ9bENqOo
         iRP/DKEELSBgV8KVlOqtBE9536+40E07HJzFwMFw=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200228145516eucas1p1b129c66290c848a5014a0d97bf872732~3mLl8XqxW2666026660eucas1p1s;
        Fri, 28 Feb 2020 14:55:16 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 6F.81.60679.4D9295E5; Fri, 28
        Feb 2020 14:55:16 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200228145516eucas1p229d1500f0b4025699a1aab5e2d33423c~3mLlmoZpk2874828748eucas1p24;
        Fri, 28 Feb 2020 14:55:16 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200228145516eusmtrp2f405307ab35bca2dac271e971925ac72~3mLlmETX81364013640eusmtrp2G;
        Fri, 28 Feb 2020 14:55:16 +0000 (GMT)
X-AuditID: cbfec7f4-0cbff7000001ed07-a2-5e5929d4964b
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 94.2C.08375.3D9295E5; Fri, 28
        Feb 2020 14:55:16 +0000 (GMT)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200228145515eusmtip20bd7a422be1afa55f1cc78357f9ed526~3mLlPrHnD0071100711eusmtip2h;
        Fri, 28 Feb 2020 14:55:15 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Marian Mihailescu <mihailescu2m@gmail.com>
Subject: [PATCH 1/2] ARM: dts: exynos: Fix G3D power domain supply on Odroid
 XU3/XU4/HC1 boards
Date:   Fri, 28 Feb 2020 15:55:01 +0100
Message-Id: <20200228145502.8316-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrPIsWRmVeSWpSXmKPExsWy7djPc7pXNCPjDE7tEbfYOGM9q8X58xvY
        LWac38dksfbIXXaL9dN+sjqweuycdZfdY9OqTjaPvi2rGD0+b5ILYInisklJzcksSy3St0vg
        yjj6JK/gIkfFi74+lgbGuexdjJwcEgImEh++bWPqYuTiEBJYwSgxvWMJM0hCSOALo8Sb33oQ
        ic+MEs3HlrLCdDSdfcMCkVjOKPH9xAk2uI5p70pBbDYBQ4mut11gcREBVYnPbQvYQRqYBfYw
        Slx+fRAsISyQKLFk91xGEJsFqGj77iVgG3gFbCTOTF8NdZ+8xOoNB5hBmiUE9rBJfJt4AeoM
        F4neTxeZIGxhiVfHt0A1yEj83zmfCaKhmVHi4bm17BBOD9DqphmMEFXWEnfO/QI6gwPoJk2J
        9bv0IcKOEnNmbmcCCUsI8EnceCsIEmYGMidtm84MEeaV6GgTgqhWk5h1fB3c2oMXLjFD2B4S
        dxv+sUACJVZi/cYLrBMY5WYh7FrAyLiKUTy1tDg3PbXYKC+1XK84Mbe4NC9dLzk/dxMjMNpP
        /zv+ZQfjrj9JhxgFOBiVeHgPMETGCbEmlhVX5h5ilOBgVhLh3fg1NE6INyWxsiq1KD++qDQn
        tfgQozQHi5I4r/Gil7FCAumJJanZqakFqUUwWSYOTqkGxr4G2z1mrXMLZFzuZembzL6n0rn4
        r7LbwuyqDXLCXVmnfE/t0j48a9baR/dWHfd1/tCmvChJjNMktJ5jK9+kY+uzK7yfXVh/PFDb
        O/vElQ/GSybrKp6c4yjlmbNA9f6iq/tnbitv1Tto5cE+P+L8n4NJtsXH9y7ar/lMrU3v9//k
        pMu5R97nbFdiKc5INNRiLipOBACWoAEj8gIAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrGLMWRmVeSWpSXmKPExsVy+t/xe7pXNCPjDPqfM1psnLGe1eL8+Q3s
        FjPO72OyWHvkLrvF+mk/WR1YPXbOusvusWlVJ5tH35ZVjB6fN8kFsETp2RTll5akKmTkF5fY
        KkUbWhjpGVpa6BmZWOoZGpvHWhmZKunb2aSk5mSWpRbp2yXoZRx9kldwkaPiRV8fSwPjXPYu
        Rk4OCQETiaazb1i6GLk4hASWMkqs2LMBKiEjcXJaAyuELSzx51oXG0TRJ0aJ/V1bGUESbAKG
        El1vQRKcHCICqhKf2xawgxQxC+xjlJjYtQWsW1ggXmLa9xfMIDYLUNH23UvA4rwCNhJnpq+G
        2iYvsXrDAeYJjDwLGBlWMYqklhbnpucWG+oVJ+YWl+al6yXn525iBIbZtmM/N+9gvLQx+BCj
        AAejEg/vAYbIOCHWxLLiytxDjBIczEoivBu/hsYJ8aYkVlalFuXHF5XmpBYfYjQFWj6RWUo0
        OR8YA3kl8YamhuYWlobmxubGZhZK4rwdAgdjhATSE0tSs1NTC1KLYPqYODilGhgVF/6/Zmba
        bfSMJ2+OM/fOyly5hS17JwRmbFy1MsEseE7W3BMeD2fdOfst5s+j+kWSe2bfsz44ZT7Dxv3n
        vtZ+0pnX+Flzl06PSk7nxV4fncB989hVuvOv7Pq+q0LSae/8VBvJyt7jX6InZtRH/HokVcsT
        fCHxrVbu+iKpx0cblvB/WSFUpPZAiaU4I9FQi7moOBEAL8CMWEkCAAA=
X-CMS-MailID: 20200228145516eucas1p229d1500f0b4025699a1aab5e2d33423c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200228145516eucas1p229d1500f0b4025699a1aab5e2d33423c
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200228145516eucas1p229d1500f0b4025699a1aab5e2d33423c
References: <CGME20200228145516eucas1p229d1500f0b4025699a1aab5e2d33423c@eucas1p2.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

G3D power domain in Exynos5422 SoC is supplied from VDD_G3D. Besides the
main GPU MALI module it also contains the power domain control logic and
clocks. Turning the VDD_G3D power supply off causes the power domain to
fail to operate properly and breaks for example system suspend/resume.
GPU should use VDD_G3D supply mainly to control the DVFS.

Fixes: 1a5a85c56402 ("ARM: dts: exynos: Add Mali/GPU node on Exynos5420 and enable it on Odroid XU3/4")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/boot/dts/exynos5422-odroid-core.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/exynos5422-odroid-core.dtsi b/arch/arm/boot/dts/exynos5422-odroid-core.dtsi
index 5cf1aed20490..ab27ff8bc3dc 100644
--- a/arch/arm/boot/dts/exynos5422-odroid-core.dtsi
+++ b/arch/arm/boot/dts/exynos5422-odroid-core.dtsi
@@ -901,6 +901,7 @@
 				regulator-min-microvolt = <800000>;
 				regulator-max-microvolt = <1400000>;
 				regulator-boot-on;
+				regulator-always-on;
 
 				regulator-state-mem {
 					regulator-off-in-suspend;
-- 
2.17.1

