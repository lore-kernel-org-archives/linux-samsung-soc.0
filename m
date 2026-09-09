Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD2A56E05F
	for <linux-samsung-soc@vger.kernel.org>; Wed,  9 Sep 2026 14:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788963493; cv=none; b=IIbkCc0lpqFp+m3JkbNHiq1Dq8UzIm/I4QoISc47stD8ojbJ/0RwxkC1g4x0kBlkUnzrSMSoghBr52g9Q5BttOpS2HYLWHp8UjvAE0zTzB0+yWv/1CsTJJxgLZjxzlMe9K30giO8RScX9SzMbJTK+9I6+8s60GpA4vzZA8nn2J8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788963493; c=relaxed/simple;
	bh=krmELxqcbgXM6Rh62+xctNQkB1QdY6zAahtn4he4JiE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c7qqH4lKl537lowYlvgmajpjM/f8ony6w6pytn+uDCXGX23Tio7i5nMaVXNnaOXHiAj/R1x0LmGzB5K8AIzKL2X6+gHKJHu13m208s2qQguoHEU3lNmv3M0WitoSrgPFmSG7DC1bUXpV7hR1AtUUOKFHqzY8V0JxLsITntt6Ac8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HTMUhvzM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dqTsVFNa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HTMUhvzM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dqTsVFNa"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689CCwhL3053123
	for <linux-samsung-soc@vger.kernel.org>; Wed, 9 Sep 2026 14:18:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cWTatEHafDXueY1XxxlZYx0FPFC45Kke80A/W8Kc8sw=; b=HTMUhvzMXZ0j3YmC
	bPGSLVP1p1nVZ3cvPkaQVDLucKy/thmkXWUbQ9WpbWzEu/AtPObtC4GPsJccaqDq
	3zscu4A1wHPvPD4dyVzU5qcWEnzvH6+zbHc8lTg7+nI06RehQAR2XRSZVYc1yag3
	kKdyrPSVHGi7xfYowG5hq4wtx4j3nXEKFWZlJpv8EHw36eae/CQ8Y3HuwJzFRalx
	NQFc2aYw0OOz+RXfgMDhnNUWV3Mz5k9PdtKdv+5NLy/VyGlRtFxNZqivCJcaP7QN
	ODIbjKQN+ZJS6QkcYPdBpf28yAXshq0R8yWJ5uhB6ZOwq3SXJ8n785VkXdj19SvG
	dJAl4Q==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk7920hub-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Wed, 09 Sep 2026 14:18:11 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7847917c402so4077973137.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 09 Sep 2026 07:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788963490; x=1789568290; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cWTatEHafDXueY1XxxlZYx0FPFC45Kke80A/W8Kc8sw=;
        b=dqTsVFNarblN3HrboaW+y5Y2onJ8QbtxK3pqj9s0kbKs/MWASRCnn8flBmGP1Sgfm/
         V6rShplg/Z/N4C68+WUygozYM/zvugh8c2yPj7I4UzZI0EHERfEyuuraplDfNy1RbGtK
         bLTOJsalNtsjUUk3qSkS+0LPuvmp5IoiJ2vo8Gt/MJFKQ5tJ5MPxUGHZKWtiEVxP8hGo
         zSg5ou7yzmcZ2mYemfM/Gz2Xei37MBiNmmxT+zvVYXeoDVsiy3fKs1Thc6w65VfEyTRE
         KnhjczqJfQhViEYXBcrvb/WH3dPLLhlR9p/zUwCBCWKj7+2kpgp21AmYssbrUD1/Rotr
         4aYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788963490; x=1789568290;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cWTatEHafDXueY1XxxlZYx0FPFC45Kke80A/W8Kc8sw=;
        b=hhwY6sz6VM+39HVWT4ExpWQ3kE4WaJTp8EVQHKiineHCYkVR0RYcKStaS6jD1ucPnm
         k+baFrg7yzzaJE/gVQO9hlUtiol56O8FTIyL9X06h7nt18n0RZYGiv/bxFWehfYyGa6L
         Q62V+UZOx8nCHrHpsC5a59EDlCeBpUvVNFEcyqHwBquUvPZmbhQlKND3/f6NDWB5JX5D
         gqkO4fiPOd2LXAi++5Xa6xh6M7CLgZJ3JbPA3bjOO6a4Q4kn7oDvUZe7UDdiNLgbLgF4
         rIHS+z7sxRVBX4FOHd2Q7yMvdFygF89VlPMjv0YOUFukNTUt/VuCDOcpVBN6vcEiXwyD
         siPw==
X-Forwarded-Encrypted: i=1; AKwUvByX3kkA1pvvSjanB0qAY8SltHNrSzHhM3iPXfwQbI62laH/p6+C6CC96kT57arR4z/vYewFxDTsZjugD/kWmmlZdg==@vger.kernel.org
X-Gm-Message-State: AFuF++k4el1lsMlBR7WG9gnL73g8QgxQim0A8/SxTz9gvMvCrHQMh8ig
	GT/UYqT+LUBm7NOtDLRQLhygWlR/2DZaPM/UuXS1fNWMUKk3scLrfcI+g5wKAEDYDAp2E8u9RxE
	58D8sR4+heHdKbUiRYb7uq8MjK59Ll2bJHnVMc3OSNfQh6NedKoS9e2xIUWQbhKoF6OO9jGnEhw
	==
X-Gm-Gg: AYBFou2jzYCI5FgkGomQksS4NF+V/yZB3dVtg5Cq74DBPo9MF/oQaN99FEALw1wpNNt
	riIaH+R5/ExL/WmLAJbbV51FHW7B6sq94vX07HOLcVc//fYjGKzSpJrNLv8WPfbSCSgsGEkTHsq
	KgP6nKwle4SsU6L3NNvr/yDvjRz9QHsxKG/YPjVddEdXd0M4tvPYSsZCtfTJoLkOI8ZE0GYnfmf
	EzylRC/WWK6JZi3jiZGRoCIW9dyFM2AD2QumlKjD9Uz7MB0nNkaYMvvSBx2kqyaxHbNIixwwVuu
	EgDG96N2l6Uf0JrucspzKh7NQiY+MkMJx1qo94cWeRuk8dIheH/T9kFLvBzppbu2sXQAWjBrrCs
	0Lyq9LURbEbTDozEqfjo3BUs=
X-Received: by 2002:a05:6102:1481:b0:784:b9ec:9144 with SMTP id ada2fe7eead31-78a4a9c3a45mr18051703137.8.1788963490392;
        Wed, 09 Sep 2026 07:18:10 -0700 (PDT)
X-Received: by 2002:a05:6102:1481:b0:784:b9ec:9144 with SMTP id ada2fe7eead31-78a4a9c3a45mr18051663137.8.1788963489968;
        Wed, 09 Sep 2026 07:18:09 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c293b6246c4sm77581766b.20.2026.09.09.07.18.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 07:18:08 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 09 Sep 2026 16:17:54 +0200
Subject: [PATCH 3/5] arm64: dts: fsd: Move idle states out of CPUs node
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-dts-samsung-cleanup-strict-v1-3-1b755a446b22@oss.qualcomm.com>
References: <20260909-dts-samsung-cleanup-strict-v1-0-1b755a446b22@oss.qualcomm.com>
In-Reply-To: <20260909-dts-samsung-cleanup-strict-v1-0-1b755a446b22@oss.qualcomm.com>
To: Alim Akhtar <alim.akhtar@samsung.com>, linux-fsd@tesla.com,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1679;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=krmELxqcbgXM6Rh62+xctNQkB1QdY6zAahtn4he4JiE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqoWqUyWqqT/d0ZxoDFOe4+dUmzZ6rWpAp8gavL
 ig+4Z626SyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqFqlAAKCRDBN2bmhouD
 17vTD/9vzZ1YWIkoCQp5SpnMM8IKibI/4N8y5ntA1s60zoALRjMppWICygInruoxeK23W9U4tWr
 uUbfPlgNDMLv2ahrHP6kmX9pm5cht4G7OnApSWJ1YbkaqA9/1OKV40mgFWivUPrmXr3I7z2iBHN
 7nj3oUyVloTfIS7//gUGPZjqoqWeP5G/uKEFDX8uPdwQ5+6e5RFh7GOSX4WX2KR9uc9yUtlikRz
 fP0Zo+GSRCuj7aHVGa37OmInjclbURiS8E/04KHdqOQnhJwl7/y0EJRRVSApgVCSHL6yDiIMIhN
 w02i4M2z1Rga7tj0DkBMOFZ8o8i8kj9k0kfhg4PPznZRPZFOMwLTNgE3q588QsAK325b/JiI05Q
 ABa9qWnV8QEgbOX0IqbrntNkdEqs7p9UZ2o6SIxVM6Uo2wPdVlEffyfrIl7VI1+v1UV7c9E2K++
 mkhN+euGsEp+7EbRwu5orNASuxLdcAnNCyvvaB6V5KaK6K4BilistdRxoD1TIm5peWYv0EQHYv/
 xgfEu7QkJ4UUemeUmTtD3JpE/Wn/NIi1B9rutra8JlAkPypt8ZSFmgvWgC1FBrfGj9q5sXcKwZP
 r9MpSVJD8p+/qx+cZ/uj5HTT+J+KoGx5eAQLS9tXtFw8kELmipHthKAvJXcVyul/Hq04KaOMLvx
 29JewS4yEWH6jMg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=bd1bluPB c=1 sm=1 tr=0 ts=6aa16aa3 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=VnK6_ChGKNcZOvS6CbIA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE2MCBTYWx0ZWRfX2lcK5JhtyE0h
 qLZKJ/s2TsRQSzCQw98cixnBeQuMDLz1NnX1cXZbdNm16zAvSK2sXdbSfwsCbNUZM3m8ZZ6lnMg
 EDD2CiLPzwM391CJgzznIGFxYcvCrXJCf67EVrv84qKwT3z/rO6m2DspNRydqsdGlpeYzA2sNOe
 qpJ3CBCBsxLGAHQ7HbjrKpKV2Dny/oNTnU4OxfEk4LqHUVL/l4Bdes4GqNWEzVy497qHi3wUCMW
 QJNlSP9f3XFkxJvoooKmqmN6PIu0aWJbKfp4J+8fdQwjVVZojAHeLYNj5/u1rZVBAgkP6Ijy3V3
 nxCLZUZeos6HTyqIdn8XIln1eVP9CtE62+WLbZuPoY4oI0sI4/7Bnru2ZSMoXckzgFOfwMSSl28
 8y0ail1EGh5uU+YvBQ8j3aMp4nd7KBgM705bp/YgFm3r2uPjwBiNS7MZHg2Hzg9CoxMwQbQl+5F
 fGovib0lv397T93G3Rw==
X-Proofpoint-ORIG-GUID: SMRv86jt030fqSfMpz9kzat410FPyUfM
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE2MCBTYWx0ZWRfX2oBQFdUe9MyU
 TzWNg8PBexREVTnYlvjVXrpXqbq8K/9a7orDlfz8zI7dFgfvjM6l4JQ+OTtjukKRp+1YQjNH0H6
 0xzP4HN8OR4szLVVD3ESDaqsJV1V4fU=
X-Proofpoint-GUID: SMRv86jt030fqSfMpz9kzat410FPyUfM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090160

Idle states are not really part of CPUs, as often they have domain idle
states, so move them level up to fix to fix dt-check-style warning:

  fsd.dtsi:300: [child-name-order] child node 'idle-states' out of name order

Also, re-order properties to silence:

  fsd.dtsi:305: [property-order] property 'compatible' out of canonical order (should sort before 'idle-state-name')
  fsd.dtsi:308: [property-order] property 'entry-latency-us' out of canonical order (should sort before 'arm,psci-suspend-param')

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/tesla/fsd.dtsi | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/boot/dts/tesla/fsd.dtsi b/arch/arm64/boot/dts/tesla/fsd.dtsi
index d076ea634f4e..acbe93756a76 100644
--- a/arch/arm64/boot/dts/tesla/fsd.dtsi
+++ b/arch/arm64/boot/dts/tesla/fsd.dtsi
@@ -296,19 +296,19 @@ cpucl_l2: l2-cache0 {
 			cache-line-size = <64>;
 			cache-sets = <4096>;
 		};
+	};
 
-		idle-states {
-			entry-method = "psci";
+	idle-states {
+		entry-method = "psci";
 
-			cpu_sleep: cpu-sleep {
-				idle-state-name = "c2";
-				compatible = "arm,idle-state";
-				local-timer-stop;
-				arm,psci-suspend-param = <0x0010000>;
-				entry-latency-us = <30>;
-				exit-latency-us = <75>;
-				min-residency-us = <300>;
-			};
+		cpu_sleep: cpu-sleep {
+			compatible = "arm,idle-state";
+			idle-state-name = "c2";
+			local-timer-stop;
+			entry-latency-us = <30>;
+			exit-latency-us = <75>;
+			min-residency-us = <300>;
+			arm,psci-suspend-param = <0x0010000>;
 		};
 	};
 

-- 
2.53.0

