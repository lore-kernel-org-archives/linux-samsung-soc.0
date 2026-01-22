Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03AD328B70
	for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Jan 2026 12:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769086304; cv=none; b=OhacUd3dP0Vzz0Q4Hg/2fb4gzzeLdCnxchF7KN8LKFY/9EKuDiRfuCgJTOx4l1vr8R0uuOYV09ZZncE0qfxYZ7CvcPsEPLAGQEACVjJyIfl/cDv3l1+Ytcc1Z9/djQRLWZNHUE4rkMxuKdZHrBoQ9n5b98HYamJijKt8ZyYG7+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769086304; c=relaxed/simple;
	bh=TBycVuEsoNnS8u/NOeJHPnKmqWfftrX+OE33WfKoKEE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=dKhcwt63yCK+fMxvwbHegehw1CfwRs4IeSITCA9kEAolFcNN30IEiQCRaOP8q38lIC97GxBDA2NTOtpzVEP/xa1cUE9yjerrvWl7U9mYGnsUAhFv6+fOejGw5/sFt6tj1EedLqnw6rN30d4udwtw7nUnmuApSKiGTakhq9I/WIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=Nc4ixP66; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Nc4ixP66"
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20260122125139epoutp01cca4c4067c821848420ca01cd6e265f6~NDp2wprz50382703827epoutp01u
	for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Jan 2026 12:51:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20260122125139epoutp01cca4c4067c821848420ca01cd6e265f6~NDp2wprz50382703827epoutp01u
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1769086299;
	bh=jIcbVnj3waROYb5DR8qb9eF/AvAmo/ZNkBO/tKnnrh0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Nc4ixP66vUvFjx4n5EgSF+muSScTerBQJ3lG1XQJfgC1NTe0ZHUmAxh+D+XQvSLvq
	 vVuyXvU0R5jF7vLARHkzrhvq5feLSAR4f98z4/bzScpIVDKzZMG8GLZ5Eqx/K3qJoe
	 /xCQlx1ranIvVAUeCtxMOsiNKCx7g8YRGw09fPK4=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20260122125138epcas5p4be5e677084de1243a64086923eff6f6a~NDp2DQwmp1800418004epcas5p4J;
	Thu, 22 Jan 2026 12:51:38 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.91]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4dxgtK27dpz6B9m7; Thu, 22 Jan
	2026 12:51:37 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20260122125136epcas5p2db0fa3d04671ddc915e60ae8c5bcfb98~NDp0o_hqk2554025540epcas5p2G;
	Thu, 22 Jan 2026 12:51:36 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260122125134epsmtip1de6ed596648cd4ab20e3f219ec3fb5b6~NDpy2xoNO0683506835epsmtip1h;
	Thu, 22 Jan 2026 12:51:34 +0000 (GMT)
From: Pritam Manohar Sutar <pritam.sutar@samsung.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	alim.akhtar@samsung.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	rosa.pila@samsung.com, dev.tailor@samsung.com, faraz.ata@samsung.com,
	muhammed.ali@samsung.com, selvarasu.g@samsung.com, pritam.sutar@samsung.com
Subject: [PATCH v2 3/3] arm64: dts: exynos: ExynosAutov920: Enable USB nodes
Date: Thu, 22 Jan 2026 18:37:21 +0530
Message-Id: <20260122130721.205664-4-pritam.sutar@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260122130721.205664-1-pritam.sutar@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260122125136epcas5p2db0fa3d04671ddc915e60ae8c5bcfb98
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260122125136epcas5p2db0fa3d04671ddc915e60ae8c5bcfb98
References: <20260122130721.205664-1-pritam.sutar@samsung.com>
	<CGME20260122125136epcas5p2db0fa3d04671ddc915e60ae8c5bcfb98@epcas5p2.samsung.com>

Enable USB PHY and DWC3 USB controllers' nodes.

Signed-off-by: Pritam Manohar Sutar <pritam.sutar@samsung.com>
---
 .../boot/dts/exynos/exynosautov920-sadk.dts   | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts b/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts
index f90f7704597c..5896dd69334a 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts
+++ b/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts
@@ -160,15 +160,20 @@ &xtcxo {
 &usbdrd31_ssphy {
 	dvdd-supply = <&dummy_regulator>;
 	vdd18-supply = <&dummy_regulator>;
+	status = "okay";
 };
 
 &usbdrd31_hsphy {
 	dvdd-supply = <&dummy_regulator>;
 	vdd18-supply = <&dummy_regulator>;
 	vdd33-supply = <&dummy_regulator>;
+	status = "okay";
 };
 
 &usbdrd31_dwc3 {
+	dr_mode = "otg";
+	usb-role-switch;
+	role-switch-default-mode = "peripheral";
 	maximum-speed = "super-speed-plus";
 	usb-phy = <&usb_phy0>;
 };
@@ -176,15 +181,20 @@ &usbdrd31_dwc3 {
 &usbdrd31 {
 	vdd10-supply = <&dummy_regulator>;
 	vdd33-supply = <&dummy_regulator>;
+	status = "okay";
 };
 
 &usbdrd20_phy0 {
 	dvdd-supply = <&dummy_regulator>;
 	vdd18-supply = <&dummy_regulator>;
 	vdd33-supply = <&dummy_regulator>;
+	status = "okay";
 };
 
 &usbdrd20_dwc3_0 {
+	dr_mode = "otg";
+	usb-role-switch;
+	role-switch-default-mode = "peripheral";
 	maximum-speed = "high-speed";
 	usb-phy = <&usb_phy1>;
 };
@@ -192,15 +202,20 @@ &usbdrd20_dwc3_0 {
 &usbdrd20_0 {
 	vdd10-supply = <&dummy_regulator>;
 	vdd33-supply = <&dummy_regulator>;
+	status = "okay";
 };
 
 &usbdrd20_phy1 {
 	dvdd-supply = <&dummy_regulator>;
 	vdd18-supply = <&dummy_regulator>;
 	vdd33-supply = <&dummy_regulator>;
+	status = "okay";
 };
 
 &usbdrd20_dwc3_1 {
+	dr_mode = "otg";
+	usb-role-switch;
+	role-switch-default-mode = "peripheral";
 	maximum-speed = "high-speed";
 	usb-phy = <&usb_phy2>;
 };
@@ -208,15 +223,20 @@ &usbdrd20_dwc3_1 {
 &usbdrd20_1 {
 	vdd10-supply = <&dummy_regulator>;
 	vdd33-supply = <&dummy_regulator>;
+	status = "okay";
 };
 
 &usbdrd20_phy2 {
 	dvdd-supply = <&dummy_regulator>;
 	vdd18-supply = <&dummy_regulator>;
 	vdd33-supply = <&dummy_regulator>;
+	status = "okay";
 };
 
 &usbdrd20_dwc3_2 {
+	dr_mode = "otg";
+	usb-role-switch;
+	role-switch-default-mode = "peripheral";
 	maximum-speed = "high-speed";
 	usb-phy = <&usb_phy3>;
 };
@@ -224,4 +244,5 @@ &usbdrd20_dwc3_2 {
 &usbdrd20_2 {
 	vdd10-supply = <&dummy_regulator>;
 	vdd33-supply = <&dummy_regulator>;
+	status = "okay";
 };
-- 
2.34.1

