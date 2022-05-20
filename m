Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AFB5C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 20 May 2022 11:52:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348744AbiETLw2 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 20 May 2022 07:52:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348762AbiETLwY (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 20 May 2022 07:52:24 -0400
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23351B227D
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 May 2022 04:52:22 -0700 (PDT)
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
        by mailout1.samsung.com (KnoxPortal) with ESMTP id 20220520115219epoutp01e7cb01969fb2a10872b0c320675408a9~wzfqjz9VC2427824278epoutp01Z
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 May 2022 11:52:19 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20220520115219epoutp01e7cb01969fb2a10872b0c320675408a9~wzfqjz9VC2427824278epoutp01Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1653047539;
        bh=bqfGvXvUOYMiZ2cY3uE2mGNxf9HgMylcN2CA80+Q67M=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=L/t/4cPvh9N+2THaw+tVQnqI2YsVFKs1yLy5S2ExK4KcfzjSPKiinO1rSI8j4IRIs
         oTnPCXnRRw0Rw3PTgjlXCMhaq+pdIgJ4j8uTmLA7LuVIevOCAb59MBjLVg6D5jYiKV
         c3S3MSXTn2/GKI7+NaswuNnO9dzF8o8aVTFNP/8c=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTP id
        20220520115219epcas2p4f837e2c1930907818bfc820140112f38~wzfp-Plwh2605126051epcas2p43;
        Fri, 20 May 2022 11:52:19 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.101]) by
        epsnrtp4.localdomain (Postfix) with ESMTP id 4L4Q7j1zZnz4x9Pv; Fri, 20 May
        2022 11:52:17 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
        epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        4F.0F.09764.1F087826; Fri, 20 May 2022 20:52:17 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
        20220520115216epcas2p20de68c07071435ae33b50c7b664a20eb~wzfoBuVSZ2546425464epcas2p2q;
        Fri, 20 May 2022 11:52:16 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20220520115216epsmtrp1e53aad5fa19c19d8fc5e9c9578fbd396~wzfoBC1Jy1943319433epsmtrp1k;
        Fri, 20 May 2022 11:52:16 +0000 (GMT)
X-AuditID: b6c32a46-f8bff70000002624-1c-628780f1121f
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        0E.19.08924.0F087826; Fri, 20 May 2022 20:52:16 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20220520115216epsmtip247fcbe3a375bf06625dcd4678d8d2dc7~wzfn2RclM1251212512epsmtip2z;
        Fri, 20 May 2022 11:52:16 +0000 (GMT)
From:   Chanho Park <chanho61.park@samsung.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH v2 1/2] dt-bindings: soc: add samsung,boot-mode definitions
Date:   Fri, 20 May 2022 20:52:49 +0900
Message-Id: <20220520115250.57785-2-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220520115250.57785-1-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuplk+LIzCtJLcpLzFFi42LZdljTVPdjQ3uSwav9HBYP5m1js7i8X9vi
        +pfnrBbzj5xjteh78ZDZYsb5fUwWrXuPsFs879vH5MDhsWlVJ5vHnWt72Dz6tqxi9Pi8SS6A
        JSrbJiM1MSW1SCE1Lzk/JTMv3VbJOzjeOd7UzMBQ19DSwlxJIS8xN9VWycUnQNctMwfoCiWF
        ssScUqBQQGJxsZK+nU1RfmlJqkJGfnGJrVJqQUpOgXmBXnFibnFpXrpeXmqJlaGBgZEpUGFC
        dsaRn8+ZC46zV7zcvIKxgfEQWxcjJ4eEgInEmvtXWLsYuTiEBHYwShyY8xzK+cQoMbehjQ3C
        +cwosefFd1aYlvfvvrBDJHYxSty8Po0RwvnIKLHp5CZ2kCo2AV2JLc9fMYLYIgLxEuffNLKA
        FDELvGSUOHHpAQtIQljAW+LasutgNouAqsSeCyfBmnkF7CT62i5CrZOX2DC/lxnE5hSwl9g9
        /SojRI2gxMmZT8B6mYFqmrfOZgZZICHwkl1i+48nTBDNLhIr1t5nhrCFJV4d38IOYUtJvOxv
        g7KLJZbO+sQE0dzAKHF52y9o2BhLzHrWDrSNA2iDpsT6XfogpoSAssSRW1B7+SQ6Dv9lhwjz
        SnS0CUE0qksc2D6dBcKWleie8xnqFQ+JFR1LmSCBNYlR4uDzq4wTGBVmIXlnFpJ3ZiEsXsDI
        vIpRLLWgODc9tdiowAgex8n5uZsYwelSy20H45S3H/QOMTJxMB5ilOBgVhLhZcxtSRLiTUms
        rEotyo8vKs1JLT7EaAoM7InMUqLJ+cCEnVcSb2hiaWBiZmZobmRqYK4kzuuVsiFRSCA9sSQ1
        OzW1ILUIpo+Jg1OqgenMhUKj/sIoFaXuoqW/8uJC5p95WPgk0bvebm7Hps1Nmmd2xV59vP3C
        pqVL2XqV7rAWcx69v8bg3qHKD4GhZsdkrl6OO7Hp04c7/A93b+ZKUay6+PHdv/u2E/Viru+Y
        dubCAUuDi84Z4m/9zmbfF7OKUj2nPkdvsYvSbe/Lb7Z1n5FddWWi3FbOs1lBZXvztqtp1SnF
        FjGE53Ly3N9iPfVT3zKh1QprFdx3MMjrV3eevrMh54jyqUPX2z92CNzVKTnjpl79h6MwIO12
        IcP+eSLhMXObopqtpCJ/zbVPmN8zS2hfC+ObO+GKokVdv2eef9ISWSJrnHX3xKKz2de1nf5W
        vzY4fUxCMffBLE2uJVlKLMUZiYZazEXFiQB0/KhwIAQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGLMWRmVeSWpSXmKPExsWy7bCSvO6HhvYkg0lXjS0ezNvGZnF5v7bF
        9S/PWS3mHznHatH34iGzxYzz+5gsWvceYbd43rePyYHDY9OqTjaPO9f2sHn0bVnF6PF5k1wA
        SxSXTUpqTmZZapG+XQJXxpGfz5kLjrNXvNy8grGB8RBbFyMnh4SAicT7d1/YQWwhgR2MEsvP
        +ULEZSWevdvBDmELS9xvOcLaxcgFVPOeUaJh3TpWkASbgK7EluevGEFsEYF4iaXnfrCAFDEL
        vGWU+PdgJlhCWMBb4tqy6ywgNouAqsSeCyfBpvIK2En0tV1khdggL7Fhfi8ziM0pYC+xe/pV
        RoiL7CQ2T/gGVS8ocXLmE7A5zED1zVtnM09gFJiFJDULSWoBI9MqRsnUguLc9NxiwwKjvNRy
        veLE3OLSvHS95PzcTYzgoNbS2sG4Z9UHvUOMTByMhxglOJiVRHgZc1uShHhTEiurUovy44tK
        c1KLDzFKc7AoifNe6DoZLySQnliSmp2aWpBaBJNl4uCUamBieXLK4e1cj/iHPzqnnEoXazRx
        5W/gXXhy8+SFLwq8pKwDfd9c/Wcj9L6mopFhsnijjcnL0+5cmvaif7mNP0688zpTjj8j/cSb
        Nys/LH+60fTFw8p9uoeXb7obHJlec+67QVrlP0XVX9WuFw1Ugo3vGmR3iqlPrD67fq47ry9f
        c5/W4Vi3PlultzbhnJ31e5a8OfN8+5TMeS8X6nyZHlh5i9/24LPLjdx1cUd/yys/sLtxlttX
        rHzp7m8dMgtOz5ZiVZq3TfPDusfqqc/aD17xCJnCNzE0fqmWypNP646sam9Z+JXr9rdvQc3v
        QqTqgiSLlpgw2DCdYOT6Nr97FkOrt6nozhI/Px/h60dEpuoosRRnJBpqMRcVJwIAvabpq9kC
        AAA=
X-CMS-MailID: 20220520115216epcas2p20de68c07071435ae33b50c7b664a20eb
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220520115216epcas2p20de68c07071435ae33b50c7b664a20eb
References: <20220520115250.57785-1-chanho61.park@samsung.com>
        <CGME20220520115216epcas2p20de68c07071435ae33b50c7b664a20eb@epcas2p2.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Adds samsung,boot-mode.h header file which contains boot mode
definitions for bootloader. As for now, there are only boot mode
definitions for Exynos Auto v9 SoC.

Signed-off-by: Chanho Park <chanho61.park@samsung.com>
---
 include/dt-bindings/soc/samsung,boot-mode.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 include/dt-bindings/soc/samsung,boot-mode.h

diff --git a/include/dt-bindings/soc/samsung,boot-mode.h b/include/dt-bindings/soc/samsung,boot-mode.h
new file mode 100644
index 000000000000..f1d03d96f45c
--- /dev/null
+++ b/include/dt-bindings/soc/samsung,boot-mode.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __SAMSUNG_BOOT_MODE_H
+#define __SAMSUNG_BOOT_MODE_H
+
+/* Boot mode definitions for Exynos Auto v9 SoC */
+
+#define EXYNOSAUTOV9_BOOT_FASTBOOT	(0xfa)
+#define EXYNOSAUTOV9_BOOT_BOOTLOADER	(0xfc)
+#define EXYNOSAUTOV9_BOOT_RECOVERY	(0xff)
+
+#endif
-- 
2.36.1

