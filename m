Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4824FC4332F
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  8 Nov 2022 21:37:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229896AbiKHVhi (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 8 Nov 2022 16:37:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229586AbiKHVhh (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 8 Nov 2022 16:37:37 -0500
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D16F621E39
        for <linux-samsung-soc@vger.kernel.org>; Tue,  8 Nov 2022 13:37:33 -0800 (PST)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20221108213729euoutp0123d336722e5befe17b14f3fd12b2ac3f~lubsCdxkF0295802958euoutp01t
        for <linux-samsung-soc@vger.kernel.org>; Tue,  8 Nov 2022 21:37:29 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20221108213729euoutp0123d336722e5befe17b14f3fd12b2ac3f~lubsCdxkF0295802958euoutp01t
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1667943449;
        bh=A90QlBvb5r60D/U5QWhFSzssJ6JppXA+MXHgXJxhEPw=;
        h=From:To:Cc:Subject:Date:References:From;
        b=ab++0xtV4P5k3v/wHthgkDgCb1T6yWF9JwLlJ4t5od3jXXZ9P+mIPIM/Uh6kgFoPr
         Ku1P/8NcXJtXdXnp+qPECBomfNrJrBLjPhgN5PEEKFWzBMid8H9B3IW8w50tLYLNvW
         P8PNeEpD7UgG0+GNwcvvGq/+96QjmMXdM36qeAUo=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20221108213729eucas1p13b329af02c61c3c57d311e9b3145b9de~lubrblnVA2368023680eucas1p1_;
        Tue,  8 Nov 2022 21:37:29 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 4F.2D.09561.91CCA636; Tue,  8
        Nov 2022 21:37:29 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20221108213728eucas1p2aa97d7925e280b7347bb9e76d3c9a177~lubq_d2793133631336eucas1p2s;
        Tue,  8 Nov 2022 21:37:28 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20221108213728eusmtrp2fbd490249757822558fdc29165e151cf~lubq96NvN2850628506eusmtrp2Y;
        Tue,  8 Nov 2022 21:37:28 +0000 (GMT)
X-AuditID: cbfec7f2-0b3ff70000002559-ba-636acc19e57d
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 6E.9E.08916.81CCA636; Tue,  8
        Nov 2022 21:37:28 +0000 (GMT)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20221108213728eusmtip12f04dd993b55f91f2b3d081590d406ab~lubqd93gR1429914299eusmtip1a;
        Tue,  8 Nov 2022 21:37:28 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        "Minghao Chi (CGEL ZTE)" <chi.minghao@zte.com.cn>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>
Subject: [PATCH] clk: samsung: Revert
 "clk: samsung: exynos-clkout: Use of_device_get_match_data()"
Date:   Tue,  8 Nov 2022 22:37:18 +0100
Message-Id: <20221108213718.32076-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrLIsWRmVeSWpSXmKPExsWy7djPc7qSZ7KSDTo+sVo8mLeNzWLrvHZ2
        i+tfnrNa7H29ld3iY889VosZ5/cxWaw9cpfd4vCbdlaLf9c2sjhwemxa1cnmcefaHjaPvi2r
        GD0+b5LzWLPvB0sAaxSXTUpqTmZZapG+XQJXxoRTN5gKFnNXXL31l7mBcQ9nFyMnh4SAicSO
        w0uZuxi5OIQEVjBKzHh5kQXC+cIo8e7lCyYI5zOjxIW3zYxdjBxgLS/vVUHElzNKPD/bywrX
        MfPsNUaQuWwChhJdb7vYQGwRAQeJz59eM4IUMQvsZpKYNWkZK0hCWCBV4ldnD5jNIqAqce/B
        fnYQm1fAVuL+gw1MEAfKS6zecADsQAmBqRwS7W/2skMkXCTe7p3FCmELS7w6vgUqLiPxf+d8
        JoiGdkaJBb/vQzkTGCUant9ihKiylrhz7hcbyEPMApoS63fpQ4QdJf4dXc4K8SefxI23giBh
        ZiBz0rbpzBBhXomONiGIajWJWcfXwa09eOESM4TtIdE9ewILiC0kECvxr38D6wRGuVkIuxYw
        Mq5iFE8tLc5NTy02zEst1ytOzC0uzUvXS87P3cQITBGn/x3/tINx7quPeocYmTgYDzFKcDAr
        ifCuWZeVLMSbklhZlVqUH19UmpNafIhRmoNFSZyXbYZWspBAemJJanZqakFqEUyWiYNTqoGJ
        +ZeqSLGtrdhPSaYrXi4PAr8vdN3mMjfpQvhK7i2T272WMmo7qjSbhu75enbf5erCP4wGc1S+
        7twV3V+7LPYeT1/Gs5zwzAkbtVi6LbjWvPDwsf9dzf8twqv1sG/KHXuRCWqLI3d/K5+TrfGT
        e95uB2fJKbozuec+m//C4TRr6buUhyUhf9YvPvl7i+LV6sBDX8PzD7U/Nrx1fJ17zgte3jVp
        1kuXntbOPH4zg8/3T4Kvc0G34DSfp3V1tavezn+9rtj1lVZhfYN59uOoPM5Tf38tZ5YtftLE
        vljZviV62YJ1DUcDfmaViTEkeU1fb7xn8gGXtjWy2ncWcS1Z9WF+7PV9ajO47/fy7VzWV7NL
        iaU4I9FQi7moOBEAByaU34ADAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrILMWRmVeSWpSXmKPExsVy+t/xu7oSZ7KSDRY807B4MG8bm8XWee3s
        Fte/PGe12Pt6K7vFx557rBYzzu9jslh75C67xeE37awW/65tZHHg9Ni0qpPN4861PWwefVtW
        MXp83iTnsWbfD5YA1ig9m6L80pJUhYz84hJbpWhDCyM9Q0sLPSMTSz1DY/NYKyNTJX07m5TU
        nMyy1CJ9uwS9jAmnbjAVLOauuHrrL3MD4x7OLkYODgkBE4mX96q6GLk4hASWMko8/PiVsYuR
        EyguI3FyWgMrhC0s8edaFxtE0SdGiac3J7OAJNgEDCW63oIkODlEBJwkHqx7ww5SxCywn0ni
        yaxb7CAbhAWSJfoaikFqWARUJe492M8OYvMK2Ercf7CBCWKBvMTqDQeYJzDyLGBkWMUoklpa
        nJueW2yoV5yYW1yal66XnJ+7iREYltuO/dy8g3Heq496hxiZOBgPMUpwMCuJ8K5Zl5UsxJuS
        WFmVWpQfX1Sak1p8iNEUaN9EZinR5HxgZOSVxBuaGZgamphZGphamhkrifN6FnQkCgmkJ5ak
        ZqemFqQWwfQxcXBKNTAtV00W+/5K7IHslg2rDjNnBd1cMKXnxRG3VV9us8Se/HjgdbVjyUvb
        +eFhtw/16X3+wbd7ws7fX5dcLO7gyKnseNhT+KxeMcvI9Zal0/X5HLfv3TQSmvGYz+ystOHa
        pscbJEx3NT+emc/nVmFwoMMnb/uTH8HLtM/uW3Vwx7S6X1HcovZ79P/cfVv++1F7XJXm/kyO
        1LrJN8IsvA3m9JxTcUv6Z7/iv+0Xi8ns953VvTb+9WpbZqi/K6t565oi040zXy5imZHZcEZl
        GXPjR1euE8oK7PGzFEPn5n0X091TMOFf2oIIVwlBi0nuPn9suLbLuj/bvJdtvZfOreV/ns8y
        nmq0rbXl77tzFpZc69sOK7EUZyQaajEXFScCAAQkZTHUAgAA
X-CMS-MailID: 20221108213728eucas1p2aa97d7925e280b7347bb9e76d3c9a177
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20221108213728eucas1p2aa97d7925e280b7347bb9e76d3c9a177
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20221108213728eucas1p2aa97d7925e280b7347bb9e76d3c9a177
References: <CGME20221108213728eucas1p2aa97d7925e280b7347bb9e76d3c9a177@eucas1p2.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

of_device_get_match_data() function should not be used on the device
other than the one matched to the given driver, because it always returns
the match_data of the matched driver. In case of exynos-clkout driver,
the code matched the OF IDs on the PARENT device, so replacing it with
of_device_get_match_data() broke the driver.

This reverts commit 777aaf3d1daf793461269b49c063aca1cee06a44.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/clk/samsung/clk-exynos-clkout.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos-clkout.c b/drivers/clk/samsung/clk-exynos-clkout.c
index 273f77d54dab..e6d6cbf8c4e6 100644
--- a/drivers/clk/samsung/clk-exynos-clkout.c
+++ b/drivers/clk/samsung/clk-exynos-clkout.c
@@ -81,17 +81,19 @@ MODULE_DEVICE_TABLE(of, exynos_clkout_ids);
 static int exynos_clkout_match_parent_dev(struct device *dev, u32 *mux_mask)
 {
 	const struct exynos_clkout_variant *variant;
+	const struct of_device_id *match;
 
 	if (!dev->parent) {
 		dev_err(dev, "not instantiated from MFD\n");
 		return -EINVAL;
 	}
 
-	variant = of_device_get_match_data(dev->parent);
-	if (!variant) {
+	match = of_match_device(exynos_clkout_ids, dev->parent);
+	if (!match) {
 		dev_err(dev, "cannot match parent device\n");
 		return -EINVAL;
 	}
+	variant = match->data;
 
 	*mux_mask = variant->mux_mask;
 
-- 
2.17.1

