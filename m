Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25771DF42
	for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Feb 2025 07:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739950665; cv=none; b=LKohVlHkeIor9nX4HdxIP3gUc2OkyJfDGDuoUhvRwPGrMuO84sQG2mouXI93w8kxdneIR1np3f2fDLBxR0HoqtUNN98JVcD7zOdmRBw4jL//SSEwkkb19tAoybXo7NVWx9eH3TgLhNOxlaN/SfovUkREFfEyQcEBte9tGhah8l4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739950665; c=relaxed/simple;
	bh=NzL2vZyRrfNlz7uU3L4kf+w4B1JvGy7XTCfKwbPG1mg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 References; b=lJYW+i0PtVZNohHJkipzf+waZEf+4LtcNVcfOPLxF2pVOj/K1JWM8e5kBwTIid9RN5MBA+3ZeAcqpaopJ7MDLmObGypI7b5mmmMjFS2NUzl/4rhX2BRknrFHuujRAe9bV7GetwFRie3G7A8tKu2aGZ47F8gy5yI/7loUBoUOIJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=vOHvUi3v; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="vOHvUi3v"
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250219073735epoutp0343f71a04cb5f1cafa98023b8a6029dd4~li_cFZkAj2678626786epoutp03W
	for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Feb 2025 07:37:35 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250219073735epoutp0343f71a04cb5f1cafa98023b8a6029dd4~li_cFZkAj2678626786epoutp03W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1739950655;
	bh=k0aGT+eueNom7vBzXCcNsx7Ufsy2lX6B1I2zIDfZ/Ac=;
	h=From:To:Cc:Subject:Date:References:From;
	b=vOHvUi3vIfkmZQU6XcMvw1Orbe1lkQQbGSp2uD2yzvPXLEqFjJZE2CXMgDi5Oo1ZD
	 +Lcfhy4ZDLivxS+/pTKlPkVgrixRKsTyhPnbljvG2mb5KjrhHC2p9fn1ZNBfyDF2iV
	 3cHpp+WX5TjeafDoPoqSPDWv2zDADEgq3HbpvzAs=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTP id
	20250219073734epcas2p36943f45f3d5bc2fcb4c467ab83ed7545~li_bn0apr1095910959epcas2p3I;
	Wed, 19 Feb 2025 07:37:34 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.36.100]) by
	epsnrtp4.localdomain (Postfix) with ESMTP id 4YySsV0fYFz4x9QF; Wed, 19 Feb
	2025 07:37:34 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
	epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
	F8.D4.22105.D3A85B76; Wed, 19 Feb 2025 16:37:33 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20250219073733epcas2p1537d9cecdfad313077aa4cc4bff8a6f0~li_aaLEq72639526395epcas2p1E;
	Wed, 19 Feb 2025 07:37:33 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250219073733epsmtrp254b861ad281edf79fad7b3429b9aa70d~li_aZcmkK0926709267epsmtrp2f;
	Wed, 19 Feb 2025 07:37:33 +0000 (GMT)
X-AuditID: b6c32a47-f91c170000005659-09-67b58a3da1d0
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	28.4D.33707.D3A85B76; Wed, 19 Feb 2025 16:37:33 +0900 (KST)
Received: from asswp146.dsn.sec.samsung.com (unknown [10.229.19.146]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250219073733epsmtip2d8f7e329b182ce1d96b487dee930cee1~li_aJgaSQ2980929809epsmtip2S;
	Wed, 19 Feb 2025 07:37:33 +0000 (GMT)
From: Sowon Na <sowon.na@samsung.com>
To: krzk@kernel.org, alim.akhtar@samsung.com
Cc: krzk+dt@kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	sowon.na@samsung.com
Subject: [PATCH v5 1/1] arm64: dts: exynosautov920: add ufs phy for
 ExynosAutov920 SoC
Date: Wed, 19 Feb 2025 16:37:28 +0900
Message-ID: <20250219073731.853120-1-sowon.na@samsung.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrIKsWRmVeSWpSXmKPExsWy7bCmha5t19Z0gw3N5hYP5m1js5h/5Byr
	xctZ99gszp/fwG5xedccNosZ5/cxWfz+eYjJgd1j06pONo++LasYPT5vkgtgjsq2yUhNTEkt
	UkjNS85PycxLt1XyDo53jjc1MzDUNbS0MFdSyEvMTbVVcvEJ0HXLzAFarqRQlphTChQKSCwu
	VtK3synKLy1JVcjILy6xVUotSMkpMC/QK07MLS7NS9fLSy2xMjQwMDIFKkzIznhzdB1TwSGu
	ist9S9gbGG9zdDFyckgImEj8udjK3MXIxSEksINR4t7r4+wQzidGicVTP7PCOceXXGOEafl3
	8QA7iC0ksJNRontZDETRL0aJn5fmsXUxcnCwCahKXGuoAqkREdCRmN3ZwgJSwyzQyyjRf2ct
	C0hCWCBCYvmbs2BDWYDqb+6ayAZi8wpYSbw8cBBqmbzExTXPoeKCEidnPgHrZQaKN2+dzQxR
	s49dov+JH4TtInFxfwM7hC0s8er4FihbSuLzu71sEHaxxNN3W1kh7BqJB4cuMkHY9hKLzvxk
	B7mfWUBTYv0ufRBTQkBZ4sgtqK18Eh2H/7JDhHklOtqEIBqVJDrOz4EaIiGx6sVkNogSD4lT
	b3JATCGBWIlb/5MnMMrPQvLJLCSfzELYuoCReRWjWGpBcW56arFRgTE8QpPzczcxgtOelvsO
	xhlvP+gdYmTiYDzEKMHBrCTC21a/JV2INyWxsiq1KD++qDQntfgQoykwbCcyS4km5wMTb15J
	vKGJpYGJmZmhuZGpgbmSOG/1jpZ0IYH0xJLU7NTUgtQimD4mDk6pBiaGFyINIekfAh/dLfi0
	0kFWWjhHdVHmva4LO2TnPHs5Y6rZsoAv55kDVm2IvK41dWfDNvX18q9FVrB2nRXjuWmxsYI/
	derJ0pZ8znLt9CfLmO8tU1gWKl76VvTOZB3BPevMJntPaA54vq/dc9mB7/4rrur/3znjRnLu
	noa5n5rVWIML2EPqPktUs9Zsnibe6ZMSsuRdbZ7lG43EqM7Tuy78FG1RevlwuWFeLk/XL+Wi
	QAnNRREx/I3O8yrXbomdYDdxQ83KBRPNeCWeztYT3hLHGHOu4jtDXMv0y9kJfs/8dFreTmA8
	9ZOxbuKbqmmGRtx2v6RmXg5uFEyIvfTcKPp5EUvdTqW51SkO73RVVJRYijMSDbWYi4oTAT3L
	DS4EBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrALMWRmVeSWpSXmKPExsWy7bCSvK5t19Z0g6PXpSwezNvGZjH/yDlW
	i5ez7rFZnD+/gd3i8q45bBYzzu9jsvj98xCTA7vHplWdbB59W1YxenzeJBfAHMVlk5Kak1mW
	WqRvl8CV8eboOqaCQ1wVl/uWsDcw3uboYuTkkBAwkfh38QA7iC0ksJ1R4uZfQYi4hMS3N3uY
	IGxhifstR1i7GLmAan4wSnxZtg7I4eBgE1CVuNZQBVIjIqAnMfHkdEaQGmaBiYwS5+cdARsq
	LBAm8X/pA0YQmwWo/uauiWwgNq+AlcTLAwcZIRbIS1xc8xwqLihxcuYTFhCbGSjevHU28wRG
	vllIUrOQpBYwMq1iFE0tKM5Nz00uMNQrTswtLs1L10vOz93ECA5EraAdjMvW/9U7xMjEwXiI
	UYKDWUmEt61+S7oQb0piZVVqUX58UWlOavEhRmkOFiVxXuWczhQhgfTEktTs1NSC1CKYLBMH
	p1QDU+aDO6Esj0/GG+z7qiNbIrryNb+R8dQLS58lMWtOO3TZeOrdjSlv/1vHsPxkOvWXOVXv
	w4YLtak/Yk4wdG/JOFtfc8ri5iGl5SxPVyxWMfzrzrDvoFbIzltx6/p+NHzMqp9xp3dWxhyT
	md69fla2y89PWJ3yK9bOQO+Hs6PnkxUm1VcffY8QPmJy/3hDn8q+WZ8/NET179zWWbqxqPrZ
	ujOGLmfFGy0+74nisu7KclqctqJTqc3i0Z1g3xlbr7F/dXWrutOmsJXnuErknHopDbk7G52/
	7T6Yr7KqpW6qeft5zkT/Ryv1FlsLtWxrb2Le0Gi249K+27sPCqxtWGFg0Lc6aaJz9NzLNzOu
	1nn1GyixFGckGmoxFxUnAgARoeu0swIAAA==
X-CMS-MailID: 20250219073733epcas2p1537d9cecdfad313077aa4cc4bff8a6f0
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250219073733epcas2p1537d9cecdfad313077aa4cc4bff8a6f0
References: <CGME20250219073733epcas2p1537d9cecdfad313077aa4cc4bff8a6f0@epcas2p1.samsung.com>

Add UFS Phy for ExynosAutov920

Like ExynosAutov9, this also uses fixed-rate clock nodes until clock driver
has been supported. The clock nodes are initialized on bootloader stage
thus we don't need to control them so far.

Changes from v4:
- Place entry in correct order instead of appending to the end.

Signed-off-by: Sowon Na <sowon.na@samsung.com>
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynosautov920.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
index a3fd503c1b21..fc6ac531d597 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
@@ -567,6 +567,17 @@ pinctrl_hsi2ufs: pinctrl@16d20000 {
 			interrupts = <GIC_SPI 603 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
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
+
 		pinctrl_aud: pinctrl@1a460000 {
 			compatible = "samsung,exynosautov920-pinctrl";
 			reg = <0x1a460000 0x10000>;
-- 
2.45.2

