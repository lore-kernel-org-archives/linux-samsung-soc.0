Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D50C418340
	for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Sep 2026 10:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789121987; cv=none; b=AWthAG5gedHBoxz30FceNYmmq80yIdnM7iwZVCCOH22b/1G1Y+9lF67/Ysk5299TLKafE/8VI/ySQqKgJgOnvt8z36xq9QkwwYaduAXTmnNJ4PnG8iGdu/s8L/ItSl28B+2u5AtfeauoM36Gi89hTjyBVH6MbjqbL589f+xEpDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789121987; c=relaxed/simple;
	bh=4/bxEzNRfD38kLZUAytlEAXN2P69ZTTdcIuMy3hnWPg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aMYqBLw4qmU/ssVHpWYXoolEDEVEnN1NGYwLc1bIU0cf6svjfLLMDNyYJ3ddZclO8NY5xbK5+QW0pPSbFLno3aHcelnqmOdWlmXGBA6AydQIkmoMVQtjGZtBoN2/uhJpm80zWgQW460m7ht6X8WlDHGHd8iktGaepQhcfuTXO4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=biwMUC8c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cGJtyJME; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="biwMUC8c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cGJtyJME"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B9mX7Y3292272
	for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Sep 2026 10:19:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9BYqkYdba0fSx3KIqzIcW6XRTfi0bpmsDHS+Vh+05t8=; b=biwMUC8cA8y+maYg
	7EOnL2pVW+J1P7WYDxvjL+cmoIbOEQM1/k7on3RAnR1fkxXUqbPkDpUFEymm0MaP
	e/igzEvJ3fPjVyrwa/SAOJBFZ5kX92ibqQl0csc6rYEjMgdiuPGJw32s77dYciuL
	gevYXpQ/8w+DBygNQ5XNMBzU0399wwZWURYdVsIT3/omJXQw6XO9d0B5UKoWsbJ5
	yxm/l82xyWn/kGsEZ7R7a1I2fijEGpbW+7kdglnuj/RW65M+Qd3B6JpHYgaqBMLK
	nQwX9+5DB6q3wmypzP1O6DRr7miMs19kF+8J/4kYY9guyKLkTuvDDa7KbWi+YKQu
	SX6yDg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmfbbg3vw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Sep 2026 10:19:45 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e820609d9so106634985a.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Sep 2026 03:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789121984; x=1789726784; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9BYqkYdba0fSx3KIqzIcW6XRTfi0bpmsDHS+Vh+05t8=;
        b=cGJtyJMEwhlP2dr2NlTc/qtN9HutS/Lr9IC6pq7LNSjjNAGPp0RehExu9EXY1I6Z21
         k4i5NfI6i2JiDyBEYpjvtPUSo1ogzJGZfssMKWNzIEZGbO8BechuXAVh/cgeLq5QmYwS
         ZMdiLdtIsjcS/TaXc1lFC6cBANWveuJyzkw9KYnsEP7BTd8cldyDMxUbXEbPzEXjNHtG
         KJ9eg/KeCyFJmUO/LlMD5KbvVl+PmiTqSZlfNagYQPdVqxewYsTF7TU4D4A4HsQ5Ymey
         cXQWqkkh/AqcbE5A6majonWGGWCNB98+n/PwF/dt4skiSsu7yihgYlMN3PsHEjgNYLjk
         TmIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789121984; x=1789726784;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9BYqkYdba0fSx3KIqzIcW6XRTfi0bpmsDHS+Vh+05t8=;
        b=MaBnbjuy+x0+g+S3/y+iltwmTG2n/zSh42FdXotUg0dKxK36/jNi7r4lLzwJMSqx6f
         WPPKEZ/tW9flvc6ad5z1iBA4/p+nDbP6ycJCnMHcHzaAQu8d5AGl/oFszKt4r8DczTm4
         50uxtoyjj3lzmQCs15FjBjepQIfwtjKWb03IePLFbBMms+sX+p5g9vyX+U2HtEgr5Xq6
         iC6FIVhaVx0kOod2cDKJ8j6GdGzdUGBox7lGfO2Ln1P7hqq769Tf4KB6/SeFWc5CWNoR
         i+CT5fx+jCrYX+V5uzTWm3d0s1M/p/n/XcFuM0ELFP4aky7FEGwj8KjF8Lw4jeYRWQvR
         eGAA==
X-Forwarded-Encrypted: i=1; AKwUvBxGtLrb8g5WG2bgOvR4RCMBwMRCV9yiIvydIKdpMhZA+L2M2y9EOCKD2OPaoXpQ0iZs3gVXCAJnGmMjFUzpkC5tLw==@vger.kernel.org
X-Gm-Message-State: AFuF++kyoSh/a+1zDf99n25yGCB+IaBA1smyWRhtQEapNUdIl4/+HA8x
	0wBmDBXxBev1RionPxpvKNB2jTJMYG9tE9iCKtc0AMuhk8xDdvkDNt1tz3DnbRGYlQ6c3tdqTtM
	8RqDqptw45YfVqkfcPqr7rK3slKVOZh+Hs6jFUyixt7IXWBkjJYaxcNUGXpOjlv+L+Ood/cNuqQ
	==
X-Gm-Gg: AYBFou0p3qnbQuhuDBmfWmw4lV3Hd6wf+19GnKL5NaErTW4DJNJBFn0h25wFkbcVqyy
	ElhlS1haE7MFbDYXZu5EeTcPy2w2SDMwO916JUY9ZKgj4RGlojprePfYV+5c8z9Yedaugizxkqk
	D5Jrk/iHbIlOnnbUPtSfDRGJpYO/2VmneSBLVPDgg9/tqq1/i1Abht+JvkGGeupCSnzlw0qU53k
	XtohVyGtD4eZ/SsC+crXJ82ORpr7/6AFeIcp1IUN7fcgA1t4fK68pkwBuR1/GqoF6/MhTAztpOO
	/YRDFN9WsJf4Zx8hXrXg/VSsQjgz7gihkXrDjTL9fMRs7ThuQV5CZEqo9xpT6WOhxC3b2fQJssm
	20E97/eng0+4jZVacjXffUBY=
X-Received: by 2002:a05:620a:258a:b0:92e:76a1:96cd with SMTP id af79cd13be357-939ea116ba1mr437141985a.13.1789121984376;
        Fri, 11 Sep 2026 03:19:44 -0700 (PDT)
X-Received: by 2002:a05:620a:258a:b0:92e:76a1:96cd with SMTP id af79cd13be357-939ea116ba1mr437138185a.13.1789121983950;
        Fri, 11 Sep 2026 03:19:43 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6576122bsm41989585e9.2.2026.09.11.03.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 03:19:43 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 12:19:13 +0200
Subject: [PATCH RFT 05/10] arm64: dts: exynos2200-g0s: Drop chosen
 address/size cells
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-b4-dts-samsung-cleanup-strict-continued-v1-5-9aa55051c42b@oss.qualcomm.com>
References: <20260911-b4-dts-samsung-cleanup-strict-continued-v1-0-9aa55051c42b@oss.qualcomm.com>
In-Reply-To: <20260911-b4-dts-samsung-cleanup-strict-continued-v1-0-9aa55051c42b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=826;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=4/bxEzNRfD38kLZUAytlEAXN2P69ZTTdcIuMy3hnWPg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqo9WrRHGJwXN8rCf4lNv6t7xS13waOOMkDbARd
 KPipdvvIOCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqPVqwAKCRDBN2bmhouD
 1yEZD/460+dzCxjLoRp6UE/QsKNYguHwHVVllIEInUBQ8EOFFnSMwv3wMcwtoOs4dBMxzj1ZFPG
 kPnXv5dZd/GPaSD2Iym401ZzNF15LVL+SIudgO4F5T9UP6J1WOvw6G8MW6ILfRnz7xjAzXLrYNN
 ekCtBV17gywgwUlQTa8+8bktbBvrGPw9zeukiYhSXh5CN1+wHZYxxIZgQ9WqA5xQNKrVA+f8/8F
 cDJIMe/IZvMhXVspuQtMZ4kN9QPAieFUZa9EY7LqaVbP5nDbNi6NpINPk5lh3L2g8J02O2PV5Oo
 /DycinCNcUr1d4i/vPhBAemlS1luqAxPjEKL9BKnB2mMs2H9knhCVMdPMUYus6AFpMYP+lPYvv2
 QS0sHZkLh9y2HKB9la+4xH37QhM//48BcQ7hM7Jjs9K2fNUEV/YCzGgbg4TXliYtKe47t9cygld
 X3+gLhLjhFp2Ra88yj9hD6V3bU/3pgTYwuvn04SEW9p7lYYDC/v9OqkrjKOYxgOpCHFsnQ62BG9
 ROjS99tla4pqG54rk5xtf9HydTQ5aORDi63MGavKUCV699MoqnM+mL1R8/5xznKpmnoyyGtldSP
 DpsQOk/LIDAgRx9HFebFJTGSm9NKEn9jiAz9z/0G0KHjzhw3kgVVG1d9QmGLRvz/8a5TGXXNxiB
 TwuJAwUvBVhA3OQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: KNcE2IumTYoI-0oAZruEgm1Ou_r5HBDS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDE0MyBTYWx0ZWRfXyJ5H5DPAQHtv
 sHw9ecmr0k5P3c0DTSgvxLooISUaTLvjfAlM0deeEiw8r2+6jkE886CSLpC5GgCFnWZS23Nxqer
 AFrM7NSPtrIIXfjAlmD7v7p1fQaxIdODeuLXAe3CFPiuj18fLULttOgC8a3XuI+y/EbgSMpFxdQ
 +6LfXFR/NJoFM8gKxV6aoPelo1f2PzVoyVgPBmcgYYDRRLSF5AkAf9Ef9cFr7dXvczt/1O8i7v1
 TGwrrvbw042yK+aMwuCJ5wPAstb7gOL4i/CFqRlVhbNyjU/zr7JDXk+LejY+70xAJ4QEiQnJ9Mi
 1QSXC5wW1qqd9ZHR4tKt7lQvoP6h46xdstjWaOm05h1KFNhOIB1TgWh/n+rC/vjibbJcQcNtsO4
 y4I3b40BMm5h02ZBylCSv6W7TLTHoPLzZ0DczHasPbXcZ1wGB4OcBNSIGB+4Ur4WQy/UlEo4BXh
 O/UUYkj8SxwPRLh/Adw==
X-Authority-Analysis: v=2.4 cv=X6jHu2Te c=1 sm=1 tr=0 ts=6aa3d5c1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=hDLO0aQh0UWOkkj0oRgA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDE0MyBTYWx0ZWRfXyLGh+SQbbaRT
 kQhsgsjRvCdcTO1XbaCXYNZS2YZ0rP0jbNbqNJSLO9zaKUh8wmTU507uzBn8ryHy596jC0k4LxY
 R62rJICo5CIPCwNeLz44mHEu4fLs6Iw=
X-Proofpoint-ORIG-GUID: KNcE2IumTYoI-0oAZruEgm1Ou_r5HBDS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0 clxscore=1015
 suspectscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110143

The only child of chosen node - framebuffer - comes without reg and unit
address, thus address/size-cells and ranges are not necessary.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/exynos/exynos2200-g0s.dts | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos2200-g0s.dts b/arch/arm64/boot/dts/exynos/exynos2200-g0s.dts
index 458f1bc6f5d0..3687bbaadce7 100644
--- a/arch/arm64/boot/dts/exynos/exynos2200-g0s.dts
+++ b/arch/arm64/boot/dts/exynos/exynos2200-g0s.dts
@@ -17,10 +17,6 @@ / {
 	chassis-type = "handset";
 
 	chosen {
-		#address-cells = <2>;
-		#size-cells = <2>;
-		ranges;
-
 		framebuffer: framebuffer {
 			compatible = "simple-framebuffer";
 			memory-region = <&cont_splash_mem>;

-- 
2.53.0

