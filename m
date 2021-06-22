Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC6A1C2B9F4
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 22 Jun 2021 13:05:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C27906113E
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 22 Jun 2021 13:05:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231367AbhFVNHg (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 22 Jun 2021 09:07:36 -0400
Received: from mailout4.samsung.com ([203.254.224.34]:32740 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229844AbhFVNHd (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 22 Jun 2021 09:07:33 -0400
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20210622130516epoutp04e3b52fba3f57663baa2b6c4bded72848~K6Uk9ABdF1843418434epoutp04k
        for <linux-samsung-soc@vger.kernel.org>; Tue, 22 Jun 2021 13:05:16 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20210622130516epoutp04e3b52fba3f57663baa2b6c4bded72848~K6Uk9ABdF1843418434epoutp04k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1624367116;
        bh=dPOrZQCSv2QrpuL2mPyZh4ke2YDT+BDxwKav7Zhkndg=;
        h=From:To:Cc:Subject:Date:References:From;
        b=lDAg2aLO2J2nzHPkHMtTnXDLgsbm5rew07VS2D9AuDu9dTgiQLxWupZbYhAAy2s4p
         7qWKsoAhwJhRl4mMDcHR6r973ihzy7U1FWXEQt/IHyOimWv7AotOZyA97va58O9NDv
         d3NoxG5KGa+xWJRNsA+3p7nhlD+Vn0eF4hVM9r9s=
Received: from epsmges5p3new.samsung.com (unknown [182.195.42.75]) by
        epcas5p4.samsung.com (KnoxPortal) with ESMTP id
        20210622130515epcas5p4f99d9844cf2845f413fe78692d6068de~K6UkCil9H1881018810epcas5p4S;
        Tue, 22 Jun 2021 13:05:15 +0000 (GMT)
Received: from epcas5p1.samsung.com ( [182.195.41.39]) by
        epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
        02.DB.09452.B00E1D06; Tue, 22 Jun 2021 22:05:15 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
        20210622130203epcas5p48a3111fc6586b1bfe0bd3cb90f783ce0~K6RxRcsAe1990019900epcas5p4r;
        Tue, 22 Jun 2021 13:02:03 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20210622130203epsmtrp1c57fd301a05e86ec3273a4b0a4299044~K6RxQyGGX1393513935epsmtrp1P;
        Tue, 22 Jun 2021 13:02:03 +0000 (GMT)
X-AuditID: b6c32a4b-43fff700000024ec-95-60d1e00b1f8a
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        9B.A4.08289.B4FD1D06; Tue, 22 Jun 2021 22:02:03 +0900 (KST)
Received: from Jaguar.sa.corp.samsungelectronics.net (unknown
        [107.108.73.139]) by epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20210622130202epsmtip14dac6eb97c0e219320bb487c6d3e2725~K6RwKMJZq2900329003epsmtip1D;
        Tue, 22 Jun 2021 13:02:02 +0000 (GMT)
From:   Alim Akhtar <alim.akhtar@samsung.com>
To:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        robh+dt@kernel.org
Cc:     krzysztof.kozlowski@canonical.com,
        linux-samsung-soc@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>
Subject: [PATCH v2 1/2] arm64: dts: exynos7: Add cpu cache information
Date:   Tue, 22 Jun 2021 18:35:50 +0530
Message-Id: <20210622130551.67446-1-alim.akhtar@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrAIsWRmVeSWpSXmKPExsWy7bCmui73g4sJBnu+C1s8mLeNzWLj2x9M
        FpseX2O1uLxrDpvFjPP7mCxa9x5hd2DzmNXQy+axaVUnm8fmJfUefVtWMXp83iQXwBrFZZOS
        mpNZllqkb5fAlbH/1RzGgq+CFUdvKDcwvuTtYuTkkBAwkWh93sbexcjFISSwm1Fi2qQeRgjn
        E6PEpolNbBDOZ0aJne97mWBadt/7zgSR2MUoseRGCztIQkighUli84Q0EJtNQFvi7vQtYA0i
        AjESD/fMYwWxmQUKJV603ASrFxZwk+hddIsZxGYRUJX4O2stC4jNK2Aj0d35nR1imbzE6g0H
        mEGWSQgsY5fY0HwE6goXicWdq1kgbGGJV8e3QDVISbzsB3mIA8jOlujZZQwRrpFYOu8YVLm9
        xIErc1hASpgFNCXW79KHCMtKTD21jgniTD6J3t9PoDbxSuyYB2OrSjS/uwo1RlpiYnc3K4Tt
        ITGp+yULJBhiJU48Wco4gVF2FsKGBYyMqxglUwuKc9NTi00LjPNSy/WKE3OLS/PS9ZLzczcx
        giNdy3sH46MHH/QOMTJxMB5ilOBgVhLhfZF9MUGINyWxsiq1KD++qDQntfgQozQHi5I471L2
        QwlCAumJJanZqakFqUUwWSYOTqkGponb/uqHCFvpKGnqbhNYpjLVMvXS0UvGYlWHMx5GnAkp
        uv/u8Z/ElsCXj0o4Y8268z/PP8Y+Mem4zR3pVNcM/ZMPnMwsGO9m/75Q/YP12/PswMxrHVtc
        z30SqyyQPpz8YPM+wZIKd3vmwu03j17xedd+I9DgS9OyPb6Kok/vCe2ewbM7SeLt6ZAI8Qxf
        xZ03ExRnOxw1C9BilL+nYbPXdNPfucs2Kn7if/5mo6Hjh0XHgu89DLkofdObactM2RdzRUzd
        xTi9y/9KLDCYxdu16qzu1T4Gs59vZn0RFPbJvb3nbnrtO6+62WtO+4nobLN4/zns3Kunvmlb
        3l2tlJtw+P+/VIa6/23SfZfdenesXarEUpyRaKjFXFScCABBGCO7YwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrGJMWRmVeSWpSXmKPExsWy7bCSnK73/YsJBvtWilg8mLeNzWLj2x9M
        FpseX2O1uLxrDpvFjPP7mCxa9x5hd2DzmNXQy+axaVUnm8fmJfUefVtWMXp83iQXwBrFZZOS
        mpNZllqkb5fAlbH/1RzGgq+CFUdvKDcwvuTtYuTkkBAwkdh97ztTFyMXh5DADkaJu8tPskAk
        pCWub5zADmELS6z895wdoqiJSeLC0gdMIAk2AW2Ju9O3ANkcHCICcRKt66tBTGaBYonTv8Aq
        hAXcJHoX3WIGsVkEVCX+zloLNp5XwEaiu/M71Hh5idUbDjBPYORZwMiwilEytaA4Nz232LDA
        KC+1XK84Mbe4NC9dLzk/dxMjOGi0tHYw7ln1Qe8QIxMH4yFGCQ5mJRHeF9kXE4R4UxIrq1KL
        8uOLSnNSiw8xSnOwKInzXug6GS8kkJ5YkpqdmlqQWgSTZeLglGpgSp24JLh4f3rS4ikLZix7
        /MQxPWtytOrRQ7POMDPq397G08ltKaA/raxH9XLQoaPSiTcDKu/GbRMJF1397++H60smH946
        8Z3ArFY1teJ3JS92/4lZcc/t1oIFmxzkf1kcq3M0U96UvUxk4wH7gsTHXF3vz+r4RDWtjXgX
        7Gk4sTq8pbo5bqvyvYflfhl76zbkbE/grpryafuTsh3zbjNMmviw0ZBrg43FUXlvVyt+Fb0P
        5y1XMDq+PmG0mONa13Gu6c83bb9bJhQimyn96pRF+WaHTeXHQkSWvvjIIfBdlHVycjHze6XX
        JgwChysZDj1crXlo13m1/8++ip+ey9st77i5YIXymQ5R4/R7G5+aBCuxFGckGmoxFxUnAgBr
        bFoMiQIAAA==
X-CMS-MailID: 20210622130203epcas5p48a3111fc6586b1bfe0bd3cb90f783ce0
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
X-CMS-RootMailID: 20210622130203epcas5p48a3111fc6586b1bfe0bd3cb90f783ce0
References: <CGME20210622130203epcas5p48a3111fc6586b1bfe0bd3cb90f783ce0@epcas5p4.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

This patch adds cpu caches information to its dt
nodes so that the same is available to userspace
via sysfs.
This SoC has 48/32 KB I/D cache for each cores
and 2MB of L2 cache.

Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
---
Changes since v1:
* no change in this patch
* changes as per Krzysztof's review comments in patch 2/2

 arch/arm64/boot/dts/exynos/exynos7.dtsi | 35 +++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos7.dtsi b/arch/arm64/boot/dts/exynos/exynos7.dtsi
index 10244e59d56d..8b06397ba6e7 100644
--- a/arch/arm64/boot/dts/exynos/exynos7.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos7.dtsi
@@ -54,6 +54,13 @@
 			compatible = "arm,cortex-a57";
 			reg = <0x0>;
 			enable-method = "psci";
+			i-cache-size = <0xc000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&atlas_l2>;
 		};
 
 		cpu_atlas1: cpu@1 {
@@ -61,6 +68,13 @@
 			compatible = "arm,cortex-a57";
 			reg = <0x1>;
 			enable-method = "psci";
+			i-cache-size = <0xc000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&atlas_l2>;
 		};
 
 		cpu_atlas2: cpu@2 {
@@ -68,6 +82,13 @@
 			compatible = "arm,cortex-a57";
 			reg = <0x2>;
 			enable-method = "psci";
+			i-cache-size = <0xc000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&atlas_l2>;
 		};
 
 		cpu_atlas3: cpu@3 {
@@ -75,6 +96,20 @@
 			compatible = "arm,cortex-a57";
 			reg = <0x3>;
 			enable-method = "psci";
+			i-cache-size = <0xc000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&atlas_l2>;
+		};
+
+		atlas_l2: l2-cache0 {
+			compatible = "cache";
+			cache-size = <0x200000>;
+			cache-line-size = <64>;
+			cache-sets = <2048>;
 		};
 	};
 

base-commit: 614124bea77e452aa6df7a8714e8bc820b489922
-- 
2.17.1

