Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1861C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  7 Oct 2021 12:11:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C750B60F90
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  7 Oct 2021 12:11:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241135AbhJGMM6 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 7 Oct 2021 08:12:58 -0400
Received: from mailout1.samsung.com ([203.254.224.24]:33229 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241121AbhJGMM4 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 7 Oct 2021 08:12:56 -0400
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
        by mailout1.samsung.com (KnoxPortal) with ESMTP id 20211007121101epoutp01668248c4cb4e51f520b994065abbda06~rvmwYcu8h0490504905epoutp01U
        for <linux-samsung-soc@vger.kernel.org>; Thu,  7 Oct 2021 12:11:01 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20211007121101epoutp01668248c4cb4e51f520b994065abbda06~rvmwYcu8h0490504905epoutp01U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1633608661;
        bh=h9kOd/Bkk1qhe2ZaVNq5mfRueqVIYsaDBGH4IH+Tn5k=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Y0Vc8966iNOkQZpp9ATiRj/TpbRPVtCX3Y+UJUe1iMIr5s7euNOV9t3015GfJNUZ8
         hKSEA2+VEG55e1arjW0nuA7is4uOPWjMdM745mW+66NKUZUwsfD3NodeySAcDV6VGY
         t/LXDLrXFS9wUBJRnJ0I+D0vuH5BzoZRjG20T228=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTP id
        20211007121100epcas2p42eb6c97fd6e92403e22665622eebc97a~rvmv19LuY3145231452epcas2p4E;
        Thu,  7 Oct 2021 12:11:00 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.36.88]) by
        epsnrtp2.localdomain (Postfix) with ESMTP id 4HQ9C46VPTz4x9Py; Thu,  7 Oct
        2021 12:10:56 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
        epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
        DD.8A.09749.0D3EE516; Thu,  7 Oct 2021 21:10:56 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
        20211007121055epcas2p3257cda61bd7f28f8ac9f3ba126b8fd41~rvmrRFdK_3229632296epcas2p3C;
        Thu,  7 Oct 2021 12:10:55 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20211007121055epsmtrp22d90744204d3c302a195b258f016792d~rvmrPcQjF1397313973epsmtrp2S;
        Thu,  7 Oct 2021 12:10:55 +0000 (GMT)
X-AuditID: b6c32a47-d13ff70000002615-02-615ee3d0e232
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        03.58.09091.FC3EE516; Thu,  7 Oct 2021 21:10:55 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20211007121055epsmtip1806a26f5b68da4d89283182bdf648b70~rvmrEjU1m0981909819epsmtip1G;
        Thu,  7 Oct 2021 12:10:55 +0000 (GMT)
From:   Chanho Park <chanho61.park@samsung.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH 3/3] arm64: dts: exynos: add minimal support for
 exynosautov9 sadk board
Date:   Thu,  7 Oct 2021 21:08:55 +0900
Message-Id: <20211007120855.56555-4-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211007120855.56555-1-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprEJsWRmVeSWpSXmKPExsWy7bCmue6Fx3GJBg1HjCwu79e2mH/kHKvF
        xrc/mCym/FnOZDHj/D4mi9a9R9gtDr9pZ7VYtesPowOHx6yGXjaPnbPusntsWtXJ5nHn2h42
        j74tqxg9Pm+SC2CLyrbJSE1MSS1SSM1Lzk/JzEu3VfIOjneONzUzMNQ1tLQwV1LIS8xNtVVy
        8QnQdcvMAbpHSaEsMacUKBSQWFyspG9nU5RfWpKqkJFfXGKrlFqQklNgXqBXnJhbXJqXrpeX
        WmJlaGBgZApUmJCdsWTib9aCq8IVrydlNTC+4e9i5OSQEDCRuNn9nLWLkYtDSGAHo0TbqSWM
        IAkhgU+MEovuGUEkvjFKrLv9hRWmY87/WSwQib2MEhNfHIHq+MgosfyAIYjNJqArseX5K0aQ
        IhGBTkaJld+2MYEkmAUOMEpsuWDXxcjBISwQJdH/UBbEZBFQldi7rgSkglfATmL6walMELvk
        JY786mQGsTkF7CUmPXrAClEjKHFy5hMWiInyEs1bZzODrJIQ+MkuMatzB1Szi8Sbw29YIGxh
        iVfHt7BD2FISn9/tZYNo6GaUaH30HyqxmlGis9EHwraX+DV9CyvIccwCmhLrd+mDmBICyhJH
        bkHt5ZPoOPyXHSLMK9HRJgTRqC5xYPt0qK2yEt1zPkODzUPixbyN0GCbxCjx9vQNpgmMCrOQ
        vDMLyTuzEBYvYGRexSiWWlCcm55abFRgDI/e5PzcTYzgxKnlvoNxxtsPeocYmTgYDzFKcDAr
        ifDm28cmCvGmJFZWpRblxxeV5qQWH2I0BYb1RGYp0eR8YOrOK4k3NLE0MDEzMzQ3MjUwVxLn
        nfvPKVFIID2xJDU7NbUgtQimj4mDU6qByfxl9kWv6t9mh9WaHM9oKeyM5DpVWLtOzdrEVdB5
        ttXpd5enXT10d+qsk6X1u7z+pFadWewgIid70XOW9sw3fW6STBl8Uq1MKqe35G+ekHud5/Ou
        C8seWix5/mHOzK6sftaka7e33/4ZuWTplNLl/C8mHgjTeZtsJKa4dPrSQN5gySeHJt4uYvqf
        s7n1T8ba2SVL1naUduxgcvY74VjA837m1u0fmb7stT6yLvLA2TzRxdOfHV+XvfPou+ZFSs0Z
        KydJi24sMjPbnqxy+HOzlG35Q27mKU++OEzbM21BibyhtPT+jXu7raoTmCvK5qd2tvgaen/q
        iQz1jdMy0y13C15ibGXs/6k4+kNc1/3VQkosxRmJhlrMRcWJAOyENIAlBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrPLMWRmVeSWpSXmKPExsWy7bCSnO75x3GJBg8maVhc3q9tMf/IOVaL
        jW9/MFlM+bOcyWLG+X1MFq17j7BbHH7TzmqxatcfRgcOj1kNvWweO2fdZffYtKqTzePOtT1s
        Hn1bVjF6fN4kF8AWxWWTkpqTWZZapG+XwJWxZOJv1oKrwhWvJ2U1ML7h72Lk5JAQMJGY838W
        SxcjF4eQwG5Gie673ewQCVmJZ+92QNnCEvdbjrBCFL1nlDh8/BZYgk1AV2LL81eMIAkRgW5G
        if7GXiYQh1ngCKPE/++/gOZycAgLREh0/RMCMVkEVCX2risB6eUVsJOYfnAqE8QCeYkjvzqZ
        QWxOAXuJSY8esILYQkA1bcemMELUC0qcnPmEBcRmBqpv3jqbeQKjwCwkqVlIUgsYmVYxSqYW
        FOem5xYbFhjmpZbrFSfmFpfmpesl5+duYgSHuZbmDsbtqz7oHWJk4mA8xCjBwawkwptvH5so
        xJuSWFmVWpQfX1Sak1p8iFGag0VJnPdC18l4IYH0xJLU7NTUgtQimCwTB6dUA5P1fhWW36/D
        yvYY3uLZtu6O1EeFdR+++nm8Kljr5CyWviX+2FbdIK4ozd7NVgsblrxk1VnxaF2E7kaOBU9N
        +zv/lb1YL7PdoHjR0d42pZtbH89QsJXxSnndfHRlck9U++t/b/Vym5g5tvKfdYldaPtg4weP
        BexSLQ2fvnNvvCNgxsbG/P/MtpqsCb/sam/lFAjtv/PSmzs4cPMrzYsFHNudD51dcPcY1wtu
        41+LBRt+n5rk4sNfZWZlJvHxs63qZma/f/vWqn3KTnj4pC391JvA5WIvb/kY5q5uLe7KX/oj
        +HCwvzJz2TOrhGsRM5c92GZ8UV7lzGbNRVPvCeqdCJggMklwRu/J5o32/fc/npiqxFKckWio
        xVxUnAgASbj2ueICAAA=
X-CMS-MailID: 20211007121055epcas2p3257cda61bd7f28f8ac9f3ba126b8fd41
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20211007121055epcas2p3257cda61bd7f28f8ac9f3ba126b8fd41
References: <20211007120855.56555-1-chanho61.park@samsung.com>
        <CGME20211007121055epcas2p3257cda61bd7f28f8ac9f3ba126b8fd41@epcas2p3.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

SADK(Samsung Automotive Development Kit) is the development kit to
evaluate Exynos Auto v9 SoC. It has 16GB LPDDR4 DRAM and two
256GB Samsung UFS. This patch enables only serial console and ufs0
device.

Signed-off-by: Chanho Park <chanho61.park@samsung.com>
---
 .../bindings/arm/samsung/samsung-boards.yaml  |  6 +++
 .../boot/dts/exynos/exynosautov9-sadk.dts     | 52 +++++++++++++++++++
 2 files changed, 58 insertions(+)
 create mode 100644 arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts

diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
index 0796f0c87727..2147e664d5bc 100644
--- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
@@ -199,6 +199,12 @@ properties:
               - samsung,exynos7-espresso        # Samsung Exynos7 Espresso
           - const: samsung,exynos7
 
+      - description: Exynos Auto v9 based boards
+        items:
+          - enum:
+              - samsung,samsung,exynosautov9-sadk   # Samsung Exynos Auto v9 SADK
+          - const: samsung,exynosautov9
+
 required:
   - compatible
 
diff --git a/arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts b/arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts
new file mode 100644
index 000000000000..e59ef39a368f
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts
@@ -0,0 +1,52 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Samsung ExynosAutov9 SADK board device tree source
+ */
+
+/dts-v1/;
+#include "exynosautov9.dtsi"
+
+/ {
+	model = "Samsung ExynosAutov9 SADK board";
+	compatible = "samsung,exynosautov9-sadk", "samsung,exynosautov9";
+
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	aliases {
+		serial0 = &serial_0;
+	};
+
+	chosen {
+		stdout-path = &serial_0;
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x0 0x80000000 0x0 0x77000000>,
+		      <0x8 0x80000000 0x1 0x7ba00000>,
+		      <0xa 0x00000000 0x2 0x00000000>;
+	};
+
+	ufs_0_fixed_vcc: fixedregulator@0 {
+		compatible = "regulator-fixed";
+		regulator-name = "ufs-vcc";
+		gpio = <&gpq0 1 GPIO_ACTIVE_HIGH>;
+		regulator-boot-on;
+		enable-active-high;
+	};
+};
+
+&serial_0 {
+	status = "okay";
+};
+
+&ufs_0_phy {
+	status = "okay";
+};
+
+&ufs_0 {
+	status = "okay";
+	vcc-supply = <&ufs_0_fixed_vcc>;
+	vcc-fixed-regulator;
+};
-- 
2.33.0

