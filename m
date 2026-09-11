Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D22A3359A68
	for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Sep 2026 10:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789121975; cv=none; b=NYGgeCBCFvT9e8mvoSCt5mz9YIHnPL85StudRdeDxb/WuK3WWj5/F7xmV2qxLmuZYLzumuwULKV/7A3vV2mv38kRVyBYgMYmxXPSDqlo8ZymcOF9QaHMK/DTmL2a9YUknGN1Xhg8JwZrrgVZGJ74TxNZmz8HB8UPllUlTxqwX2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789121975; c=relaxed/simple;
	bh=3l/uI9OLyqRLWrTfCZNHNfE6QewbrNbl0gZSzNJVuUU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=KYgN57hDACaBV+hY1k/nmb/QRAOi92pZuVzkF2L8YGI2hF9A1amCuh9EJV4vXyEXLGIjbtNKZeO4L5MbpHEXRaosk2j5sKz5JUCfn80rRpVrhGBK7de4Wt8f2b3umD70KJsdgmPA6EnxeJmPxYqjhe6xIM/6DS4I4ImH4P0AxKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YcbZadmX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SwXa7Cy0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YcbZadmX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SwXa7Cy0"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B9mc6H3292396
	for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Sep 2026 10:19:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=R0/zG07kT3QtxUbuc9FfqQ
	PsCy5wzyWfyugpD7RCpLo=; b=YcbZadmXsXRNqDu07utYr1TZ1lA2cW93AA0GNn
	iMI9d1WITg8+hYOpP7aeubNQVn0GQylKYppz4tBlla924JWC4+7hLDI/1jaZTKiO
	Pl6VOHPAXhY2ZVXBm/X+1So08jjYO2NL1CUMT45OHCvA9RxAnq4HMBbdCrNWc+7k
	xbFeW2HFpiVQhpE2EZ+0AGmJKnTnHRtMICCEnsU5FC3feIBzJbIzp2vHDqZq9Dt4
	khRJUmOpl3QcShy3maqhOmyD9GZ0jJsDXrZ9UE7MUyb+thrTMmZmSrZKVRATR44N
	ApFfbK9S7KraWIO90F3cMLhYa01s6lQR0RJ1SxFbK5eDXtIg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmfbbg3ux-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Sep 2026 10:19:31 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93903982af1so174064485a.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Sep 2026 03:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789121971; x=1789726771; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=R0/zG07kT3QtxUbuc9FfqQPsCy5wzyWfyugpD7RCpLo=;
        b=SwXa7Cy0XaS5s/WY+MxIidPgC4a+iZQlWI+6YKPg0Jy2wxxrwfereI53Iz0Uxgqmka
         SMIwUsmZZC7pR/iQdM+DmKnmGXPwvvtRCqFczhCzDCDAxhzVd9a5suvqM3NUGQrYmlBF
         fxt+Z8f/xzlNp46Tl7/Vx6CCKj2OQfxSi2y/1+Fs+EHgqIS16/k8DPYnS2QVWYib/3uh
         IW6/3PHDFlt6nYrB/LhErvffQsXSzHgiPJSIAPHHdFMlEAlOrf+XQRnizsIwF6cU4ajG
         9r4fU1vEALcUirgX/9bP9Ls7hJt3eg1GjAAmXKz4jt3Ww4JQcJPNr5BEWOndfuUmhtFs
         wtng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789121971; x=1789726771;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=R0/zG07kT3QtxUbuc9FfqQPsCy5wzyWfyugpD7RCpLo=;
        b=XYp4NjwDOqu7CqEM/Gir28a+3lqZMCh0sZRe4YAqTuYm2pZnnpmbNRIdv9O6copyVe
         tyLx8Haf2Ex9Jqw1RhfTxA8ND/Ev8kj5n5z67cb07AIPHmBcAclXgF1cAPwQNajEbCFs
         NCl91EZGL+kZhsXv1+81PfIUIxu4xuq49/n+qwRDKqBv+PzmuMYF0cXvc8wWUyw+OCVd
         ctGORTeTxJtB4AaN4K5zZ/5WS5oId/WxzC8I85EgiPIFzNRzM45VMRmR5DyC6zKslOS7
         90KSOJDhvlYm+5tLtbncpwaocjwwZAEHjNINlwoA7nJI24Fsiehl8JgaYjR8uY3ZpJUw
         uteQ==
X-Forwarded-Encrypted: i=1; AKwUvBy4VNjQhjMRPqEErLZUFJScM02Z/ON5XsJnLZZ1vIehL4wZIXEnJZ1ra0yEPVkw9VO/kgTznYg2J9u557yu/3pkyA==@vger.kernel.org
X-Gm-Message-State: AFuF++lFRODBdsi0FPJQodDk0dIMEWprGPu4DyB2++L7Zk2aHV0tjQ7W
	L5/udONypwpukhOGohXi6vArxg7qD/e9AnmT3B+e4hBt0EgPSolGGPbkgL7sbrkSBGASspcfd9s
	M/wMusluyl8Rfyfqv8Mg1nO5KXx1UAe9D3Ydhu4MjaJuh525a+qWhWgpvB3xoG1nCChG7Az52mQ
	==
X-Gm-Gg: AYBFou3WOuXa2oNmVKESMLq/YVYM/uwYj4CsXkNAs4Sf+kXnlTDfxu1jKqavBraFQwJ
	7sJQziIS25AT8d4X5VgoW9HcCIaI8DyqGScYRAkklICidPRuB4/by0RJccHfPBeIGgNkx7AVz7V
	ynt9mp2RsV9rm5UP9b3+DkUriMGSEhpPvH766PDkdluUe4wQ5O4UPTFqwPCQ87iO0GMnVdGUoja
	DNH4ny+DBYV/y37GgBBurMEZEF+AjOr8gKo3fOY8GH05TtolWNBdDG5PDPp+uPA4LmuDAbLv8mY
	m/FH/FyQwUM+BF1oqDpFFXwkudVHRuJxca9imj6ANdXyKq80L7X5HmekWCA1UUufx+rHLxYy7z3
	YkWeGYblBbo405MPdDXr4+3E=
X-Received: by 2002:a05:620a:43a3:b0:939:aabd:bcb7 with SMTP id af79cd13be357-939e9efcb3amr428010985a.26.1789121970683;
        Fri, 11 Sep 2026 03:19:30 -0700 (PDT)
X-Received: by 2002:a05:620a:43a3:b0:939:aabd:bcb7 with SMTP id af79cd13be357-939e9efcb3amr428006385a.26.1789121970317;
        Fri, 11 Sep 2026 03:19:30 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6576122bsm41989585e9.2.2026.09.11.03.19.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 03:19:29 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 00/10] arm64: dts: exynos: Few strict dt-style-check
 cleanups
Date: Fri, 11 Sep 2026 12:19:08 +0200
Message-Id: <20260911-b4-dts-samsung-cleanup-strict-continued-v1-0-9aa55051c42b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNwQrCMAyA4VcZORtYp4j6KuKhTeKMaDaaVoSxd
 7fq8bv8/wIuWcXh1C2Q5aWukzWETQd0izYKKjfD0A/7/hgCph1ycfT49Goj0kOi1Rm9ZKWCNFl
 Rq8IofIjMiThuA7TanOWq79/pfPnba7oLlW8e1vUDf+FcxYsAAAA=
X-Change-ID: 20260911-b4-dts-samsung-cleanup-strict-continued-ed8addbcda31
To: Jesper Nilsson <jesper.nilsson@axis.com>,
        Lars Persson <lars.persson@axis.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@axis.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2178;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=3l/uI9OLyqRLWrTfCZNHNfE6QewbrNbl0gZSzNJVuUU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqo9WkbigijgzSCRuQNSOIRr1rGuWGDT76rKNzT
 krVAAxPWjKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqPVpAAKCRDBN2bmhouD
 14KDD/9OZ56pJjMJxchjiHVJke89vPGIavObIaxQ+1RR7VDLzc79myeI6P4ZU0dHYhe5NSf9fLw
 gGTtFdVLbeD/nR24yar7reNktZz66JugLdx41t4Xt+3/xtfEG6KwTLAyqvXS13C1hxa+skschFK
 dH3tkdjOotbAOQv0eCBo0UBBjzHTELSs+EaUVo2dqGVXmmDTspnwlw+/Qf0NgH83W0W2E6i5rGP
 ycnHVkfwA3oktEEBcSVUAd/apH8FJsDpAuFn8/+Emix6T12POgq1XSraI6q89LOGWxxQajFputb
 IZUbdp9EV9NIdGvxrNkFrv0Vl7ZV77TxgqR1xr0O+t42oPPSoVbz41JN2PMC71SPsMJAq/3YAno
 j2mYrYNhaUuqONzgnd7AXKsGdKgd3MlVyOmi5O4F3fSk6I6XvT+fgasgnbnsgVsmfUHUT/8nRFw
 zpzQHl8s7bg03V7WhjF8n4jSZYhzMUZX0nz9ZzjTWwrf+dCYZbkz9iUNnOnD0BZvN07YnKKvsyy
 l+4y1hL7qmLG2mX48KmHS4eMyN2y/M+VC8lrfi92P3NdbJt0m0GeSQUDgXWKhMjqpKgLN5asTkQ
 xpPLfFA1ua0Lfl1ERZhKImrpqoii704bWvr643YQ7WAHHqx6YkdYHpy3hueJW6GcHgPPsFFzuYO
 NXw0hNehurw6m4A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: GO-9MQ-xwAHe0kbv-j5GcmE26dwK_SQG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDE0MyBTYWx0ZWRfXwaDCpmhTGS1V
 lTkgdU+eyTgJiStejXuPET2wFhapkftmuikf75s2kky9YVlxkzIFdJE7opq9uK3kCMxaP8GJyn0
 rCBTg0V1HUmaa9xF2agRMYzgSBTOLQIGO3H68ON3nGeQUXp3AsM0cOB7E9A3MJAIAPiOfEeoIOW
 XV5clU2kgJ4CV0vIxGIFIlgAzK80PmrPDZV+HdwEjOV7vHD8hUmLHP2EgbPBkWnWWzGylq78ft4
 tnnm7eg/6lTZI1u+T5imFXqZ3ZPPEPkAEKBKZa2pAspVMs7cBtkwTHRzF5+whtjHykNIibzOha4
 4sFigLMdo9RmLNhGMcNeFTfAOGejXlE9cnlN4zoxLmdFxhtqF78wge9w2EObHnJH1K5sAjfOWb6
 zKUE+xbbqcARVX9Jhz48fX+8EBTmd7GLs9aE+IKXh4w6bzVOi/kjcJiiOcCR3iFBKMN7U+sjrKa
 qvHGghO1VXu2AWHwDWg==
X-Authority-Analysis: v=2.4 cv=X6jHu2Te c=1 sm=1 tr=0 ts=6aa3d5b3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=qxZVzdGA1PWmyomorPcA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDE0MyBTYWx0ZWRfX6vAvLVYGuXHG
 J+Ms1Zhd+kKw4TR03YM28WI4DVHusCgmK5puoKVX5SXWCVPCX7jaglSbk//4Q5jqSK/cDa4w5G0
 538N9hmnz0h1SDCbgChknAUkLNdWDfA=
X-Proofpoint-ORIG-GUID: GO-9MQ-xwAHe0kbv-j5GcmE26dwK_SQG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0 clxscore=1015
 suspectscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110143

Not yet complete, more files will follow. I probably won't re-order all
Exynos5433 soc nodes by unit address because it is way too disruptive.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (10):
      arm64: dts: exynos: axis: Re-order nodes to match coding style
      arm64: dts: exynos: axis: Re-order properties to match coding style
      arm64: dts: exynos: gs101: Re-order properties to match coding style
      arm64: dts: exynos: gs101: Re-order nodes to match coding style
      [RFT] arm64: dts: exynos2200-g0s: Drop chosen address/size cells
      arm64: dts: exynos2200-g0s: Re-order properties to match coding style
      arm64: dts: exynos2200: Drop redundant blank lines
      arm64: dts: exynos5433: Re-order nodes to match coding style
      arm64: dts: exynos5433: Re-order properties to match coding style
      arm64: dts: exynos7870: Re-order properties to match coding style

 arch/arm64/boot/dts/exynos/axis/artpec8.dtsi       |  36 ++--
 arch/arm64/boot/dts/exynos/axis/artpec9.dtsi       |  36 ++--
 arch/arm64/boot/dts/exynos/exynos2200-g0s.dts      |   8 +-
 arch/arm64/boot/dts/exynos/exynos2200-pinctrl.dtsi |   2 -
 arch/arm64/boot/dts/exynos/exynos2200.dtsi         |   1 -
 .../boot/dts/exynos/exynos5433-tm2-common.dtsi     |  93 +++++----
 arch/arm64/boot/dts/exynos/exynos5433.dtsi         | 232 ++++++++++-----------
 .../arm64/boot/dts/exynos/exynos7870-a2corelte.dts |  39 ++--
 arch/arm64/boot/dts/exynos/exynos7870-j5y17lte.dts |  34 +--
 arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts    |  34 +--
 arch/arm64/boot/dts/exynos/exynos7870-j7xelte.dts  |  35 ++--
 arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts |  39 ++--
 arch/arm64/boot/dts/exynos/exynos7870.dtsi         | 108 +++++-----
 .../boot/dts/exynos/google/gs101-pixel-common.dtsi |  40 ++--
 arch/arm64/boot/dts/exynos/google/gs101.dtsi       |  96 ++++-----
 15 files changed, 421 insertions(+), 412 deletions(-)
---
base-commit: e224ecb509d7a636a89bebab8d47239f83294448
change-id: 20260911-b4-dts-samsung-cleanup-strict-continued-ed8addbcda31

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

