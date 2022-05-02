Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AF43C41535
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  2 May 2022 09:01:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1384026AbiEBJEx (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 2 May 2022 05:04:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1384028AbiEBJEr (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 2 May 2022 05:04:47 -0400
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A3B9583BF
        for <linux-samsung-soc@vger.kernel.org>; Mon,  2 May 2022 02:01:15 -0700 (PDT)
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20220502090109epoutp046ca6981543f614e802ab317d80dcf661~rPjFGc-ym0409404094epoutp04j
        for <linux-samsung-soc@vger.kernel.org>; Mon,  2 May 2022 09:01:09 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20220502090109epoutp046ca6981543f614e802ab317d80dcf661~rPjFGc-ym0409404094epoutp04j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1651482069;
        bh=H0/rBquNmxd/3w2CBO5TxNP/kMpo8lUBX0vKvnFp5DE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=VQ6nmE/Z5LZR8HAuh1/J/c82/VROlFQ8PbYfdH/ogf4wqkwz1d4QMxXoht2nfwRKW
         92O4Sl1FhpJyT1/v1koCQYY2WHmL6Ca6k7jSsqNL0iLeyf7y9udFiaA4tC3fZzfdR2
         y5mm3iXwSOCeg6eJMAjbFQcJl/AP5sW95F1QBNDY=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTP id
        20220502090109epcas2p3c2bc0e22949e5122219b8934753a0963~rPjEjoYcb1120311203epcas2p3b;
        Mon,  2 May 2022 09:01:09 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.36.90]) by
        epsnrtp4.localdomain (Postfix) with ESMTP id 4KsHBR52xpz4x9Q9; Mon,  2 May
        2022 09:01:03 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
        epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
        AA.F8.09694.DCD9F626; Mon,  2 May 2022 18:01:01 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
        20220502090101epcas2p205ec302ec371c6bc4d6fd3e0aff38043~rPi9MqBG70428104281epcas2p2q;
        Mon,  2 May 2022 09:01:01 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20220502090101epsmtrp22f71a634985fcf34ea3917e38427751b~rPi9LocKp3250332503epsmtrp2d;
        Mon,  2 May 2022 09:01:01 +0000 (GMT)
X-AuditID: b6c32a48-495ff700000025de-90-626f9dcdb742
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        BE.EB.08853.DCD9F626; Mon,  2 May 2022 18:01:01 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20220502090101epsmtip268145038a2c08d4b5dde57b695efef5a~rPi9BH7A91727317273epsmtip2s;
        Mon,  2 May 2022 09:01:01 +0000 (GMT)
From:   Chanho Park <chanho61.park@samsung.com>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Sam Protsenko <semen.protsenko@linaro.org>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH 10/12] arm64: dts: exynosautov9: add initial cmu clock nodes
Date:   Mon,  2 May 2022 18:02:28 +0900
Message-Id: <20220502090230.12853-11-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220502090230.12853-1-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPJsWRmVeSWpSXmKPExsWy7bCmqe75uflJBnMOs1k8mLeNzeLyfm2L
        61+es1rMP3KO1aLvxUNmi72vt7JbfOy5x2ox4/w+JouLp1wtWvceYbc4/Kad1eLftY0sFs/7
        gOKrdv1hdODzeH+jld1j56y77B6bVnWyedy5tofNo2/LKkaPz5vkAtiism0yUhNTUosUUvOS
        81My89JtlbyD453jTc0MDHUNLS3MlRTyEnNTbZVcfAJ03TJzgI5VUihLzCkFCgUkFhcr6dvZ
        FOWXlqQqZOQXl9gqpRak5BSYF+gVJ+YWl+al6+WlllgZGhgYmQIVJmRnfJrXx1IwVaLi/rV1
        zA2MF4S7GDk5JARMJH78u8ncxcjFISSwg1Hix5/zLCAJIYFPjBJnDudCJL4xSuy9uogRpuPo
        2QWsEIm9jBL77rZCOR8ZJbquXAerYhPQldjy/BUjSEJEoItZ4mLfPRYQh1lgK6PE8RuzmECq
        hAV8JF4cvgHUzsHBIqAqce2XPIjJK2AvMeGuKYgpISAv8W9xKEgxJ1D0zNbnYON5BQQlTs58
        AnYpM1BJ89bZzBDHLeSQmHaZCaLVRWLzFHuIsLDEq+Nb2CFsKYnP7/ayQdjFEktnfWICOUxC
        oIFR4vK2X1AJY4lZz9oZQeYwC2hKrN+lDzFSWeLILaitfBIdh/+yQ4R5JTrahCAa1SUObJ/O
        AmHLSnTP+cwKYXtInOmZAg2oSYwSX6dsZJ/AqDALyTOzkDwzC2HxAkbmVYxiqQXFuempxUYF
        JvDoTc7P3cQITrlaHjsYZ7/9oHeIkYmD8RCjBAezkghv24acJCHelMTKqtSi/Pii0pzU4kOM
        psBwnsgsJZqcD0z6eSXxhiaWBiZmZobmRqYG5krivF4pGxKFBNITS1KzU1MLUotg+pg4OKUa
        mBhTXwmmssgwrHxnM7+kzOnEug1uEV4Z/QtWfgoqufluzweF8y2acip2h0yzm3rfP7Lg2z7J
        RPioypQM7hi3IpOAk9H2AsUcxaLWmibmr4/patcHb91Ufrh4yxPp6MlCGWrps3OqFT33TKme
        8D8uhym5Z6rcEZbe6cFHMuPtBAxurGpcNrsx7EBr/trHTFmHZW/NuL/HIerAgVZv+VXPu+8E
        c0kyulRNUrit0/Lxsa9cSWpG5XN9d/+dauuzs7yC9a85XJ/bd0B1dt0ROcE9YdOKZmn5eez+
        sdWPZ4e9ySWHB6pFa/59OVjAXD1j2lTH6ltPGuLOerhPOlUx8du7i5YsMil/AyRNtrwwtXyt
        xFKckWioxVxUnAgA0C8UW0IEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrDLMWRmVeSWpSXmKPExsWy7bCSvO7ZuflJBj+/cFo8mLeNzeLyfm2L
        61+es1rMP3KO1aLvxUNmi72vt7JbfOy5x2ox4/w+JouLp1wtWvceYbc4/Kad1eLftY0sFs/7
        gOKrdv1hdODzeH+jld1j56y77B6bVnWyedy5tofNo2/LKkaPz5vkAtiiuGxSUnMyy1KL9O0S
        uDI+zetjKZgqUXH/2jrmBsYLwl2MnBwSAiYSR88uYO1i5OIQEtjNKHHv5T9GiISsxLN3O9gh
        bGGJ+y1HoIreM0p03XrDBpJgE9CV2PL8FSNIQkRgArPEmysf2EEcZoGdjBJ3Xp0CqxIW8JF4
        cfgGUDsHB4uAqsS1X/IgJq+AvcSEu6YgpoSAvMS/xaEgxZxA0TNbn4PdICRgJ/HjxH1mEJtX
        QFDi5MwnLCA2M1B589bZzBMYBWYhSc1CklrAyLSKUTK1oDg3PbfYsMAwL7Vcrzgxt7g0L10v
        OT93EyM4QrQ0dzBuX/VB7xAjEwfjIUYJDmYlEd62DTlJQrwpiZVVqUX58UWlOanFhxilOViU
        xHkvdJ2MFxJITyxJzU5NLUgtgskycXBKNTCZbX8XovFayqdHtZdD8M6c0L17fBj3Lis8FOHH
        9Pu5lNbJnKdz+Wx9zQuVTW+mtm1Zesz1Wuimz48EaxfLpFjLJzyq9HHd6DRLcz6z3IQqV53N
        6fzVhdfDN2kwmdiKBHpF1XdKvJ91M697xiORD1/cH925/0RzqXHbO3PJtl/sjI/2HJ8dZKW8
        +IXF7LN5N4N3fxSIlDuVxPZ4G//hUAmPpBVOItmF0mpHj9YsnnhWl4G7fG+lx4feyPMHLizY
        xXIiRD76S6Gq/ZL3LSuDezh7Lh7V8mWpvqVvYmLwK1rn8vP/vY3G9kr7ZxWd6AgqLzry6Kjw
        H4alTq67tofLM/yLWxX2QNSu7N9b5SMtUUosxRmJhlrMRcWJALx8p2D/AgAA
X-CMS-MailID: 20220502090101epcas2p205ec302ec371c6bc4d6fd3e0aff38043
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220502090101epcas2p205ec302ec371c6bc4d6fd3e0aff38043
References: <20220502090230.12853-1-chanho61.park@samsung.com>
        <CGME20220502090101epcas2p205ec302ec371c6bc4d6fd3e0aff38043@epcas2p2.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add cmu_top, cmu_busmc, cmu_core, cmu_fsys and peric0/c1/s clock nodes.

Signed-off-by: Chanho Park <chanho61.park@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi | 72 ++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
index 807d500d6022..6f181632267b 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
@@ -6,6 +6,7 @@
  *
  */
 
+#include <dt-bindings/clock/exynosautov9.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/soc/samsung,exynos-usi.h>
 
@@ -190,6 +191,77 @@ chipid@10000000 {
 			reg = <0x10000000 0x24>;
 		};
 
+		cmu_busmc: clock-controller@1b200000 {
+			compatible = "samsung,exynosautov9-cmu-busmc";
+			reg = <0x1b200000 0x8000>;
+			#clock-cells = <1>;
+
+			clocks = <&xtcxo>, <&cmu_top DOUT_CLKCMU_BUSMC_BUS>;
+			clock-names = "oscclk", "dout_clkcmu_busmc_bus";
+		};
+
+		cmu_core: clock-controller@1b030000 {
+			compatible = "samsung,exynosautov9-cmu-core";
+			reg = <0x1b030000 0x8000>;
+			#clock-cells = <1>;
+
+			clocks = <&xtcxo>, <&cmu_top DOUT_CLKCMU_CORE_BUS>;
+			clock-names = "oscclk", "dout_clkcmu_core_bus";
+		};
+
+		cmu_fsys2: clock-controller@17c00000 {
+			compatible = "samsung,exynosautov9-cmu-fsys2";
+			reg = <0x17c00000 0x8000>;
+			#clock-cells = <1>;
+
+			clocks = <&xtcxo>, <&cmu_top DOUT_CLKCMU_FSYS2_BUS>,
+				 <&cmu_top DOUT_CLKCMU_FSYS2_UFS_EMBD>,
+				 <&cmu_top DOUT_CLKCMU_FSYS2_ETHERNET>;
+			clock-names = "oscclk", "dout_clkcmu_fsys2_bus",
+				      "dout_fsys2_clkcmu_ufs_embd",
+				      "dout_fsys2_clkcmu_ethernet";
+		};
+
+		cmu_peric0: clock-controller@10200000 {
+			compatible = "samsung,exynosautov9-cmu-peric0";
+			reg = <0x10200000 0x8000>;
+			#clock-cells = <1>;
+
+			clocks = <&xtcxo>, <&cmu_top DOUT_CLKCMU_PERIC0_BUS>,
+				 <&cmu_top DOUT_CLKCMU_PERIC0_IP>;
+			clock-names = "oscclk", "dout_clkcmu_peric0_bus",
+				      "dout_clkcmu_peric0_ip";
+		};
+
+		cmu_peric1: clock-controller@10800000 {
+			compatible = "samsung,exynosautov9-cmu-peric1";
+			reg = <0x10800000 0x8000>;
+			#clock-cells = <1>;
+
+			clocks = <&xtcxo>, <&cmu_top DOUT_CLKCMU_PERIC1_BUS>,
+				 <&cmu_top DOUT_CLKCMU_PERIC1_IP>;
+			clock-names = "oscclk", "dout_clkcmu_peric1_bus",
+				      "dout_clkcmu_peric1_ip";
+		};
+
+		cmu_peris: clock-controller@10020000 {
+			compatible = "samsung,exynosautov9-cmu-peris";
+			reg = <0x10020000 0x8000>;
+			#clock-cells = <1>;
+
+			clocks = <&xtcxo>, <&cmu_top DOUT_CLKCMU_PERIS_BUS>;
+			clock-names = "oscclk", "dout_clkcmu_peris_bus";
+		};
+
+		cmu_top: clock-controller@1b240000 {
+			compatible = "samsung,exynosautov9-cmu-top";
+			reg = <0x1b240000 0x8000>;
+			#clock-cells = <1>;
+
+			clocks = <&xtcxo>;
+			clock-names = "oscclk";
+		};
+
 		gic: interrupt-controller@10101000 {
 			compatible = "arm,gic-400";
 			#interrupt-cells = <3>;
-- 
2.36.0

