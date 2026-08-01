Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB65399352
	for <linux-samsung-soc@vger.kernel.org>; Sat,  1 Aug 2026 15:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785596764; cv=none; b=FF8zGSy6FDnKoroxtsICKuHaS8RQyFUR9TM23YEJr7zxkr/BCS6wzf3qj8jNkWeHuJwkOp+6KIIA4B6gx8OhnGsmTWkMwuz/vXaYWKU8y5eyDAg7KBbf+fbZ4SM3PThdJ9QjuxiH6biDA6BQKxe6uB19hmChALg9jrOKClSDPDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785596764; c=relaxed/simple;
	bh=3vp2hLKTmc09zaIHpCig4bUhEfQiMWD47tjAhsEdWyU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TBUMaTOyEcbGmbVrCybNy8x3i2/qcZOUSXn3IdRUveyPcCodhygx1vXPoH+DQFTvZjwrxzJu5UJdhQw3N1N8wFQiIOUnpLlXFFL55EW5dUyexWKmW1KGyJ1WyB4mCWsWrWx9qp0f8uVGIxHmM2ll0l6XcKulHYBhsVvYwwOk7pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S82Ypath; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CI3IouVE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S82Ypath";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CI3IouVE"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 671CanmH2394605
	for <linux-samsung-soc@vger.kernel.org>; Sat, 1 Aug 2026 15:06:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=fxqtwBV1yl8Oo30paZH3pe
	KPiKzsEGqLBKYrL80s9vc=; b=S82YpathuThkYFuVhUj4YndQmYRF6kAlPZEw6y
	Qs0c2zxOKMUMKq3QoUfBw/2BPVoqgnj/kGEBXiYHJ71ZyVcYw2qbPqyHleKxnPp1
	2u325ZB8Wk8K2rAltBXC4rg9b2wI69qQR261ArHw98j8c/i83dm/lQeLwhu5UnoN
	juIuNrO/V1Z3ogRjfYaUVhs5u+0kRy1FJ22mMVDR+QAMssg52WmArynxB1JgopN+
	i4eeDm+xLHgWWhTrALbL9IRYYK5vilgN2B2HIAm9LOAvykwoZo0JO3korvcjTt7H
	BVn83Oci05kYtALMYtQxz+6MkybQ2KyynVLHAHfHhtrxw0HQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs9yggxkt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Sat, 01 Aug 2026 15:06:01 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-522de3c645dso38486891cf.3
        for <linux-samsung-soc@vger.kernel.org>; Sat, 01 Aug 2026 08:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785596760; x=1786201560; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fxqtwBV1yl8Oo30paZH3peKPiKzsEGqLBKYrL80s9vc=;
        b=CI3IouVEZCVMdl4CF8XsTtoxIY43vaxoeHenxVQzKZnfLk425AcB9VX0saUkUsLs6/
         gPmNWP7qqo4pCOhqtLpyfryQEwuTgCSMs+GyCl8dH9GAmDZtl5EhjyHGaUpg+EyqSgwI
         4DBpXovzs7jEpx1V9F9njeCu19ElO5Y1AKH1VkzGSR38MuE8PmsQWWha3RImxc9h87m7
         Ks1I1OCXKBh421ybBDyqjRn82BzSBwXBAO/boPIIjsoZ1XcZwOGpzHwndqZ1iYRL4Rfw
         U0kFbgI7fFq+jadGYz2UVCc8n1pXdECzGQ2x6RT5O/93ByqMF042/hyEqJ022ztn9BEx
         Jh1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785596760; x=1786201560;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fxqtwBV1yl8Oo30paZH3peKPiKzsEGqLBKYrL80s9vc=;
        b=B8/SnfgKOPhjHbJ8Vv5oVamcOMRbr1lKD5B/3+hTEIuwAdQTHx9zje7RnQQ4IHYJ37
         doN6D5iTyQZreWX9f43EashNmfvi/8zCI0r9mYjduE1UUx0Oi+5jjt6xJ6XJr0Jy2jdC
         SYgLwq0sROSL9jVzvvg6SATsVjNEX+PgD9RedVSSXYSxx5sM3SQqubPiWPI/8QdIQgDK
         bOJxksi+a85WMFRPuYVj3zG6KRVjts5Dbf8Xl+N7bAX/RlCmLs/PJbRcBKoASpF19mvi
         nX0mXRC7OUH9dx5bOiQPJ691kq/JXakn51uimYwXptaGXy3lvIhdRMKEcZkp6aWy2MVH
         SZeQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro2MO+OGugsjTQPIHn5OFSwNYRL2IziLNa4RpurlcqpKGOyo3+qQd8j8laMJYNYo0W8z6AXsBwdhhMbw3k+wxNTJA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzDrsXj+xUmXUCyMdXu9fsycPg1yxNyjWST8NJ1cVea8cwJotB6
	cuqhDRUbt+ouETPuNEy5dIP9fRSXGvzBzE9FFWYYyQ8Bas5ZevPy1UtqRAZ6ov/9ePZo6LViZrU
	WaLJpaSwlZtuHXTT5JBqXbu27rbQIht2ojxJQbEeghbnZ5C31FJUWgIe5K8Bp47oTGJ78hs2i9w
	==
X-Gm-Gg: AR+sD12SPNKk/HySmNa0n+VhZih2YF0o2lR25L4IVDlh7PoSS7HARFc/opf1HWaOZOZ
	YQsyDK925DjYhkDukMkHMfXRBCQtYBvWxmfK6e1WHAdpQlO02xBdk5/2p+YL+m3Z8nGidbgmOgB
	udqrj4u6jZxu69/5Q4UUWdGtRpsFfg0r/EYhVCHIvkPwRnzrMvKyrbx2KBW9i6unei4Fj+LYHyA
	it5QkhjGuoDKyXE15Dg+WoSZiQd1Ldut3/34DvYk4Erl1khKYuqqvBIIXy0Xu9vV9rRUcedAze1
	5Y8nkG7zhrgpefhRi5rJh9EZ8pBRAgOVjZ9n6copAvfk0MRBw59HwsmRQSE6as3Tu8Sb0WiPJpw
	K776/2thyBYEVljNYHa8aov9c
X-Received: by 2002:a05:622a:1350:b0:517:96f0:5658 with SMTP id d75a77b69052e-52b566aa84bmr69865301cf.14.1785596760346;
        Sat, 01 Aug 2026 08:06:00 -0700 (PDT)
X-Received: by 2002:a05:622a:1350:b0:517:96f0:5658 with SMTP id d75a77b69052e-52b566aa84bmr69864741cf.14.1785596759972;
        Sat, 01 Aug 2026 08:05:59 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b85be7sm79293395e9.2.2026.08.01.08.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 08:05:58 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 0/9] arm64: dts: exynos/google/fsd: Trivial white-space
 changes to adjust to DTS coding style
Date: Sat, 01 Aug 2026 17:05:42 +0200
Message-Id: <20260801-b4-dts-coding-style-strict-v2-0-c0b4c68b2ba0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42OQQ6CMBBFr2K6tqQUpODKexgW0E6hBqh0CpEQ7
 m5BE7dufvImP+/PShCcASTX00oczAaNHQLw84nIthoaoEYFJpzxjAme0TqlyiOVVpmhoeiXDkI
 6Iz0VTKdKJyIvNJAgeDrQ5nXI7+WHcaofIP1u/DYcjFNY9b9aa9BbtxwvzfF+/Wt9jimjUEACR
 S4KxS43ixiNU9VJ2/dRCFJu2/YGWhHJQvIAAAA=
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Jonathan Cameron <jic23@kernel.org>, linux-iio@vger.kernel.org,
        linux-media@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3383;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=3vp2hLKTmc09zaIHpCig4bUhEfQiMWD47tjAhsEdWyU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqbgtJlWfEjoO2CLrZldVzCgLdfG7CgAqjZHVMX
 GdQDs/H6JyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCam4LSQAKCRDBN2bmhouD
 1+fSD/sH8Wl4wRRGrpeoxeC65IdstMKa/hp1c+W0C9K3mzWf6z/wWiDQszD9UoTsBNR2kmWdoTg
 IVZY1dZllJ6CZH2/qX5ecO1UfxhR4uWMEB9HNXiWXo7dAs1vcqTy9s/OdtFDK+4R2l0ZGE/sgQm
 KedNNWtAg2qz2VpLeNmDDLZSFjCWpt9GRJbKOEHB1yLE6e/zuOKx8OGy7HCjtkpj75GnsAs+cta
 d2IkmCI+KG/fm7aTpeDzomCixn7OWYLRY0+yCcaF8buGjlizR3XuYzPoYGNF3UBB+n/3u7vCCjB
 wgEEhnMx0aQUhhEzxdztFC1fZj+IYfgVxtu+OfsxPT5m758+ultp+EfvbJw5Ef+HTU/goZ7VN8X
 Yus5Q8kkgDiooovHc7qT9kEgZlGAug7IE6UZy8rgWexAP/1zRWIAOGFQ83o06KfzfP7ga7qmjuu
 DVerCHEY1ikwbQdRMgxPdgm3z0Q8Qpx6XW6OYi5mtiD8u5gxqj6Gv2hURgHnymcIUHRuCSm1Tof
 HMQTyIh197fQM35/f+GrGHcM+LnS3MK/z6IpjH8QxrZC7PAlYNXhuMAdcwisjGKBHmuMb5o/+1j
 ETT2WpZ+QIpoE/VCTCKXkeBJeLStei71PCrx1xf/HuBmPeosEouFV7uaoZHbXB1/T3eg6o6uSNW
 Jrb8ZlG7tO8zKvA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDEyMSBTYWx0ZWRfX59Elz1MkZ3Sv
 Y1WQiH8PE0mk7lRl85LCwG9w++IoaHnMP+8LRNZCeh6X/YCj+LMLBqeXLQ4N59IZZrEn6RHONFJ
 Cubnj6KIR4P4cfgApyDUZxJvgAIwckU=
X-Proofpoint-GUID: VZkXPn8uU7rL9QULpJzF4Tqb7hf9NI3H
X-Authority-Analysis: v=2.4 cv=Gu5yPE1C c=1 sm=1 tr=0 ts=6a6e0b59 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=DwXAirjAvZakPEmmhRcA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: VZkXPn8uU7rL9QULpJzF4Tqb7hf9NI3H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDEyMSBTYWx0ZWRfX2Zi6ZYV/XfMn
 Ff+nu5SxHqcdyVzhB+40c9++UsQAJ31/F1BERIp85FPBotWYRgx+Bh4iw6yXUwA6d4NWHp2Kal/
 Uo2tw/nchtmDcHOhmviMp1cYCop0WDVqGqMgr3fz7NDLvpWMn1RHB/36BEvB6UU/JyZePyOJvdK
 Nejo+vE5CnU3uNHNsez3oWKH1f45O0rKsK8W+BMEqWE9HzjCrIx/dElvX3XcxzITeo9x0ruaDki
 uWJdo/Btozb4M+GXSVwckN+Ov/LcVZPImpyLfOtp9q1rrUxO5YWn47P22j2kPyp7FrFQtnIRW+l
 yqI48vW3TQfogPRIIf//eG/9K0gugMEjUbjgTgcvWXgMVFEzIkN4H8tvcudM/ArUDqihfnuPixa
 ymLMAk9U6YUYo+dFbxp07st36i/c5xjsMRTdb8NtYehQHsNp2uVJpi/ojienobqe3Z9hn5sElaQ
 SZp14KP5nBh0oJidiZw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-01_01,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 malwarescore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608010121

Changes in v2:
- Fix stray blank line
- Collect tags

Fix a few obvious dt-check-style strict warnings.  No functional impact.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (9):
      arm64: dts: exynos: Move 'status' to the end to match coding style
      arm64: dts: exynos: Align continued properties and add missing blank lines
      arm64: dts: exynos5433: Override thermal zones by phandle
      arm64: dts: exynos: Re-order clocks and align continued properties
      arm64: dts: google: Move 'status' to the end to match coding style
      arm64: dts: google: Align continued properties and add missing blank lines
      arm64: dts: fsd: Move 'status' to the end to match coding style
      arm64: dts: fsd: Align continued properties and add missing blank lines
      MAINTAINERS: Drop redundant lists from various Samsung entries

 MAINTAINERS                                        |  21 -
 arch/arm64/boot/dts/exynos/exynos2200-g0s.dts      |   2 +
 arch/arm64/boot/dts/exynos/exynos2200.dtsi         |  98 ++++
 arch/arm64/boot/dts/exynos/exynos5433-bus.dtsi     |  29 ++
 arch/arm64/boot/dts/exynos/exynos5433-pinctrl.dtsi |   8 +-
 .../boot/dts/exynos/exynos5433-tm2-common.dtsi     | 167 ++++--
 arch/arm64/boot/dts/exynos/exynos5433-tmu.dtsi     |  49 +-
 arch/arm64/boot/dts/exynos/exynos5433.dtsi         | 570 ++++++++++++---------
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
 36 files changed, 1165 insertions(+), 427 deletions(-)
---
base-commit: 392dc8766489bd451c5f20928d01cc24ff9eec0d
change-id: 20260726-b4-dts-coding-style-strict-70f4df3789fe

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

