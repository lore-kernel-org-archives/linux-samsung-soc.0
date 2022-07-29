Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 015FFC25B0E
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 29 Jul 2022 00:36:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233584AbiG2AgW (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 28 Jul 2022 20:36:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233700AbiG2AgT (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 28 Jul 2022 20:36:19 -0400
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCE1065665
        for <linux-samsung-soc@vger.kernel.org>; Thu, 28 Jul 2022 17:36:18 -0700 (PDT)
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
        by mailout1.samsung.com (KnoxPortal) with ESMTP id 20220729003614epoutp014c8a4ae9df68e67c05b4a89675a905a4~GJbWOl3Lk0269602696epoutp01J
        for <linux-samsung-soc@vger.kernel.org>; Fri, 29 Jul 2022 00:36:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20220729003614epoutp014c8a4ae9df68e67c05b4a89675a905a4~GJbWOl3Lk0269602696epoutp01J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1659054974;
        bh=/y6v2BIvfHn8DiE8LBKhSo+f6cx+IeKLxPebpXSG0Zg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=efF0sIwxjM7D5WIoGi/LhWKiBa2wlZIoxn6JH4EV2MrMAHVALc6Gode0vlcGbYLUi
         h6jzf/qZQOKlzi96dhkkYPgIDBIX2+Mdj9kTt9ZA8zlgYVbe8BkTyRKLXjB6Q545RX
         +Udw2WE3yk4WgK6FhcKWkZlakt1ln9hFywidbQEA=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTP id
        20220729003613epcas2p10ff6e39b02b15a0517101bd7d225d895~GJbVk4ejs2881228812epcas2p1b;
        Fri, 29 Jul 2022 00:36:13 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.36.97]) by
        epsnrtp3.localdomain (Postfix) with ESMTP id 4Lv7qK0qBqz4x9Q7; Fri, 29 Jul
        2022 00:36:13 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
        epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
        9D.C1.09666.C7B23E26; Fri, 29 Jul 2022 09:36:13 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
        20220729003612epcas2p20729747ecb512eec2b7f8ed55a8bfac2~GJbUOuDMw2400324003epcas2p2Q;
        Fri, 29 Jul 2022 00:36:12 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20220729003612epsmtrp250e6c90ff7919afdc7bb0298ba712a28~GJbUN4LC11035310353epsmtrp2Z;
        Fri, 29 Jul 2022 00:36:12 +0000 (GMT)
X-AuditID: b6c32a45-471ff700000025c2-24-62e32b7caa8b
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        BA.1B.08905.C7B23E26; Fri, 29 Jul 2022 09:36:12 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20220729003612epsmtip2c719079d52d19c6ef707e51ca9d2f056~GJbT_QDlm0066700667epsmtip2N;
        Fri, 29 Jul 2022 00:36:12 +0000 (GMT)
From:   Chanho Park <chanho61.park@samsung.com>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Sam Protsenko <semen.protsenko@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH v2 4/6] arm64: dts: exynosautov9: add fsys0/1 clock DT nodes
Date:   Fri, 29 Jul 2022 09:30:22 +0900
Message-Id: <50f8145bca30cf5c900359d0b78c1c617090e021.1659054220.git.chanho61.park@samsung.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <cover.1659054220.git.chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrHJsWRmVeSWpSXmKPExsWy7bCmhW6t9uMkg3kXmCwezNvGZnF5v7bF
        9S/PWS3mHznHatH34iGzxd7XW9ktNj2+xmrxseceq8WM8/uYLC6ecrVo3XuE3eLwm3ZWi3/X
        NrJYPO8Diq/a9YfRgd/j/Y1Wdo+ds+6ye2xa1cnmcefaHjaPzUvqPfq2rGL0+LxJLoA9Ktsm
        IzUxJbVIITUvOT8lMy/dVsk7ON453tTMwFDX0NLCXEkhLzE31VbJxSdA1y0zB+hqJYWyxJxS
        oFBAYnGxkr6dTVF+aUmqQkZ+cYmtUmpBSk6BeYFecWJucWleul5eaomVoYGBkSlQYUJ2xomn
        29gKPvJUzOjexNTAuIWri5GTQ0LAROLcpbWsXYxcHEICOxglTn28zgLhfGKUePd1JyOE841R
        YtG2RmaYlvU/LrBDJPYySvzd+ZsJwvnIKHGgYSYbSBWbgK7EluevwNpFBB4zSRw+0sYG4jAL
        tDFJTHu2kRWkSljAR+LIr06wuSwCqhI7390Hi/MKxEtcfvaVFWKfvMT1m21gNZwCthJdTd9Z
        IGoEJU7OfAJmMwPVNG+dzQyyQEJgLYfExg/bGCGaXSTefDjMBmELS7w6voUdwpaS+PxuL1S8
        WGLprE9MEM0NjBKXt/2CShhLzHrWDjSIA2iDpsT6XfogpoSAssSRW1B7+SQ6Dv9lhwjzSnS0
        CUE0qksc2D6dBcKWleie8xnqFQ+J2wthoT2BUeLFv2fsExgVZiF5ZxaSd2YhLF7AyLyKUSy1
        oDg3PbXYqMAQHsnJ+bmbGMEJWct1B+Pktx/0DjEycTAeYpTgYFYS4U2Ivp8kxJuSWFmVWpQf
        X1Sak1p8iNEUGNgTmaVEk/OBOSGvJN7QxNLAxMzM0NzI1MBcSZzXK2VDopBAemJJanZqakFq
        EUwfEwenVAOTmMRVr5vyH/uftIev+tv3Z45qrprb5ICq7Ys+XX7ucmHdq3s3Hq295JP0MMfz
        eI/58hUWZv5t83b+dL2pahv4o3/HEv7Tu25cf3Ilb2bOLPf7P7fNV1Odar+86Y8n15ank+dx
        Rt5g3/9KPGDWHv1X8bHq6/niWmJzJgaqp9Zwq2hWeIfPansoqHN3gVqK2eO2q7uva75dYROa
        aZRnvCtQtp339Z+6urW5zXksmtXuZ3RDf/CwKv5ZfYmr790N11fPF8jlFjfe586arz3pSFa7
        RedWu+gJb7+0GjoZL/DonRZvyzNXpP7Ino3TPu2OUi5Y3HH7Vs+kY6bKDPYezrI8DnNvZpzV
        /FeqVDF17cKDSizFGYmGWsxFxYkAk1/GC1EEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrBLMWRmVeSWpSXmKPExsWy7bCSvG6N9uMkg7vPuS0ezNvGZnF5v7bF
        9S/PWS3mHznHatH34iGzxd7XW9ktNj2+xmrxseceq8WM8/uYLC6ecrVo3XuE3eLwm3ZWi3/X
        NrJYPO8Diq/a9YfRgd/j/Y1Wdo+ds+6ye2xa1cnmcefaHjaPzUvqPfq2rGL0+LxJLoA9issm
        JTUnsyy1SN8ugSvjxNNtbAUfeSpmdG9iamDcwtXFyMkhIWAisf7HBfYuRi4OIYHdjBIXj7Uw
        QSRkJZ6928EOYQtL3G85wgpR9J5R4va2+WAJNgFdiS3PXzGCJEQEnjNJTFlxEMxhFuhikrjT
        9gmsSljAR+LIr05mEJtFQFVi57v7rCA2r0C8xOVnX1khVshLXL/ZBlbDKWAr0dX0nQXEFhKw
        kdiybBEbRL2gxMmZT8DizED1zVtnM09gFJiFJDULSWoBI9MqRsnUguLc9NxiwwLDvNRyveLE
        3OLSvHS95PzcTYzgyNHS3MG4fdUHvUOMTByMhxglOJiVRHgTou8nCfGmJFZWpRblxxeV5qQW
        H2KU5mBREue90HUyXkggPbEkNTs1tSC1CCbLxMEp1cCkeMayyUNHkH3b0RNa68/mMu860PVu
        W8oJ8Tqha6aNPbX26S2V4WmNB+Krd19jLl/dfX7ZvG3WB6dp63hpy7GsbWz68+Xo4QbDq/P3
        +ccmdsrMYtXfxCPf7NO1adKn+6qi95srMv76B2u1f/T0zGv9Ym9/iqsv/PSv9XNTD0k+y74s
        vsb348pfderZmtemr2SMfdOeNulX7MEHnz2SIj8abll38Zrkz+97Fq/8c+XknZc+f51uNXw5
        69j7TbRxzZSkvM5i4R1F9wX+G72XmRR71/vtpoJN6ToMy5mv3VI0T0xg27ej+Y3NtZtxBouS
        37Vr/6ycGR2z9W69yja76EcyiqnP0l/8Oex03+G99KUwJZbijERDLeai4kQAXQ8S9AsDAAA=
X-CMS-MailID: 20220729003612epcas2p20729747ecb512eec2b7f8ed55a8bfac2
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220729003612epcas2p20729747ecb512eec2b7f8ed55a8bfac2
References: <cover.1659054220.git.chanho61.park@samsung.com>
        <CGME20220729003612epcas2p20729747ecb512eec2b7f8ed55a8bfac2@epcas2p2.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add cmu_fsys0 and cmu_fsys1 for PCIe clocks and USB/MMC clocks
respectively.

Signed-off-by: Chanho Park <chanho61.park@samsung.com>
Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi | 28 ++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
index 2013718532f3..58b3b0c5d3fc 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
@@ -207,6 +207,34 @@ cmu_peric1: clock-controller@10800000 {
 				      "dout_clkcmu_peric1_ip";
 		};
 
+		cmu_fsys0: clock-controller@17700000 {
+			compatible = "samsung,exynosautov9-cmu-fsys0";
+			reg = <0x17700000 0x8000>;
+			#clock-cells = <1>;
+
+			clocks = <&xtcxo>,
+				 <&cmu_top DOUT_CLKCMU_FSYS0_BUS>,
+				 <&cmu_top DOUT_CLKCMU_FSYS0_PCIE>;
+			clock-names = "oscclk",
+				      "dout_clkcmu_fsys0_bus",
+				      "dout_clkcmu_fsys0_pcie";
+		};
+
+		cmu_fsys1: clock-controller@17040000 {
+			compatible = "samsung,exynosautov9-cmu-fsys1";
+			reg = <0x17040000 0x8000>;
+			#clock-cells = <1>;
+
+			clocks = <&xtcxo>,
+				 <&cmu_top DOUT_CLKCMU_FSYS1_BUS>,
+				 <&cmu_top GOUT_CLKCMU_FSYS1_MMC_CARD>,
+				 <&cmu_top DOUT_CLKCMU_FSYS1_USBDRD>;
+			clock-names = "oscclk",
+				      "dout_clkcmu_fsys1_bus",
+				      "gout_clkcmu_fsys1_mmc_card",
+				      "dout_clkcmu_fsys1_usbdrd";
+		};
+
 		cmu_fsys2: clock-controller@17c00000 {
 			compatible = "samsung,exynosautov9-cmu-fsys2";
 			reg = <0x17c00000 0x8000>;
-- 
2.37.1

