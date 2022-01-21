Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ADFEC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 21 Jan 2022 10:00:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349811AbiAUKAt (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 21 Jan 2022 05:00:49 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11]:50858 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346275AbiAUKAs (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 21 Jan 2022 05:00:48 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20220121100047euoutp01a30088f4200a8c6ca8491c82f4004b20~MQNTrUJj00847308473euoutp01i
        for <linux-samsung-soc@vger.kernel.org>; Fri, 21 Jan 2022 10:00:47 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20220121100047euoutp01a30088f4200a8c6ca8491c82f4004b20~MQNTrUJj00847308473euoutp01i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1642759247;
        bh=5YdJW3+dhblkbIhtVX8cyt3XEV8kipJFF77dXWl7WbQ=;
        h=From:To:Cc:Subject:Date:References:From;
        b=qeF6k0ymqneiIF7MsJIApUv5SO6bmveHrMnc1YxdhOiGrCbvYlvOuZNN+9GIfsUic
         owps+Un48R7wQVKTwWKS97jHL//ScvIp1L9bTvTkNEJBCFdgziDcxOVgG/vq+6h9W0
         O9NVtJ/iRnVqXw2K9ue+tSwONgpIhSVOBif1eyiY=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20220121100046eucas1p285b561720d6d0cc65de79160c47442e4~MQNTAyivh1909319093eucas1p2I;
        Fri, 21 Jan 2022 10:00:46 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 7C.CC.10260.E448AE16; Fri, 21
        Jan 2022 10:00:46 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20220121100046eucas1p264ec703358da48f3cddec028425ba981~MQNSg0k713121431214eucas1p23;
        Fri, 21 Jan 2022 10:00:46 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20220121100046eusmtrp1a09b80923974277913806d1d2b9ff97a~MQNSfuPi40869008690eusmtrp1a;
        Fri, 21 Jan 2022 10:00:46 +0000 (GMT)
X-AuditID: cbfec7f5-bf3ff70000002814-64-61ea844e980f
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 76.7D.09404.D448AE16; Fri, 21
        Jan 2022 10:00:45 +0000 (GMT)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20220121100045eusmtip24dce8727c589245b275f53046aff84a9~MQNSGGdFH1840418404eusmtip2c;
        Fri, 21 Jan 2022 10:00:45 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Inki Dae <inki.dae@samsung.com>,
        =?UTF-8?q?Ma=C3=ADra=20Canal?= <maira.canal@usp.br>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH] drm/exynos: Don't fail if no TE-gpio is defined for DSI
 driver
Date:   Fri, 21 Jan 2022 11:00:39 +0100
Message-Id: <20220121100039.17316-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrAIsWRmVeSWpSXmKPExsWy7djPc7p+La8SDU7eF7a48vU9m8Wk+xNY
        LDa+/cFkMeP8PiaLtUfuslu0tVxnt5gx+SWbA7vHrIZeNo/73ceZPPq2rGL0ePCx1OPzJrkA
        1igum5TUnMyy1CJ9uwSujANH25gLrnJW/L7ynb2BcSpHFyMnh4SAicS6bxdZuhi5OIQEVjBK
        PL1znQ3C+cIo8f3YenaQKiGBz4wSx79awHRc3HYMqmM5o8SuFwtY4Dp+P9vOCFLFJmAo0fW2
        iw3EFhFwk2g6PJMVpIhZ4A2jxM9Fs8HGCgsESrx6uZUZxGYRUJV43vEWqIGDg1fAVmLNRkmI
        bfISqzccYAbplRD4yy6xvnkeO0TCRaKj9SErhC0s8er4Fqi4jMTpyT0sEA3NjBIPz61lh3B6
        GCUuN81ghKiylrhz7hfYNmYBTYn1u/RBTAkBR4lzrZ4QJp/EjbeCIMXMQOakbdOZIcK8Eh1t
        QhAz1CRmHV8Ht/XghUvMELaHRNP+yYyQgIuVeHj3PdsERrlZCKsWMDKuYhRPLS3OTU8tNs5L
        LdcrTswtLs1L10vOz93ECEwEp/8d/7qDccWrj3qHGJk4GA8xSnAwK4nwFuS/ShTiTUmsrEot
        yo8vKs1JLT7EKM3BoiTOm5y5IVFIID2xJDU7NbUgtQgmy8TBKdXANGXC1dg1/EYfjR9PNpjM
        2/j80oUJkZNi7PWrmItE/pbXHd52wvF38Zz7E26x+F3rjbWN9donP11TIcntbz6jTvK8PhPu
        s30ni/0qz1pkP1rTu/jNSpW2TI15XlbBbbLCIZEhuyZNfSl/4Zsar03Eapb1RplvDVikuVd2
        slyufqp21EwiXeFWWuu1Irk7Tfa+rvJ3XtkeW716ldsPT6b2vhmKSot3tx9WmstpEXuI/cVW
        bye9XN4OETfXC88ji40/JSpcqX3GkXD4xv55bQ++h9/a6/VSeaJkcUjw16Ql1Zx33XnvcXhZ
        h2Rt/6Lg0ihYP+nSi8/Wcq9e7Pqs/b++ve1YqeMsq2du0ZW7Q1qVWIozEg21mIuKEwEzrbtq
        cwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrGLMWRmVeSWpSXmKPExsVy+t/xe7q+La8SDebf17a48vU9m8Wk+xNY
        LDa+/cFkMeP8PiaLtUfuslu0tVxnt5gx+SWbA7vHrIZeNo/73ceZPPq2rGL0ePCx1OPzJrkA
        1ig9m6L80pJUhYz84hJbpWhDCyM9Q0sLPSMTSz1DY/NYKyNTJX07m5TUnMyy1CJ9uwS9jANH
        25gLrnJW/L7ynb2BcSpHFyMnh4SAicTFbcdYuhi5OIQEljJKLLu7nw0iISNxcloDK4QtLPHn
        WhcbRNEnRon+pomMIAk2AUOJrrddYA0iAh4Szd+Os4PYzALvGCXOLZMFsYUF/CVmHtkPFmcR
        UJV43vEWqJ6Dg1fAVmLNRkmI+fISqzccYJ7AyLOAkWEVo0hqaXFuem6xkV5xYm5xaV66XnJ+
        7iZGYABuO/Zzyw7Gla8+6h1iZOJgPMQowcGsJMJbkP8qUYg3JbGyKrUoP76oNCe1+BCjKdC6
        icxSosn5wBjIK4k3NDMwNTQxszQwtTQzVhLn9SzoSBQSSE8sSc1OTS1ILYLpY+LglGpgcv+i
        VrNx3smTj752lufJWUUo3b6qyvpsH89vQ5OTr2bYW8x0CcibvPRv+PyH7FzBMbELZtzf4STI
        mlU57cP3pCtlF7l1jIQvrNq89DZn5qQJjdKz5P+3xt1UfCsX1rI/qjJOrTBo/5aFYtM12bZv
        jgnZckMx/uebSW6NJswhi4O17rkJP+079D1izrYI3kcMCQxK81xDq2udvQ6yxgSfLdVs94lx
        7c/zO7CWydyNfd/zf79NMvYEzK+I8ozaFblxU8iiaz+23Tn5tuOx/Ltz9cfrlxcrJ75rcTzw
        tEjy7opjBRVxykd379/zT/pb/KTzGge/zpP0kAqTtvq0Q/anjYuWYaNo42ytbAE1nbjZSizF
        GYmGWsxFxYkAD5ISQskCAAA=
X-CMS-MailID: 20220121100046eucas1p264ec703358da48f3cddec028425ba981
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20220121100046eucas1p264ec703358da48f3cddec028425ba981
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220121100046eucas1p264ec703358da48f3cddec028425ba981
References: <CGME20220121100046eucas1p264ec703358da48f3cddec028425ba981@eucas1p2.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

TE-gpio is optional and if it is not found then gpiod_get_optional()
returns NULL. In such case the code will continue and try to convert NULL
gpiod to irq what in turn fails. The failure is then propagated and driver
is not registered.

Fix this by returning early from exynos_dsi_register_te_irq() if no
TE-gpio is found.

Fixes: ee6c8b5afa62 ("drm/exynos: Replace legacy gpio interface for gpiod interface")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 32a36572b894..14ebbb124852 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1335,7 +1335,9 @@ static int exynos_dsi_register_te_irq(struct exynos_dsi *dsi,
 	int te_gpio_irq;
 
 	dsi->te_gpio = devm_gpiod_get_optional(dsi->dev, "te", GPIOD_IN);
-	if (IS_ERR(dsi->te_gpio)) {
+	if (!dsi->te_gpio) {
+		return 0;
+	} else if (IS_ERR(dsi->te_gpio)) {
 		dev_err(dsi->dev, "gpio request failed with %ld\n",
 				PTR_ERR(dsi->te_gpio));
 		return PTR_ERR(dsi->te_gpio);
-- 
2.17.1

