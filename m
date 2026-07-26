Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CF393D6461
	for <linux-samsung-soc@vger.kernel.org>; Sun, 26 Jul 2026 17:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785087839; cv=none; b=NTz6bUpk2aHpO4jkqMikm5MD3pU6ZxhnQzjG3BOlPfIUzh/2S6ulmv2qKKJIb1ZlChQcKRSU87eSFP/lZeBKgFMLTOZMN+U5EyfkvcgdVitXyGK5hdc3b+QHOCLvapKRM/DnnLn0ZsD1McZohdqS8hKw16iP3ou4ZZ7mJXpbLcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785087839; c=relaxed/simple;
	bh=WvcezNFpHYyam4klaC1DUWD32AAZVNqYh431NJ+U7h4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hvDJAIOH9nUu8a4clHa+X8mSx0tDEebQuPZacY3+Dv21zdsB75XicLqbA73GRa3xcgykA1zET+h1BzhmZMPxibNs+PTlAbb9G03yZFKSRy6pAeI3HwV+r26mF6iaf2ngnclWa7ndZiqKvPA9kDYK9JMAQPFZZjCQnD4uY/aGoOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d7tHnyVI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hvv7bB2r; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d7tHnyVI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hvv7bB2r"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66QH6hJp1370837
	for <linux-samsung-soc@vger.kernel.org>; Sun, 26 Jul 2026 17:43:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UkspsL3S+oEqiI6BMhic/fTn4T/OANhIMvDANm9/NDQ=; b=d7tHnyVIxd6eqRir
	wsJpglHz50VotIOhIZSLNs1KtHzATiNWbqCkcW4+w1+MAdMiISck8vqWPiv+Yvq9
	+5u8djOD+QYuZ1r6Xvl7GvBqG/xXVk54qi4v/kBmfGiO5N+B1mfl75LjfGTUzA9d
	GmOasMCYEYrX40v3qzOpNemT7jBIlwXyiqu3KZfVGEll13ziRnxG/4LW25xJSv3d
	pgYGjsmFJ9tq6qD8RqpwrrbSEspxsyjsloQXW9Z/mlDqFGVqYrWOib31RzOVvkQg
	8LHwOwm0wGc5ldyk0robC6QY9PceNa6hgN+KPzb5BHRnwa9+AtLgb+kXoLDvGCj7
	fRiA+w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fngysrn18-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Sun, 26 Jul 2026 17:43:54 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c0408254aso49897741cf.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 26 Jul 2026 10:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785087833; x=1785692633; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UkspsL3S+oEqiI6BMhic/fTn4T/OANhIMvDANm9/NDQ=;
        b=hvv7bB2rl7rji4hzVpYqV//FYGaM7SYsJpsF82vDohlSBZOY2vWpRMsiYqhKQDa/QH
         wI3ySb1E47BcWPTkoJvBXW9SYOoF6TWIk+o2NLXm/bPvp1jMAHfJYk1X2vj0HhfT9NDg
         udH15Sl8y5COmlvrY9VfLW58WxoJUau16EeY/iy7YtF57DofU4lrG0knppa5aib0nx3J
         PeTO2nYBzut+r/t1lYzcRhHt3grEmEobV0hnv3uNg0CFixU+XD+DM0bTMfEoUMKucSx+
         V4PkBjGCgbQdxOtKioylUJ2Qbli5EjFDAlHAy8wTIAKFlqP+8kLidEK/si6PWxTYPKik
         z1aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785087833; x=1785692633;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UkspsL3S+oEqiI6BMhic/fTn4T/OANhIMvDANm9/NDQ=;
        b=fZsJJW3Hu1KdsDHPztxoq8LnMj0OeLlyA69wch7xLE18zgpwhzrZfzfLI6M0QNHvzJ
         D0W1SBk3B+ABW+la/c4KsEDfMrQ+sYnBg6r8rRrYHfhr5TIn8wTqObO4JrDipeJswBY7
         sVORwvo+uFoGkvhCwFNGP0zb1gUmoXsp/+5lz/3R8oACG3rqhpXDwvYIXpP1/NFTGI6J
         irwwJkphNu8xyunSviBBpOSFDSYo8ViZGyDzWgnuznlmc0I2l6JXcRDcrTAR+7udgpC9
         pk3Sz8Kz/INUbiczTu3Y64c+y9xp6/bONeM35ovj1A1636paxpP2pc+ltxlKXQSYULAX
         GI8Q==
X-Forwarded-Encrypted: i=1; AHgh+RryWu/ioaobvRm3FPS9aVEavY0RTtdOSraXiynj7fDWK0pa2DPWIXulnxX/ONi9KmWDWGc4eXMO6xSWxGZXR5e/tA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWdDGKEoDmOJWf4vkpTPm7CG1Ta9NGgEFfV8x1KpdiiSfXpMkM
	Zj7wHJSFmjAnXiHjVyzqyhOfui7N79eiJ7UFL4SR4ARHkBtAhtb3Xxt1Sfi44CYFaxIZ4yBEcZV
	YIdUzFY44tEfhTqbhBnIUgpdXLqYDl8d8RsMmqnbx9O/WNbouDV8JLXETIjErXaKChuInKFB2hA
	==
X-Gm-Gg: AR+sD10cnK+kL9CSF53A5IMdfNrt8+qBvwN6453Bbq074qku7nIBeuNdLkNmK9Hi/hT
	wvU4tDi19YISfITtyI+MD+i6n1g39YXqh9aTLId5xSchfF1z9tQfURVt4ZHvuW62kTRgmvsSgsb
	C1bNTYgX0f5TkNbb8U0JcfEPCG1aiRy+kEH84itI9pxvWF4brd2xERAFaAVS4JU4a3hpM1AMlsY
	dMx8Y2DeKYHycMXCJ3eD4akKWe4V4yowAgwppkAFnkSWDcV5jKKtjSOc8DG82D3rvqhFQ1p3u+x
	xSTbZFkiMOyNCy6VEuUytUempE1VubsRVZhuTaFwOfzHql/eyRn6YEJ9W5e1Bb5TzohsBhf7y18
	ZEdHed1RA5bQXhN9AlVMUtDUh
X-Received: by 2002:a05:622a:1183:b0:51e:aa39:4fbd with SMTP id d75a77b69052e-5296091dd63mr82123271cf.36.1785087832811;
        Sun, 26 Jul 2026 10:43:52 -0700 (PDT)
X-Received: by 2002:a05:622a:1183:b0:51e:aa39:4fbd with SMTP id d75a77b69052e-5296091dd63mr82122931cf.36.1785087832041;
        Sun, 26 Jul 2026 10:43:52 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c63bd3sm41576093f8f.27.2026.07.26.10.43.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 10:43:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 26 Jul 2026 19:43:35 +0200
Subject: [PATCH 2/8] arm64: dts: exynos: Align continued properties and add
 missing blank lines
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260726-b4-dts-coding-style-strict-v1-2-e9e3e9879d05@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=60733;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=WvcezNFpHYyam4klaC1DUWD32AAZVNqYh431NJ+U7h4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqZkdJbYqLLh9RNol3OWwRGrCaDOTpqnZZnSfNQ
 3l9N2S3i5mJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCamZHSQAKCRDBN2bmhouD
 12OwD/sHKitc53TMRn1hoISokzhtpeiAy8ppqwwHeHWzh/Srsl80wdraEdRoT1mxO7mcmCwOD03
 MRyLvWtaARgYWqsKZK4YDPT2tA81N1oHd/QdJNa0NPd4vVOrj2ZOq6FHHbh0INsNDLRuMM74ly+
 tqbPlBs7VP1m4pjUomx6mYvDtY6r4AGaANFHlIL8TQeit3uzHYxOijNdN/1bOPhY1AM+FX+yiOX
 th1v5DglrgqKQkq2LxOWeXyQh7p1oBOSGxzwH33wLV94x6G8UtEnXfQiobd/vPVluL6S/n36wzL
 BUUzlwXsE/TRAZicURYriW7ePf58ndCHo8cGgAWk5ChwJ8DRZXO8GQ2fToPRXiAyQk/b7oOxp0G
 dO3YY9MNF9Z56puhErKooBBaJfDt8iEZOAsQdhgcjACNOIRAELaVK56PWuYYWA6DpiokTkuVksQ
 7QXhMv1UuUcQFm1ajn5r6XT3OuSiJ6p96CDfgVZAqpt4FnZ0OVQXnxbdhpPre6Kna1o3KRoNW6k
 QkzBN8ryFHfS0A+f0j8bTQI0mu5Lwmrcqe4jTE1u5NTakoA6ojxBfxkMx8ir7LC51NNxXAM2zQd
 zc5MyL6vfVsVf/MFTFI5Dg22QaSDh4bxkv2GdlBbAufrZThuxi3Z5KJTr0Pg8DM/jcA4YWh+yG6
 O0BEMf0Bp0DMNGg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI2MDE3OSBTYWx0ZWRfX1bSaZkhlOB+R
 U1V/1XFKU+FP1GIqfIU89UxP9qgdvXqvNDjNgEXpKGrO+uB2F/8+vohSdviWAqh6jBIkuUoMnrE
 aY0sqj84+q++92+ZtimIdmlev+07N2zwQINLJ2UDKLjyPZ8LAHglYX8SB+3GWFFs7pV/hv9MYqE
 Qi1roG1h9uzGVDZYFXW0lX5vRLETDdcYZrEKmQUBjkSQ4e2oNym0xUIhQKg7PjJ/GNLPT47o6V5
 412cH6DGuuZZkvkHL3gvhUJeSYqbFMxg7kwdTz388PvrZ/3JoEGn2jZX5PDGMra7Y/pNhatFUX9
 mDB6GuBpyJuTPf7Bj6Rj3S+uJ5pdcyKbylC9sLG0h259sPGjT8JwfihZQzgJTnHlKeHo/pIIGgJ
 m31AX9lz6pU7SjbFiPrF8I9XuqgcHlA71lpyshmV4Sr04b7ly0a08bZ+opa+F5RBIzRxB+36H+m
 WjmxEHO/FjCfaUUs3AA==
X-Proofpoint-GUID: lq5yi5gFcOOwmdEAsSbcOV7QF5Eu-32D
X-Authority-Analysis: v=2.4 cv=DNG/JSNb c=1 sm=1 tr=0 ts=6a66475a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=_uiF_0qmxUXDy-s3O6wA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI2MDE3OSBTYWx0ZWRfX9V/acbfaADbt
 VZX+kCULNp3vZGOFIan/rOKsa5z97g9+X/KiDTwzMadxkO/ASlTSz0dNptrkAxC82LX5isgL/PH
 kgyvBTeNzfV3hyPOVRnHyWkwTsBWaeo=
X-Proofpoint-ORIG-GUID: lq5yi5gFcOOwmdEAsSbcOV7QF5Eu-32D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-26_05,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607260179

Trivial white-space only changes to adjust to DTS coding style and fix
dt-check-style strict warnings like:

  [required-blank-lines] child node must be preceded by a blank line
  [continuation-alignment] continuation should align to column 39 (under < or ")

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
index 17b13a586973..aa7539d92e8e 100644
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
 
@@ -777,7 +806,7 @@ tmu_g3d: tmu@10070000 {
 			reg = <0x10070000 0x200>;
 			interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cmu_peris CLK_PCLK_TMU1_APBIF>,
-				<&cmu_peris CLK_SCLK_TMU1>;
+				 <&cmu_peris CLK_SCLK_TMU1>;
 			clock-names = "tmu_apbif", "tmu_sclk";
 			#thermal-sensor-cells = <0>;
 
@@ -789,7 +818,7 @@ tmu_apollo: tmu@10078000 {
 			reg = <0x10078000 0x200>;
 			interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cmu_peris CLK_PCLK_TMU1_APBIF>,
-				<&cmu_peris CLK_SCLK_TMU1>;
+				 <&cmu_peris CLK_SCLK_TMU1>;
 			clock-names = "tmu_apbif", "tmu_sclk";
 			#thermal-sensor-cells = <0>;
 
@@ -801,7 +830,7 @@ tmu_isp: tmu@1007c000 {
 			reg = <0x1007c000 0x200>;
 			interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cmu_peris CLK_PCLK_TMU1_APBIF>,
-				<&cmu_peris CLK_SCLK_TMU1>;
+				 <&cmu_peris CLK_SCLK_TMU1>;
 			clock-names = "tmu_apbif", "tmu_sclk";
 			#thermal-sensor-cells = <0>;
 
@@ -813,17 +842,17 @@ timer@101c0000 {
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
@@ -961,21 +990,21 @@ decon: decon@13800000 {
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
@@ -993,6 +1022,7 @@ ports {
 
 				port@0 {
 					reg = <0>;
+
 					decon_to_mic: endpoint {
 						remote-endpoint =
 							<&mic_to_decon>;
@@ -1039,15 +1069,15 @@ dsi: dsi@13900000 {
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
@@ -1060,6 +1090,7 @@ ports {
 
 				port@0 {
 					reg = <0>;
+
 					dsi_to_mic: endpoint {
 						remote-endpoint = <&mic_to_dsi>;
 					};
@@ -1071,7 +1102,7 @@ mic: mic@13930000 {
 			compatible = "samsung,exynos5433-mic";
 			reg = <0x13930000 0x48>;
 			clocks = <&cmu_disp CLK_PCLK_MIC0>,
-				<&cmu_disp CLK_SCLK_RGB_VCLK_TO_MIC0>;
+				 <&cmu_disp CLK_SCLK_RGB_VCLK_TO_MIC0>;
 			clock-names = "pclk_mic0", "sclk_rgb_vclk_to_mic0";
 			power-domains = <&pd_disp>;
 			samsung,disp-syscon = <&syscon_disp>;
@@ -1084,6 +1115,7 @@ ports {
 
 				port@0 {
 					reg = <0>;
+
 					mic_to_decon: endpoint {
 						remote-endpoint =
 							<&decon_to_mic>;
@@ -1092,6 +1124,7 @@ mic_to_decon: endpoint {
 
 				port@1 {
 					reg = <1>;
+
 					mic_to_dsi: endpoint {
 						remote-endpoint = <&dsi_to_mic>;
 					};
@@ -1104,19 +1137,19 @@ hdmi: hdmi@13970000 {
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
@@ -1220,30 +1253,37 @@ opp-160000000 {
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
@@ -1438,7 +1478,7 @@ serial_0: serial@14c10000 {
 			reg = <0x14c10000 0x100>;
 			interrupts = <GIC_SPI 421 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cmu_peric CLK_PCLK_UART0>,
-				<&cmu_peric CLK_SCLK_UART0>;
+				 <&cmu_peric CLK_SCLK_UART0>;
 			clock-names = "uart", "clk_uart_baud0";
 			pinctrl-names = "default";
 			pinctrl-0 = <&uart0_bus>;
@@ -1451,7 +1491,7 @@ serial_1: serial@14c20000 {
 			reg = <0x14c20000 0x100>;
 			interrupts = <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cmu_peric CLK_PCLK_UART1>,
-				<&cmu_peric CLK_SCLK_UART1>;
+				 <&cmu_peric CLK_SCLK_UART1>;
 			clock-names = "uart", "clk_uart_baud0";
 			pinctrl-names = "default";
 			pinctrl-0 = <&uart1_bus>;
@@ -1464,7 +1504,7 @@ serial_2: serial@14c30000 {
 			reg = <0x14c30000 0x100>;
 			interrupts = <GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cmu_peric CLK_PCLK_UART2>,
-				<&cmu_peric CLK_SCLK_UART2>;
+				 <&cmu_peric CLK_SCLK_UART2>;
 			clock-names = "uart", "clk_uart_baud0";
 			pinctrl-names = "default";
 			pinctrl-0 = <&uart2_bus>;
@@ -1481,8 +1521,8 @@ spi_0: spi@14d20000 {
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
@@ -1502,8 +1542,8 @@ spi_1: spi@14d30000 {
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
@@ -1523,8 +1563,8 @@ spi_2: spi@14d40000 {
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
@@ -1544,8 +1584,8 @@ spi_3: spi@14d50000 {
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
@@ -1565,8 +1605,8 @@ spi_4: spi@14d00000 {
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
@@ -1803,9 +1843,9 @@ hsi2c_11: i2c@14df0000 {
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
@@ -1816,8 +1856,8 @@ usbdrd30: usb@15400000 {
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
@@ -1830,11 +1870,10 @@ usbdrd30_phy: phy@15500000 {
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
 
@@ -1845,11 +1884,10 @@ usbhost30_phy: phy@15580000 {
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
 
@@ -1859,9 +1897,9 @@ usbhost30_phy: phy@15580000 {
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
@@ -1872,8 +1910,8 @@ usbhost30: usb@15a00000 {
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
@@ -1890,7 +1928,7 @@ mshc_0: mmc@15540000 {
 			#size-cells = <0>;
 			reg = <0x15540000 0x2000>;
 			clocks = <&cmu_fsys CLK_ACLK_MMC0>,
-				<&cmu_fsys CLK_SCLK_MMC0>;
+				 <&cmu_fsys CLK_SCLK_MMC0>;
 			clock-names = "biu", "ciu";
 			fifo-depth = <0x40>;
 
@@ -1905,7 +1943,7 @@ mshc_1: mmc@15550000 {
 			#size-cells = <0>;
 			reg = <0x15550000 0x2000>;
 			clocks = <&cmu_fsys CLK_ACLK_MMC1>,
-				<&cmu_fsys CLK_SCLK_MMC1>;
+				 <&cmu_fsys CLK_SCLK_MMC1>;
 			clock-names = "biu", "ciu";
 			fifo-depth = <0x40>;
 
@@ -1920,7 +1958,7 @@ mshc_2: mmc@15560000 {
 			#size-cells = <0>;
 			reg = <0x15560000 0x2000>;
 			clocks = <&cmu_fsys CLK_ACLK_MMC2>,
-				<&cmu_fsys CLK_SCLK_MMC2>;
+				 <&cmu_fsys CLK_SCLK_MMC2>;
 			clock-names = "biu", "ciu";
 			fifo-depth = <0x40>;
 
@@ -1975,8 +2013,8 @@ i2s0: i2s@11440000 {
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
@@ -1992,7 +2030,7 @@ serial_3: serial@11460000 {
 				reg = <0x11460000 0x100>;
 				interrupts = <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&cmu_aud CLK_PCLK_AUD_UART>,
-					<&cmu_aud CLK_SCLK_AUD_UART>;
+					 <&cmu_aud CLK_SCLK_AUD_UART>;
 				clock-names = "uart", "clk_uart_baud0";
 				pinctrl-names = "default";
 				pinctrl-0 = <&uart_aud_bus>;
@@ -2038,14 +2076,10 @@ pcie: pcie@15700000 {
 
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

