Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA8FEC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 15 Sep 2021 11:19:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 843B760FC0
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 15 Sep 2021 11:19:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232540AbhIOLUj (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 15 Sep 2021 07:20:39 -0400
Received: from mailout4.samsung.com ([203.254.224.34]:31647 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232733AbhIOLUi (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 15 Sep 2021 07:20:38 -0400
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20210915111914epoutp04e26a19e3723a0dbfdb06f2d3ed7ec653~k_tQuTUP12233922339epoutp04k
        for <linux-samsung-soc@vger.kernel.org>; Wed, 15 Sep 2021 11:19:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20210915111914epoutp04e26a19e3723a0dbfdb06f2d3ed7ec653~k_tQuTUP12233922339epoutp04k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1631704754;
        bh=WRI58h8fgGgCoO94+KVd1E7f0/lNdZ273QzsFa9FrwM=;
        h=From:To:Cc:Subject:Date:References:From;
        b=l7WZT8w/rEUag0bGaQVA7aPwNuy3nDd3QweMDreRQvmL2XVBDnRaYGr50mdUWfCf8
         f/dAffLxhjQWukL/JdlhT6iYJiQFMnrxqSauhZo1BoFk8JkoObOPQ0f8f4CGqqqCzx
         7sUQ5XClkD4KkrwRU3IfNfi3KRs5bzJVZHwdG0I8=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTP id
        20210915111913epcas2p2c9a16c636594023be111f73359031cc6~k_tPs0Lc22487124871epcas2p22;
        Wed, 15 Sep 2021 11:19:13 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.40.186]) by
        epsnrtp3.localdomain (Postfix) with ESMTP id 4H8d5W03scz4x9Pp; Wed, 15 Sep
        2021 11:19:11 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
        epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        C7.EF.09816.EA6D1416; Wed, 15 Sep 2021 20:19:10 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
        20210915111909epcas2p345ed0a47b12d82d67ab28da1d9fd2eb8~k_tMu2pkk1723317233epcas2p3r;
        Wed, 15 Sep 2021 11:19:09 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20210915111909epsmtrp1ff75d8e5b33b901f680b2572f9309336~k_tMrb2Iy0733807338epsmtrp1W;
        Wed, 15 Sep 2021 11:19:09 +0000 (GMT)
X-AuditID: b6c32a46-63bff70000002658-4b-6141d6ae12ec
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        FF.59.08750.DA6D1416; Wed, 15 Sep 2021 20:19:09 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20210915111909epsmtip26d3b9eea4154e9c1f6dcb7d283391cf3~k_tMfDMUR2974329743epsmtip2U;
        Wed, 15 Sep 2021 11:19:09 +0000 (GMT)
From:   Chanho Park <chanho61.park@samsung.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Mark Brown <broonie@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        "Martin K . Petersen" <martin.petersen@oracle.com>,
        "James E . J . Bottomley" <jejb@linux.ibm.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH v12] dt-bindings: ufs: Add bindings for Samsung ufs host
Date:   Wed, 15 Sep 2021 20:18:44 +0900
Message-Id: <20210915111844.42752-1-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupjk+LIzCtJLcpLzFFi42LZdljTVHfdNcdEgx3vzSwezNvGZjH14RM2
        i8v7tS3mHznHarHoxjYmi41vfzBZzDi/j8li+fF/TBate4+wO3B6zGroZfPYtKqTzWPCogOM
        Hh+f3mLx6NuyitHj8ya5ALaoHJuM1MSU1CKF1Lzk/JTMvHRbJe/geOd4UzMDQ11DSwtzJYW8
        xNxUWyUXnwBdt8wcoKOUFMoSc0qBQgGJxcVK+nY2RfmlJakKGfnFJbZKqQUpOQWGhgV6xYm5
        xaV56XrJ+blWhgYGRqZAlQk5GffWXGYqeCBV8fD3S7YGxgciXYycHBICJhKPtj1m7GLk4hAS
        2MEo8bD9NJTziVFi47eZzBDOZ0aJptfr2LoYOcBanp7LgIjvYpSYOvMoVNFHRokjXTvZQOay
        CehKbHn+ihHEFhFQkdjw/BZYEbPATSaJWwfmgSWEBTwk9n55zgpiswioSnTO6GIBsXkF7CTm
        rVnMDnGgvMSRX53MEHFBiZMzn4DVMAPFm7fOBhsqIfCSXeLLzp3sEOe5SFw9ZQLRKyzx6vgW
        qDlSEi/729gh6rsZJVof/YdKrGaU6Gz0gbDtJX5N38IKModZQFNi/S59iJHKEkduQa3lk+g4
        /BdqE69ER5sQRKO6xIHt01kgbFmJ7jmfWSFsoA9b28EWCQnESrx68495AqP8LCTPzELyzCyE
        vQsYmVcxiqUWFOempxYbFRghR+omRnDC1HLbwTjl7Qe9Q4xMHIyHGCU4mJVEeC/UOCYK8aYk
        VlalFuXHF5XmpBYfYjQFBu9EZinR5Hxgys4riTc0NTIzM7A0tTA1M7JQEuc9/9oyUUggPbEk
        NTs1tSC1CKaPiYNTqoGpf8N3pzx+4b4+c+v+G32VHUcnfF/vUZqoqXX0SvF+tw3vU25/s7A7
        7Mw5c09fgRsr20lfpX4fjefb62a5/fn6fPM/JqXV7mzb1t/aFdoqk1mdEzmP4c/m52b/1XZq
        fU68F1zqaFLCcOvT2jdlPzNfT6/QDTOonNe6e0XTrF8WjyakPS+72Loz3dLpIHuNp+3HSXP1
        xV6bsjrMfi78isvcv3qy34PuqT6WB2UWGP0ReR1sv5v359v7N9Y1WWiLPX8W+viD7bs1DwyC
        RWs+9x5vOvv7c2KLYNOEqDOia2OXvmE+waEs+zHnf4HV7PDDtdFfH717ysv3OGLtj4lcr9JW
        q3Hs+pEwx+ffEdfMTuNuJZbijERDLeai4kQAj1N7TiEEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrDLMWRmVeSWpSXmKPExsWy7bCSvO7aa46JBkdf6ls8mLeNzWLqwyds
        Fpf3a1vMP3KO1WLRjW1MFhvf/mCymHF+H5PF8uP/mCxa9x5hd+D0mNXQy+axaVUnm8eERQcY
        PT4+vcXi0bdlFaPH501yAWxRXDYpqTmZZalF+nYJXBn31lxmKnggVfHw90u2BsYHIl2MHBwS
        AiYST89ldDFycggJ7GCUmN/GDWJLCMhKPHu3gx3CFpa433KEtYuRC6jmPaNEy/QtzCAJNgFd
        iS3PXzGC2CICKhIbnt9iBiliFrjLJHF+/x2wbmEBD4m9X56zgtgsAqoSnTO6WEBsXgE7iXlr
        FkNtkJc48quTGSIuKHFy5hOwGmagePPW2cwTGPlmIUnNQpJawMi0ilEytaA4Nz232LDAKC+1
        XK84Mbe4NC9dLzk/dxMjOIC1tHYw7ln1Qe8QIxMH4yFGCQ5mJRHeCzWOiUK8KYmVValF+fFF
        pTmpxYcYpTlYlMR5L3SdjBcSSE8sSc1OTS1ILYLJMnFwSjUwTTO90Ms9oUo9cLK/tR2fyikd
        fcd/1514Nh9MdXNIij5vX+C4qF3+gcyGI4VxGivV3Vi1et3rewsqHh3wDN8hwiu/crX2z5YI
        3ltr7jIUVHzyvirzd1un2IkJt1e8mfzU+mLj4Zl2G53f744025ukrXbgXYqZUc550Xfexkv+
        NIfy5HqZch53nxO4SZ5xDdPJEO9TjhvFtBJKs8N03CxXrT/xxuHfzzaJjfqrmtr0jpy8K1R/
        9UPGJQWO/CiVN3/E39jX8a7oWnzqwd3LGa91exMWPrvEI8UlZXkh8sqUS1uadGo1eKsWGlvc
        +9XVXOnd/ejpf/l5h6/r/W15ZVJ6bwXXz9wLLQFr9OwWLpivxFKckWioxVxUnAgAt29S0s8C
        AAA=
X-CMS-MailID: 20210915111909epcas2p345ed0a47b12d82d67ab28da1d9fd2eb8
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20210915111909epcas2p345ed0a47b12d82d67ab28da1d9fd2eb8
References: <CGME20210915111909epcas2p345ed0a47b12d82d67ab28da1d9fd2eb8@epcas2p3.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

From: Alim Akhtar <alim.akhtar@samsung.com>

This patch adds DT bindings for Samsung ufs hci

Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
Signed-off-by: Chanho Park <chanho61.park@samsung.com>
---
Changes since v11
* remove below warning by dt_binding_check
./Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml:26:6:
[warning] wrong indentation: expected 6 but found 5 (indentation)

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
index 000000000000..b9ca8ef4f2be
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
+      - description: HCI register
+      - description: vendor specific register
+      - description: unipro register
+      - description: UFS protector register
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
-- 
2.33.0

