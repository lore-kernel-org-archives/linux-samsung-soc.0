Return-Path: <SRS0=6Xyg=EJ=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE0C0C2D0A3
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  3 Nov 2020 12:46:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 79094208B6
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  3 Nov 2020 12:46:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="QtkHiZe+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729069AbgKCMqj (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 3 Nov 2020 07:46:39 -0500
Received: from mailout2.w1.samsung.com ([210.118.77.12]:32952 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729065AbgKCMqi (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 3 Nov 2020 07:46:38 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20201103124627euoutp02d7b1dff96e40e8c8a2b229e61e625418~EADM49MBq1364113641euoutp02q
        for <linux-samsung-soc@vger.kernel.org>; Tue,  3 Nov 2020 12:46:27 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20201103124627euoutp02d7b1dff96e40e8c8a2b229e61e625418~EADM49MBq1364113641euoutp02q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1604407587;
        bh=g6AyaEFEsXt1Df2iTx58QJbGoRS+icLIFqzS7JtiFVk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=QtkHiZe+0NQzUvU1kVcU7e4Euj+ALrTB2O6kzdG1kURw28Qa50gwx0vM4LWVfNNIy
         rVJ6snej1BHAc+rtLOplxraNLds8oIgZLtNzVq0KLZaaE/S0HjWgi+5oAuAgxCew+A
         5239kSWA+4Lrwrf+8msSpp1eYq2Qaw1p2ONaF3M8=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20201103124621eucas1p20b2aeaf12dcc0fc3052b7972dc82525a~EADH37M9f3202632026eucas1p2A;
        Tue,  3 Nov 2020 12:46:21 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 1C.8B.06318.D1151AF5; Tue,  3
        Nov 2020 12:46:21 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20201103124621eucas1p23bae6351a79c0e271b68223a35dbd7f7~EADHduwml3231032310eucas1p2_;
        Tue,  3 Nov 2020 12:46:21 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20201103124621eusmtrp23a438dd0a05d34a666a6ae96d080d870~EADHdBCRp1121611216eusmtrp2Z;
        Tue,  3 Nov 2020 12:46:21 +0000 (GMT)
X-AuditID: cbfec7f5-38bff700000018ae-ec-5fa1511d2d5e
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 3C.41.06017.D1151AF5; Tue,  3
        Nov 2020 12:46:21 +0000 (GMT)
Received: from localhost (unknown [106.120.51.46]) by eusmtip1.samsung.com
        (KnoxPortal) with ESMTPA id
        20201103124621eusmtip14ea9f01b9dd761ae2015d44882ebf1c0~EADHSv1Te0307503075eusmtip13;
        Tue,  3 Nov 2020 12:46:21 +0000 (GMT)
From:   =?UTF-8?q?=C5=81ukasz=20Stelmach?= <l.stelmach@samsung.com>
To:     Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Anand Moon <linux.amoon@gmail.com>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     =?UTF-8?q?Bart=C5=82omiej=20=C5=BBolnierkiewicz?= 
        <b.zolnierkie@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        =?UTF-8?q?=C5=81ukasz=20Stelmach?= <l.stelmach@samsung.com>
Subject: [PATCH 3/5] ARM: dts: exynos: Add Ethernet interface description
 for Odroid XU
Date:   Tue,  3 Nov 2020 13:46:16 +0100
Message-Id: <20201103124618.21358-4-l.stelmach@samsung.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201103124618.21358-1-l.stelmach@samsung.com>
MIME-Version: 1.0
Organization: Samsung R&D Institute Poland
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrEKsWRmVeSWpSXmKPExsWy7djP87qygQvjDc6d1rXYOGM9q8X8I+dY
        Lfofv2a2OH9+A7vFzUMrGC02Pb7GanF51xw2ixnn9zFZrNt4i91i7ZG77Bate4+wO3B77Jx1
        l91j06pONo/NS+o9+rasYvT4vEkugDWKyyYlNSezLLVI3y6BK+PVljfsBTs4Kt62rGNrYPzG
        1sXIySEhYCLx48NRxi5GLg4hgRWMEr/ffmaHcL4wSvyZfY0NwvnMKDGv6xI7TMuvnhdgtpDA
        ckaJzW8VIYqeM0oc75zDApJgE3CU6F96ghUkISIwnUli6Z75zCAOs8A+Romd96Ywg1QJC0RK
        HF99ggnEZhFQlVh14CvYWF4Ba4kFx5dBXSgv0b58O5jNKWAj8eLtbyaIGkGJkzOfgG3jF9CS
        WNN0HcxmBqpv3jobbJmEwDl2iabjHcwQg1wkbu+ezgRhC0u8Or4F6h8Zif875wPFOYDseonJ
        k8wgensYJbbN+cECUWMtcefcLzaQGmYBTYn1u/Qhwo4S66+uZoFo5ZO48VYQ4gQ+iUnbpjND
        hHklOtqEIKpVJNb174EaKCXR+2oF4wRGpVlInpmF5IFZCLsWMDKvYhRPLS3OTU8tNs5LLdcr
        TswtLs1L10vOz93ECExJp/8d/7qDcd+fpEOMAhyMSjy8DqkL4oVYE8uKK3MPMUpwMCuJ8Dqd
        PR0nxJuSWFmVWpQfX1Sak1p8iFGag0VJnNd40ctYIYH0xJLU7NTUgtQimCwTB6dUA+POMGlZ
        Tc0pTJP36Al77j9qWbx+QiVT7B27vWKVqzkf1h1waOm7EPXo8cx6bfmK8sg7K9jSVm75+r7h
        lrGkasesyxf377zQX9D4Lc6CZ8I6uRurM6fu5v0tW9x6mItPc2bbtVtfDuo91Lh58oJV6a8N
        Jdnpi9v6lhzWvJObomK5qeQdr7frh0lKLMUZiYZazEXFiQAqhsQ1RQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrEIsWRmVeSWpSXmKPExsVy+t/xu7qygQvjDfrWiFlsnLGe1WL+kXOs
        Fv2PXzNbnD+/gd3i5qEVjBabHl9jtbi8aw6bxYzz+5gs1m28xW6x9shddovWvUfYHbg9ds66
        y+6xaVUnm8fmJfUefVtWMXp83iQXwBqlZ1OUX1qSqpCRX1xiqxRtaGGkZ2hpoWdkYqlnaGwe
        a2VkqqRvZ5OSmpNZllqkb5egl/Fqyxv2gh0cFW9b1rE1MH5j62Lk5JAQMJH41fOCvYuRi0NI
        YCmjxP/nu4ESHEAJKYmVc9MhaoQl/lzrYoOoecoo8eTNRiaQBJuAo0T/0hOsIAkRgflMEqdm
        d4A5zAL7GCX2H13MDlIlLBAu0frmN9g6FgFViVUHvoLFeQWsJRYcXwZ1hrxE+/LtYDangI3E
        i7e/mUCuEAKqufdfAaJcUOLkzCcsIGFmAXWJ9fOEQML8AloSa5qus4DYzEBTmrfOZp7AKDQL
        SccshI5ZSKoWMDKvYhRJLS3OTc8tNtIrTswtLs1L10vOz93ECIy/bcd+btnB2PUu+BCjAAej
        Eg+vQ+qCeCHWxLLiytxDjBIczEoivE5nT8cJ8aYkVlalFuXHF5XmpBYfYjQF+nIis5Rocj4w
        NeSVxBuaGppbWBqaG5sbm1koifN2CByMERJITyxJzU5NLUgtgulj4uCUamCUSrBz3WN40+Xg
        p3e8GhH7cuuYG4oVvqxirQm88Jd7Q4zWo6ATnx80m22WfqtwYOliEa+mw1KPRUUWFDh/ulp6
        W2uf55Z/dXMV9tlPd78TtveAnPg16eh69muz5s//XDtVXXnxspUGV+YvnHTW5sbqX5YynhWq
        p45K8nUWXl7TvVZO7cP/hwdzlViKMxINtZiLihMB89fejtUCAAA=
X-CMS-MailID: 20201103124621eucas1p23bae6351a79c0e271b68223a35dbd7f7
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20201103124621eucas1p23bae6351a79c0e271b68223a35dbd7f7
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20201103124621eucas1p23bae6351a79c0e271b68223a35dbd7f7
References: <20201103124618.21358-1-l.stelmach@samsung.com>
        <CGME20201103124621eucas1p23bae6351a79c0e271b68223a35dbd7f7@eucas1p2.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add Ethernet interface description for Odroid XU.

Signed-off-by: Łukasz Stelmach <l.stelmach@samsung.com>
---
 arch/arm/boot/dts/exynos5410-odroidxu.dts | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5410-odroidxu.dts b/arch/arm/boot/dts/exynos5410-odroidxu.dts
index 75b4150c26d7..882d9296fa5d 100644
--- a/arch/arm/boot/dts/exynos5410-odroidxu.dts
+++ b/arch/arm/boot/dts/exynos5410-odroidxu.dts
@@ -19,6 +19,10 @@ / {
 	model = "Hardkernel Odroid XU";
 	compatible = "hardkernel,odroid-xu", "samsung,exynos5410", "samsung,exynos5";
 
+	aliases {
+		ethernet = &ethernet;
+	};
+
 	memory@40000000 {
 		device_type = "memory";
 		reg = <0x40000000 0x7ea00000>;
@@ -653,3 +657,14 @@ &usbdrd3_1 {
 	vdd33-supply = <&ldo12_reg>;
 	vdd10-supply = <&ldo15_reg>;
 };
+
+&usbhost2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	ethernet: usbether@2 {
+		compatible = "usb0424,9730";
+		reg = <2>;
+		local-mac-address = [00 00 00 00 00 00]; /* Filled in by a bootloader */
+	};
+};
-- 
2.26.2

