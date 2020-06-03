Return-Path: <SRS0=67Nn=7Q=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67E68C433E0
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  3 Jun 2020 10:47:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 33AA82074B
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  3 Jun 2020 10:47:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="VDMS3VGe"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725836AbgFCKq7 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 3 Jun 2020 06:46:59 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:40485 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725828AbgFCKq7 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 3 Jun 2020 06:46:59 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20200603104657euoutp027b6d60c960b5595b3aadf6e9655066cc~VAuL2TQk-1486414864euoutp025
        for <linux-samsung-soc@vger.kernel.org>; Wed,  3 Jun 2020 10:46:57 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20200603104657euoutp027b6d60c960b5595b3aadf6e9655066cc~VAuL2TQk-1486414864euoutp025
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1591181217;
        bh=QeaNTDUTzlUTLI1oIxDJsbmDenTFzau4DVEmt8Ns1T4=;
        h=From:To:Cc:Subject:Date:References:From;
        b=VDMS3VGeSGw7WAgJ2cWHvJjKjt8ej9RWJdAj7wCV9iATZceUrpsKh+g8C74+oAKbE
         +N8KYdzTDZrSkmcMwHjAxdUZVdph3j7aHxVo3HVesCSiZjEy97WFDrlAM1VAn4b2N7
         BPqxpt7vRh+Cq9nZEuqdY1zS/9FCf+24KBY/WR20=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20200603104656eucas1p26ed57ac90988daa6c73cb6096a004040~VAuLcLc590162601626eucas1p2U;
        Wed,  3 Jun 2020 10:46:56 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 9E.91.61286.0AF77DE5; Wed,  3
        Jun 2020 11:46:56 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200603104656eucas1p2abeab3bd0fd82af8a10fd278a43a62d3~VAuLIv9Bn1324313243eucas1p2i;
        Wed,  3 Jun 2020 10:46:56 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200603104656eusmtrp22e1726242e9fbaeb76d346d16adc67b1~VAuLILPRn0087900879eusmtrp2C;
        Wed,  3 Jun 2020 10:46:56 +0000 (GMT)
X-AuditID: cbfec7f2-f0bff7000001ef66-dd-5ed77fa0e0a7
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 30.AA.08375.0AF77DE5; Wed,  3
        Jun 2020 11:46:56 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200603104655eusmtip182ed95cba35ec9f0c2827b1f625e6cb1~VAuKwrdIh1731517315eusmtip1S;
        Wed,  3 Jun 2020 10:46:55 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH] ARM: dts: exynos: Enable Bluetooth support for Artik5 board
Date:   Wed,  3 Jun 2020 12:46:47 +0200
Message-Id: <20200603104647.25958-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrDIsWRmVeSWpSXmKPExsWy7djP87oL6q/HGVz7rWmxccZ6VovrX56z
        Wpw/v4HdYsb5fUwWa4/cZXdg9di0qpPNo2/LKkaPz5vkApijuGxSUnMyy1KL9O0SuDKOnOxg
        LbglUPFh+VLGBsZnvF2MnBwSAiYSLTceMXcxcnEICaxglHj34yIbhPOFUeLkne9MEM5nRol1
        ++cww7R09f5khUgsZ5RY/useE1zLte+djCBVbAKGEl1vu9hAbBEBVYnPbQvYQYqYBbYxSmzp
        fQA2SljAR+LTh+VgDSxAReeufmEBsXkFbCUOT90EtU5eYvWGA2AXSgjsYJOYdn03E0TCRWLn
        tdcsELawxKvjW9ghbBmJ/zvnM0E0NDNKPDy3lh3C6WGUuNw0gxGiylrizrlfQPdxAN2kKbF+
        lz5E2FFi5aHtjCBhCQE+iRtvBUHCzEDmpG3TmSHCvBIdbUIQ1WoSs46vg1t78MIlqJs9JJ68
        2MUCUi4kECuxd5LrBEa5WQirFjAyrmIUTy0tzk1PLTbMSy3XK07MLS7NS9dLzs/dxAiM89P/
        jn/awfj1UtIhRgEORiUeXoa663FCrIllxZW5hxglOJiVRHidzp6OE+JNSaysSi3Kjy8qzUkt
        PsQozcGiJM5rvOhlrJBAemJJanZqakFqEUyWiYNTqoEx6U9TefdqdsPYByISqY1tbNP1OsSy
        Ut03PJx5b/33Q6+OTm3ufqGSwmUjO0PLpXWD9IIjHXpqlf+Wu15T19s0h0PXeudZ/cWyv98G
        8zBWvD/yaV3y+vmhRUES5jKbtKQartRcnXTs4mUbtlbrtPSJ3LKRGbWMtanq968ssLVnMLD9
        cXyZ/wwlluKMREMt5qLiRAAgo7yy7wIAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrELMWRmVeSWpSXmKPExsVy+t/xu7oL6q/HGayeJmixccZ6VovrX56z
        Wpw/v4HdYsb5fUwWa4/cZXdg9di0qpPNo2/LKkaPz5vkApij9GyK8ktLUhUy8otLbJWiDS2M
        9AwtLfSMTCz1DI3NY62MTJX07WxSUnMyy1KL9O0S9DKOnOxgLbglUPFh+VLGBsZnvF2MnBwS
        AiYSXb0/WbsYuTiEBJYySvTd28QGkZCRODmtgRXCFpb4c62LDaLoE6PExRfn2UESbAKGEl1v
        u8AaRARUJT63LWAHKWIW2MEosWXHW7BuYQEfiU8fljOC2CxAReeufmEBsXkFbCUOT93EDLFB
        XmL1hgPMExh5FjAyrGIUSS0tzk3PLTbUK07MLS7NS9dLzs/dxAgMr23Hfm7ewXhpY/AhRgEO
        RiUeXoa663FCrIllxZW5hxglOJiVRHidzp6OE+JNSaysSi3Kjy8qzUktPsRoCrR8IrOUaHI+
        MPTzSuINTQ3NLSwNzY3Njc0slMR5OwQOxggJpCeWpGanphakFsH0MXFwSjUwtot6Xq89s+PH
        Kl33f3vnCl67wvWZ4ZuK+qPe14/5A7/t196X/ODu6m9qL9pW7Ujebu3Z+JlnvdTbQ3d8Dly4
        8W+O/bsGTSlRL0sRntJPhxoeFq7LC/I6zBDd1bXyf/vyE5FrulmFF25l4Fs/syJbd2pK1KkV
        a1NKhHIal77jDajuPHvpxv25B5VYijMSDbWYi4oTAVui5H1FAgAA
X-CMS-MailID: 20200603104656eucas1p2abeab3bd0fd82af8a10fd278a43a62d3
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200603104656eucas1p2abeab3bd0fd82af8a10fd278a43a62d3
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200603104656eucas1p2abeab3bd0fd82af8a10fd278a43a62d3
References: <CGME20200603104656eucas1p2abeab3bd0fd82af8a10fd278a43a62d3@eucas1p2.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add a node for the BCM4354 Bluetooth chip on the serial bus #0 on
the Exynos3250-based Artik5 boards.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/boot/dts/exynos3250-artik5.dtsi | 41 ++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm/boot/dts/exynos3250-artik5.dtsi b/arch/arm/boot/dts/exynos3250-artik5.dtsi
index b27a82072365..6c2f320be2f4 100644
--- a/arch/arm/boot/dts/exynos3250-artik5.dtsi
+++ b/arch/arm/boot/dts/exynos3250-artik5.dtsi
@@ -352,6 +352,14 @@
 };
 
 &pinctrl_1 {
+	bten: bten {
+		samsung,pins ="gpx1-7";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
+		samsung,pin-pud-pdn = <EXYNOS_PIN_PULL_DOWN>;
+	};
+
 	wlanen: wlanen {
 		samsung,pins = "gpx2-3";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
@@ -364,6 +372,22 @@
 		samsung,pins = "gpx3-5";
 		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
 	};
+
+	bthostwake: bthostwake {
+		samsung,pins = "gpx3-6";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_INPUT>;
+		samsung,pin-pud-pdn = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	btwake: btwake {
+		samsung,pins = "gpx3-7";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_OUT0>;
+		samsung,pin-pud-pdn = <EXYNOS_PIN_PULL_DOWN>;
+	};
 };
 
 &rtc {
@@ -372,6 +396,23 @@
 	status = "okay";
 };
 
+&serial_0 {
+	assigned-clocks = <&cmu CLK_SCLK_UART0>;
+	assigned-clock-rates = <100000000>;
+	status = "okay";
+
+	bluetooth {
+		compatible = "brcm,bcm4330-bt";
+		pinctrl-names = "default";
+		pinctrl-0 = <&bten &btwake &bthostwake>;
+		max-speed = <3000000>;
+		shutdown-gpios = <&gpx1 7 GPIO_ACTIVE_HIGH>;
+		device-wakeup-gpios = <&gpx3 7 GPIO_ACTIVE_HIGH>;
+		host-wakeup-gpios = <&gpx3 6 GPIO_ACTIVE_HIGH>;
+		clocks = <&s2mps14_osc S2MPS11_CLK_BT>;
+	};
+};
+
 &tmu {
 	status = "okay";
 };
-- 
2.17.1

