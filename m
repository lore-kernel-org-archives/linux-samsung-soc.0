Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE2D56C632
	for <linux-samsung-soc@vger.kernel.org>; Wed,  9 Sep 2026 14:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788963490; cv=none; b=dASSAJNs5cEMtMA5rQrpB+gQ4hUQBSqNinsqkaNG/jzUdg0md6YQjjRI1fLvh5OSFwJC2yoEfDIDqYEXaKIIvrmmewg20SVh4Z5xM1iI7hBiLWZeV65OtkSeaeT00M6IS6mkFlPvqZ6M//zhMlXBLuqNePgFn51yH1qSG6pq8IE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788963490; c=relaxed/simple;
	bh=c0cxm8DOEPLClpli1HmvHjC8bu9sqa+m4ayGpk0H/b0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pnkh0ZEf3oZ1i7qwFk+u/NKJIIPQRrXB03hpV7MfeCU5tv8xqGjAdWKGc9rGx0yQ+fJexz/vmRE7olFbegugacotwBap1tV4S+r6rkl0BaC61gh1xe/bT2KBa/u+InIQdAb+1vLYWXOX+i7Gnwq8q2vCm50gD77U/A5MFverp1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f3Sd0IcW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FBGzpPYq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f3Sd0IcW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FBGzpPYq"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BU2g51723075
	for <linux-samsung-soc@vger.kernel.org>; Wed, 9 Sep 2026 14:18:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=apcsZg0PcToMRQMErCaGrj
	GBMFk6lJ70wquYVwMAbm0=; b=f3Sd0IcWNDGqqEPl6fZ9kvm82NXdz9l5KzeK68
	X0itKvUapiJNGTCiC+zbEETX2wV4WFElBFSr3ldTTaqH9PPWws7xwah1P/vvUg8Q
	G6DMtgZNlYyjVs72p5FC/40HczSWpwJWjE2NmXvbGk7v6mywa217u+ZGwA0O97oE
	JTbkF7FKMGmckwDJE/0cgzwTkz5U8FfMjHKI/UK8Go65jD9hJfDKFdNzyDhu00/G
	XgZVeEYMPogNolKG+npNCp0zwnfrU8ye+70X10CXEdi71kcb14xTQiETSMVISaPy
	n8ueZsgMGPL0vH+67RL+tmDq/+/3MuHuiIzUDM/UsPudkPRA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk5cns14j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Wed, 09 Sep 2026 14:18:07 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-97cc09260a3so5047858241.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 09 Sep 2026 07:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788963486; x=1789568286; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=apcsZg0PcToMRQMErCaGrjGBMFk6lJ70wquYVwMAbm0=;
        b=FBGzpPYqcSO+TA52AE1F18fBYhrgsk9Di26p67hfPbeNZhOXdKa+n4WD1w8+bz4gQK
         l6EawXIaxQug3muLxIFHC9W3deYuQQ7VUKbwQpZW1t6Ci050nEUS0BwvH6Y8EnjU3hao
         tUCiRCY8pxY7zOf9o4shDvZJxJl8d+D8O/TP82vTU0M2++EJMew3ocWIK4m6+MsZJnFZ
         pmiBBpzL3o32hpnqAwgppuYSQ1kp+T4nMfUy52qMYz0Yyc4WaSfHzPSVb1Bbt5zczRqZ
         m1exaS+e06JQ+H7XZw1yHih+vcbLVx0khh705PBoBhL8lbXyXSwdiUorWEDYbEgle8ge
         V1uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788963486; x=1789568286;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=apcsZg0PcToMRQMErCaGrjGBMFk6lJ70wquYVwMAbm0=;
        b=c7j/kB4KQJizqf2mMIW+Phopty1csOc7fLv2SB1K1XWh+aWYDSB+BdSeKA0vYY+DF5
         qVkhksx7k/rVCEK6FaZJ2WgTkRTKdiLptquOpSegWRBzRBkSbLo9sZxb+WKZi2DJ8fkD
         QcE0d26ha/bI5HS9OAqiRPg5C7o2BEtDFxGTsqD5ByBYUz9IWFOk13ayrxK0Vca4YUTy
         FQFyiNPPF4YfrIBZwllabkxDWUsiqhlM9qNcX4swg4sVc/hFHe+J+g+ujTom7zJhSWrj
         vz6GY+IIw+5BjCLZjsIz1JcGwSCAUtQZBYisvfXEkWxlZwItxraPGSqFU/5f7V4oypD5
         ZyWQ==
X-Forwarded-Encrypted: i=1; AKwUvByprDVCFx6VYUQZukKKi5qBR/88/6QKxyy+bkmogxbnajz7URa1D0X0ShlR1S4WJgE/JeQSsmTwXckonkx3R6iNXA==@vger.kernel.org
X-Gm-Message-State: AFuF++n54DYUiGVya+/9In3CMTlfUdm59AhK6AY18AQMjOz4BL0+uQGX
	hVgGLKasBjq8k8E26d90WbvPAD8uvAcjdq2BzWNFCB8ZvkhjO39RqZVe9OaWL10pC1VCVEzBZDo
	wkDjw5LF60PWbR7OcPa7TN/sRHWsUU2jMFHYtaMfBgYl17KFOYaHfWsxFIkuybe9W9aP8UHojBw
	==
X-Gm-Gg: AYBFou2OgUPFLW2VHSmCVV+aE0C7lSKC4YSsJ7WP7zGWzVK41tJIIG/5z8srsg5IPfE
	f8JRFst9gdzgiTfN2bBgiZRl99AdGAG2RZMLNETAfwTvgQrzT7lJIK9foBBTwHAAiqQz3KDKd0x
	jLK888fuMHJQdQH6y3fjD4yeibIPUdH82DlypGfL4DEdN6XlPa5rDJ3qOo/KRpvXcZ7wia+GMEO
	ZA3XvByDAiJQXtJdk0By2pYrE7Kmk+1sp/RFuGhEO1+f0HhMewS4VwyabsTUg0rgJyu1VoNw+9C
	cCbJTDsXBGl6dR2XvYr4trjdoaDFVKBseLb8WMDRuiwieuDWeglsgJXP7w5CdMDV5lwclgCeHyL
	hv7iWELSTWuP+f7yT1G7TP3c=
X-Received: by 2002:a67:ecd7:0:b0:78a:568a:616e with SMTP id ada2fe7eead31-78a568a7517mr6302031137.5.1788963481442;
        Wed, 09 Sep 2026 07:18:01 -0700 (PDT)
X-Received: by 2002:a67:ecd7:0:b0:78a:568a:616e with SMTP id ada2fe7eead31-78a568a7517mr6302023137.5.1788963481058;
        Wed, 09 Sep 2026 07:18:01 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c293b6246c4sm77581766b.20.2026.09.09.07.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 07:17:59 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 0/5] arm64: dts: fsd: Cleanups with new dt-style-check
Date: Wed, 09 Sep 2026 16:17:51 +0200
Message-Id: <20260909-dts-samsung-cleanup-strict-v1-0-1b755a446b22@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQrCMAwA0F8ZORuoHczNXxEPXRJnhtbRtEMY+
 3erHt/lbWCSVAzOzQZJVjV9xYrjoQG6hzgJKleDd75zgxuQs6GFp5U4IT0kxLKg5aSUsfUnYmL
 ueglQgyXJTd+//HL928o4C+XvCPv+AbRhanh+AAAA
X-Change-ID: 20260909-dts-samsung-cleanup-strict-327cdcdd68ea
To: Alim Akhtar <alim.akhtar@samsung.com>, linux-fsd@tesla.com,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=829;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=c0cxm8DOEPLClpli1HmvHjC8bu9sqa+m4ayGpk0H/b0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqoWqRFO4McZz6cukP6b+AMueoMq8DlRFKGo9mR
 6iA1gvgMfyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqFqkQAKCRDBN2bmhouD
 10WPD/0f7lIhTibcfCES5gvYPnDu3o3Lu2IW7Qj0PrIYjFjbilCdgC2nnk6SawIlqdW8B3uZTQd
 or1k4v6ReZma6X4auTwcYAu2UnN8Pz+qQ9UhOmCsvKFhXz4JsZmrm52PhlKhjmd1T/RbkHfmr4N
 byaoSJ00WrrwMFfIFBVngsoIsjdtPeK+jAXOcU2rY95Pl7tN3ieYeY1ZhuF38CJ3ed/CtGz3V1O
 U5oW3kbA6PPpLWMdx8BXo4B/ygsoa4HT7OdECpM1NSWRRO7BYcNFxuUhka6NqVz/BSCdJsEk0Hd
 Qy69mjaWuWy0xmqm0fGSutPV7f6vGoR6GBZHVHmLPCVoTrP76AWxVFIn9DzixNyxKiFh4knJZz5
 jMNI46DgssgiO+GH30qi37RClWfjvkPYPs8aNs86T8Tsx0Waz2O0B4m+lVJZdgmR3XvC6b7JO60
 ooza896KnZy9l3UmPw7Xnq3jozGmd+DXiqr3BwBdTAdcjrPXdxMlTtDiPplevdW/qmAtRtU5F90
 egTcYZiEIttSbJjBtciF+3zV9oZxR38kwyB/eyGwMrIlXPMT7044r3HQHjAUF7kLz2D0ghXTEL1
 8+029XgQnNIgLmvf6tMZ2diccS8pqoFOOAZ9znsfa4OVpL9DN5iWZIx41N1n0KSQRj29rFE4lw2
 2WG0kEafeOl+ncg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: EolHhbAmB-U8hRh9OH3FEUuHDdIwwzve
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE2MCBTYWx0ZWRfX8id7AStYk0fW
 kDrTG0qwYdobNlfDt3Ogx9/gaBPZ+G/RQ/HPP8dK6nrF3iF9ZHl0gGw6oLqvm9KUMb+D6ErPBca
 vmNOPuol7TumVVO0nlmg4CkvBA/vBSQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE2MCBTYWx0ZWRfX/vPJyYgtpnrF
 zE8VXyyiGe2+ya9Ei5QZS2jFv9dOtpEl8rH9MXOLkoYLM5dEWfohKLlQqLF/idSDs8dBFU8xHEb
 FwKb/eW3wvBvu2Z+RiTsSQ/8QmX0Qsp1snKJWAjumNCn08exe64QBMwBqjsHdHXeZ2Gr5I8+1Vj
 1OhO7IFqYDpb8KaZuZxQBFDe0B6YzhRPtWoBb9pjIX9m+/RUIogjBCzU6vydox+DYz7cEqHX3aX
 NEnfF+0uuS8W/UWjNrXLefutNxndvLP2XArs8TBOPWc7hMSfZOkUX8tdyKkOrV+w1Ys0hPlbLVA
 dqs4jv+jIQHJ+HRMfZjwSIiN9kOQ9Z2hSCSn/GrhktM/mFU+JHp+91k93hAbWi6ef84ss4P786+
 RWhT/lDYbEMWJx3gQYOp8moFvh46vJtt51ImjsavwgGxAer75aGy0k22HDYHCViRpf8TBBdbGf0
 lOkmBNxu9xydc+9WvuA==
X-Authority-Analysis: v=2.4 cv=S+jpBosP c=1 sm=1 tr=0 ts=6aa16a9f cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=13zs_1EsgYwksEZ6_G0A:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-ORIG-GUID: EolHhbAmB-U8hRh9OH3FEUuHDdIwwzve
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090160

Only a few warnings are left

Best regards,
Krzysztof

---
Krzysztof Kozlowski (5):
      arm64: dts: fsd: Fix indentation of CPU nodes
      arm64: dts: fsd: evb: Correct node order
      arm64: dts: fsd: Move idle states out of CPUs node
      arm64: dts: fsd: Re-order nodes to match coding style
      arm64: dts: fsd: Re-order properties to match coding style

 arch/arm64/boot/dts/tesla/fsd-evb.dts      |   10 +-
 arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi |   16 +-
 arch/arm64/boot/dts/tesla/fsd.dtsi         | 1162 ++++++++++++++--------------
 3 files changed, 594 insertions(+), 594 deletions(-)
---
base-commit: 664f1ec11b4dc75f6de70a52e8219f812b6e57b3
change-id: 20260909-dts-samsung-cleanup-strict-327cdcdd68ea

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

