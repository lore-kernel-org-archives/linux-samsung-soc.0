Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A9C9C64E90
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  2 Dec 2020 12:21:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 44AA922206
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  2 Dec 2020 12:21:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729549AbgLBMV2 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 2 Dec 2020 07:21:28 -0500
Received: from mailout2.w1.samsung.com ([210.118.77.12]:40698 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729538AbgLBMV2 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 2 Dec 2020 07:21:28 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20201202122036euoutp0231d7a2cdaacbe62c82ad19127e941076~M5Z6p3DZn2313423134euoutp024
        for <linux-samsung-soc@vger.kernel.org>; Wed,  2 Dec 2020 12:20:36 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20201202122036euoutp0231d7a2cdaacbe62c82ad19127e941076~M5Z6p3DZn2313423134euoutp024
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1606911636;
        bh=cwr6jiAWB9z4EkqE3xXGB892zMrtfoIRY7BlljECCNA=;
        h=From:To:Cc:Subject:Date:References:From;
        b=ELy6IHqAHkFuzqaToibWiQhuvUd1c7AG5AAKDdv/UaKPO1YLFxw8qNRPXXiHxWJ/B
         0dsOj4CPFn/XiH1ueyF0jE37pMUHSgcHVKXCV/ATzYzVBYYOF4LYS4TNHZDKN0olBo
         aMCbwzKJ4PiITHox7GOzDcntW1JuSXDEnG7i6e5Y=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20201202122036eucas1p28b39fd8f094057deb240cd2450ab2de0~M5Z6REtrD1671916719eucas1p2B;
        Wed,  2 Dec 2020 12:20:36 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id DD.D1.27958.49687CF5; Wed,  2
        Dec 2020 12:20:36 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20201202122035eucas1p175944617fd50292f7dccc775823ed038~M5Z508SgN1591115911eucas1p1b;
        Wed,  2 Dec 2020 12:20:35 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20201202122035eusmtrp26586d54f1f9c99544ada03e55d4003da~M5Z50SHnj0479804798eusmtrp2Q;
        Wed,  2 Dec 2020 12:20:35 +0000 (GMT)
X-AuditID: cbfec7f2-efdff70000006d36-74-5fc786949721
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id B7.E6.16282.39687CF5; Wed,  2
        Dec 2020 12:20:35 +0000 (GMT)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20201202122035eusmtip245c23506ef1805c1a6edb9fbd4d6748c~M5Z5XzZRC0349703497eusmtip2K;
        Wed,  2 Dec 2020 12:20:35 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Lukasz Stelmach <l.stelmach@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH] ARM: dts: exynos: Reduce assigned-clocks entries for SPI0
 on Artik5 board
Date:   Wed,  2 Dec 2020 13:20:29 +0100
Message-Id: <20201202122029.22198-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrKIsWRmVeSWpSXmKPExsWy7djP87pT2o7HG3yeyWOxccZ6VovrX56z
        Wpw/v4Hd4uahFYwWM87vY7JYe+QuuwObx6ZVnWwefVtWMXp83iQXwBzFZZOSmpNZllqkb5fA
        lTH3yj+Wgm6+il3vPzI3MF7j7mLk5JAQMJHYMXcHYxcjF4eQwApGiUe9z9ghnC+MErcO9TFB
        OJ8ZJToaJ7LAtOxffhoqsZxR4uT3DaxwLZu6NoJVsQkYSnS97WIDsUUEVCU+ty0Am8ss8IhR
        4u3EVewgCWGBGIk9kyaB2SxARce3bwRr4BWwlWh99YwJYp28xOoNB5hBmiUE3rJLHG04zAyR
        cJH4dfwTlC0s8er4FnYIW0bi/875TBANzYwSD8+tZYdwehglLjfNYISospa4c+4X0DoOoJs0
        Jdbv0ocIO0pMWLmNBSQsIcAnceOtIEiYGcictG06M0SYV6KjTQiiWk1i1vF1cGsPXrgEdY6H
        xPmfV8F+ERKIlZj66TXbBEa5WQi7FjAyrmIUTy0tzk1PLTbMSy3XK07MLS7NS9dLzs/dxAiM
        +dP/jn/awTj31Ue9Q4xMHIyHGCU4mJVEeFn+HYkX4k1JrKxKLcqPLyrNSS0+xCjNwaIkzrtq
        9pp4IYH0xJLU7NTUgtQimCwTB6dUA1PMjcsa+xV3sK7XZOvjyWtpOLpFICXhwKElOenX0q7V
        5ly8E9ifW7m3sm/q8k3qtuwL+VZv7pD9YzBHOy+qrL/F7uV/jdrQuZPn2vi0fT667bizi35h
        6b6oygtq73tUuf9KZ85dYmrD9my+Vcg7Tc5Dk3f8P5BSd1SXZUdXxtT9By6ltKlYnnjRuGDX
        poAbL91Vd09+eqz15t7/c2e3Nv6IO/p7S7zKo3P8jYfMco7IryyvDmf02r5lncnuHI2yBY0m
        mSumdNW8/XBJ8Iv/udN/2TZeECye81mXb35jnUbEJOVnm6WvPv2z/UZADtu3AyJHvc5mJmmv
        P6DXajp7w/XMrHORXGJhLDx1b8w+PdmlxFKckWioxVxUnAgA/2aInmgDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrFLMWRmVeSWpSXmKPExsVy+t/xe7qT247HG0zsULfYOGM9q8X1L89Z
        Lc6f38BucfPQCkaLGef3MVmsPXKX3YHNY9OqTjaPvi2rGD0+b5ILYI7SsynKLy1JVcjILy6x
        VYo2tDDSM7S00DMysdQzNDaPtTIyVdK3s0lJzcksSy3St0vQy5h75R9LQTdfxa73H5kbGK9x
        dzFyckgImEjsX36aqYuRi0NIYCmjxJXjL1ghEjISJ6c1QNnCEn+udbFBFH1ilJjzpocNJMEm
        YCjR9bYLzBYRUJX43LaAHaSIWeAJo8Tt3kXMIAlhgSiJPVtusYDYLEBFx7dvBGvgFbCVaH31
        jAlig7zE6g0HmCcw8ixgZFjFKJJaWpybnltspFecmFtcmpeul5yfu4kRGGjbjv3csoNx5auP
        eocYmTgYDzFKcDArifCy/DsSL8SbklhZlVqUH19UmpNafIjRFGjfRGYp0eR8YKjnlcQbmhmY
        GpqYWRqYWpoZK4nzmhxZEy8kkJ5YkpqdmlqQWgTTx8TBKdXAxHrzodO7kHtVE0wi9/MGvf6v
        5+g45V6UalLWp1dTd3KGudasY8lTv80oefCz8duNGj9mnn4pcvXndpHMT76f9Bbn1iZ89mTS
        NJtzoW5v47KIQywPVVdf+vp0oV3t5uzty0yDS3a/y/+wiCFU3mjd8eMXa3xfGHTJ/Cw5Fhbf
        32xyofh8bZTmSRHnG6s7T/99L7VcbVqPvsypt7eNp7SELfvZ8uvRh8x5Ks+u1u/kUV2zPOX4
        GXbtZZubI7atTZrx5d5v8QU3/OY1s/+euyB5o8lrebaE1xf3rH69/k+ViI5pSM69Pwc5G18r
        72mrfHzZ7XAmg1dc8swUWcPVldcrD8yOz2Wwu/7+6ZWXXlL1cS+VWIozEg21mIuKEwGzROgq
        vQIAAA==
X-CMS-MailID: 20201202122035eucas1p175944617fd50292f7dccc775823ed038
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20201202122035eucas1p175944617fd50292f7dccc775823ed038
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20201202122035eucas1p175944617fd50292f7dccc775823ed038
References: <CGME20201202122035eucas1p175944617fd50292f7dccc775823ed038@eucas1p1.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Commit 2024b130b0c8 ("ARM: dts: exynos: Add Ethernet to Artik 5 board")
added ethernet chip on SPI0 bus and the whole bunch of assigned clock
entries to ensure proper clock rates and topology. Limit the assigned
clock parents only to the direct clocks of the SPI0 device and assume
that MPLL clock is already properly configured.

The applied clock topology was incorrect as some clocks between were
missing, what resulted in the following warning:

clk: failed to reparent div_mpll_pre to mout_mpll: -22

Fixes: 2024b130b0c8 ("ARM: dts: exynos: Add Ethernet to Artik 5 board")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/boot/dts/exynos3250-artik5-eval.dts | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/exynos3250-artik5-eval.dts b/arch/arm/boot/dts/exynos3250-artik5-eval.dts
index 5461949d833e..a1e22f630638 100644
--- a/arch/arm/boot/dts/exynos3250-artik5-eval.dts
+++ b/arch/arm/boot/dts/exynos3250-artik5-eval.dts
@@ -42,12 +42,9 @@
 	status = "okay";
 	cs-gpios = <&gpx3 4 GPIO_ACTIVE_LOW>, <0>;
 
-	assigned-clocks = <&cmu CLK_MOUT_MPLL>, <&cmu CLK_DIV_MPLL_PRE>,
-			  <&cmu CLK_MOUT_SPI0>, <&cmu CLK_DIV_SPI0>,
+	assigned-clocks = <&cmu CLK_MOUT_SPI0>, <&cmu CLK_DIV_SPI0>,
 			  <&cmu CLK_DIV_SPI0_PRE>, <&cmu CLK_SCLK_SPI0>;
-	assigned-clock-parents = <&cmu CLK_FOUT_MPLL>,    /* for: CLK_MOUT_MPLL */
-				 <&cmu CLK_MOUT_MPLL>,    /* for: CLK_DIV_MPLL_PRE */
-				 <&cmu CLK_DIV_MPLL_PRE>, /* for: CLK_MOUT_SPI0 */
+	assigned-clock-parents = <&cmu CLK_DIV_MPLL_PRE>, /* for: CLK_MOUT_SPI0 */
 				 <&cmu CLK_MOUT_SPI0>,    /* for: CLK_DIV_SPI0 */
 				 <&cmu CLK_DIV_SPI0>,     /* for: CLK_DIV_SPI0_PRE */
 				 <&cmu CLK_DIV_SPI0_PRE>; /* for: CLK_SCLK_SPI0 */
-- 
2.17.1

