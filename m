Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E5F78F3A
	for <linux-samsung-soc@vger.kernel.org>; Sat,  1 Aug 2026 15:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785596843; cv=none; b=jWIXXIVFPzdCQ5EjizdoVzdNzLmpz9HrSGuT4yRC6AsaRwqFqosxLa7oN9DAWN4ow+Ka+o2OePSK/M12sYuiPO0/SW7YqXgWcOnaOIsxMkv8P/y1zOsIXPJ2RV+HuYWwa+qNhTurJpsQ9ZgfDWLBrJGnV3YHWpwgkxLS6GK1xWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785596843; c=relaxed/simple;
	bh=6hX6FQ4XcohP0eSWevcfIBqosQLfdDtd2y9679E2zQY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LO+OZgqdG6rD7JJ4H8Vgx5df5EhkHgNNYUeZnOZgDsnmxjWWcWFcPO/wp5jV5IgZO6hMJS37V0F0RMEdi2eIzViyHPBDAxiEW5Llmmh84TNoMpwkp8OZrBY4QeNwL8AiFqdIZrzPgUU+4YVOzi4MGsQ/5S3MnYNQM7p56/cZIAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fk8gPB3l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S1jVSJa4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fk8gPB3l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S1jVSJa4"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 671CafoH2945234
	for <linux-samsung-soc@vger.kernel.org>; Sat, 1 Aug 2026 15:07:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	745BeytUuKmHTokRuZrtk24WyrvhAaEbwoy4n642x5g=; b=fk8gPB3lRrRwBIzo
	FNDA34mTADbNfsZynVn+YSAjRC6e+imVgGZVUyTnMpzpZfRzEjPuiYsH7PJGmQJQ
	BQDeopAYErbpLResHA2dB2UV1oaQYUDoZTYhMrJV04VIFVsK9d9vzz61QNUilDOO
	TBFwQKliV/kgoi3n1nibti8YC/p91WQJMAFuHbIwczH4z5S6t7C4w2CNykRtOPkE
	aBwjjABnMy2CFZ65FgdCDiuDg9SRdl2jko3J3l4TFAjWoihvacVD7VCuQQEtK40a
	aI+UX23OleZtCV8Ss3k/0Nx+njer9aiJo9h1dO9RRZzt6BBNG4vEiFFV6vf+LdqM
	H/znPA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8u995cy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Sat, 01 Aug 2026 15:07:17 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-90410c668adso20807676d6.1
        for <linux-samsung-soc@vger.kernel.org>; Sat, 01 Aug 2026 08:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785596837; x=1786201637; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=745BeytUuKmHTokRuZrtk24WyrvhAaEbwoy4n642x5g=;
        b=S1jVSJa4iltxWxiQGod5IbpehVi9MPGfgCBZZGzC0+J3UXjWwM/aPDilL22i6SqTed
         qvIGRNfnFRtzTYY+AS/ZoCc5yXfnYm8h/niN7efGfukZaRY5j3Jc5CCEGkp/BBPpolzU
         cc+TpUgejCI4JvzFpO08xSe8oPNvbeYe7po+6/Vl2LmAQj8yJzoNwCdSz6IuPghYdIjb
         NIPeEf3M/dlWY5MqCVyR2QDQKrOQXVk8BK5K+hw7ZQaCbjqHuDBXuzQhKqoSNgo1bs7X
         7h/sGmpmfYGZNW+CQOWnvvG/rXk/j+972nh8OLTOoF6Pool3DmY2d0qRRJbk/8TpymXJ
         WKLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785596837; x=1786201637;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=745BeytUuKmHTokRuZrtk24WyrvhAaEbwoy4n642x5g=;
        b=qkYu+6x5TnpUaJCpcbHjL3yOUiqDtwFmJYIf5GB5MN3ZqyaRrXXTb8SwtOpTYvT28L
         O/JpfoLTFtrYWgk0r4EoEOwHEL3luC8CsUT+NhqNP+CJ7RfNphXimkch3VuP+pr20IuW
         Xo+mQlJ1DbS9NSc3qpuRa3EU++eWoekxK3QTsznerhjnZZ5tmAa/2tnpyZjbtgAkb8cQ
         sPZtjajzFaj97HuHe8LTaQaXZMah5i/OON1b5YT7sc/QGiwlrVC2b36BnDEM02oN/fgl
         6fdZ/o6u3VxARSZkYTTeDDChDD6rkruliDvUKdPdCnD6XG0RQ2SCQoCBl5SOuabJdfkO
         RkTQ==
X-Forwarded-Encrypted: i=1; AHgh+RqiINpZZAswpaSZYmRRNt36cwADBBB/mgHkM+NndsgAHMzycwXPitNNySV0I72HLRftFNyWwanmrxvoLTjgUSHPbA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwIrN621v6S813aMLqN1BFhjiWQjqa/QMMt4lHxiK2xrLiHgYpH
	408/WkJHsY4nB+Myhuekxxwxsnf/00LtvJejB+kiXTcgyjPUwAo8Sgwd+GYMdC9ZAJexAzm2azm
	84fh+Cf9SAa5oFc8gCl37AJPy36jfNIR9f7YBBeYWcX+VhBAS2Qtvc5mzzQ+sGX5l9igu1Z0pdg
	==
X-Gm-Gg: AR+sD135TPekqm1RNPkOsWZ1UGWonpe17N19HaJBX3nsIeuuQTX0wU8vbz6hcRLJ+XM
	cpJcm6nz7xSK/ITDjbInlj2IF7nMYtlWoXi8LPgqOlKf6lTK5LHDlNX7oPQttNl55nBf/FxvZwy
	Tu0y3olKYxNsjjOisfD3adsFBZAQ/mvI5G7UsfbeIBkIHTMteXLni3kEbYZLfsh+karM/L8PKqt
	g8wm7jR4nIle0UJ+C5802Esw3QrEuI2mTf3BSvi7ZxgZX47I/j+LECKMmJPdq1sMTRuQK6Kc4I/
	khTV1spOxci91pYhKAgvzrACk17tRgqvXL/i0680r34cIFELd6aKGYcbQD9ayZEBovHHp7Up/N2
	0kUdetkYTldOi39dftRLBbdae
X-Received: by 2002:ac8:6f0a:0:b0:51c:14f5:8f9c with SMTP id d75a77b69052e-52b5682e457mr82508831cf.27.1785596836152;
        Sat, 01 Aug 2026 08:07:16 -0700 (PDT)
X-Received: by 2002:ac8:6f0a:0:b0:51c:14f5:8f9c with SMTP id d75a77b69052e-52b5682e457mr82507311cf.27.1785596835345;
        Sat, 01 Aug 2026 08:07:15 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd45a1abfsm16005222f8f.37.2026.08.01.08.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 08:07:14 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sat, 01 Aug 2026 17:06:57 +0200
Subject: [PATCH v2 2/8] arm64: dts: exynos: Align continued properties and
 add missing blank lines
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260801-b4-dts-coding-style-strict-v2-2-f09a659ab80d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=60789;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=6hX6FQ4XcohP0eSWevcfIBqosQLfdDtd2y9679E2zQY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqbguW+j7bnp5m0W0OVRUaBSX24rZ3NhtEDiQH8
 8Ly2NCWfi2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCam4LlgAKCRDBN2bmhouD
 13qND/wLKdoHgZDAvSeypn2qSAcFmHH58HhB7EpLzHpPk8JL1uwNs3Mu1SpP8rRl9Lp3/yE2MGL
 n6nwByEl+W7xIwGrpHM/NrgONzMh9+ml4xUvcCsVjUSsrNybsAx5/bmp/dM97UWZo6ZYY/OtY9s
 6y+eirDbngYMyDUshNq6//VNF6pp1InRoDTKH4ueYDbG6JtFBk/dHg6Dz6ea9q/ZukDyKEq2GuC
 cEHib5OxLyuS3hvrK0slBLQdv0b8wMerBs21kpbTFVnr8lBCw6GhchyTSJKh4+KMrnkUJZlCCn3
 36RCasWgX3XwRWyZXcHVCQ5mIM+KGqRY5bZwiWpIVCTRSe9HiCXvdQTWrsVwoA0cEiNVQFjyxcq
 9UIK8OP7NcYobvxvnPPMYx02KvKaudCAslZaqDmTbtOxF7eR+WmX6JqTY5uXwfOsnF6XU6SL4z+
 ScALmzaYpN7nIc3Y7Zgud7LAAdYxsya00copbDmB5EVfJHbbuHHAOV1VzgNMs+okBIBhH/lsMqq
 ObHzA+9FzwQ8nnJ/tvFZERMnjLqkzSEo9q8EW6puxMmtDDNKOZdtcB3m0RCCbe9QWI8iSkrvyDM
 pxWhHKIUPD2bryt0VpfnGBqGqtyJHLHmrKFUgIyO+i3QUkzKq6AM4TcoilON71zA/PFCKlFZeoq
 BjDHfzHxcjClptA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: 6PmL_BO5dq_6XJqrFnWk3ekULIBJCG5g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDEyMiBTYWx0ZWRfX6UxPjenBs6CE
 AEsJLGvzaED+vnXQLtPvGTDoWjEiw9a1brkpm2ZD0EG5lNOGeq6yv/uMpM5Vizbx0LtfQZ9qbO1
 /cN9gQE3wLIu1OFrposV8p+aPNYu8uAENf7tqYDGyOgcXpZqo8w5Pl+4GMCNiHLimW4Vpfzw7Ty
 0nmoRtj2/h3zK4cjV8/wLnB/Eno1h05bskFL8HDIMV11ubeJwTNxGiZ0n5nrlmrOpnTc7TnhOUm
 dapKkMzFjsueyKeD4uEqlZSBC4++YFlZhWV8/7z/y8eFZ/EumTY+vvR8D32/XvBsKJRJX9rm78t
 ZgORAPkkGXoxH9XNfGEW7f/pYV6ahGpGSrv8+vfLT3kafFzUSe8JVhKBEtm0YkX2qj3Vb7ey1qH
 KmdFgFqF8IJMnbaAOmgj7Jh9f9ICFyRYvQcnEl+lZcUq03Bf3d6LQ0vQHXEyppVR0ieU2hsi4Nn
 s56K2PwQzW1Tpv4SCSg==
X-Authority-Analysis: v=2.4 cv=LsCiDHdc c=1 sm=1 tr=0 ts=6a6e0ba5 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=_uiF_0qmxUXDy-s3O6wA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDEyMiBTYWx0ZWRfX5HzVQkv/IcNf
 Ho/PLsZLq1de05tYMGI+CYHwzt8ETzizCOVO9MkJPTfsEQSgzC/Mlv7MGiXZAFLVu9Ehn7Qb2Ug
 swnU1j65b8CpK+yMg1AAXWYYrcoRfFQ=
X-Proofpoint-ORIG-GUID: 6PmL_BO5dq_6XJqrFnWk3ekULIBJCG5g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-01_01,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608010122

Trivial white-space only changes to adjust to DTS coding style and fix
dt-check-style strict warnings like:

  [required-blank-lines] child node must be preceded by a blank line
  [continuation-alignment] continuation should align to column 39 (under < or ")

Reviewed-by: André Draszik <andre.draszik@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/exynos/exynos5433-bus.dtsi     |  19 ++
 arch/arm64/boot/dts/exynos/exynos5433-pinctrl.dtsi |   8 +-
 .../boot/dts/exynos/exynos5433-tm2-common.dtsi     | 120 ++++++-----
 arch/arm64/boot/dts/exynos/exynos5433-tmu.dtsi     |  45 ++++
 arch/arm64/boot/dts/exynos/exynos5433.dtsi         | 230 ++++++++++++---------
 arch/arm64/boot/dts/exynos/exynos7-espresso.dts    |   3 +-
 .../arm64/boot/dts/exynos/exynos7-trip-points.dtsi |   7 +
 arch/arm64/boot/dts/exynos/exynos7.dtsi            |  34 ++-
 arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts    |   4 +-
 arch/arm64/boot/dts/exynos/exynos7870.dtsi         |   9 +-
 arch/arm64/boot/dts/exynos/exynos7885.dtsi         |   9 +-
 arch/arm64/boot/dts/exynos/exynos850-pinctrl.dtsi  |   1 +
 arch/arm64/boot/dts/exynos/exynos850.dtsi          |  16 +-
 arch/arm64/boot/dts/exynos/exynos8855.dtsi         |   5 +
 arch/arm64/boot/dts/exynos/exynos8895.dtsi         |   9 +-
 arch/arm64/boot/dts/exynos/exynos9810.dtsi         |   9 +-
 arch/arm64/boot/dts/exynos/exynos990.dtsi          |   3 +-
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi       |   9 +-
 arch/arm64/boot/dts/exynos/exynosautov920.dtsi     |   7 +
 19 files changed, 359 insertions(+), 188 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433-bus.dtsi b/arch/arm64/boot/dts/exynos/exynos5433-bus.dtsi
index 0c200df9996f..9bfa0474675c 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433-bus.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433-bus.dtsi
@@ -105,22 +105,27 @@ opp-400000000 {
 			opp-hz = /bits/ 64 <400000000>;
 			opp-microvolt = <1075000>;
 		};
+
 		opp-267000000 {
 			opp-hz = /bits/ 64 <267000000>;
 			opp-microvolt = <1000000>;
 		};
+
 		opp-200000000 {
 			opp-hz = /bits/ 64 <200000000>;
 			opp-microvolt = <975000>;
 		};
+
 		opp-160000000 {
 			opp-hz = /bits/ 64 <160000000>;
 			opp-microvolt = <962500>;
 		};
+
 		opp-134000000 {
 			opp-hz = /bits/ 64 <134000000>;
 			opp-microvolt = <950000>;
 		};
+
 		opp-100000000 {
 			opp-hz = /bits/ 64 <100000000>;
 			opp-microvolt = <937500>;
@@ -133,15 +138,19 @@ bus_g2d_266_opp_table: opp-table-3 {
 		opp-267000000 {
 			opp-hz = /bits/ 64 <267000000>;
 		};
+
 		opp-200000000 {
 			opp-hz = /bits/ 64 <200000000>;
 		};
+
 		opp-160000000 {
 			opp-hz = /bits/ 64 <160000000>;
 		};
+
 		opp-134000000 {
 			opp-hz = /bits/ 64 <134000000>;
 		};
+
 		opp-100000000 {
 			opp-hz = /bits/ 64 <100000000>;
 		};
@@ -153,9 +162,11 @@ bus_gscl_opp_table: opp-table-4 {
 		opp-333000000 {
 			opp-hz = /bits/ 64 <333000000>;
 		};
+
 		opp-222000000 {
 			opp-hz = /bits/ 64 <222000000>;
 		};
+
 		opp-166500000 {
 			opp-hz = /bits/ 64 <166500000>;
 		};
@@ -168,18 +179,23 @@ bus_hevc_opp_table: opp-table-5 {
 		opp-400000000 {
 			opp-hz = /bits/ 64 <400000000>;
 		};
+
 		opp-267000000 {
 			opp-hz = /bits/ 64 <267000000>;
 		};
+
 		opp-200000000 {
 			opp-hz = /bits/ 64 <200000000>;
 		};
+
 		opp-160000000 {
 			opp-hz = /bits/ 64 <160000000>;
 		};
+
 		opp-134000000 {
 			opp-hz = /bits/ 64 <134000000>;
 		};
+
 		opp-100000000 {
 			opp-hz = /bits/ 64 <100000000>;
 		};
@@ -191,12 +207,15 @@ bus_noc2_opp_table: opp-table-6 {
 		opp-400000000 {
 			opp-hz = /bits/ 64 <400000000>;
 		};
+
 		opp-200000000 {
 			opp-hz = /bits/ 64 <200000000>;
 		};
+
 		opp-134000000 {
 			opp-hz = /bits/ 64 <134000000>;
 		};
+
 		opp-100000000 {
 			opp-hz = /bits/ 64 <100000000>;
 		};
diff --git a/arch/arm64/boot/dts/exynos/exynos5433-pinctrl.dtsi b/arch/arm64/boot/dts/exynos/exynos5433-pinctrl.dtsi
index 681553577ebc..d6850c51db26 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433-pinctrl.dtsi
@@ -139,7 +139,7 @@ gpz1: gpz1-gpio-bank {
 
 	i2s0_bus: i2s0-bus-pins {
 		samsung,pins = "gpz0-0", "gpz0-1", "gpz0-2", "gpz0-3",
-				"gpz0-4", "gpz0-5", "gpz0-6";
+			       "gpz0-4", "gpz0-5", "gpz0-6";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
 		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR1>;
@@ -572,16 +572,14 @@ hs_i2c9_bus: hs-i2c9-bus-pins {
 	};
 
 	i2s1_bus: i2s1-bus-pins {
-		samsung,pins = "gpd4-0", "gpd4-1", "gpd4-2",
-				"gpd4-3", "gpd4-4";
+		samsung,pins = "gpd4-0", "gpd4-1", "gpd4-2", "gpd4-3", "gpd4-4";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
 		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR1>;
 	};
 
 	pcm1_bus: pcm1-bus-pins {
-		samsung,pins = "gpd4-0", "gpd4-1", "gpd4-2",
-				"gpd4-3", "gpd4-4";
+		samsung,pins = "gpd4-0", "gpd4-1", "gpd4-2", "gpd4-3", "gpd4-4";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
 		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR1>;
diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
index bc5ff66d8455..0ad02a098765 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
@@ -234,60 +234,60 @@ &bus_noc2 {
 
 &cmu_aud {
 	assigned-clocks = <&cmu_aud CLK_MOUT_AUD_PLL_USER>,
-		<&cmu_aud CLK_MOUT_SCLK_AUD_I2S>,
-		<&cmu_aud CLK_MOUT_SCLK_AUD_PCM>,
-		<&cmu_top CLK_MOUT_AUD_PLL>,
-		<&cmu_top CLK_MOUT_AUD_PLL_USER_T>,
-		<&cmu_top CLK_MOUT_SCLK_AUDIO0>,
-		<&cmu_top CLK_MOUT_SCLK_AUDIO1>,
-		<&cmu_top CLK_MOUT_SCLK_SPDIF>,
+			  <&cmu_aud CLK_MOUT_SCLK_AUD_I2S>,
+			  <&cmu_aud CLK_MOUT_SCLK_AUD_PCM>,
+			  <&cmu_top CLK_MOUT_AUD_PLL>,
+			  <&cmu_top CLK_MOUT_AUD_PLL_USER_T>,
+			  <&cmu_top CLK_MOUT_SCLK_AUDIO0>,
+			  <&cmu_top CLK_MOUT_SCLK_AUDIO1>,
+			  <&cmu_top CLK_MOUT_SCLK_SPDIF>,
 
-		<&cmu_aud CLK_DIV_AUD_CA5>,
-		<&cmu_aud CLK_DIV_ACLK_AUD>,
-		<&cmu_aud CLK_DIV_PCLK_DBG_AUD>,
-		<&cmu_aud CLK_DIV_SCLK_AUD_I2S>,
-		<&cmu_aud CLK_DIV_SCLK_AUD_PCM>,
-		<&cmu_aud CLK_DIV_SCLK_AUD_SLIMBUS>,
-		<&cmu_aud CLK_DIV_SCLK_AUD_UART>,
-		<&cmu_top CLK_DIV_SCLK_AUDIO0>,
-		<&cmu_top CLK_DIV_SCLK_AUDIO1>,
-		<&cmu_top CLK_DIV_SCLK_PCM1>,
-		<&cmu_top CLK_DIV_SCLK_I2S1>;
+			  <&cmu_aud CLK_DIV_AUD_CA5>,
+			  <&cmu_aud CLK_DIV_ACLK_AUD>,
+			  <&cmu_aud CLK_DIV_PCLK_DBG_AUD>,
+			  <&cmu_aud CLK_DIV_SCLK_AUD_I2S>,
+			  <&cmu_aud CLK_DIV_SCLK_AUD_PCM>,
+			  <&cmu_aud CLK_DIV_SCLK_AUD_SLIMBUS>,
+			  <&cmu_aud CLK_DIV_SCLK_AUD_UART>,
+			  <&cmu_top CLK_DIV_SCLK_AUDIO0>,
+			  <&cmu_top CLK_DIV_SCLK_AUDIO1>,
+			  <&cmu_top CLK_DIV_SCLK_PCM1>,
+			  <&cmu_top CLK_DIV_SCLK_I2S1>;
 
 	assigned-clock-parents = <&cmu_top CLK_FOUT_AUD_PLL>,
-		<&cmu_aud CLK_MOUT_AUD_PLL_USER>,
-		<&cmu_aud CLK_MOUT_AUD_PLL_USER>,
-		<&cmu_top CLK_FOUT_AUD_PLL>,
-		<&cmu_top CLK_MOUT_AUD_PLL>,
-		<&cmu_top CLK_MOUT_AUD_PLL_USER_T>,
-		<&cmu_top CLK_MOUT_AUD_PLL_USER_T>,
-		<&cmu_top CLK_SCLK_AUDIO0>;
+				 <&cmu_aud CLK_MOUT_AUD_PLL_USER>,
+				 <&cmu_aud CLK_MOUT_AUD_PLL_USER>,
+				 <&cmu_top CLK_FOUT_AUD_PLL>,
+				 <&cmu_top CLK_MOUT_AUD_PLL>,
+				 <&cmu_top CLK_MOUT_AUD_PLL_USER_T>,
+				 <&cmu_top CLK_MOUT_AUD_PLL_USER_T>,
+				 <&cmu_top CLK_SCLK_AUDIO0>;
 
 	assigned-clock-rates = <0>, <0>, <0>, <0>, <0>, <0>, <0>, <0>,
-		<196608001>, <65536001>, <32768001>, <49152001>,
-		<2048001>, <24576001>, <196608001>,
-		<24576001>, <98304001>, <2048001>, <49152001>;
+			       <196608001>, <65536001>, <32768001>, <49152001>,
+			       <2048001>, <24576001>, <196608001>,
+			       <24576001>, <98304001>, <2048001>, <49152001>;
 };
 
 &cmu_fsys {
 	assigned-clocks = <&cmu_top CLK_MOUT_SCLK_USBDRD30>,
-		<&cmu_top CLK_MOUT_SCLK_USBHOST30>,
-		<&cmu_fsys CLK_MOUT_SCLK_USBDRD30_USER>,
-		<&cmu_fsys CLK_MOUT_SCLK_USBHOST30_USER>,
-		<&cmu_fsys CLK_MOUT_PHYCLK_USBDRD30_UDRD30_PIPE_PCLK_USER>,
-		<&cmu_fsys CLK_MOUT_PHYCLK_USBHOST30_UHOST30_PIPE_PCLK_USER>,
-		<&cmu_fsys CLK_MOUT_PHYCLK_USBDRD30_UDRD30_PHYCLOCK_USER>,
-		<&cmu_fsys CLK_MOUT_PHYCLK_USBHOST30_UHOST30_PHYCLOCK_USER>,
-		<&cmu_top CLK_DIV_SCLK_USBDRD30>,
-		<&cmu_top CLK_DIV_SCLK_USBHOST30>;
+			  <&cmu_top CLK_MOUT_SCLK_USBHOST30>,
+			  <&cmu_fsys CLK_MOUT_SCLK_USBDRD30_USER>,
+			  <&cmu_fsys CLK_MOUT_SCLK_USBHOST30_USER>,
+			  <&cmu_fsys CLK_MOUT_PHYCLK_USBDRD30_UDRD30_PIPE_PCLK_USER>,
+			  <&cmu_fsys CLK_MOUT_PHYCLK_USBHOST30_UHOST30_PIPE_PCLK_USER>,
+			  <&cmu_fsys CLK_MOUT_PHYCLK_USBDRD30_UDRD30_PHYCLOCK_USER>,
+			  <&cmu_fsys CLK_MOUT_PHYCLK_USBHOST30_UHOST30_PHYCLOCK_USER>,
+			  <&cmu_top CLK_DIV_SCLK_USBDRD30>,
+			  <&cmu_top CLK_DIV_SCLK_USBHOST30>;
 	assigned-clock-parents = <&cmu_top CLK_MOUT_BUS_PLL_USER>,
-		<&cmu_top CLK_MOUT_BUS_PLL_USER>,
-		<&cmu_top CLK_SCLK_USBDRD30_FSYS>,
-		<&cmu_top CLK_SCLK_USBHOST30_FSYS>,
-		<&cmu_fsys CLK_PHYCLK_USBDRD30_UDRD30_PIPE_PCLK_PHY>,
-		<&cmu_fsys CLK_PHYCLK_USBHOST30_UHOST30_PIPE_PCLK_PHY>,
-		<&cmu_fsys CLK_PHYCLK_USBDRD30_UDRD30_PHYCLOCK_PHY>,
-		<&cmu_fsys CLK_PHYCLK_USBHOST30_UHOST30_PHYCLOCK_PHY>;
+				 <&cmu_top CLK_MOUT_BUS_PLL_USER>,
+				 <&cmu_top CLK_SCLK_USBDRD30_FSYS>,
+				 <&cmu_top CLK_SCLK_USBHOST30_FSYS>,
+				 <&cmu_fsys CLK_PHYCLK_USBDRD30_UDRD30_PIPE_PCLK_PHY>,
+				 <&cmu_fsys CLK_PHYCLK_USBHOST30_UHOST30_PIPE_PCLK_PHY>,
+				 <&cmu_fsys CLK_PHYCLK_USBDRD30_UDRD30_PHYCLOCK_PHY>,
+				 <&cmu_fsys CLK_PHYCLK_USBHOST30_UHOST30_PHYCLOCK_PHY>;
 	assigned-clock-rates = <0>, <0>, <0>, <0>, <0>, <0>, <0>, <0>,
 			       <66700000>, <66700000>;
 };
@@ -347,6 +347,7 @@ ports {
 
 		port@0 {
 			reg = <0>;
+
 			tv_to_hdmi: endpoint {
 				remote-endpoint = <&hdmi_to_tv>;
 			};
@@ -386,6 +387,7 @@ ports {
 
 		port@0 {
 			reg = <0>;
+
 			hdmi_to_tv: endpoint {
 				remote-endpoint = <&tv_to_hdmi>;
 			};
@@ -393,6 +395,7 @@ hdmi_to_tv: endpoint {
 
 		port@1 {
 			reg = <1>;
+
 			hdmi_to_mhl: endpoint {
 				remote-endpoint = <&mhl_to_hdmi>;
 			};
@@ -416,8 +419,7 @@ pmic@66 {
 		s2mps13_osc: clocks {
 			compatible = "samsung,s2mps13-clk";
 			#clock-cells = <1>;
-			clock-output-names = "s2mps13_ap", "s2mps13_cp",
-				"s2mps13_bt";
+			clock-output-names = "s2mps13_ap", "s2mps13_cp", "s2mps13_bt";
 		};
 
 		regulators {
@@ -433,6 +435,7 @@ ldo2_reg: LDO2 {
 				regulator-min-microvolt = <2800000>;
 				regulator-max-microvolt = <2800000>;
 				regulator-always-on;
+
 				regulator-state-mem {
 					regulator-off-in-suspend;
 				};
@@ -450,6 +453,7 @@ ldo4_reg: LDO4 {
 				regulator-min-microvolt = <1300000>;
 				regulator-max-microvolt = <1300000>;
 				regulator-always-on;
+
 				regulator-state-mem {
 					regulator-off-in-suspend;
 				};
@@ -460,6 +464,7 @@ ldo5_reg: LDO5 {
 				regulator-min-microvolt = <1000000>;
 				regulator-max-microvolt = <1000000>;
 				regulator-always-on;
+
 				regulator-state-mem {
 					regulator-off-in-suspend;
 				};
@@ -469,6 +474,7 @@ ldo6_reg: LDO6 {
 				regulator-name = "VDD10_MIPI2L_1.0V_AP";
 				regulator-min-microvolt = <1000000>;
 				regulator-max-microvolt = <1000000>;
+
 				regulator-state-mem {
 					regulator-off-in-suspend;
 				};
@@ -479,6 +485,7 @@ ldo7_reg: LDO7 {
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;
 				regulator-always-on;
+
 				regulator-state-mem {
 					regulator-off-in-suspend;
 				};
@@ -489,6 +496,7 @@ ldo8_reg: LDO8 {
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;
 				regulator-always-on;
+
 				regulator-state-mem {
 					regulator-off-in-suspend;
 				};
@@ -499,6 +507,7 @@ ldo9_reg: LDO9 {
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;
 				regulator-always-on;
+
 				regulator-state-mem {
 					regulator-off-in-suspend;
 				};
@@ -508,6 +517,7 @@ ldo10_reg: LDO10 {
 				regulator-name = "VDD33_USB30_3.0V_AP";
 				regulator-min-microvolt = <3000000>;
 				regulator-max-microvolt = <3000000>;
+
 				regulator-state-mem {
 					regulator-off-in-suspend;
 				};
@@ -518,6 +528,7 @@ ldo11_reg: LDO11 {
 				regulator-min-microvolt = <1000000>;
 				regulator-max-microvolt = <1000000>;
 				regulator-always-on;
+
 				regulator-state-mem {
 					regulator-off-in-suspend;
 				};
@@ -535,6 +546,7 @@ ldo13_reg: LDO13 {
 				regulator-min-microvolt = <950000>;
 				regulator-max-microvolt = <950000>;
 				regulator-always-on;
+
 				regulator-state-mem {
 					regulator-off-in-suspend;
 				};
@@ -545,6 +557,7 @@ ldo14_reg: LDO14 {
 				regulator-min-microvolt = <1200000>;
 				regulator-max-microvolt = <1200000>;
 				regulator-always-on;
+
 				regulator-state-mem {
 					regulator-off-in-suspend;
 				};
@@ -555,6 +568,7 @@ ldo15_reg: LDO15 {
 				regulator-min-microvolt = <1200000>;
 				regulator-max-microvolt = <1200000>;
 				regulator-always-on;
+
 				regulator-state-mem {
 					regulator-off-in-suspend;
 				};
@@ -721,6 +735,7 @@ buck1_reg: BUCK1 {
 				regulator-min-microvolt = <600000>;
 				regulator-max-microvolt = <1500000>;
 				regulator-always-on;
+
 				regulator-state-mem {
 					regulator-off-in-suspend;
 				};
@@ -731,6 +746,7 @@ buck2_reg: BUCK2 {
 				regulator-min-microvolt = <900000>;
 				regulator-max-microvolt = <1300000>;
 				regulator-always-on;
+
 				regulator-state-mem {
 					regulator-off-in-suspend;
 				};
@@ -741,6 +757,7 @@ buck3_reg: BUCK3 {
 				regulator-min-microvolt = <800000>;
 				regulator-max-microvolt = <1200000>;
 				regulator-always-on;
+
 				regulator-state-mem {
 					regulator-off-in-suspend;
 				};
@@ -751,6 +768,7 @@ buck4_reg: BUCK4 {
 				regulator-min-microvolt = <600000>;
 				regulator-max-microvolt = <1500000>;
 				regulator-always-on;
+
 				regulator-state-mem {
 					regulator-off-in-suspend;
 				};
@@ -761,6 +779,7 @@ buck5_reg: BUCK5 {
 				regulator-min-microvolt = <600000>;
 				regulator-max-microvolt = <1500000>;
 				regulator-always-on;
+
 				regulator-state-mem {
 					regulator-off-in-suspend;
 				};
@@ -771,6 +790,7 @@ buck6_reg: BUCK6 {
 				regulator-min-microvolt = <600000>;
 				regulator-max-microvolt = <1500000>;
 				regulator-always-on;
+
 				regulator-state-mem {
 					regulator-off-in-suspend;
 				};
@@ -855,6 +875,7 @@ ports {
 
 			port@0 {
 				reg = <0>;
+
 				mhl_to_hdmi: endpoint {
 					remote-endpoint = <&hdmi_to_mhl>;
 				};
@@ -862,6 +883,7 @@ mhl_to_hdmi: endpoint {
 
 			port@1 {
 				reg = <1>;
+
 				mhl_to_musb_con: endpoint {
 					remote-endpoint = <&musb_con_to_mhl>;
 				};
@@ -906,6 +928,7 @@ port@0 {
 
 					port@3 {
 						reg = <3>;
+
 						musb_con_to_mhl: endpoint {
 							remote-endpoint = <&mhl_to_musb_con>;
 						};
@@ -924,6 +947,7 @@ muic_to_usb: endpoint {
 
 		regulators {
 			compatible = "maxim,max77843-regulator";
+
 			safeout1_reg: SAFEOUT1 {
 				regulator-name = "SAFEOUT1";
 				regulator-min-microvolt = <3300000>;
@@ -981,7 +1005,7 @@ &mshc_0 {
 	fifo-depth = <0x80>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&sd0_clk &sd0_cmd &sd0_qrdy &sd0_bus1 &sd0_bus4
-			&sd0_bus8 &sd0_rdqs>;
+		     &sd0_bus8 &sd0_rdqs>;
 	bus-width = <8>;
 	assigned-clocks = <&cmu_top CLK_SCLK_MMC0_FSYS>;
 	assigned-clock-rates = <800000000>;
@@ -1304,7 +1328,7 @@ wm5110: audio-codec@0 {
 		interrupt-parent = <&gpa0>;
 		interrupts = <4 IRQ_TYPE_NONE>;
 		clocks = <&pmu_system_controller 0>,
-			<&s2mps13_osc S2MPS11_CLK_BT>;
+			 <&s2mps13_osc S2MPS11_CLK_BT>;
 		clock-names = "mclk1", "mclk2";
 
 		gpio-controller;
diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tmu.dtsi b/arch/arm64/boot/dts/exynos/exynos5433-tmu.dtsi
index 81b72393dd0d..57b335f579d8 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433-tmu.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433-tmu.dtsi
@@ -13,37 +13,44 @@ atlas0_thermal: atlas0-thermal {
 		thermal-sensors = <&tmu_atlas0>;
 		polling-delay-passive = <0>;
 		polling-delay = <0>;
+
 		trips {
 			atlas0_alert_0: atlas0-alert-0 {
 				temperature = <65000>;	/* millicelsius */
 				hysteresis = <1000>;	/* millicelsius */
 				type = "active";
 			};
+
 			atlas0_alert_1: atlas0-alert-1 {
 				temperature = <70000>;	/* millicelsius */
 				hysteresis = <1000>;	/* millicelsius */
 				type = "active";
 			};
+
 			atlas0_alert_2: atlas0-alert-2 {
 				temperature = <75000>;	/* millicelsius */
 				hysteresis = <1000>;	/* millicelsius */
 				type = "active";
 			};
+
 			atlas0_alert_3: atlas0-alert-3 {
 				temperature = <80000>;	/* millicelsius */
 				hysteresis = <1000>;	/* millicelsius */
 				type = "active";
 			};
+
 			atlas0_alert_4: atlas0-alert-4 {
 				temperature = <85000>;	/* millicelsius */
 				hysteresis = <1000>;	/* millicelsius */
 				type = "active";
 			};
+
 			atlas0_alert_5: atlas0-alert-5 {
 				temperature = <90000>;	/* millicelsius */
 				hysteresis = <1000>;	/* millicelsius */
 				type = "active";
 			};
+
 			atlas0_alert_6: atlas0-alert-6 {
 				temperature = <95000>;	/* millicelsius */
 				hysteresis = <1000>;	/* millicelsius */
@@ -58,36 +65,42 @@ map0 {
 				cooling-device = <&cpu4 1 2>, <&cpu5 1 2>,
 						 <&cpu6 1 2>, <&cpu7 1 2>;
 			};
+
 			map1 {
 				/* Set maximum frequency as 1700MHz  */
 				trip = <&atlas0_alert_1>;
 				cooling-device = <&cpu4 2 3>, <&cpu5 2 3>,
 						 <&cpu6 2 3>, <&cpu7 2 3>;
 			};
+
 			map2 {
 				/* Set maximum frequency as 1600MHz  */
 				trip = <&atlas0_alert_2>;
 				cooling-device = <&cpu4 3 4>, <&cpu5 3 4>,
 						 <&cpu6 3 4>, <&cpu7 3 4>;
 			};
+
 			map3 {
 				/* Set maximum frequency as 1500MHz  */
 				trip = <&atlas0_alert_3>;
 				cooling-device = <&cpu4 4 5>, <&cpu5 4 5>,
 						 <&cpu6 4 5>, <&cpu7 4 5>;
 			};
+
 			map4 {
 				/* Set maximum frequency as 1400MHz  */
 				trip = <&atlas0_alert_4>;
 				cooling-device = <&cpu4 5 7>, <&cpu5 5 7>,
 						 <&cpu6 5 7>, <&cpu7 5 7>;
 			};
+
 			map5 {
 				/* Set maximum frequencyas 1200MHz  */
 				trip = <&atlas0_alert_5>;
 				cooling-device = <&cpu4 7 9>, <&cpu5 7 9>,
 						 <&cpu6 7 9>, <&cpu7 7 9>;
 			};
+
 			map6 {
 				/* Set maximum frequency as 1000MHz  */
 				trip = <&atlas0_alert_6>;
@@ -101,37 +114,44 @@ atlas1_thermal: atlas1-thermal {
 		thermal-sensors = <&tmu_atlas1>;
 		polling-delay-passive = <0>;
 		polling-delay = <0>;
+
 		trips {
 			atlas1_alert_0: atlas1-alert-0 {
 				temperature = <65000>;	/* millicelsius */
 				hysteresis = <1000>;	/* millicelsius */
 				type = "active";
 			};
+
 			atlas1_alert_1: atlas1-alert-1 {
 				temperature = <70000>;	/* millicelsius */
 				hysteresis = <1000>;	/* millicelsius */
 				type = "active";
 			};
+
 			atlas1_alert_2: atlas1-alert-2 {
 				temperature = <75000>;	/* millicelsius */
 				hysteresis = <1000>;	/* millicelsius */
 				type = "active";
 			};
+
 			atlas1_alert_3: atlas1-alert-3 {
 				temperature = <80000>;	/* millicelsius */
 				hysteresis = <1000>;	/* millicelsius */
 				type = "active";
 			};
+
 			atlas1_alert_4: atlas1-alert-4 {
 				temperature = <85000>;	/* millicelsius */
 				hysteresis = <1000>;	/* millicelsius */
 				type = "active";
 			};
+
 			atlas1_alert_5: atlas1-alert-5 {
 				temperature = <90000>;	/* millicelsius */
 				hysteresis = <1000>;	/* millicelsius */
 				type = "active";
 			};
+
 			atlas1_alert_6: atlas1-alert-6 {
 				temperature = <95000>;	/* millicelsius */
 				hysteresis = <1000>;	/* millicelsius */
@@ -144,37 +164,44 @@ g3d_thermal: g3d-thermal {
 		thermal-sensors = <&tmu_g3d>;
 		polling-delay-passive = <0>;
 		polling-delay = <0>;
+
 		trips {
 			g3d_alert_0: g3d-alert-0 {
 				temperature = <70000>;	/* millicelsius */
 				hysteresis = <1000>;	/* millicelsius */
 				type = "active";
 			};
+
 			g3d_alert_1: g3d-alert-1 {
 				temperature = <75000>;	/* millicelsius */
 				hysteresis = <1000>;	/* millicelsius */
 				type = "active";
 			};
+
 			g3d_alert_2: g3d-alert-2 {
 				temperature = <80000>;	/* millicelsius */
 				hysteresis = <1000>;	/* millicelsius */
 				type = "active";
 			};
+
 			g3d_alert_3: g3d-alert-3 {
 				temperature = <85000>;	/* millicelsius */
 				hysteresis = <1000>;	/* millicelsius */
 				type = "active";
 			};
+
 			g3d_alert_4: g3d-alert-4 {
 				temperature = <90000>;	/* millicelsius */
 				hysteresis = <1000>;	/* millicelsius */
 				type = "active";
 			};
+
 			g3d_alert_5: g3d-alert-5 {
 				temperature = <95000>;	/* millicelsius */
 				hysteresis = <1000>;	/* millicelsius */
 				type = "active";
 			};
+
 			g3d_alert_6: g3d-alert-6 {
 				temperature = <100000>;	/* millicelsius */
 				hysteresis = <1000>;	/* millicelsius */
@@ -187,37 +214,44 @@ apollo_thermal: apollo-thermal {
 		thermal-sensors = <&tmu_apollo>;
 		polling-delay-passive = <0>;
 		polling-delay = <0>;
+
 		trips {
 			apollo_alert_0: apollo-alert-0 {
 				temperature = <65000>;	/* millicelsius */
 				hysteresis = <1000>;	/* millicelsius */
 				type = "active";
 			};
+
 			apollo_alert_1: apollo-alert-1 {
 				temperature = <70000>;	/* millicelsius */
 				hysteresis = <1000>;	/* millicelsius */
 				type = "active";
 			};
+
 			apollo_alert_2: apollo-alert-2 {
 				temperature = <75000>;	/* millicelsius */
 				hysteresis = <1000>;	/* millicelsius */
 				type = "active";
 			};
+
 			apollo_alert_3: apollo-alert-3 {
 				temperature = <80000>;	/* millicelsius */
 				hysteresis = <1000>;	/* millicelsius */
 				type = "active";
 			};
+
 			apollo_alert_4: apollo-alert-4 {
 				temperature = <85000>;	/* millicelsius */
 				hysteresis = <1000>;	/* millicelsius */
 				type = "active";
 			};
+
 			apollo_alert_5: apollo-alert-5 {
 				temperature = <90000>;	/* millicelsius */
 				hysteresis = <1000>;	/* millicelsius */
 				type = "active";
 			};
+
 			apollo_alert_6: apollo-alert-6 {
 				temperature = <95000>;	/* millicelsius */
 				hysteresis = <1000>;	/* millicelsius */
@@ -232,24 +266,28 @@ map0 {
 				cooling-device = <&cpu0 1 2>, <&cpu1 1 2>,
 						 <&cpu2 1 2>, <&cpu3 1 2>;
 			};
+
 			map1 {
 				/* Set maximum frequency as 1100MHz  */
 				trip = <&apollo_alert_3>;
 				cooling-device = <&cpu0 2 3>, <&cpu1 2 3>,
 						 <&cpu2 2 3>, <&cpu3 2 3>;
 			};
+
 			map2 {
 				/* Set maximum frequency as 1000MHz  */
 				trip = <&apollo_alert_4>;
 				cooling-device = <&cpu0 3 4>, <&cpu1 3 4>,
 						 <&cpu2 3 4>, <&cpu3 3 4>;
 			};
+
 			map3 {
 				/* Set maximum frequency as 900MHz  */
 				trip = <&apollo_alert_5>;
 				cooling-device = <&cpu0 4 5>, <&cpu1 4 5>,
 						 <&cpu2 4 5>, <&cpu3 4 5>;
 			};
+
 			map4 {
 				/* Set maximum frequency as 800MHz  */
 				trip = <&apollo_alert_6>;
@@ -263,37 +301,44 @@ isp_thermal: isp-thermal {
 		thermal-sensors = <&tmu_isp>;
 		polling-delay-passive = <0>;
 		polling-delay = <0>;
+
 		trips {
 			isp_alert_0: isp-alert-0 {
 				temperature = <80000>;	/* millicelsius */
 				hysteresis = <1000>;	/* millicelsius */
 				type = "active";
 			};
+
 			isp_alert_1: isp-alert-1 {
 				temperature = <85000>;	/* millicelsius */
 				hysteresis = <1000>;	/* millicelsius */
 				type = "active";
 			};
+
 			isp_alert_2: isp-alert-2 {
 				temperature = <90000>;	/* millicelsius */
 				hysteresis = <1000>;	/* millicelsius */
 				type = "active";
 			};
+
 			isp_alert_3: isp-alert-3 {
 				temperature = <95000>;	/* millicelsius */
 				hysteresis = <1000>;	/* millicelsius */
 				type = "active";
 			};
+
 			isp_alert_4: isp-alert-4 {
 				temperature = <100000>;	/* millicelsius */
 				hysteresis = <1000>;	/* millicelsius */
 				type = "active";
 			};
+
 			isp_alert_5: isp-alert-5 {
 				temperature = <105000>;	/* millicelsius */
 				hysteresis = <1000>;	/* millicelsius */
 				type = "active";
 			};
+
 			isp_alert_6: isp-alert-6 {
 				temperature = <110000>;	/* millicelsius */
 				hysteresis = <1000>;	/* millicelsius */
diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
index bc061b57caff..5fc3ca233ac6 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
@@ -57,12 +57,15 @@ cluster0 {
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
@@ -72,12 +75,15 @@ cluster1 {
 				core0 {
 					cpu = <&cpu4>;
 				};
+
 				core1 {
 					cpu = <&cpu5>;
 				};
+
 				core2 {
 					cpu = <&cpu6>;
 				};
+
 				core3 {
 					cpu = <&cpu7>;
 				};
@@ -243,38 +249,47 @@ opp-400000000 {
 			opp-hz = /bits/ 64 <400000000>;
 			opp-microvolt = <900000>;
 		};
+
 		opp-500000000 {
 			opp-hz = /bits/ 64 <500000000>;
 			opp-microvolt = <925000>;
 		};
+
 		opp-600000000 {
 			opp-hz = /bits/ 64 <600000000>;
 			opp-microvolt = <950000>;
 		};
+
 		opp-700000000 {
 			opp-hz = /bits/ 64 <700000000>;
 			opp-microvolt = <975000>;
 		};
+
 		opp-800000000 {
 			opp-hz = /bits/ 64 <800000000>;
 			opp-microvolt = <1000000>;
 		};
+
 		opp-900000000 {
 			opp-hz = /bits/ 64 <900000000>;
 			opp-microvolt = <1050000>;
 		};
+
 		opp-1000000000 {
 			opp-hz = /bits/ 64 <1000000000>;
 			opp-microvolt = <1075000>;
 		};
+
 		opp-1100000000 {
 			opp-hz = /bits/ 64 <1100000000>;
 			opp-microvolt = <1112500>;
 		};
+
 		opp-1200000000 {
 			opp-hz = /bits/ 64 <1200000000>;
 			opp-microvolt = <1112500>;
 		};
+
 		opp-1300000000 {
 			opp-hz = /bits/ 64 <1300000000>;
 			opp-microvolt = <1150000>;
@@ -289,58 +304,72 @@ opp-500000000 {
 			opp-hz = /bits/ 64 <500000000>;
 			opp-microvolt = <900000>;
 		};
+
 		opp-600000000 {
 			opp-hz = /bits/ 64 <600000000>;
 			opp-microvolt = <900000>;
 		};
+
 		opp-700000000 {
 			opp-hz = /bits/ 64 <700000000>;
 			opp-microvolt = <912500>;
 		};
+
 		opp-800000000 {
 			opp-hz = /bits/ 64 <800000000>;
 			opp-microvolt = <912500>;
 		};
+
 		opp-900000000 {
 			opp-hz = /bits/ 64 <900000000>;
 			opp-microvolt = <937500>;
 		};
+
 		opp-1000000000 {
 			opp-hz = /bits/ 64 <1000000000>;
 			opp-microvolt = <975000>;
 		};
+
 		opp-1100000000 {
 			opp-hz = /bits/ 64 <1100000000>;
 			opp-microvolt = <1012500>;
 		};
+
 		opp-1200000000 {
 			opp-hz = /bits/ 64 <1200000000>;
 			opp-microvolt = <1037500>;
 		};
+
 		opp-1300000000 {
 			opp-hz = /bits/ 64 <1300000000>;
 			opp-microvolt = <1062500>;
 		};
+
 		opp-1400000000 {
 			opp-hz = /bits/ 64 <1400000000>;
 			opp-microvolt = <1087500>;
 		};
+
 		opp-1500000000 {
 			opp-hz = /bits/ 64 <1500000000>;
 			opp-microvolt = <1125000>;
 		};
+
 		opp-1600000000 {
 			opp-hz = /bits/ 64 <1600000000>;
 			opp-microvolt = <1137500>;
 		};
+
 		opp-1700000000 {
 			opp-hz = /bits/ 64 <1700000000>;
 			opp-microvolt = <1175000>;
 		};
+
 		opp-1800000000 {
 			opp-hz = /bits/ 64 <1800000000>;
 			opp-microvolt = <1212500>;
 		};
+
 		opp-1900000000 {
 			opp-hz = /bits/ 64 <1900000000>;
 			opp-microvolt = <1262500>;
@@ -752,7 +781,7 @@ tmu_atlas0: tmu@10060000 {
 			reg = <0x10060000 0x200>;
 			interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cmu_peris CLK_PCLK_TMU0_APBIF>,
-				<&cmu_peris CLK_SCLK_TMU0>;
+				 <&cmu_peris CLK_SCLK_TMU0>;
 			clock-names = "tmu_apbif", "tmu_sclk";
 			#thermal-sensor-cells = <0>;
 
@@ -764,7 +793,7 @@ tmu_atlas1: tmu@10068000 {
 			reg = <0x10068000 0x200>;
 			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cmu_peris CLK_PCLK_TMU0_APBIF>,
-				<&cmu_peris CLK_SCLK_TMU0>;
+				 <&cmu_peris CLK_SCLK_TMU0>;
 			clock-names = "tmu_apbif", "tmu_sclk";
 			#thermal-sensor-cells = <0>;
 
@@ -776,7 +805,7 @@ tmu_g3d: tmu@10070000 {
 			reg = <0x10070000 0x200>;
 			interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cmu_peris CLK_PCLK_TMU1_APBIF>,
-				<&cmu_peris CLK_SCLK_TMU1>;
+				 <&cmu_peris CLK_SCLK_TMU1>;
 			clock-names = "tmu_apbif", "tmu_sclk";
 			#thermal-sensor-cells = <0>;
 
@@ -788,7 +817,7 @@ tmu_apollo: tmu@10078000 {
 			reg = <0x10078000 0x200>;
 			interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cmu_peris CLK_PCLK_TMU1_APBIF>,
-				<&cmu_peris CLK_SCLK_TMU1>;
+				 <&cmu_peris CLK_SCLK_TMU1>;
 			clock-names = "tmu_apbif", "tmu_sclk";
 			#thermal-sensor-cells = <0>;
 
@@ -800,7 +829,7 @@ tmu_isp: tmu@1007c000 {
 			reg = <0x1007c000 0x200>;
 			interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cmu_peris CLK_PCLK_TMU1_APBIF>,
-				<&cmu_peris CLK_SCLK_TMU1>;
+				 <&cmu_peris CLK_SCLK_TMU1>;
 			clock-names = "tmu_apbif", "tmu_sclk";
 			#thermal-sensor-cells = <0>;
 
@@ -812,17 +841,17 @@ timer@101c0000 {
 				     "samsung,exynos4210-mct";
 			reg = <0x101c0000 0x800>;
 			interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
+				     <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&xxti>, <&cmu_peris CLK_PCLK_MCT>;
 			clock-names = "fin_pll", "mct";
 		};
@@ -960,21 +989,21 @@ decon: decon@13800000 {
 			compatible = "samsung,exynos5433-decon";
 			reg = <0x13800000 0x2104>;
 			clocks = <&cmu_disp CLK_PCLK_DECON>,
-				<&cmu_disp CLK_ACLK_DECON>,
-				<&cmu_disp CLK_ACLK_SMMU_DECON0X>,
-				<&cmu_disp CLK_ACLK_XIU_DECON0X>,
-				<&cmu_disp CLK_PCLK_SMMU_DECON0X>,
-				<&cmu_disp CLK_ACLK_SMMU_DECON1X>,
-				<&cmu_disp CLK_ACLK_XIU_DECON1X>,
-				<&cmu_disp CLK_PCLK_SMMU_DECON1X>,
-				<&cmu_disp CLK_SCLK_DECON_VCLK>,
-				<&cmu_disp CLK_SCLK_DECON_ECLK>,
-				<&cmu_disp CLK_SCLK_DSD>;
+				 <&cmu_disp CLK_ACLK_DECON>,
+				 <&cmu_disp CLK_ACLK_SMMU_DECON0X>,
+				 <&cmu_disp CLK_ACLK_XIU_DECON0X>,
+				 <&cmu_disp CLK_PCLK_SMMU_DECON0X>,
+				 <&cmu_disp CLK_ACLK_SMMU_DECON1X>,
+				 <&cmu_disp CLK_ACLK_XIU_DECON1X>,
+				 <&cmu_disp CLK_PCLK_SMMU_DECON1X>,
+				 <&cmu_disp CLK_SCLK_DECON_VCLK>,
+				 <&cmu_disp CLK_SCLK_DECON_ECLK>,
+				 <&cmu_disp CLK_SCLK_DSD>;
 			clock-names = "pclk", "aclk_decon", "aclk_smmu_decon0x",
-				"aclk_xiu_decon0x", "pclk_smmu_decon0x",
-				"aclk_smmu_decon1x", "aclk_xiu_decon1x",
-				"pclk_smmu_decon1x", "sclk_decon_vclk",
-				"sclk_decon_eclk", "dsd";
+				      "aclk_xiu_decon0x", "pclk_smmu_decon0x",
+				      "aclk_smmu_decon1x", "aclk_xiu_decon1x",
+				      "pclk_smmu_decon1x", "sclk_decon_vclk",
+				      "sclk_decon_eclk", "dsd";
 			power-domains = <&pd_disp>;
 			interrupt-names = "fifo", "vsync", "lcd_sys";
 			interrupts = <GIC_SPI 201 IRQ_TYPE_LEVEL_HIGH>,
@@ -992,6 +1021,7 @@ ports {
 
 				port@0 {
 					reg = <0>;
+
 					decon_to_mic: endpoint {
 						remote-endpoint =
 							<&mic_to_decon>;
@@ -1038,15 +1068,15 @@ dsi: dsi@13900000 {
 			phys = <&mipi_phy 1>;
 			phy-names = "dsim";
 			clocks = <&cmu_disp CLK_PCLK_DSIM0>,
-				<&cmu_disp CLK_PHYCLK_MIPIDPHY0_BITCLKDIV8>,
-				<&cmu_disp CLK_PHYCLK_MIPIDPHY0_RXCLKESC0>,
-				<&cmu_disp CLK_SCLK_RGB_VCLK_TO_DSIM0>,
-				<&cmu_disp CLK_SCLK_DSIM0>;
+				 <&cmu_disp CLK_PHYCLK_MIPIDPHY0_BITCLKDIV8>,
+				 <&cmu_disp CLK_PHYCLK_MIPIDPHY0_RXCLKESC0>,
+				 <&cmu_disp CLK_SCLK_RGB_VCLK_TO_DSIM0>,
+				 <&cmu_disp CLK_SCLK_DSIM0>;
 			clock-names = "bus_clk",
-					"phyclk_mipidphy0_bitclkdiv8",
-					"phyclk_mipidphy0_rxclkesc0",
-					"sclk_rgb_vclk_to_dsim0",
-					"sclk_mipi";
+				      "phyclk_mipidphy0_bitclkdiv8",
+				      "phyclk_mipidphy0_rxclkesc0",
+				      "sclk_rgb_vclk_to_dsim0",
+				      "sclk_mipi";
 			power-domains = <&pd_disp>;
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -1059,6 +1089,7 @@ ports {
 
 				port@0 {
 					reg = <0>;
+
 					dsi_to_mic: endpoint {
 						remote-endpoint = <&mic_to_dsi>;
 					};
@@ -1070,7 +1101,7 @@ mic: mic@13930000 {
 			compatible = "samsung,exynos5433-mic";
 			reg = <0x13930000 0x48>;
 			clocks = <&cmu_disp CLK_PCLK_MIC0>,
-				<&cmu_disp CLK_SCLK_RGB_VCLK_TO_MIC0>;
+				 <&cmu_disp CLK_SCLK_RGB_VCLK_TO_MIC0>;
 			clock-names = "pclk_mic0", "sclk_rgb_vclk_to_mic0";
 			power-domains = <&pd_disp>;
 			samsung,disp-syscon = <&syscon_disp>;
@@ -1083,6 +1114,7 @@ ports {
 
 				port@0 {
 					reg = <0>;
+
 					mic_to_decon: endpoint {
 						remote-endpoint =
 							<&decon_to_mic>;
@@ -1091,6 +1123,7 @@ mic_to_decon: endpoint {
 
 				port@1 {
 					reg = <1>;
+
 					mic_to_dsi: endpoint {
 						remote-endpoint = <&dsi_to_mic>;
 					};
@@ -1103,19 +1136,19 @@ hdmi: hdmi@13970000 {
 			reg = <0x13970000 0x70000>;
 			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cmu_disp CLK_PCLK_HDMI>,
-				<&cmu_disp CLK_PCLK_HDMIPHY>,
-				<&cmu_disp CLK_PHYCLK_HDMIPHY_TMDS_CLKO>,
-				<&cmu_disp CLK_PHYCLK_HDMI_PIXEL>,
-				<&cmu_disp CLK_PHYCLK_HDMIPHY_TMDS_CLKO_PHY>,
-				<&cmu_disp CLK_MOUT_PHYCLK_HDMIPHY_TMDS_CLKO_USER>,
-				<&cmu_disp CLK_PHYCLK_HDMIPHY_PIXEL_CLKO_PHY>,
-				<&cmu_disp CLK_MOUT_PHYCLK_HDMIPHY_PIXEL_CLKO_USER>,
-				<&xxti>, <&cmu_disp CLK_SCLK_HDMI_SPDIF>;
+				 <&cmu_disp CLK_PCLK_HDMIPHY>,
+				 <&cmu_disp CLK_PHYCLK_HDMIPHY_TMDS_CLKO>,
+				 <&cmu_disp CLK_PHYCLK_HDMI_PIXEL>,
+				 <&cmu_disp CLK_PHYCLK_HDMIPHY_TMDS_CLKO_PHY>,
+				 <&cmu_disp CLK_MOUT_PHYCLK_HDMIPHY_TMDS_CLKO_USER>,
+				 <&cmu_disp CLK_PHYCLK_HDMIPHY_PIXEL_CLKO_PHY>,
+				 <&cmu_disp CLK_MOUT_PHYCLK_HDMIPHY_PIXEL_CLKO_USER>,
+				 <&xxti>, <&cmu_disp CLK_SCLK_HDMI_SPDIF>;
 			clock-names = "hdmi_pclk", "hdmi_i_pclk",
-				"i_tmds_clk", "i_pixel_clk",
-				"tmds_clko", "tmds_clko_user",
-				"pixel_clko", "pixel_clko_user",
-				"oscclk", "i_spdif_clk";
+				      "i_tmds_clk", "i_pixel_clk",
+				      "tmds_clko", "tmds_clko_user",
+				      "pixel_clko", "pixel_clko_user",
+				      "oscclk", "i_spdif_clk";
 			phy = <&hdmiphy>;
 			ddc = <&hsi2c_11>;
 			samsung,syscon-phandle = <&pmu_system_controller>;
@@ -1219,30 +1252,37 @@ opp-160000000 {
 					opp-hz = /bits/ 64 <160000000>;
 					opp-microvolt = <1000000>;
 				};
+
 				opp-267000000 {
 					opp-hz = /bits/ 64 <267000000>;
 					opp-microvolt = <1000000>;
 				};
+
 				opp-350000000 {
 					opp-hz = /bits/ 64 <350000000>;
 					opp-microvolt = <1025000>;
 				};
+
 				opp-420000000 {
 					opp-hz = /bits/ 64 <420000000>;
 					opp-microvolt = <1025000>;
 				};
+
 				opp-500000000 {
 					opp-hz = /bits/ 64 <500000000>;
 					opp-microvolt = <1075000>;
 				};
+
 				opp-550000000 {
 					opp-hz = /bits/ 64 <550000000>;
 					opp-microvolt = <1125000>;
 				};
+
 				opp-600000000 {
 					opp-hz = /bits/ 64 <600000000>;
 					opp-microvolt = <1150000>;
 				};
+
 				opp-700000000 {
 					opp-hz = /bits/ 64 <700000000>;
 					opp-microvolt = <1150000>;
@@ -1437,7 +1477,7 @@ serial_0: serial@14c10000 {
 			reg = <0x14c10000 0x100>;
 			interrupts = <GIC_SPI 421 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cmu_peric CLK_PCLK_UART0>,
-				<&cmu_peric CLK_SCLK_UART0>;
+				 <&cmu_peric CLK_SCLK_UART0>;
 			clock-names = "uart", "clk_uart_baud0";
 			pinctrl-names = "default";
 			pinctrl-0 = <&uart0_bus>;
@@ -1450,7 +1490,7 @@ serial_1: serial@14c20000 {
 			reg = <0x14c20000 0x100>;
 			interrupts = <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cmu_peric CLK_PCLK_UART1>,
-				<&cmu_peric CLK_SCLK_UART1>;
+				 <&cmu_peric CLK_SCLK_UART1>;
 			clock-names = "uart", "clk_uart_baud0";
 			pinctrl-names = "default";
 			pinctrl-0 = <&uart1_bus>;
@@ -1463,7 +1503,7 @@ serial_2: serial@14c30000 {
 			reg = <0x14c30000 0x100>;
 			interrupts = <GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cmu_peric CLK_PCLK_UART2>,
-				<&cmu_peric CLK_SCLK_UART2>;
+				 <&cmu_peric CLK_SCLK_UART2>;
 			clock-names = "uart", "clk_uart_baud0";
 			pinctrl-names = "default";
 			pinctrl-0 = <&uart2_bus>;
@@ -1480,8 +1520,8 @@ spi_0: spi@14d20000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			clocks = <&cmu_peric CLK_PCLK_SPI0>,
-				<&cmu_peric CLK_SCLK_SPI0>,
-				<&cmu_peric CLK_SCLK_IOCLK_SPI0>;
+				 <&cmu_peric CLK_SCLK_SPI0>,
+				 <&cmu_peric CLK_SCLK_IOCLK_SPI0>;
 			clock-names = "spi", "spi_busclk0", "spi_ioclk";
 			samsung,spi-src-clk = <0>;
 			pinctrl-names = "default";
@@ -1501,8 +1541,8 @@ spi_1: spi@14d30000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			clocks = <&cmu_peric CLK_PCLK_SPI1>,
-				<&cmu_peric CLK_SCLK_SPI1>,
-				<&cmu_peric CLK_SCLK_IOCLK_SPI1>;
+				 <&cmu_peric CLK_SCLK_SPI1>,
+				 <&cmu_peric CLK_SCLK_IOCLK_SPI1>;
 			clock-names = "spi", "spi_busclk0", "spi_ioclk";
 			samsung,spi-src-clk = <0>;
 			pinctrl-names = "default";
@@ -1522,8 +1562,8 @@ spi_2: spi@14d40000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			clocks = <&cmu_peric CLK_PCLK_SPI2>,
-				<&cmu_peric CLK_SCLK_SPI2>,
-				<&cmu_peric CLK_SCLK_IOCLK_SPI2>;
+				 <&cmu_peric CLK_SCLK_SPI2>,
+				 <&cmu_peric CLK_SCLK_IOCLK_SPI2>;
 			clock-names = "spi", "spi_busclk0", "spi_ioclk";
 			samsung,spi-src-clk = <0>;
 			pinctrl-names = "default";
@@ -1543,8 +1583,8 @@ spi_3: spi@14d50000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			clocks = <&cmu_peric CLK_PCLK_SPI3>,
-				<&cmu_peric CLK_SCLK_SPI3>,
-				<&cmu_peric CLK_SCLK_IOCLK_SPI3>;
+				 <&cmu_peric CLK_SCLK_SPI3>,
+				 <&cmu_peric CLK_SCLK_IOCLK_SPI3>;
 			clock-names = "spi", "spi_busclk0", "spi_ioclk";
 			samsung,spi-src-clk = <0>;
 			pinctrl-names = "default";
@@ -1564,8 +1604,8 @@ spi_4: spi@14d00000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			clocks = <&cmu_peric CLK_PCLK_SPI4>,
-				<&cmu_peric CLK_SCLK_SPI4>,
-				<&cmu_peric CLK_SCLK_IOCLK_SPI4>;
+				 <&cmu_peric CLK_SCLK_SPI4>,
+				 <&cmu_peric CLK_SCLK_IOCLK_SPI4>;
 			clock-names = "spi", "spi_busclk0", "spi_ioclk";
 			samsung,spi-src-clk = <0>;
 			pinctrl-names = "default";
@@ -1802,9 +1842,9 @@ hsi2c_11: i2c@14df0000 {
 		usbdrd30: usb@15400000 {
 			compatible = "samsung,exynos5433-dwusb3";
 			clocks = <&cmu_fsys CLK_ACLK_USBDRD30>,
-				<&cmu_fsys CLK_SCLK_USBDRD30>,
-				<&cmu_fsys CLK_PHYCLK_USBDRD30_UDRD30_PHYCLOCK>,
-				<&cmu_fsys CLK_PHYCLK_USBDRD30_UDRD30_PIPE_PCLK>;
+				 <&cmu_fsys CLK_SCLK_USBDRD30>,
+				 <&cmu_fsys CLK_PHYCLK_USBDRD30_UDRD30_PHYCLOCK>,
+				 <&cmu_fsys CLK_PHYCLK_USBDRD30_UDRD30_PIPE_PCLK>;
 			clock-names = "aclk", "susp_clk", "phyclk", "pipe_pclk";
 			#address-cells = <1>;
 			#size-cells = <1>;
@@ -1815,8 +1855,8 @@ usbdrd30: usb@15400000 {
 			usbdrd_dwc3: usb@0 {
 				compatible = "snps,dwc3";
 				clocks = <&cmu_fsys CLK_SCLK_USBDRD30>,
-					<&cmu_fsys CLK_ACLK_USBDRD30>,
-					<&cmu_fsys CLK_SCLK_USBDRD30>;
+					 <&cmu_fsys CLK_ACLK_USBDRD30>,
+					 <&cmu_fsys CLK_SCLK_USBDRD30>;
 				clock-names = "ref", "bus_early", "suspend";
 				reg = <0x0 0x10000>;
 				interrupts = <GIC_SPI 231 IRQ_TYPE_LEVEL_HIGH>;
@@ -1829,11 +1869,10 @@ usbdrd30_phy: phy@15500000 {
 			compatible = "samsung,exynos5433-usbdrd-phy";
 			reg = <0x15500000 0x100>;
 			clocks = <&cmu_fsys CLK_ACLK_USBDRD30>, <&xxti>,
-				<&cmu_fsys CLK_PHYCLK_USBDRD30_UDRD30_PHYCLOCK>,
-				<&cmu_fsys CLK_PHYCLK_USBDRD30_UDRD30_PIPE_PCLK>,
-				<&cmu_fsys CLK_SCLK_USBDRD30>;
-			clock-names = "phy", "ref", "phy_utmi", "phy_pipe",
-					"itp";
+				 <&cmu_fsys CLK_PHYCLK_USBDRD30_UDRD30_PHYCLOCK>,
+				 <&cmu_fsys CLK_PHYCLK_USBDRD30_UDRD30_PIPE_PCLK>,
+				 <&cmu_fsys CLK_SCLK_USBDRD30>;
+			clock-names = "phy", "ref", "phy_utmi", "phy_pipe", "itp";
 			#phy-cells = <1>;
 			samsung,pmu-syscon = <&pmu_system_controller>;
 
@@ -1844,11 +1883,10 @@ usbhost30_phy: phy@15580000 {
 			compatible = "samsung,exynos5433-usbdrd-phy";
 			reg = <0x15580000 0x100>;
 			clocks = <&cmu_fsys CLK_ACLK_USBHOST30>, <&xxti>,
-				<&cmu_fsys CLK_PHYCLK_USBHOST30_UHOST30_PHYCLOCK>,
-				<&cmu_fsys CLK_PHYCLK_USBHOST30_UHOST30_PIPE_PCLK>,
-				<&cmu_fsys CLK_SCLK_USBHOST30>;
-			clock-names = "phy", "ref", "phy_utmi", "phy_pipe",
-					"itp";
+				 <&cmu_fsys CLK_PHYCLK_USBHOST30_UHOST30_PHYCLOCK>,
+				 <&cmu_fsys CLK_PHYCLK_USBHOST30_UHOST30_PIPE_PCLK>,
+				 <&cmu_fsys CLK_SCLK_USBHOST30>;
+			clock-names = "phy", "ref", "phy_utmi", "phy_pipe", "itp";
 			#phy-cells = <1>;
 			samsung,pmu-syscon = <&pmu_system_controller>;
 
@@ -1858,9 +1896,9 @@ usbhost30_phy: phy@15580000 {
 		usbhost30: usb@15a00000 {
 			compatible = "samsung,exynos5433-dwusb3";
 			clocks = <&cmu_fsys CLK_ACLK_USBHOST30>,
-				<&cmu_fsys CLK_SCLK_USBHOST30>,
-				<&cmu_fsys CLK_PHYCLK_USBHOST30_UHOST30_PHYCLOCK>,
-				<&cmu_fsys CLK_PHYCLK_USBHOST30_UHOST30_PIPE_PCLK>;
+				 <&cmu_fsys CLK_SCLK_USBHOST30>,
+				 <&cmu_fsys CLK_PHYCLK_USBHOST30_UHOST30_PHYCLOCK>,
+				 <&cmu_fsys CLK_PHYCLK_USBHOST30_UHOST30_PIPE_PCLK>;
 			clock-names = "aclk", "susp_clk", "phyclk", "pipe_pclk";
 			#address-cells = <1>;
 			#size-cells = <1>;
@@ -1871,8 +1909,8 @@ usbhost30: usb@15a00000 {
 			usbhost_dwc3: usb@0 {
 				compatible = "snps,dwc3";
 				clocks = <&cmu_fsys CLK_SCLK_USBHOST30>,
-					<&cmu_fsys CLK_ACLK_USBHOST30>,
-					<&cmu_fsys CLK_SCLK_USBHOST30>;
+					 <&cmu_fsys CLK_ACLK_USBHOST30>,
+					 <&cmu_fsys CLK_SCLK_USBHOST30>;
 				clock-names = "ref", "bus_early", "suspend";
 				reg = <0x0 0x10000>;
 				interrupts = <GIC_SPI 244 IRQ_TYPE_LEVEL_HIGH>;
@@ -1889,7 +1927,7 @@ mshc_0: mmc@15540000 {
 			#size-cells = <0>;
 			reg = <0x15540000 0x2000>;
 			clocks = <&cmu_fsys CLK_ACLK_MMC0>,
-				<&cmu_fsys CLK_SCLK_MMC0>;
+				 <&cmu_fsys CLK_SCLK_MMC0>;
 			clock-names = "biu", "ciu";
 			fifo-depth = <0x40>;
 
@@ -1904,7 +1942,7 @@ mshc_1: mmc@15550000 {
 			#size-cells = <0>;
 			reg = <0x15550000 0x2000>;
 			clocks = <&cmu_fsys CLK_ACLK_MMC1>,
-				<&cmu_fsys CLK_SCLK_MMC1>;
+				 <&cmu_fsys CLK_SCLK_MMC1>;
 			clock-names = "biu", "ciu";
 			fifo-depth = <0x40>;
 
@@ -1919,7 +1957,7 @@ mshc_2: mmc@15560000 {
 			#size-cells = <0>;
 			reg = <0x15560000 0x2000>;
 			clocks = <&cmu_fsys CLK_ACLK_MMC2>,
-				<&cmu_fsys CLK_SCLK_MMC2>;
+				 <&cmu_fsys CLK_SCLK_MMC2>;
 			clock-names = "biu", "ciu";
 			fifo-depth = <0x40>;
 
@@ -1974,8 +2012,8 @@ i2s0: i2s@11440000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				clocks = <&cmu_aud CLK_PCLK_AUD_I2S>,
-					<&cmu_aud CLK_SCLK_AUD_I2S>,
-					<&cmu_aud CLK_SCLK_I2S_BCLK>;
+					 <&cmu_aud CLK_SCLK_AUD_I2S>,
+					 <&cmu_aud CLK_SCLK_I2S_BCLK>;
 				clock-names = "iis", "i2s_opclk0", "i2s_opclk1";
 				#clock-cells = <1>;
 				pinctrl-names = "default";
@@ -1991,7 +2029,7 @@ serial_3: serial@11460000 {
 				reg = <0x11460000 0x100>;
 				interrupts = <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&cmu_aud CLK_PCLK_AUD_UART>,
-					<&cmu_aud CLK_SCLK_AUD_UART>;
+					 <&cmu_aud CLK_SCLK_AUD_UART>;
 				clock-names = "uart", "clk_uart_baud0";
 				pinctrl-names = "default";
 				pinctrl-0 = <&uart_aud_bus>;
@@ -2037,14 +2075,10 @@ pcie: pcie@15700000 {
 
 	timer: timer {
 		compatible = "arm,armv8-timer";
-		interrupts = <GIC_PPI 13
-				(GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_HIGH)>,
-			<GIC_PPI 14
-				(GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_HIGH)>,
-			<GIC_PPI 11
-				(GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_HIGH)>,
-			<GIC_PPI 10
-				(GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_HIGH)>;
+		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_HIGH)>,
+			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_HIGH)>,
+			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_HIGH)>,
+			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_HIGH)>;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/exynos/exynos7-espresso.dts b/arch/arm64/boot/dts/exynos/exynos7-espresso.dts
index c8925f4076b5..b3d5b447aeb6 100644
--- a/arch/arm64/boot/dts/exynos/exynos7-espresso.dts
+++ b/arch/arm64/boot/dts/exynos/exynos7-espresso.dts
@@ -99,8 +99,7 @@ pmic@66 {
 		s2mps15_osc: clocks {
 			compatible = "samsung,s2mps13-clk";
 			#clock-cells = <1>;
-			clock-output-names = "s2mps13_ap", "s2mps13_cp",
-				"s2mps13_bt";
+			clock-output-names = "s2mps13_ap", "s2mps13_cp", "s2mps13_bt";
 		};
 
 		regulators {
diff --git a/arch/arm64/boot/dts/exynos/exynos7-trip-points.dtsi b/arch/arm64/boot/dts/exynos/exynos7-trip-points.dtsi
index d3301b8bd364..ecae9550801c 100644
--- a/arch/arm64/boot/dts/exynos/exynos7-trip-points.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos7-trip-points.dtsi
@@ -12,36 +12,43 @@ cpu-alert-0 {
 		hysteresis = <10000>; /* millicelsius */
 		type = "passive";
 	};
+
 	cpu-alert-1 {
 		temperature = <80000>; /* millicelsius */
 		hysteresis = <10000>; /* millicelsius */
 		type = "passive";
 	};
+
 	cpu-alert-2 {
 		temperature = <85000>; /* millicelsius */
 		hysteresis = <10000>; /* millicelsius */
 		type = "passive";
 	};
+
 	cpu-alert-3 {
 		temperature = <90000>; /* millicelsius */
 		hysteresis = <10000>; /* millicelsius */
 		type = "passive";
 	};
+
 	cpu-alert-4 {
 		temperature = <95000>; /* millicelsius */
 		hysteresis = <10000>; /* millicelsius */
 		type = "passive";
 	};
+
 	cpu-alert-5 {
 		temperature = <100000>; /* millicelsius */
 		hysteresis = <10000>; /* millicelsius */
 		type = "passive";
 	};
+
 	cpu-alert-6 {
 		temperature = <110000>; /* millicelsius */
 		hysteresis = <10000>; /* millicelsius */
 		type = "passive";
 	};
+
 	cpu-crit-0 {
 		temperature = <115000>; /* millicelsius */
 		hysteresis = <0>; /* millicelsius */
diff --git a/arch/arm64/boot/dts/exynos/exynos7.dtsi b/arch/arm64/boot/dts/exynos/exynos7.dtsi
index fa4e7d678423..a722d721a7c8 100644
--- a/arch/arm64/boot/dts/exynos/exynos7.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos7.dtsi
@@ -670,13 +670,13 @@ tmuctrl_0: tmu@10060000 {
 		ufs: ufs@15570000 {
 			compatible = "samsung,exynos7-ufs";
 			reg = <0x15570000 0x100>,  /* 0: HCI standard */
-				<0x15570100 0x100>,  /* 1: Vendor specificed */
-				<0x15571000 0x200>,  /* 2: UNIPRO */
-				<0x15572000 0x300>;  /* 3: UFS protector */
+			      <0x15570100 0x100>,  /* 1: Vendor specificed */
+			      <0x15571000 0x200>,  /* 2: UNIPRO */
+			      <0x15572000 0x300>;  /* 3: UFS protector */
 			reg-names = "hci", "vs_hci", "unipro", "ufsp";
 			interrupts = <GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clock_fsys1 ACLK_UFS20_LINK>,
-				<&clock_fsys1 SCLK_UFSUNIPRO20_USER>;
+				 <&clock_fsys1 SCLK_UFSUNIPRO20_USER>;
 			clock-names = "core_clk", "sclk_unipro_main";
 			freq-table-hz = <0 0>, <0 0>;
 			pinctrl-names = "default";
@@ -706,10 +706,10 @@ usbdrd_phy: phy@15500000 {
 			compatible = "samsung,exynos7-usbdrd-phy";
 			reg = <0x15500000 0x100>;
 			clocks = <&clock_fsys0 ACLK_USBDRD300>,
-			       <&clock_fsys0 OSCCLK_PHY_CLKOUT_USB30_PHY>,
-			       <&clock_fsys0 PHYCLK_USBDRD300_UDRD30_PHYCLK_USER>,
-			       <&clock_fsys0 PHYCLK_USBDRD300_UDRD30_PIPE_PCLK_USER>,
-			       <&clock_fsys0 SCLK_USBDRD300_REFCLK>;
+				 <&clock_fsys0 OSCCLK_PHY_CLKOUT_USB30_PHY>,
+				 <&clock_fsys0 PHYCLK_USBDRD300_UDRD30_PHYCLK_USER>,
+				 <&clock_fsys0 PHYCLK_USBDRD300_UDRD30_PIPE_PCLK_USER>,
+				 <&clock_fsys0 SCLK_USBDRD300_REFCLK>;
 			clock-names = "phy", "ref", "phy_utmi", "phy_pipe", "itp";
 			samsung,pmu-syscon = <&pmu_system_controller>;
 			#phy-cells = <1>;
@@ -718,10 +718,10 @@ usbdrd_phy: phy@15500000 {
 		usbdrd: usb@15400000 {
 			compatible = "samsung,exynos7-dwusb3";
 			clocks = <&clock_fsys0 ACLK_USBDRD300>,
-			       <&clock_fsys0 SCLK_USBDRD300_SUSPENDCLK>,
-			       <&clock_fsys0 ACLK_AXIUS_USBDRD30X_FSYS0X>;
+				 <&clock_fsys0 SCLK_USBDRD300_SUSPENDCLK>,
+				 <&clock_fsys0 ACLK_AXIUS_USBDRD30X_FSYS0X>;
 			clock-names = "usbdrd30", "usbdrd30_susp_clk",
-				"usbdrd30_axius_clk";
+				      "usbdrd30_axius_clk";
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x15400000 0x10000>;
@@ -747,14 +747,10 @@ atlas_thermal: cluster0-thermal {
 
 	timer {
 		compatible = "arm,armv8-timer";
-		interrupts = <GIC_PPI 13
-				(GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
-			     <GIC_PPI 14
-				(GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
-			     <GIC_PPI 11
-				(GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
-			     <GIC_PPI 10
-				(GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
+		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts b/arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts
index de30d0970336..02bab3ab2711 100644
--- a/arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts
+++ b/arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts
@@ -398,8 +398,8 @@ accelerometer@1d {
 		pinctrl-0 = <&accel_irq>;
 
 		mount-matrix = "-1", "0",  "0",
-				"0", "1",  "0",
-				"0", "0", "-1";
+			       "0", "1",  "0",
+			       "0", "0", "-1";
 
 		st,drdy-int-pin = <1>;
 	};
diff --git a/arch/arm64/boot/dts/exynos/exynos7870.dtsi b/arch/arm64/boot/dts/exynos/exynos7870.dtsi
index 19f9ae783587..9e3ec6c952f0 100644
--- a/arch/arm64/boot/dts/exynos/exynos7870.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos7870.dtsi
@@ -36,12 +36,15 @@ cluster0 {
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
@@ -51,12 +54,15 @@ cluster1 {
 				core0 {
 					cpu = <&cpu4>;
 				};
+
 				core1 {
 					cpu = <&cpu5>;
 				};
+
 				core2 {
 					cpu = <&cpu6>;
 				};
+
 				core3 {
 					cpu = <&cpu7>;
 				};
@@ -201,8 +207,7 @@ gic: interrupt-controller@104e1000 {
 			      <0x104e2000 0x1000>,
 			      <0x104e4000 0x2000>,
 			      <0x104e6000 0x2000>;
-			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(8) |
-						 IRQ_TYPE_LEVEL_HIGH)>;
+			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_HIGH)>;
 			interrupt-controller;
 			#address-cells = <0>;
 			#interrupt-cells = <3>;
diff --git a/arch/arm64/boot/dts/exynos/exynos7885.dtsi b/arch/arm64/boot/dts/exynos/exynos7885.dtsi
index 7d7d56206b86..6b994b487107 100644
--- a/arch/arm64/boot/dts/exynos/exynos7885.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos7885.dtsi
@@ -56,18 +56,23 @@ cluster0 {
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
+
 				core4 {
 					cpu = <&cpu4>;
 				};
+
 				core5 {
 					cpu = <&cpu5>;
 				};
@@ -77,6 +82,7 @@ cluster1 {
 				core0 {
 					cpu = <&cpu6>;
 				};
+
 				core1 {
 					cpu = <&cpu7>;
 				};
@@ -186,8 +192,7 @@ gic: interrupt-controller@12301000 {
 			      <0x12302000 0x2000>,
 			      <0x12304000 0x2000>,
 			      <0x12306000 0x2000>;
-			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(8) |
-						 IRQ_TYPE_LEVEL_HIGH)>;
+			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_HIGH)>;
 		};
 
 		cmu_peri: clock-controller@10010000 {
diff --git a/arch/arm64/boot/dts/exynos/exynos850-pinctrl.dtsi b/arch/arm64/boot/dts/exynos/exynos850-pinctrl.dtsi
index 424bc80bde68..e3f1ae8dedbf 100644
--- a/arch/arm64/boot/dts/exynos/exynos850-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos850-pinctrl.dtsi
@@ -509,6 +509,7 @@ gpp0: gpp0-gpio-bank {
 		interrupt-controller;
 		#interrupt-cells = <2>;
 	};
+
 	gpp1: gpp1-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
index 8abf7c9eac9e..911643008b9f 100644
--- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
@@ -61,12 +61,15 @@ cluster0 {
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
@@ -76,12 +79,15 @@ cluster1 {
 				core0 {
 					cpu = <&cpu4>;
 				};
+
 				core1 {
 					cpu = <&cpu5>;
 				};
+
 				core2 {
 					cpu = <&cpu6>;
 				};
+
 				core3 {
 					cpu = <&cpu7>;
 				};
@@ -96,24 +102,28 @@ cpu0: cpu@0 {
 			clocks = <&cmu_cpucl0 CLK_CLUSTER0_SCLK>;
 			clock-names = "cluster0_clk";
 		};
+
 		cpu1: cpu@1 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a55";
 			reg = <0x1>;
 			enable-method = "psci";
 		};
+
 		cpu2: cpu@2 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a55";
 			reg = <0x2>;
 			enable-method = "psci";
 		};
+
 		cpu3: cpu@3 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a55";
 			reg = <0x3>;
 			enable-method = "psci";
 		};
+
 		cpu4: cpu@100 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a55";
@@ -122,18 +132,21 @@ cpu4: cpu@100 {
 			clocks = <&cmu_cpucl1 CLK_CLUSTER1_SCLK>;
 			clock-names = "cluster1_clk";
 		};
+
 		cpu5: cpu@101 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a55";
 			reg = <0x101>;
 			enable-method = "psci";
 		};
+
 		cpu6: cpu@102 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a55";
 			reg = <0x102>;
 			enable-method = "psci";
 		};
+
 		cpu7: cpu@103 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a55";
@@ -207,8 +220,7 @@ gic: interrupt-controller@12a01000 {
 			      <0x12a04000 0x2000>,
 			      <0x12a06000 0x2000>;
 			interrupt-controller;
-			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(8) |
-						 IRQ_TYPE_LEVEL_HIGH)>;
+			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_HIGH)>;
 		};
 
 		pmu_system_controller: system-controller@11860000 {
diff --git a/arch/arm64/boot/dts/exynos/exynos8855.dtsi b/arch/arm64/boot/dts/exynos/exynos8855.dtsi
index 9d82fceb5130..0333b80eba84 100644
--- a/arch/arm64/boot/dts/exynos/exynos8855.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos8855.dtsi
@@ -42,12 +42,15 @@ cluster0 {
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
@@ -57,9 +60,11 @@ cluster1 {
 				core0 {
 					cpu = <&cpu4>;
 				};
+
 				core1 {
 					cpu = <&cpu5>;
 				};
+
 				core2 {
 					cpu = <&cpu6>;
 				};
diff --git a/arch/arm64/boot/dts/exynos/exynos8895.dtsi b/arch/arm64/boot/dts/exynos/exynos8895.dtsi
index e3b6d37aac09..a9a6f6970d71 100644
--- a/arch/arm64/boot/dts/exynos/exynos8895.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos8895.dtsi
@@ -35,12 +35,15 @@ cluster0 {
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
@@ -50,12 +53,15 @@ cluster1 {
 				core0 {
 					cpu = <&cpu4>;
 				};
+
 				core1 {
 					cpu = <&cpu5>;
 				};
+
 				core2 {
 					cpu = <&cpu6>;
 				};
+
 				core3 {
 					cpu = <&cpu7>;
 				};
@@ -207,8 +213,7 @@ gic: interrupt-controller@10201000 {
 			      <0x10206000 0x2000>;
 			#interrupt-cells = <3>;
 			interrupt-controller;
-			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(8) |
-						 IRQ_TYPE_LEVEL_HIGH)>;
+			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_HIGH)>;
 			#address-cells = <0>;
 			#size-cells = <1>;
 		};
diff --git a/arch/arm64/boot/dts/exynos/exynos9810.dtsi b/arch/arm64/boot/dts/exynos/exynos9810.dtsi
index 01eba31f7ca3..4f1f1e9a41b2 100644
--- a/arch/arm64/boot/dts/exynos/exynos9810.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos9810.dtsi
@@ -36,12 +36,15 @@ cluster0 {
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
@@ -51,12 +54,15 @@ cluster1 {
 				core0 {
 					cpu = <&cpu4>;
 				};
+
 				core1 {
 					cpu = <&cpu5>;
 				};
+
 				core2 {
 					cpu = <&cpu6>;
 				};
+
 				core3 {
 					cpu = <&cpu7>;
 				};
@@ -179,8 +185,7 @@ gic: interrupt-controller@10101000 {
 			      <0x10106000 0x2000>;
 			#interrupt-cells = <3>;
 			interrupt-controller;
-			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(8) |
-						 IRQ_TYPE_LEVEL_HIGH)>;
+			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_HIGH)>;
 			#address-cells = <0>;
 			#size-cells = <1>;
 		};
diff --git a/arch/arm64/boot/dts/exynos/exynos990.dtsi b/arch/arm64/boot/dts/exynos/exynos990.dtsi
index c15ccaff2666..8115d581b173 100644
--- a/arch/arm64/boot/dts/exynos/exynos990.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos990.dtsi
@@ -243,8 +243,7 @@ gic: interrupt-controller@10101000 {
 			      <0x10106000 0x2000>;
 			#interrupt-cells = <3>;
 			interrupt-controller;
-			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(8) |
-						 IRQ_TYPE_LEVEL_HIGH)>;
+			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_HIGH)>;
 			#address-cells = <0>;
 			#size-cells = <1>;
 		};
diff --git a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
index 94f8d1c47676..9c140ca261a2 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
@@ -51,12 +51,15 @@ cluster0 {
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
@@ -66,12 +69,15 @@ cluster1 {
 				core0 {
 					cpu = <&cpu4>;
 				};
+
 				core1 {
 					cpu = <&cpu5>;
 				};
+
 				core2 {
 					cpu = <&cpu6>;
 				};
+
 				core3 {
 					cpu = <&cpu7>;
 				};
@@ -338,8 +344,7 @@ gic: interrupt-controller@10101000 {
 			      <0x10102000 0x2000>,
 			      <0x10104000 0x2000>,
 			      <0x10106000 0x2000>;
-			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(8) |
-						 IRQ_TYPE_LEVEL_HIGH)>;
+			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_HIGH)>;
 		};
 
 		pdma0: dma-controller@1b2e0000 {
diff --git a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
index f42207bdc701..399b56b4dbdd 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
@@ -48,12 +48,15 @@ cluster0 {
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
@@ -63,12 +66,15 @@ cluster1 {
 				core0 {
 					cpu = <&cpu4>;
 				};
+
 				core1 {
 					cpu = <&cpu5>;
 				};
+
 				core2 {
 					cpu = <&cpu6>;
 				};
+
 				core3 {
 					cpu = <&cpu7>;
 				};
@@ -78,6 +84,7 @@ cluster2 {
 				core0 {
 					cpu = <&cpu8>;
 				};
+
 				core1 {
 					cpu = <&cpu9>;
 				};

-- 
2.53.0

