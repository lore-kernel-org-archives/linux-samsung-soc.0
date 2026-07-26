Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C523D647C
	for <linux-samsung-soc@vger.kernel.org>; Sun, 26 Jul 2026 17:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785087838; cv=none; b=hbemAZqHyXuQDYZEWlCwKK3HwnAHE5pzJzLEaOUoaDum0TOMj3KhQ8tYZfzkEabTf8FSO/i0aGIdnR8vrtbE0S/ZpEuJD4Irfs2RFzXeJlBOigN9Zz1AworbywlkevcVfqaaB8t8uNl2Ek7zfnfPkNzeSYu7czaRIHVonn5DWn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785087838; c=relaxed/simple;
	bh=W9Wxw2zYUetcaHsXEbXm4eyLZjZ9yLjiP5YoCjeOx50=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uHU6/i952FRsvs/eeeDF/hJiiaaUqemEs7V2wpPRdllw9KJhkTT0DRzJW0YqQdGka8VUbt/3/s+iWbjaJHylQknagoMFF4HTVTUPU2naJWBJ8To3HUxKG8/2/OTDFhemBsFE1q2c+Lx9kYR9SlGCQ27XoXgdoEYgeYhOncBj2Hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AfUH2+M6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GK74T2D6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AfUH2+M6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GK74T2D6"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66QH6g2a1370654
	for <linux-samsung-soc@vger.kernel.org>; Sun, 26 Jul 2026 17:43:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kGOqbTbAycRakHRSdcZ3WaER3r/3GJQQ1vfKtljSqyw=; b=AfUH2+M6C7IhFIhu
	SRpwrn9H+yxnPipgH6GwZCLhVY0T4ctLlcMUewm0qEKMR8BFcI7rEvGqqGPmbHP0
	Z0MFz4yJmVCDsDeUelaj2TjXbpHFU1Aq9mACMm/AHpgQOFo+8p8KNDboTh+6srji
	KniDvdCmwJs+sOplwUwIOad5/EbFvdAOlbbyOhFYzn4wklOEjpqpSWo6m7WQajla
	ewd8Hb+L3zLqOAl+2xaP+GJcAUnnSDZ9+AoiDQ6PpqYbXmPuDk7lX4m1LZM7s+RE
	HrUczAozi0PZwwOzdWJIqG+EtlJcenJz/zvjptiLtz3z1TatWf5V3HJVgq7IoDGv
	BvCfpg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fngysrn16-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Sun, 26 Jul 2026 17:43:51 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-522de3c645dso43395961cf.3
        for <linux-samsung-soc@vger.kernel.org>; Sun, 26 Jul 2026 10:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785087831; x=1785692631; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kGOqbTbAycRakHRSdcZ3WaER3r/3GJQQ1vfKtljSqyw=;
        b=GK74T2D6wNpuQmRb5HIThmcNdTyDEWeK47gYC5a9OHpMXF4EO3CkmPG4yx7suapQMm
         L1c5dWFyaZEEriWm7ubP6GGBtLN9yi6r9kXlCeBj9Niwhs8zLRi7idlxs7h/NrsvW1st
         PYjKhOGCYOF9Vrzw3l3aWjnfjRQOhgEOJ0UKK1Q0gsxh+E97b9vUOGWPjHX/fslsyEnn
         0EpjXbUM8Odbu8sgP+w2JHhW+nHwV4lGjylyXa8chRpgwVBzZMfRAQqcTiLjd+5oHgaB
         O5ozUBE3LVJu6qHMS3Jfapik1hb5RnL14Dg5CK8lqDKYj8V1vxVbvJlt/qFkc7PZ2kGa
         302w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785087831; x=1785692631;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kGOqbTbAycRakHRSdcZ3WaER3r/3GJQQ1vfKtljSqyw=;
        b=kXUcOUBdEUQKin6UzPHRwz63n4e4QN1aZFocEiAqIkuPTNX3knfd9+0CNvXlFWl95m
         CspnFHgaIq86bIHndyhnBhQfdq1C0981xDpaOo1wb0ymjI6KdDegQdhMMe3P5A2NC/W3
         IHuLyHmg3pP4iR2wnIwy50mfW4P5mx8LywtplsnI57+MSgS4pP+aEnCzHe+MOj+GzbBr
         WuGsahdNRpgKbO0RiSDvM+mpxZ9Q/0/bUrD69H1767gqG+TRAwYYz0IS4QmwPn93tXsr
         I6Mc3IDQSX40veU6fdtLUEE88gyAP48gTTWCPxWmZ+maDAsqg8Xy75V7wM3kCmR/0y3s
         HwNA==
X-Forwarded-Encrypted: i=1; AHgh+RqrSyLfVzMP6QX3Tg/MiM4CqaXAR8cOe8/jxfhW67iSiRcpw1Glz3JztWP359+kkI6OJQ2oImhzTOVeQ+Kds6SdEA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwqiHMdt32DtVMHM1HiO3Yb1WuY6OOsPDawgSrCOL5XV1izbook
	0MTdSoN6/AXkQCUkB6b8WTFlNpxAC1Q/LzFl2GEiGJXoBXK1Y+otTOyz8i1jxL88dBHqRJ98Sm3
	ifmSvH2MfNLMp7zjtbpd9ULJ9JChdADmacphiia+1rBIEs7XIcAu1Kx8Q3eGvWp9vT9sYXWnmxg
	==
X-Gm-Gg: AR+sD1345UnL2uxs6rUPCQIzz/eL7myGwlC3wYzQBJ1q/45YNLNjGCC5ilgMGBEGdnE
	kHzhEYBBeGbFWOg3SBIu0w681lLx2Qn6bFUovo+wDGuN/bNerlrFNXYFHTdPmFc/B7npRbzX78X
	Pd+FUlLr0CwNBUX4QodD8fdNM6S1arFFrg5d4ySHkl6baYCmUm1uh1FDP+kMiqMKQ6zludsVzQN
	7Ed+dqYkUg07/Yl+TmdAQE/f2W6DrjQ7tcufyS6k7HZYYwoccso4866tSFrzugggLhIjhTUM6os
	3db2Pok8+nZtYbK8UpMOtAQRYX0iCrmT69wRG4HlzqfDUGyZmcFrhrVh5ZGrvjBg8gmrchecurp
	+FaRr/nM1gUxEMvVcfnTzAixB
X-Received: by 2002:a05:622a:c9:b0:519:f884:b587 with SMTP id d75a77b69052e-529a84d6282mr62667521cf.27.1785087829450;
        Sun, 26 Jul 2026 10:43:49 -0700 (PDT)
X-Received: by 2002:a05:622a:c9:b0:519:f884:b587 with SMTP id d75a77b69052e-529a84d6282mr62667141cf.27.1785087828354;
        Sun, 26 Jul 2026 10:43:48 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c63bd3sm41576093f8f.27.2026.07.26.10.43.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 10:43:47 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 26 Jul 2026 19:43:34 +0200
Subject: [PATCH 1/8] arm64: dts: exynos: Move 'status' to the end to match
 coding style
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260726-b4-dts-coding-style-strict-v1-1-e9e3e9879d05@oss.qualcomm.com>
References: <20260726-b4-dts-coding-style-strict-v1-0-e9e3e9879d05@oss.qualcomm.com>
In-Reply-To: <20260726-b4-dts-coding-style-strict-v1-0-e9e3e9879d05@oss.qualcomm.com>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-fsd@tesla.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=99455;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=W9Wxw2zYUetcaHsXEbXm4eyLZjZ9yLjiP5YoCjeOx50=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqZkdIOOSlVOCL4elx1kNuoy9IZLlYtnoODdIR1
 RKIC0/hrN2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCamZHSAAKCRDBN2bmhouD
 16UTD/9j44VCG36kGQSAzCxREgSLzZTKiapCcICJE5H1lWaKO3sZvJm5oZc5Zwl7mEmFd5YPMwX
 LJ8IrExb9x64hpEP/PwFY8qiYaN/Y2K4sJufGh+gZ4i+7sn/kzHCuY93A/7ud2H2P7UF5Y7gteg
 ux9VAYcrpQYqQMUw+EKJZbUHlCFuG6Z2AiHJtzsCnH5er/XCookSlo7ZptdoQnTWNJQ3zsBKunM
 9GoYaxutGM/iPw+5vrQN5f8NOL6EoUxsa4uMs2/ySGbJYrtAuzZBv+TKmvbrVQyhuHyn2hSkxlh
 mx1CpZSI9HDxIoEbilior6qWQW+S2vEkUmTpblNWa1VvcTK67//F+QvRNEwc5iw6gYVLIsP/faN
 e1/oXhVxehjgqenYpV/Eipd7z04WYq6Ypj3ybSc1OM1p+yAg6FzowhNsRT1D3zxW89f5g+65yzY
 /OVoeGH/06/7RJhXgI9/tYx+r/aLyV0gYSfrWHaZLAUUMUKZIi8N2YULfZ8fjMFmtNIM2EPFqcv
 Mtl5D6/zz9p22gXi9nUenx/hS7BLq12EzBymvBhW+DzYqlmL4IzDCdMew3YAN0XJC1ibTrsuyHO
 7TfoE8UiLFvrG5p+JiCgDu/RrA9SMXiud/EsNKIrf27r31mOFBgNbMHrr7Vmrywlktn5uKrTLvt
 IpvAm0ZBqls11rQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI2MDE3OSBTYWx0ZWRfX2tnE0FkBuicv
 rLjLJZdHHZbbTvWwxRhzJJZMrIiNd5KYNTQAK2kauK4ClxGbOQjaReNiiVXuL3dsepVodCDQQnI
 qM3mCMyQ5c4v6souG0+uEljQeYDQHDki1ZdaR0g069p6ksSThmj26HFLU0iixTOxeydJokFDn3Y
 2yfng2kNFwZW9oiwnC30AWwj6T/FcIAv2pxB+BRNq3pXPag0E6kvdiD41GzoQg49CDF6jY7yldm
 ZT1jOQ3Sm6lsgGz1Wgtwusn01Moq90+j1CwK0cduXIzLNUide680FgP8LgIpvTsqJ0mZLULnkcb
 yUOYHR9mS+D6gdQyfamwofAuf8qX+RIASQvoByOYzYAeZV8qhu0Ty2zpZtM6JmS4IRv6jh8HFmH
 k2Rc6QXCBqAFw4TdOQGj4rk1Ewc/V0aR2Utv2WQXrMaUWCDiqiWe3VWEvQz6rkrPQ5gKphKiD9b
 bgxR+nYhJ46tRlyUsNw==
X-Proofpoint-GUID: -jR18ArecJYZXd8ZVrpuvHE625pES05Y
X-Authority-Analysis: v=2.4 cv=DNG/JSNb c=1 sm=1 tr=0 ts=6a664757 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=8jNLXOhXhhqaJn2Z-bsA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI2MDE3OSBTYWx0ZWRfXz6cLtaqCNGbk
 0u4ejGBu8ZftNfPFLdHL1hMZSRAh6z4AVdbOzZnNqgad/97q4gjbL0hyZCTGa2tBuyprrsEvymt
 krLdsFhAoMpFzSNrX5E7FZeH5nDEPjs=
X-Proofpoint-ORIG-GUID: -jR18ArecJYZXd8ZVrpuvHE625pES05Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-26_05,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1011 malwarescore=0 bulkscore=0 adultscore=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607260179

'status' property is special, thus DTS coding style expects it to be
always the last property preceded with a blank line, as reported by
dt-check-style:

  [property-order] property 'iommus' out of canonical order (should sort before 'status')
  [required-blank-lines] "status" must be preceded by a blank line

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/exynos/exynos2200-g0s.dts      |  2 +
 arch/arm64/boot/dts/exynos/exynos2200.dtsi         | 98 ++++++++++++++++++++++
 arch/arm64/boot/dts/exynos/exynos5433-bus.dtsi     | 10 +++
 .../boot/dts/exynos/exynos5433-tm2-common.dtsi     | 47 +++++++++--
 arch/arm64/boot/dts/exynos/exynos5433.dtsi         | 56 ++++++++++++-
 arch/arm64/boot/dts/exynos/exynos7-espresso.dts    | 10 ++-
 arch/arm64/boot/dts/exynos/exynos7.dtsi            | 24 ++++++
 .../boot/dts/exynos/exynos7885-jackpotlte.dts      |  3 +-
 arch/arm64/boot/dts/exynos/exynos7885.dtsi         | 12 +++
 arch/arm64/boot/dts/exynos/exynos850-e850-96.dts   | 13 ++-
 arch/arm64/boot/dts/exynos/exynos850.dtsi          | 31 +++++++
 arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dts |  1 +
 arch/arm64/boot/dts/exynos/exynos8895.dtsi         | 47 +++++++++++
 arch/arm64/boot/dts/exynos/exynos990-c1s.dts       |  3 +-
 arch/arm64/boot/dts/exynos/exynos990-r8s.dts       |  3 +-
 .../boot/dts/exynos/exynos990-x1s-common.dtsi      |  3 +-
 arch/arm64/boot/dts/exynos/exynos990.dtsi          |  2 +
 arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts   |  9 +-
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi       | 77 +++++++++++++++++
 arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts |  2 +
 arch/arm64/boot/dts/exynos/exynosautov920.dtsi     | 57 +++++++++++++
 21 files changed, 486 insertions(+), 24 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos2200-g0s.dts b/arch/arm64/boot/dts/exynos/exynos2200-g0s.dts
index 0e348c5cf7df..458f1bc6f5d0 100644
--- a/arch/arm64/boot/dts/exynos/exynos2200-g0s.dts
+++ b/arch/arm64/boot/dts/exynos/exynos2200-g0s.dts
@@ -143,6 +143,7 @@ &usb {
 	/* TODO: Replace these once PMIC is implemented  */
 	vdd10-supply = <&reg_dummy>;
 	vdd33-supply = <&reg_dummy>;
+
 	status = "okay";
 };
 
@@ -161,6 +162,7 @@ &usb_hsphy {
 	/* TODO: Replace these once PMIC is implemented  */
 	vdda12-supply = <&reg_dummy>;
 	vdd-supply = <&reg_dummy>;
+
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/exynos/exynos2200.dtsi b/arch/arm64/boot/dts/exynos/exynos2200.dtsi
index 59662f9bdb98..b1c134f22324 100644
--- a/arch/arm64/boot/dts/exynos/exynos2200.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos2200.dtsi
@@ -266,6 +266,7 @@ mct_peris: timer@10040000 {
 				     <GIC_SPI 952 IRQ_TYPE_LEVEL_HIGH 0>,
 				     <GIC_SPI 953 IRQ_TYPE_LEVEL_HIGH 0>,
 				     <GIC_SPI 954 IRQ_TYPE_LEVEL_HIGH 0>;
+
 			status = "disabled";
 		};
 
@@ -326,6 +327,7 @@ usi4: usi@105000c0 {
 				 <&cmu_peric0 CLK_DOUT_PERIC0_USI04>;
 			clock-names = "pclk", "ipclk";
 			samsung,sysreg = <&syscon_peric0 0x1024>;
+
 			status = "disabled";
 
 			hsi2c_8: i2c@10500000 {
@@ -340,6 +342,7 @@ hsi2c_8: i2c@10500000 {
 				interrupts = <GIC_SPI 673 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-0 = <&hsi2c8_bus>;
 				pinctrl-names = "default";
+
 				status = "disabled";
 			};
 
@@ -353,6 +356,7 @@ serial_6: serial@10500000 {
 				pinctrl-0 = <&uart6_bus_single>;
 				pinctrl-names = "default";
 				samsung,uart-fifosize = <64>;
+
 				status = "disabled";
 			};
 		};
@@ -368,6 +372,7 @@ usi4_i2c: usi@105100c0 {
 			clock-names = "pclk", "ipclk";
 			samsung,mode = <USI_MODE_I2C>;
 			samsung,sysreg = <&syscon_peric0 0x1024>;
+
 			status = "disabled";
 
 			hsi2c_9: i2c@10510000 {
@@ -382,6 +387,7 @@ hsi2c_9: i2c@10510000 {
 				interrupts = <GIC_SPI 672 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-0 = <&hsi2c9_bus>;
 				pinctrl-names = "default";
+
 				status = "disabled";
 			};
 		};
@@ -418,6 +424,7 @@ usi7: usi@109000c0 {
 				 <&cmu_peric1 CLK_DOUT_PERIC1_USI07>;
 			clock-names = "pclk", "ipclk";
 			samsung,sysreg = <&syscon_peric1 0x2030>;
+
 			status = "disabled";
 
 			hsi2c_14: i2c@10900000 {
@@ -432,6 +439,7 @@ hsi2c_14: i2c@10900000 {
 				interrupts = <GIC_SPI 680 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-0 = <&hsi2c14_bus>;
 				pinctrl-names = "default";
+
 				status = "disabled";
 			};
 
@@ -445,6 +453,7 @@ serial_9: serial@10900000 {
 				pinctrl-0 = <&uart9_bus_single>;
 				pinctrl-names = "default";
 				samsung,uart-fifosize = <64>;
+
 				status = "disabled";
 			};
 		};
@@ -460,6 +469,7 @@ usi7_i2c: usi@109100c0 {
 			clock-names = "pclk", "ipclk";
 			samsung,mode = <USI_MODE_I2C>;
 			samsung,sysreg = <&syscon_peric1 0x2034>;
+
 			status = "disabled";
 
 			hsi2c_15: i2c@10910000 {
@@ -474,6 +484,7 @@ hsi2c_15: i2c@10910000 {
 				interrupts = <GIC_SPI 679 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-0 = <&hsi2c15_bus>;
 				pinctrl-names = "default";
+
 				status = "disabled";
 			};
 		};
@@ -488,6 +499,7 @@ usi8: usi@109200c0 {
 				 <&cmu_peric1 CLK_DOUT_PERIC1_USI08>;
 			clock-names = "pclk", "ipclk";
 			samsung,sysreg = <&syscon_peric1 0x2038>;
+
 			status = "disabled";
 
 			hsi2c_16: i2c@10920000 {
@@ -502,6 +514,7 @@ hsi2c_16: i2c@10920000 {
 				interrupts = <GIC_SPI 682 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-0 = <&hsi2c16_bus>;
 				pinctrl-names = "default";
+
 				status = "disabled";
 			};
 
@@ -515,6 +528,7 @@ serial_10: serial@10920000 {
 				pinctrl-0 = <&uart10_bus_single>;
 				pinctrl-names = "default";
 				samsung,uart-fifosize = <64>;
+
 				status = "disabled";
 			};
 		};
@@ -530,6 +544,7 @@ usi8_i2c: usi@109300c0 {
 			clock-names = "pclk", "ipclk";
 			samsung,mode = <USI_MODE_I2C>;
 			samsung,sysreg = <&syscon_peric1 0x203c>;
+
 			status = "disabled";
 
 			hsi2c_17: i2c@10930000 {
@@ -544,6 +559,7 @@ hsi2c_17: i2c@10930000 {
 				interrupts = <GIC_SPI 681 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-0 = <&hsi2c17_bus>;
 				pinctrl-names = "default";
+
 				status = "disabled";
 			};
 		};
@@ -558,6 +574,7 @@ usi9: usi@109400c0 {
 				 <&cmu_peric1 CLK_DOUT_PERIC1_USI09>;
 			clock-names = "pclk", "ipclk";
 			samsung,sysreg = <&syscon_peric1 0x2040>;
+
 			status = "disabled";
 
 			hsi2c_18: i2c@10940000 {
@@ -572,6 +589,7 @@ hsi2c_18: i2c@10940000 {
 				interrupts = <GIC_SPI 684 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-0 = <&hsi2c18_bus>;
 				pinctrl-names = "default";
+
 				status = "disabled";
 			};
 
@@ -585,6 +603,7 @@ serial_11: serial@10940000 {
 				pinctrl-0 = <&uart11_bus_single>;
 				pinctrl-names = "default";
 				samsung,uart-fifosize = <64>;
+
 				status = "disabled";
 			};
 		};
@@ -600,6 +619,7 @@ usi9_i2c: usi@109500c0 {
 			clock-names = "pclk", "ipclk";
 			samsung,mode = <USI_MODE_I2C>;
 			samsung,sysreg = <&syscon_peric1 0x2044>;
+
 			status = "disabled";
 
 			hsi2c_19: i2c@10950000 {
@@ -614,6 +634,7 @@ hsi2c_19: i2c@10950000 {
 				interrupts = <GIC_SPI 683 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-0 = <&hsi2c19_bus>;
 				pinctrl-names = "default";
+
 				status = "disabled";
 			};
 		};
@@ -628,6 +649,7 @@ usi10: usi@109600c0 {
 				 <&cmu_peric1 CLK_DOUT_PERIC1_USI10>;
 			clock-names = "pclk", "ipclk";
 			samsung,sysreg = <&syscon_peric1 0x2048>;
+
 			status = "disabled";
 
 			hsi2c_20: i2c@10960000 {
@@ -642,6 +664,7 @@ hsi2c_20: i2c@10960000 {
 				interrupts = <GIC_SPI 686 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-0 = <&hsi2c20_bus>;
 				pinctrl-names = "default";
+
 				status = "disabled";
 			};
 
@@ -655,6 +678,7 @@ serial_12: serial@10960000 {
 				pinctrl-0 = <&uart12_bus_single>;
 				pinctrl-names = "default";
 				samsung,uart-fifosize = <64>;
+
 				status = "disabled";
 			};
 		};
@@ -670,6 +694,7 @@ usi10_i2c: usi@109700c0 {
 			clock-names = "pclk", "ipclk";
 			samsung,mode = <USI_MODE_I2C>;
 			samsung,sysreg = <&syscon_peric1 0x204c>;
+
 			status = "disabled";
 
 			hsi2c_21: i2c@10970000 {
@@ -684,6 +709,7 @@ hsi2c_21: i2c@10970000 {
 				interrupts = <GIC_SPI 685 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-0 = <&hsi2c21_bus>;
 				pinctrl-names = "default";
+
 				status = "disabled";
 			};
 
@@ -821,6 +847,7 @@ usi0: usi@11d000c0 {
 				 <&cmu_peric2 CLK_DOUT_PERIC2_USI00>;
 			clock-names = "pclk", "ipclk";
 			samsung,sysreg = <&syscon_peric2 0x2000>;
+
 			status = "disabled";
 
 			hsi2c_0: i2c@11d00000 {
@@ -835,6 +862,7 @@ hsi2c_0: i2c@11d00000 {
 				interrupts = <GIC_SPI 704 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-0 = <&hsi2c0_bus>;
 				pinctrl-names = "default";
+
 				status = "disabled";
 			};
 
@@ -848,6 +876,7 @@ serial_2: serial@11d00000 {
 				pinctrl-0 = <&uart2_bus_single>;
 				pinctrl-names = "default";
 				samsung,uart-fifosize = <64>;
+
 				status = "disabled";
 			};
 		};
@@ -863,6 +892,7 @@ usi0_i2c: usi@11d100c0 {
 			clock-names = "pclk", "ipclk";
 			samsung,mode = <USI_MODE_I2C>;
 			samsung,sysreg = <&syscon_peric2 0x2004>;
+
 			status = "disabled";
 
 			hsi2c_1: i2c@11d10000 {
@@ -877,6 +907,7 @@ hsi2c_1: i2c@11d10000 {
 				interrupts = <GIC_SPI 703 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-0 = <&hsi2c1_bus>;
 				pinctrl-names = "default";
+
 				status = "disabled";
 			};
 		};
@@ -891,6 +922,7 @@ usi1: usi@11d200c0 {
 				 <&cmu_peric2 CLK_DOUT_PERIC2_USI01>;
 			clock-names = "pclk", "ipclk";
 			samsung,sysreg = <&syscon_peric2 0x2008>;
+
 			status = "disabled";
 
 			hsi2c_2: i2c@11d20000 {
@@ -905,6 +937,7 @@ hsi2c_2: i2c@11d20000 {
 				interrupts = <GIC_SPI 706 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-0 = <&hsi2c2_bus>;
 				pinctrl-names = "default";
+
 				status = "disabled";
 			};
 
@@ -918,6 +951,7 @@ serial_3: serial@11d20000 {
 				pinctrl-0 = <&uart3_bus_single>;
 				pinctrl-names = "default";
 				samsung,uart-fifosize = <64>;
+
 				status = "disabled";
 			};
 		};
@@ -933,6 +967,7 @@ usi1_i2c: usi@11d300c0 {
 			clock-names = "pclk", "ipclk";
 			samsung,mode = <USI_MODE_I2C>;
 			samsung,sysreg = <&syscon_peric2 0x200c>;
+
 			status = "disabled";
 
 			hsi2c_3: i2c@11d30000 {
@@ -947,6 +982,7 @@ hsi2c_3: i2c@11d30000 {
 				interrupts = <GIC_SPI 705 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-0 = <&hsi2c3_bus>;
 				pinctrl-names = "default";
+
 				status = "disabled";
 			};
 		};
@@ -961,6 +997,7 @@ usi2: usi@11d400c0 {
 				 <&cmu_peric2 CLK_DOUT_PERIC2_USI02>;
 			clock-names = "pclk", "ipclk";
 			samsung,sysreg = <&syscon_peric2 0x2010>;
+
 			status = "disabled";
 
 			hsi2c_4: i2c@11d40000 {
@@ -975,6 +1012,7 @@ hsi2c_4: i2c@11d40000 {
 				interrupts = <GIC_SPI 708 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-0 = <&hsi2c4_bus>;
 				pinctrl-names = "default";
+
 				status = "disabled";
 			};
 
@@ -988,6 +1026,7 @@ serial_4: serial@11d40000 {
 				pinctrl-0 = <&uart4_bus_single>;
 				pinctrl-names = "default";
 				samsung,uart-fifosize = <256>;
+
 				status = "disabled";
 			};
 		};
@@ -1003,6 +1042,7 @@ usi2_i2c: usi@11d500c0 {
 			clock-names = "pclk", "ipclk";
 			samsung,mode = <USI_MODE_I2C>;
 			samsung,sysreg = <&syscon_peric2 0x2014>;
+
 			status = "disabled";
 
 			hsi2c_5: i2c@11d50000 {
@@ -1017,6 +1057,7 @@ hsi2c_5: i2c@11d50000 {
 				interrupts = <GIC_SPI 707 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-0 = <&hsi2c5_bus>;
 				pinctrl-names = "default";
+
 				status = "disabled";
 			};
 		};
@@ -1031,6 +1072,7 @@ usi3: usi@11d600c0 {
 				 <&cmu_peric2 CLK_DOUT_PERIC2_USI03>;
 			clock-names = "pclk", "ipclk";
 			samsung,sysreg = <&syscon_peric2 0x2018>;
+
 			status = "disabled";
 
 			hsi2c_6: i2c@11d60000 {
@@ -1045,6 +1087,7 @@ hsi2c_6: i2c@11d60000 {
 				interrupts = <GIC_SPI 710 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-0 = <&hsi2c6_bus>;
 				pinctrl-names = "default";
+
 				status = "disabled";
 			};
 
@@ -1058,6 +1101,7 @@ serial_5: serial@11d60000 {
 				pinctrl-0 = <&uart5_bus_single>;
 				pinctrl-names = "default";
 				samsung,uart-fifosize = <256>;
+
 				status = "disabled";
 			};
 		};
@@ -1073,6 +1117,7 @@ usi3_i2c: usi@11d700c0 {
 			clock-names = "pclk", "ipclk";
 			samsung,mode = <USI_MODE_I2C>;
 			samsung,sysreg = <&syscon_peric2 0x201c>;
+
 			status = "disabled";
 
 			hsi2c_7: i2c@11d70000 {
@@ -1087,6 +1132,7 @@ hsi2c_7: i2c@11d70000 {
 				interrupts = <GIC_SPI 709 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-0 = <&hsi2c7_bus>;
 				pinctrl-names = "default";
+
 				status = "disabled";
 			};
 		};
@@ -1102,6 +1148,7 @@ usi5_i2c: usi@11d800c0 {
 			clock-names = "pclk", "ipclk";
 			samsung,mode = <USI_MODE_I2C>;
 			samsung,sysreg = <&syscon_peric2 0x102c>;
+
 			status = "disabled";
 
 			hsi2c_11: i2c@11d80000 {
@@ -1116,6 +1163,7 @@ hsi2c_11: i2c@11d80000 {
 				interrupts = <GIC_SPI 711 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-0 = <&hsi2c11_bus>;
 				pinctrl-names = "default";
+
 				status = "disabled";
 			};
 		};
@@ -1131,6 +1179,7 @@ usi6_i2c: usi@11d900c0 {
 			clock-names = "pclk", "ipclk";
 			samsung,mode = <USI_MODE_I2C>;
 			samsung,sysreg = <&syscon_peric2 0x1004>;
+
 			status = "disabled";
 
 			hsi2c_13: i2c@11d90000 {
@@ -1145,6 +1194,7 @@ hsi2c_13: i2c@11d90000 {
 				interrupts = <GIC_SPI 713 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-0 = <&hsi2c13_bus>;
 				pinctrl-names = "default";
+
 				status = "disabled";
 			};
 		};
@@ -1159,6 +1209,7 @@ usi11: usi@11da00c0 {
 				 <&cmu_peric2 CLK_DOUT_PERIC2_USI11>;
 			clock-names = "pclk", "ipclk";
 			samsung,sysreg = <&syscon_peric2 0x1058>;
+
 			status = "disabled";
 
 			hsi2c_22: i2c@11da0000 {
@@ -1173,6 +1224,7 @@ hsi2c_22: i2c@11da0000 {
 				interrupts = <GIC_SPI 716 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-0 = <&hsi2c22_bus>;
 				pinctrl-names = "default";
+
 				status = "disabled";
 			};
 
@@ -1186,6 +1238,7 @@ serial_13: serial@11da0000 {
 				pinctrl-0 = <&uart13_bus_single>;
 				pinctrl-names = "default";
 				samsung,uart-fifosize = <64>;
+
 				status = "disabled";
 			};
 		};
@@ -1201,6 +1254,7 @@ usi11_i2c: usi@11db00c0 {
 			clock-names = "pclk", "ipclk";
 			samsung,mode = <USI_MODE_I2C>;
 			samsung,sysreg = <&syscon_peric2 0x105c>;
+
 			status = "disabled";
 
 			hsi2c_23: i2c@11db0000 {
@@ -1215,6 +1269,7 @@ hsi2c_23: i2c@11db0000 {
 				interrupts = <GIC_SPI 715 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-0 = <&hsi2c23_bus>;
 				pinctrl-names = "default";
+
 				status = "disabled";
 			};
 		};
@@ -1229,6 +1284,7 @@ usi5: usi@11dd00c0 {
 				 <&cmu_peric2 CLK_DOUT_PERIC2_USI05>;
 			clock-names = "pclk", "ipclk";
 			samsung,sysreg = <&syscon_peric2 0x117c>;
+
 			status = "disabled";
 
 			hsi2c_10: i2c@11dd0000 {
@@ -1243,6 +1299,7 @@ hsi2c_10: i2c@11dd0000 {
 				interrupts = <GIC_SPI 538 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-0 = <&hsi2c10_bus>;
 				pinctrl-names = "default";
+
 				status = "disabled";
 			};
 
@@ -1256,6 +1313,7 @@ serial_7: serial@11dd0000 {
 				pinctrl-0 = <&uart7_bus_single>;
 				pinctrl-names = "default";
 				samsung,uart-fifosize = <256>;
+
 				status = "disabled";
 			};
 		};
@@ -1270,6 +1328,7 @@ usi6: usi@11de00c0 {
 				 <&cmu_peric2 CLK_DOUT_PERIC2_USI06>;
 			clock-names = "pclk", "ipclk";
 			samsung,sysreg = <&syscon_peric2 0x1180>;
+
 			status = "disabled";
 
 			hsi2c_12: i2c@11de0000 {
@@ -1284,6 +1343,7 @@ hsi2c_12: i2c@11de0000 {
 				interrupts = <GIC_SPI 539 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-0 = <&hsi2c12_bus>;
 				pinctrl-names = "default";
+
 				status = "disabled";
 			};
 
@@ -1297,6 +1357,7 @@ serial_8: serial@11de0000 {
 				pinctrl-0 = <&uart8_bus_single>;
 				pinctrl-names = "default";
 				samsung,uart-fifosize = <64>;
+
 				status = "disabled";
 			};
 		};
@@ -1338,6 +1399,7 @@ usi_cmgp0: usi@14f000c0 {
 				 <&cmu_cmgp CLK_DOUT_CMGP_USI0>;
 			clock-names = "pclk", "ipclk";
 			samsung,sysreg = <&syscon_cmgp 0x2000>;
+
 			status = "disabled";
 
 			hsi2c_24: i2c@14f00000 {
@@ -1352,6 +1414,7 @@ hsi2c_24: i2c@14f00000 {
 				interrupts = <GIC_SPI 175 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-0 = <&hsi2c24_bus>;
 				pinctrl-names = "default";
+
 				status = "disabled";
 			};
 
@@ -1365,6 +1428,7 @@ serial_14: serial@14f00000 {
 				pinctrl-0 = <&uart14_bus_single>;
 				pinctrl-names = "default";
 				samsung,uart-fifosize = <64>;
+
 				status = "disabled";
 			};
 		};
@@ -1380,6 +1444,7 @@ usi_i2c_cmgp0: usi@14f100c0 {
 			clock-names = "pclk", "ipclk";
 			samsung,mode = <USI_MODE_I2C>;
 			samsung,sysreg = <&syscon_cmgp 0x2070>;
+
 			status = "disabled";
 
 			hsi2c_25: i2c@14f10000 {
@@ -1394,6 +1459,7 @@ hsi2c_25: i2c@14f10000 {
 				interrupts = <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-0 = <&hsi2c25_bus>;
 				pinctrl-names = "default";
+
 				status = "disabled";
 			};
 		};
@@ -1408,6 +1474,7 @@ usi_cmgp1: usi@14f200c0 {
 				 <&cmu_cmgp CLK_DOUT_CMGP_USI1>;
 			clock-names = "pclk", "ipclk";
 			samsung,sysreg = <&syscon_cmgp 0x2010>;
+
 			status = "disabled";
 
 			hsi2c_26: i2c@14f20000 {
@@ -1422,6 +1489,7 @@ hsi2c_26: i2c@14f20000 {
 				interrupts = <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-0 = <&hsi2c26_bus>;
 				pinctrl-names = "default";
+
 				status = "disabled";
 			};
 
@@ -1435,6 +1503,7 @@ serial_15: serial@14f20000 {
 				pinctrl-0 = <&uart15_bus_single>;
 				pinctrl-names = "default";
 				samsung,uart-fifosize = <64>;
+
 				status = "disabled";
 			};
 		};
@@ -1450,6 +1519,7 @@ usi_i2c_cmgp1: usi@14f300c0 {
 			clock-names = "pclk", "ipclk";
 			samsung,mode = <USI_MODE_I2C>;
 			samsung,sysreg = <&syscon_cmgp 0x2074>;
+
 			status = "disabled";
 
 			hsi2c_27: i2c@14f30000 {
@@ -1464,6 +1534,7 @@ hsi2c_27: i2c@14f30000 {
 				interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-0 = <&hsi2c27_bus>;
 				pinctrl-names = "default";
+
 				status = "disabled";
 			};
 		};
@@ -1478,6 +1549,7 @@ usi_cmgp2: usi@14f400c0 {
 				 <&cmu_cmgp CLK_DOUT_CMGP_USI2>;
 			clock-names = "pclk", "ipclk";
 			samsung,sysreg = <&syscon_cmgp 0x2020>;
+
 			status = "disabled";
 
 			hsi2c_28: i2c@14f40000 {
@@ -1492,6 +1564,7 @@ hsi2c_28: i2c@14f40000 {
 				interrupts = <GIC_SPI 177 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-0 = <&hsi2c28_bus>;
 				pinctrl-names = "default";
+
 				status = "disabled";
 			};
 
@@ -1505,6 +1578,7 @@ serial_16: serial@14f40000 {
 				pinctrl-0 = <&uart16_bus_single>;
 				pinctrl-names = "default";
 				samsung,uart-fifosize = <64>;
+
 				status = "disabled";
 			};
 		};
@@ -1520,6 +1594,7 @@ usi_i2c_cmgp2: usi@14f500c0 {
 			clock-names = "pclk", "ipclk";
 			samsung,mode = <USI_MODE_I2C>;
 			samsung,sysreg = <&syscon_cmgp 0x2024>;
+
 			status = "disabled";
 
 			hsi2c_29: i2c@14f50000 {
@@ -1534,6 +1609,7 @@ hsi2c_29: i2c@14f50000 {
 				interrupts = <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-0 = <&hsi2c29_bus>;
 				pinctrl-names = "default";
+
 				status = "disabled";
 			};
 		};
@@ -1548,6 +1624,7 @@ usi_cmgp3: usi@14f600c0 {
 				 <&cmu_cmgp CLK_DOUT_CMGP_USI3>;
 			clock-names = "pclk", "ipclk";
 			samsung,sysreg = <&syscon_cmgp 0x2030>;
+
 			status = "disabled";
 
 			hsi2c_30: i2c@14f60000 {
@@ -1562,6 +1639,7 @@ hsi2c_30: i2c@14f60000 {
 				interrupts = <GIC_SPI 178 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-0 = <&hsi2c30_bus>;
 				pinctrl-names = "default";
+
 				status = "disabled";
 			};
 
@@ -1575,6 +1653,7 @@ serial_17: serial@14f60000 {
 				pinctrl-0 = <&uart17_bus_single>;
 				pinctrl-names = "default";
 				samsung,uart-fifosize = <64>;
+
 				status = "disabled";
 			};
 		};
@@ -1590,6 +1669,7 @@ usi_i2c_cmgp3: usi@14f700c0 {
 			clock-names = "pclk", "ipclk";
 			samsung,mode = <USI_MODE_I2C>;
 			samsung,sysreg = <&syscon_cmgp 0x2034>;
+
 			status = "disabled";
 
 			hsi2c_31: i2c@14f70000 {
@@ -1604,6 +1684,7 @@ hsi2c_31: i2c@14f70000 {
 				interrupts = <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-0 = <&hsi2c31_bus>;
 				pinctrl-names = "default";
+
 				status = "disabled";
 			};
 		};
@@ -1618,6 +1699,7 @@ usi_cmgp4: usi@14f800c0 {
 				 <&cmu_cmgp CLK_DOUT_CMGP_USI4>;
 			clock-names = "pclk", "ipclk";
 			samsung,sysreg = <&syscon_cmgp 0x2040>;
+
 			status = "disabled";
 
 			hsi2c_32: i2c@14f80000 {
@@ -1632,6 +1714,7 @@ hsi2c_32: i2c@14f80000 {
 				interrupts = <GIC_SPI 179 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-0 = <&hsi2c32_bus>;
 				pinctrl-names = "default";
+
 				status = "disabled";
 			};
 
@@ -1645,6 +1728,7 @@ serial_18: serial@14f80000 {
 				pinctrl-0 = <&uart18_bus_single>;
 				pinctrl-names = "default";
 				samsung,uart-fifosize = <64>;
+
 				status = "disabled";
 			};
 		};
@@ -1660,6 +1744,7 @@ usi_i2c_cmgp4: usi@14f900c0 {
 			clock-names = "pclk", "ipclk";
 			samsung,mode = <USI_MODE_I2C>;
 			samsung,sysreg = <&syscon_cmgp 0x2044>;
+
 			status = "disabled";
 
 			hsi2c_33: i2c@14f90000 {
@@ -1674,6 +1759,7 @@ hsi2c_33: i2c@14f90000 {
 				interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-0 = <&hsi2c33_bus>;
 				pinctrl-names = "default";
+
 				status = "disabled";
 			};
 		};
@@ -1688,6 +1774,7 @@ usi_cmgp5: usi@14fa00c0 {
 				 <&cmu_cmgp CLK_DOUT_CMGP_USI5>;
 			clock-names = "pclk", "ipclk";
 			samsung,sysreg = <&syscon_cmgp 0x2050>;
+
 			status = "disabled";
 
 			hsi2c_34: i2c@14fa0000 {
@@ -1702,6 +1789,7 @@ hsi2c_34: i2c@14fa0000 {
 				interrupts = <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-0 = <&hsi2c34_bus>;
 				pinctrl-names = "default";
+
 				status = "disabled";
 			};
 
@@ -1715,6 +1803,7 @@ serial_19: serial@14fa0000 {
 				pinctrl-0 = <&uart19_bus_single>;
 				pinctrl-names = "default";
 				samsung,uart-fifosize = <64>;
+
 				status = "disabled";
 			};
 		};
@@ -1730,6 +1819,7 @@ usi_i2c_cmgp5: usi@14fb00c0 {
 			clock-names = "pclk", "ipclk";
 			samsung,mode = <USI_MODE_I2C>;
 			samsung,sysreg = <&syscon_cmgp 0x2054>;
+
 			status = "disabled";
 
 			hsi2c_35: i2c@14fb0000 {
@@ -1744,6 +1834,7 @@ hsi2c_35: i2c@14fb0000 {
 				interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-0 = <&hsi2c35_bus>;
 				pinctrl-names = "default";
+
 				status = "disabled";
 			};
 		};
@@ -1758,6 +1849,7 @@ usi_cmgp6: usi@14fc00c0 {
 				 <&cmu_cmgp CLK_DOUT_CMGP_USI6>;
 			clock-names = "pclk", "ipclk";
 			samsung,sysreg = <&syscon_cmgp 0x2060>;
+
 			status = "disabled";
 
 			hsi2c_36: i2c@14fc0000 {
@@ -1772,6 +1864,7 @@ hsi2c_36: i2c@14fc0000 {
 				interrupts = <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-0 = <&hsi2c36_bus>;
 				pinctrl-names = "default";
+
 				status = "disabled";
 			};
 
@@ -1785,6 +1878,7 @@ serial_20: serial@14fc0000 {
 				pinctrl-0 = <&uart20_bus_single>;
 				pinctrl-names = "default";
 				samsung,uart-fifosize = <64>;
+
 				status = "disabled";
 			};
 		};
@@ -1800,6 +1894,7 @@ usi_i2c_cmgp6: usi@14fd00c0 {
 			clock-names = "pclk", "ipclk";
 			samsung,mode = <USI_MODE_I2C>;
 			samsung,sysreg = <&syscon_cmgp 0x2064>;
+
 			status = "disabled";
 
 			hsi2c_37: i2c@14fd0000 {
@@ -1814,6 +1909,7 @@ hsi2c_37: i2c@14fd0000 {
 				interrupts = <GIC_SPI 171 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-0 = <&hsi2c37_bus>;
 				pinctrl-names = "default";
+
 				status = "disabled";
 			};
 		};
@@ -1829,6 +1925,7 @@ usi_i2c_cmgp7: usi@14fe00c0 {
 			clock-names = "pclk", "ipclk";
 			samsung,mode = <USI_MODE_I2C>;
 			samsung,sysreg = <&syscon_cmgp 0x2080>;
+
 			status = "disabled";
 
 			hsi2c_38: i2c@14fe0000 {
@@ -1843,6 +1940,7 @@ hsi2c_38: i2c@14fe0000 {
 				interrupts = <GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-0 = <&hsi2c38_bus>;
 				pinctrl-names = "default";
+
 				status = "disabled";
 			};
 		};
diff --git a/arch/arm64/boot/dts/exynos/exynos5433-bus.dtsi b/arch/arm64/boot/dts/exynos/exynos5433-bus.dtsi
index 540b4d6c9067..0c200df9996f 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433-bus.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433-bus.dtsi
@@ -12,6 +12,7 @@ bus_g2d_400: bus0 {
 		clocks = <&cmu_top CLK_ACLK_G2D_400>;
 		clock-names = "bus";
 		operating-points-v2 = <&bus_g2d_400_opp_table>;
+
 		status = "disabled";
 	};
 
@@ -20,6 +21,7 @@ bus_g2d_266: bus1 {
 		clocks = <&cmu_top CLK_ACLK_G2D_266>;
 		clock-names = "bus";
 		operating-points-v2 = <&bus_g2d_266_opp_table>;
+
 		status = "disabled";
 	};
 
@@ -28,6 +30,7 @@ bus_gscl: bus2 {
 		clocks = <&cmu_top CLK_ACLK_GSCL_333>;
 		clock-names = "bus";
 		operating-points-v2 = <&bus_gscl_opp_table>;
+
 		status = "disabled";
 	};
 
@@ -36,6 +39,7 @@ bus_hevc: bus3 {
 		clocks = <&cmu_top CLK_ACLK_HEVC_400>;
 		clock-names = "bus";
 		operating-points-v2 = <&bus_hevc_opp_table>;
+
 		status = "disabled";
 	};
 
@@ -44,6 +48,7 @@ bus_jpeg: bus4 {
 		clocks = <&cmu_top CLK_SCLK_JPEG_MSCL>;
 		clock-names = "bus";
 		operating-points-v2 = <&bus_g2d_400_opp_table>;
+
 		status = "disabled";
 	};
 
@@ -52,6 +57,7 @@ bus_mfc: bus5 {
 		clocks = <&cmu_top CLK_ACLK_MFC_400>;
 		clock-names = "bus";
 		operating-points-v2 = <&bus_g2d_400_opp_table>;
+
 		status = "disabled";
 	};
 
@@ -60,6 +66,7 @@ bus_mscl: bus6 {
 		clocks = <&cmu_top CLK_ACLK_MSCL_400>;
 		clock-names = "bus";
 		operating-points-v2 = <&bus_g2d_400_opp_table>;
+
 		status = "disabled";
 	};
 
@@ -68,6 +75,7 @@ bus_noc0: bus7 {
 		clocks = <&cmu_top CLK_ACLK_BUS0_400>;
 		clock-names = "bus";
 		operating-points-v2 = <&bus_hevc_opp_table>;
+
 		status = "disabled";
 	};
 
@@ -76,6 +84,7 @@ bus_noc1: bus8 {
 		clocks = <&cmu_top CLK_ACLK_BUS1_400>;
 		clock-names = "bus";
 		operating-points-v2 = <&bus_hevc_opp_table>;
+
 		status = "disabled";
 	};
 
@@ -84,6 +93,7 @@ bus_noc2: bus9 {
 		clocks = <&cmu_mif CLK_ACLK_BUS2_400>;
 		clock-names = "bus";
 		operating-points-v2 = <&bus_noc2_opp_table>;
+
 		status = "disabled";
 	};
 
diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
index a1fb354dea9f..bc5ff66d8455 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
@@ -141,6 +141,7 @@ sound {
 
 &adc {
 	vdd-supply = <&ldo3_reg>;
+
 	status = "okay";
 
 	thermistor-ap {
@@ -173,51 +174,61 @@ &bus_g2d_400 {
 	devfreq-events = <&ppmu_event0_d0_general>, <&ppmu_event0_d1_general>;
 	vdd-supply = <&buck4_reg>;
 	exynos,saturation-ratio = <10>;
+
 	status = "okay";
 };
 
 &bus_g2d_266 {
 	devfreq = <&bus_g2d_400>;
+
 	status = "okay";
 };
 
 &bus_gscl {
 	devfreq = <&bus_g2d_400>;
+
 	status = "okay";
 };
 
 &bus_hevc {
 	devfreq = <&bus_g2d_400>;
+
 	status = "okay";
 };
 
 &bus_jpeg {
 	devfreq = <&bus_g2d_400>;
+
 	status = "okay";
 };
 
 &bus_mfc {
 	devfreq = <&bus_g2d_400>;
+
 	status = "okay";
 };
 
 &bus_mscl {
 	devfreq = <&bus_g2d_400>;
+
 	status = "okay";
 };
 
 &bus_noc0 {
 	devfreq = <&bus_g2d_400>;
+
 	status = "okay";
 };
 
 &bus_noc1 {
 	devfreq = <&bus_g2d_400>;
+
 	status = "okay";
 };
 
 &bus_noc2 {
 	devfreq = <&bus_g2d_400>;
+
 	status = "okay";
 };
 
@@ -344,7 +355,6 @@ tv_to_hdmi: endpoint {
 };
 
 &dsi {
-	status = "okay";
 	vddcore-supply = <&ldo6_reg>;
 	vddio-supply = <&ldo7_reg>;
 	samsung,burst-clock-frequency = <512000000>;
@@ -352,20 +362,24 @@ &dsi {
 	samsung,pll-clock-frequency = <24000000>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&te_irq>;
+
+	status = "okay";
 };
 
 &gpu {
 	mali-supply = <&buck6_reg>;
+
 	status = "okay";
 };
 
 &hdmi {
 	hpd-gpios = <&gpa3 0 GPIO_ACTIVE_HIGH>;
-	status = "okay";
 	vdd-supply = <&ldo6_reg>;
 	vdd_osc-supply = <&ldo7_reg>;
 	vdd_pll-supply = <&ldo6_reg>;
 
+	status = "okay";
+
 	ports {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -387,9 +401,10 @@ hdmi_to_mhl: endpoint {
 };
 
 &hsi2c_0 {
-	status = "okay";
 	clock-frequency = <2500000>;
 
+	status = "okay";
+
 	pmic@66 {
 		compatible = "samsung,s2mps13-pmic";
 		interrupt-parent = <&gpa0>;
@@ -819,9 +834,10 @@ stmfts: touchscreen@49 {
 };
 
 &hsi2c_7 {
-	status = "okay";
 	clock-frequency = <1000000>;
 
+	status = "okay";
+
 	bridge@39 {
 		reg = <0x39>;
 		compatible = "sil,sii8620";
@@ -884,6 +900,7 @@ port@0 {
 						 * Add a disabled port just to satisfy dtschema.
 						 */
 						reg = <0>;
+
 						status = "disabled";
 					};
 
@@ -945,11 +962,11 @@ &i2s0 {
 &i2s1 {
 	assigned-clocks = <&i2s1 CLK_I2S_RCLK_SRC>;
 	assigned-clock-parents = <&cmu_peric CLK_SCLK_I2S1>;
+
 	status = "okay";
 };
 
 &mshc_0 {
-	status = "okay";
 	mmc-ddr-1_8v;
 	mmc-hs200-1_8v;
 	mmc-hs400-1_8v;
@@ -968,10 +985,11 @@ &mshc_0 {
 	bus-width = <8>;
 	assigned-clocks = <&cmu_top CLK_SCLK_MMC0_FSYS>;
 	assigned-clock-rates = <800000000>;
+
+	status = "okay";
 };
 
 &mshc_2 {
-	status = "okay";
 	cap-sd-highspeed;
 	disable-wp;
 	cd-gpios = <&gpa2 4 GPIO_ACTIVE_LOW>;
@@ -983,10 +1001,11 @@ &mshc_2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&sd2_clk &sd2_cmd &sd2_bus1 &sd2_bus4>;
 	bus-width = <4>;
+
+	status = "okay";
 };
 
 &pcie {
-	status = "okay";
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie_bus &pcie_wlanen>;
 	vdd10-supply = <&ldo6_reg>;
@@ -998,6 +1017,8 @@ &pcie {
 	assigned-clock-rates = <0>, <100000000>;
 	interrupt-map-mask = <0 0 0 0>;
 	interrupt-map = <0 0 0 0 &gic GIC_SPI 245 IRQ_TYPE_LEVEL_HIGH>;
+
+	status = "okay";
 };
 
 &pcie_phy {
@@ -1006,6 +1027,7 @@ &pcie_phy {
 
 &ppmu_d0_general {
 	status = "okay";
+
 	events {
 		ppmu_event0_d0_general: ppmu-event0-d0-general {
 			event-name = "ppmu-event0-d0-general";
@@ -1015,6 +1037,7 @@ ppmu_event0_d0_general: ppmu-event0-d0-general {
 
 &ppmu_d1_general {
 	status = "okay";
+
 	events {
 		ppmu_event0_d1_general: ppmu-event0-d1-general {
 		       event-name = "ppmu-event0-d1-general";
@@ -1238,6 +1261,7 @@ initial_touch: initial-state {
 &pwm {
 	pinctrl-0 = <&pwm0_out>;
 	pinctrl-names = "default";
+
 	status = "okay";
 };
 
@@ -1270,6 +1294,7 @@ bluetooth {
 
 &spi_1 {
 	cs-gpios = <&gpd6 3 GPIO_ACTIVE_HIGH>;
+
 	status = "okay";
 
 	wm5110: audio-codec@0 {
@@ -1316,9 +1341,10 @@ controller-data {
 };
 
 &spi_3 {
-	status = "okay";
 	no-cs-readback;
 
+	status = "okay";
+
 	irled@0 {
 		compatible = "ir-spi-led";
 		reg = <0x0>;
@@ -1339,22 +1365,26 @@ &timer {
 
 &tmu_atlas0 {
 	vtmu-supply = <&ldo3_reg>;
+
 	status = "okay";
 };
 
 &tmu_apollo {
 	vtmu-supply = <&ldo3_reg>;
+
 	status = "okay";
 };
 
 &tmu_g3d {
 	vtmu-supply = <&ldo3_reg>;
+
 	status = "okay";
 };
 
 &usbdrd30 {
 	vdd33-supply = <&ldo10_reg>;
 	vdd10-supply = <&ldo6_reg>;
+
 	status = "okay";
 };
 
@@ -1364,6 +1394,7 @@ &usbdrd_dwc3 {
 
 &usbdrd30_phy {
 	vbus-supply = <&safeout1_reg>;
+
 	status = "okay";
 
 	port {
diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
index fa2029e280a5..17b13a586973 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
@@ -755,6 +755,7 @@ tmu_atlas0: tmu@10060000 {
 				<&cmu_peris CLK_SCLK_TMU0>;
 			clock-names = "tmu_apbif", "tmu_sclk";
 			#thermal-sensor-cells = <0>;
+
 			status = "disabled";
 		};
 
@@ -766,7 +767,9 @@ tmu_atlas1: tmu@10068000 {
 				<&cmu_peris CLK_SCLK_TMU0>;
 			clock-names = "tmu_apbif", "tmu_sclk";
 			#thermal-sensor-cells = <0>;
+
 			status = "disabled";
+
 		};
 
 		tmu_g3d: tmu@10070000 {
@@ -777,6 +780,7 @@ tmu_g3d: tmu@10070000 {
 				<&cmu_peris CLK_SCLK_TMU1>;
 			clock-names = "tmu_apbif", "tmu_sclk";
 			#thermal-sensor-cells = <0>;
+
 			status = "disabled";
 		};
 
@@ -788,6 +792,7 @@ tmu_apollo: tmu@10078000 {
 				<&cmu_peris CLK_SCLK_TMU1>;
 			clock-names = "tmu_apbif", "tmu_sclk";
 			#thermal-sensor-cells = <0>;
+
 			status = "disabled";
 		};
 
@@ -799,6 +804,7 @@ tmu_isp: tmu@1007c000 {
 				<&cmu_peris CLK_SCLK_TMU1>;
 			clock-names = "tmu_apbif", "tmu_sclk";
 			#thermal-sensor-cells = <0>;
+
 			status = "disabled";
 		};
 
@@ -825,24 +831,28 @@ timer@101c0000 {
 		ppmu_d0_cpu: ppmu@10480000 {
 			compatible = "samsung,exynos-ppmu-v2";
 			reg = <0x10480000 0x2000>;
+
 			status = "disabled";
 		};
 
 		ppmu_d0_general: ppmu@10490000 {
 			compatible = "samsung,exynos-ppmu-v2";
 			reg = <0x10490000 0x2000>;
+
 			status = "disabled";
 		};
 
 		ppmu_d1_cpu: ppmu@104b0000 {
 			compatible = "samsung,exynos-ppmu-v2";
 			reg = <0x104b0000 0x2000>;
+
 			status = "disabled";
 		};
 
 		ppmu_d1_general: ppmu@104c0000 {
 			compatible = "samsung,exynos-ppmu-v2";
 			reg = <0x104c0000 0x2000>;
+
 			status = "disabled";
 		};
 
@@ -972,10 +982,11 @@ decon: decon@13800000 {
 				     <GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 203 IRQ_TYPE_LEVEL_HIGH>;
 			samsung,disp-sysreg = <&syscon_disp>;
-			status = "disabled";
 			iommus = <&sysmmu_decon0x>, <&sysmmu_decon1x>;
 			iommu-names = "m0", "m1";
 
+			status = "disabled";
+
 			ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -1015,9 +1026,10 @@ decon_tv: decon@13880000 {
 			interrupts = <GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 211 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>;
-			status = "disabled";
 			iommus = <&sysmmu_tv0x>, <&sysmmu_tv1x>;
 			iommu-names = "m0", "m1";
+
+			status = "disabled";
 		};
 
 		dsi: dsi@13900000 {
@@ -1037,10 +1049,11 @@ dsi: dsi@13900000 {
 					"sclk_rgb_vclk_to_dsim0",
 					"sclk_mipi";
 			power-domains = <&pd_disp>;
-			status = "disabled";
 			#address-cells = <1>;
 			#size-cells = <0>;
 
+			status = "disabled";
+
 			ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -1062,6 +1075,7 @@ mic: mic@13930000 {
 			clock-names = "pclk_mic0", "sclk_rgb_vclk_to_mic0";
 			power-domains = <&pd_disp>;
 			samsung,disp-syscon = <&syscon_disp>;
+
 			status = "disabled";
 
 			ports {
@@ -1108,6 +1122,7 @@ hdmi: hdmi@13970000 {
 			samsung,syscon-phandle = <&pmu_system_controller>;
 			samsung,sysreg-phandle = <&syscon_disp>;
 			#sound-dai-cells = <0>;
+
 			status = "disabled";
 		};
 
@@ -1195,6 +1210,7 @@ gpu: gpu@14ac0000 {
 			clock-names = "core";
 			power-domains = <&pd_g3d>;
 			operating-points-v2 = <&gpu_opp_table>;
+
 			status = "disabled";
 
 			gpu_opp_table: opp-table {
@@ -1426,6 +1442,7 @@ serial_0: serial@14c10000 {
 			clock-names = "uart", "clk_uart_baud0";
 			pinctrl-names = "default";
 			pinctrl-0 = <&uart0_bus>;
+
 			status = "disabled";
 		};
 
@@ -1438,6 +1455,7 @@ serial_1: serial@14c20000 {
 			clock-names = "uart", "clk_uart_baud0";
 			pinctrl-names = "default";
 			pinctrl-0 = <&uart1_bus>;
+
 			status = "disabled";
 		};
 
@@ -1450,6 +1468,7 @@ serial_2: serial@14c30000 {
 			clock-names = "uart", "clk_uart_baud0";
 			pinctrl-names = "default";
 			pinctrl-0 = <&uart2_bus>;
+
 			status = "disabled";
 		};
 
@@ -1470,6 +1489,7 @@ spi_0: spi@14d20000 {
 			pinctrl-0 = <&spi0_bus>;
 			num-cs = <1>;
 			fifo-depth = <256>;
+
 			status = "disabled";
 		};
 
@@ -1490,6 +1510,7 @@ spi_1: spi@14d30000 {
 			pinctrl-0 = <&spi1_bus>;
 			num-cs = <1>;
 			fifo-depth = <64>;
+
 			status = "disabled";
 		};
 
@@ -1510,6 +1531,7 @@ spi_2: spi@14d40000 {
 			pinctrl-0 = <&spi2_bus>;
 			num-cs = <1>;
 			fifo-depth = <64>;
+
 			status = "disabled";
 		};
 
@@ -1530,6 +1552,7 @@ spi_3: spi@14d50000 {
 			pinctrl-0 = <&spi3_bus>;
 			num-cs = <1>;
 			fifo-depth = <64>;
+
 			status = "disabled";
 		};
 
@@ -1550,6 +1573,7 @@ spi_4: spi@14d00000 {
 			pinctrl-0 = <&spi4_bus>;
 			num-cs = <1>;
 			fifo-depth = <64>;
+
 			status = "disabled";
 		};
 
@@ -1560,6 +1584,7 @@ adc: adc@14d10000 {
 			clock-names = "adc";
 			clocks = <&cmu_peric CLK_PCLK_ADCIF>;
 			#io-channel-cells = <1>;
+
 			status = "disabled";
 		};
 
@@ -1575,6 +1600,7 @@ i2s1: i2s@14d60000 {
 			clock-names = "iis", "i2s_opclk0", "i2s_opclk1";
 			#clock-cells = <1>;
 			#sound-dai-cells = <1>;
+
 			status = "disabled";
 		};
 
@@ -1590,6 +1616,7 @@ pwm: pwm@14dd0000 {
 			clocks = <&cmu_peric CLK_PCLK_PWM>;
 			clock-names = "timers";
 			#pwm-cells = <3>;
+
 			status = "disabled";
 		};
 
@@ -1604,6 +1631,7 @@ hsi2c_0: i2c@14e40000 {
 			pinctrl-0 = <&hs_i2c0_bus>;
 			clocks = <&cmu_peric CLK_PCLK_HSI2C0>;
 			clock-names = "hsi2c";
+
 			status = "disabled";
 		};
 
@@ -1618,6 +1646,7 @@ hsi2c_1: i2c@14e50000 {
 			pinctrl-0 = <&hs_i2c1_bus>;
 			clocks = <&cmu_peric CLK_PCLK_HSI2C1>;
 			clock-names = "hsi2c";
+
 			status = "disabled";
 		};
 
@@ -1632,6 +1661,7 @@ hsi2c_2: i2c@14e60000 {
 			pinctrl-0 = <&hs_i2c2_bus>;
 			clocks = <&cmu_peric CLK_PCLK_HSI2C2>;
 			clock-names = "hsi2c";
+
 			status = "disabled";
 		};
 
@@ -1646,6 +1676,7 @@ hsi2c_3: i2c@14e70000 {
 			pinctrl-0 = <&hs_i2c3_bus>;
 			clocks = <&cmu_peric CLK_PCLK_HSI2C3>;
 			clock-names = "hsi2c";
+
 			status = "disabled";
 		};
 
@@ -1660,6 +1691,7 @@ hsi2c_4: i2c@14ec0000 {
 			pinctrl-0 = <&hs_i2c4_bus>;
 			clocks = <&cmu_peric CLK_PCLK_HSI2C4>;
 			clock-names = "hsi2c";
+
 			status = "disabled";
 		};
 
@@ -1674,6 +1706,7 @@ hsi2c_5: i2c@14ed0000 {
 			pinctrl-0 = <&hs_i2c5_bus>;
 			clocks = <&cmu_peric CLK_PCLK_HSI2C5>;
 			clock-names = "hsi2c";
+
 			status = "disabled";
 		};
 
@@ -1688,6 +1721,7 @@ hsi2c_6: i2c@14ee0000 {
 			pinctrl-0 = <&hs_i2c6_bus>;
 			clocks = <&cmu_peric CLK_PCLK_HSI2C6>;
 			clock-names = "hsi2c";
+
 			status = "disabled";
 		};
 
@@ -1702,6 +1736,7 @@ hsi2c_7: i2c@14ef0000 {
 			pinctrl-0 = <&hs_i2c7_bus>;
 			clocks = <&cmu_peric CLK_PCLK_HSI2C7>;
 			clock-names = "hsi2c";
+
 			status = "disabled";
 		};
 
@@ -1716,6 +1751,7 @@ hsi2c_8: i2c@14d90000 {
 			pinctrl-0 = <&hs_i2c8_bus>;
 			clocks = <&cmu_peric CLK_PCLK_HSI2C8>;
 			clock-names = "hsi2c";
+
 			status = "disabled";
 		};
 
@@ -1730,6 +1766,7 @@ hsi2c_9: i2c@14da0000 {
 			pinctrl-0 = <&hs_i2c9_bus>;
 			clocks = <&cmu_peric CLK_PCLK_HSI2C9>;
 			clock-names = "hsi2c";
+
 			status = "disabled";
 		};
 
@@ -1744,6 +1781,7 @@ hsi2c_10: i2c@14de0000 {
 			pinctrl-0 = <&hs_i2c10_bus>;
 			clocks = <&cmu_peric CLK_PCLK_HSI2C10>;
 			clock-names = "hsi2c";
+
 			status = "disabled";
 		};
 
@@ -1758,6 +1796,7 @@ hsi2c_11: i2c@14df0000 {
 			pinctrl-0 = <&hs_i2c11_bus>;
 			clocks = <&cmu_peric CLK_PCLK_HSI2C11>;
 			clock-names = "hsi2c";
+
 			status = "disabled";
 		};
 
@@ -1771,6 +1810,7 @@ usbdrd30: usb@15400000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x15400000 0x10000>;
+
 			status = "disabled";
 
 			usbdrd_dwc3: usb@0 {
@@ -1797,6 +1837,7 @@ usbdrd30_phy: phy@15500000 {
 					"itp";
 			#phy-cells = <1>;
 			samsung,pmu-syscon = <&pmu_system_controller>;
+
 			status = "disabled";
 		};
 
@@ -1811,6 +1852,7 @@ usbhost30_phy: phy@15580000 {
 					"itp";
 			#phy-cells = <1>;
 			samsung,pmu-syscon = <&pmu_system_controller>;
+
 			status = "disabled";
 		};
 
@@ -1824,6 +1866,7 @@ usbhost30: usb@15a00000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x15a00000 0x10000>;
+
 			status = "disabled";
 
 			usbhost_dwc3: usb@0 {
@@ -1850,6 +1893,7 @@ mshc_0: mmc@15540000 {
 				<&cmu_fsys CLK_SCLK_MMC0>;
 			clock-names = "biu", "ciu";
 			fifo-depth = <0x40>;
+
 			status = "disabled";
 		};
 
@@ -1864,6 +1908,7 @@ mshc_1: mmc@15550000 {
 				<&cmu_fsys CLK_SCLK_MMC1>;
 			clock-names = "biu", "ciu";
 			fifo-depth = <0x40>;
+
 			status = "disabled";
 		};
 
@@ -1878,6 +1923,7 @@ mshc_2: mmc@15560000 {
 				<&cmu_fsys CLK_SCLK_MMC2>;
 			clock-names = "biu", "ciu";
 			fifo-depth = <0x40>;
+
 			status = "disabled";
 		};
 
@@ -1937,6 +1983,7 @@ i2s0: i2s@11440000 {
 				pinctrl-0 = <&i2s0_bus>;
 				power-domains = <&pd_aud>;
 				#sound-dai-cells = <1>;
+
 				status = "disabled";
 			};
 
@@ -1950,6 +1997,7 @@ serial_3: serial@11460000 {
 				pinctrl-names = "default";
 				pinctrl-0 = <&uart_aud_bus>;
 				power-domains = <&pd_aud>;
+
 				status = "disabled";
 			};
 		};
@@ -1960,6 +2008,7 @@ pcie_phy: pcie-phy@15680000 {
 			samsung,pmu-syscon = <&pmu_system_controller>;
 			samsung,fsys-sysreg = <&syscon_fsys>;
 			#phy-cells = <0>;
+
 			status = "disabled";
 		};
 
@@ -1982,6 +2031,7 @@ pcie: pcie@15700000 {
 			phys = <&pcie_phy>;
 			ranges = <0x81000000 0 0	  0x0c001000 0 0x00010000>,
 				 <0x82000000 0 0x0c011000 0x0c011000 0 0x03feefff>;
+
 			status = "disabled";
 		};
 	};
diff --git a/arch/arm64/boot/dts/exynos/exynos7-espresso.dts b/arch/arm64/boot/dts/exynos/exynos7-espresso.dts
index 1f2eddcebdd9..c8925f4076b5 100644
--- a/arch/arm64/boot/dts/exynos/exynos7-espresso.dts
+++ b/arch/arm64/boot/dts/exynos/exynos7-espresso.dts
@@ -68,9 +68,10 @@ &serial_2 {
 };
 
 &rtc {
-	status = "okay";
 	clocks = <&clock_ccore PCLK_RTC>, <&s2mps15_osc S2MPS11_CLK_AP>;
 	clock-names = "rtc", "rtc_src";
+
+	status = "okay";
 };
 
 &watchdog {
@@ -79,6 +80,7 @@ &watchdog {
 
 &adc {
 	vdd-supply = <&ldo3_reg>;
+
 	status = "okay";
 };
 
@@ -360,7 +362,6 @@ pmic_irq: pmic-irq-pins {
 };
 
 &mmc_0 {
-	status = "okay";
 	cap-mmc-highspeed;
 	mmc-ddr-1_8v;
 	mmc-hs200-1_8v;
@@ -373,10 +374,11 @@ &mmc_0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&sd0_clk &sd0_cmd &sd0_qrdy &sd0_bus1 &sd0_bus4 &sd0_bus8>;
 	bus-width = <8>;
+
+	status = "okay";
 };
 
 &mmc_2 {
-	status = "okay";
 	cap-sd-highspeed;
 	card-detect-delay = <200>;
 	clock-frequency = <400000000>;
@@ -389,6 +391,8 @@ &mmc_2 {
 	vmmc-supply = <&ldo17_reg>;
 	vqmmc-supply = <&ldo2_reg>;
 	disable-wp;
+
+	status = "okay";
 };
 
 &pinctrl_bus1 {
diff --git a/arch/arm64/boot/dts/exynos/exynos7.dtsi b/arch/arm64/boot/dts/exynos/exynos7.dtsi
index 9cb6bd61262e..fa4e7d678423 100644
--- a/arch/arm64/boot/dts/exynos/exynos7.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos7.dtsi
@@ -286,6 +286,7 @@ serial_0: serial@13630000 {
 			clocks = <&clock_peric0 PCLK_UART0>,
 				 <&clock_peric0 SCLK_UART0>;
 			clock-names = "uart", "clk_uart_baud0";
+
 			status = "disabled";
 		};
 
@@ -296,6 +297,7 @@ serial_1: serial@14c20000 {
 			clocks = <&clock_peric1 PCLK_UART1>,
 				 <&clock_peric1 SCLK_UART1>;
 			clock-names = "uart", "clk_uart_baud0";
+
 			status = "disabled";
 		};
 
@@ -306,6 +308,7 @@ serial_2: serial@14c30000 {
 			clocks = <&clock_peric1 PCLK_UART2>,
 				 <&clock_peric1 SCLK_UART2>;
 			clock-names = "uart", "clk_uart_baud0";
+
 			status = "disabled";
 		};
 
@@ -316,6 +319,7 @@ serial_3: serial@14c40000 {
 			clocks = <&clock_peric1 PCLK_UART3>,
 				 <&clock_peric1 SCLK_UART3>;
 			clock-names = "uart", "clk_uart_baud0";
+
 			status = "disabled";
 		};
 
@@ -388,6 +392,7 @@ hsi2c_0: i2c@13640000 {
 			pinctrl-0 = <&hs_i2c0_bus>;
 			clocks = <&clock_peric0 PCLK_HSI2C0>;
 			clock-names = "hsi2c";
+
 			status = "disabled";
 		};
 
@@ -401,6 +406,7 @@ hsi2c_1: i2c@13650000 {
 			pinctrl-0 = <&hs_i2c1_bus>;
 			clocks = <&clock_peric0 PCLK_HSI2C1>;
 			clock-names = "hsi2c";
+
 			status = "disabled";
 		};
 
@@ -414,6 +420,7 @@ hsi2c_2: i2c@14e60000 {
 			pinctrl-0 = <&hs_i2c2_bus>;
 			clocks = <&clock_peric1 PCLK_HSI2C2>;
 			clock-names = "hsi2c";
+
 			status = "disabled";
 		};
 
@@ -427,6 +434,7 @@ hsi2c_3: i2c@14e70000 {
 			pinctrl-0 = <&hs_i2c3_bus>;
 			clocks = <&clock_peric1 PCLK_HSI2C3>;
 			clock-names = "hsi2c";
+
 			status = "disabled";
 		};
 
@@ -440,6 +448,7 @@ hsi2c_4: i2c@13660000 {
 			pinctrl-0 = <&hs_i2c4_bus>;
 			clocks = <&clock_peric0 PCLK_HSI2C4>;
 			clock-names = "hsi2c";
+
 			status = "disabled";
 		};
 
@@ -453,6 +462,7 @@ hsi2c_5: i2c@13670000 {
 			pinctrl-0 = <&hs_i2c5_bus>;
 			clocks = <&clock_peric0 PCLK_HSI2C5>;
 			clock-names = "hsi2c";
+
 			status = "disabled";
 		};
 
@@ -466,6 +476,7 @@ hsi2c_6: i2c@14e00000 {
 			pinctrl-0 = <&hs_i2c6_bus>;
 			clocks = <&clock_peric1 PCLK_HSI2C6>;
 			clock-names = "hsi2c";
+
 			status = "disabled";
 		};
 
@@ -479,6 +490,7 @@ hsi2c_7: i2c@13e10000 {
 			pinctrl-0 = <&hs_i2c7_bus>;
 			clocks = <&clock_peric1 PCLK_HSI2C7>;
 			clock-names = "hsi2c";
+
 			status = "disabled";
 		};
 
@@ -492,6 +504,7 @@ hsi2c_8: i2c@14e20000 {
 			pinctrl-0 = <&hs_i2c8_bus>;
 			clocks = <&clock_peric1 PCLK_HSI2C8>;
 			clock-names = "hsi2c";
+
 			status = "disabled";
 		};
 
@@ -505,6 +518,7 @@ hsi2c_9: i2c@13680000 {
 			pinctrl-0 = <&hs_i2c9_bus>;
 			clocks = <&clock_peric0 PCLK_HSI2C9>;
 			clock-names = "hsi2c";
+
 			status = "disabled";
 		};
 
@@ -518,6 +532,7 @@ hsi2c_10: i2c@13690000 {
 			pinctrl-0 = <&hs_i2c10_bus>;
 			clocks = <&clock_peric0 PCLK_HSI2C10>;
 			clock-names = "hsi2c";
+
 			status = "disabled";
 		};
 
@@ -531,6 +546,7 @@ hsi2c_11: i2c@136a0000 {
 			pinctrl-0 = <&hs_i2c11_bus>;
 			clocks = <&clock_peric0 PCLK_HSI2C11>;
 			clock-names = "hsi2c";
+
 			status = "disabled";
 		};
 
@@ -546,6 +562,7 @@ rtc: rtc@10590000 {
 				     <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clock_ccore PCLK_RTC>;
 			clock-names = "rtc";
+
 			status = "disabled";
 		};
 
@@ -556,6 +573,7 @@ watchdog: watchdog@101d0000 {
 			clocks = <&clock_peris PCLK_WDT>;
 			clock-names = "watchdog";
 			samsung,syscon-phandle = <&pmu_system_controller>;
+
 			status = "disabled";
 		};
 
@@ -567,6 +585,7 @@ gpu: gpu@14ac0000 {
 				     <GIC_SPI 242 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "job", "mmu", "gpu";
+
 			status = "disabled";
 			/* TODO: operating points for DVFS, cooling device */
 		};
@@ -581,6 +600,7 @@ mmc_0: mmc@15740000 {
 				 <&clock_top1 CLK_SCLK_MMC0>;
 			clock-names = "biu", "ciu";
 			fifo-depth = <0x40>;
+
 			status = "disabled";
 		};
 
@@ -594,6 +614,7 @@ mmc_1: mmc@15750000 {
 				 <&clock_top1 CLK_SCLK_MMC1>;
 			clock-names = "biu", "ciu";
 			fifo-depth = <0x40>;
+
 			status = "disabled";
 		};
 
@@ -607,6 +628,7 @@ mmc_2: mmc@15560000 {
 				 <&clock_top1 CLK_SCLK_MMC2>;
 			clock-names = "biu", "ciu";
 			fifo-depth = <0x40>;
+
 			status = "disabled";
 		};
 
@@ -617,6 +639,7 @@ adc: adc@13620000 {
 			clocks = <&clock_peric0 PCLK_ADCIF>;
 			clock-names = "adc";
 			#io-channel-cells = <1>;
+
 			status = "disabled";
 		};
 
@@ -660,6 +683,7 @@ ufs: ufs@15570000 {
 			pinctrl-0 = <&ufs_rst_n &ufs_refclk_out>;
 			phys = <&ufs_phy>;
 			phy-names = "ufs-phy";
+
 			status = "disabled";
 		};
 
diff --git a/arch/arm64/boot/dts/exynos/exynos7885-jackpotlte.dts b/arch/arm64/boot/dts/exynos/exynos7885-jackpotlte.dts
index 9d74fa6bfed9..4b1961ca365b 100644
--- a/arch/arm64/boot/dts/exynos/exynos7885-jackpotlte.dts
+++ b/arch/arm64/boot/dts/exynos/exynos7885-jackpotlte.dts
@@ -62,7 +62,6 @@ power-key {
 };
 
 &mmc_0 {
-	status = "okay";
 	mmc-hs200-1_8v;
 	mmc-hs400-1_8v;
 	cap-mmc-highspeed;
@@ -79,6 +78,8 @@ &mmc_0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&sd0_clk_fast_slew_rate_3x &sd0_cmd &sd0_rdqs
 		     &sd0_bus1 &sd0_bus4 &sd0_bus8>;
+
+	status = "okay";
 };
 
 &oscclk {
diff --git a/arch/arm64/boot/dts/exynos/exynos7885.dtsi b/arch/arm64/boot/dts/exynos/exynos7885.dtsi
index 008228fb319a..7d7d56206b86 100644
--- a/arch/arm64/boot/dts/exynos/exynos7885.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos7885.dtsi
@@ -307,6 +307,7 @@ mmc_0: mmc@13500000 {
 				 <&cmu_fsys CLK_GOUT_MMC_EMBD_SDCLKIN>;
 			clock-names = "biu", "ciu";
 			fifo-depth = <0x40>;
+
 			status = "disabled";
 		};
 
@@ -321,6 +322,7 @@ serial_0: serial@13800000 {
 				 <&cmu_peri CLK_GOUT_UART0_EXT_UCLK>;
 			clock-names = "uart", "clk_uart_baud0";
 			samsung,uart-fifosize = <64>;
+
 			status = "disabled";
 		};
 
@@ -335,6 +337,7 @@ serial_1: serial@13810000 {
 				 <&cmu_peri CLK_GOUT_UART1_EXT_UCLK>;
 			clock-names = "uart", "clk_uart_baud0";
 			samsung,uart-fifosize = <256>;
+
 			status = "disabled";
 		};
 
@@ -349,6 +352,7 @@ serial_2: serial@13820000 {
 				 <&cmu_peri CLK_GOUT_UART2_EXT_UCLK>;
 			clock-names = "uart", "clk_uart_baud0";
 			samsung,uart-fifosize = <256>;
+
 			status = "disabled";
 		};
 
@@ -363,6 +367,7 @@ i2c_0: i2c@13830000 {
 			pinctrl-0 = <&i2c0_bus>;
 			clocks = <&cmu_peri CLK_GOUT_I2C0_PCLK>;
 			clock-names = "i2c";
+
 			status = "disabled";
 		};
 
@@ -377,6 +382,7 @@ i2c_1: i2c@13840000 {
 			pinctrl-0 = <&i2c1_bus>;
 			clocks = <&cmu_peri CLK_GOUT_I2C1_PCLK>;
 			clock-names = "i2c";
+
 			status = "disabled";
 		};
 
@@ -391,6 +397,7 @@ i2c_2: i2c@13850000 {
 			pinctrl-0 = <&i2c2_bus>;
 			clocks = <&cmu_peri CLK_GOUT_I2C2_PCLK>;
 			clock-names = "i2c";
+
 			status = "disabled";
 		};
 
@@ -405,6 +412,7 @@ i2c_3: i2c@13860000 {
 			pinctrl-0 = <&i2c3_bus>;
 			clocks = <&cmu_peri CLK_GOUT_I2C3_PCLK>;
 			clock-names = "i2c";
+
 			status = "disabled";
 		};
 
@@ -419,6 +427,7 @@ i2c_4: i2c@13870000 {
 			pinctrl-0 = <&i2c4_bus>;
 			clocks = <&cmu_peri CLK_GOUT_I2C4_PCLK>;
 			clock-names = "i2c";
+
 			status = "disabled";
 		};
 
@@ -433,6 +442,7 @@ i2c_5: i2c@13880000 {
 			pinctrl-0 = <&i2c5_bus>;
 			clocks = <&cmu_peri CLK_GOUT_I2C5_PCLK>;
 			clock-names = "i2c";
+
 			status = "disabled";
 		};
 
@@ -447,6 +457,7 @@ i2c_6: i2c@13890000 {
 			pinctrl-0 = <&i2c6_bus>;
 			clocks = <&cmu_peri CLK_GOUT_I2C6_PCLK>;
 			clock-names = "i2c";
+
 			status = "disabled";
 		};
 
@@ -461,6 +472,7 @@ i2c_7: i2c@11cd0000 {
 			pinctrl-0 = <&i2c7_bus>;
 			clocks = <&cmu_peri CLK_GOUT_I2C7_PCLK>;
 			clock-names = "i2c";
+
 			status = "disabled";
 		};
 	};
diff --git a/arch/arm64/boot/dts/exynos/exynos850-e850-96.dts b/arch/arm64/boot/dts/exynos/exynos850-e850-96.dts
index ab076d326a49..afef32ad4ee2 100644
--- a/arch/arm64/boot/dts/exynos/exynos850-e850-96.dts
+++ b/arch/arm64/boot/dts/exynos/exynos850-e850-96.dts
@@ -178,7 +178,6 @@ &cmu_hsi {
 };
 
 &mmc_0 {
-	status = "okay";
 	mmc-hs200-1_8v;
 	mmc-hs400-1_8v;
 	cap-mmc-highspeed;
@@ -195,6 +194,8 @@ &mmc_0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&sd0_clk_pins &sd0_cmd_pins &sd0_rdqs_pins &sd0_nreset_pins
 		     &sd0_bus1_pins &sd0_bus4_pins &sd0_bus8_pins>;
+
+	status = "okay";
 };
 
 &oscclk {
@@ -224,21 +225,24 @@ micro_usb_det_pins: micro-usb-det-pins {
 };
 
 &rtc {
-	status = "okay";
 	clocks = <&cmu_apm CLK_GOUT_RTC_PCLK>, <&rtcclk>;
 	clock-names = "rtc", "rtc_src";
+
+	status = "okay";
 };
 
 &serial_0 {
-	status = "okay";
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart1_pins>;
+
+	status = "okay";
 };
 
 &usbdrd {
-	status = "okay";
 	vdd10-supply = <&reg_dummy>;
 	vdd33-supply = <&reg_dummy>;
+
+	status = "okay";
 };
 
 &usbdrd_dwc3 {
@@ -273,6 +277,7 @@ &usbdrd_phy {
 
 &usi_uart {
 	samsung,clkreq-on; /* needed for UART mode */
+
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
index 3881f573ec08..8abf7c9eac9e 100644
--- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
@@ -239,6 +239,7 @@ watchdog_cl0: watchdog@10050000 {
 			clock-names = "watchdog", "watchdog_src";
 			samsung,syscon-phandle = <&pmu_system_controller>;
 			samsung,cluster-index = <0>;
+
 			status = "disabled";
 		};
 
@@ -250,6 +251,7 @@ watchdog_cl1: watchdog@10060000 {
 			clock-names = "watchdog", "watchdog_src";
 			samsung,syscon-phandle = <&pmu_system_controller>;
 			samsung,cluster-index = <1>;
+
 			status = "disabled";
 		};
 
@@ -455,6 +457,7 @@ rtc: rtc@11a30000 {
 				     <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cmu_apm CLK_GOUT_RTC_PCLK>;
 			clock-names = "rtc";
+
 			status = "disabled";
 		};
 
@@ -469,6 +472,7 @@ mmc_0: mmc@12100000 {
 				 <&cmu_core CLK_GOUT_MMC_EMBD_SDCLKIN>;
 			clock-names = "biu", "ciu";
 			fifo-depth = <0x40>;
+
 			status = "disabled";
 		};
 
@@ -482,6 +486,7 @@ i2c_0: i2c@13830000 {
 			pinctrl-0 = <&i2c0_pins>;
 			clocks = <&cmu_peri CLK_GOUT_I2C0_PCLK>;
 			clock-names = "i2c";
+
 			status = "disabled";
 		};
 
@@ -495,6 +500,7 @@ i2c_1: i2c@13840000 {
 			pinctrl-0 = <&i2c1_pins>;
 			clocks = <&cmu_peri CLK_GOUT_I2C1_PCLK>;
 			clock-names = "i2c";
+
 			status = "disabled";
 		};
 
@@ -508,6 +514,7 @@ i2c_2: i2c@13850000 {
 			pinctrl-0 = <&i2c2_pins>;
 			clocks = <&cmu_peri CLK_GOUT_I2C2_PCLK>;
 			clock-names = "i2c";
+
 			status = "disabled";
 		};
 
@@ -521,6 +528,7 @@ i2c_3: i2c@13860000 {
 			pinctrl-0 = <&i2c3_pins>;
 			clocks = <&cmu_peri CLK_GOUT_I2C3_PCLK>;
 			clock-names = "i2c";
+
 			status = "disabled";
 		};
 
@@ -534,6 +542,7 @@ i2c_4: i2c@13870000 {
 			pinctrl-0 = <&i2c4_pins>;
 			clocks = <&cmu_peri CLK_GOUT_I2C4_PCLK>;
 			clock-names = "i2c";
+
 			status = "disabled";
 		};
 
@@ -548,6 +557,7 @@ i2c_5: i2c@13880000 {
 			pinctrl-0 = <&i2c5_pins>;
 			clocks = <&cmu_peri CLK_GOUT_I2C5_PCLK>;
 			clock-names = "i2c";
+
 			status = "disabled";
 		};
 
@@ -562,6 +572,7 @@ i2c_6: i2c@13890000 {
 			pinctrl-0 = <&i2c6_pins>;
 			clocks = <&cmu_peri CLK_GOUT_I2C6_PCLK>;
 			clock-names = "i2c";
+
 			status = "disabled";
 		};
 
@@ -632,6 +643,7 @@ usbdrd: usb@13600000 {
 			clock-names = "bus_early", "ref";
 			#address-cells = <1>;
 			#size-cells = <1>;
+
 			status = "disabled";
 
 			usbdrd_dwc3: usb@0 {
@@ -651,6 +663,7 @@ usbdrd_phy: phy@135d0000 {
 			clock-names = "phy", "ref";
 			samsung,pmu-syscon = <&pmu_system_controller>;
 			#phy-cells = <1>;
+
 			status = "disabled";
 		};
 
@@ -665,6 +678,7 @@ usi_uart: usi@138200c0 {
 			clocks = <&cmu_peri CLK_GOUT_UART_PCLK>,
 				 <&cmu_peri CLK_GOUT_UART_IPCLK>;
 			clock-names = "pclk", "ipclk";
+
 			status = "disabled";
 
 			serial_0: serial@13820000 {
@@ -676,6 +690,7 @@ serial_0: serial@13820000 {
 				clocks = <&cmu_peri CLK_GOUT_UART_PCLK>,
 					 <&cmu_peri CLK_GOUT_UART_IPCLK>;
 				clock-names = "uart", "clk_uart_baud0";
+
 				status = "disabled";
 			};
 		};
@@ -691,6 +706,7 @@ usi_hsi2c_0: usi@138a00c0 {
 			clocks = <&cmu_peri CLK_GOUT_HSI2C0_PCLK>,
 				 <&cmu_peri CLK_GOUT_HSI2C0_IPCLK>;
 			clock-names = "pclk", "ipclk";
+
 			status = "disabled";
 
 			hsi2c_0: i2c@138a0000 {
@@ -705,6 +721,7 @@ hsi2c_0: i2c@138a0000 {
 				clocks = <&cmu_peri CLK_GOUT_HSI2C0_IPCLK>,
 					 <&cmu_peri CLK_GOUT_HSI2C0_PCLK>;
 				clock-names = "hsi2c", "hsi2c_pclk";
+
 				status = "disabled";
 			};
 		};
@@ -720,6 +737,7 @@ usi_hsi2c_1: usi@138b00c0 {
 			clocks = <&cmu_peri CLK_GOUT_HSI2C1_PCLK>,
 				 <&cmu_peri CLK_GOUT_HSI2C1_IPCLK>;
 			clock-names = "pclk", "ipclk";
+
 			status = "disabled";
 
 			hsi2c_1: i2c@138b0000 {
@@ -734,6 +752,7 @@ hsi2c_1: i2c@138b0000 {
 				clocks = <&cmu_peri CLK_GOUT_HSI2C1_IPCLK>,
 					 <&cmu_peri CLK_GOUT_HSI2C1_PCLK>;
 				clock-names = "hsi2c", "hsi2c_pclk";
+
 				status = "disabled";
 			};
 		};
@@ -749,6 +768,7 @@ usi_hsi2c_2: usi@138c00c0 {
 			clocks = <&cmu_peri CLK_GOUT_HSI2C2_PCLK>,
 				 <&cmu_peri CLK_GOUT_HSI2C2_IPCLK>;
 			clock-names = "pclk", "ipclk";
+
 			status = "disabled";
 
 			hsi2c_2: i2c@138c0000 {
@@ -763,6 +783,7 @@ hsi2c_2: i2c@138c0000 {
 				clocks = <&cmu_peri CLK_GOUT_HSI2C2_IPCLK>,
 					 <&cmu_peri CLK_GOUT_HSI2C2_PCLK>;
 				clock-names = "hsi2c", "hsi2c_pclk";
+
 				status = "disabled";
 			};
 		};
@@ -778,6 +799,7 @@ usi_spi_0: usi@139400c0 {
 			clocks = <&cmu_peri CLK_GOUT_SPI0_PCLK>,
 				 <&cmu_peri CLK_GOUT_SPI0_IPCLK>;
 			clock-names = "pclk", "ipclk";
+
 			status = "disabled";
 
 			spi_0: spi@13940000 {
@@ -795,6 +817,7 @@ spi_0: spi@13940000 {
 				samsung,spi-src-clk = <0>;
 				#address-cells = <1>;
 				#size-cells = <0>;
+
 				status = "disabled";
 			};
 		};
@@ -810,6 +833,7 @@ usi_cmgp0: usi@11d000c0 {
 			clocks = <&cmu_cmgp CLK_GOUT_CMGP_USI0_PCLK>,
 				 <&cmu_cmgp CLK_GOUT_CMGP_USI0_IPCLK>;
 			clock-names = "pclk", "ipclk";
+
 			status = "disabled";
 
 			hsi2c_3: i2c@11d00000 {
@@ -824,6 +848,7 @@ hsi2c_3: i2c@11d00000 {
 				clocks = <&cmu_cmgp CLK_GOUT_CMGP_USI0_IPCLK>,
 					 <&cmu_cmgp CLK_GOUT_CMGP_USI0_PCLK>;
 				clock-names = "hsi2c", "hsi2c_pclk";
+
 				status = "disabled";
 			};
 
@@ -836,6 +861,7 @@ serial_1: serial@11d00000 {
 				clocks = <&cmu_cmgp CLK_GOUT_CMGP_USI0_PCLK>,
 					 <&cmu_cmgp CLK_GOUT_CMGP_USI0_IPCLK>;
 				clock-names = "uart", "clk_uart_baud0";
+
 				status = "disabled";
 			};
 
@@ -854,6 +880,7 @@ spi_1: spi@11d00000 {
 				samsung,spi-src-clk = <0>;
 				#address-cells = <1>;
 				#size-cells = <0>;
+
 				status = "disabled";
 			};
 		};
@@ -869,6 +896,7 @@ usi_cmgp1: usi@11d200c0 {
 			clocks = <&cmu_cmgp CLK_GOUT_CMGP_USI1_PCLK>,
 				 <&cmu_cmgp CLK_GOUT_CMGP_USI1_IPCLK>;
 			clock-names = "pclk", "ipclk";
+
 			status = "disabled";
 
 			hsi2c_4: i2c@11d20000 {
@@ -883,6 +911,7 @@ hsi2c_4: i2c@11d20000 {
 				clocks = <&cmu_cmgp CLK_GOUT_CMGP_USI1_IPCLK>,
 					 <&cmu_cmgp CLK_GOUT_CMGP_USI1_PCLK>;
 				clock-names = "hsi2c", "hsi2c_pclk";
+
 				status = "disabled";
 			};
 
@@ -895,6 +924,7 @@ serial_2: serial@11d20000 {
 				clocks = <&cmu_cmgp CLK_GOUT_CMGP_USI1_PCLK>,
 					 <&cmu_cmgp CLK_GOUT_CMGP_USI1_IPCLK>;
 				clock-names = "uart", "clk_uart_baud0";
+
 				status = "disabled";
 			};
 
@@ -913,6 +943,7 @@ spi_2: spi@11d20000 {
 				samsung,spi-src-clk = <0>;
 				#address-cells = <1>;
 				#size-cells = <0>;
+
 				status = "disabled";
 			};
 		};
diff --git a/arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dts b/arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dts
index 305dc72f93d8..da02b557a8f2 100644
--- a/arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dts
+++ b/arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dts
@@ -192,5 +192,6 @@ ts_int: ts-int-pins {
 
 &usi9 {
 	samsung,mode = <USI_MODE_I2C0_1>;
+
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/exynos/exynos8895.dtsi b/arch/arm64/boot/dts/exynos/exynos8895.dtsi
index ff114cd6c9ea..e3b6d37aac09 100644
--- a/arch/arm64/boot/dts/exynos/exynos8895.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos8895.dtsi
@@ -244,6 +244,7 @@ serial_0: serial@10430000 {
 			pinctrl-names = "default";
 			pinctrl-0 = <&uart0_bus>;
 			samsung,uart-fifosize = <256>;
+
 			status = "disabled";
 		};
 
@@ -256,6 +257,7 @@ usi0: usi@10440000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 			samsung,sysreg = <&syscon_peric0 0x1000>;
+
 			status = "disabled";
 
 			hsi2c_5: i2c@0 {
@@ -283,6 +285,7 @@ serial_2: serial@0 {
 				pinctrl-0 = <&uart2_bus>;
 				pinctrl-names = "default";
 				samsung,uart-fifosize = <64>;
+
 				status = "disabled";
 			};
 
@@ -298,6 +301,7 @@ spi_2: spi@0 {
 				pinctrl-names = "default";
 				#address-cells = <1>;
 				#size-cells = <0>;
+
 				status = "disabled";
 			};
 
@@ -326,6 +330,7 @@ usi1: usi@10460000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 			samsung,sysreg = <&syscon_peric0 0x1004>;
+
 			status = "disabled";
 
 			hsi2c_7: i2c@0 {
@@ -353,6 +358,7 @@ serial_3: serial@0 {
 				pinctrl-0 = <&uart3_bus>;
 				pinctrl-names = "default";
 				samsung,uart-fifosize = <64>;
+
 				status = "disabled";
 			};
 
@@ -368,6 +374,7 @@ spi_3: spi@0 {
 				pinctrl-names = "default";
 				#address-cells = <1>;
 				#size-cells = <0>;
+
 				status = "disabled";
 			};
 
@@ -396,6 +403,7 @@ usi2: usi@10480000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 			samsung,sysreg = <&syscon_peric0 0x1008>;
+
 			status = "disabled";
 
 			hsi2c_9: i2c@0 {
@@ -423,6 +431,7 @@ serial_4: serial@0 {
 				pinctrl-0 = <&uart4_bus>;
 				pinctrl-names = "default";
 				samsung,uart-fifosize = <64>;
+
 				status = "disabled";
 			};
 
@@ -438,6 +447,7 @@ spi_4: spi@0 {
 				pinctrl-names = "default";
 				#address-cells = <1>;
 				#size-cells = <0>;
+
 				status = "disabled";
 			};
 
@@ -466,6 +476,7 @@ usi3: usi@104a0000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 			samsung,sysreg = <&syscon_peric0 0x100c>;
+
 			status = "disabled";
 
 			hsi2c_11: i2c@0 {
@@ -493,6 +504,7 @@ serial_5: serial@0 {
 				pinctrl-0 = <&uart5_bus>;
 				pinctrl-names = "default";
 				samsung,uart-fifosize = <64>;
+
 				status = "disabled";
 			};
 
@@ -508,6 +520,7 @@ spi_5: spi@0 {
 				pinctrl-names = "default";
 				#address-cells = <1>;
 				#size-cells = <0>;
+
 				status = "disabled";
 			};
 
@@ -575,6 +588,7 @@ serial_1: serial@10830000 {
 			pinctrl-names = "default";
 			pinctrl-0 = <&uart1_bus>;
 			samsung,uart-fifosize = <256>;
+
 			status = "disabled";
 		};
 
@@ -587,6 +601,7 @@ usi4: usi@10840000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 			samsung,sysreg = <&syscon_peric1 0x1008>;
+
 			status = "disabled";
 
 			hsi2c_13: i2c@0 {
@@ -614,6 +629,7 @@ serial_6: serial@0 {
 				pinctrl-0 = <&uart6_bus>;
 				pinctrl-names = "default";
 				samsung,uart-fifosize = <64>;
+
 				status = "disabled";
 			};
 
@@ -629,6 +645,7 @@ spi_6: spi@0 {
 				pinctrl-names = "default";
 				#address-cells = <1>;
 				#size-cells = <0>;
+
 				status = "disabled";
 			};
 
@@ -657,6 +674,7 @@ usi5: usi@10860000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 			samsung,sysreg = <&syscon_peric1 0x100c>;
+
 			status = "disabled";
 
 			hsi2c_15: i2c@0 {
@@ -684,6 +702,7 @@ serial_7: serial@0 {
 				pinctrl-0 = <&uart7_bus>;
 				pinctrl-names = "default";
 				samsung,uart-fifosize = <64>;
+
 				status = "disabled";
 			};
 
@@ -699,6 +718,7 @@ spi_7: spi@0 {
 				pinctrl-names = "default";
 				#address-cells = <1>;
 				#size-cells = <0>;
+
 				status = "disabled";
 			};
 
@@ -727,6 +747,7 @@ usi6: usi@10880000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 			samsung,sysreg = <&syscon_peric1 0x1010>;
+
 			status = "disabled";
 
 			hsi2c_17: i2c@0 {
@@ -754,6 +775,7 @@ serial_8: serial@0 {
 				pinctrl-0 = <&uart8_bus>;
 				pinctrl-names = "default";
 				samsung,uart-fifosize = <64>;
+
 				status = "disabled";
 			};
 
@@ -769,6 +791,7 @@ spi_8: spi@0 {
 				pinctrl-names = "default";
 				#address-cells = <1>;
 				#size-cells = <0>;
+
 				status = "disabled";
 			};
 
@@ -797,6 +820,7 @@ usi7: usi@108a0000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 			samsung,sysreg = <&syscon_peric1 0x1014>;
+
 			status = "disabled";
 
 			hsi2c_19: i2c@0 {
@@ -824,6 +848,7 @@ serial_9: serial@0 {
 				pinctrl-0 = <&uart9_bus>;
 				pinctrl-names = "default";
 				samsung,uart-fifosize = <64>;
+
 				status = "disabled";
 			};
 
@@ -839,6 +864,7 @@ spi_9: spi@0 {
 				pinctrl-names = "default";
 				#address-cells = <1>;
 				#size-cells = <0>;
+
 				status = "disabled";
 			};
 
@@ -867,6 +893,7 @@ usi8: usi@108c0000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 			samsung,sysreg = <&syscon_peric1 0x1018>;
+
 			status = "disabled";
 
 			hsi2c_21: i2c@0 {
@@ -894,6 +921,7 @@ serial_10: serial@0 {
 				pinctrl-0 = <&uart10_bus>;
 				pinctrl-names = "default";
 				samsung,uart-fifosize = <64>;
+
 				status = "disabled";
 			};
 
@@ -909,6 +937,7 @@ spi_10: spi@0 {
 				pinctrl-names = "default";
 				#address-cells = <1>;
 				#size-cells = <0>;
+
 				status = "disabled";
 			};
 
@@ -937,6 +966,7 @@ usi9: usi@108e0000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 			samsung,sysreg = <&syscon_peric1 0x101c>;
+
 			status = "disabled";
 
 			hsi2c_23: i2c@0 {
@@ -964,6 +994,7 @@ serial_11: serial@0 {
 				pinctrl-0 = <&uart11_bus>;
 				pinctrl-names = "default";
 				samsung,uart-fifosize = <64>;
+
 				status = "disabled";
 			};
 
@@ -979,6 +1010,7 @@ spi_11: spi@0 {
 				pinctrl-names = "default";
 				#address-cells = <1>;
 				#size-cells = <0>;
+
 				status = "disabled";
 			};
 
@@ -1007,6 +1039,7 @@ usi10: usi@10900000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 			samsung,sysreg = <&syscon_peric1 0x1020>;
+
 			status = "disabled";
 
 			hsi2c_25: i2c@0 {
@@ -1034,6 +1067,7 @@ serial_12: serial@0 {
 				pinctrl-0 = <&uart12_bus>;
 				pinctrl-names = "default";
 				samsung,uart-fifosize = <64>;
+
 				status = "disabled";
 			};
 
@@ -1049,6 +1083,7 @@ spi_12: spi@0 {
 				pinctrl-names = "default";
 				#address-cells = <1>;
 				#size-cells = <0>;
+
 				status = "disabled";
 			};
 
@@ -1077,6 +1112,7 @@ usi11: usi@10920000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 			samsung,sysreg = <&syscon_peric1 0x1024>;
+
 			status = "disabled";
 
 			hsi2c_27: i2c@0 {
@@ -1104,6 +1140,7 @@ serial_13: serial@0 {
 				pinctrl-0 = <&uart13_bus>;
 				pinctrl-names = "default";
 				samsung,uart-fifosize = <64>;
+
 				status = "disabled";
 			};
 
@@ -1119,6 +1156,7 @@ spi_13: spi@0 {
 				pinctrl-names = "default";
 				#address-cells = <1>;
 				#size-cells = <0>;
+
 				status = "disabled";
 			};
 
@@ -1147,6 +1185,7 @@ usi12: usi@10940000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 			samsung,sysreg = <&syscon_peric1 0x1028>;
+
 			status = "disabled";
 
 			hsi2c_29: i2c@0 {
@@ -1174,6 +1213,7 @@ serial_14: serial@0 {
 				pinctrl-0 = <&uart14_bus>;
 				pinctrl-names = "default";
 				samsung,uart-fifosize = <64>;
+
 				status = "disabled";
 			};
 
@@ -1189,6 +1229,7 @@ spi_14: spi@0 {
 				pinctrl-names = "default";
 				#address-cells = <1>;
 				#size-cells = <0>;
+
 				status = "disabled";
 			};
 
@@ -1217,6 +1258,7 @@ usi13: usi@10960000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 			samsung,sysreg = <&syscon_peric1 0x102c>;
+
 			status = "disabled";
 
 			hsi2c_31: i2c@0 {
@@ -1244,6 +1286,7 @@ serial_15: serial@0 {
 				pinctrl-0 = <&uart15_bus>;
 				pinctrl-names = "default";
 				samsung,uart-fifosize = <64>;
+
 				status = "disabled";
 			};
 
@@ -1259,6 +1302,7 @@ spi_15: spi@0 {
 				pinctrl-names = "default";
 				#address-cells = <1>;
 				#size-cells = <0>;
+
 				status = "disabled";
 			};
 
@@ -1356,6 +1400,7 @@ spi_0: spi@109d0000 {
 			interrupts = <GIC_SPI 435 IRQ_TYPE_LEVEL_HIGH>;
 			pinctrl-0 = <&spi0_bus>;
 			pinctrl-names = "default";
+
 			status = "disabled";
 		};
 
@@ -1371,6 +1416,7 @@ spi_1: spi@109e0000 {
 			interrupts = <GIC_SPI 436 IRQ_TYPE_LEVEL_HIGH>;
 			pinctrl-0 = <&spi1_bus>;
 			pinctrl-names = "default";
+
 			status = "disabled";
 		};
 
@@ -1437,6 +1483,7 @@ mmc: mmc@11500000 {
 			interrupts = <GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+
 			status = "disabled";
 		};
 
diff --git a/arch/arm64/boot/dts/exynos/exynos990-c1s.dts b/arch/arm64/boot/dts/exynos/exynos990-c1s.dts
index 9f0ad4f9673a..a58923229128 100644
--- a/arch/arm64/boot/dts/exynos/exynos990-c1s.dts
+++ b/arch/arm64/boot/dts/exynos/exynos990-c1s.dts
@@ -121,9 +121,10 @@ key_volup: key-volup-pins {
 };
 
 &usbdrd {
-	status = "okay";
 	vdd10-supply = <&reg_dummy>;
 	vdd33-supply = <&reg_dummy>;
+
+	status = "okay";
 };
 
 &usbdrd_phy {
diff --git a/arch/arm64/boot/dts/exynos/exynos990-r8s.dts b/arch/arm64/boot/dts/exynos/exynos990-r8s.dts
index 55342db61979..563dbde6abc7 100644
--- a/arch/arm64/boot/dts/exynos/exynos990-r8s.dts
+++ b/arch/arm64/boot/dts/exynos/exynos990-r8s.dts
@@ -121,9 +121,10 @@ key_volup: key-volup-pins {
 };
 
 &usbdrd {
-	status = "okay";
 	vdd10-supply = <&reg_dummy>;
 	vdd33-supply = <&reg_dummy>;
+
+	status = "okay";
 };
 
 &usbdrd_phy {
diff --git a/arch/arm64/boot/dts/exynos/exynos990-x1s-common.dtsi b/arch/arm64/boot/dts/exynos/exynos990-x1s-common.dtsi
index 7b97220cccb7..01ecdf484dab 100644
--- a/arch/arm64/boot/dts/exynos/exynos990-x1s-common.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos990-x1s-common.dtsi
@@ -104,9 +104,10 @@ key_volup: key-volup-pins {
 };
 
 &usbdrd {
-	status = "okay";
 	vdd10-supply = <&reg_dummy>;
 	vdd33-supply = <&reg_dummy>;
+
+	status = "okay";
 };
 
 &usbdrd_phy {
diff --git a/arch/arm64/boot/dts/exynos/exynos990.dtsi b/arch/arm64/boot/dts/exynos/exynos990.dtsi
index 2e6fb24a3c92..c15ccaff2666 100644
--- a/arch/arm64/boot/dts/exynos/exynos990.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos990.dtsi
@@ -320,6 +320,7 @@ usbdrd_phy: phy@10c00000 {
 			clock-names = "phy", "ref";
 			samsung,pmu-syscon = <&pmu_system_controller>;
 			#phy-cells = <1>;
+
 			status = "disabled";
 		};
 
@@ -332,6 +333,7 @@ usbdrd: usb@10e00000 {
 			clock-names = "bus_early", "ref";
 			#address-cells = <1>;
 			#size-cells = <1>;
+
 			status = "disabled";
 
 			usbdrd_dwc3: usb@0 {
diff --git a/arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts b/arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts
index de2c1de51a76..9912432c5961 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts
+++ b/arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts
@@ -103,11 +103,13 @@ key_volup: key-volup-pins {
 &pwm {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pwm_tout3>;
+
 	status = "okay";
 };
 
 &serial_0 {
 	pinctrl-0 = <&uart0_bus_dual>;
+
 	status = "okay";
 };
 
@@ -120,17 +122,20 @@ &ufs_1_phy {
 };
 
 &ufs_0 {
-	status = "okay";
 	vcc-supply = <&ufs_0_fixed_vcc_reg>;
+
+	status = "okay";
 };
 
 &ufs_1 {
-	status = "okay";
 	vcc-supply = <&ufs_1_fixed_vcc_reg>;
+
+	status = "okay";
 };
 
 &usi_0 {
 	samsung,clkreq-on; /* needed for UART mode */
+
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
index 2c34a2b30ad0..94f8d1c47676 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
@@ -450,6 +450,7 @@ usi_0: usi@103000c0 {
 			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PCLK_0>,
 				 <&cmu_peric0 CLK_GOUT_PERIC0_IPCLK_0>;
 			clock-names = "pclk", "ipclk";
+
 			status = "disabled";
 
 			serial_0: serial@10300000 {
@@ -463,6 +464,7 @@ serial_0: serial@10300000 {
 					 <&cmu_peric0 CLK_GOUT_PERIC0_IPCLK_0>;
 				clock-names = "uart", "clk_uart_baud0";
 				samsung,uart-fifosize = <256>;
+
 				status = "disabled";
 			};
 
@@ -483,6 +485,7 @@ spi_0: spi@10300000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				fifo-depth = <256>;
+
 				status = "disabled";
 			};
 
@@ -497,6 +500,7 @@ hsi2c_0: i2c@10300000 {
 				clock-names = "hsi2c", "hsi2c_pclk";
 				#address-cells = <1>;
 				#size-cells = <0>;
+
 				status = "disabled";
 			};
 		};
@@ -513,6 +517,7 @@ usi_i2c_0: usi@103100c0 {
 			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PCLK_1>,
 				 <&cmu_peric0 CLK_GOUT_PERIC0_IPCLK_1>;
 			clock-names = "pclk", "ipclk";
+
 			status = "disabled";
 
 			hsi2c_1: i2c@10310000 {
@@ -526,6 +531,7 @@ hsi2c_1: i2c@10310000 {
 				clock-names = "hsi2c", "hsi2c_pclk";
 				#address-cells = <1>;
 				#size-cells = <0>;
+
 				status = "disabled";
 			};
 		};
@@ -542,6 +548,7 @@ usi_1: usi@103200c0 {
 			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PCLK_2>,
 				 <&cmu_peric0 CLK_GOUT_PERIC0_IPCLK_2>;
 			clock-names = "pclk", "ipclk";
+
 			status = "disabled";
 
 			serial_1: serial@10320000 {
@@ -555,6 +562,7 @@ serial_1: serial@10320000 {
 					 <&cmu_peric0 CLK_GOUT_PERIC0_IPCLK_2>;
 				clock-names = "uart", "clk_uart_baud0";
 				samsung,uart-fifosize = <256>;
+
 				status = "disabled";
 			};
 
@@ -575,6 +583,7 @@ spi_1: spi@10320000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				fifo-depth = <256>;
+
 				status = "disabled";
 			};
 
@@ -589,6 +598,7 @@ hsi2c_2: i2c@10320000 {
 				clock-names = "hsi2c", "hsi2c_pclk";
 				#address-cells = <1>;
 				#size-cells = <0>;
+
 				status = "disabled";
 			};
 		};
@@ -605,6 +615,7 @@ usi_i2c_1: usi@103300c0 {
 			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PCLK_3>,
 				 <&cmu_peric0 CLK_GOUT_PERIC0_IPCLK_3>;
 			clock-names = "pclk", "ipclk";
+
 			status = "disabled";
 
 			hsi2c_3: i2c@10330000 {
@@ -618,6 +629,7 @@ hsi2c_3: i2c@10330000 {
 				clock-names = "hsi2c", "hsi2c_pclk";
 				#address-cells = <1>;
 				#size-cells = <0>;
+
 				status = "disabled";
 			};
 		};
@@ -634,6 +646,7 @@ usi_2: usi@103400c0 {
 			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PCLK_4>,
 				 <&cmu_peric0 CLK_GOUT_PERIC0_IPCLK_4>;
 			clock-names = "pclk", "ipclk";
+
 			status = "disabled";
 
 			serial_2: serial@10340000 {
@@ -647,6 +660,7 @@ serial_2: serial@10340000 {
 					 <&cmu_peric0 CLK_GOUT_PERIC0_IPCLK_4>;
 				clock-names = "uart", "clk_uart_baud0";
 				samsung,uart-fifosize = <64>;
+
 				status = "disabled";
 			};
 
@@ -667,6 +681,7 @@ spi_2: spi@10340000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				fifo-depth = <64>;
+
 				status = "disabled";
 			};
 
@@ -681,6 +696,7 @@ hsi2c_4: i2c@10340000 {
 				clock-names = "hsi2c", "hsi2c_pclk";
 				#address-cells = <1>;
 				#size-cells = <0>;
+
 				status = "disabled";
 			};
 		};
@@ -697,6 +713,7 @@ usi_i2c_2: usi@103500c0 {
 			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PCLK_5>,
 				 <&cmu_peric0 CLK_GOUT_PERIC0_IPCLK_5>;
 			clock-names = "pclk", "ipclk";
+
 			status = "disabled";
 
 			hsi2c_5: i2c@10350000 {
@@ -710,6 +727,7 @@ hsi2c_5: i2c@10350000 {
 				clock-names = "hsi2c", "hsi2c_pclk";
 				#address-cells = <1>;
 				#size-cells = <0>;
+
 				status = "disabled";
 			};
 		};
@@ -726,6 +744,7 @@ usi_3: usi@103600c0 {
 			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PCLK_6>,
 				 <&cmu_peric0 CLK_GOUT_PERIC0_IPCLK_6>;
 			clock-names = "pclk", "ipclk";
+
 			status = "disabled";
 
 			serial_3: serial@10360000 {
@@ -739,6 +758,7 @@ serial_3: serial@10360000 {
 					 <&cmu_peric0 CLK_GOUT_PERIC0_IPCLK_6>;
 				clock-names = "uart", "clk_uart_baud0";
 				samsung,uart-fifosize = <64>;
+
 				status = "disabled";
 			};
 
@@ -759,6 +779,7 @@ spi_3: spi@10360000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				fifo-depth = <64>;
+
 				status = "disabled";
 			};
 
@@ -773,6 +794,7 @@ hsi2c_6: i2c@10360000 {
 				clock-names = "hsi2c", "hsi2c_pclk";
 				#address-cells = <1>;
 				#size-cells = <0>;
+
 				status = "disabled";
 			};
 		};
@@ -789,6 +811,7 @@ usi_i2c_3: usi@103700c0 {
 			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PCLK_7>,
 				 <&cmu_peric0 CLK_GOUT_PERIC0_IPCLK_7>;
 			clock-names = "pclk", "ipclk";
+
 			status = "disabled";
 
 			hsi2c_7: i2c@10370000 {
@@ -802,6 +825,7 @@ hsi2c_7: i2c@10370000 {
 				clock-names = "hsi2c", "hsi2c_pclk";
 				#address-cells = <1>;
 				#size-cells = <0>;
+
 				status = "disabled";
 			};
 		};
@@ -818,6 +842,7 @@ usi_4: usi@103800c0 {
 			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PCLK_8>,
 				 <&cmu_peric0 CLK_GOUT_PERIC0_IPCLK_8>;
 			clock-names = "pclk", "ipclk";
+
 			status = "disabled";
 
 			serial_4: serial@10380000 {
@@ -831,6 +856,7 @@ serial_4: serial@10380000 {
 					 <&cmu_peric0 CLK_GOUT_PERIC0_IPCLK_8>;
 				clock-names = "uart", "clk_uart_baud0";
 				samsung,uart-fifosize = <64>;
+
 				status = "disabled";
 			};
 
@@ -851,6 +877,7 @@ spi_4: spi@10380000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				fifo-depth = <64>;
+
 				status = "disabled";
 			};
 
@@ -865,6 +892,7 @@ hsi2c_8: i2c@10380000 {
 				clock-names = "hsi2c", "hsi2c_pclk";
 				#address-cells = <1>;
 				#size-cells = <0>;
+
 				status = "disabled";
 			};
 		};
@@ -881,6 +909,7 @@ usi_i2c_4: usi@103900c0 {
 			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PCLK_9>,
 				 <&cmu_peric0 CLK_GOUT_PERIC0_IPCLK_9>;
 			clock-names = "pclk", "ipclk";
+
 			status = "disabled";
 
 			hsi2c_9: i2c@10390000 {
@@ -894,6 +923,7 @@ hsi2c_9: i2c@10390000 {
 				clock-names = "hsi2c", "hsi2c_pclk";
 				#address-cells = <1>;
 				#size-cells = <0>;
+
 				status = "disabled";
 			};
 		};
@@ -910,6 +940,7 @@ usi_5: usi@103a00c0 {
 			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PCLK_10>,
 				 <&cmu_peric0 CLK_GOUT_PERIC0_IPCLK_10>;
 			clock-names = "pclk", "ipclk";
+
 			status = "disabled";
 
 			serial_5: serial@103a0000 {
@@ -923,6 +954,7 @@ serial_5: serial@103a0000 {
 					 <&cmu_peric0 CLK_GOUT_PERIC0_IPCLK_10>;
 				clock-names = "uart", "clk_uart_baud0";
 				samsung,uart-fifosize = <64>;
+
 				status = "disabled";
 			};
 
@@ -943,6 +975,7 @@ spi_5: spi@103a0000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				fifo-depth = <64>;
+
 				status = "disabled";
 			};
 
@@ -957,6 +990,7 @@ hsi2c_10: i2c@103a0000 {
 				clock-names = "hsi2c", "hsi2c_pclk";
 				#address-cells = <1>;
 				#size-cells = <0>;
+
 				status = "disabled";
 			};
 		};
@@ -973,6 +1007,7 @@ usi_i2c_5: usi@103b00c0 {
 			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PCLK_11>,
 				 <&cmu_peric0 CLK_GOUT_PERIC0_IPCLK_11>;
 			clock-names = "pclk", "ipclk";
+
 			status = "disabled";
 
 			hsi2c_11: i2c@103b0000 {
@@ -986,6 +1021,7 @@ hsi2c_11: i2c@103b0000 {
 				clock-names = "hsi2c", "hsi2c_pclk";
 				#address-cells = <1>;
 				#size-cells = <0>;
+
 				status = "disabled";
 			};
 		};
@@ -1002,6 +1038,7 @@ usi_6: usi@109000c0 {
 			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_PCLK_0>,
 				 <&cmu_peric1 CLK_GOUT_PERIC1_IPCLK_0>;
 			clock-names = "pclk", "ipclk";
+
 			status = "disabled";
 
 			serial_6: serial@10900000 {
@@ -1015,6 +1052,7 @@ serial_6: serial@10900000 {
 					 <&cmu_peric1 CLK_GOUT_PERIC1_IPCLK_0>;
 				clock-names = "uart", "clk_uart_baud0";
 				samsung,uart-fifosize = <256>;
+
 				status = "disabled";
 			};
 
@@ -1035,6 +1073,7 @@ spi_6: spi@10900000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				fifo-depth = <256>;
+
 				status = "disabled";
 			};
 
@@ -1049,6 +1088,7 @@ hsi2c_12: i2c@10900000 {
 				clock-names = "hsi2c", "hsi2c_pclk";
 				#address-cells = <1>;
 				#size-cells = <0>;
+
 				status = "disabled";
 			};
 		};
@@ -1065,6 +1105,7 @@ usi_i2c_6: usi@109100c0 {
 			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_PCLK_1>,
 				 <&cmu_peric1 CLK_GOUT_PERIC1_IPCLK_1>;
 			clock-names = "pclk", "ipclk";
+
 			status = "disabled";
 
 			hsi2c_13: i2c@10910000 {
@@ -1078,6 +1119,7 @@ hsi2c_13: i2c@10910000 {
 				clock-names = "hsi2c", "hsi2c_pclk";
 				#address-cells = <1>;
 				#size-cells = <0>;
+
 				status = "disabled";
 			};
 		};
@@ -1094,6 +1136,7 @@ usi_7: usi@109200c0 {
 			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_PCLK_2>,
 				 <&cmu_peric1 CLK_GOUT_PERIC1_IPCLK_2>;
 			clock-names = "pclk", "ipclk";
+
 			status = "disabled";
 
 			serial_7: serial@10920000 {
@@ -1107,6 +1150,7 @@ serial_7: serial@10920000 {
 					 <&cmu_peric1 CLK_GOUT_PERIC1_IPCLK_2>;
 				clock-names = "uart", "clk_uart_baud0";
 				samsung,uart-fifosize = <64>;
+
 				status = "disabled";
 			};
 
@@ -1127,6 +1171,7 @@ spi_7: spi@10920000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				fifo-depth = <64>;
+
 				status = "disabled";
 			};
 
@@ -1141,6 +1186,7 @@ hsi2c_14: i2c@10920000 {
 				clock-names = "hsi2c", "hsi2c_pclk";
 				#address-cells = <1>;
 				#size-cells = <0>;
+
 				status = "disabled";
 			};
 		};
@@ -1157,6 +1203,7 @@ usi_i2c_7: usi@109300c0 {
 			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_PCLK_3>,
 				 <&cmu_peric1 CLK_GOUT_PERIC1_IPCLK_3>;
 			clock-names = "pclk", "ipclk";
+
 			status = "disabled";
 
 			hsi2c_15: i2c@10930000 {
@@ -1170,6 +1217,7 @@ hsi2c_15: i2c@10930000 {
 				clock-names = "hsi2c", "hsi2c_pclk";
 				#address-cells = <1>;
 				#size-cells = <0>;
+
 				status = "disabled";
 			};
 		};
@@ -1186,6 +1234,7 @@ usi_8: usi@109400c0 {
 			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_PCLK_4>,
 				 <&cmu_peric1 CLK_GOUT_PERIC1_IPCLK_4>;
 			clock-names = "pclk", "ipclk";
+
 			status = "disabled";
 
 			serial_8: serial@10940000 {
@@ -1199,6 +1248,7 @@ serial_8: serial@10940000 {
 					 <&cmu_peric1 CLK_GOUT_PERIC1_IPCLK_4>;
 				clock-names = "uart", "clk_uart_baud0";
 				samsung,uart-fifosize = <64>;
+
 				status = "disabled";
 			};
 
@@ -1219,6 +1269,7 @@ spi_8: spi@10940000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				fifo-depth = <64>;
+
 				status = "disabled";
 			};
 
@@ -1233,6 +1284,7 @@ hsi2c_16: i2c@10940000 {
 				clock-names = "hsi2c", "hsi2c_pclk";
 				#address-cells = <1>;
 				#size-cells = <0>;
+
 				status = "disabled";
 			};
 		};
@@ -1249,6 +1301,7 @@ usi_i2c_8: usi@109500c0 {
 			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_PCLK_5>,
 				 <&cmu_peric1 CLK_GOUT_PERIC1_IPCLK_5>;
 			clock-names = "pclk", "ipclk";
+
 			status = "disabled";
 
 			hsi2c_17: i2c@10950000 {
@@ -1262,6 +1315,7 @@ hsi2c_17: i2c@10950000 {
 				clock-names = "hsi2c", "hsi2c_pclk";
 				#address-cells = <1>;
 				#size-cells = <0>;
+
 				status = "disabled";
 			};
 		};
@@ -1278,6 +1332,7 @@ usi_9: usi@109600c0 {
 			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_PCLK_6>,
 				 <&cmu_peric1 CLK_GOUT_PERIC1_IPCLK_6>;
 			clock-names = "pclk", "ipclk";
+
 			status = "disabled";
 
 			serial_9: serial@10960000 {
@@ -1291,6 +1346,7 @@ serial_9: serial@10960000 {
 					 <&cmu_peric1 CLK_GOUT_PERIC1_IPCLK_6>;
 				clock-names = "uart", "clk_uart_baud0";
 				samsung,uart-fifosize = <64>;
+
 				status = "disabled";
 			};
 
@@ -1311,6 +1367,7 @@ spi_9: spi@10960000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				fifo-depth = <64>;
+
 				status = "disabled";
 			};
 
@@ -1325,6 +1382,7 @@ hsi2c_18: i2c@10960000 {
 				clock-names = "hsi2c", "hsi2c_pclk";
 				#address-cells = <1>;
 				#size-cells = <0>;
+
 				status = "disabled";
 			};
 		};
@@ -1341,6 +1399,7 @@ usi_i2c_9: usi@109700c0 {
 			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_PCLK_7>,
 				 <&cmu_peric1 CLK_GOUT_PERIC1_IPCLK_7>;
 			clock-names = "pclk", "ipclk";
+
 			status = "disabled";
 
 			hsi2c_19: i2c@10970000 {
@@ -1354,6 +1413,7 @@ hsi2c_19: i2c@10970000 {
 				clock-names = "hsi2c", "hsi2c_pclk";
 				#address-cells = <1>;
 				#size-cells = <0>;
+
 				status = "disabled";
 			};
 		};
@@ -1370,6 +1430,7 @@ usi_10: usi@109800c0 {
 			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_PCLK_8>,
 				 <&cmu_peric1 CLK_GOUT_PERIC1_IPCLK_8>;
 			clock-names = "pclk", "ipclk";
+
 			status = "disabled";
 
 			serial_10: serial@10980000 {
@@ -1383,6 +1444,7 @@ serial_10: serial@10980000 {
 					 <&cmu_peric1 CLK_GOUT_PERIC1_IPCLK_8>;
 				clock-names = "uart", "clk_uart_baud0";
 				samsung,uart-fifosize = <64>;
+
 				status = "disabled";
 			};
 
@@ -1403,6 +1465,7 @@ spi_10: spi@10980000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				fifo-depth = <64>;
+
 				status = "disabled";
 			};
 
@@ -1417,6 +1480,7 @@ hsi2c_20: i2c@10980000 {
 				clock-names = "hsi2c", "hsi2c_pclk";
 				#address-cells = <1>;
 				#size-cells = <0>;
+
 				status = "disabled";
 			};
 		};
@@ -1433,6 +1497,7 @@ usi_i2c_10: usi@109900c0 {
 			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_PCLK_9>,
 				 <&cmu_peric1 CLK_GOUT_PERIC1_IPCLK_9>;
 			clock-names = "pclk", "ipclk";
+
 			status = "disabled";
 
 			hsi2c_21: i2c@10990000 {
@@ -1446,6 +1511,7 @@ hsi2c_21: i2c@10990000 {
 				clock-names = "hsi2c", "hsi2c_pclk";
 				#address-cells = <1>;
 				#size-cells = <0>;
+
 				status = "disabled";
 			};
 		};
@@ -1462,6 +1528,7 @@ usi_11: usi@109a00c0 {
 			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_PCLK_10>,
 				 <&cmu_peric1 CLK_GOUT_PERIC1_IPCLK_10>;
 			clock-names = "pclk", "ipclk";
+
 			status = "disabled";
 
 			serial_11: serial@109a0000 {
@@ -1475,6 +1542,7 @@ serial_11: serial@109a0000 {
 					 <&cmu_peric1 CLK_GOUT_PERIC1_IPCLK_10>;
 				clock-names = "uart", "clk_uart_baud0";
 				samsung,uart-fifosize = <64>;
+
 				status = "disabled";
 			};
 
@@ -1493,6 +1561,7 @@ spi_11: spi@109a0000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				fifo-depth = <64>;
+
 				status = "disabled";
 			};
 
@@ -1507,6 +1576,7 @@ hsi2c_22: i2c@109a0000 {
 				clock-names = "hsi2c", "hsi2c_pclk";
 				#address-cells = <1>;
 				#size-cells = <0>;
+
 				status = "disabled";
 			};
 		};
@@ -1523,6 +1593,7 @@ usi_i2c_11: usi@109b00c0 {
 			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_PCLK_11>,
 				 <&cmu_peric1 CLK_GOUT_PERIC1_IPCLK_11>;
 			clock-names = "pclk", "ipclk";
+
 			status = "disabled";
 
 			hsi2c_23: i2c@109b0000 {
@@ -1536,6 +1607,7 @@ hsi2c_23: i2c@109b0000 {
 				clock-names = "hsi2c", "hsi2c_pclk";
 				#address-cells = <1>;
 				#size-cells = <0>;
+
 				status = "disabled";
 			};
 		};
@@ -1548,6 +1620,7 @@ ufs_0_phy: phy@17e04000 {
 			#phy-cells = <0>;
 			clocks = <&xtcxo>;
 			clock-names = "ref_clk";
+
 			status = "disabled";
 		};
 
@@ -1569,6 +1642,7 @@ ufs_0: ufs@17e00000 {
 			phys = <&ufs_0_phy>;
 			phy-names = "ufs-phy";
 			samsung,sysreg = <&syscon_fsys2 0x710>;
+
 			status = "disabled";
 		};
 
@@ -1580,6 +1654,7 @@ ufs_1_phy: phy@17f04000 {
 			#phy-cells = <0>;
 			clocks = <&xtcxo>;
 			clock-names = "ref_clk";
+
 			status = "disabled";
 		};
 
@@ -1601,6 +1676,7 @@ ufs_1: ufs@17f00000 {
 			phys = <&ufs_1_phy>;
 			phy-names = "ufs-phy";
 			samsung,sysreg = <&syscon_fsys2 0x714>;
+
 			status = "disabled";
 		};
 
@@ -1632,6 +1708,7 @@ pwm: pwm@103f0000 {
 			#pwm-cells = <3>;
 			clocks = <&xtcxo>;
 			clock-names = "timers";
+
 			status = "disabled";
 		};
 	};
diff --git a/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts b/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts
index 5873720c213e..a92e5751bf9b 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts
+++ b/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts
@@ -71,6 +71,7 @@ key_back: key-back-pins {
 &pwm {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pwm_tout0>;
+
 	status = "okay";
 };
 
@@ -80,6 +81,7 @@ &serial_0 {
 
 &usi_0 {
 	samsung,clkreq-on; /* needed for UART mode */
+
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
index e2f962dc1b3d..f42207bdc701 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
@@ -440,6 +440,7 @@ usi_0: usi@108800c0 {
 			clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
 				 <&cmu_peric0 CLK_DOUT_PERIC0_USI00_USI>;
 			clock-names = "pclk", "ipclk";
+
 			status = "disabled";
 
 			serial_0: serial@10880000 {
@@ -453,6 +454,7 @@ serial_0: serial@10880000 {
 					 <&cmu_peric0 CLK_DOUT_PERIC0_USI00_USI>;
 				clock-names = "uart", "clk_uart_baud0";
 				samsung,uart-fifosize = <256>;
+
 				status = "disabled";
 			};
 
@@ -473,6 +475,7 @@ spi_0: spi@10880000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				fifo-depth = <256>;
+
 				status = "disabled";
 			};
 		};
@@ -489,6 +492,7 @@ usi_1: usi@108a00c0 {
 			clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
 				 <&cmu_peric0 CLK_DOUT_PERIC0_USI01_USI>;
 			clock-names = "pclk", "ipclk";
+
 			status = "disabled";
 
 			serial_1: serial@108a0000 {
@@ -502,6 +506,7 @@ serial_1: serial@108a0000 {
 					 <&cmu_peric0 CLK_DOUT_PERIC0_USI01_USI>;
 				clock-names = "uart", "clk_uart_baud0";
 				samsung,uart-fifosize = <256>;
+
 				status = "disabled";
 			};
 
@@ -522,6 +527,7 @@ spi_1: spi@108a0000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				fifo-depth = <256>;
+
 				status = "disabled";
 			};
 		};
@@ -538,6 +544,7 @@ usi_2: usi@108c00c0 {
 			clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
 				 <&cmu_peric0 CLK_DOUT_PERIC0_USI02_USI>;
 			clock-names = "pclk", "ipclk";
+
 			status = "disabled";
 
 			serial_2: serial@108c0000 {
@@ -551,6 +558,7 @@ serial_2: serial@108c0000 {
 					 <&cmu_peric0 CLK_DOUT_PERIC0_USI02_USI>;
 				clock-names = "uart", "clk_uart_baud0";
 				samsung,uart-fifosize = <64>;
+
 				status = "disabled";
 			};
 
@@ -571,6 +579,7 @@ spi_2: spi@108c0000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				fifo-depth = <64>;
+
 				status = "disabled";
 			};
 		};
@@ -587,6 +596,7 @@ usi_3: usi@108e00c0 {
 			clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
 				 <&cmu_peric0 CLK_DOUT_PERIC0_USI03_USI>;
 			clock-names = "pclk", "ipclk";
+
 			status = "disabled";
 
 			serial_3: serial@108e0000 {
@@ -600,6 +610,7 @@ serial_3: serial@108e0000 {
 					 <&cmu_peric0 CLK_DOUT_PERIC0_USI03_USI>;
 				clock-names = "uart", "clk_uart_baud0";
 				samsung,uart-fifosize = <64>;
+
 				status = "disabled";
 			};
 
@@ -620,6 +631,7 @@ spi_3: spi@108e0000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				fifo-depth = <64>;
+
 				status = "disabled";
 			};
 		};
@@ -636,6 +648,7 @@ usi_4: usi@109000c0 {
 			clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
 				 <&cmu_peric0 CLK_DOUT_PERIC0_USI04_USI>;
 			clock-names = "pclk", "ipclk";
+
 			status = "disabled";
 
 			serial_4: serial@10900000 {
@@ -649,6 +662,7 @@ serial_4: serial@10900000 {
 					 <&cmu_peric0 CLK_DOUT_PERIC0_USI04_USI>;
 				clock-names = "uart", "clk_uart_baud0";
 				samsung,uart-fifosize = <64>;
+
 				status = "disabled";
 			};
 
@@ -669,6 +683,7 @@ spi_4: spi@10900000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				fifo-depth = <64>;
+
 				status = "disabled";
 			};
 		};
@@ -685,6 +700,7 @@ usi_5: usi@109200c0 {
 			clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
 				 <&cmu_peric0 CLK_DOUT_PERIC0_USI05_USI>;
 			clock-names = "pclk", "ipclk";
+
 			status = "disabled";
 
 			serial_5: serial@10920000 {
@@ -698,6 +714,7 @@ serial_5: serial@10920000 {
 					 <&cmu_peric0 CLK_DOUT_PERIC0_USI05_USI>;
 				clock-names = "uart", "clk_uart_baud0";
 				samsung,uart-fifosize = <64>;
+
 				status = "disabled";
 			};
 
@@ -718,6 +735,7 @@ spi_5: spi@10920000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				fifo-depth = <64>;
+
 				status = "disabled";
 			};
 		};
@@ -734,6 +752,7 @@ usi_6: usi@109400c0 {
 			clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
 				 <&cmu_peric0 CLK_DOUT_PERIC0_USI06_USI>;
 			clock-names = "pclk", "ipclk";
+
 			status = "disabled";
 
 			serial_6: serial@10940000 {
@@ -747,6 +766,7 @@ serial_6: serial@10940000 {
 					 <&cmu_peric0 CLK_DOUT_PERIC0_USI06_USI>;
 				clock-names = "uart", "clk_uart_baud0";
 				samsung,uart-fifosize = <64>;
+
 				status = "disabled";
 			};
 
@@ -767,6 +787,7 @@ spi_6: spi@10940000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				fifo-depth = <64>;
+
 				status = "disabled";
 			};
 		};
@@ -783,6 +804,7 @@ usi_7: usi@109600c0 {
 			clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
 				 <&cmu_peric0 CLK_DOUT_PERIC0_USI07_USI>;
 			clock-names = "pclk", "ipclk";
+
 			status = "disabled";
 
 			serial_7: serial@10960000 {
@@ -796,6 +818,7 @@ serial_7: serial@10960000 {
 					 <&cmu_peric0 CLK_DOUT_PERIC0_USI07_USI>;
 				clock-names = "uart", "clk_uart_baud0";
 				samsung,uart-fifosize = <64>;
+
 				status = "disabled";
 			};
 
@@ -816,6 +839,7 @@ spi_7: spi@10960000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				fifo-depth = <64>;
+
 				status = "disabled";
 			};
 		};
@@ -832,6 +856,7 @@ usi_8: usi@109800c0 {
 			clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
 				 <&cmu_peric0 CLK_DOUT_PERIC0_USI08_USI>;
 			clock-names = "pclk", "ipclk";
+
 			status = "disabled";
 
 			serial_8: serial@10980000 {
@@ -845,6 +870,7 @@ serial_8: serial@10980000 {
 					 <&cmu_peric0 CLK_DOUT_PERIC0_USI08_USI>;
 				clock-names = "uart", "clk_uart_baud0";
 				samsung,uart-fifosize = <64>;
+
 				status = "disabled";
 			};
 
@@ -865,6 +891,7 @@ spi_8: spi@10980000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				fifo-depth = <64>;
+
 				status = "disabled";
 			};
 
@@ -878,6 +905,7 @@ pwm: pwm@109b0000 {
 			#pwm-cells = <3>;
 			clocks = <&xtcxo>;
 			clock-names = "timers";
+
 			status = "disabled";
 		};
 
@@ -918,6 +946,7 @@ usi_9: usi@10c800c0 {
 			clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
 				 <&cmu_peric1 CLK_DOUT_PERIC1_USI09_USI>;
 			clock-names = "pclk", "ipclk";
+
 			status = "disabled";
 
 			serial_9: serial@10c8000 {
@@ -931,6 +960,7 @@ serial_9: serial@10c8000 {
 					 <&cmu_peric1 CLK_DOUT_PERIC1_USI09_USI>;
 				clock-names = "uart", "clk_uart_baud0";
 				samsung,uart-fifosize = <256>;
+
 				status = "disabled";
 			};
 
@@ -951,6 +981,7 @@ spi_9: spi@10c80000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				fifo-depth = <256>;
+
 				status = "disabled";
 			};
 		};
@@ -967,6 +998,7 @@ usi_10: usi@10ca00c0 {
 			clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
 				 <&cmu_peric1 CLK_DOUT_PERIC1_USI10_USI>;
 			clock-names = "pclk", "ipclk";
+
 			status = "disabled";
 
 			serial_10: serial@10ca0000 {
@@ -980,6 +1012,7 @@ serial_10: serial@10ca0000 {
 					 <&cmu_peric1 CLK_DOUT_PERIC1_USI10_USI>;
 				clock-names = "uart", "clk_uart_baud0";
 				samsung,uart-fifosize = <64>;
+
 				status = "disabled";
 			};
 
@@ -1000,6 +1033,7 @@ spi_10: spi@10ca0000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				fifo-depth = <64>;
+
 				status = "disabled";
 			};
 		};
@@ -1016,6 +1050,7 @@ usi_11: usi@10cc00c0 {
 			clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
 				 <&cmu_peric1 CLK_DOUT_PERIC1_USI11_USI>;
 			clock-names = "pclk", "ipclk";
+
 			status = "disabled";
 
 			serial_11: serial@10cc0000 {
@@ -1029,6 +1064,7 @@ serial_11: serial@10cc0000 {
 					 <&cmu_peric1 CLK_DOUT_PERIC1_USI11_USI>;
 				clock-names = "uart", "clk_uart_baud0";
 				samsung,uart-fifosize = <64>;
+
 				status = "disabled";
 			};
 
@@ -1049,6 +1085,7 @@ spi_11: spi@10cc0000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				fifo-depth = <64>;
+
 				status = "disabled";
 			};
 		};
@@ -1065,6 +1102,7 @@ usi_12: usi@10ce00c0 {
 			clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
 				 <&cmu_peric1 CLK_DOUT_PERIC1_USI12_USI>;
 			clock-names = "pclk", "ipclk";
+
 			status = "disabled";
 
 			serial_12: serial@10ce0000 {
@@ -1078,6 +1116,7 @@ serial_12: serial@10ce0000 {
 					 <&cmu_peric1 CLK_DOUT_PERIC1_USI12_USI>;
 				clock-names = "uart", "clk_uart_baud0";
 				samsung,uart-fifosize = <64>;
+
 				status = "disabled";
 			};
 
@@ -1098,6 +1137,7 @@ spi_12: spi@10ce0000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				fifo-depth = <64>;
+
 				status = "disabled";
 			};
 		};
@@ -1114,6 +1154,7 @@ usi_13: usi@10d000c0 {
 			clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
 				 <&cmu_peric1 CLK_DOUT_PERIC1_USI13_USI>;
 			clock-names = "pclk", "ipclk";
+
 			status = "disabled";
 
 			serial_13: serial@10d00000 {
@@ -1127,6 +1168,7 @@ serial_13: serial@10d00000 {
 					 <&cmu_peric1 CLK_DOUT_PERIC1_USI13_USI>;
 				clock-names = "uart", "clk_uart_baud0";
 				samsung,uart-fifosize = <64>;
+
 				status = "disabled";
 			};
 
@@ -1147,6 +1189,7 @@ spi_13: spi@10d00000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				fifo-depth = <64>;
+
 				status = "disabled";
 			};
 		};
@@ -1163,6 +1206,7 @@ usi_14: usi@10d200c0 {
 			clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
 				 <&cmu_peric1 CLK_DOUT_PERIC1_USI14_USI>;
 			clock-names = "pclk", "ipclk";
+
 			status = "disabled";
 
 			serial_14: serial@10d20000 {
@@ -1176,6 +1220,7 @@ serial_14: serial@10d20000 {
 					 <&cmu_peric1 CLK_DOUT_PERIC1_USI14_USI>;
 				clock-names = "uart", "clk_uart_baud0";
 				samsung,uart-fifosize = <64>;
+
 				status = "disabled";
 			};
 
@@ -1196,6 +1241,7 @@ spi_14: spi@10d20000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				fifo-depth = <64>;
+
 				status = "disabled";
 			};
 		};
@@ -1212,6 +1258,7 @@ usi_15: usi@10d400c0 {
 			clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
 				 <&cmu_peric1 CLK_DOUT_PERIC1_USI15_USI>;
 			clock-names = "pclk", "ipclk";
+
 			status = "disabled";
 
 			serial_15: serial@10d40000 {
@@ -1225,6 +1272,7 @@ serial_15: serial@10d40000 {
 					 <&cmu_peric1 CLK_DOUT_PERIC1_USI15_USI>;
 				clock-names = "uart", "clk_uart_baud0";
 				samsung,uart-fifosize = <64>;
+
 				status = "disabled";
 			};
 
@@ -1245,6 +1293,7 @@ spi_15: spi@10d40000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				fifo-depth = <64>;
+
 				status = "disabled";
 			};
 		};
@@ -1261,6 +1310,7 @@ usi_16: usi@10d600c0 {
 			clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
 				 <&cmu_peric1 CLK_DOUT_PERIC1_USI16_USI>;
 			clock-names = "pclk", "ipclk";
+
 			status = "disabled";
 
 			serial_16: serial@10d60000 {
@@ -1274,6 +1324,7 @@ serial_16: serial@10d60000 {
 					 <&cmu_peric1 CLK_DOUT_PERIC1_USI16_USI>;
 				clock-names = "uart", "clk_uart_baud0";
 				samsung,uart-fifosize = <64>;
+
 				status = "disabled";
 			};
 
@@ -1294,6 +1345,7 @@ spi_16: spi@10d60000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				fifo-depth = <64>;
+
 				status = "disabled";
 			};
 		};
@@ -1310,6 +1362,7 @@ usi_17: usi@10d800c0 {
 			clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
 				 <&cmu_peric1 CLK_DOUT_PERIC1_USI17_USI>;
 			clock-names = "pclk", "ipclk";
+
 			status = "disabled";
 
 			serial_17: serial@10d80000 {
@@ -1323,6 +1376,7 @@ serial_17: serial@10d80000 {
 					 <&cmu_peric1 CLK_DOUT_PERIC1_USI17_USI>;
 				clock-names = "uart", "clk_uart_baud0";
 				samsung,uart-fifosize = <64>;
+
 				status = "disabled";
 			};
 
@@ -1343,6 +1397,7 @@ spi_17: spi@10d80000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				fifo-depth = <64>;
+
 				status = "disabled";
 			};
 		};
@@ -1468,6 +1523,7 @@ ufs_0: ufs@16e00000 {
 			phy-names = "ufs-phy";
 			samsung,sysreg = <&syscon_hsi2 0x710>;
 			dma-coherent;
+
 			status = "disabled";
 		};
 
@@ -1479,6 +1535,7 @@ ufs_0_phy: phy@16e04000 {
 			clock-names = "ref_clk";
 			samsung,pmu-syscon = <&pmu_system_controller>;
 			#phy-cells = <0>;
+
 			status = "disabled";
 		};
 

-- 
2.53.0

