Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFCA43064A9
	for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Mar 2026 09:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772701776; cv=none; b=pqaCV/wyMT1JzOYX/FUntl0NNMqDcJMP/zDi6YpWGWzbg6Bkx+s0hvahREdpFQoghORFH/kCtOCxyzTyaPSex6DTrKInmwL9QGk1wVPHlCmr58CGS/Cw2Z/JYqPHCffKhxUGmvK1xvhqNfrwAZFoYc/1N+t3B5/9HzJcTUlXInA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772701776; c=relaxed/simple;
	bh=ai5g8g0+adsS6IS2Vp/pH5BD4m97fOakeCHE7AL2bMI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Annp9mWgb+PGhhshh693KoiPjByqpDUvFulTkp1AIvV2EUC5/Edqo8eJvKjMOPpcSJADB7Zt29/eSZFGT8HosvPhBLMAD7+IaOO1IsBUSKnpyR6rEoO3UgK+kg9r+BGJwn4zGFtTyxyWocmmTJgIura+biTz/6VLanjGiSd/pjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K/6Q9TNy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U0TeJPmV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K/6Q9TNy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U0TeJPmV"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62593D1F628725
	for <linux-samsung-soc@vger.kernel.org>; Thu, 5 Mar 2026 09:09:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=O1e/WtirdtbqhjjpDNbqAt
	Xh4FvgzuNdXObhodxahv0=; b=K/6Q9TNyNKLtjRnNnmPU1JR3k2UXIabC7yeq6l
	ERneT2k6JM5E60jWaK7rIzZduj2H/mFRzAY4sepAFHuLjJxN4Hil7chxOUEC1qPj
	KrlN5/HOZGvyYEBGusyKyw1/pBhrDNbLmKis782Qr7Df+myEjYkeQm8fagleWzhz
	NojHbJGyLJyJn9+xKoOyojw4g/yaT6L3jDYQhwiRp2ne+eKUYx2cuvlxHm56VLS9
	at2SsdfVRlwnF/aSap2fWDSdZL7u17d1AsMIlFA5seQkVFNtWmTIku9t/wrrAkl+
	RGMzaAzSmOxFDKgKrupLQ/Ll3N8cIOmXvR59GwA4518ZoObQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cps0m2n12-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Mar 2026 09:09:33 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89a116bf0f8so157389486d6.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Mar 2026 01:09:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772701772; x=1773306572; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O1e/WtirdtbqhjjpDNbqAtXh4FvgzuNdXObhodxahv0=;
        b=U0TeJPmVQ+mHN7S204dHKlzhJ0GdaXejxYtViuOV0eveD+f+iTwbShgX6zBmbQOHhj
         kErK9z95V9qZk1xVNdeHAeD3/az4jDKyctO9Bnp2TJ6wJ/K5UYMpakSFXXbNhzR+3n3H
         LB929zKIOK7YoGimyiBCcDCQmpsCJ1MrQkVWOUobj+QjlzeRJfblVIeIQRAZDJd2Qur0
         kWmBbpTEdVoOu2REiJzPF2zV16a2lLT/lLLQfIoSeXpTI7teuhIdA8wz+XadGVURbtaD
         eG6+RI9EWE6ekQMO2YA4JxXGFe2kFc70RCpba2LkEW/mE0HxWgAsNetg2+vzfMh1m5pC
         Unsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772701772; x=1773306572;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O1e/WtirdtbqhjjpDNbqAtXh4FvgzuNdXObhodxahv0=;
        b=NZ1qcbHzFJ6V8c5f1eHI0S/tzYWMDeDD5SML8An4J/06wtsVZzJ/dCcmzi5+tHO7q7
         vuFo60JYcdTqObUFL3psoruYxnt1B2x8FEZDi3V9LFsFvBRBosGc/PwO9ZXm9AW5JCFQ
         DAktvHI9oV4zZlQGAE1uuKgvdk21RFa2vDlyx6vM7VNXqYn1u4WN3+59+4w8aN6o7k5B
         YVb9IcmLcMwCtatUxuJiuNj4PlNgdnsLSdhWeOtD0JzuS6iURHEpi1pc7vFldMlILXcs
         UeYXmHMax2U6tFjuqdRXszjgYllJoHRHA7QLZYE750VW1NvSCRZsCVFA5xUBOT9FU46/
         90yg==
X-Forwarded-Encrypted: i=1; AJvYcCUWLBHU3AbluIYikbsBri2tlBDK62VvvR5mFwYt2FuNn05V0aCsmwAxDKSLi0IJe92jFNW1UI5ZqflkXvI81v2CHA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy04dqbFiFHuxgTDccS8fJnGSdAu3puhMi6oSB24ueZSgrXv9ye
	ZYb5jsC+iCv2cqUtF0YuuzWAsJGHzUeYHihGVYXxtxzh7W8kBXxTpitJgxuv7ncs9Y2iM3hGCQ2
	tD4ovq/n0YybulRUHQDK1vqYTVTTB6kYmRcxOQUUCsTdocwxWBWKjyJOF6nlyQGGzn8ZbAJWVSQ
	==
X-Gm-Gg: ATEYQzzQl5A97R6QcBYp9iTtF3AJgpbspnywp6VrIXKkMCvnjtuQjRVV2aYclUSbpgx
	BySGw2gF5yy7myOp0a5aOsTrbOde5HfwSam/Fj3rVTKb8WKB7pckQEoc+pkAC2P1I487D4SbVY6
	Tzium5BvZ/nLICS0mkRtJ+e44GF57ZKi6OMcnBFd2Regb88ZZ5X6bgfGJSQoAEnmffgzndUCCMv
	ChWEvRj7vOtC2eZcORiz4dWVS3xRd4yjKlti3W27Mvt+eSOZnTJeocVxwt3L39gRLuT+EZsly+n
	QIAoTkL1aRjZvNZ8hLP6rAx3ZopmuTs1nsiIq+5ngK4pwxyQGxIPNpwvCIGuy0yUa1P0qTbBVm/
	dgyk2wZqey9DhlWnRNp1CereHJcoXvDfxccr5orBwSEXW
X-Received: by 2002:a05:620a:40cf:b0:8ca:33d7:8be2 with SMTP id af79cd13be357-8cd5af96737mr662781285a.54.1772701772121;
        Thu, 05 Mar 2026 01:09:32 -0800 (PST)
X-Received: by 2002:a05:620a:40cf:b0:8ca:33d7:8be2 with SMTP id af79cd13be357-8cd5af96737mr662778485a.54.1772701771688;
        Thu, 05 Mar 2026 01:09:31 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439abded86esm38817703f8f.6.2026.03.05.01.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 01:09:31 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 0/5] ARM: dts: exynos: Cleanup I2C address-cells and
 size-cells
Date: Thu, 05 Mar 2026 10:09:23 +0100
Message-Id: <20260305-dts-exynos-i2c-v1-0-2c8d3df3b9ca@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAENIqWkC/x3MQQ5AMBBA0avIrE0yShFXEQtpB7Mp6YhUxN01l
 m/x/wPKUVhhKB6IfInKHjKqsgC3zWFlFJ8NhkxLNVn0pyKnO+yKYhxSt/jeOGupIcjREXmR9A/
 H6X0/o2yhvGAAAAA=
X-Change-ID: 20260305-dts-exynos-i2c-07fd82c55040
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1571;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=ai5g8g0+adsS6IS2Vp/pH5BD4m97fOakeCHE7AL2bMI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpqUhF3OzzzFwF6cCEKB9NbNfqNWY9/5JFjTYUA
 61Y2ySXPJmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaalIRQAKCRDBN2bmhouD
 1xJ3D/0Z3alg3ADG4aiPfhsMrJrOgxsGDZ63CltQik+60C23WOkmypdnYBEAPq2zshzqa1BNUiY
 fdUK/DDhBpKSwUkzYOynhjaKw1o33quRSs8i8S07gOeYopQZA8aoffHzxQ/urA60KuE8EdjKdUv
 zS7aKXVpGRm8GmcBeHf2mNBElHTd2CeDQLJ7HUnVpvS2MCKOf9MmoXd/XdmfCGZkb8S91KPq5fi
 co0jkF/YeTFKWkoM0eH6jShFZ9vMBIWuxgmm8+UhgqCoCorFYbD9+E43laUhgnJiAhBCDmRzxcv
 3oXdA2nYZKdYzYFA7Ao0nmmqjAgJr3uRtXRSs+HroRtuR8fW66zsIl5DMwIfH+jFTomNV5V0Mby
 741mEeQhiel2731qL3VN7Zd/kCIoKWbHBrH/wV6LUY1F53Jktp62NcKRnP9/hM//FF8w2vG5y/d
 fy1+G2QmCKcl8QUpKpCSqSWhuFb/11CoNUiUNp8VoooAHPnGbaVel3OmCVMzvScJ7lug8envMHQ
 0QgIvBXyojkCRDElRcgU2QVV2Ood9sCfVdb+PBX2MbiQYAHvwTYh6pJbMMSuA4oqLRAATPJRScJ
 i7BdO/26B4FPjehgvGqIZWS520FTnD0BvqDVRm3OFA5cmybjntqmh0fsQPp2aqHudjKWXdyZEt9
 ISMBbi6w0cf+Ulw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=e6wLiKp/ c=1 sm=1 tr=0 ts=69a9484d cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=_sLVMVooNu3QwFCXD4AA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: c7gnpPOAEhFhllQCX6A8s7XdTlTjGrYH
X-Proofpoint-GUID: c7gnpPOAEhFhllQCX6A8s7XdTlTjGrYH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA3MiBTYWx0ZWRfX9fwlusEPoxqa
 l9veemlBFW4CHIqhVnljNKA6QbV0F+9QTxxwG5npC6WTEuBP8GHZBVHO1OXsc4HBKy0j/FVTAbv
 sm0u2stpsQTqgePHBbQbTMsRW2USdhKq/uQyBJ/i41rpAYJ4bTa12kxAkZ5/dOw6ulHPmH+0Jif
 RwZAI7h9hlgCP7WMAfoqAFVgdXEAlR2lcSolS1lWJZc6MWGHtUSYtlZGBuMT0kWVAnkncXNJfCj
 mdSeagrTux5w2GQWd86MyANxf61SSMwA8ZO6Sji8fGF4s3YvZfBSPk8spNtrEe9vU6kfwg6H4n7
 NnfxwsqPiYhM4Dd0KlvaxCaExfkCsRW1LrizzZHUXJW7ygJdERVoieuAWWjEPCxkcxqVGG1unN5
 zdJWQ7iuO3Srjeij25N6n0QO47uCwmYprfMDIXzeZMe7jMzIoCGjbvRIgPRPjPDGsaEEb+TIjOj
 swCVzdwi2gjdZ3b6NZA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050072

No functional impact expected.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (5):
      arm64: dts: exynos7870: Move I2C address/size-cells to DTSI
      arm64: dts: exynos8895: Move I2C address/size-cells to DTSI
      ARM: dts: exynos3250: Drop duplicated I2C address/size-cells
      ARM: dts: exynos4210-smdkv310: Drop duplicated I2C address/size-cells
      ARM: dts: exyons4412: Drop duplicated I2C address/size-cells

 arch/arm/boot/dts/samsung/exynos3250-artik5.dtsi   |   2 -
 arch/arm/boot/dts/samsung/exynos3250-monk.dts      |   4 -
 arch/arm/boot/dts/samsung/exynos3250-rinato.dts    |   4 -
 arch/arm/boot/dts/samsung/exynos4210-smdkv310.dts  |   2 -
 .../boot/dts/samsung/exynos4412-itop-scp-core.dtsi |   2 -
 arch/arm/boot/dts/samsung/exynos4412-origen.dts    |   2 -
 .../arm64/boot/dts/exynos/exynos7870-a2corelte.dts |   9 --
 arch/arm64/boot/dts/exynos/exynos7870-j5y17lte.dts |   5 -
 arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts    |   6 -
 arch/arm64/boot/dts/exynos/exynos7870-j7xelte.dts  |   3 -
 arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts |   9 --
 arch/arm64/boot/dts/exynos/exynos7870.dtsi         |  48 ++++++++
 arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dts |   2 -
 arch/arm64/boot/dts/exynos/exynos8895.dtsi         | 128 +++++++++++++++++++++
 14 files changed, 176 insertions(+), 50 deletions(-)
---
base-commit: 5665c3a48685646320635b46081350191cc67e18
change-id: 20260305-dts-exynos-i2c-07fd82c55040

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

