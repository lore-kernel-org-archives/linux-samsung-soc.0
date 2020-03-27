Return-Path: <SRS0=2lPF=5M=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 006DFC43331
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 27 Mar 2020 12:53:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CC8F720838
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 27 Mar 2020 12:53:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="dm3wjlML"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727242AbgC0MxZ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 27 Mar 2020 08:53:25 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:59649 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726165AbgC0MxZ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 27 Mar 2020 08:53:25 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20200327125322euoutp0220d1ecb9672295a250156069c513a579~AKlJ7JTwl1491914919euoutp02y
        for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Mar 2020 12:53:22 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20200327125322euoutp0220d1ecb9672295a250156069c513a579~AKlJ7JTwl1491914919euoutp02y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1585313602;
        bh=FHyQRjI2XUujK1na9I61xwUkQ5HI6/DMpxjXxkNo9Dc=;
        h=From:To:Cc:Subject:Date:References:From;
        b=dm3wjlMLtRHmGVCvRIj2hjzC1AbG+2M6Hhf1BFw4UVFuJ+tYl3HV1Qy5ADhuEGq6Y
         W2/2+bj7wJScm16MkW1rUb8+qdaGSXWhY5B7Y9C2VJa2zZZX4wPhArG2u6SmyPVNlJ
         IS0PZo+ii8h/EqXeFYNw7tTftHmT2a8HfWloKdWY=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20200327125322eucas1p2d51f054a5338b9da77bd7a2a9ea941d3~AKlJrMXM82821628216eucas1p2D;
        Fri, 27 Mar 2020 12:53:22 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 30.C2.60679.247FD7E5; Fri, 27
        Mar 2020 12:53:22 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200327125321eucas1p2bdd8cc5b224c24f6e3eeac6f9c38ce41~AKlJUgt0x1533015330eucas1p2l;
        Fri, 27 Mar 2020 12:53:21 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200327125321eusmtrp19861f4a18ef41c49035cc21c971d774c~AKlJT6Dcs1242012420eusmtrp1f;
        Fri, 27 Mar 2020 12:53:21 +0000 (GMT)
X-AuditID: cbfec7f4-0cbff7000001ed07-eb-5e7df742a158
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 97.61.07950.147FD7E5; Fri, 27
        Mar 2020 12:53:21 +0000 (GMT)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200327125321eusmtip1b0df2b915c6b87d390bb55770f61b16e~AKlI-z9Kb0096500965eusmtip1m;
        Fri, 27 Mar 2020 12:53:21 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH v2 3/4] ARM: dts: exynos: Enable WLAN support for the Rinato
 board
Date:   Fri, 27 Mar 2020 13:53:17 +0100
Message-Id: <20200327125317.19955-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrLIsWRmVeSWpSXmKPExsWy7djP87pO32vjDKZ08lpsnLGe1eL6l+es
        FufPb2C3mHF+H5PF2iN32R1YPTat6mTz6NuyitHj8ya5AOYoLpuU1JzMstQifbsErozTy58z
        FhzlqZg1rYOlgXEBVxcjJ4eEgIlE240jLF2MXBxCAisYJY4fbYFyvjBKtDd+YYdwPjNKXN76
        jx2m5eTUXUwQieWMEl03nrPCtWxt3cAKUsUmYCjR9baLDcQWEVCV+Ny2AGwUs8A2RoktvQ+Y
        QRLCAiESfxb/AGtgASrq673IBGLzCthKrFt4F2qdvMTqDQeYQZolBHawSbyZNZsNIuEiseLa
        GRYIW1ji1fEtUA0yEqcn97BANDQzSjw8t5YdwukB+qJpBiNElbXEnXO/gCZxAN2kKbF+lz5E
        2FHiUPcGJpCwhACfxI23giBhZiBz0rbpzBBhXomONiGIajWJWcfXwa09eOESM4TtIbF76yGw
        uJBArMS8uw2MExjlZiHsWsDIuIpRPLW0ODc9tdgoL7Vcrzgxt7g0L10vOT93EyMw0k//O/5l
        B+OuP0mHGAU4GJV4eFdcrY0TYk0sK67MPcQowcGsJML7NLImTog3JbGyKrUoP76oNCe1+BCj
        NAeLkjiv8aKXsUIC6YklqdmpqQWpRTBZJg5OqQZGkw+PD8mvKZk2Yap1s13+gUz77TIbBF+z
        rxbj4tCJM9x/mVmIY9a7TqPUX6Jp6duef5j5uMLFMK1N+c6JBQuELb/equaUrheKPxF6PSgh
        h2v1Jx9Ljd+bLnYoeu/bIhv5sKWKd20J237h3jmfzyywuyT8WbgqLGrv3PCA3cmdxu5Se5sd
        St8osRRnJBpqMRcVJwIABd27YfACAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrELMWRmVeSWpSXmKPExsVy+t/xu7qO32vjDBYuN7HYOGM9q8X1L89Z
        Lc6f38BuMeP8PiaLtUfusjuwemxa1cnm0bdlFaPH501yAcxRejZF+aUlqQoZ+cUltkrRhhZG
        eoaWFnpGJpZ6hsbmsVZGpkr6djYpqTmZZalF+nYJehmnlz9nLDjKUzFrWgdLA+MCri5GTg4J
        AROJk1N3MXUxcnEICSxllFh8bA47REJG4uS0BlYIW1jiz7UuNoiiT4wSE26fYgZJsAkYSnS9
        BUlwcogIqEp8blvADlLELLCDUWLLjrdg3cICQRLXG5uZQGwWoKK+3otgNq+ArcS6hXehtslL
        rN5wgHkCI88CRoZVjCKppcW56bnFRnrFibnFpXnpesn5uZsYgeG17djPLTsYu94FH2IU4GBU
        4uFdcbU2Tog1say4MvcQowQHs5II79PImjgh3pTEyqrUovz4otKc1OJDjKZAyycyS4km5wND
        P68k3tDU0NzC0tDc2NzYzEJJnLdD4GCMkEB6YklqdmpqQWoRTB8TB6dUA2NYdW/8snOH5Tga
        XpvccdL99ubjtCNetz3WMkTN+FX1OuLXxV72a2cyl9vP/1h7zu2d6s8yu8NSi/27P055ZZLg
        3qQUu5BJuT6Mz3nippi/08R+z5L4neMmpyCfkhbbdFZEmUfwlJDFl6XKPM83z3RW2rx8xgyh
        2SeSXcxm3p64403thYlqDR+UWIozEg21mIuKEwFblpZmRQIAAA==
X-CMS-MailID: 20200327125321eucas1p2bdd8cc5b224c24f6e3eeac6f9c38ce41
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200327125321eucas1p2bdd8cc5b224c24f6e3eeac6f9c38ce41
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200327125321eucas1p2bdd8cc5b224c24f6e3eeac6f9c38ce41
References: <CGME20200327125321eucas1p2bdd8cc5b224c24f6e3eeac6f9c38ce41@eucas1p2.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add a node for BCM43342A SDIO chip on MSHC bus #1 and the required MMC
power sequence node for the Exynos3250-based Rinato board.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/boot/dts/exynos3250-rinato.dts | 34 +++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm/boot/dts/exynos3250-rinato.dts b/arch/arm/boot/dts/exynos3250-rinato.dts
index 1b48151a84cf..aba8350cfdaf 100644
--- a/arch/arm/boot/dts/exynos3250-rinato.dts
+++ b/arch/arm/boot/dts/exynos3250-rinato.dts
@@ -50,6 +50,11 @@
 		};
 	};
 
+	wlan_pwrseq: mshc1-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&gpe0 4 GPIO_ACTIVE_LOW>;
+	};
+
 	i2c_max77836: i2c-gpio-0 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&gpd0 2 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
@@ -624,6 +629,35 @@
 	status = "okay";
 };
 
+&mshc_1 {
+	status = "okay";
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	non-removable;
+	cap-sd-highspeed;
+	cap-sdio-irq;
+	keep-power-in-suspend;
+	samsung,dw-mshc-ciu-div = <1>;
+	samsung,dw-mshc-sdr-timing = <0 1>;
+	samsung,dw-mshc-ddr-timing = <1 2>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&sd1_clk &sd1_cmd &sd1_bus1 &sd1_bus4>;
+	bus-width = <4>;
+
+	mmc-pwrseq = <&wlan_pwrseq>;
+
+	brcmf: wifi@1 {
+		compatible = "brcm,bcm4334-fmac";
+		reg = <1>;
+
+		interrupt-parent = <&gpx1>;
+		interrupts = <1 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "host-wake";
+	};
+};
+
 &serial_0 {
 	assigned-clocks = <&cmu CLK_SCLK_UART0>;
 	assigned-clock-rates = <100000000>;
-- 
2.17.1

