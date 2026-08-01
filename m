Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD54639A7F4
	for <linux-samsung-soc@vger.kernel.org>; Sat,  1 Aug 2026 15:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785596848; cv=none; b=RnV7RE/RAn6BBBVJILGW4i0V8ieUF2D5S1PFgXZhYM4+aeWauqy1EGINfmOKyhWAE+TH8BDlr0b7sSQWjus6i2gNxOOXAn4MwXiouS0vhz6618Hm20TEljzfbMrQWu082iPDOuKKQgspElvJmrJLL9sl3YsM3yqpKIHbDLdWzZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785596848; c=relaxed/simple;
	bh=tvFHESM367aZbumd1u+4624Oo3B8rwZfoF4ToBWH/7k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DzYOwrfNjfdQxBbPNG/BCe1QKnzZBnKRCdxYV9HfHNV1n1qszav88rvjm789dAkWJYkNweMtjIjrb2cyqcXjsN7+7fPAeV3vUehR5l4IOdhy7gStkZxaDmYBw+VdWzeeMw3wKFuxW+bqR911QqpSKkc02X/gbgkJiSCCn8K/Kmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Csonw4ew; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RyEeaxFc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Csonw4ew";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RyEeaxFc"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 671Cb5Um2395078
	for <linux-samsung-soc@vger.kernel.org>; Sat, 1 Aug 2026 15:07:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mCYheONZeVyUux6sPE93G9D6e8BL29KvG8pWZH8cW3M=; b=Csonw4ewY/uJFqWj
	8F2diPNbi83FrFu1TestrQXTznkVKcoJzo5uWbP7NVQK22JvXM1np3eAsL1NT3Il
	63ca5Vobut4E/2/4EM7yK6z3jpR9oZmIHwkuOyvTX2rf6d8ea31Onj0p5qxgVv08
	DPWhSbpffdBX7k02P/XjUhBBCuRlAzDfvoQlwVuqLwXT8n04dEq7+w29HmxvPJbV
	Z2drdPcjX4/K0YW6JGjnkM9FfTH38ttdMOSRv5kCkC2XGDi5Prbwq05rpxCsBnQQ
	8Ftm+fEVxJ96JCeoInklO8qxmG0fe5UNNKaMsvu/PSPe3PzYJ5MXUJfw1UlTgvA/
	w2AVoQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs9yggxpk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Sat, 01 Aug 2026 15:07:26 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1d7886cdso36847251cf.1
        for <linux-samsung-soc@vger.kernel.org>; Sat, 01 Aug 2026 08:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785596845; x=1786201645; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mCYheONZeVyUux6sPE93G9D6e8BL29KvG8pWZH8cW3M=;
        b=RyEeaxFcx6V1wnZ87uXjdI/QF2hfNNzEVW81B4u0OX6zAZj+6jjCS1TI2kov6eKiCC
         WafL2hvBnepLIcafcD+8RJUl2wkAKyqGX+lSjtwfCq3oNVSEipucbzOp0WeGhbkgkia8
         eHOZPaQMrG7oWTMummU2E4FRJLnlZJOi4Z6WWygvk2g6Z14/2U7GgTAEnYLNps0cihW6
         xVT4VSEpwjZT3kg5QUgXVv+3edyMZbzHM9gandFMDBiDBQNTGfAmxnexUgOEcIHnpC0G
         8vfXUpwxTIyE/ljA1QdRUQI5wdT0Hcm2t6cvNM2D8bx3tjOVWw0gQiqjfYcHhjL1o9kK
         vA9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785596845; x=1786201645;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mCYheONZeVyUux6sPE93G9D6e8BL29KvG8pWZH8cW3M=;
        b=TcuDYB7rxriRda+2ZTYAh28cEzKUMAijBR3yBjHw7AM9dwmN8lEj2Dt2IppNGdABeI
         lKi4g4IuNxS/zN7+lylcsxR8vjFq+HGKsZrD9acWY3c8K+4wtMeKP8vjEZ4awLOe0hkg
         yH8VhM8PaB9CSFq3LI6vbiH9nQHV8jPL1gnr5c5qZYMxkIrZ0OCL8v4Lk8Vi687tMQbz
         HxKB1QCr5ABmkwf+LaLtPCer+YOVVQYxRlVyJnNBaOHwA80Mtyh9FTwA5RG04iqgIoR3
         KOpQKh4wbpTOpIdYWb4XlFjqWFbmYw+m89+I3WKVC74v89n5YBoeXblge9YmkOVPK5Cj
         9/Ng==
X-Forwarded-Encrypted: i=1; AHgh+Rq+yWl1ZFcCS0HuynuEROXnBVL0TQEvDvLMkM1TDt972i5KMkXI4JsEqjks9Ambeia475bVsi+URLQMuF4jpBUIQQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyocgR/MVy6YrzYufiNswVPXNP0zYKDs2AIwcGLxz/Gl3fSZMfY
	wCiQ+Q6dYN7ST8DbatGzEMmHfaQaWrM5cmQ6AaGT0cY/CmFYkAwys+mFTHNshPdHWkxQmrwW2ns
	Dqy6xnSFb2VbqczrYlI0hBABde1dcQ1eqNpJDm+r7ORwOh49vRH6Zl8C8VAL634e/yCD19bU7sA
	==
X-Gm-Gg: AR+sD10iSrMVheFdEXGznHPASG1Z8S729V4j2yrCueUWOjn9KMgiuNd7sX9bb+03Ux+
	IOeEyZq5oss3eEnTdX86itPtowfy0sotcdUEzqH9ASM32Uzpen8fbpH3hFUBsxjlNJxg+he5gur
	PiTkJLRMTH8NgBPaeJqmYWcGfUd7g4fHnHGxNfly5mcyKuyiU2q1ZsMa/OBn11f1fsEGvxvs7CC
	bzi5KVo0/WD+v46yL++13hXocloZaC+jWIbydJPnNSWWsR0nYNf55LuRwCvSqFurtlB0xQgwD8h
	3W7an232uShcO3jC3yotO8DD1IABtfgheNIvxlCVCzH/WBBjTdIbAM1TkU/3d7LA36m8gyW2/Dd
	f8uC7fgrmNmVRV8Z3fCxwp3Om
X-Received: by 2002:a05:622a:5585:b0:517:58f6:29c3 with SMTP id d75a77b69052e-52b56791b19mr90549361cf.32.1785596845178;
        Sat, 01 Aug 2026 08:07:25 -0700 (PDT)
X-Received: by 2002:a05:622a:5585:b0:517:58f6:29c3 with SMTP id d75a77b69052e-52b56791b19mr90548671cf.32.1785596844783;
        Sat, 01 Aug 2026 08:07:24 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd45a1abfsm16005222f8f.37.2026.08.01.08.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 08:07:23 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sat, 01 Aug 2026 17:07:01 +0200
Subject: [PATCH v2 6/8] arm64: dts: google: Align continued properties and
 add missing blank lines
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260801-b4-dts-coding-style-strict-v2-6-f09a659ab80d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1916;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=tvFHESM367aZbumd1u+4624Oo3B8rwZfoF4ToBWH/7k=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqbguaDdezS54sRaZP1iIZJSPoM+6OvHd7DGHhj
 0S3Y+q8P6uJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCam4LmgAKCRDBN2bmhouD
 11IsD/wPwLlkbos5Ms6qZ+lSZdATPFCZrjyXfx8e72rwLVy0Q8l7tmB979Q8mvzSNLu7YJNzKtI
 29tG5bzpYE8CL+IIDpXkUKWZrV7Rk8czYpkPTxGmQplMqhJxR77kivbWYE+Xsvtl6ETth20hb+9
 60GVI6yVYRjIPBosX5GZGY3oAHAND1mKZNVVVrUo0WT/a9n0zLsDRXXcL/dI7uML6cm6fP2Ek2N
 qNVvEesJZBOV3UgxGryVtmf3+OVio7Ro67H4N6fwu8y9Zqcgan2azQIevUR10NcBVuLCChOTFGs
 goISA080JIsiif9cJtzrNZue572TtAw0fZQA2ufPEEpf5vHyOG1uPGqfZ1njLL/PrACU8+GON0K
 mQXrdzjpJimgnqXCBzfxUQqsDVY/wStPIx1O3TIBoeMUPUvt//iWFaXsF7LKYKhKijHfB9G+3wd
 Of3QeheLlldOKNY5fA6ZlJdBV5wMEprAa2bw9GEJi8E0U/u2NyUA8OxToWLXpwNhdEcrQAXrLWB
 prZvMCEQLCjWOWMTj5WlENRhIjG6lV41UxDWp+8JW3IELFfPOaRJQuB7e5eUaRGvA7YzblBlSjp
 mpE/atyKlYOaggQuJZ7vOeX1JLLcE+PvdfbVwR2K6mRiQ/CyHXeAhVkCRRjHgxAKOoM2zHZE8xz
 eZ9d1O3gh1+JNDQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDEyMiBTYWx0ZWRfX3WTFJArO2WHs
 /AOOktI6zjgG6zmiUxTW77qsftrL3eC4w+YS9A31s6bDe2YrJOdRk1jjO0dWLhw0/AM3sfEWVrp
 fJpgEHFo9mwyKyS20BLTO7QLs1k7tkk=
X-Proofpoint-GUID: V0fDuDYqZU_eNKYY3CMjhrjQFTeGTO67
X-Authority-Analysis: v=2.4 cv=Gu5yPE1C c=1 sm=1 tr=0 ts=6a6e0bae cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=JN4siRDuy4uOFAZNwAMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: V0fDuDYqZU_eNKYY3CMjhrjQFTeGTO67
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDEyMiBTYWx0ZWRfX1ZSkNJVxqUeO
 Pg4si1ZodlTAkPJxOAyBtz8g7zFymp5wkiqk7csMy9u4MZBQEjFecQLY/kY6HdRcZ8ldpJhOsfL
 o6rXydQkls3Kpu3QzSiF2e/smXP2T7THaVWZTtWgOaNlka9jpB8whbOyIcpu+Ll8xBQ3cCULQGM
 /+yNn7sq8CthTNhUJeFF0TIsAXpF1P66spTgwMgu1LTAYFVfW1CVleC06M29v/NgWQPVfhjfdgG
 jt6DCnBPP9qRouM/GfQFBNzI9DRDMTHfVxFas1aWLH52PsDj0WVSU5q3Wx2ID27Prqi0Z1fSXtx
 dvgW/eExFTon9fDOIStJaqgZ/ufrt1gQg7uqdAJfoZiVT4Dg/mQoXks2/oDz3Zq7XGbWozBEfIg
 CUEjkQ1mK+PM5xAfYaUf/oD91NJHIxNAjgVtCAy9igLYShYZP4UFlR1PgLJpYkgBG59k3VAPIHf
 H0oHuzCKIpqDI5hD9VQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-01_01,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 malwarescore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608010122

Trivial white-space only changes to adjust to DTS coding style and fix
dt-check-style strict warnings like:

  [required-blank-lines] child node must be preceded by a blank line
  [continuation-alignment] continuation should align to column 39 (under < or ")

Reviewed-by: André Draszik <andre.draszik@linaro.org>
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

