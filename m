Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC173783DB
	for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Mar 2026 09:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772701784; cv=none; b=Mk+ow8tSwEPRXSiltnuTKRemKtmmm7i8Kze2TypjaL1gwViuz/1Vs6c3p9U6Md+XL+L2KojHsAt0q6Fd76ta9mxXplBDiC5366ScLhcYO6w10zxgE8J7+VoXRwR6vE0UWOestohswUOG1qbWMsKN+dLt6HKdewnIa6JBCqQWkIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772701784; c=relaxed/simple;
	bh=DfajksrGcjq0LJQysaqze8aovqdA8pPK47mtqHPAEV4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NOz0fzCeKGKNoNxZRXuGQfFr+ClbhIJE/IKaJ5vqk5x9hrahb+PLbPoMCAHr8Vjc56uDkkZ9wYbPEVFvkEQurQanAwH0WLmNjCQWJTjFxv9JdKs/4iKUBNO6Rz93UW3T9fNwmFQl5fUR1Z1KFynUbYIFcdeLyksMS7sAsVnM+E4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jt6+k1nl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VKgM334I; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jt6+k1nl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VKgM334I"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6258rtuL1193205
	for <linux-samsung-soc@vger.kernel.org>; Thu, 5 Mar 2026 09:09:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2XLSH/VllHO4/R5amWSzTjK20IvQyA+qXLE5tuqFPiw=; b=Jt6+k1nlOOCkT+aA
	vlK34BXw/2VI9u8uJ32hfWIlqSIWGWpp3rMq+6O45XQEikP2gXqqYmpgSAhQrOTY
	rB0VixPAvhB+wbbAuQkjoMdwkUTcA55oOnStW9mrwFc4XjrCNoIHvmtDTzeBsFTA
	gn5tNVolmdYZQ51PqI2mfM/mspcMY9GgrpFrseetjRhjlsnhD4hlagimuav/ghcK
	l+VL005+JlKzJBUXDxtew6FGb5f9z0zkuWJh5eDN64CYw5zc5QrG25XP/KzW7cRW
	xqUQB1jEVmZZSZDG5lAZqnjbqSD8IMlEpIzyvHEPHu4juaxMib2JByRr6+YgAUCR
	u54kdA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpqwgauuy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Mar 2026 09:09:40 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb390a0c4eso4944137585a.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Mar 2026 01:09:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772701780; x=1773306580; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2XLSH/VllHO4/R5amWSzTjK20IvQyA+qXLE5tuqFPiw=;
        b=VKgM334I99nIEYJ7ccmHTbieOkycC4HVjHsbPPvGiBkHjFn6TdwGunHJ5PudLkpkxD
         juDLJ1Hr8REN0p/k3YFbnVg1cX3qFd1R4c6Gf8wOrXMndTP3tl8OhFeWZRk+lHQs68jX
         itNdMef8UH1wMYakWX8StZjX20loxIA7aJojo85iKb+HDyIeS45cJYk817z7FoW/f3/i
         Ptb7C2M6LXkPx67Zn3GR6r9K9LQUpxLMLA5v+7zUS6bT28I3jYALYz4vmKcTApUzZ5Lc
         J1j0lu+y6wGyoo3sfbfYHzzmKDuuSj/5A4qbTLOpQ5zEZbiQ/4OohnyTBfX7oH+WehfX
         +J+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772701780; x=1773306580;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2XLSH/VllHO4/R5amWSzTjK20IvQyA+qXLE5tuqFPiw=;
        b=RbMpyz3k76fSg1QpIjni33F4K8NNr8OlHXq5gbLaGRDsOcJLaiqTCEzpwqkJsQmagG
         QJ86Oli08t/exiwsogvMn6xSAcd0bLFhJn8ANUy0/v6OlDPxhDljlNEodT2jaCJ2zasM
         /Z8pryojf48Ytj3LqPvvYkm3xI8J+iO9mhfx6Jv9v0WyNR48aDLaGnl0QwvYvbbJU+Vm
         4si4Sa4mnglrvFzAuRxArBcvZ4z+KnXVHYBR6bnmNO8WFLwjR4+UevO6Z7U7zJPBtf9H
         SjauMZr/k2pQ2UrB/tiolxmLu5OptkCnv+69akXYpJWuK/JulYfYP9MTwJbyXw7YLZ3z
         lfiA==
X-Forwarded-Encrypted: i=1; AJvYcCXEt5EGT6vcc3eXv1KhK1W/QwgotPEavZETRfeFhigjOFInDN1i2BWQLsG+TTXIip+B9bAGGZrfM9JuHMCqUxGthw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzuE8Fd30rHKIQqTS/FDK4Yd7qOwOtgzw4RqaS+chxAJSN4vQ7R
	6nDBRF6VExLdyOPEdHX4eL8rH53RggQlcTjjxEDIWe3SLQQfgGXIgNRhZtWxeAB6ubraT+zRjqJ
	uwDbSWHn80+LplNAhzLSKU/oRBZfYsg/SzdT1oJV5RWFZxI3qclqyDBuaty7wkpNoFG2GHLM1OQ
	==
X-Gm-Gg: ATEYQzziq3gh8bZIcN2BsfUY1MQE40zTq99qwxLzdVtD+Aw4yEeQdJYRjt20GkyJ2nv
	JaW7SSfOwNUZO7JEBUWbg6I3eN+rgP+WM2wHtKI1MUgs60wPBUkFOnit3Vfkmvmyxj0z+aRQzhO
	/fOf/VM3JAcht2DFW7ZNhAJ0rUD03yn6D9wwBvMGxVnFOHMlhCpGD5VDKyQ3YJaxvThzDHK9L+T
	fzbLp+0ZwIrZCgP7cKJC+n2MZCsnGPy2vs5IgJbHE9XHBClRdyuWQs1Mk2HwOMLY4bMT296cu2k
	my3DUM2VdxftrRpEIkdUPjR9tgdvsfuWulropFXZb08IB7LWe6X/T73CqwddexUiG0CFgLOkmSu
	6k3EcP83Sw5Vnd/gzDOgjiXq7mVRBmXcp/BVS48igT3wb
X-Received: by 2002:a05:620a:29d1:b0:8cb:72b2:2a15 with SMTP id af79cd13be357-8cd5af12a64mr580767585a.33.1772701780102;
        Thu, 05 Mar 2026 01:09:40 -0800 (PST)
X-Received: by 2002:a05:620a:29d1:b0:8cb:72b2:2a15 with SMTP id af79cd13be357-8cd5af12a64mr580765785a.33.1772701779738;
        Thu, 05 Mar 2026 01:09:39 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439abded86esm38817703f8f.6.2026.03.05.01.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 01:09:38 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 05 Mar 2026 10:09:28 +0100
Subject: [PATCH 5/5] ARM: dts: exyons4412: Drop duplicated I2C
 address/size-cells
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-dts-exynos-i2c-v1-5-2c8d3df3b9ca@oss.qualcomm.com>
References: <20260305-dts-exynos-i2c-v1-0-2c8d3df3b9ca@oss.qualcomm.com>
In-Reply-To: <20260305-dts-exynos-i2c-v1-0-2c8d3df3b9ca@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1333;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=DfajksrGcjq0LJQysaqze8aovqdA8pPK47mtqHPAEV4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpqUhJh2kpc2NzBYOMDl24QA5vGv92yqs0YU6wE
 IYIhpS/JxqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaalISQAKCRDBN2bmhouD
 16KKD/sEuHd8hbKj7Ipv6E2ThTTgkiR3ia29G7i6Dw4oQuwwYcaNmp9MuHXCCuJUPH5uFn8fpJu
 IWOvDXHAIsp/YS7G2owceGOyVDq1CvKjVIwuLs+bsXqSOZkQ3YoGnDT8U1GMbz4tBv2FwqOxNIc
 l9uitb330z5LkXufy4MTwCXKOXjF8Me1jrtiIARV1VTHPD2jp7Q8OfP8LbCd7G619RDzO0oEY30
 esA6sw6lwX+qCeVisgThBDUMJ/+3gQzdsfROcZC49HACCGEH4bdTOGQ04gyPKV0LhZV2ZYuGYEV
 n3NJYVdxtwVpYD/zccnR08IpYpXjnYhnexAYc6qgYBWXLPuP1501emnLLs0rS+E35KhY/kQVZ0v
 jxBpnuSZTaxauO6DZ/abHcYD8yqMsPZts2mTUuJe7xUkDOgpDldfd3yi1mPyXx7XwOEp1NEHWrG
 7H8vDheA1N6jpfx3MSTFq8c0539sDZAfhHR3mIhH37H5FwKPXHvUbbcxr4NQB125iovDR9aiHc5
 B/XQ2FXFWh0+tUCnACuvHPpkgReDfIhuL3fsl3u+Rt33ch+2utkK51XJrKjt3zyjrkX/jN1/J0c
 v4xD4uJpMhgCBQhVjCFW6Y/jHLIEK2GzV2vbrX1TNAMph19paAsBSh/fXO5j1cKjrJJwAhE8hp5
 V6OO2rqUzvg9sVQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=bdlmkePB c=1 sm=1 tr=0 ts=69a94854 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=os_Ci-yCVAlAVq4Xw6AA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: PnRnGMANdji98s4pg-b_uijxnxS1cyct
X-Proofpoint-ORIG-GUID: PnRnGMANdji98s4pg-b_uijxnxS1cyct
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA3MiBTYWx0ZWRfX0uiTcn3wArFb
 70CKDSXwiT+wYmqjOb1KGKG20q0pf96DKfdvpEk2u8JN/5uA3SuJw1l3oCaEOLCEoBrb0NkBknR
 wnXfL+F4Gy+8wKEHuOd7KoD8p2+EG731Bk1RkVxWThkJeg9rV0W+XOuSPAB86Gi9P6va3hUCmtz
 SIKPRbuEXyXgbl6vsgMS0M72pIrnrh/Slc4LrY6m4+TCy1LaIpdAEu8dqugDqsZqbo7EYRf09tM
 st4d8ldxXpawJrDMr5reywWmq6jRXkhBrc2BKALXivRQYBiUb9mqg2UwZPrLjvZQhPB4PxVY4JY
 nRopeqZ0WgYEghpdDNq9E7l9feVJxxboXGGVrUiJsd6+JSI6PykdbB/8UgoPx2P7atp3ff9wuWu
 tt2QX8UrNO0Ul0jQ7ZfWNuQhlGhe97+BPFkzkiQs5Y1GsZX6OUwlgg5uigHl570mKIt7S562po9
 9qOY8oldwf6XDnwVZdQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050072

The DTSI already has address/size-cells for each I2C controller, thus
the board does not have to define them again.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm/boot/dts/samsung/exynos4412-itop-scp-core.dtsi | 2 --
 arch/arm/boot/dts/samsung/exynos4412-origen.dts         | 2 --
 2 files changed, 4 deletions(-)

diff --git a/arch/arm/boot/dts/samsung/exynos4412-itop-scp-core.dtsi b/arch/arm/boot/dts/samsung/exynos4412-itop-scp-core.dtsi
index 7bc6968af9c3..223907e5919c 100644
--- a/arch/arm/boot/dts/samsung/exynos4412-itop-scp-core.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos4412-itop-scp-core.dtsi
@@ -130,8 +130,6 @@ &hsotg {
 };
 
 &i2c_1 {
-	#address-cells = <1>;
-	#size-cells = <0>;
 	samsung,i2c-sda-delay = <100>;
 	samsung,i2c-max-bus-freq = <400000>;
 	pinctrl-0 = <&i2c1_bus>;
diff --git a/arch/arm/boot/dts/samsung/exynos4412-origen.dts b/arch/arm/boot/dts/samsung/exynos4412-origen.dts
index 10ab7bc90f50..c5fb551ab352 100644
--- a/arch/arm/boot/dts/samsung/exynos4412-origen.dts
+++ b/arch/arm/boot/dts/samsung/exynos4412-origen.dts
@@ -113,8 +113,6 @@ &fimd {
 };
 
 &i2c_0 {
-	#address-cells = <1>;
-	#size-cells = <0>;
 	samsung,i2c-sda-delay = <100>;
 	samsung,i2c-max-bus-freq = <20000>;
 	pinctrl-0 = <&i2c0_bus>;

-- 
2.51.0

