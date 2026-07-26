Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F0BE3BED1F
	for <linux-samsung-soc@vger.kernel.org>; Sun, 26 Jul 2026 17:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785087829; cv=none; b=Bh9mERMIkoqQj1DzBI5pXXHdLEDH1D3opTGNHbHjN1ANKHWBl9K3gA+yfwHpQK/1iIY6pG2eAdkatl64rpM/f2Gz8zM3tPyq9upzsozIaSnMVggUo8UnBOQ9Lpy/Hf+OwVsVjUOvP7pPgmQSOZC//zMwmwNjSks396RkKvRgcEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785087829; c=relaxed/simple;
	bh=0heBfNfOncdb0dF9IwkvyA9GBPaKA9+Er+Dg3z10Wak=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cqHdBc3CKbx8iAPLSjqLQwAQhVhBL4IyWa/KtzWG1tnCe8jBLwpGFGf37Uj0gRAFchYF+KZ9SEqQQSjRRfOo1BcSodehbHEBWEGwRF64IQclim6CfjqRxF/ZkkjWV+0hLAc3t0YSksj1BMWfyHloDSy/Xxs2/CPoKKapiSow2ME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PgZxNITu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dEHgibsR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PgZxNITu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dEHgibsR"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66QH6oWm1333002
	for <linux-samsung-soc@vger.kernel.org>; Sun, 26 Jul 2026 17:43:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Si13RHoLBWIyuPF06cIxoa
	9EFvca7cz+q6+0wc7xEeE=; b=PgZxNITueHYgajwyqd4SiujmWwdvjfsfgV0jlo
	U58crE0tlB77ZvmPzZPIqxdg/JziKcwP4kDUjpGdmc6wREjlsVaADb/q9n8EbZj3
	KmQfVL0eDTsmvmpfXgaqca+blVKRBt+RqYYYMAqe94/gjWghvzvtsyOhXMA63RzR
	0B4u9AbzSbWeWdiwJo5NuVnXjHi+E5gNfMaGGFQQzIKgNDfxFtjniAsiQR5VSCdi
	SdOp3AcnDFyOWZK5RKbjtJYIK9nMPA/PxsbEd8+cTjZUnIowjwLwyT3u1w2+arxj
	m4wHHnQ7kl/353txXTctyE5kOwHGqGs0RPjrkGCpfkzN+ctA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmn7vbdxk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Sun, 26 Jul 2026 17:43:47 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51bec738909so22035771cf.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 26 Jul 2026 10:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785087826; x=1785692626; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Si13RHoLBWIyuPF06cIxoa9EFvca7cz+q6+0wc7xEeE=;
        b=dEHgibsRCJ5URRYaz7qAIoAyxR4s3ySMtmgbt+6+eo+9pfj4uaQ+L1mvBb/rGJ+2Zk
         ewV2HfGe6cMDdzicCNmeuqp+6EoExovq9xhDnxfn7nqOwpm5UcHFVM0mq0h7Ig/3VbQ6
         zvmAia6FqwJLtB+HsX0Dv7d2cg8mz9xxdiZdBU6fEOzWm2flTaqHsJw1xDR3BB0VVRqu
         nLK/fD2gAhOEPCM1+iXlM32S8D54iKfgH37UxToJO7fR5VgWtzs/98VNMOtLUNTphnWc
         mw7hr303XC0Oehen8Hh7ggd9VzNg1mie38KcSBGG9Ig/EAq91o/EAav2hO5vpV4Oghjd
         QyQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785087826; x=1785692626;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Si13RHoLBWIyuPF06cIxoa9EFvca7cz+q6+0wc7xEeE=;
        b=MoH+Krd3wM/wCabj6fqaBf2Z5GxPI0FC/b6/nGQpHyidmsaJcatbRw2gHY+pjKlE6/
         0wusaPDyAylfuaunFkST4FgqhGnVPCe2kPTI+rGVBHOrfquZ9eGhOQhfehiA6BasO7mz
         bdpkI4zmpnr57/xBlVWkRggQH8gA4iI5DL1aZNlYxm+63x1hDzW4K3zRLF/m7Mmec2BC
         +RWT7bS+IpKg9VqtIomF06kdMnZ5WxwtSIqkSXGgvkIxS7Ubvo9HASzN7uB2u52zWau6
         uDNIGap85WGKZ/c3MQQnQ9uxFhJZMvrwoAsc2vYYR07T3mS3uYLBDIM9wb7hr2UAw2R7
         +QCQ==
X-Forwarded-Encrypted: i=1; AHgh+Roc0u6yDFbvdWPVWktNL1O/zVrMM35+9OeMnfqutJ0VyZ6apLWnKpLwtsdl32/ILKVgXadtxzYbpoC6nJUjmoJDSA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0DB/SIbusRsMlRLQ/yFsdrgE2+kfjcZC6PS5j9tMpW1gyAaJk
	PLCPVf7755grulxji96JCtBz+boBJ96OVJFqMAdjjTce9TI+z5c7pIUKiVl0XdlihXCvXpSchrM
	AUVSyOVWVxRdQyuVtQ7syJmtElC18Q9YiSDeeOSJIYu68q+e3v6OBlByCtzAGba9wOf7AuC6aUw
	==
X-Gm-Gg: AR+sD119GnLjmMSK6AcXz4fYSFXlig0wTejf9yCIHseOCYmvl76wOtSDqBzTU4jOazl
	HaXv09UJUu6XdS5yHsxnpW3U4igRo9WpX8XZZXP89GEf2lFiibCFRARsdE3WWmoI/82hdZ+uYN5
	D5TLFEmhjecztopxF4FrLm00DLtSJV8oQwTz1080d1qHAdRYE+vIUGBt5OEeZrB2LxW1NFkdzC8
	R1Bl2B9ZqxJxK3uy7oGQ27lWjD87hADF8P+Jmz7oQ7HFg5qvGbMj1wVKUQA7QVqt+wtJ4qltdWK
	Ej5tcifCzmD3Ch0+Ev6+O4F0CZt60/DtvNVW9sjRxPtdeIRQZX1I8w7GI0WY3oPr8Hje//CBD2L
	jvN3Ws2wSO/dZp/EE2862ytqx
X-Received: by 2002:ac8:5f47:0:b0:51c:2149:52e8 with SMTP id d75a77b69052e-529a871379dmr57979851cf.70.1785087826460;
        Sun, 26 Jul 2026 10:43:46 -0700 (PDT)
X-Received: by 2002:ac8:5f47:0:b0:51c:2149:52e8 with SMTP id d75a77b69052e-529a871379dmr57979701cf.70.1785087826028;
        Sun, 26 Jul 2026 10:43:46 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c63bd3sm41576093f8f.27.2026.07.26.10.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 10:43:45 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 0/8] arm64: dts: exynos/google/fsd: Trivial white-space
 changes to adjust to DTS coding style
Date: Sun, 26 Jul 2026 19:43:33 +0200
Message-Id: <20260726-b4-dts-coding-style-strict-v1-0-e9e3e9879d05@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2NQQrCMBBFr1Jm7UCMpVGvIl3YZFJHJNVMWiqld
 3fUbj48eLy/gFBmEjhXC2SaWHhICvtdBf52TT0hB2WwxjbG2Qa7GkMR9EPg1KOU94N0M/uCzsQ
 6xIM7niKBBp6ZIs+/+KX9s4zdnXz5Fjcj02vU17Jp6/oBTqPmaZMAAAA=
X-Change-ID: 20260726-b4-dts-coding-style-strict-70f4df3789fe
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3194;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=0heBfNfOncdb0dF9IwkvyA9GBPaKA9+Er+Dg3z10Wak=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqZkdHPyln/j2ooJ2F7tYvn7cFNfhORymfCNuST
 Dx/SbUU7VmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCamZHRwAKCRDBN2bmhouD
 1zSVD/4+1jmer9co03ZaY5J58u3UM2b6wO4SMgEAuZMpX282OHXbvhVsyG9lolbMXkn1KMm7ACw
 9XBjFwL6azYrxSvtjz4PYvPsRZOgbl7jbxJX403das1PvYD9D+pcDWE/cMPF3P3pYFH3aCt5Hkl
 E+ljIoaXK/PukiEq2xikrr7BKgtU58YNtSCfqyU+uLDVN8vWYoYfpzoBvrpM1P+5fBIp4CLg3ao
 LWeKwBH7hZV4YHHD+eSJw/4JaZEsqnzXP5ARWArjQ0Kcr6VPH7KqpGyzWSpzGvBn9VtpTgxHW8O
 HxRYkpa+YYeSQTZ00baN2/iW7hO1oSfAbJXfDAJy7g1fziy6nez5p63ByA9sIWNbmpkX5nndUUy
 Gs8LBYafbCY0nH8Z0dSRa9bLaBT5wz6xnSxQ1ykzy2ep4c9xzEJPVilz95ipBQjS1bkm9FhskNa
 GisDYuIOALwfUFc/sH8l7E9ccUC2GilnuWQs0D3nwqAoVnMKEMW0UEYtTpoyfhEhsXLvXzr0A92
 sUtFPsOkRUeyQC+6k3dpyH7r1SeimO56P2tBJmuWdLTbqEqsfJiKBrcIsHP7fddX+Sc2DV3iOdm
 TI53AtHFgZzUCvszVNxbg1ZIGghsxY1wzBrX4rKjYLIoQdiNOJZkFmpWixUTQBHA40+7dXxFOxN
 NoxHH3Bf+ZXeS3A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=GKk41ONK c=1 sm=1 tr=0 ts=6a664753 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=gZx7o9k1dQs2gHzPI9AA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: I37eddVSM51YArHa0lOMgF0dYy0hHaXK
X-Proofpoint-ORIG-GUID: I37eddVSM51YArHa0lOMgF0dYy0hHaXK
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI2MDE3OSBTYWx0ZWRfX4gSWhn4/iqRy
 vn9i5bY4DDaVR5qeWdbh/iTe6w5y5EB3HXJf866XvsZg756Hfy8GY5frU3/HvPuqu73C6fv2NGl
 DT2F2HaC5snGf7w3NUTYwYxcirYDT3s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI2MDE3OSBTYWx0ZWRfX1kTrRQCdc5fD
 EXs7L56gF0Dn6HIHy2LBl+X7yxyAFXgdiQrJv76u3VArymVm3RZHVlZ72DaWV7F8EBSvU9CtdQ5
 NMgCDysAkoIGztYsPVX6rVZfAFIhlyP3DKLJSvR/EQGwVDk7Br2FHVl58gls62xnhUkZD+hEr60
 Wx2IfmiiyMI51yhkzAR0qS0/TQn2Zz22fjeRIB8NKuuHdJre9vv4J7BPb9dy4pBCktPAYLP8D55
 FQMr1awnfqs1wrt6eAigkNCSUhFSKcWCFop1U9vn2vCeuZKkMYsizDnIJ1T+zUMaiy3IKxmvUhp
 TVopxavDVJseLwLqyGHOJ/S4Wkvu64vfpPmUWub4KLVYQtJ2bc4YvdinpvxnQFzTBWIeYuwrf9I
 pg6K2sDlD5b7DxJho0z93US78IJjEXKrEZZNbAtapw62otQTrkxzY5CCONPk7qCcmQAwpXYmxoH
 sSC+p/L5v29Cyj7nRAg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-26_05,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607260179

Fix a few obvious dt-check-style strict warnings.  No functional impact.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (8):
      arm64: dts: exynos: Move 'status' to the end to match coding style
      arm64: dts: exynos: Align continued properties and add missing blank lines
      arm64: dts: exynos5433: Override thermal zones by phandle
      arm64: dts: exynos: Re-order clocks and align continued properties
      arm64: dts: google: Move 'status' to the end to match coding style
      arm64: dts: google: Align continued properties and add missing blank lines
      arm64: dts: fsd: Move 'status' to the end to match coding style
      arm64: dts: fsd: Align continued properties and add missing blank lines

 arch/arm64/boot/dts/exynos/exynos2200-g0s.dts      |   2 +
 arch/arm64/boot/dts/exynos/exynos2200.dtsi         |  98 ++++
 arch/arm64/boot/dts/exynos/exynos5433-bus.dtsi     |  29 ++
 arch/arm64/boot/dts/exynos/exynos5433-pinctrl.dtsi |   8 +-
 .../boot/dts/exynos/exynos5433-tm2-common.dtsi     | 167 ++++--
 arch/arm64/boot/dts/exynos/exynos5433-tmu.dtsi     |  49 +-
 arch/arm64/boot/dts/exynos/exynos5433.dtsi         | 571 ++++++++++++---------
 arch/arm64/boot/dts/exynos/exynos7-espresso.dts    |  13 +-
 .../arm64/boot/dts/exynos/exynos7-trip-points.dtsi |   7 +
 arch/arm64/boot/dts/exynos/exynos7.dtsi            |  58 ++-
 arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts    |   4 +-
 arch/arm64/boot/dts/exynos/exynos7870.dtsi         |   9 +-
 .../boot/dts/exynos/exynos7885-jackpotlte.dts      |   3 +-
 arch/arm64/boot/dts/exynos/exynos7885.dtsi         |  21 +-
 arch/arm64/boot/dts/exynos/exynos850-e850-96.dts   |  13 +-
 arch/arm64/boot/dts/exynos/exynos850-pinctrl.dtsi  |   1 +
 arch/arm64/boot/dts/exynos/exynos850.dtsi          |  47 +-
 arch/arm64/boot/dts/exynos/exynos8855.dtsi         |   5 +
 arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dts |   1 +
 arch/arm64/boot/dts/exynos/exynos8895.dtsi         |  56 +-
 arch/arm64/boot/dts/exynos/exynos9810.dtsi         |   9 +-
 arch/arm64/boot/dts/exynos/exynos990-c1s.dts       |   3 +-
 arch/arm64/boot/dts/exynos/exynos990-r8s.dts       |   3 +-
 .../boot/dts/exynos/exynos990-x1s-common.dtsi      |   3 +-
 arch/arm64/boot/dts/exynos/exynos990.dtsi          |   5 +-
 arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts   |   9 +-
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi       |  86 +++-
 arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts |   2 +
 arch/arm64/boot/dts/exynos/exynosautov920.dtsi     |  64 +++
 arch/arm64/boot/dts/exynos/google/gs101-oriole.dts |   2 +
 .../boot/dts/exynos/google/gs101-pixel-common.dtsi |  12 +-
 arch/arm64/boot/dts/exynos/google/gs101-raven.dts  |   2 +
 arch/arm64/boot/dts/exynos/google/gs101.dtsi       |  81 ++-
 arch/arm64/boot/dts/tesla/fsd-evb.dts              |   8 +-
 arch/arm64/boot/dts/tesla/fsd.dtsi                 | 121 +++--
 35 files changed, 1166 insertions(+), 406 deletions(-)
---
base-commit: 392dc8766489bd451c5f20928d01cc24ff9eec0d
change-id: 20260726-b4-dts-coding-style-strict-70f4df3789fe

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

