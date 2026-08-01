Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B3A2931EA
	for <linux-samsung-soc@vger.kernel.org>; Sat,  1 Aug 2026 15:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785596834; cv=none; b=DpmFCgWGWTUaa4Slotr8ijw5mMVitMpB3UkA3Rbuy5Gojp6JsUq70Fl8hhJHtTsGMjzhu2J2vdGMAP7sF3xVU9uqcAnnddhjSTRwyrLa9SdrJlS2JDZqhogv2QuF66btH6rvtQKP9HxT66PXur66cjnpB3ki0Qxuq4aT6D+bpKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785596834; c=relaxed/simple;
	bh=nwH2p+9JG+z7o/nKYqSaQ2vRP2rkbEajPK7I4Kq9UHM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PLcUrcZd3QOnyKOb4w0DeV/sA9Yfj+KBZvNUsRpPxJ43EiyPEiUS0wRxQsXN20+JjI4tI5hqCearAsiXazuB2/p9JzIAnn9ib7YALjJ5a8Fx+TcGi+0F88adsD2EgkcnvEAh74oPcaesqtxbm2zxZoseiibdiYLW6ytJz7v5JWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hbKYAaOg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SHaKTo6y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hbKYAaOg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SHaKTo6y"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 671CamrJ4117148
	for <linux-samsung-soc@vger.kernel.org>; Sat, 1 Aug 2026 15:07:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=C1+PSr9jTvLUZgF2jVOKK4
	2FMwWjupbC7J3Dg2bJxRo=; b=hbKYAaOgrW9VLRXjYaqYm4QSF3bAEEPccCNS3N
	Bb65qYVSGt7K6lU+Yn3yG0rj1hwH+xnjS2YNYYXCzMmon20kSuy7deb4fExMjAXU
	82SXyBfExzkM0qx8Co7efHMNpnM5VHQ9uXfPXsf2ERb8rmwz+436mK4Zft9Vevvu
	ddj+9V7l2xAsyxa4wujUpUnbWZpXZNS7H6hc55r0VRYK0pMEEJhmfN5BaUMHsfQr
	EfYrQva31ZX3GUJBpoBcDqRO0ibahO+6sBZO1DOUgTQqqa+71bXBt7NJHcY4/mZ1
	7c2HFgXQjGGscOOGb9Pec+AxTT7x9Yj/aBQN/WMCbHytWMqg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8pg149n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Sat, 01 Aug 2026 15:07:12 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52b4f6ac06aso26005171cf.1
        for <linux-samsung-soc@vger.kernel.org>; Sat, 01 Aug 2026 08:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785596831; x=1786201631; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=C1+PSr9jTvLUZgF2jVOKK42FMwWjupbC7J3Dg2bJxRo=;
        b=SHaKTo6ykALhT4vFvehSXYusb9NkLgf5rsapg+Md7vLGy6AdGGdJTaIGY903pWENy8
         iSORNglROmkE/5SaK41XUD0D1CLg5UkGYnE7EgtVNfwrv+QeKqSHzmVLfKGSlvQNetca
         WDnsxIM914lbHUAI+tBKcj/i3Ub2ZfSZWMrAtYAgA89EOrMHgPNzFu0lJ8uAAZ8/eWUK
         ENxwnvR4tFJl4S9rWikIk4bJxdc4bE92h/oUIJn//1LodkRiJZEqHbF0UgnciFLVIh0U
         sndMUwmdYaw/MvdkKLz7E9j/9bHJ5GQZ0oByr3Uctqnnyo1joy8htmIDhEtGNxRUsjih
         6ZpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785596831; x=1786201631;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=C1+PSr9jTvLUZgF2jVOKK42FMwWjupbC7J3Dg2bJxRo=;
        b=OzczgpfCyYWPxOKQfa+uqIp5W9ihOHBYAE0dMxFSKzswNvPkUVeJWQ3oZdWSUAoAZE
         3gBDvmrtvs299F9bl2JnjxANMVL1EJFHr6YSPwCs/ZWUncrOhkZDUwyVpB7lEmM6Zzqm
         1wZPYYxn59yNvTGMYsbclPcXGYwsaBZSQqpJUd53Cp2CF3FQXfDjXWvARPdvylTdZqC9
         eiphdq1CTm2h22dhv4u/fAoVA1ysZ/zafIt2zKBjnYNbRU0igfbx0AUqMjLaeSe5WxRn
         B8nbuqSIaaWobBmla8pPQrWdcRw5MMx5TkKx9Gy7HJzE/tbcIAa9C4vpqiMlY7sh7kzq
         CHqA==
X-Forwarded-Encrypted: i=1; AHgh+RrKSELoKKglqRNycF58foAWYNiL+xPiPRYjNTp2LHRkb0NZJ+AlqnIByQo9i+SsNAc+D8ffWlE6pardm69fHR0trw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+wZJ0UyNwXMl7FczG+XJywc5lXM2tGL8ycVcde51441ZMeFnx
	Jiem3xsebrUIV0bj5XLt7abKJ2SbrmJn5betrl1jCT124hSggJT33gpMOs71kg4vFU42DJ+zYxe
	Yip6DOLms9tOOqcjKBNgQDRtT6kc6CTCHJqmMG6l+zXX0mVsXBC5ouKjvniajiHXEtwDCosKzOw
	==
X-Gm-Gg: AR+sD109cr3/zHckvCEKpUu3WcNE0ase4Lu9tCrEbZ9fusd8lrM9vPK9Y3adb9bgHpR
	fmPoh2Upi9T9ps2GbbkcH5tiKQopBMRdnSl0yC2bh0866xT6hEYSfeINFNWLLeyHs3L4Eh1iZ7n
	e3SHmQP2tqIGvgwPxqRbhnPNQ+oy99R3cBlFkUOZA+JnDRb2d0rHHgLvKnd3+ORXLGG7Kag6wh3
	04CuL6ud35jcg1Z+yedP6Li17pnTFSko3VHeRsYoLzOWx3e7kHM4infxLrjbc/qABYm12Rw+QP9
	UB6XzPepvSso1BljOWIYB8bLUeLMsjkodzv+us7dJXQ0teZda0t2eeHBAVFQVpzcdSO2jaJKbwJ
	/5i9CMmUgKXkbp0njOMwtjHTt
X-Received: by 2002:a05:622a:5906:b0:51a:896c:9aae with SMTP id d75a77b69052e-52b566ae2a4mr85649101cf.13.1785596831308;
        Sat, 01 Aug 2026 08:07:11 -0700 (PDT)
X-Received: by 2002:a05:622a:5906:b0:51a:896c:9aae with SMTP id d75a77b69052e-52b566ae2a4mr85648491cf.13.1785596830895;
        Sat, 01 Aug 2026 08:07:10 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd45a1abfsm16005222f8f.37.2026.08.01.08.07.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 08:07:10 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 0/8] arm64: dts: exynos/google/fsd: Trivial white-space
 changes to adjust to DTS coding style
Date: Sat, 01 Aug 2026 17:06:55 +0200
Message-Id: <20260801-b4-dts-coding-style-strict-v2-0-f09a659ab80d@oss.qualcomm.com>
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3252;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=nwH2p+9JG+z7o/nKYqSaQ2vRP2rkbEajPK7I4Kq9UHM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqbguUT/3cCi/kZ702ZyY69ynV2TZoiTQ1KpckL
 SSs0iQfeDyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCam4LlAAKCRDBN2bmhouD
 1+GyD/9lNCU5KMSR1vVChoP0MqrjaxU53nsd+JTHhxnALYdiX7LJzcCJ/9jFJBEm1YbOkECb1YF
 SHWbfAjh1MVkJHtwbv0gwYUn8n+61gs4Bc/5cbYSG94uS3+Qdhean+Jxv2ZNqFIXl3LMlia/0/0
 4sAlWdHSjqKg2H+QUxyZgY9gRiNHT3VQLzKQLfd4O3m9yQSEQlB3QrMRtZnY/JDLlhvUcBeIMbk
 3KY/GHBjTnuQubQPQK9xPHXWMDJVb6zsFV78vv42OusyBGa75weLSpUrtTAUD+felJv8yUhLWqS
 FwTNiXzOqK+S+jJg7GvwOwNIrHRi0tc+cSOdjwgwKSkjZpELIsfWVPGM+HqtEnMjTVdFqMJNj/s
 zhTbwU7yWINt4Xq/d4qQKExBJj7vAhYhMHx346UP34/q9HtXMVLVpLbdcK5vTec/pmnrqlTZuSI
 Z0wyoN9H0ZTwIcy9Fw1XByNuXcKouMTwh3lIXpE/TrPRfybkwj8tzTDjatiZRhWBNMQ6PvtjQ+D
 R0WtEqgi0hOr9WbyvesbNfmIF16pIqHdqF0qtGOG5/qhhqN4C1hmxUvlrPvIF+2IbPP7z3AEUga
 I8rlL+UfLseZOJh05kphwAGhc56034MP2sBEPKu4rjOZPBR85WwBOFYuK9ulvFDPMdIywpeBxAy
 o3uDY49mSH31OaA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: 1-F1cNeqRV17Qqx27MB0bnfzrC5-D7YX
X-Proofpoint-ORIG-GUID: 1-F1cNeqRV17Qqx27MB0bnfzrC5-D7YX
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDEyMiBTYWx0ZWRfX11W3MIpzNeCv
 cMJb3MsFKVnd89qdyDs/U84E/mg4aqltdBfrelqiF5CTIAYxUGTeZJpAdtgpTbOfP/Av+uSyiT8
 5VAU9xWcr0qL1zU9pBXo7X7HP882478=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDEyMiBTYWx0ZWRfX5rGwntUtxLSZ
 /YNjBUeu9/h9i0NsPuM/WQG3dqE2HLETw0QF5atVSBsTpNiLZd9cnwpND4jDj+c1vV24KAzpfyO
 Iq8zIdutNqpD4CBzshQlGlkJusuGML3JI9FCiOfbQRP95NX0pI2d3/3kH72tnEmWmo6WrkBuEvE
 fMVtKqIAuFMm53Ey6/tCB4c4qCF8tBmz3EYXN7/BngsEAWG95vUDQkdPsln/5RWCoIOBHfkHZJS
 zDrJIoUX7LBvMRmlzBbs55c1w+q8xPAWD1jix2VcO2lX41jAC5uL5IY0r3XzhqbI48WjOhK0XtN
 AD1178gkAZcBhBs62krdHcHQ5fSgQwn94CjU7v0JaEX/diug1STkg3Vf8yOgVF3LTt68+035Xp+
 ydpBCN/9rpVqfkv2ildt50h2HeK63Fwzia+E/ry4LATz1w82CPg3LD9OzBlj2IKs8L+avEs6vss
 Xr+EOHzqaUVi+mc25Yw==
X-Authority-Analysis: v=2.4 cv=U4Oiy+ru c=1 sm=1 tr=0 ts=6a6e0ba0 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=gZx7o9k1dQs2gHzPI9AA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-01_01,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608010122

Changes in v2:
- Fix stray blank line
- Collect tags

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
 35 files changed, 1165 insertions(+), 406 deletions(-)
---
base-commit: 59fca6221f5572ee171ec977df75e347bf18a9a6
change-id: 20260726-b4-dts-coding-style-strict-70f4df3789fe

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

