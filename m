Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 765393ACF02
	for <linux-samsung-soc@vger.kernel.org>; Sat,  1 Aug 2026 21:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785618241; cv=none; b=VQ2ii8QQKFl9HDlIqTfvFPIBZfQOICScpt/hpcVW9HYuCIX8OOhNFUq8av5NwJXPCfcSySU+gH5goFHtIGuKRm6v0txsjFPdlWQc619iVTtCfVKuQBLkJoBnVMbgKzfDr35etrySKRaajm2vWevtcRyDFDKtdaJ7UzkJorTQvbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785618241; c=relaxed/simple;
	bh=Bp4EO+bL5yc1jZYaDdyI0c+3Uqw4Url/keGMxlMQDoE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rQcjpw6BDXvdfw4pDR/0BNAO1krPEht0mWxZ+qPyxU/KV+lBrfdoXPYLfW9qiKC79+yTYBLgBSjUE3uc0+GoZ9TxrNm9Iimzh9muUbmuQo39NhFKpU040GmacXKwKNbSP0pX2fHkHlMgnUsR7Xsz7hEh9sc/BLutNkGcXq1ZOXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IxbSIwng; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VK87RfXh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IxbSIwng";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VK87RfXh"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 671J04M83716865
	for <linux-samsung-soc@vger.kernel.org>; Sat, 1 Aug 2026 21:03:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ibK6LqHgzG36kXmtKtvWY1wFxjnZQMKpesV
	apeRPi3A=; b=IxbSIwngJQb/kXU30FA31RPgbfVa2rRJqz44aUQNYRF0640TSeV
	JCjRyhn2JHTZpEmgzkjA+af9xAUZKXBfAxlRbbp/gmjGBkpq4Ib3Ref2wswwFANm
	pOLi6k6Flew6rAEJBylO4/6aZFhbYSt59KnKHsacBKLz7+ApByuJLFVF5VkEonLW
	6NqXQFROJT8/N5a466ny87qbHHaXFfSsnPrhdSt8k1VtdRkukrRn/u5uqogAlit2
	QK6z8BrLZpeS7K618X96/91nYKHcRmMtMibaAsj2hjPtxtWT2cfPtS/Pku2/RVQY
	OOxSpr8uWW8Tx/NUSJixg6aydO/Ltv6Gh+A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8r6hqus-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Sat, 01 Aug 2026 21:03:59 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51ebdfceddcso23164401cf.3
        for <linux-samsung-soc@vger.kernel.org>; Sat, 01 Aug 2026 14:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785618239; x=1786223039; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ibK6LqHgzG36kXmtKtvWY1wFxjnZQMKpesVapeRPi3A=;
        b=VK87RfXhO8CBAzwQXKGnyOCmZnZ3SM1eqf/NTB860+JwRbdCeNQGgJmaDHd4LYkUxc
         1tsScTqJ4xGowlsr08OsxRk6hds3vnRjuuVd9pqbInQ+eD2NeUffRjmROYxgG+4VTexf
         A5cGsb2bnxfXGzAVFwe6xK8Z3cpRWx0cLsYBt6Pg8G7/fPEj3Ff6ovGfdUP5zZuwNWQs
         BGwfYf0CvZ5nbhSHuu+sW0fNdsjn2N9XXV94UK2jOZMjXzTGIyiOzRfNlTHqQN2TF/AL
         WQYcN2JbzzITl3yZkJlFKf8t2iURqAr33jR7z2srig7PufCYJe66LZ1jL6sWodDN7/U5
         5GFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785618239; x=1786223039;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ibK6LqHgzG36kXmtKtvWY1wFxjnZQMKpesVapeRPi3A=;
        b=AqbcLtl0gJrUwDV4CnVvFjEBSZxjEUsX3nLAWu9g2ogBiIEEH4AWPDyY51HU2Rdt7t
         aXneC5bjEExs0FNa/yM+fde44l2C7rWYbOCue21QSftmJRoDluW5AxbjM+KiuPk+4DBd
         8/q6rdI5/R+7tXCmoDqpAydyrPD1nImCC5XyrmNH1fxY/7Otd0CUl4n6ENYMGysARME7
         XuIyPV25Pe5QyPNQuywfwJVln44doCqSLDJaZNtDWJGu8nCUOHMv0wPNbHDSo67GIIWj
         uOuSNp3WpkLgtSOPfKAJzOcDqEAgSdDuMd1ooL2AGEm24Wbh/E9nIAlKs7/Vs2J5xb+J
         oqwQ==
X-Forwarded-Encrypted: i=1; AHgh+RrcmcqH+bvgR61tnwXlcManW1dBI9OFXPZ4S01Sz7EBJfhPxbWxeAyjme4fTCZkNzc+ov+CWZuU2LdvmCemYCtddA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzHt+hmDrjKGRqTJMn72kqUhCAJBLWv3jTbHyCjOPh6Tnjo6APh
	RJMXXMMnh2aHx9UjgvjNKgdtAIQlpj0lvWjUU1Zlv7KX8T2hvpQuZSAogEBLqEIwNC0QtQySLVe
	YOXmsy4fCaEcIY6iwNphwqHLHFgmWUV9ngZwbUge/vtxNInMyosYEH3BORiYY+LSS5dFJO3d6Iw
	==
X-Gm-Gg: AR+sD122nIoVYAWLxMr0lQWhN35TTD2IMyg5OgUjmi0/zheGMzW8RRpDGc4FmauREqR
	8WPfYvn6ncVzVEU22zFGh1q1lETk3Fk1SHnc6a7idx+FsxqoNHA8C2t5Sv/Wge3J9RbIXOQkxlR
	kyRmENqlP+oCAFrkjGHpsL70Cr3k7QmhuF3d8sNa+TP4OXTCWFdvjaXHxpUjgjXEtps9+0/Uyoe
	MOBILJR2lCSWWyaQ7bjtQXq00nv18RzttBKEMswMj3F5NXsG+K/uXhCl68XD8LhNor36IeN0m8N
	zM0/BXooAcjv7LJkKzQxQCKzFXONjQ3X8pDYcaVWVqxUkcbMokdZqk1JKeYncMwTRg8S6R3heHf
	rdnhJKMpqJ9AQsMUL
X-Received: by 2002:ac8:690e:0:b0:51b:fc67:c73c with SMTP id d75a77b69052e-52b566dbe08mr113236221cf.16.1785618238850;
        Sat, 01 Aug 2026 14:03:58 -0700 (PDT)
X-Received: by 2002:ac8:690e:0:b0:51b:fc67:c73c with SMTP id d75a77b69052e-52b566dbe08mr113235651cf.16.1785618238347;
        Sat, 01 Aug 2026 14:03:58 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41d1756sm17747602f8f.4.2026.08.01.14.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 14:03:57 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: exynos: Correct white-space style
Date: Sat,  1 Aug 2026 23:03:54 +0200
Message-ID: <20260801210353.383880-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2168; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=Bp4EO+bL5yc1jZYaDdyI0c+3Uqw4Url/keGMxlMQDoE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqbl85QcY3F61GKXMXrQBwgS29n3nDyolMOVqQi
 9VfkOIBeg6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCam5fOQAKCRDBN2bmhouD
 15O0EACONzDjqhT6o/NU5cl4R3+2VynfG1DDQAJkntazCotds81eIuZEUtYAbBHq9DwawiBJaAd
 yOwGnyyQ9iKam29ds0WkZcMYjCQJ7vefjfUdYb7BE5qaF45PHhavR+DQ3JZzZIFXqZM6aZRQYio
 a2DLv7C9RRI83+cFN809GC9a6sUpqfqqQhWxuCZrxQL71/dhAmCuR3YRm8fjBZGlG83pw+vIblg
 dNfAbf3uBgGhduhVjgMnti6dSKh6/DJI6Fp2uM0ctB77f/qzJFZE4ASxHpl+S+a0JBvnxc5LGUZ
 vzfK1sKG/l2C4WNzvkd0BMJCpuWmpShV+t76FFXdWqAJuPPz6vb3kvO1T2ZrTnF8B0m/T9RegyV
 WzRHIEBu9jeWQqTCVRp4xM3leq6jkLYBHi77YQ0/uM3TrhUM8T3IGrWT3ILdXNlCxOsVlw+gYqj
 KlrkjK5YAfx+Z72AxRXIvYyR0BZZHCOks49P7j4lqooCkdG4TV/vJ9ozFwjgRtrv//IP2tYIbHQ
 +8+gnDQBPBV5jFizxIjE6XrOCTVrxrTr1hGYs7VBvPISADyJie/70qqLsym05/Frr01IYt97+9w
 TPqVz2xNk1Jq2XLTcbhhtDV3AOfTzrz+xpq2uj08oBqpiX+7E4ofPrZnH8ZmHYQhikNNjioBsH5 0E2m2TAT0i9etyQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDE2OSBTYWx0ZWRfX0+YrtWCZXiis
 1OzvOE11NHz6Y6Zme8OdNZXFc0ov5XDODZwmQiQeZuuONKI3YRzE/sWzfeQ/i9nZRWMNbJS4/bK
 1cJXMlvG2PygX74OHusLt6mSq2ARM0E=
X-Proofpoint-GUID: Qja59vGjDNKFmxH3NhEBymzrCqJdHOsB
X-Proofpoint-ORIG-GUID: Qja59vGjDNKFmxH3NhEBymzrCqJdHOsB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDE2OSBTYWx0ZWRfX2jmJHShgRb23
 ZrhI/vSPSRvHhshrLsjm7NKVgOs/e+Id4jIxhP4DoV3dEQgHDqgcyRmCJMfKpnHpTxdRT0mJGeL
 pCZEBxHhth5yXrp1GCK8x3g6qukHlr9b/VeCyhFnMDKSVNgXD7bnt+Ns0gONFomAaYYo6K9YloB
 P4UEnB/Ye+T9Xbf/Uy2xJvfNWTEhvBkL00fQh6QAc9IX+VfYPhneFqZU6f7SPcBgMOrgltXGW2S
 cLoH/bk2vgEZ916Of8nHjR+cmOz79vpjLj0H3wxwRJsOGJAJ2zW+EhQd1qg6KAxGx1kxrchqzQ3
 5u7a16gpRZCltZRK+le2MGLuRrEocLZDZAtRA1WpFrX6Ha6Zv8gx3SkAlarpq0dybsemu9ZiecC
 NM11USeGqRp2GRzV5ABQ+z4umz/h9AyzjYhccK/l4mnTjndy5vAJs6S+cVKo+8XkbiUSoAHu+LD
 bFOg+/tg/OYx2Q6xiqQ==
X-Authority-Analysis: v=2.4 cv=Q5ziJY2a c=1 sm=1 tr=0 ts=6a6e5f3f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=WAwJ1FRNEprDOCzB6JEA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-01_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608010169

Correct a few white-space issues, like missing space before bracket '{'
character or spurious space, which will be flagged by dt-check-style
("redundant-whitespace" warning).  No functional changes.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/exynos/exynos8855-pinctrl.dtsi   | 2 +-
 arch/arm64/boot/dts/exynos/google/gs101-pinctrl.dtsi | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos8855-pinctrl.dtsi b/arch/arm64/boot/dts/exynos/exynos8855-pinctrl.dtsi
index b65f1698cd74..439d7d7e319b 100644
--- a/arch/arm64/boot/dts/exynos/exynos8855-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos8855-pinctrl.dtsi
@@ -462,7 +462,7 @@ gpm21: gpm21-gpio-bank {
 };
 
 &pinctrl_hsi_ufs {
-	gpf3: gpf3-gpio-bank{
+	gpf3: gpf3-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
 
diff --git a/arch/arm64/boot/dts/exynos/google/gs101-pinctrl.dtsi b/arch/arm64/boot/dts/exynos/google/gs101-pinctrl.dtsi
index a675f822acec..646722da4e8c 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101-pinctrl.dtsi
@@ -77,7 +77,7 @@ gpa4: gpa4-gpio-bank {
 			     <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH 0>;
 	};
 
-	gpa5: gpa5-gpio-bank  {
+	gpa5: gpa5-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
 		interrupt-controller;
@@ -91,7 +91,7 @@ gpa5: gpa5-gpio-bank  {
 			     <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH 0>;
 	};
 
-	gpa9: gpa9-gpio-bank  {
+	gpa9: gpa9-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
 		interrupt-controller;
@@ -106,7 +106,7 @@ gpa9: gpa9-gpio-bank  {
 			     <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH 0>;
 	};
 
-	gpa10: gpa10-gpio-bank  {
+	gpa10: gpa10-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
 		interrupt-controller;
@@ -1030,7 +1030,7 @@ gpp27: gpp27-gpio-bank {
 		#interrupt-cells = <2>;
 	};
 
-	hsi2c13_bus: hsi2c13-bus-pins  {
+	hsi2c13_bus: hsi2c13-bus-pins {
 		samsung,pins = "gpp25-0", "gpp25-1";
 		samsung,pin-function = <GS101_PIN_FUNC_2>;
 		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
-- 
2.53.0

