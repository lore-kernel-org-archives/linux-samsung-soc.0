Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3FEC53370
	for <linux-samsung-soc@vger.kernel.org>; Mon, 18 Nov 2024 02:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731895826; cv=none; b=gMDNF2stzLlrSl+YycdfeuN8pG1qDrQbEaF5reFNuI/8n5vAJBMfIV51T3ge0YyXKiQ7stKDR5QmZwc47wz78QFuSp3FIohXXmoekrI1EZUI036g3RD8DCxa49rgv0s6Kp5z2V/QPcftV4C6BHUqMNmumnt8vBDrqFdll9VRrqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731895826; c=relaxed/simple;
	bh=2+nwIlSYQpG0rH92v0TPYYdisZdIhViNljLwg0Z/2eA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=ZaLkoHvOft75eG4WdfDFCO8VFggEPvNyqVYcTY3nybyIEt4yIk5W5xZursj0/yXHgLUY8MqDmzbebWQ2iSYY8BMCLOQ3DU7htDsCYJYl/xvP8BLux56jfuAeeAUOhFdwEFZeB3C94QPWB9tOwkdJYRxDviC7F5kl8scQnoBbQJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=hGDnlNRQ; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="hGDnlNRQ"
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20241118021013epoutp02ba68f4d4601d1dd126f3e994a3a7650f~I7hEJpvRb0574705747epoutp02i
	for <linux-samsung-soc@vger.kernel.org>; Mon, 18 Nov 2024 02:10:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20241118021013epoutp02ba68f4d4601d1dd126f3e994a3a7650f~I7hEJpvRb0574705747epoutp02i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1731895813;
	bh=mINgoMpMMdlYTYCpgiwdm0Dg+SMqFB6I05t2LeYQtTo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hGDnlNRQMqH2LGh2L0KSXEW7xtNw6mHapBpCYMII42Op8YC1lekPtwGud8jGoJE83
	 Ry43GvVcrXObkbrpYUoqd3Hm7H/LkGnYyFag5V7Kx/0yBRc0SU2fkqoRlSUdGIlpa+
	 oTVS1+rcKIr2NUK1BlRnj91PjE2c98X/vsjzUCO8=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTP id
	20241118021012epcas2p18989fe00936ba6e6b57931ed4eda4d5e~I7hDcGuyh2660526605epcas2p1N;
	Mon, 18 Nov 2024 02:10:12 +0000 (GMT)
Received: from epsmgec2p1.samsung.com (unknown [182.195.36.97]) by
	epsnrtp3.localdomain (Postfix) with ESMTP id 4XsB0g72gMz4x9QC; Mon, 18 Nov
	2024 02:10:11 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
	epsmgec2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
	D0.85.08559.302AA376; Mon, 18 Nov 2024 11:10:11 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20241118021011epcas2p3db133a3cffb13fba8ce3c973d8ffff65~I7hCIlWaS0163701637epcas2p31;
	Mon, 18 Nov 2024 02:10:11 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20241118021011epsmtrp255bbed424660a744d2323bf7c2d215b0~I7hCHjDCj2522625226epsmtrp2U;
	Mon, 18 Nov 2024 02:10:11 +0000 (GMT)
X-AuditID: b6c32a43-761ff7000000216f-1e-673aa2032ef7
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	68.6C.18937.302AA376; Mon, 18 Nov 2024 11:10:11 +0900 (KST)
Received: from asswp146.dsn.sec.samsung.com (unknown [10.229.19.146]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20241118021011epsmtip13ab02fa5782ed0ed6ef761f555abed7e~I7hB6jKJj3234932349epsmtip1X;
	Mon, 18 Nov 2024 02:10:11 +0000 (GMT)
From: Sowon Na <sowon.na@samsung.com>
To: robh@kernel.org, krzk@kernel.org, conor+dt@kernel.org, vkoul@kernel.org,
	alim.akhtar@samsung.com, kishon@kernel.org
Cc: krzk+dt@kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	sowon.na@samsung.com
Subject: [PATCH v3 3/3] arm64: dts: exynosautov920: add ufs phy for
 ExynosAutov920 SoC
Date: Mon, 18 Nov 2024 11:10:06 +0900
Message-ID: <20241118021009.2858849-4-sowon.na@samsung.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241118021009.2858849-1-sowon.na@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprEJsWRmVeSWpSXmKPExsWy7bCmqS7zIqt0g2fHjC0ezNvGZrFm7zkm
	i/lHzrFaHG39z2zxctY9Novz5zewW1zeNYfNYsb5fUwW//fsYLf4/fMQk8XOOyeYHbg9Nq3q
	ZPPo27KK0ePzJrkA5qhsm4zUxJTUIoXUvOT8lMy8dFsl7+B453hTMwNDXUNLC3MlhbzE3FRb
	JRefAF23zBygg5QUyhJzSoFCAYnFxUr6djZF+aUlqQoZ+cUltkqpBSk5BeYFesWJucWleel6
	eaklVoYGBkamQIUJ2RmPl59gLHjLUfFhxRGWBsZl7F2MnBwSAiYSnY1nmEFsIYEdjBLLz7J2
	MXIB2Z8YJW7PP8oO55ya/JoFpmPz1YlsEImdjBKzTn5khWj/xSixemJKFyMHB5uAqsS1hioQ
	U0SgUmLuMmeQcmaBXkaJ/jtrweYIC0RIPG9dA3YFC1D5qZ1/GEHqeQWsJfbNj4NYJS9xcc1z
	NhCbU8BGYvbmVWDlvAKCEidnPgEbwwxU07x1NjPIfAmBr+wSd8/8ZIZodpF4sPkTI4QtLPHq
	+Baoj6UkPr/bywZh50usf3gXyq6QuHvoP9SP9hKLzvxkB7mHWUBTYv0ufRBTQkBZ4sgtqLV8
	Eh2H/7JDhHklOtqEIBqVJDrOz2GCsCUkVr2YDDXcQ+Ls1fMskEDrZ5Q42NvMOoFRYRaSb2Yh
	+WYWwuIFjMyrGMVSC4pz01OTjQoM4bGbnJ+7iRGcOLWcdzBemf9P7xAjEwfjIUYJDmYlEd5L
	rubpQrwpiZVVqUX58UWlOanFhxhNgUE9kVlKNDkfmLrzSuINTSwNTMzMDM2NTA3MlcR577XO
	TRESSE8sSc1OTS1ILYLpY+LglGpgSu4PC/TQUzNTepVlscN/63rha01FVUVlYicZ3hXclt+c
	xZfKaLfxt2GHgYladZ2p1uHZb6YwLot4evfF0VsRLErcTxj+zv3oG6P+w2vOMqmzXG3xarvu
	ssVe2By2WfqVi6RN3d0Ve9OVuEtZFwWGGWzd9beQpVp//q3Knf8f1JrvD9jW9/PW+r/KGy8+
	E5CrMqqU+3sh7n98R/vxfZcuec2N3jil+MLn2HPzl/1P3/878ee2zqcCL+9+4vv6aZtK8Np/
	PFICFrZ6CzK6XA8/n5Z6QDAhJbdryg032cDvas3zqzbNtNgUKcRolfT4agfPd2tNhj/P9U8X
	dH36myQY/eCPvdGjkPkGP2XWmej+VGIpzkg01GIuKk4EAAd+EEglBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNLMWRmVeSWpSXmKPExsWy7bCSnC7zIqt0g3MLpCwezNvGZrFm7zkm
	i/lHzrFaHG39z2zxctY9Novz5zewW1zeNYfNYsb5fUwW//fsYLf4/fMQk8XOOyeYHbg9Nq3q
	ZPPo27KK0ePzJrkA5igum5TUnMyy1CJ9uwSujMfLTzAWvOWo+LDiCEsD4zL2LkZODgkBE4nN
	VyeydTFycQgJbGeUuH7/GBNEQkLi25s9ULawxP2WI6wgtpDAD0aJFWdkuxg5ONgEVCWuNVSB
	9IoINDJKPP8wmRnEYRaYyChxft4RsA3CAmESbbsfsYHYLEANp3b+YQRp5hWwltg3Pw5ivrzE
	xTXPwUo4BWwkZm9exQ5SIgRU0nkgHCTMKyAocXLmExYQmxmovHnrbOYJjAKzkKRmIUktYGRa
	xSiaWlCcm56bXGCoV5yYW1yal66XnJ+7iREc3lpBOxiXrf+rd4iRiYPxEKMEB7OSCO8lV/N0
	Id6UxMqq1KL8+KLSnNTiQ4zSHCxK4rzKOZ0pQgLpiSWp2ampBalFMFkmDk6pBqbKrqP5l5by
	Z74sfH2tODf70FPuzKOzA4XdVuxZu2/+ajOR+jrB63lT3LKsToVGhFwqKj+e4pPke+rpKpMc
	k3qVVa6np/R4bHSO081b3iBi9HNJbJm7t+3kiw/XZgvJ3r5lf7BZ/OquZ3fOrQu85Ldi+kpR
	mam5/eyOO/eeur7bduEZreA16172K1rZhxzgF7aybld4rTKLQdY20a1pl3z4VrPm+IOa2kvL
	VzZnLvwyyTpnv/SiL7b3hTkrJk58fGSjmG3aVldha82jm09WSJ9i6dQo3XI8x3dqzgSZHkf9
	7NDrx3dV5K5Q+9L1XCD7oGF7/u1lNfsYtfMVgpqlXO4d2/pvj0VYmtw3pzPv5JRYijMSDbWY
	i4oTATaxYkXeAgAA
X-CMS-MailID: 20241118021011epcas2p3db133a3cffb13fba8ce3c973d8ffff65
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20241118021011epcas2p3db133a3cffb13fba8ce3c973d8ffff65
References: <20241118021009.2858849-1-sowon.na@samsung.com>
	<CGME20241118021011epcas2p3db133a3cffb13fba8ce3c973d8ffff65@epcas2p3.samsung.com>

Add UFS Phy for ExynosAutov920

Like ExynosAutov9, this also uses fixed-rate clock nodes until clock driver
has been supported. The clock nodes are initialized on bootloader stage
thus we don't need to control them so far.

Signed-off-by: Sowon Na <sowon.na@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynosautov920.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
index c759134c909e..505ba04722de 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
@@ -361,6 +361,17 @@ pinctrl_aud: pinctrl@1a460000 {
 			compatible = "samsung,exynosautov920-pinctrl";
 			reg = <0x1a460000 0x10000>;
 		};
+
+		ufs_0_phy: phy@16e04000 {
+			compatible = "samsung,exynosautov920-ufs-phy";
+			reg = <0x16e04000 0x4000>;
+			reg-names = "phy-pma";
+			clocks = <&xtcxo>;
+			clock-names = "ref_clk";
+			samsung,pmu-syscon = <&pmu_system_controller>;
+			#phy-cells = <0>;
+			status = "disabled";
+		};
 	};
 
 	timer {
-- 
2.45.2

