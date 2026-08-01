Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0321F39A801
	for <linux-samsung-soc@vger.kernel.org>; Sat,  1 Aug 2026 15:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785596845; cv=none; b=L+Yciy9+yYmUNDgGKRMhE1Fxd95Uk+35NQx92IOB4tyd9S726NObvA5xmb6G+YXnkii2zp8J/ZIBpKJq9YtfE3AmnMrnpnDGf7PjuF3cZnERxR4vgX29Ntr0eDfyOUDRrmb033ygCXzBZCnvJyj/CvfbCLapqT7n/jdiMF7JZSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785596845; c=relaxed/simple;
	bh=eI9cigZBYo27aCYokXW3WOPKPg+d9T3KT76aMe8yYlk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g69Bz2ZDvs/TyDA1SJDcc59QnAE8xXSgcMQeWViXwfMEIATD8QfiXKTZVQQOGYVco0cXWnw8wy7ROID1MrVT/c9B/HZpBNkjd6Zojs9jcXDKxpbbWdlITR/a/QAx1i8GeDs3KcUdChY/ud2byFpyUEvOcrCbie9xCEfWaf65qdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OT8KkZM6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iBLsWAaw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OT8KkZM6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iBLsWAaw"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 671CabuB2738123
	for <linux-samsung-soc@vger.kernel.org>; Sat, 1 Aug 2026 15:07:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mIK0VV1ffvqe4y9mElEuM/axbwDfYeRm9xMRFM2Otfc=; b=OT8KkZM6dUY9VR2S
	HFqfsL/Nvr6y+1u7bWshgTlbB0+wOq07d4ecP1/16QC5WjgVQ8pekEcAaHy7/klh
	1o/3gBdDGDebJ0v4HBH+63CIo+GboaR/lpGFAUvF+/hWUP79mmEmT6CY004TEFSo
	A5rsrxGXJOdsUveZY/pP826eCwZnqOxtapA/cVRhxu0i6k3ExHHGEJ+3oJhahl4H
	y7Tt9YPFZR3yhYwjZ4VdYGW0x922HXriIF4wBahN4w93mlqs0N7BzFFZ21Bqe71K
	FKljIopVEFYKqjXxJsmNseAnOVgKfnBolaps/hZpqJDIJoos8ehX6TY52J0LvhUK
	3jF2Ww==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fsa380ybx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Sat, 01 Aug 2026 15:07:22 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5174a23afcbso18827231cf.3
        for <linux-samsung-soc@vger.kernel.org>; Sat, 01 Aug 2026 08:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785596841; x=1786201641; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mIK0VV1ffvqe4y9mElEuM/axbwDfYeRm9xMRFM2Otfc=;
        b=iBLsWAawqqa9wMSP9GMIKydSJWMSS7jN/ASne3bVvGsOzueCR+YSyEWVCWHQB0G1ER
         H9HTMNVbWQ3Gpq4kwIpB05rH6c0wGf/ROPc88FZ7b16hPKST7fHcJ23XhqSqR9v3yBk5
         gEiNVTr1rc8osMuZI4plhmpX4Sy+Gj/BSmW8uiP3pQynSZWUSkE5zPAGYZ4dyMreUyex
         bJbNuzKZBemYHTVJk2Prid2HygbEu9iLgpwGgEoLxN3qQMcnkrk2wp9h3YsD4Q7jL6mP
         vs7Jg4mReRwU/k3U7EAMDBr4J/VK+9/K3m6c+WWt+JW2A58GCK4Yu5Sk1kOP6CH+UOC+
         Z8mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785596841; x=1786201641;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mIK0VV1ffvqe4y9mElEuM/axbwDfYeRm9xMRFM2Otfc=;
        b=TxinYKIq0NKG8n02F8/Y2Gb1xEINfpwLLaaAvKgG81/Ltx3nUihzkf/ohmdeIYGhqa
         mxM5ZbEWZ13QOuxFG+AsTjyS+rkoi1qc9iZizSMPMO4dxoyH0GCQ/EQD5Xiy4yJAW7Za
         pwbKyCBZCM61B4wyYiX5PmvVpJF6rpTxuOrXo/zzw9RU8h1rnoGAjbclrkdtnuVy4WV3
         AL6zgmfFt2sUTeQsadu/M9pBmBJHJLYI2Wi10eb6/nH9XgnR0o0jJCUpd5x8kFM7c1z1
         vcu4bSRUSx1pDlio+trmACp9/iQ5wejKskQALDhEigGVDawVZLYMzrRFBgcQZ4aawpj3
         AtJQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr+DQ3vWk7hqtinudOtYEPP/SqQBEchMzvaeAkmFlIuvtE0zilYVGG2RpIAnOlGtFZmhYMOkzLfq71Xf4qmKy4Yng==@vger.kernel.org
X-Gm-Message-State: AOJu0YxiHXQDOIWSUwU58nFSdxMdjiuOpbTVNmkpW4eUVKhnyMz66d5h
	T0puBIhmw6UFnTWi3sS35g3Mx8rGv8ySoVPyAXsFccteO5QlyMtCp5MYT3Hs3CRI38C664NHl/Y
	5kyEi9qQBLdfBUaOtJ55L37GmX1RIqjn4Qzl5WYh6gpxRSd69PBdTASGI8TAbSIBysnuYMRc4rA
	==
X-Gm-Gg: AR+sD12UvRZfX+w3THlnZ3FpGnjsBQauFUk07lEjv5B1U4NC0vnOoeT5xJIDhRPqCyx
	QXZDsPDlBbPe/o/BtLUaQIIRoBhUvi8sqMiMM2hD92wdn8cEmotUnKfI6q/gKsK3BOQ5O7YJBQO
	SV6xF9nJUXa1o57dzJ+LedKLV3S+wrLaK4crRK5mKRRq6FU3UImeksYqeCpEP8pbXm8SNdJ2ATT
	wi/qAzR0jClXPSdSh/sEtFKRkpCFbIRHdbvANhL30nZ9MyWq8JzICX9DbTjvLACZmuc2eSOpN9j
	tdTuGJNRsk67f3rqIMEqvKzfxvSflqUqhGht0lKd47VIva0yPFjewPL7EAZL5qAhFFE0ctEQ3+j
	V5m/z14S+K2bNBSHcvdO207GW
X-Received: by 2002:ac8:5fd5:0:b0:528:1478:e1fc with SMTP id d75a77b69052e-52b5679523cmr68777911cf.34.1785596841038;
        Sat, 01 Aug 2026 08:07:21 -0700 (PDT)
X-Received: by 2002:ac8:5fd5:0:b0:528:1478:e1fc with SMTP id d75a77b69052e-52b5679523cmr68776961cf.34.1785596840534;
        Sat, 01 Aug 2026 08:07:20 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd45a1abfsm16005222f8f.37.2026.08.01.08.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 08:07:19 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sat, 01 Aug 2026 17:06:59 +0200
Subject: [PATCH v2 4/8] arm64: dts: exynos: Re-order clocks and align
 continued properties
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260801-b4-dts-coding-style-strict-v2-4-f09a659ab80d@oss.qualcomm.com>
References: <20260801-b4-dts-coding-style-strict-v2-0-f09a659ab80d@oss.qualcomm.com>
In-Reply-To: <20260801-b4-dts-coding-style-strict-v2-0-f09a659ab80d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=22700;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=eI9cigZBYo27aCYokXW3WOPKPg+d9T3KT76aMe8yYlk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqbguY7PLrlnZjgSqTvADMBmCiqhhMnlmAoY164
 zvDLVhbgwKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCam4LmAAKCRDBN2bmhouD
 12ZCD/9RtHykCbTRceRlaN10BEn3e4PlsOE2Jci2lAcKiMuiPIQ1f6NQh4fqOcT5vRCmAKWy3/C
 knLnHLCVm+/Z0TYToCYKOrxESlz3Zm/g7ZU6CdHedokAiqK406FpeErWlQ+lid7OjUwLlatKpQT
 JNy9yv7Ph8yzFEdR0XxdHOYR8OMWbmzkyD+qoLNa3SF5V1JM48i67+vxtny2UfZiS7a+vsvtXOB
 TFrS352ebIxVJJ+Uf6x/djYgkucxl3qZSCb8hSWEr0TnCI6MLrCJb4xBUpBABuCBLwYLxbhBQJU
 Fy8hsiKGe5S3NaFAjB5lSGL7386XDbozIO3peYOu/F6m86RtPahCVDVGWfk5JTb7t+XMDrJ3okD
 8pIiovOI37zzUc6rRzIz0RWNcJn7uXTxuB5pKBn+5nctrj5fJZfd6BNyDzuQ4TBczF4nl8NKOB9
 xhsm6+qomaPnyaF9uhbQnA+oRHgs1phIFdwTUKeExjE2u0TPyYDUlp9fq1k+hw3LYAY94Hc+RQ6
 GzikWB+GTvfgkl3GvuZuJldZ6aIFWbP84hTZFYDFaCzixF2TXDxCjo952qKu5g0sZ4MC5fyLu64
 WCY8cBLFi6DyEePJVArFUI58AtnRUkjK6dy3Tm/HgVwWiYNIeHFA2/tFQa3EVYpDegofBYRr+AO
 NnfUlbnaLcLKN/A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=KezidwYD c=1 sm=1 tr=0 ts=6a6e0baa cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=tfvXpbmQJ99Qm8LONJ0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDEyMiBTYWx0ZWRfX2GLr9rsYvQuJ
 8qWDswFFK8OwUcA6QJm8QX0C0s6IzXs2IgPYPaqUELxWx/0d6a2Vyrg94Hq+bjqmEsn1qJQvjjn
 WPE4rlwwcX/1g3+hqj/6PBhFklmBcGc=
X-Proofpoint-ORIG-GUID: G0Z7ORRYiKwrulBzFyvwmxg6vBYBGSnq
X-Proofpoint-GUID: G0Z7ORRYiKwrulBzFyvwmxg6vBYBGSnq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDEyMiBTYWx0ZWRfXyOb5I++2kOIP
 AlS//PO5a7dISvHNMhMcaiUPUxLoYhUVnmJBCPmLpGCLv4093kIuzJnVbUMQOFWmRVfpaxfATJk
 KD2Oe5KqntNJzNtE8BmYELTcVPmtTcFXsW6sfkCG+CVLfsopqnabVR2nbBBYAPEOJ9mKcs8BWut
 jaZMMyCcnMrgpnDTyDovRfTatjS5PHKxBKH8dEy1X5otKxDjH42wDqXIDj8BRocs3y3DDKJT1UJ
 BvmpU8Xd6UpC8d1XoiellCVo2NmycsuyckgXyoXrNE5jkC/u9pPNWyyNTcqg34cdZYkY+RzlTTy
 e5UC4sDy8hMHVvzY36x24dQn+wUsq+lnpUmYe5wU2EpoCbc9QFaLpL42UsbFL5PM3ktACTjsY1D
 IwMBGW/FKjIQ57AJtQemMyIfitRMcaf1Gfzcb4xmHK5wF29gq6RwTJxi/sODBzJJ++GvQ05tLBA
 cgRBL63QDQ9ajAN6HtQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-01_01,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608010122

Trivial white-space only changes to adjust to DTS coding style
(clocks-names should follow clocks) and fix dt-check-style strict
warnings like:

  [property-order] property 'clocks' out of canonical order (should sort before 'clock-names')
  [continuation-alignment] continuation should align to column 39 (under < or ")

Reviewed-by: André Draszik <andre.draszik@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/exynos/exynos5433.dtsi | 282 ++++++++++++++---------------
 1 file changed, 141 insertions(+), 141 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
index ebd63b9e244d..d318c87effaa 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
@@ -400,14 +400,14 @@ cmu_top: clock-controller@10030000 {
 			reg = <0x10030000 0x1000>;
 			#clock-cells = <1>;
 
-			clock-names = "oscclk",
-				"sclk_mphy_pll",
-				"sclk_mfc_pll",
-				"sclk_bus_pll";
 			clocks = <&xxti>,
-				<&cmu_cpif CLK_SCLK_MPHY_PLL>,
-				<&cmu_mif CLK_SCLK_MFC_PLL>,
-				<&cmu_mif CLK_SCLK_BUS_PLL>;
+				 <&cmu_cpif CLK_SCLK_MPHY_PLL>,
+				 <&cmu_mif CLK_SCLK_MFC_PLL>,
+				 <&cmu_mif CLK_SCLK_BUS_PLL>;
+			clock-names = "oscclk",
+				      "sclk_mphy_pll",
+				      "sclk_mfc_pll",
+				      "sclk_bus_pll";
 		};
 
 		cmu_cpif: clock-controller@10fc0000 {
@@ -415,8 +415,8 @@ cmu_cpif: clock-controller@10fc0000 {
 			reg = <0x10fc0000 0x1000>;
 			#clock-cells = <1>;
 
-			clock-names = "oscclk";
 			clocks = <&xxti>;
+			clock-names = "oscclk";
 		};
 
 		cmu_mif: clock-controller@105b0000 {
@@ -424,10 +424,10 @@ cmu_mif: clock-controller@105b0000 {
 			reg = <0x105b0000 0x2000>;
 			#clock-cells = <1>;
 
-			clock-names = "oscclk",
-				"sclk_mphy_pll";
 			clocks = <&xxti>,
-				<&cmu_cpif CLK_SCLK_MPHY_PLL>;
+				 <&cmu_cpif CLK_SCLK_MPHY_PLL>;
+			clock-names = "oscclk",
+				      "sclk_mphy_pll";
 		};
 
 		cmu_peric: clock-controller@14c80000 {
@@ -447,26 +447,26 @@ cmu_fsys: clock-controller@156e0000 {
 			reg = <0x156e0000 0x1000>;
 			#clock-cells = <1>;
 
-			clock-names = "oscclk",
-				"sclk_ufs_mphy",
-				"aclk_fsys_200",
-				"sclk_pcie_100_fsys",
-				"sclk_ufsunipro_fsys",
-				"sclk_mmc2_fsys",
-				"sclk_mmc1_fsys",
-				"sclk_mmc0_fsys",
-				"sclk_usbhost30_fsys",
-				"sclk_usbdrd30_fsys";
 			clocks = <&xxti>,
-				<&cmu_cpif CLK_SCLK_UFS_MPHY>,
-				<&cmu_top CLK_ACLK_FSYS_200>,
-				<&cmu_top CLK_SCLK_PCIE_100_FSYS>,
-				<&cmu_top CLK_SCLK_UFSUNIPRO_FSYS>,
-				<&cmu_top CLK_SCLK_MMC2_FSYS>,
-				<&cmu_top CLK_SCLK_MMC1_FSYS>,
-				<&cmu_top CLK_SCLK_MMC0_FSYS>,
-				<&cmu_top CLK_SCLK_USBHOST30_FSYS>,
-				<&cmu_top CLK_SCLK_USBDRD30_FSYS>;
+				 <&cmu_cpif CLK_SCLK_UFS_MPHY>,
+				 <&cmu_top CLK_ACLK_FSYS_200>,
+				 <&cmu_top CLK_SCLK_PCIE_100_FSYS>,
+				 <&cmu_top CLK_SCLK_UFSUNIPRO_FSYS>,
+				 <&cmu_top CLK_SCLK_MMC2_FSYS>,
+				 <&cmu_top CLK_SCLK_MMC1_FSYS>,
+				 <&cmu_top CLK_SCLK_MMC0_FSYS>,
+				 <&cmu_top CLK_SCLK_USBHOST30_FSYS>,
+				 <&cmu_top CLK_SCLK_USBDRD30_FSYS>;
+			clock-names = "oscclk",
+				      "sclk_ufs_mphy",
+				      "aclk_fsys_200",
+				      "sclk_pcie_100_fsys",
+				      "sclk_ufsunipro_fsys",
+				      "sclk_mmc2_fsys",
+				      "sclk_mmc1_fsys",
+				      "sclk_mmc0_fsys",
+				      "sclk_usbhost30_fsys",
+				      "sclk_usbdrd30_fsys";
 		};
 
 		cmu_g2d: clock-controller@12460000 {
@@ -474,12 +474,12 @@ cmu_g2d: clock-controller@12460000 {
 			reg = <0x12460000 0x1000>;
 			#clock-cells = <1>;
 
-			clock-names = "oscclk",
-				"aclk_g2d_266",
-				"aclk_g2d_400";
 			clocks = <&xxti>,
-				<&cmu_top CLK_ACLK_G2D_266>,
-				<&cmu_top CLK_ACLK_G2D_400>;
+				 <&cmu_top CLK_ACLK_G2D_266>,
+				 <&cmu_top CLK_ACLK_G2D_400>;
+			clock-names = "oscclk",
+				      "aclk_g2d_266",
+				      "aclk_g2d_400";
 			power-domains = <&pd_g2d>;
 		};
 
@@ -488,24 +488,24 @@ cmu_disp: clock-controller@13b90000 {
 			reg = <0x13b90000 0x1000>;
 			#clock-cells = <1>;
 
-			clock-names = "oscclk",
-				"sclk_dsim1_disp",
-				"sclk_dsim0_disp",
-				"sclk_dsd_disp",
-				"sclk_decon_tv_eclk_disp",
-				"sclk_decon_vclk_disp",
-				"sclk_decon_eclk_disp",
-				"sclk_decon_tv_vclk_disp",
-				"aclk_disp_333";
 			clocks = <&xxti>,
-				<&cmu_mif CLK_SCLK_DSIM1_DISP>,
-				<&cmu_mif CLK_SCLK_DSIM0_DISP>,
-				<&cmu_mif CLK_SCLK_DSD_DISP>,
-				<&cmu_mif CLK_SCLK_DECON_TV_ECLK_DISP>,
-				<&cmu_mif CLK_SCLK_DECON_VCLK_DISP>,
-				<&cmu_mif CLK_SCLK_DECON_ECLK_DISP>,
-				<&cmu_mif CLK_SCLK_DECON_TV_VCLK_DISP>,
-				<&cmu_mif CLK_ACLK_DISP_333>;
+				 <&cmu_mif CLK_SCLK_DSIM1_DISP>,
+				 <&cmu_mif CLK_SCLK_DSIM0_DISP>,
+				 <&cmu_mif CLK_SCLK_DSD_DISP>,
+				 <&cmu_mif CLK_SCLK_DECON_TV_ECLK_DISP>,
+				 <&cmu_mif CLK_SCLK_DECON_VCLK_DISP>,
+				 <&cmu_mif CLK_SCLK_DECON_ECLK_DISP>,
+				 <&cmu_mif CLK_SCLK_DECON_TV_VCLK_DISP>,
+				 <&cmu_mif CLK_ACLK_DISP_333>;
+			clock-names = "oscclk",
+				      "sclk_dsim1_disp",
+				      "sclk_dsim0_disp",
+				      "sclk_dsd_disp",
+				      "sclk_decon_tv_eclk_disp",
+				      "sclk_decon_vclk_disp",
+				      "sclk_decon_eclk_disp",
+				      "sclk_decon_tv_vclk_disp",
+				      "aclk_disp_333";
 			power-domains = <&pd_disp>;
 		};
 
@@ -513,8 +513,8 @@ cmu_aud: clock-controller@114c0000 {
 			compatible = "samsung,exynos5433-cmu-aud";
 			reg = <0x114c0000 0x1000>;
 			#clock-cells = <1>;
-			clock-names = "oscclk", "fout_aud_pll";
 			clocks = <&xxti>, <&cmu_top CLK_FOUT_AUD_PLL>;
+			clock-names = "oscclk", "fout_aud_pll";
 			power-domains = <&pd_aud>;
 		};
 
@@ -523,8 +523,8 @@ cmu_bus0: clock-controller@13600000 {
 			reg = <0x13600000 0x1000>;
 			#clock-cells = <1>;
 
-			clock-names = "aclk_bus0_400";
 			clocks = <&cmu_top CLK_ACLK_BUS0_400>;
+			clock-names = "aclk_bus0_400";
 		};
 
 		cmu_bus1: clock-controller@14800000 {
@@ -532,8 +532,8 @@ cmu_bus1: clock-controller@14800000 {
 			reg = <0x14800000 0x1000>;
 			#clock-cells = <1>;
 
-			clock-names = "aclk_bus1_400";
 			clocks = <&cmu_top CLK_ACLK_BUS1_400>;
+			clock-names = "aclk_bus1_400";
 		};
 
 		cmu_bus2: clock-controller@13400000 {
@@ -541,8 +541,8 @@ cmu_bus2: clock-controller@13400000 {
 			reg = <0x13400000 0x1000>;
 			#clock-cells = <1>;
 
-			clock-names = "oscclk", "aclk_bus2_400";
 			clocks = <&xxti>, <&cmu_mif CLK_ACLK_BUS2_400>;
+			clock-names = "oscclk", "aclk_bus2_400";
 		};
 
 		cmu_g3d: clock-controller@14aa0000 {
@@ -550,8 +550,8 @@ cmu_g3d: clock-controller@14aa0000 {
 			reg = <0x14aa0000 0x2000>;
 			#clock-cells = <1>;
 
-			clock-names = "oscclk", "aclk_g3d_400";
 			clocks = <&xxti>, <&cmu_top CLK_ACLK_G3D_400>;
+			clock-names = "oscclk", "aclk_g3d_400";
 			power-domains = <&pd_g3d>;
 		};
 
@@ -560,12 +560,12 @@ cmu_gscl: clock-controller@13cf0000 {
 			reg = <0x13cf0000 0x1000>;
 			#clock-cells = <1>;
 
-			clock-names = "oscclk",
-				"aclk_gscl_111",
-				"aclk_gscl_333";
 			clocks = <&xxti>,
-				<&cmu_top CLK_ACLK_GSCL_111>,
-				<&cmu_top CLK_ACLK_GSCL_333>;
+				 <&cmu_top CLK_ACLK_GSCL_111>,
+				 <&cmu_top CLK_ACLK_GSCL_333>;
+			clock-names = "oscclk",
+				      "aclk_gscl_111",
+				      "aclk_gscl_333";
 			power-domains = <&pd_gscl>;
 		};
 
@@ -574,8 +574,8 @@ cmu_apollo: clock-controller@11900000 {
 			reg = <0x11900000 0x2000>;
 			#clock-cells = <1>;
 
-			clock-names = "oscclk", "sclk_bus_pll_apollo";
 			clocks = <&xxti>, <&cmu_mif CLK_SCLK_BUS_PLL_APOLLO>;
+			clock-names = "oscclk", "sclk_bus_pll_apollo";
 		};
 
 		cmu_atlas: clock-controller@11800000 {
@@ -583,8 +583,8 @@ cmu_atlas: clock-controller@11800000 {
 			reg = <0x11800000 0x2000>;
 			#clock-cells = <1>;
 
-			clock-names = "oscclk", "sclk_bus_pll_atlas";
 			clocks = <&xxti>, <&cmu_mif CLK_SCLK_BUS_PLL_ATLAS>;
+			clock-names = "oscclk", "sclk_bus_pll_atlas";
 		};
 
 		cmu_mscl: clock-controller@150d0000 {
@@ -592,12 +592,12 @@ cmu_mscl: clock-controller@150d0000 {
 			reg = <0x150d0000 0x1000>;
 			#clock-cells = <1>;
 
-			clock-names = "oscclk",
-				"sclk_jpeg_mscl",
-				"aclk_mscl_400";
 			clocks = <&xxti>,
-				<&cmu_top CLK_SCLK_JPEG_MSCL>,
-				<&cmu_top CLK_ACLK_MSCL_400>;
+				 <&cmu_top CLK_SCLK_JPEG_MSCL>,
+				 <&cmu_top CLK_ACLK_MSCL_400>;
+			clock-names = "oscclk",
+				      "sclk_jpeg_mscl",
+				      "aclk_mscl_400";
 			power-domains = <&pd_mscl>;
 		};
 
@@ -606,8 +606,8 @@ cmu_mfc: clock-controller@15280000 {
 			reg = <0x15280000 0x1000>;
 			#clock-cells = <1>;
 
-			clock-names = "oscclk", "aclk_mfc_400";
 			clocks = <&xxti>, <&cmu_top CLK_ACLK_MFC_400>;
+			clock-names = "oscclk", "aclk_mfc_400";
 			power-domains = <&pd_mfc>;
 		};
 
@@ -616,8 +616,8 @@ cmu_hevc: clock-controller@14f80000 {
 			reg = <0x14f80000 0x1000>;
 			#clock-cells = <1>;
 
-			clock-names = "oscclk", "aclk_hevc_400";
 			clocks = <&xxti>, <&cmu_top CLK_ACLK_HEVC_400>;
+			clock-names = "oscclk", "aclk_hevc_400";
 			power-domains = <&pd_hevc>;
 		};
 
@@ -626,12 +626,12 @@ cmu_isp: clock-controller@146d0000 {
 			reg = <0x146d0000 0x1000>;
 			#clock-cells = <1>;
 
-			clock-names = "oscclk",
-				"aclk_isp_dis_400",
-				"aclk_isp_400";
 			clocks = <&xxti>,
-				<&cmu_top CLK_ACLK_ISP_DIS_400>,
-				<&cmu_top CLK_ACLK_ISP_400>;
+				 <&cmu_top CLK_ACLK_ISP_DIS_400>,
+				 <&cmu_top CLK_ACLK_ISP_400>;
+			clock-names = "oscclk",
+				      "aclk_isp_dis_400",
+				      "aclk_isp_400";
 			power-domains = <&pd_isp>;
 		};
 
@@ -640,14 +640,14 @@ cmu_cam0: clock-controller@120d0000 {
 			reg = <0x120d0000 0x1000>;
 			#clock-cells = <1>;
 
-			clock-names = "oscclk",
-				"aclk_cam0_333",
-				"aclk_cam0_400",
-				"aclk_cam0_552";
 			clocks = <&xxti>,
-				<&cmu_top CLK_ACLK_CAM0_333>,
-				<&cmu_top CLK_ACLK_CAM0_400>,
-				<&cmu_top CLK_ACLK_CAM0_552>;
+				 <&cmu_top CLK_ACLK_CAM0_333>,
+				 <&cmu_top CLK_ACLK_CAM0_400>,
+				 <&cmu_top CLK_ACLK_CAM0_552>;
+			clock-names = "oscclk",
+				      "aclk_cam0_333",
+				      "aclk_cam0_400",
+				      "aclk_cam0_552";
 			power-domains = <&pd_cam0>;
 		};
 
@@ -656,20 +656,20 @@ cmu_cam1: clock-controller@145d0000 {
 			reg = <0x145d0000 0x1000>;
 			#clock-cells = <1>;
 
-			clock-names = "oscclk",
-				"sclk_isp_uart_cam1",
-				"sclk_isp_spi1_cam1",
-				"sclk_isp_spi0_cam1",
-				"aclk_cam1_333",
-				"aclk_cam1_400",
-				"aclk_cam1_552";
 			clocks = <&xxti>,
-				<&cmu_top CLK_SCLK_ISP_UART_CAM1>,
-				<&cmu_top CLK_SCLK_ISP_SPI1_CAM1>,
-				<&cmu_top CLK_SCLK_ISP_SPI0_CAM1>,
-				<&cmu_top CLK_ACLK_CAM1_333>,
-				<&cmu_top CLK_ACLK_CAM1_400>,
-				<&cmu_top CLK_ACLK_CAM1_552>;
+				 <&cmu_top CLK_SCLK_ISP_UART_CAM1>,
+				 <&cmu_top CLK_SCLK_ISP_SPI1_CAM1>,
+				 <&cmu_top CLK_SCLK_ISP_SPI0_CAM1>,
+				 <&cmu_top CLK_ACLK_CAM1_333>,
+				 <&cmu_top CLK_ACLK_CAM1_400>,
+				 <&cmu_top CLK_ACLK_CAM1_552>;
+			clock-names = "oscclk",
+				      "sclk_isp_uart_cam1",
+				      "sclk_isp_spi1_cam1",
+				      "sclk_isp_spi0_cam1",
+				      "aclk_cam1_333",
+				      "aclk_cam1_400",
+				      "aclk_cam1_552";
 			power-domains = <&pd_cam1>;
 		};
 
@@ -678,23 +678,23 @@ cmu_imem: clock-controller@11060000 {
 			reg = <0x11060000 0x1000>;
 			#clock-cells = <1>;
 
-			clock-names = "oscclk",
-				"aclk_imem_sssx_266",
-				"aclk_imem_266",
-				"aclk_imem_200";
 			clocks = <&xxti>,
-				<&cmu_top CLK_DIV_ACLK_IMEM_SSSX_266>,
-				<&cmu_top CLK_DIV_ACLK_IMEM_266>,
-				<&cmu_top CLK_DIV_ACLK_IMEM_200>;
+				 <&cmu_top CLK_DIV_ACLK_IMEM_SSSX_266>,
+				 <&cmu_top CLK_DIV_ACLK_IMEM_266>,
+				 <&cmu_top CLK_DIV_ACLK_IMEM_200>;
+			clock-names = "oscclk",
+				      "aclk_imem_sssx_266",
+				      "aclk_imem_266",
+				      "aclk_imem_200";
 		};
 
 		slim_sss: slim-sss@11140000 {
 			compatible = "samsung,exynos5433-slim-sss";
 			reg = <0x11140000 0x1000>;
 			interrupts = <GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH>;
-			clock-names = "pclk", "aclk";
 			clocks = <&cmu_imem CLK_PCLK_SLIMSSS>,
 				 <&cmu_imem CLK_ACLK_SLIMSSS>;
+			clock-names = "pclk", "aclk";
 		};
 
 		pd_gscl: power-domain@105c4000 {
@@ -954,8 +954,8 @@ pmu_system_controller: system-controller@105c0000 {
 			compatible = "samsung,exynos5433-pmu", "simple-mfd", "syscon";
 			reg = <0x105c0000 0x5008>;
 			#clock-cells = <1>;
-			clock-names = "clkout16";
 			clocks = <&xxti>;
+			clock-names = "clkout16";
 
 			mipi_phy: mipi-phy {
 				compatible = "samsung,exynos5433-mipi-video-phy";
@@ -975,13 +975,13 @@ reboot: syscon-reboot {
 
 		gic: interrupt-controller@11001000 {
 			compatible = "arm,gic-400";
+			reg = <0x11001000 0x1000>,
+			      <0x11002000 0x2000>,
+			      <0x11004000 0x2000>,
+			      <0x11006000 0x2000>;
 			#address-cells = <0>;
 			#interrupt-cells = <3>;
 			interrupt-controller;
-			reg = <0x11001000 0x1000>,
-				<0x11002000 0x2000>,
-				<0x11004000 0x2000>,
-				<0x11006000 0x2000>;
 			interrupts = <GIC_PPI 9 0xf04>;
 		};
 
@@ -1190,13 +1190,13 @@ gsc_0: video-scaler@13c00000 {
 			compatible = "samsung,exynos5433-gsc";
 			reg = <0x13c00000 0x1000>;
 			interrupts = <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>;
-			clock-names = "pclk", "aclk", "aclk_xiu",
-				      "aclk_gsclbend", "gsd";
 			clocks = <&cmu_gscl CLK_PCLK_GSCL0>,
 				 <&cmu_gscl CLK_ACLK_GSCL0>,
 				 <&cmu_gscl CLK_ACLK_XIU_GSCLX>,
 				 <&cmu_gscl CLK_ACLK_GSCLBEND_333>,
 				 <&cmu_gscl CLK_ACLK_GSD>;
+			clock-names = "pclk", "aclk", "aclk_xiu",
+				      "aclk_gsclbend", "gsd";
 			iommus = <&sysmmu_gscl0>;
 			power-domains = <&pd_gscl>;
 		};
@@ -1205,13 +1205,13 @@ gsc_1: video-scaler@13c10000 {
 			compatible = "samsung,exynos5433-gsc";
 			reg = <0x13c10000 0x1000>;
 			interrupts = <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>;
-			clock-names = "pclk", "aclk", "aclk_xiu",
-				      "aclk_gsclbend", "gsd";
 			clocks = <&cmu_gscl CLK_PCLK_GSCL1>,
 				 <&cmu_gscl CLK_ACLK_GSCL1>,
 				 <&cmu_gscl CLK_ACLK_XIU_GSCLX>,
 				 <&cmu_gscl CLK_ACLK_GSCLBEND_333>,
 				 <&cmu_gscl CLK_ACLK_GSD>;
+			clock-names = "pclk", "aclk", "aclk_xiu",
+				      "aclk_gsclbend", "gsd";
 			iommus = <&sysmmu_gscl1>;
 			power-domains = <&pd_gscl>;
 		};
@@ -1220,13 +1220,13 @@ gsc_2: video-scaler@13c20000 {
 			compatible = "samsung,exynos5433-gsc";
 			reg = <0x13c20000 0x1000>;
 			interrupts = <GIC_SPI 299 IRQ_TYPE_LEVEL_HIGH>;
-			clock-names = "pclk", "aclk", "aclk_xiu",
-				      "aclk_gsclbend", "gsd";
 			clocks = <&cmu_gscl CLK_PCLK_GSCL2>,
 				 <&cmu_gscl CLK_ACLK_GSCL2>,
 				 <&cmu_gscl CLK_ACLK_XIU_GSCLX>,
 				 <&cmu_gscl CLK_ACLK_GSCLBEND_333>,
 				 <&cmu_gscl CLK_ACLK_GSD>;
+			clock-names = "pclk", "aclk", "aclk_xiu",
+				      "aclk_gsclbend", "gsd";
 			iommus = <&sysmmu_gscl2>;
 			power-domains = <&pd_gscl>;
 		};
@@ -1294,10 +1294,10 @@ scaler_0: scaler@15000000 {
 			compatible = "samsung,exynos5433-scaler";
 			reg = <0x15000000 0x1294>;
 			interrupts = <0 402 IRQ_TYPE_LEVEL_HIGH>;
-			clock-names = "pclk", "aclk", "aclk_xiu";
 			clocks = <&cmu_mscl CLK_PCLK_M2MSCALER0>,
 				 <&cmu_mscl CLK_ACLK_M2MSCALER0>,
 				 <&cmu_mscl CLK_ACLK_XIU_MSCLX>;
+			clock-names = "pclk", "aclk", "aclk_xiu";
 			iommus = <&sysmmu_scaler_0>;
 			power-domains = <&pd_mscl>;
 		};
@@ -1306,10 +1306,10 @@ scaler_1: scaler@15010000 {
 			compatible = "samsung,exynos5433-scaler";
 			reg = <0x15010000 0x1294>;
 			interrupts = <0 403 IRQ_TYPE_LEVEL_HIGH>;
-			clock-names = "pclk", "aclk", "aclk_xiu";
 			clocks = <&cmu_mscl CLK_PCLK_M2MSCALER1>,
 				 <&cmu_mscl CLK_ACLK_M2MSCALER1>,
 				 <&cmu_mscl CLK_ACLK_XIU_MSCLX>;
+			clock-names = "pclk", "aclk", "aclk_xiu";
 			iommus = <&sysmmu_scaler_1>;
 			power-domains = <&pd_mscl>;
 		};
@@ -1318,11 +1318,11 @@ jpeg: codec@15020000 {
 			compatible = "samsung,exynos5433-jpeg";
 			reg = <0x15020000 0x10000>;
 			interrupts = <GIC_SPI 411 IRQ_TYPE_LEVEL_HIGH>;
-			clock-names = "pclk", "aclk", "aclk_xiu", "sclk";
 			clocks = <&cmu_mscl CLK_PCLK_JPEG>,
 				 <&cmu_mscl CLK_ACLK_JPEG>,
 				 <&cmu_mscl CLK_ACLK_XIU_MSCLX>,
 				 <&cmu_mscl CLK_SCLK_JPEG>;
+			clock-names = "pclk", "aclk", "aclk_xiu", "sclk";
 			iommus = <&sysmmu_jpeg>;
 			power-domains = <&pd_mscl>;
 		};
@@ -1331,10 +1331,10 @@ mfc: codec@152e0000 {
 			compatible = "samsung,exynos5433-mfc";
 			reg = <0x152e0000 0x10000>;
 			interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
-			clock-names = "pclk", "aclk", "aclk_xiu";
 			clocks = <&cmu_mfc CLK_PCLK_MFC>,
 				 <&cmu_mfc CLK_ACLK_MFC>,
 				 <&cmu_mfc CLK_ACLK_XIU_MFCX>;
+			clock-names = "pclk", "aclk", "aclk_xiu";
 			iommus = <&sysmmu_mfc_0>, <&sysmmu_mfc_1>;
 			iommu-names = "left", "right";
 			power-domains = <&pd_mfc>;
@@ -1344,9 +1344,9 @@ sysmmu_decon0x: sysmmu@13a00000 {
 			compatible = "samsung,exynos-sysmmu";
 			reg = <0x13a00000 0x1000>;
 			interrupts = <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>;
-			clock-names = "aclk", "pclk";
 			clocks = <&cmu_disp CLK_ACLK_SMMU_DECON0X>,
-				<&cmu_disp CLK_PCLK_SMMU_DECON0X>;
+				 <&cmu_disp CLK_PCLK_SMMU_DECON0X>;
+			clock-names = "aclk", "pclk";
 			power-domains = <&pd_disp>;
 			#iommu-cells = <0>;
 		};
@@ -1355,9 +1355,9 @@ sysmmu_decon1x: sysmmu@13a10000 {
 			compatible = "samsung,exynos-sysmmu";
 			reg = <0x13a10000 0x1000>;
 			interrupts = <GIC_SPI 194 IRQ_TYPE_LEVEL_HIGH>;
-			clock-names = "aclk", "pclk";
 			clocks = <&cmu_disp CLK_ACLK_SMMU_DECON1X>,
-				<&cmu_disp CLK_PCLK_SMMU_DECON1X>;
+				 <&cmu_disp CLK_PCLK_SMMU_DECON1X>;
+			clock-names = "aclk", "pclk";
 			#iommu-cells = <0>;
 			power-domains = <&pd_disp>;
 		};
@@ -1366,9 +1366,9 @@ sysmmu_tv0x: sysmmu@13a20000 {
 			compatible = "samsung,exynos-sysmmu";
 			reg = <0x13a20000 0x1000>;
 			interrupts = <GIC_SPI 214 IRQ_TYPE_LEVEL_HIGH>;
-			clock-names = "aclk", "pclk";
 			clocks = <&cmu_disp CLK_ACLK_SMMU_TV0X>,
-				<&cmu_disp CLK_PCLK_SMMU_TV0X>;
+				 <&cmu_disp CLK_PCLK_SMMU_TV0X>;
+			clock-names = "aclk", "pclk";
 			#iommu-cells = <0>;
 			power-domains = <&pd_disp>;
 		};
@@ -1377,9 +1377,9 @@ sysmmu_tv1x: sysmmu@13a30000 {
 			compatible = "samsung,exynos-sysmmu";
 			reg = <0x13a30000 0x1000>;
 			interrupts = <GIC_SPI 216 IRQ_TYPE_LEVEL_HIGH>;
-			clock-names = "aclk", "pclk";
 			clocks = <&cmu_disp CLK_ACLK_SMMU_TV1X>,
-				<&cmu_disp CLK_PCLK_SMMU_TV1X>;
+				 <&cmu_disp CLK_PCLK_SMMU_TV1X>;
+			clock-names = "aclk", "pclk";
 			#iommu-cells = <0>;
 			power-domains = <&pd_disp>;
 		};
@@ -1388,9 +1388,9 @@ sysmmu_gscl0: sysmmu@13c80000 {
 			compatible = "samsung,exynos-sysmmu";
 			reg = <0x13c80000 0x1000>;
 			interrupts = <GIC_SPI 288 IRQ_TYPE_LEVEL_HIGH>;
-			clock-names = "aclk", "pclk";
 			clocks = <&cmu_gscl CLK_ACLK_SMMU_GSCL0>,
 				 <&cmu_gscl CLK_PCLK_SMMU_GSCL0>;
+			clock-names = "aclk", "pclk";
 			#iommu-cells = <0>;
 			power-domains = <&pd_gscl>;
 		};
@@ -1399,9 +1399,9 @@ sysmmu_gscl1: sysmmu@13c90000 {
 			compatible = "samsung,exynos-sysmmu";
 			reg = <0x13c90000 0x1000>;
 			interrupts = <GIC_SPI 290 IRQ_TYPE_LEVEL_HIGH>;
-			clock-names = "aclk", "pclk";
 			clocks = <&cmu_gscl CLK_ACLK_SMMU_GSCL1>,
 				 <&cmu_gscl CLK_PCLK_SMMU_GSCL1>;
+			clock-names = "aclk", "pclk";
 			#iommu-cells = <0>;
 			power-domains = <&pd_gscl>;
 		};
@@ -1410,9 +1410,9 @@ sysmmu_gscl2: sysmmu@13ca0000 {
 			compatible = "samsung,exynos-sysmmu";
 			reg = <0x13ca0000 0x1000>;
 			interrupts = <GIC_SPI 292 IRQ_TYPE_LEVEL_HIGH>;
-			clock-names = "aclk", "pclk";
 			clocks = <&cmu_gscl CLK_ACLK_SMMU_GSCL2>,
 				 <&cmu_gscl CLK_PCLK_SMMU_GSCL2>;
+			clock-names = "aclk", "pclk";
 			#iommu-cells = <0>;
 			power-domains = <&pd_gscl>;
 		};
@@ -1421,9 +1421,9 @@ sysmmu_scaler_0: sysmmu@15040000 {
 			compatible = "samsung,exynos-sysmmu";
 			reg = <0x15040000 0x1000>;
 			interrupts = <GIC_SPI 404 IRQ_TYPE_LEVEL_HIGH>;
-			clock-names = "aclk", "pclk";
 			clocks = <&cmu_mscl CLK_ACLK_SMMU_M2MSCALER0>,
-				<&cmu_mscl CLK_PCLK_SMMU_M2MSCALER0>;
+				 <&cmu_mscl CLK_PCLK_SMMU_M2MSCALER0>;
+			clock-names = "aclk", "pclk";
 			#iommu-cells = <0>;
 			power-domains = <&pd_mscl>;
 		};
@@ -1432,9 +1432,9 @@ sysmmu_scaler_1: sysmmu@15050000 {
 			compatible = "samsung,exynos-sysmmu";
 			reg = <0x15050000 0x1000>;
 			interrupts = <GIC_SPI 406 IRQ_TYPE_LEVEL_HIGH>;
-			clock-names = "aclk", "pclk";
 			clocks = <&cmu_mscl CLK_ACLK_SMMU_M2MSCALER1>,
-				<&cmu_mscl CLK_PCLK_SMMU_M2MSCALER1>;
+				 <&cmu_mscl CLK_PCLK_SMMU_M2MSCALER1>;
+			clock-names = "aclk", "pclk";
 			#iommu-cells = <0>;
 			power-domains = <&pd_mscl>;
 		};
@@ -1443,9 +1443,9 @@ sysmmu_jpeg: sysmmu@15060000 {
 			compatible = "samsung,exynos-sysmmu";
 			reg = <0x15060000 0x1000>;
 			interrupts = <GIC_SPI 408 IRQ_TYPE_LEVEL_HIGH>;
-			clock-names = "aclk", "pclk";
 			clocks = <&cmu_mscl CLK_ACLK_SMMU_JPEG>,
-				<&cmu_mscl CLK_PCLK_SMMU_JPEG>;
+				 <&cmu_mscl CLK_PCLK_SMMU_JPEG>;
+			clock-names = "aclk", "pclk";
 			#iommu-cells = <0>;
 			power-domains = <&pd_mscl>;
 		};
@@ -1454,9 +1454,9 @@ sysmmu_mfc_0: sysmmu@15200000 {
 			compatible = "samsung,exynos-sysmmu";
 			reg = <0x15200000 0x1000>;
 			interrupts = <GIC_SPI 352 IRQ_TYPE_LEVEL_HIGH>;
-			clock-names = "aclk", "pclk";
 			clocks = <&cmu_mfc CLK_ACLK_SMMU_MFC_0>,
-				<&cmu_mfc CLK_PCLK_SMMU_MFC_0>;
+				 <&cmu_mfc CLK_PCLK_SMMU_MFC_0>;
+			clock-names = "aclk", "pclk";
 			#iommu-cells = <0>;
 			power-domains = <&pd_mfc>;
 		};
@@ -1465,9 +1465,9 @@ sysmmu_mfc_1: sysmmu@15210000 {
 			compatible = "samsung,exynos-sysmmu";
 			reg = <0x15210000 0x1000>;
 			interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
-			clock-names = "aclk", "pclk";
 			clocks = <&cmu_mfc CLK_ACLK_SMMU_MFC_1>,
-				<&cmu_mfc CLK_PCLK_SMMU_MFC_1>;
+				 <&cmu_mfc CLK_PCLK_SMMU_MFC_1>;
+			clock-names = "aclk", "pclk";
 			#iommu-cells = <0>;
 			power-domains = <&pd_mfc>;
 		};
@@ -1620,8 +1620,8 @@ adc: adc@14d10000 {
 			compatible = "samsung,exynos5433-adc", "samsung,exynos7-adc";
 			reg = <0x14d10000 0x100>;
 			interrupts = <GIC_SPI 438 IRQ_TYPE_LEVEL_HIGH>;
-			clock-names = "adc";
 			clocks = <&cmu_peric CLK_PCLK_ADCIF>;
+			clock-names = "adc";
 			#io-channel-cells = <1>;
 
 			status = "disabled";

-- 
2.53.0

