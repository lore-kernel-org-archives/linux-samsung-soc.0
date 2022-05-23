Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE5D1C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 23 May 2022 12:12:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235370AbiEWMMS (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 23 May 2022 08:12:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235294AbiEWMMR (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 23 May 2022 08:12:17 -0400
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C53529814
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 May 2022 05:12:16 -0700 (PDT)
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
        by mailout1.samsung.com (KnoxPortal) with ESMTP id 20220523121214epoutp016fa266bf207100a335574d307d2edc4b~xus6Htaff1299712997epoutp01Y
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 May 2022 12:12:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20220523121214epoutp016fa266bf207100a335574d307d2edc4b~xus6Htaff1299712997epoutp01Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1653307934;
        bh=hvfdJukJfntdmDGKNKuelFMq8CXLmj/cFwh5MeY089o=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=eIT0gbxLziksjCzDcLZiqA+Yvq10cjPaD+o9bcZ9NG2y3zwQd8Etk0/rLBx/luNe6
         cJ3qzlDtF2wgS7wMccySJgGT0425rvpjlMa00MUhUh5w+nO59dkiYFj2DZBkZmE8qD
         k/zpt4dKK0zYBu/vO1J4JJNSuDqX5WwqYwAMotgA=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTP id
        20220523121213epcas2p15be5f5d09064d0a48b6f8ba852051c22~xus5EQFLw2306923069epcas2p1X;
        Mon, 23 May 2022 12:12:13 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.97]) by
        epsnrtp4.localdomain (Postfix) with ESMTP id 4L6GRH48HMz4x9Q7; Mon, 23 May
        2022 12:12:11 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
        epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        68.84.09764.B1A7B826; Mon, 23 May 2022 21:12:11 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
        20220523121210epcas2p43ff75b7972f3d2ead844b12aec95f936~xus2bMHxT3015530155epcas2p4N;
        Mon, 23 May 2022 12:12:10 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20220523121210epsmtrp191802100c88422de99d105828e47a76b~xus2aLWeq1561315613epsmtrp1R;
        Mon, 23 May 2022 12:12:10 +0000 (GMT)
X-AuditID: b6c32a46-f75ff70000002624-96-628b7a1b4d0a
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        71.6A.08924.A1A7B826; Mon, 23 May 2022 21:12:10 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20220523121210epsmtip259cfb9308d240b56a64933a7fa365a8d~xus2Kfekv1577015770epsmtip2N;
        Mon, 23 May 2022 12:12:10 +0000 (GMT)
From:   Chanho Park <chanho61.park@samsung.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH v3 1/2] dt-bindings: soc: add samsung,boot-mode definitions
Date:   Mon, 23 May 2022 21:12:43 +0900
Message-Id: <20220523121244.67341-2-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220523121244.67341-1-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupkk+LIzCtJLcpLzFFi42LZdljTTFe6qjvJoP2NgsWDedvYLC7v17a4
        /uU5q8X8I+dYLfpePGS2mHF+H5NF694j7BbP+/YxOXB4bFrVyeZx59oeNo++LasYPT5vkgtg
        icq2yUhNTEktUkjNS85PycxLt1XyDo53jjc1MzDUNbS0MFdSyEvMTbVVcvEJ0HXLzAG6Qkmh
        LDGnFCgUkFhcrKRvZ1OUX1qSqpCRX1xiq5RakJJTYF6gV5yYW1yal66Xl1piZWhgYGQKVJiQ
        nXGg5zlTwSnOiiuHLBoY53J0MXJwSAiYSNydLd7FyMkhJLCDUWLFTu0uRi4g+xOjxMv+f0wQ
        zmdGid41ncwgVSAN27acgkrsYpTYtvcDO4TzkVHi859+NpAqNgFdiS3PXzGC2CIC8RLn3zSy
        gBQxC7xklDhx6QELSEJYwFti2r8HrCA2i4CqRO+HtWANvAJ2Eju3TIdaJy+xYX4vmM0pYC+x
        ZOsKFogaQYmTM5+A2cxANc1bZ0PVv2SXmPorG8J2kZj5uo8dwhaWeHV8C5QtBfRbG5RdLLF0
        1iewdyQEGhglLm/7xQaRMJaY9aydERRIzAKaEut36UPCS1niyC2otXwSHYf/skOEeSU62oQg
        GtUlDmyfzgJhy0p0z/nMCmF7SJz/MIUFElaTGCUW/1nPOoFRYRaSb2Yh+WYWwuIFjMyrGMVS
        C4pz01OLjQqM4PGbnJ+7iRGcJrXcdjBOeftB7xAjEwfjIUYJDmYlEd7tiR1JQrwpiZVVqUX5
        8UWlOanFhxhNgWE9kVlKNDkfmKjzSuINTSwNTMzMDM2NTA3MlcR5vVI2JAoJpCeWpGanphak
        FsH0MXFwSjUwGU70WOmqsrnnVXLprzuVdQ5vfbOmr1kU3b7fu7YlkF3tx+ILq5ZP6Q8zkTE2
        ifi8TOFJp8KdT8IPzp12OHRJ7k298jvGknweloNbROz2c7FPO8Nrq7V+WcP9LwytDxIs8rbe
        Z10bmfBrWtoPqWliIRmxMbLO1v+rJC0sFu50v33KlGvG5LtJvmejjnid3bd+bf4NPm+7D6XV
        uxuXxKnlnhPas1feuHthr0LAn0rf3bWvVwd7lb+s8q7P6uUKD/OsOavmkzKxarHR5HcHt0xa
        6PWpa++Lby8Ffrx/mjl/6bZmgZcrlrLsLwl9yuAx7YCv9DebGalsfsstIqdePXTv+rUpn9Vs
        +VgcjvR63shcq8RSnJFoqMVcVJwIADii1e0cBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKLMWRmVeSWpSXmKPExsWy7bCSvK5UVXeSwdM3QhYP5m1js7i8X9vi
        +pfnrBbzj5xjteh78ZDZYsb5fUwWrXuPsFs879vH5MDhsWlVJ5vHnWt72Dz6tqxi9Pi8SS6A
        JYrLJiU1J7MstUjfLoEr40DPc6aCU5wVVw5ZNDDO5ehi5OSQEDCR2LblFFMXIxeHkMAORolX
        L3ewQCRkJZ6928EOYQtL3G85wgpR9J5RYsmsTjaQBJuArsSW568YQWwRgXiJped+sIAUMQu8
        ZZT492AmWEJYwFti2r8HrCA2i4CqRO+HtWBxXgE7iZ1bpjNDbJCX2DC/F8zmFLCXWLJ1BdAg
        DqBtdhIbe3IhygUlTs58AnYcM1B589bZzBMYBWYhSc1CklrAyLSKUTK1oDg3PbfYsMAoL7Vc
        rzgxt7g0L10vOT93EyM4pLW0djDuWfVB7xAjEwfjIUYJDmYlEd7tiR1JQrwpiZVVqUX58UWl
        OanFhxilOViUxHkvdJ2MFxJITyxJzU5NLUgtgskycXBKNTBpPgzweOrwk806/qNChZ94u4jD
        vP7FZXd9N8/1dnv8uuX+91LrDz3dt8unst8XeaniKKKiuHW22sNw4SA1za4uM0mZi9qBXBNM
        wufv2f6HKeKR7E7JLwppq+5v/hpjkjzhaPsXC61cj4oLrh/4rJ77iTf/f/Qy2FuvQGPP9/TJ
        O+8ZlMx6Pfv9HinRLScX1Ff7Fz9T23V13dEzPZseXqnv9/jZqyHrbnjd7wGDy3mDl3c3b9uw
        QmuFue7+K/eEFzBcWMkw99ZWv99rV/Xd6N8a43v4v5KoaLJ54sp/uXfZH3cGM85fpX7btKN9
        Vnkpy5/lnyb8sN2VqBzLOnWW8me2wltr5AKevNoZ7bV9xx5jJZbijERDLeai4kQAV0ri29gC
        AAA=
X-CMS-MailID: 20220523121210epcas2p43ff75b7972f3d2ead844b12aec95f936
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220523121210epcas2p43ff75b7972f3d2ead844b12aec95f936
References: <20220523121244.67341-1-chanho61.park@samsung.com>
        <CGME20220523121210epcas2p43ff75b7972f3d2ead844b12aec95f936@epcas2p4.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Adds samsung,boot-mode.h header file which contains boot mode
definitions for bootloader. As for now, there are only boot mode
definitions for Exynos Auto v9 SoC.

Signed-off-by: Chanho Park <chanho61.park@samsung.com>
---
 include/dt-bindings/soc/samsung,boot-mode.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 include/dt-bindings/soc/samsung,boot-mode.h

diff --git a/include/dt-bindings/soc/samsung,boot-mode.h b/include/dt-bindings/soc/samsung,boot-mode.h
new file mode 100644
index 000000000000..47ef1cdd3916
--- /dev/null
+++ b/include/dt-bindings/soc/samsung,boot-mode.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2022 Samsung Electronics Co., Ltd.
+ * Author: Chanho Park <chanho61.park@samsung.com>
+ *
+ * Device Tree bindings for Samsung Boot Mode.
+ */
+
+#ifndef __DT_BINDINGS_SAMSUNG_BOOT_MODE_H
+#define __DT_BINDINGS_SAMSUNG_BOOT_MODE_H
+
+/* Boot mode definitions for Exynos Auto v9 SoC */
+
+#define EXYNOSAUTOV9_BOOT_FASTBOOT	0xfa
+#define EXYNOSAUTOV9_BOOT_BOOTLOADER	0xfc
+#define EXYNOSAUTOV9_BOOT_RECOVERY	0xff
+
+#endif /* __DT_BINDINGS_SAMSUNG_BOOT_MODE_H */
-- 
2.36.1

