Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E9A39A4DF
	for <linux-samsung-soc@vger.kernel.org>; Sat,  1 Aug 2026 15:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785596841; cv=none; b=rE4fYZJCtMzttZFklvbyWIm27FEfqRjbUfPhmgjdCcmIv+6IqsbO+J7Q/DjV3/JQXRxvCocw1egyrJl9BgxABhqI3JYwBNmr9XFrJHPV5Y5ns/siV8K+yYC6kL/S3gHs19xBhmFFiH0cAOL2uanVJnKkCQUxI/5HITnnkVG5mtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785596841; c=relaxed/simple;
	bh=fJiKAJBCPPlI9UZOKJ5ojp+QO0sRrADx0Cv1xw/PsMU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KTbHAVU7zlUGsfWq/NlIy7dxdaS5g8lOnXl8cBuxjG+CVtwPTIX3OzteLKkZm9Iq3kttEB75yJw+hxk565ku8sEfAieNzfzl1X4I7q2yj7xDVKhHl/jW3jXdGiAeyodzAsr+6clgoWocJdilXhJikVU32uVkSEF65hAcOSiQFus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W/27Q2JJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VIZ8lCq3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W/27Q2JJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VIZ8lCq3"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 671CadEU2815397
	for <linux-samsung-soc@vger.kernel.org>; Sat, 1 Aug 2026 15:07:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r1RU8FAh+O/KkJCPmZApbQw1muC8TBWf9MfayplznT8=; b=W/27Q2JJZuefDriN
	PVFshZVngQRXVRKfcxo0g8iwOmM3AR4qWJ88Pl4U96cOR6B5vo1pqxiP2wW7ZkEM
	Bk+vnAyK34GpkMGokQLablxeLVFZNpVjqQvLolnv71JXKSRiNu38r6cNfHYT+sqg
	fOg5SjVDjTOzWCplEBzYoD/bGEV9ciwq3/Z8cDg+rbI7o+/GhOEOi+jpoy5Jv24f
	Rhs70stz2tgd37/c1gWlHeX+R73SOANfBeBK1vxVd4z9DK/LJ/YBjUKhiKt/Zu/X
	7RxNTSVnZlode7vwTpfsVNtEb8AwUrFhFTYNYgJwgTVL/FhTqyHfii5vAGaETyqn
	Oi+5Zw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs9jfs0gx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Sat, 01 Aug 2026 15:07:19 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51ebdfceddcso21373221cf.3
        for <linux-samsung-soc@vger.kernel.org>; Sat, 01 Aug 2026 08:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785596838; x=1786201638; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r1RU8FAh+O/KkJCPmZApbQw1muC8TBWf9MfayplznT8=;
        b=VIZ8lCq38k/v9LtJlgnxy4maxsIBSOXqXRDhxJxV65uYD+kQEyLVJd738HVGO4oFYP
         l5q38/Bb5lnbeon7rGjy38iphqPjf7yYM3vklkgqQRXl+4rJAiAeKK6wd4Jw7uenvTxU
         4J2s9J0eKYAUcJA58vAUZE73iWnV0VcV9HDCPutbzU+ogiRlshOi6WG5BkU0qr7cDXPx
         +MWwFSZticv8vgiwu3fjzXPpK6ZNBCs1d/kkVLogGoyL3C9t2ZHQ9zIql7/gE17xFL72
         kpLK/XPpG9a6M5KJ6xQu+0QnKpjHl5+wdpzhTyXGIi7TKu1w1dpv4XeymFNoeIf3HT5n
         BynA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785596838; x=1786201638;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r1RU8FAh+O/KkJCPmZApbQw1muC8TBWf9MfayplznT8=;
        b=VaKfFIJL5Gum+t8aLepKb0aBYo3kr6fSDUUyCW6f1CHCzxt64MCN2eZtfNDDHCoG5r
         baVlcSodmq+oGj1uT4l7deZYELl/6H6tnmwr0iJqpE9azE2JpIUgLWJMXL4NEyDfPhD5
         fWCZ9EHxrPCTFf761cCgRUt2vEcwY5QaswRSdXFP+TZCgWCy7OgO/7TEMcyLzoTo2dbs
         FWo/HCd+I1QE5b5McXdQICl950+Zc8Y/pnp66ry26mbzyazxFyhoZjkiEVpk5NVt0umy
         XVXp8iNmewhzIs2NuLXoydnFt6TMqNNf+2xQYwjz9ZKl1M+ltFQ58kebcbtI83BlV9sQ
         2+Qg==
X-Forwarded-Encrypted: i=1; AHgh+RpCclC/yiPomsr5iRbEo0/l0SLiGmixbqdxb0hgCzWNsRnlkGt2beLAU2AyYSWAwuKeyVJ8LIxewtXBpVYANuAU7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1oCq4lZbOWc0gYRB+dw8gIutikSDzr3mZmSgR9H8NgPIh4964
	b/E+UhtW0bJUKjbxB7Z4mpYtJZyvsRxdLagNozIO0a2OTXIfr+PzQbVD6Y7oqWFSR1wqLNuajP1
	3oThyInNhu/2u+kGa2RTRsA4usUNp6/1ZbI1/E4y07GWIOgv3C/DhwckJUt86MPiBCDNoadvAlQ
	==
X-Gm-Gg: AR+sD12RV8r3rOT9hBltAWE8ImJV5gP6OHz97LzbZ/05+643iaRXOMZRrtOeO//5QvB
	+QhRg4z9GxH+Yz2qptWgNk74n4RB31d9NP2y2zipSkyxDFJms2tCsLvvGoZhSa9c/5+JNAk/uIQ
	Y3i7yPh5FQ5v+DqmMw0d7Ew63RPrZ7pwNlJ7nQ1O8NkKPNIuYqlbW2XwON4ycxZbV6QFZuQQPJN
	ti8eowXeacQyzZZP7/ovQcOkGSCtsUjWrL0htibE+K136IAKDVnJeVwsiEkuqSaoLXjS/mr/Hu/
	S+XNbRp5EhM24geLA60Dgx1H5KLmiZhjk4lXNdFwGLQSioOxr6DLLW4JPjaAz1lEZ79KJczFvlT
	Kr8ealnzGCNfnbvcGPRk9gsgE
X-Received: by 2002:ac8:58c5:0:b0:51b:fd82:22e0 with SMTP id d75a77b69052e-52b5669dfcdmr78587911cf.3.1785596838098;
        Sat, 01 Aug 2026 08:07:18 -0700 (PDT)
X-Received: by 2002:ac8:58c5:0:b0:51b:fd82:22e0 with SMTP id d75a77b69052e-52b5669dfcdmr78586641cf.3.1785596837600;
        Sat, 01 Aug 2026 08:07:17 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd45a1abfsm16005222f8f.37.2026.08.01.08.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 08:07:16 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sat, 01 Aug 2026 17:06:58 +0200
Subject: [PATCH v2 3/8] arm64: dts: exynos5433: Override thermal zones by
 phandle
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260801-b4-dts-coding-style-strict-v2-3-f09a659ab80d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1492;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=fJiKAJBCPPlI9UZOKJ5ojp+QO0sRrADx0Cv1xw/PsMU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqbguXFoJDPX2kkuBG7S31hBmRZ02B8Np0kJXs9
 qHpMHwPgUqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCam4LlwAKCRDBN2bmhouD
 1+OTD/9ajMyNThGC6tmXV84qNauvqQSk3UpfCUgnQ+peYuDyIDltmNnbuL+E6KrvkBum7303mOX
 l4uVy73MdU1iUErojVTcESf9B+dLsobnar7aSmSwBKoI7KK82/XsOh8gJEjT3AV1qsy5HQOF9gv
 Cacer0g2Sq9YXGs/aamSdCC0KppIwikWuJBPEDYlrKiFUtzIsxEEPAgIN0FTv0rC/Blemd6Bqhj
 MCQ1G7/WP3gmPYultx3ebVX8vziIM4kf/SPUsyHNTKhx+Wr9qpjLYbDGCpd5ZiRRkwqTIKF+2mk
 Bu3iM4wE0XWnI836uRcMdZKLh7VQ/hEavOf3Qoq7YlvTO9WwBAdJ+1KqK218BiDnCsm4ZdjbYVH
 OSwKOLp4SaIggID5L7lUbvKaAydJb1gWN00msAAzaKhKLYjNabPdGCG5+aD3acON1ny25kZizMN
 pvJjFb3rigWiZHxEiHmlPWh+gztdcv53WibZPoqMAtyAbQYI039l7+j8HHqFWlD2e0XukoXwz7u
 2ew8UEcuFJoGqXs8BXYHPowj7FmUQmjVzIuLCCb8UsTJ7IjTO/KwDbwi9I6frFYT0OqWjV2C+1t
 Bp4JaaUgFGB3QwQvnFd4U/4mSvJ3uAwyjmV1T5SgyNXfdUGn2OAz0uBACxrwlpLNTlZN3yKzjcb
 SFKmflWDLe0lnlA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: aUeHHZqWImYMYCORxWQ_EUmXDxjFAlO1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDEyMiBTYWx0ZWRfXxaBRgKAHOxHX
 5DB9/7ZvhylaOalhmQ1MtnlM/JRpiFBzSEQyTSgWThOQQt9M4DvhvektPN8QKJHnOV+NFTaGHHU
 aGXX8yVB2WRuHIbbGzvOdz9++ef9dSTIg8xtgNkZ/ZUYknhHOCxgt5ZaXyM7Yf0QLJUQ6Fbo+H0
 QINtIETe5LLI4gt0PRtVw+sNkLRlER2fpcB1QhajhRph4g6qPsjgcJzbYL8+AKWiZE+RlyF4ngZ
 LkUhOqHx+lDbzva6cJ8FBdXqbcNzEO9TAwFgcJL0S/yrjvQrZm5lnCkrmru/VCAzJY+Kk6PxYiN
 px1N3OoyrqjyKcgRfVH9Nzf1c5I/qpjBSwlGA9D/vPMCVP2nzwYhsPL2PCEieU0pj1eEvpvN3KN
 Hl3xDeTm9659ftRolRsAm5/Y2nAwRfko7Xprc829/FhMY+WMCHLIy2gIyzt6QT+WL6VHLjZ6a5E
 jwcctbFomn3StsUQsKA==
X-Authority-Analysis: v=2.4 cv=TYSmcxQh c=1 sm=1 tr=0 ts=6a6e0ba7 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=51BPPbBw82Ww1msbaCIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: aUeHHZqWImYMYCORxWQ_EUmXDxjFAlO1
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDEyMiBTYWx0ZWRfXxaJqxsG/U+vl
 W/L8BRC+kG/i+0YX6Y86Bt7aoaME9ExWBUMwwoVDsiLgbLpfWqjamivDFLqDNj5+m0je0DSBfIp
 C8qKY0UmWbgqdsMPpyuLlxfr25L9wOQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-01_01,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608010122

Fix indentation of DTSI file with thermal zones (two opening { brackets,
but only one indent) by using a safer choice of phandle/label override.

Reviewed-by: André Draszik <andre.draszik@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/exynos/exynos5433-tmu.dtsi | 4 +---
 arch/arm64/boot/dts/exynos/exynos5433.dtsi     | 3 +++
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tmu.dtsi b/arch/arm64/boot/dts/exynos/exynos5433-tmu.dtsi
index 57b335f579d8..a3ebc49fcd36 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433-tmu.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433-tmu.dtsi
@@ -7,8 +7,7 @@
 
 #include <dt-bindings/thermal/thermal.h>
 
-/ {
-thermal-zones {
+&thermal_zones {
 	atlas0_thermal: atlas0-thermal {
 		thermal-sensors = <&tmu_atlas0>;
 		polling-delay-passive = <0>;
@@ -347,4 +346,3 @@ isp_alert_6: isp-alert-6 {
 		};
 	};
 };
-};
diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
index 5fc3ca233ac6..ebd63b9e244d 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
@@ -2073,6 +2073,9 @@ pcie: pcie@15700000 {
 		};
 	};
 
+	thermal_zones: thermal-zones {
+	};
+
 	timer: timer {
 		compatible = "arm,armv8-timer";
 		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_HIGH)>,

-- 
2.53.0

