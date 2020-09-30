Return-Path: <SRS0=Ewlv=DH=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89902C4727E
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 30 Sep 2020 14:31:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1390B2085B
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 30 Sep 2020 14:31:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="TsTdwYTs"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730104AbgI3Ob5 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 30 Sep 2020 10:31:57 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:53509 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729903AbgI3Ob5 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 30 Sep 2020 10:31:57 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20200930143155euoutp01796d74f154c6a5b437785a6e5f9c797d~5ljljbVJh3199631996euoutp01R
        for <linux-samsung-soc@vger.kernel.org>; Wed, 30 Sep 2020 14:31:55 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20200930143155euoutp01796d74f154c6a5b437785a6e5f9c797d~5ljljbVJh3199631996euoutp01R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1601476315;
        bh=VdTMVF/5RBjfkqF1GszAZp16h8e/DsklT6np30DQjHE=;
        h=From:To:Cc:Subject:Date:References:From;
        b=TsTdwYTsKr76Y9TzkXSfp1fF8kOnmn0aWFWVQ/UcFVB1IrGSUkcRptcTBVD3chaqy
         /a1TUD9hrSCIv+y0nobWfYokkg36A1ZqIFLEhWGm3Fm0aqWW/63aGmbv/tjGRacov7
         XyMmeF46WSYZUZIFfRbBnWkIgvgIvlHKqQ7eX7iE=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20200930143155eucas1p288ee6fba10f00cca2d3befec1340b391~5ljlHGye_0260402604eucas1p2-;
        Wed, 30 Sep 2020 14:31:55 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 23.7B.06456.BD6947F5; Wed, 30
        Sep 2020 15:31:55 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200930143154eucas1p22c1560c485f5d8b8be729c76028c89c7~5ljkmymV00258402584eucas1p21;
        Wed, 30 Sep 2020 14:31:54 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200930143154eusmtrp290f2e874f36d0cc3c9d887ecd66737ab~5ljkmGWKQ2809328093eusmtrp2X;
        Wed, 30 Sep 2020 14:31:54 +0000 (GMT)
X-AuditID: cbfec7f2-809ff70000001938-05-5f7496dbe3a6
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 6D.C5.06314.AD6947F5; Wed, 30
        Sep 2020 15:31:54 +0100 (BST)
Received: from localhost (unknown [106.120.51.46]) by eusmtip2.samsung.com
        (KnoxPortal) with ESMTPA id
        20200930143154eusmtip242fb214d20d775c8ad10b93e01927cac~5ljkdL2oi1540515405eusmtip2J;
        Wed, 30 Sep 2020 14:31:54 +0000 (GMT)
From:   =?UTF-8?q?=C5=81ukasz=20Stelmach?= <l.stelmach@samsung.com>
To:     Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     b.zolnierkie@samsung.com, m.szyprowski@samsung.com,
        =?UTF-8?q?=C5=81ukasz=20Stelmach?= <l.stelmach@samsung.com>
Subject: [PATCH] ARM: dts: exynos: Add a placeholder for a MAC address
Date:   Wed, 30 Sep 2020 16:31:51 +0200
Message-Id: <20200930143151.23961-1-l.stelmach@samsung.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Organization: Samsung R&D Institute Poland
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrOKsWRmVeSWpSXmKPExsWy7djP87q3p5XEG2yeymOxccZ6Vov5R86x
        WvQ/fs1scf78BnaLm4dWMFpsenyN1eLyrjlsFjPO72OyWHvkLrtF694j7A5cHptWdbJ5bF5S
        79G3ZRWjx+dNcgEsUVw2Kak5mWWpRfp2CVwZbw6tZio4yV7RvPQpUwPjRLYuRk4OCQETifmf
        XjJ3MXJxCAmsYJR4dGwvE4TzhVHi6a5lLBDOZ0aJB5c2ssK0TJt6kBUisZxRYuGNB1Atzxkl
        3vX0MYJUsQk4SvQvPQFWJQLSPnPuJCaQBLNAqcTW42+ZQWxhATeJW08WgF3CIqAq0TZtMlgz
        r4C1RMexmcwQ6+Ql2pdvZ4OIC0qcnPmEBcTmF9CSWNN0nQViprxE89bZYF9ICCxil3j9dAMj
        RLOLxP+Wy1CvCku8Or6FHcKWkfi/cz7QQRxAdr3E5ElmEL09jBLb5vxggaixlrhz7hcbSA2z
        gKbE+l36EGFHibM7utghWvkkbrwVhDiBT2LStunMEGFeiY42IYhqFYl1/XugBkpJ9L5awQhR
        4iHRfZFrAqPiLCR/zULyyyyEtQsYmVcxiqeWFuempxYb5qWW6xUn5haX5qXrJefnbmIEJp/T
        /45/2sH49VLSIUYBDkYlHt4JeSXxQqyJZcWVuYcYJTiYlUR4nc6ejhPiTUmsrEotyo8vKs1J
        LT7EKM3BoiTOa7zoZayQQHpiSWp2ampBahFMlomDU6qBcZrFh3tBdbEaW3i+dKhWLk+OPOvd
        Zs26ZPGXwJPTp3/N2bzfrzTrwl/NL99DP17P3/jSuO+uybFezWqZ3U03cwSmiTcc/3xET/Df
        DufyL3MSrH8+Wv1phbOjoWPz/H15e+0SlB5LT3fY0BUUdspAeJrEDe/X+6QC9facTpp/7WFz
        u3lphhzjHiWW4oxEQy3mouJEAJrsPeY6AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprLIsWRmVeSWpSXmKPExsVy+t/xe7q3ppXEG3zdpGmxccZ6Vov5R86x
        WvQ/fs1scf78BnaLm4dWMFpsenyN1eLyrjlsFjPO72OyWHvkLrtF694j7A5cHptWdbJ5bF5S
        79G3ZRWjx+dNcgEsUXo2RfmlJakKGfnFJbZK0YYWRnqGlhZ6RiaWeobG5rFWRqZK+nY2Kak5
        mWWpRfp2CXoZbw6tZio4yV7RvPQpUwPjRLYuRk4OCQETiWlTD7J2MXJxCAksZZToe/MTyOEA
        SkhJrJybDlEjLPHnWhdYvZDAU0aJSdfEQWw2AUeJ/qUnWEFsEYGfjBLbzjqCtDILlEu8OBgI
        EhYWcJO49WQBWCuLgKpE27TJjCA2r4C1RMexmcwQ4+Ul2pdvZ4OIC0qcnPmEBWKMusT6eUIg
        YX4BLYk1TddZQGxmoPLmrbOZJzAKzELSMQuhYxaSqgWMzKsYRVJLi3PTc4sN9YoTc4tL89L1
        kvNzNzECo2bbsZ+bdzBe2hh8iFGAg1GJh3dCXkm8EGtiWXFl7iFGCQ5mJRFep7On44R4UxIr
        q1KL8uOLSnNSiw8xmgK9M5FZSjQ5HxjRQD2GpobmFpaG5sbmxmYWSuK8HQIHY4QE0hNLUrNT
        UwtSi2D6mDg4pRoYZ6zfbFvpLGzz3WDGsvoTe4MfHb553L2KzX7ZsgaOvceZL3HfEThQse/t
        et5r8XIs3kLbX4Z8flZ979D2a5qOjf2VjYoHtwWLSy1SPVv2yrvw+OnLLAzW+5LfRj/6vOZo
        iIPeXNFvP55cVmJd22T9uCpC+31P7/wP/3LYrcrtjZrDl02N8uhZqcRSnJFoqMVcVJwIABLd
        N2WwAgAA
X-CMS-MailID: 20200930143154eucas1p22c1560c485f5d8b8be729c76028c89c7
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200930143154eucas1p22c1560c485f5d8b8be729c76028c89c7
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200930143154eucas1p22c1560c485f5d8b8be729c76028c89c7
References: <CGME20200930143154eucas1p22c1560c485f5d8b8be729c76028c89c7@eucas1p2.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add a placeholder for a MAC address. A bootloader may fill it
to set the MAC address and override EEPROM settings.

Signed-off-by: Łukasz Stelmach <l.stelmach@samsung.com>
---
 arch/arm/boot/dts/exynos5422-odroidxu3.dts | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3.dts b/arch/arm/boot/dts/exynos5422-odroidxu3.dts
index db0bc17a667b..9f7f3eacb750 100644
--- a/arch/arm/boot/dts/exynos5422-odroidxu3.dts
+++ b/arch/arm/boot/dts/exynos5422-odroidxu3.dts
@@ -70,3 +70,21 @@ &pwm {
 &usbdrd_dwc3_1 {
 	dr_mode = "peripheral";
 };
+
+&usbhost2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	hub@1 {
+		compatible = "usb8087,0024";
+		reg = <1>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ethernet: usbether@1 {
+			compatible = "usb0c45,6310";
+			reg = <1>;
+			mac-address = [00 00 00 00 00 00]; /* Filled in by a bootloader */
+		};
+	};
+};
-- 
2.26.2

