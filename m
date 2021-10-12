Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E572C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 12 Oct 2021 00:25:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7F99D60E8B
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 12 Oct 2021 00:25:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231793AbhJLA14 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 11 Oct 2021 20:27:56 -0400
Received: from mailout4.samsung.com ([203.254.224.34]:47531 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232100AbhJLA1x (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 11 Oct 2021 20:27:53 -0400
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20211012002547epoutp04de77bbc3e19b2ed59a28f3603d4e3e49~tINcNo-nv1497514975epoutp04i
        for <linux-samsung-soc@vger.kernel.org>; Tue, 12 Oct 2021 00:25:47 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20211012002547epoutp04de77bbc3e19b2ed59a28f3603d4e3e49~tINcNo-nv1497514975epoutp04i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1633998347;
        bh=B25mpd8MmFxri2kPK/KlL04+mRCpk39NJZF1QmUXpEM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=dYQM/WHEPCZ8b3+IaFHuBrKL2jZa6pCoNx2k3cbLYjaamHn3B5jU1nVN36yDsHwEr
         2NQwAh68kMk54TyuQGEUFxceH7tEHqw1mShZxfHlR+P36RQRmzrsFakd3PkSE4TVhw
         YtWd3IoN4Ybp0gNa1/7GpJzMW50X62LOVr2TrTyA=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTP id
        20211012002547epcas2p4a2738d6588c5bacc93675524d8ca0cef~tINborgut0403004030epcas2p4O;
        Tue, 12 Oct 2021 00:25:47 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.36.90]) by
        epsnrtp4.localdomain (Postfix) with ESMTP id 4HSxJz5GvGz4x9QP; Tue, 12 Oct
        2021 00:25:39 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
        epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
        8D.84.09472.EF5D4616; Tue, 12 Oct 2021 09:25:34 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
        20211012002533epcas2p182112e07ea081957a0e54fea46c66816~tINPLgoFH1646716467epcas2p1j;
        Tue, 12 Oct 2021 00:25:33 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20211012002533epsmtrp11d7537d14886da40d752a2c364445c89~tINPKiRZa2356223562epsmtrp1M;
        Tue, 12 Oct 2021 00:25:33 +0000 (GMT)
X-AuditID: b6c32a48-d5fff70000002500-01-6164d5fe8218
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        26.F9.08750.DF5D4616; Tue, 12 Oct 2021 09:25:33 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20211012002533epsmtip2b5878ce763928fa81b40af9b776f96fa~tINO82rj91413714137epsmtip2J;
        Tue, 12 Oct 2021 00:25:33 +0000 (GMT)
From:   Chanho Park <chanho61.park@samsung.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chanho Park <chanho61.park@samsung.com>,
        Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v4 1/3] dt-bindings: mfd: add samsung,exynosautov9-sysreg
 compatible
Date:   Tue, 12 Oct 2021 09:23:12 +0900
Message-Id: <20211012002314.38965-2-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211012002314.38965-1-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprNJsWRmVeSWpSXmKPExsWy7bCmue6/qymJBivmclpc3q9tMf/IOVaL
        jW9/MFnc/3qU0WLKn+VMFjPO72OyaN17hN3i8Jt2VotVu/4wOnB6zGroZfPYOesuu8emVZ1s
        Hneu7WHz6NuyitHj8ya5ALaobJuM1MSU1CKF1Lzk/JTMvHRbJe/geOd4UzMDQ11DSwtzJYW8
        xNxUWyUXnwBdt8wcoKOUFMoSc0qBQgGJxcVK+nY2RfmlJakKGfnFJbZKqQUpOQXmBXrFibnF
        pXnpenmpJVaGBgZGpkCFCdkZu6f8Yim4zVYx6c8U9gbGbaxdjJwcEgImEvefXGDsYuTiEBLY
        wSjRcX41O4TziVFiypUPzBDOZ0aJDTtXwLV87t7ECpHYxSjRfrIdyvnIKDG5/z8jSBWbgK7E
        luevwAaLCHQySqz8to0JxGEWeMIo0XXzCjNIlbBAmMTKLU9Zuhg5OFgEVCVe3VIBCfMK2Ekc
        PrqTBWKdvMSRX51g5ZwC9hIta06xQNQISpyc+QTMZgaqad46mxmi/i+7xLUvlRC2i8S1t8+Y
        IGxhiVfHt7BD2FISL/vbwB6VEOhmlGh99B8qsZpRorPRB8K2l/g1fQsryG3MApoS63fpg5gS
        AsoSR25BreWT6Dj8lx0izCvR0SYE0agucWD7dKjrZSW653yGBpyHxJEjK6FhNYlR4vOeVqYJ
        jAqzkHwzC8k3sxAWL2BkXsUollpQnJueWmxUYAKP4uT83E2M4FSq5bGDcfbbD3qHGJk4GA8x
        SnAwK4nwvuVISRTiTUmsrEotyo8vKs1JLT7EaAoM6onMUqLJ+cBknlcSb2hiaWBiZmZobmRq
        YK4kzjv3n1OikEB6YklqdmpqQWoRTB8TB6dUA9Oy9xOO+d27p61h6/Xql+qWbU/Dm/dNzslb
        sOgjL6tXuUJvYeWn6k9b/bk1XKb23RYIag04plsx9W9LYNjv085MJ28dznl60fG1iboH355v
        orLWwp8f8wqnm2a8PyD5/Jkh5xO3uVpfpkXX33H6LnYm5vfW/9tcxY8ZvH9f7h3tczhJ6KSR
        5Rn/Rv23ef9brXnulHWtD+h+7XH5qu3y4xtDM2d9sVlodkorJjzvxdRnbou8nyQX/5nw7esV
        /SnnX7DNki+7tap798qbm54a2VRk1tz99XXmefGJKrpRJm+P3+l9rXj66Qk3xc3iYklhIst3
        baucsc3pwitxDutXXyTTPP5/XVX8f4frXO+Na2uYlFiKMxINtZiLihMBEDUEzy4EAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMLMWRmVeSWpSXmKPExsWy7bCSvO7fqymJBhtW6Flc3q9tMf/IOVaL
        jW9/MFnc/3qU0WLKn+VMFjPO72OyaN17hN3i8Jt2VotVu/4wOnB6zGroZfPYOesuu8emVZ1s
        Hneu7WHz6NuyitHj8ya5ALYoLpuU1JzMstQifbsErozdU36xFNxmq5j0Zwp7A+M21i5GTg4J
        AROJz92bwGwhgR2MEj87xCHishLP3u1gh7CFJe63HIGqec8ocX9pFYjNJqArseX5K8YuRi4O
        EYFuRon+xl4mEIdZ4AWjxNI/+8G6hQVCJF4fn8fWxcjBwSKgKvHqlgpImFfATuLw0Z0sEAvk
        JY786mQGsTkF7CVa1pxiASkXAqrp7TSCKBeUODnzCVg5M1B589bZzBMYBWYhSc1CklrAyLSK
        UTK1oDg3PbfYsMAoL7Vcrzgxt7g0L10vOT93EyM43LW0djDuWfVB7xAjEwfjIUYJDmYlEd63
        HCmJQrwpiZVVqUX58UWlOanFhxilOViUxHkvdJ2MFxJITyxJzU5NLUgtgskycXBKNTC5PQy7
        EN7rOJPhGXOvsfPdBac5gr7cv8p7IM33o8qOePNFb6bPsVbX3XKljqtQ6NTpiYEns57otfan
        XJF2eNbCevp+9Ss1/tn7+/ar+Yfb3V/39r3GqaCZRcv9JEt4g63ebD1tbr1GZNFn5csKAq9m
        amfkzl/5Wv76zG8nrgRpinFa1j9OFP6abaRyXPp9yPpIlm2zN6hKcnkfU3x33P9B+927NY0V
        F/ft6ro+Z1pFi+TbbqmDZdd4Zocvv/u7q9VXbWH0nOiMknsNuR1LEvbX/DrjVX98h/iEA7YB
        Ja9ls354su0wvbBUy+v6MmNRpcZU9ytdHw/0MLxYknJleZ5q6Squ0OyT4oeyF50JedSmxFKc
        kWioxVxUnAgAboXM6uYCAAA=
X-CMS-MailID: 20211012002533epcas2p182112e07ea081957a0e54fea46c66816
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20211012002533epcas2p182112e07ea081957a0e54fea46c66816
References: <20211012002314.38965-1-chanho61.park@samsung.com>
        <CGME20211012002533epcas2p182112e07ea081957a0e54fea46c66816@epcas2p1.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add document Samsung's Exynos Auto v9 compatible for system registers.

Cc: Lee Jones <lee.jones@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
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

