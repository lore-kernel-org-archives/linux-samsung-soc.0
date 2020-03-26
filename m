Return-Path: <SRS0=zaGS=5L=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B1D6C2D0EE
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 26 Mar 2020 09:46:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3CEFF2070A
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 26 Mar 2020 09:46:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="KrwNnvcW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727699AbgCZJqk (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 26 Mar 2020 05:46:40 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:46908 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727936AbgCZJqh (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 26 Mar 2020 05:46:37 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20200326094636euoutp019b8334210a00aa4da08c067c01037261~-0Yyyf_rj1254312543euoutp01S
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Mar 2020 09:46:36 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20200326094636euoutp019b8334210a00aa4da08c067c01037261~-0Yyyf_rj1254312543euoutp01S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1585215996;
        bh=mNxRng0nxQRP6ltbIhzZVQFx69cxiNpPeKQgpJCHQVM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KrwNnvcW5skaqDi5wBC+IxGE17bQUQMPGuXrI9Rr8PUBrK/ZKkao9SFXE5Dipif82
         bBtDvaSgE0p93dAm6sKmdlcuZbmSRGyCkN2HSwZXArdoHHPskvMM/WufZCxLcQZ23H
         LBf19k5CkXvTUpDbHZvyaMupgTmqCdt5BhnAVLug=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200326094635eucas1p139afbb3d89ce60054038b6572f00ba89~-0Yyh4BYI2968629686eucas1p1u;
        Thu, 26 Mar 2020 09:46:35 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id EB.AD.60698.BF97C7E5; Thu, 26
        Mar 2020 09:46:35 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20200326094635eucas1p17fbc47aecd9be9df10daacf091bc52be~-0YyPkMig2968629686eucas1p1t;
        Thu, 26 Mar 2020 09:46:35 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200326094635eusmtrp19b6d69db1f63d89775827c2b77e13e2d~-0YyPCCMw3171231712eusmtrp1R;
        Thu, 26 Mar 2020 09:46:35 +0000 (GMT)
X-AuditID: cbfec7f5-a0fff7000001ed1a-9f-5e7c79fbc306
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 9C.C2.07950.BF97C7E5; Thu, 26
        Mar 2020 09:46:35 +0000 (GMT)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200326094635eusmtip2635410a411be82e976ddb0289c334430~-0Yx_Nw7n2360323603eusmtip2j;
        Thu, 26 Mar 2020 09:46:35 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH 3/4] ARM: dts: exynos: Enable WLAN support for the Rinato
 board
Date:   Thu, 26 Mar 2020 10:46:25 +0100
Message-Id: <20200326094626.28308-4-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200326094626.28308-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrOIsWRmVeSWpSXmKPExsWy7djP87q/K2viDFpn61tsnLGe1eL6l+es
        FufPb2C3mHF+H5PF2iN32R1YPTat6mTz6NuyitHj8ya5AOYoLpuU1JzMstQifbsErowPEzez
        FXzlqZh8qYW1gfE4VxcjJ4eEgIlE84NPTF2MXBxCAisYJV58ec8C4XxhlFj77iMzhPOZUeL3
        ng/sMC2HH/RBJZYzSryf2MAK1zKt5wgLSBWbgKFE19suNhBbREBV4nPbAnaQImaBbYwSW3of
        MIMkhAUCJS6tPQOU4OBgASpqnuMNYvIK2Eq8PccBsUxeYvWGA2DVnAJ2EounfQM7T0LgMpvE
        6pN/WCCKXCQO/NvDCmELS7w6vgXqUhmJ05N7oBqaGSUenlvLDuH0MEpcbprBCFFlLXHn3C82
        kM3MApoS63fpQ4QdJXoXnGYGCUsI8EnceCsIEmYGMidtmw4V5pXoaBOCqFaTmHV8Hdzagxcu
        QZV4SHTNlYMEz0RGif+dy9gnMMrPQti1gJFxFaN4amlxbnpqsXFearlecWJucWleul5yfu4m
        RmD0n/53/OsOxn1/kg4xCnAwKvHwRphXxwmxJpYVV+YeYpTgYFYS4X0aWRMnxJuSWFmVWpQf
        X1Sak1p8iFGag0VJnNd40ctYIYH0xJLU7NTUgtQimCwTB6dUA2PJLKl185g+Ck2u3W2/25+L
        W6Fvi6SqvKrt+4gNnl8LDz5a9Ie1eeaHlPe/uJvmm0oGLnVaGsMg2fgxOEXh3uptZ8L4vx/e
        /VnoXdK26OuqQi1N3v/M3rMHJL7fsPzs+bKD+qvPtFlf+uMlsN2pMPbpkbkNmqJGUUfnRQRq
        bhd8rJQ8Y/aFmdlKLMUZiYZazEXFiQDx8PPV+gIAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrBLMWRmVeSWpSXmKPExsVy+t/xe7q/K2viDK48lrHYOGM9q8X1L89Z
        Lc6f38BuMeP8PiaLtUfusjuwemxa1cnm0bdlFaPH501yAcxRejZF+aUlqQoZ+cUltkrRhhZG
        eoaWFnpGJpZ6hsbmsVZGpkr6djYpqTmZZalF+nYJehkfJm5mK/jKUzH5UgtrA+Nxri5GTg4J
        AROJww/6mLsYuTiEBJYySvx9vZEFIiEjcXJaAyuELSzx51oXG0TRJ0aJ3c8ugRWxCRhKdL0F
        SXByiAioSnxuW8AOUsQssINRYsuOt2DdwgL+EofOdAHZHBwsQEXNc7xBTF4BW4m35zgg5stL
        rN5wgBnE5hSwk1g87RvYeCGgko0PHzJPYORbwMiwilEktbQ4Nz232EivODG3uDQvXS85P3cT
        IzAUtx37uWUHY9e74EOMAhyMSjy8Gyyr44RYE8uKK3MPMUpwMCuJ8D6NrIkT4k1JrKxKLcqP
        LyrNSS0+xGgKdNJEZinR5HxgnOSVxBuaGppbWBqaG5sbm1koifN2CByMERJITyxJzU5NLUgt
        gulj4uCUamA02GHHuanDINJwZcXF9+UtRlvP/uicaxyVs80ypNt63dnZU3XDHv1da/K8pvjA
        motGHk+mKJgufn9OuDhxYdIZzvNuf3pVdzkJz2sMOS25KY4vvNy94LFk2Y65kouEf+RpiD2e
        v+vnag/3co41V/92zJANyb9VdW5ff5jg4qh61rtPkzemuHoosRRnJBpqMRcVJwIAeiJSCFsC
        AAA=
X-CMS-MailID: 20200326094635eucas1p17fbc47aecd9be9df10daacf091bc52be
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200326094635eucas1p17fbc47aecd9be9df10daacf091bc52be
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200326094635eucas1p17fbc47aecd9be9df10daacf091bc52be
References: <20200326094626.28308-1-m.szyprowski@samsung.com>
        <CGME20200326094635eucas1p17fbc47aecd9be9df10daacf091bc52be@eucas1p1.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add a node for BCM43342A SDIO chip on MSHC bus #1 and the required MMC
power sequence node for the Exynos3250-based Rinato board.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/boot/dts/exynos3250-rinato.dts | 36 +++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm/boot/dts/exynos3250-rinato.dts b/arch/arm/boot/dts/exynos3250-rinato.dts
index 03f214089fd4..86fedccf277c 100644
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
 		gpios = <&gpd0 2 GPIO_ACTIVE_HIGH>, <&gpd0 3 GPIO_ACTIVE_HIGH>;
@@ -625,6 +630,37 @@
 	status = "okay";
 };
 
+&mshc_1 {
+	status = "okay";
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	broken-cd;
+	non-removable;
+	cap-sd-highspeed;
+	cap-sdio-irq;
+	keep-power-in-suspend;
+	card-detect-delay = <200>;
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

