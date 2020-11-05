Return-Path: <SRS0=idU0=EL=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFBDEC00A89
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  5 Nov 2020 11:48:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 27E5420936
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  5 Nov 2020 11:48:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="cvZiiuuZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730244AbgKELsi (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 5 Nov 2020 06:48:38 -0500
Received: from mailout2.w1.samsung.com ([210.118.77.12]:46574 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730232AbgKELsh (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 5 Nov 2020 06:48:37 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20201105114826euoutp02394b79c6e07f615a676fdfb7d58ee065~EmjHcm-HN3137631376euoutp02W
        for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Nov 2020 11:48:26 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20201105114826euoutp02394b79c6e07f615a676fdfb7d58ee065~EmjHcm-HN3137631376euoutp02W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1604576906;
        bh=Guufe+VoFpwZoPlojymng96D0t0kuWNvYu7MriOxu5g=;
        h=From:To:Cc:Subject:Date:References:From;
        b=cvZiiuuZ0kvRc355BsjaBqBDA+eZNfecoDgqFM3tGrieypOIaPkFQr2OmN9a7k8h1
         brpMP0dRCqiGUm99fa31h9inlE6y1Dc5iHjp/x5Hnj3lwLjopeZwMQ1Za3LnwdsPlp
         dV6cG3Hzl24Z77mOZNd4ShDP0uepIL/Dx/vjJRFE=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20201105114824eucas1p1d8c50dc59569ae074449018964ef9cbe~EmjFkhLE42966429664eucas1p1H;
        Thu,  5 Nov 2020 11:48:24 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 93.F2.05997.886E3AF5; Thu,  5
        Nov 2020 11:48:24 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20201105114823eucas1p26250751a232cf55e39d2452e8bb83e46~EmjFA-df20490904909eucas1p2F;
        Thu,  5 Nov 2020 11:48:23 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20201105114823eusmtrp11e2cca28503878526dd2b03de85e73e1~EmjFAQkr50565005650eusmtrp1O;
        Thu,  5 Nov 2020 11:48:23 +0000 (GMT)
X-AuditID: cbfec7f4-677ff7000000176d-46-5fa3e6887a7e
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id F3.6E.06017.786E3AF5; Thu,  5
        Nov 2020 11:48:23 +0000 (GMT)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20201105114823eusmtip21e3271ef5f1595d22dd0333a744894e9~EmjEk5toW3066730667eusmtip2Y;
        Thu,  5 Nov 2020 11:48:23 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Markus Reichl <m.reichl@fivetechno.de>,
        Rob Herring <robh+dt@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: exynos: Use fixed index for the MMC devices
Date:   Thu,  5 Nov 2020 12:48:14 +0100
Message-Id: <20201105114814.18372-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrFIsWRmVeSWpSXmKPExsWy7djP87odzxbHGxx8xWqxccZ6VovrX56z
        Wpw/v4Hd4vKuOWwWM87vY7J4eeQHo8XaI3fZLVr3HmF34PC4dafeY9OqTjaPvi2rGD0+b5IL
        YInisklJzcksSy3St0vgyrgw5xFTwSyeisZn8g2MU7m6GDk5JARMJF4/WccCYgsJrGCUmP07
        o4uRC8j+wijR0feaFSLxmVHi0xFXmIZZ85ug4ssZJXb8lIewgRqmLjQAsdkEDCW63naxgdgi
        AqoSn9sWsIMMZRZYwCSxsP0kWEJYwEPi8rxrzF2MHBwsQEX7r9WChHkFbCWu/H3ABrFLXmL1
        hgPMIL0SAtfZJHa8essIkXCROLtwBTOELSzx6vgWdghbRuL05B4WiIZmRomH59ayQzg9jBKX
        m2ZAdVtL3Dn3iw1kM7OApsT6XfoQYUeJ+ddvMoKEJQT4JG68FQQJMwOZk7ZNZ4YI80p0tAlB
        VKtJzDq+Dm7twQuXoM7xkPg5bRsbJExiJbavPc42gVFuFsKuBYyMqxjFU0uLc9NTi43yUsv1
        ihNzi0vz0vWS83M3MQJTwOl/x7/sYNz1J+kQowAHoxIPrwPH4ngh1sSy4srcQ4wSHMxKIrxO
        Z0/HCfGmJFZWpRblxxeV5qQWH2KU5mBREuc1XvQyVkggPbEkNTs1tSC1CCbLxMEp1cC4fGak
        uWq+75JlspckRTL+HapJ6DkgvkjBP/teNvuRI1Wm96qnz3R/NnnNp9dtt+TOppUs/FXXpXvY
        ZeIU89/NG+2T2Y28LC79tT1ssZi3e1F/8q0DM7dxVynO3jNDaeHhtZNUZeYKvZLTnVrIIK2p
        qDj3x+mDxy/yTJV/KcryyrD0W8rBqsbZSizFGYmGWsxFxYkA8oMCPP0CAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrMLMWRmVeSWpSXmKPExsVy+t/xe7rtzxbHG8yaJmexccZ6VovrX56z
        Wpw/v4Hd4vKuOWwWM87vY7J4eeQHo8XaI3fZLVr3HmF34PC4dafeY9OqTjaPvi2rGD0+b5IL
        YInSsynKLy1JVcjILy6xVYo2tDDSM7S00DMysdQzNDaPtTIyVdK3s0lJzcksSy3St0vQy7gw
        5xFTwSyeisZn8g2MU7m6GDk5JARMJGbNb2LtYuTiEBJYyihxYcEHJoiEjMTJaQ2sELawxJ9r
        XWwQRZ8YJXpu/2AESbAJGEp0vQVJcHKICKhKfG5bwA5SxCywjEni+t82dpCEsICHxOV515i7
        GDk4WICK9l+rBQnzCthKXPn7gA1igbzE6g0HmCcw8ixgZFjFKJJaWpybnltspFecmFtcmpeu
        l5yfu4kRGIDbjv3csoOx613wIUYBDkYlHl4HjsXxQqyJZcWVuYcYJTiYlUR4nc6ejhPiTUms
        rEotyo8vKs1JLT7EaAq0eyKzlGhyPjA68kriDU0NzS0sDc2NzY3NLJTEeTsEDsYICaQnlqRm
        p6YWpBbB9DFxcEo1MAZekpjL5P9HTC9kssPLbnFXNd32Mvln1+ccj5efbWgjeDT1NMu963GO
        jG+K3i7hYMxuqiuSftu9qdPATSHKXarEuFS9NfifP2/snO8/5FgPdL1dslVL8HH4o/+lk1vX
        St2RT1XOM6q45zXp/btti3VZCk8s8bE9Vdg+vbDk78tLnGlizgrPlFiKMxINtZiLihMB+Rf+
        KVYCAAA=
X-CMS-MailID: 20201105114823eucas1p26250751a232cf55e39d2452e8bb83e46
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20201105114823eucas1p26250751a232cf55e39d2452e8bb83e46
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20201105114823eucas1p26250751a232cf55e39d2452e8bb83e46
References: <CGME20201105114823eucas1p26250751a232cf55e39d2452e8bb83e46@eucas1p2.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Recently introduced asynchronous probe on the MMC devices can shuffle
block IDs in the system. Pin them to values equal to the physical MMC bus
number to ease booting in environments where UUIDs are not practical.

Use newly introduced aliases for mmcblk devices from commit fa2d0aa96941
("mmc: core: Allow setting slot index via device tree alias").

Suggested-by: Markus Reichl <m.reichl@fivetechno.de>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynos5433.dtsi | 6 ++++++
 arch/arm64/boot/dts/exynos/exynos7.dtsi    | 3 +++
 2 files changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
index 0a886bb6c806..3a37ad97fcdb 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
@@ -23,6 +23,12 @@
 
 	interrupt-parent = <&gic>;
 
+	aliases {
+		mmc0 = &mshc_0;
+		mmc1 = &mshc_1;
+		mmc2 = &mshc_2;
+	};
+
 	arm_a53_pmu {
 		compatible = "arm,cortex-a53-pmu";
 		interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>,
diff --git a/arch/arm64/boot/dts/exynos/exynos7.dtsi b/arch/arm64/boot/dts/exynos/exynos7.dtsi
index 48cd3a04fd07..3e319ec64997 100644
--- a/arch/arm64/boot/dts/exynos/exynos7.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos7.dtsi
@@ -16,6 +16,9 @@
 	#size-cells = <2>;
 
 	aliases {
+		mmc0 = &mmc_0;
+		mmc1 = &mmc_1;
+		mmc2 = &mmc_2;
 		pinctrl0 = &pinctrl_alive;
 		pinctrl1 = &pinctrl_bus0;
 		pinctrl2 = &pinctrl_nfc;
-- 
2.17.1

