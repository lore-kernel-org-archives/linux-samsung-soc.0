Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67DBEC43219
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 10 Oct 2021 03:25:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 423EE60F6D
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 10 Oct 2021 03:25:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229907AbhJJD1F (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 9 Oct 2021 23:27:05 -0400
Received: from mailout3.samsung.com ([203.254.224.33]:48814 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229916AbhJJD1E (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 9 Oct 2021 23:27:04 -0400
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20211010032505epoutp0361556373c28ba1cf8430dbfd2ab7f2c9~sjXaJ88zO1128411284epoutp03D
        for <linux-samsung-soc@vger.kernel.org>; Sun, 10 Oct 2021 03:25:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20211010032505epoutp0361556373c28ba1cf8430dbfd2ab7f2c9~sjXaJ88zO1128411284epoutp03D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1633836305;
        bh=dcXdu/Q/u5p0zvlBqebuy9/TrC6GPzk7KrCWktHgmVo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=LZlRtZTaf9VrvizkeE/R/MkJ7Mp1u8Dqqp0UyMhjPy2hbU5g9LchzRYaoj2kpYO5f
         fp7gcjSdvAn6+fmJgmtKdN/Q3UAD98HugXokcax8KRYorBdhV4ggkkmmL+HJdq43T8
         Mij8gWVrCr8YzIe/uZe59oUmTjpDr5yHzxTfhy5w=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTP id
        20211010032503epcas2p330612725799803edb4e00a06d3ab0556~sjXZIO-wR0675306753epcas2p3R;
        Sun, 10 Oct 2021 03:25:03 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.36.98]) by
        epsnrtp2.localdomain (Postfix) with ESMTP id 4HRnNn31M3z4x9Pv; Sun, 10 Oct
        2021 03:24:57 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
        epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
        37.D8.09749.90D52616; Sun, 10 Oct 2021 12:24:57 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
        20211010032456epcas2p2b56e49dcc5973224b26725cb8b7589b3~sjXSVgB_A2883828838epcas2p2f;
        Sun, 10 Oct 2021 03:24:56 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20211010032456epsmtrp1e04cb32b0896aafb3d3035b05f1bc9e3~sjXSUwy8o3229632296epsmtrp1R;
        Sun, 10 Oct 2021 03:24:56 +0000 (GMT)
X-AuditID: b6c32a47-d29ff70000002615-6b-61625d096c48
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        B6.85.08750.80D52616; Sun, 10 Oct 2021 12:24:56 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20211010032456epsmtip2c297855b8290045ab91a5a9e68326795~sjXSH5WgA1204912049epsmtip2y;
        Sun, 10 Oct 2021 03:24:56 +0000 (GMT)
From:   Chanho Park <chanho61.park@samsung.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chanho Park <chanho61.park@samsung.com>,
        Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v3 1/3] dt-bindings: mfd: add samsung,exynosautov9-sysreg
 compatible
Date:   Sun, 10 Oct 2021 12:22:44 +0900
Message-Id: <20211010032246.146939-2-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211010032246.146939-1-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprNJsWRmVeSWpSXmKPExsWy7bCmqS5nbFKiwe7N4haX92tbzD9yjtVi
        49sfTBb3vx5ltJjyZzmTxYzz+5gsWvceYbc4/Kad1WLVrj+MDpwesxp62Tx2zrrL7rFpVSeb
        x51re9g8+rasYvT4vEkugC0q2yYjNTEltUghNS85PyUzL91WyTs43jne1MzAUNfQ0sJcSSEv
        MTfVVsnFJ0DXLTMH6CglhbLEnFKgUEBicbGSvp1NUX5pSapCRn5xia1SakFKToF5gV5xYm5x
        aV66Xl5qiZWhgYGRKVBhQnbG2gubmQumslVcOnGPsYHxK0sXIyeHhICJxLNVe5m6GLk4hAR2
        MErsnr2dHcL5xCgx+1UbK0iVkMBnRonm19UwHduaT7FBFO1ilPg//RyU85FR4vHr92Bz2QR0
        JbY8f8UIkhAR6GSUWPltG9gSZoEnjBJdN68wg1QJC4RJvGlexgRiswioSix5/hwszitgL7H3
        8BU2iH3yEkd+dYLFOQUcJCZ03YOqEZQ4OfMJ2DZmoJrmrbOZQRZICDRySGy8+IAdotlF4s6W
        h1C2sMSr41ugbCmJl/1t7BAN3YwSrY/+QyVWM0p0NvpA2PYSv6ZvAYYAB9AGTYn1u/RBTAkB
        ZYkjt6D28kl0HP7LDhHmlehoE4JoVJc4sH06NIBlJbrnfGaFsD0k9q2ZAg3SyYwS//7WTmBU
        mIXkm1lIvpmFsHcBI/MqRrHUguLc9NRiowJjeBQn5+duYgSnUi33HYwz3n7QO8TIxMF4iFGC
        g1lJhFfLJDFRiDclsbIqtSg/vqg0J7X4EKMpMKwnMkuJJucDk3leSbyhiaWBiZmZobmRqYG5
        kjjv3H9OiUIC6YklqdmpqQWpRTB9TBycUg1Ma1YquAo/cFj0xSjA7vXsto2+N6Jsni92TVyz
        ZVG70/99DVbiUxKubuxlV83ZyuZrv0fTsz/dfG1in2qtvuoavnUhE7136L9ZqSnQ58u5orgs
        cFnZLa9fdUe96nb6eh49klk003j/w4/bmc45HLNL7IqOlV3z3XlVVN6x2de8b0aeOKd/uP1S
        yOP3UdxRrS9fzbIKiosPmyBbzPNIrc+kOSkm/dayCZNufDfJzGzP3+kVbb5AfCfrvzANxtse
        N8SCH67+0CJXukb60/wtOjNefZwzKZVB8dgvh9mZCzeL1bkUzKrxyepMKt68SDv32a1ygzc6
        HxLEmHc+2dkk1qZqJcz+XNZzSWWTpff/aWeVWIozEg21mIuKEwEiviJFLgQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGLMWRmVeSWpSXmKPExsWy7bCSvC5HbFKiQedZNYvL+7Ut5h85x2qx
        8e0PJov7X48yWkz5s5zJYsb5fUwWrXuPsFscftPOarFq1x9GB06PWQ29bB47Z91l99i0qpPN
        4861PWwefVtWMXp83iQXwBbFZZOSmpNZllqkb5fAlbH2wmbmgqlsFZdO3GNsYPzK0sXIySEh
        YCKxrfkUWxcjF4eQwA5GibmrLrJCJGQlnr3bwQ5hC0vcbznCClH0nlHiQ8stsASbgK7Eluev
        GEESIgLdjBL9jb1MIA6zwAtGiaV/9gNVcXAIC4RI9L/RBmlgEVCVWPL8OTOIzStgL7H38BU2
        iA3yEkd+dYLFOQUcJCZ03QOzhYBqetY/YYKoF5Q4OfMJ2NnMQPXNW2czT2AUmIUkNQtJagEj
        0ypGydSC4tz03GLDAqO81HK94sTc4tK8dL3k/NxNjOCg19Lawbhn1Qe9Q4xMHIyHGCU4mJVE
        eLVMEhOFeFMSK6tSi/Lji0pzUosPMUpzsCiJ817oOhkvJJCeWJKanZpakFoEk2Xi4JRqYFp9
        Z3lYzUeNO25VtieV3Q0bPh7OSbw0cX3GjaoLBpUxFiYvLXQ9Pxon3feed0eh6Zbnt6SYna+O
        vP2qx2PJcXzBbWapbluP462uJtK/Dzy6+Tt5Trg3x9GPpZc3N7+8dsearWit2v9XhXqZN1r/
        PDt2rOEMt/Y13si1Px9nPVx22cah9cMbY8FVIZWmsxvz8/LPCFV+3n1cap5DZpCX1OOIl0rN
        8wXfpOXcMyhpunH7hPyLg6b6uyNCXaY37TErDmBJSZ4+c4K9f6bsCSsGhX0dtWvMDrHae386
        L8xYtK397cZtihw/J8jX1ws/Dq0+aDV/y+81yypPN1cXTrgveOmVpsbG23kKR/6/PfJSOFGJ
        pTgj0VCLuag4EQCKVQTi6QIAAA==
X-CMS-MailID: 20211010032456epcas2p2b56e49dcc5973224b26725cb8b7589b3
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20211010032456epcas2p2b56e49dcc5973224b26725cb8b7589b3
References: <20211010032246.146939-1-chanho61.park@samsung.com>
        <CGME20211010032456epcas2p2b56e49dcc5973224b26725cb8b7589b3@epcas2p2.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add document Samsung's Exynos Auto v9 compatible for system registers.

Cc: Lee Jones <lee.jones@linaro.org>
Signed-off-by: Chanho Park <chanho61.park@samsung.com>
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index abe3fd817e0b..75dcbb741010 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -55,6 +55,7 @@ properties:
               - samsung,exynos4-sysreg
               - samsung,exynos5-sysreg
               - samsung,exynos5433-sysreg
+              - samsung,exynosautov9-sysreg
 
           - const: syscon
 
-- 
2.33.0

