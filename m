Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5154C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 23 May 2022 11:39:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234996AbiEWLj5 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 23 May 2022 07:39:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234988AbiEWLjJ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 23 May 2022 07:39:09 -0400
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A413150459
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 May 2022 04:39:06 -0700 (PDT)
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
        by mailout2.samsung.com (KnoxPortal) with ESMTP id 20220523113904epoutp0273776442baaef1740e13bd28c9001e20~xuP8y_uPW1767517675epoutp02A
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 May 2022 11:39:04 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20220523113904epoutp0273776442baaef1740e13bd28c9001e20~xuP8y_uPW1767517675epoutp02A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1653305944;
        bh=ySKIIF/d75SnBSSr/hy3suLI5ZV3wY4ZQ+qSgzAeYaI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=HcOQyW4GPzEKR8YrZFi/Z2zrBXCKg5B/tS9OM5HeIv1XTu3uphyH6WBTJLRhzedEc
         y1YSXe/YJtWmX6c8TMMhgYIICDUOzKuRImNwId4QSp9m98gTNUH3rYHwuFR4t3pD07
         qX91d4Wcp5mFj3LvWLI9k17nUsGLyq5JFEefcQX8=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTP id
        20220523113904epcas2p17aa79464384823e02256a750d852985e~xuP8aapsn3011130111epcas2p1K;
        Mon, 23 May 2022 11:39:04 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.91]) by
        epsnrtp3.localdomain (Postfix) with ESMTP id 4L6Fj13nK0z4x9Pp; Mon, 23 May
        2022 11:39:01 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
        epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        C0.2C.09764.5527B826; Mon, 23 May 2022 20:39:01 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
        20220523113901epcas2p2ff6ea3954cbd5c3450798a359ab363fe~xuP5tbN9_1007810078epcas2p2G;
        Mon, 23 May 2022 11:39:01 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20220523113901epsmtrp222af85ed11ab870ebda2fbec621e9051~xuP5sZbNp0448304483epsmtrp2H;
        Mon, 23 May 2022 11:39:01 +0000 (GMT)
X-AuditID: b6c32a46-f8bff70000002624-fe-628b72550bda
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        4D.FD.11276.5527B826; Mon, 23 May 2022 20:39:01 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20220523113900epsmtip175790ef7e02d6fbdff24ab2c7829fb2a~xuP5jvZrO1525615256epsmtip1p;
        Mon, 23 May 2022 11:39:00 +0000 (GMT)
From:   Chanho Park <chanho61.park@samsung.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH v2 3/3] arm64: dts: exynosautov9: add watchdog DT nodes
Date:   Mon, 23 May 2022 20:39:19 +0900
Message-Id: <20220523113919.59571-4-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220523113919.59571-1-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphk+LIzCtJLcpLzFFi42LZdljTTDe0qDvJ4MlXGYsH87axWVzer21x
        /ctzVov5R86xWvS9eMhsMeP8PiaL1r1H2C2e9+1jcuDw2LSqk83jzrU9bB59W1YxenzeJBfA
        EpVtk5GamJJapJCal5yfkpmXbqvkHRzvHG9qZmCoa2hpYa6kkJeYm2qr5OIToOuWmQN0hZJC
        WWJOKVAoILG4WEnfzqYov7QkVSEjv7jEVim1ICWnwLxArzgxt7g0L10vL7XEytDAwMgUqDAh
        O2PbnLvsBY+5Kq6cm8/WwPiPo4uRk0NCwERi98NZLF2MXBxCAjsYJTbtfcQO4XxilDi6+waU
        841RYsfmw2wwLbe7n0El9jJKPJ2zlw3C+cgo8a7tBxNIFZuArsSW568YQWwRgXiJ828awZYw
        C7xklDhx6QGQw8EhLOAuseuvEUgNi4CqxMTNjWAbeAXsJK6vb2aC2CYvsWF+LzOIzSlgL/H+
        3i8miBpBiZMzn7CA2MxANc1bZzODzJcQeMsu8aDxLQtEs4vEo2MH2SFsYYlXx7dA2VISn9/t
        hXqnWGLprE9MEM0NjBKXt/2CShhLzHrWzghyKLOApsT6XfogpoSAssSRW1B7+SQ6Dv9lhwjz
        SnS0CUE0qksc2D4d6gJZie45n1khbA+JzTvWsELCahKjxP2VDxgnMCrMQvLOLCTvzEJYvICR
        eRWjWGpBcW56arFRgRE8ipPzczcxgpOlltsOxilvP+gdYmTiYDzEKMHBrCTCuz2xI0mINyWx
        siq1KD++qDQntfgQoykwsCcyS4km5wPTdV5JvKGJpYGJmZmhuZGpgbmSOK9XyoZEIYH0xJLU
        7NTUgtQimD4mDk6pBqaDUbPqVQ6FLD65cLojt+nNL27uNm9nnMo4XLrk9544l9e2BaF8efcM
        N3yYHflo9+p5n06bF7PfmvK2TC5XS6bQzmubU9UPsQPFRyaHFGXxvfNdzy/T/GZiTIG2+nxN
        8+bdPrPO6T+uffUoe+aGWUw1X29E/mdR3nX7jMyiFd/eXi4xWxXDLs65QOe8ZOiDXdZVe54e
        aF8w6eSFzJn1UfuKGtjvbt1u3NNvPjeA5atl02+GFRyFdbdepAsv0XOYfXnxl5mneQTntOwT
        L5jh6P334FeRZS56Aku2h8zM2vT6qeGETtdPTUt3TLRse1XavXdF4yWmE4m2jE4++1z+hrl7
        JNpmi350jPpbd/ahzBYRJZbijERDLeai4kQAAVg6QR8EAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGLMWRmVeSWpSXmKPExsWy7bCSnG5oUXeSweejzBYP5m1js7i8X9vi
        +pfnrBbzj5xjteh78ZDZYsb5fUwWrXuPsFs879vH5MDhsWlVJ5vHnWt72Dz6tqxi9Pi8SS6A
        JYrLJiU1J7MstUjfLoErY9ucu+wFj7kqrpybz9bA+I+ji5GTQ0LAROJ29zP2LkYuDiGB3YwS
        U5dtYYFIyEo8e7eDHcIWlrjfcoQVoug9o8TtO+uYQRJsAroSW56/YgSxRQTiJZae+8ECUsQs
        8JZR4t+DmUAJDg5hAXeJXX+NQGpYBFQlJm5uZAOxeQXsJK6vb2aCWCAvsWF+L9hMTgF7iff3
        foHFhYBqnjcvYIaoF5Q4OfMJ2HHMQPXNW2czT2AUmIUkNQtJagEj0ypGydSC4tz03GLDAsO8
        1HK94sTc4tK8dL3k/NxNjOCg1tLcwbh91Qe9Q4xMHIyHGCU4mJVEeLcndiQJ8aYkVlalFuXH
        F5XmpBYfYpTmYFES573QdTJeSCA9sSQ1OzW1ILUIJsvEwSnVwKS2judLUFNH+R8h812uKQzz
        P//bHSO+8kXGpsmXq2TdvQ+8uerQdXnFxfYfpaLnq685sSj88Hu7wfp9TMnh5Xx2eXOmMi1N
        vej37lxNtEXz7uJXdtVPb+raFX1kDVefe2dhE/cbScYdnx9uL1Ddu7t6ddDsC2mVhkL7lxxx
        vVX1rmexzf8HCYq3vth/9SqIidVR/h4/PTXhgLpr1N32R+7nPksqHvm4aObOYuVn4e3hnsYP
        eU7cEkn+sLtTyt7+uXZ17arpWi72/S9iOtzaVk3Oy58764R7YfreMMbNaV6G2fPLZy83adhx
        aF7iuamvFXgY3QNvBLOnLlI7X9Cwl/NAe9vCP/NDJrQ0HMrafVGJpTgj0VCLuag4EQDkLkYy
        2QIAAA==
X-CMS-MailID: 20220523113901epcas2p2ff6ea3954cbd5c3450798a359ab363fe
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220523113901epcas2p2ff6ea3954cbd5c3450798a359ab363fe
References: <20220523113919.59571-1-chanho61.park@samsung.com>
        <CGME20220523113901epcas2p2ff6ea3954cbd5c3450798a359ab363fe@epcas2p2.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Adds two cpu watchdog devices for ExynosAutov9 SoC.

Signed-off-by: Chanho Park <chanho61.park@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
index 3e23db8f09d9..1b76943cb382 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
@@ -400,6 +400,26 @@ ufs_0: ufs0@17e00000 {
 			samsung,sysreg = <&syscon_fsys2 0x710>;
 			status = "disabled";
 		};
+
+		watchdog_cl0: watchdog@10050000 {
+			compatible = "samsung,exynosautov9-wdt";
+			reg = <0x10050000 0x100>;
+			interrupts = <GIC_SPI 476 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cmu_peris CLK_GOUT_WDT_CLUSTER0>, <&xtcxo>;
+			clock-names = "watchdog", "watchdog_src";
+			samsung,syscon-phandle = <&pmu_system_controller>;
+			samsung,cluster-index = <0>;
+		};
+
+		watchdog_cl1: watchdog@10060000 {
+			compatible = "samsung,exynosautov9-wdt";
+			reg = <0x10060000 0x100>;
+			interrupts = <GIC_SPI 475 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cmu_peris CLK_GOUT_WDT_CLUSTER1>, <&xtcxo>;
+			clock-names = "watchdog", "watchdog_src";
+			samsung,syscon-phandle = <&pmu_system_controller>;
+			samsung,cluster-index = <1>;
+		};
 	};
 };
 
-- 
2.36.1

