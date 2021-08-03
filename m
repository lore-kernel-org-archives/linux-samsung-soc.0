Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36394C4338F
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  4 Aug 2021 02:32:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 19E3660F01
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  4 Aug 2021 02:32:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232116AbhHDCcP (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 3 Aug 2021 22:32:15 -0400
Received: from mailout2.samsung.com ([203.254.224.25]:43266 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229603AbhHDCcO (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 3 Aug 2021 22:32:14 -0400
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
        by mailout2.samsung.com (KnoxPortal) with ESMTP id 20210804023158epoutp025f967e9474ac3bca155fa094caeef5cb~X_a6pvDIU3118731187epoutp02J
        for <linux-samsung-soc@vger.kernel.org>; Wed,  4 Aug 2021 02:31:58 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20210804023158epoutp025f967e9474ac3bca155fa094caeef5cb~X_a6pvDIU3118731187epoutp02J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1628044318;
        bh=kbTgHv/xYI2WEh9TgbergRaN4gUO/PT6mzRKwnk7qRo=;
        h=From:To:Cc:Subject:Date:References:From;
        b=ci2DyU06F29LmVm1R84Jp344ouM6yC7K0Gtv/hslnXgAg9nqmarU2UsvGfJbiDdrI
         8eyDP0aMAzE/JfN1n0+akgA93ulvb8kyuaZBbWzAY0woLg7UBwev8tyOAhIhkMtcZZ
         ShFwet7HoxeBLscwXifNoYQBMGT8SKGYjqDF1eRI=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
        epcas5p3.samsung.com (KnoxPortal) with ESMTP id
        20210804023157epcas5p3cd7324a34681f7f27ffa7592a3e421d8~X_a5g04oc0080600806epcas5p3D;
        Wed,  4 Aug 2021 02:31:57 +0000 (GMT)
Received: from epsmges5p3new.samsung.com (unknown [182.195.38.180]) by
        epsnrtp3.localdomain (Postfix) with ESMTP id 4GfbNH4hR4z4x9Q8; Wed,  4 Aug
        2021 02:31:43 +0000 (GMT)
Received: from epcas5p1.samsung.com ( [182.195.41.39]) by
        epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
        67.96.41701.70CF9016; Wed,  4 Aug 2021 11:31:35 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
        20210803032734epcas5p2143008ddb212fe53fcd28b813c85c9d8~XriK76wJA0307203072epcas5p22;
        Tue,  3 Aug 2021 03:27:34 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20210803032734epsmtrp250253d00a0bcb95eb389ba59e2235cb0~XriK7Nrrq0903709037epsmtrp2E;
        Tue,  3 Aug 2021 03:27:34 +0000 (GMT)
X-AuditID: b6c32a4b-0c1ff7000001a2e5-62-6109fc075206
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        23.9B.08394.6A7B8016; Tue,  3 Aug 2021 12:27:34 +0900 (KST)
Received: from Jaguar.sa.corp.samsungelectronics.net (unknown
        [107.108.73.139]) by epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20210803032733epsmtip257f8695ca31a55a1935839128ee154b8~XriJ90RNo0958009580epsmtip2g;
        Tue,  3 Aug 2021 03:27:33 +0000 (GMT)
From:   Alim Akhtar <alim.akhtar@samsung.com>
To:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        robh+dt@kernel.org
Cc:     krzysztof.kozlowski@canonical.com,
        linux-samsung-soc@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>
Subject: [PATCH v11] dt-bindings: ufs: Add bindings for Samsung ufs host
Date:   Tue,  3 Aug 2021 08:55:39 +0530
Message-Id: <20210803032539.15676-1-alim.akhtar@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNKsWRmVeSWpSXmKPExsWy7bCmui77H85Eg4Vt1hYP5m1js9j49geT
        xabH11gtLu+aw2Yx4/w+JovWvUfYHdg8ZjX0snlsWtXJ5rF5Sb1H35ZVjB6fN8kFsEZl22Sk
        JqakFimk5iXnp2TmpdsqeQfHO8ebmhkY6hpaWpgrKeQl5qbaKrn4BOi6ZeYAHaCkUJaYUwoU
        CkgsLlbSt7Mpyi8tSVXIyC8usVVKLUjJKTAp0CtOzC0uzUvXy0stsTI0MDAyBSpMyM5Yslm9
        4IlExaXrU1gbGNuFuxg5OSQETCQWXmhh6WLk4hAS2M0o8enXUijnE6PEkhlvmCCcb4wS7X8u
        M8O09FzdxAqR2Mso8XfnPEYIp4VJ4sKD/6wgVWwC2hJ3p29hArFFBGIkHu6ZBxZnFiiUeNFy
        kx3EFhbwkLjT8Q4sziKgKtH1+jwbiM0rYCNxdNpiVoht8hKrNxxgBlkgIbCMXeLhlzNQCReJ
        vx0b2SBsYYlXx7ewQ9hSEp/f7QWKcwDZ2RI9u4whwjUSS+cdY4Gw7SUOXJnDAlLCLKApsX6X
        PkRYVmLqqXVMEGfySfT+fsIEEeeV2DEPxlaVaH53FWqMtMTE7m5WiE0eEj09LiBhIYFYiXsT
        +5gmMMrOQliwgJFxFaNkakFxbnpqsWmBcV5qOTyakvNzNzGCU5WW9w7GRw8+6B1iZOJgPMQo
        wcGsJMIbeoMjUYg3JbGyKrUoP76oNCe1+BCjKTDEJjJLiSbnA5NlXkm8oYmlgYmZmZmJpbGZ
        oZI4L3v81wQhgfTEktTs1NSC1CKYPiYOTqkGpg0nVb/Nu/+rVCiUz+3sXZG2bjnWttwl4lc/
        Pf9i2HOfd/oZ/mSViadvyvcejrnu4+d70fR4dGGbyO/V+g22v7e+ORe6NOv0I53UiiBu/75v
        zs9jLzZof32ysfTwv9bMNy/5om03vZXM/PRGcrJzxR0pB32RiphdLCcYtB6XJBu4rU/h9s87
        LDBX2+Z7+rJfHjoqElvzQpVaBDr+2hxuD1c33CJz/j/bTQah76b8CXfjV+8WrZiclGuicHDd
        W2X1rblslgvOL/nvf+XXA++W0kUncqSYl0eaGOYvZrz85LbJdsUYq2/TRK9c7nd+u/3hAr7j
        UraHt7HpiVgGHzqQ/y/bMvDvt07TT4fMczjalFiKMxINtZiLihMBharpX94DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrGJMWRmVeSWpSXmKPExsWy7bCSvO6y7RyJBrtaBC0ezNvGZrHx7Q8m
        i02Pr7FaXN41h81ixvl9TBate4+wO7B5zGroZfPYtKqTzWPzknqPvi2rGD0+b5ILYI3isklJ
        zcksSy3St0vgyliyWb3giUTFpetTWBsY24W7GDk5JARMJHqubmLtYuTiEBLYzSixcV8nO0RC
        WuL6xglQtrDEyn/P2SGKmpgkfl3uYANJsAloS9ydvoWpi5GDQ0QgTqJ1fTWIySxQLHH6FxNI
        hbCAh8SdjnesIDaLgKpE1+vzYJ28AjYSR6ctZoUYLy+xesMB5gmMPAsYGVYxSqYWFOem5xYb
        FhjmpZbrFSfmFpfmpesl5+duYgQHjZbmDsbtqz7oHWJk4mA8xCjBwawkwqvfyp4oxJuSWFmV
        WpQfX1Sak1p8iFGag0VJnPdC18l4IYH0xJLU7NTUgtQimCwTB6dUA1Myt+7i8zNXJ614sMDB
        1/35GsYrIQWzko4uv3Xco/7YYu6HHnUZchveVxnOPnL699+2hzKfxfbt7uXcuURiVuoFl0tF
        nXkLApI2da/5HuB7WWNFw/9WJ4np65Q0+R1nXmJnf3G06/y1tzpn+3U4D02/LHtracH8FJ79
        l1/eip7daDGzL3ejstWsTdU7byw4auEyUStCbf29dWqVsVfnnPHKvD5bvu6Me7nT60L9mXs+
        x/b6yUW1/bvF8iJTT2b1qWceSxM5eXsb/vxcOPOt54SgSfc22PzoTT/lIL/wZvU3FsEEUauZ
        j1ZsFOi4vVx445eib2sv1h1e4iCyODL9eOvJXcpKXzt7rQOdPy9afDKrTomlOCPRUIu5qDgR
        ADeZq/6JAgAA
X-CMS-MailID: 20210803032734epcas5p2143008ddb212fe53fcd28b813c85c9d8
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20210803032734epcas5p2143008ddb212fe53fcd28b813c85c9d8
References: <CGME20210803032734epcas5p2143008ddb212fe53fcd28b813c85c9d8@epcas5p2.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

This patch adds DT bindings for Samsung ufs hci

Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
---
Changes since v10
* Rebased on v5.14-rc2 
* removed Rob Herring earlier Reviewed-by tag

This patch was part of exynos ufs driver series, somehow
this got missed to applied on the tree, sending again as a new
patch v11, removing Rob's earlier Reviewed-by tag.

 .../bindings/ufs/samsung,exynos-ufs.yaml      | 89 +++++++++++++++++++
 1 file changed, 89 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml

diff --git a/Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml b/Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml
new file mode 100644
index 000000000000..38193975c9f1
--- /dev/null
+++ b/Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml
@@ -0,0 +1,89 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/ufs/samsung,exynos-ufs.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung SoC series UFS host controller Device Tree Bindings
+
+maintainers:
+  - Alim Akhtar <alim.akhtar@samsung.com>
+
+description: |
+  Each Samsung UFS host controller instance should have its own node.
+  This binding define Samsung specific binding other then what is used
+  in the common ufshcd bindings
+  [1] Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
+
+properties:
+
+  compatible:
+    enum:
+      - samsung,exynos7-ufs
+
+  reg:
+    items:
+     - description: HCI register
+     - description: vendor specific register
+     - description: unipro register
+     - description: UFS protector register
+
+  reg-names:
+    items:
+      - const: hci
+      - const: vs_hci
+      - const: unipro
+      - const: ufsp
+
+  clocks:
+    items:
+      - description: ufs link core clock
+      - description: unipro main clock
+
+  clock-names:
+    items:
+      - const: core_clk
+      - const: sclk_unipro_main
+
+  interrupts:
+    maxItems: 1
+
+  phys:
+    maxItems: 1
+
+  phy-names:
+    const: ufs-phy
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - phys
+  - phy-names
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/exynos7-clk.h>
+
+    ufs: ufs@15570000 {
+       compatible = "samsung,exynos7-ufs";
+       reg = <0x15570000 0x100>,
+             <0x15570100 0x100>,
+             <0x15571000 0x200>,
+             <0x15572000 0x300>;
+       reg-names = "hci", "vs_hci", "unipro", "ufsp";
+       interrupts = <GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH>;
+       clocks = <&clock_fsys1 ACLK_UFS20_LINK>,
+                <&clock_fsys1 SCLK_UFSUNIPRO20_USER>;
+       clock-names = "core_clk", "sclk_unipro_main";
+       pinctrl-names = "default";
+       pinctrl-0 = <&ufs_rst_n &ufs_refclk_out>;
+       phys = <&ufs_phy>;
+       phy-names = "ufs-phy";
+    };
+...

base-commit: 2734d6c1b1a089fb593ef6a23d4b70903526fe0c
-- 
2.17.1

