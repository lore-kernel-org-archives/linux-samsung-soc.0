Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918AB30EF7A
	for <linux-samsung-soc@vger.kernel.org>; Fri, 24 Oct 2025 11:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761306046; cv=none; b=jUioQ14uN7gbxjQi69z9jZoPweU5PP85BmkTj57dXHPjxTKOayuV2XUhnu4YinqpeMkxiAyvgcARC6sSzAvr5kixbzOjMowfRYfzjo0K74BmVAa5PKPjJhumgi+gvbrAg28J5E4gm5CcSX5EkXc8hZswI7RqVVMHe0dQck8SJUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761306046; c=relaxed/simple;
	bh=TBycVuEsoNnS8u/NOeJHPnKmqWfftrX+OE33WfKoKEE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=NgczqR+3NGUhVygCrW1ml9O7pbPK/lZ7sdSJUNDXCwUjpxqQOewRbNwEP2G5Km3/KPfRkIZPKfK3fz/BDeYWulw+95Kqwewgid+TNu0LCP9rhPFc+/DUh4D47jWeGAxdVynmLqLwp+Gs5iWTDq4zex9kqCJkciNUaI1ZWu7qAf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=A7ghF2Y2; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="A7ghF2Y2"
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20251024114042epoutp044343db67502fd171843faa27ac72e01a~xaoOpwDF01180111801epoutp04X
	for <linux-samsung-soc@vger.kernel.org>; Fri, 24 Oct 2025 11:40:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20251024114042epoutp044343db67502fd171843faa27ac72e01a~xaoOpwDF01180111801epoutp04X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1761306043;
	bh=jIcbVnj3waROYb5DR8qb9eF/AvAmo/ZNkBO/tKnnrh0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=A7ghF2Y2lDZy+CEIXo5HiZZd0IzeJwD85Nx2wyEuh6O38C/ZT5SEyecO6s4uYJEFE
	 swzQwDSMM/Fr4nHXItkFQb/Vv/3ci2xYfhd99n3VYIx17XwQLNwF7XAKoCeoJ/PqGH
	 ZoyPqU8cV81vpRlpcDlhUGO/a7QlWoVKjpaQrVPI=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20251024114042epcas5p229e91b907fedbafd8d86b757a29a6321~xaoOKzgdj0371803718epcas5p2H;
	Fri, 24 Oct 2025 11:40:42 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.92]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4ctLZ15319z6B9m4; Fri, 24 Oct
	2025 11:40:41 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20251024114040epcas5p3d8c093798a3fd6c9c3b0c89aa58be8ce~xaoMhI6Sw1719017190epcas5p3s;
	Fri, 24 Oct 2025 11:40:40 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20251024114030epsmtip1b81fba1ba23f43edafb902c806aa3a1a~xaoC5qBsj0323903239epsmtip1Q;
	Fri, 24 Oct 2025 11:40:30 +0000 (GMT)
From: Pritam Manohar Sutar <pritam.sutar@samsung.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	alim.akhtar@samsung.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	rosa.pila@samsung.com, dev.tailor@samsung.com, faraz.ata@samsung.com,
	muhammed.ali@samsung.com, selvarasu.g@samsung.com, pritam.sutar@samsung.com
Subject: [PATCH 3/3] arm64: dts: exynos: ExynosAutov920: Enable USB nodes
Date: Fri, 24 Oct 2025 17:18:45 +0530
Message-Id: <20251024114845.2395166-4-pritam.sutar@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251024114845.2395166-1-pritam.sutar@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251024114040epcas5p3d8c093798a3fd6c9c3b0c89aa58be8ce
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251024114040epcas5p3d8c093798a3fd6c9c3b0c89aa58be8ce
References: <20251024114845.2395166-1-pritam.sutar@samsung.com>
	<CGME20251024114040epcas5p3d8c093798a3fd6c9c3b0c89aa58be8ce@epcas5p3.samsung.com>

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

