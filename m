Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7836A3D810F
	for <linux-samsung-soc@vger.kernel.org>; Sun, 26 Jul 2026 17:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785087848; cv=none; b=PhxZYrKVxhWIcU4dmzBQSnT1rxlXml5aPCZeWEsSYiMKme40l0rowKQb181p6hQcen3Hd6+uKuwuCRIbhcNRoDt5y3643gEl2qfAkgah01l+JVQMTrcMV7G6B8i2oqCBH4f1VvVhxXdbIqcNR5NdSOFyN+tR+mOpwhg74512FFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785087848; c=relaxed/simple;
	bh=81h/NpUY+BAhMT5VzRUpG+usgEMwA+SqQU5HHEqWTV0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f/18zq0jxIkLtxuZQq308G1gLVA+hqxrmLZ5lRcTUA0FXap/FWbkMquNg5gA1oXlFxsXNKtQn0/WHUJ/E1ylYMWGqb2S8lI3L6IBlDSfRNolD372ERacDM0WEP1vw1vbUN1mcFoi7cQXl41O70fWNv1WqcmWM25DElYgcXof5bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kLqXBKXn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fj+SKuGn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kLqXBKXn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fj+SKuGn"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66QH6tjA720943
	for <linux-samsung-soc@vger.kernel.org>; Sun, 26 Jul 2026 17:44:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W1sxayQIzF8Lwn+Pv055071yJYq6M5XmnU37zTzeh50=; b=kLqXBKXnn2+ou4ss
	MpFEW4ut119gpthBedri4Wil63UmJ8FLNYkj/v6HgfVjhb8veTqbFHsqvRjbVsNo
	anv5TDcEd4Tb3S1A+qn51LS5lOAuRVlZkMnWltAH3YkTJ730orNWbpFyyIaWyQJs
	4ZxFyxL6LRMiuvG8RFIIutJTr2O9BU1HiDRG9AVE5lzUxf9zbLSgOFai5eW4rFK1
	uOoTWLeTu0z+U5E5l8YjLMx0OUyrm8B/hYw7hW0lYXep6q5fC05XtudDJs+owh8v
	RMtNmrqoED0HAINFKoB5DGj+jFbAGtSehdcedRjPXxUNkDcJO1pGl/tys9y/U27C
	1EceBg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmpajk7vy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Sun, 26 Jul 2026 17:44:05 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c083f1818so25689651cf.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 26 Jul 2026 10:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785087844; x=1785692644; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W1sxayQIzF8Lwn+Pv055071yJYq6M5XmnU37zTzeh50=;
        b=Fj+SKuGnkjs5fKJVmFw8z+EuMpLlr5X3gacZ1SVTYlEgxeRaHef1WjoKgd2KI0BEXZ
         8Yf/SqNe3aZEL/bySgZlCeCOMAjUPuxdE86F+RAAsvmC4kNLkmhsk1rNp9RvaQGN76WT
         3WNnoQoacr1nB2nKggrzCEBK65LjsC5GD/tLmyuv61bn3ghBhHXW71ZK9prHmLPNXeQj
         CxdzzN8klQ2pWG2i5kzS4/WFDEADeMymHWfhbwoKBLD8TplWAbxG638w99ow/UcS2cwl
         iRwJAUf8Ma1Ur4pFGno+/L0cFWJprxK3ZgoYj+e4lAHr+PJpJ/YKj6dsc7BcYOHBEhWZ
         ViBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785087844; x=1785692644;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W1sxayQIzF8Lwn+Pv055071yJYq6M5XmnU37zTzeh50=;
        b=HCfmuSscGcQCECr8DQJ/HkRjxws/AUV+IuXA/IZb+lX29SQzzXCTjPViANsk/4mOjI
         4/EW7SmDk08pc/NM91mUe9U1FPQdZUQUbD6tN/SjFumNE9qER+rL7BnxtfGnz0MmnE8L
         9OnZUtcf3uIKqEmTdWeZLKgAYQX35jBmQ/JpuqWny9Mj5jPiyBMt+2d1wJtSjnnLfxao
         xLeaCEmCqbzP5rAXlsKmdboSzfu47fZeYczUW9w3xNbg7ADhpSb2TsXRY1RH60B/kQBc
         WixaI5onFZ7+PVc5BABkqLctbz0ca4dAr/KRvHgoSLoL7MJOcOJwiq2UsBUPTCrWS8fK
         +AyA==
X-Forwarded-Encrypted: i=1; AHgh+RrELGHEbT96TAVdJ5Gj+R9cq52thzkPL6cpv7MrwC9+izX7TLSVGW5CL576W2ac+++yNesagcvzJmOpAO5GAlhhSg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwX1hkUAzPabSyuSfGjNT8XXdvczmngg6SXJo6V+5Pwc/EvEdDW
	vzD9RWlRABg2UOLaWcHdVnl/Vso/Vt2NYVW0XTAqcMQT3dBeeMmqyws8Pz/3QPa5R5HnxOhCROF
	TbCUS0gPTU3KMmxulK4Q6yaYs7tPkwM+oFJ+gS+7F+HkpXEAXOUmICQmEHQ+7NDAY7JWPzRmAzQ
	==
X-Gm-Gg: AR+sD116vcyQCj/3yvipy3zPHROt/QAiYLQI+KCgvQRxVdi0APdfeFWWXY3fHnYZoWP
	PZsJ5st8S+nQPE/YBoezjhYj+jbzRuiJOaHStNKeoNLdQU+O8GRrHulC/AZe/5m/DqERX4NzIP5
	yEH6Fr0s51R/rmXkRtBOCFTv4s8onwKBLHJQA3tJDijl9coyoR60QnpHIdfiG4KZXfMKbuP5dhd
	L6PP8EVmHzijHEKkDPu9F2vHYhixh3HktOnhWjFRgoh99rJn7I2PX8rii3Mlw2uvdO1n9lR+F01
	4yzmml1fL2a/rXC/YzxYD12l72fEtddS0G2SCU9z6J2b1Jxb/uNK/HJ/KfDnzAw+R9lp/7m/Xca
	jttYe1z3A4nxdjM6xDSLradZ4
X-Received: by 2002:ac8:5e52:0:b0:51a:8c9b:649d with SMTP id d75a77b69052e-529a86be9d0mr62633901cf.65.1785087844504;
        Sun, 26 Jul 2026 10:44:04 -0700 (PDT)
X-Received: by 2002:ac8:5e52:0:b0:51a:8c9b:649d with SMTP id d75a77b69052e-529a86be9d0mr62633601cf.65.1785087844051;
        Sun, 26 Jul 2026 10:44:04 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c63bd3sm41576093f8f.27.2026.07.26.10.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 10:44:03 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 26 Jul 2026 19:43:39 +0200
Subject: [PATCH 6/8] arm64: dts: google: Align continued properties and add
 missing blank lines
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260726-b4-dts-coding-style-strict-v1-6-e9e3e9879d05@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1860;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=81h/NpUY+BAhMT5VzRUpG+usgEMwA+SqQU5HHEqWTV0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqZkdNe3cbFFnuh9igHgMRwU8Ngk7wB+urqIPjd
 mIyohZOq66JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCamZHTQAKCRDBN2bmhouD
 1+aiD/9Tg/88WLCYO9A7ibUJm0PLjbDYxkvxurEbuAFIbh3DpgIGFHKG3G8ZXtdU+338g6lkkaI
 NQWxiRtqwjpY8t2VnBNIob85dDh5+zAasCnkcfm97U2uwNSMRs1lKissKQzQVuM3/bOa4nlAO0Z
 2d7nU/KXqre0MvJQv8gLcyNpI5KFKONXEzd5S6D0vWSHQ4WZx6jaDLqlfvI/661HPTnoZ0QELuA
 Brh+TDkftis177bQeU8UyeV+F/vTcPV1rhtCz1L82/WNheyCOaDllhNOmuxC39Qr0p6AOVxatEu
 /5yZbAjC7FRAhLbNOhJVEu2IAmfzg6DMLaoYHFgMNefdFMnviw/CCLq1Kc8uNRWGN7/2k9F7P0v
 SL67GIN293GCbOIK2jAQXYljh0pRlE9v2skv4MdSkyaHUTGp1eZVITMsKP+lGwgJlWjHbPFSCGB
 /Ge2b9IvFxL+bjMtf2bKxpDkbPV5vQSUY9uWLAarChbhHpyuOJcxo5BmyuxwnMDm7UIF13FAtcS
 uPeVjnI6hWXy3nPFAvRHsoeZQlz/NM6x+Ve42QDXjIMqns5Rk+q49QjaCw9Brdgv0jYX3nlrk44
 vAw+OgXpWNd7dgVf+kmRNUaJ4VXjrHP72O7KREcLuAiqx/AXmukRI4QRzLwQP80pfw/zUxh+Boj
 ahqjD0hwRxBIJUA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: 0CZHDPQ1rdt1zMBsFaG8q1n7nfbudznw
X-Authority-Analysis: v=2.4 cv=A8Bc+aWG c=1 sm=1 tr=0 ts=6a664765 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=JN4siRDuy4uOFAZNwAMA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 0CZHDPQ1rdt1zMBsFaG8q1n7nfbudznw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI2MDE3OSBTYWx0ZWRfX5lSkStKTNdGD
 mQmCo2eW/xsMSoRpXOSx5/3AzB+T4Ak4VHbB4QIUIIZ4fnCuPowS7g6+sYidGC4652j45n7cRyd
 b/ezs8mQniFfW0KbDE29TUsUk9ajX1UnEG5v4myQ9QZdxzkfBl61kBA0lCj40aldPhgKHEd8wrN
 TElrG7Eo/KXnpQkwcOa2bHEpmxHcAC0Bp9HKKPhUQQumphEXyNUeFHa9nxHbWg9hDL+YlXOS1JX
 PFs0Jray1kuK/wITgmRPcH4U2i7B02SOyWbvxNgsd/TR2f4bjzBTxXRsP1N+62MVNgRxvnql/kj
 e7OE5noC/K+orjaJmqmCxg+uQkBMAPerkuaXS+0WFrfMm+RUlp+qczpP6jwUVEghfmtKeRzfZ7J
 i1L5ES2tFlWukq/scZKtLssYGDGGHYwvYWgIMEGlMQNJBCzhNZjcbsV9KhGABMvd7KIFslPabq4
 ig1kNFHDAGbOUAuZAfw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI2MDE3OSBTYWx0ZWRfX+mh8ipmpX9KP
 A9Al0Fj7WAd91IkYXbTOcZJ+KGAmL/177tBGnVcoICcFN819slbqCvFoHfhnmDhjbAInt5Rl5XN
 xm+kLjMoVQyFax/aVSDkFLRGvjNrCy0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-26_05,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607260179

Trivial white-space only changes to adjust to DTS coding style and fix
dt-check-style strict warnings like:

  [required-blank-lines] child node must be preceded by a blank line
  [continuation-alignment] continuation should align to column 39 (under < or ")

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index edc38f2d1183..bfceea5486f4 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -39,12 +39,15 @@ cluster0 {
 				core0 {
 					cpu = <&cpu0>;
 				};
+
 				core1 {
 					cpu = <&cpu1>;
 				};
+
 				core2 {
 					cpu = <&cpu2>;
 				};
+
 				core3 {
 					cpu = <&cpu3>;
 				};
@@ -54,6 +57,7 @@ cluster1 {
 				core0 {
 					cpu = <&cpu4>;
 				};
+
 				core1 {
 					cpu = <&cpu5>;
 				};
@@ -63,6 +67,7 @@ cluster2 {
 				core0 {
 					cpu = <&cpu6>;
 				};
+
 				core1 {
 					cpu = <&cpu7>;
 				};
@@ -1681,9 +1686,9 @@ usbdrd31: usb@11110000 {
 			compatible = "google,gs101-dwusb3";
 			ranges = <0x0 0x11110000 0x10000>;
 			clocks = <&cmu_hsi0 CLK_GOUT_HSI0_USB31DRD_BUS_CLK_EARLY>,
-				<&cmu_hsi0 CLK_GOUT_HSI0_USB31DRD_I_USB31DRD_SUSPEND_CLK_26>,
-				<&cmu_hsi0 CLK_GOUT_HSI0_UASC_HSI0_LINK_ACLK>,
-				<&cmu_hsi0 CLK_GOUT_HSI0_UASC_HSI0_LINK_PCLK>;
+				 <&cmu_hsi0 CLK_GOUT_HSI0_USB31DRD_I_USB31DRD_SUSPEND_CLK_26>,
+				 <&cmu_hsi0 CLK_GOUT_HSI0_UASC_HSI0_LINK_ACLK>,
+				 <&cmu_hsi0 CLK_GOUT_HSI0_UASC_HSI0_LINK_PCLK>;
 			clock-names = "bus_early", "susp_clk", "link_aclk", "link_pclk";
 			#address-cells = <1>;
 			#size-cells = <1>;

-- 
2.53.0

