Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB7A4DAF8C
	for <linux-samsung-soc@vger.kernel.org>; Wed, 16 Sep 2026 20:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789591616; cv=none; b=LbGGzeZ0PYuQXxF4kW4ZXQhQJsON7isPLK0I88onqsV2+r9EZXwp8oyvYK4x0ZO1eUx4WU6krYJgH340XaGx919wG3FRuh2uvBve/pm3OcPptE35UDY8klwCfgoFBdyTYkO0GIjAvQEYA5fs9Rfa94VVu6URujrtrc9En7JQH/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789591616; c=relaxed/simple;
	bh=boA/geLpFUCqZyUNKsjxk/G3/OJ1tuk4ldtRMf08Nio=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=u+tWV7iko9UKDLpE7a29bLRm7at7kT1CTRgkEmVsw52Yz3BgTD1o+pESn4ZKKlirUHhV0qq66+vqTcHGQGqjXoBVDRJqD/fky9aSVDROAubCOF2Jy3U1v7UsVHhQpDcv/ubn4KrnBKSUTg2GSKFTvoEQ+OLAaWjKIhMr7Pv5I7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eK39a+Jc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H8Mni3BV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eK39a+Jc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H8Mni3BV"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GFeKCI4056357
	for <linux-samsung-soc@vger.kernel.org>; Wed, 16 Sep 2026 20:46:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=mIlriSmV1DgQbexuTZLBld
	yxC5XIABKWFBIiL6gMsIQ=; b=eK39a+JcprCVu6UAbvjtPROoHsVl5M1VX5sSys
	LIjedqcObH2bqvvKEhUk5I0s860GLy17kpQyCtXxXeUZxcYxeGYlU0qNUEA0FWNa
	e2E8iMFjoWKOEf6zk5CvPEi41HWHuaCh+coFHIaJm5qcTuIXjYC+gIIsFp7Ua9Y7
	hoVKEGzmSKg+oC826bGGmCqzkamgF6/pYLfHBl2Ox/6JI7u25Z+NJe4npSvxiCCa
	5lmFKhoGc5sxmxhu0KSVwAFIT97TAu1bSoP4Ds2VoddGMoQ5W6cz0A+rDrHYNhib
	R0f0fqa6rnw6J/Vnu4maQr3QBEdocA7bx0c1uQzXYsa/3RTA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqpu2udpx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Wed, 16 Sep 2026 20:46:41 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-936aa34873bso20727185a.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 16 Sep 2026 13:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789591601; x=1790196401; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mIlriSmV1DgQbexuTZLBldyxC5XIABKWFBIiL6gMsIQ=;
        b=H8Mni3BV1YQimCTCgp/IX6iGmhyhPJShY6qZf3nyGNe04N9KQBKqs5K3wS8JukIJia
         XmRcRL41htxQrG6Ojj3MtlE29SjFxvyVofopxXvIHxm+q6vQHea00QQTRxK9j0/rnofB
         2lf12z/OFZb5148NQIxpiJye7XOnrOIPiJgIXqYmXHuXwyfmLI0yAkJyvgfbHakSHzR6
         kdbg8a8x7HLBgcKa9Rq0rJSLl63X8Hl36tatE1uVOY/uHzpRzp0SRa8Ns+La8xkbOmUw
         v3FpHwZYqdNQu/QxQfiC8NdcHZ2tauPRxDHD3MO+VRpNgDlEUR0y+j0vfbE2vvm3xTTE
         r2Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789591601; x=1790196401;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mIlriSmV1DgQbexuTZLBldyxC5XIABKWFBIiL6gMsIQ=;
        b=rRZU8eSn79oH2FkBoe2sAMpT3ZmGMIl1PQlx8zmzjM1utMaLxvIh1F9/+VdvwjHQSV
         uKcO/KLXbiARBZzKF9QumJ3DWpAo5z8WqvIClZueyvkOgBfYcI4dDxfr0X0OgFn6jX/1
         046jAcfGWuOUhPHMlzf9zSzMIH2zWti4GQWRAliyh5LvV7XmeKRmH3Vq1Z/ddj5T5v4r
         KbdqvkvJ17ATUL6m+Xt1sgsc/Xk7UVTSDuaiC2SCbN0nMXTMxSYknT+MAGfo4rIJ7+dN
         dC6NRob5SEg11nqhKweUHow13RHyHqF+0334kWER6DIT6li1nCxsh19PCgM6/Um43wei
         nRIQ==
X-Forwarded-Encrypted: i=1; AKwUvBxPrmoE2QvBUgO/DeBG0hH/JFK38Y2aKKT+c0xBuFoYmRtZugfLbJ+p5nVjyOvYr13kNv4SN7dWAPUvol5JsxSOww==@vger.kernel.org
X-Gm-Message-State: AFuF++kZxSx5cm7R4ApQAMubvqkrrEyDWsjFZVGVp0+zqdpnMQedxKtA
	jD+8pbTJb8jew9z2vDBdjlK64xrGqNvYyfl+aT4imMj6nhFGwr/ksysMQ9Xx5lA0hVgA4B61Y5+
	6VCn1NdMMEhhW+3hkJjQRuzUC3Yqvi6mj7863pg2JCSNDHUUOcwPyUwHf0i0A3AlEVZFtEcXmGw
	==
X-Gm-Gg: AYBFou19c2og2E/+FHKgOi4Mz8QARXEd4DRHLau7SDzwOgkRFnx6LYbuZEvl42m/93A
	8zsN0uxJuoYu7nmVD5PzTjRSvstZjHsC+QT9VEQk8PrNh41lE0HFx2/GAoIryb2uDSoEAEBT7NI
	tiZVQCIJOK/jd8gXPI+QVFV8r//ofLt232fdUlK2FxvUqSONGqVp0uTD7Pokve+1O7n9cro1puA
	v6G6Wqp3Esdc9qlELs/RkeBiFbRuiBdsgYsaWwtLSmVjMCNfSaz/XFtE3ks+wIoUOjYhENgBHIa
	ApJeAtkCkULW/XInOMqDSEM2CeLnXeWc3M3PSxpbNxpezi4AgSmXMMGrOrE6xUcCA7BNFNKM7DV
	xCoNzRJ4E6chvUTNtCOWomxU=
X-Received: by 2002:a05:620a:4512:b0:939:13a7:70f0 with SMTP id af79cd13be357-93bb770c2a0mr672320385a.5.1789591600731;
        Wed, 16 Sep 2026 13:46:40 -0700 (PDT)
X-Received: by 2002:a05:620a:4512:b0:939:13a7:70f0 with SMTP id af79cd13be357-93bb770c2a0mr672316185a.5.1789591600265;
        Wed, 16 Sep 2026 13:46:40 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf1fa7dsm9857077f8f.8.2026.09.16.13.46.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 13:46:39 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 0/3] dtc: dt-check-style: Introduce way to disable checks
Date: Wed, 16 Sep 2026 22:46:31 +0200
Message-Id: <20260916-b4-dts-style-checker-suppress-v1-0-81b86685d068@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22NQQ6CMBBFr0K6dhIwtQJXMSzoMEgVCnYKwRDub
 hESNy7fz897i2Byhljk0SIcTYZNbwMkp0hgU9o7gakCi3N8VnGWKNASKs/A/t0SYEP4JAc8DoM
 jZqiR0jq5YqakEsER1trMX/+t2JlH/SD0m/R4OHqNIez326+bR3s1zv5Xsbfe2JEqaI0lBlRpd
 tEl6lTF+SQ3uy45/PuuMz6PLM0eDqUUxbp+AMLP20f+AAAA
X-Change-ID: 20260916-b4-dts-style-checker-suppress-fce8f17c9646
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3538;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=boA/geLpFUCqZyUNKsjxk/G3/OJ1tuk4ldtRMf08Nio=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqqwAqiOLoAQ4VKosBMUlrkktYK2o90/FbCSWkK
 A/Tcwe5c8KJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqsAKgAKCRDBN2bmhouD
 1zzSD/9/DhsLnHDk2W22J6HrGdMSypIsRat+8WK/qTFbWJCUIxWuxanIeJuUa0HVREjBB+jBqYt
 Tj/PuIe4lLsyQkfWDotzkALGv+Jfp+PUqlzZPnNXaz63SgdeO8pRrmhtjcjoXsh/gVMbaDRRRab
 gmKJS3NXhpOaFzZzXLxRwxJ6lEjO6b8ALaokJdE/0HFFgLwHCYkudJX0qfCOfB6ryx2gC11zI81
 +BGnwLrAqoiDTqh1O0zzSe3BwRm54QY3Sl0ayYeWuQYi/Hm+uoAzaTOcD7PGzXQ6PKEwGV3sfdp
 bEqEf3ZGr1kaSkghLxOMEQa8XFSjvGmzAZpWWLjPr9I9C08ClJmU+6Q2TLyV47cqxQAgXsdsQrw
 HNza7uHlZqRQssvkRtHdrAYlslb2dA63I0+ON3L+Gza0cQWO+n2Rlz2kzevVgLeF8QYjloOq229
 GKG/r93vI0wDinAtW49wMlBfAoBHm95OGVUmsPLk46vr5kuw0kWPOvXGRIMswvYVFgIhKsqRF4W
 RA+A+EDREryOGFMp4Nb4I5kIbCCEH2H4Jg6hSr0ENEI4xo6GI9z3Knd0c74CV7djF2suiDkce1y
 9nhH+eC701WagnmFTxpGxnA1ESYclsW3GI38iWejHKPU8fSxas93Ar66ztiVGzk2MUTrHRA8Txf
 Flt/6wqNmorz63g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: TxcjmCSOd7GV-3oicUKsZsTdkLyRpPfT
X-Authority-Analysis: v=2.4 cv=NelzRGD4 c=1 sm=1 tr=0 ts=6aab0031 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=KBJGa0VgAPS7pA67L9gA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: TxcjmCSOd7GV-3oicUKsZsTdkLyRpPfT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDI4OCBTYWx0ZWRfX98rM2KYwSPt1
 ELphXXB/2S7ZC1UlJlaXy6m1cED+ggESnGYCJwgcm20iuMlxKODF52zfoTFdV5OKmWGQ5U7zGT+
 /AjoBm5vcGEPR8Kox3f1lrEJkMM7h5zyW45wm517PNpOUcwKU+hGKQPMu5I7LkU8mVCTkWf9HXN
 UjBafdqhoct7JmnkS8JPLDMGXL1XE7nrhtqKimiFNRREDlGzGrRD8ud2zZaLv+fJGIwt0IHZq63
 4/tjfQeNutLjyZFECHvEsgmC0mGETa1RgBu4sv5qqjLbY3kZf+3Tla33NMX4i+8avXEkVeENkak
 9r+mtHfjmnXM4R9G17hPe+Um9aGCyWBcj4WO+1oD+9TEsiWUUfMynmE4/qCFV3WiIjxdB9mxi5k
 EyzvltxJDkgE4Zg3rJWGCuOWXxDL0HrM/MwutrqcIk/7nuoGlomsgI4zHIwiqbGlBXH5MzhRmlD
 zlJDdsA63kjc8kbEwcw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDI4OCBTYWx0ZWRfX8IgazVHFspmc
 wNjSmH2bbkUy6I8SSq6kYpCQchzwfesyn6+oHdp/tRm3jBmMZvGC4+YaPORbuWAp6z73MV/f6wf
 I06uC2aZkqTwl8mZ7vNaJJ0efErZmIQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 spamscore=0 clxscore=1015
 bulkscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160288

dt-style-check patch depends on (context/rebased):
https://patch.msgid.link/20260915-b4-dts-style-checker-continued-lines-v4-0-5b8e09b11ef2@oss.qualcomm.com

Some style violations are okay to have, because it allows to keep the
code still readable while reaching full dt-style-check compliance.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (3):
      dtc: dt-check-style: Introduce way to disable checks
      arm64: dts: qcom: Suppress a few intentional redundant whitespaces
      arm64: dts: exynos5433: Suppress a few intentional redundant whitespaces

 arch/arm64/boot/dts/exynos/exynos5433.dtsi         |  4 +
 arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi     |  6 ++
 arch/arm64/boot/dts/qcom/sm8750.dtsi               |  4 +
 scripts/dtc/dt-check-style                         | 97 +++++++++++++++++++++-
 scripts/dtc/dt-style-selftest/bad/dts-suppress.dts | 52 ++++++++++++
 .../expected/dts-suppress.dts.txt                  |  8 ++
 .../dt-style-selftest/good/dts-suppress-file.dts   | 51 ++++++++++++
 .../good/dts-suppress-nodes-properties.dts         | 49 +++++++++++
 8 files changed, 270 insertions(+), 1 deletion(-)
---
base-commit: 2b74cbd61ba866a42f7274bbaca27d59998bdd2b
change-id: 20260916-b4-dts-style-checker-suppress-fce8f17c9646
prerequisite-change-id: 20260909-b4-dts-style-checker-continued-lines-c6895bacb860:v4
prerequisite-patch-id: ac163f170b5b1cfd4170c8fd80b2500377ddb069
prerequisite-patch-id: f470296bdeae881ecc7308e31ea90da0a4b08c52
prerequisite-patch-id: b28b0bf1f1204f861d6e3449d847596c3aa5395f
prerequisite-patch-id: 11247384a57609f071969af426828de6a9b03b1a
prerequisite-patch-id: 95657765f7c99843225fb476b09e9975648a1eb0
prerequisite-patch-id: 8a18d3b03ee753933aef2cac631d3578c2985bd9
prerequisite-patch-id: ef954ae6784ad867e286a64285ed7cae0d62701c
prerequisite-patch-id: c1d5b94ec03e9790bdb245425cbb7144e25ed946
prerequisite-patch-id: 6a7e87d62a887d8bdfda00d379a45ae4c3a88f70
prerequisite-patch-id: 6ecfe2c2e6d3414852049bf184923eb52c8c094f
prerequisite-patch-id: 6fd9f568de9ae35050d90202f7c4ceba9a33f70f
prerequisite-patch-id: d62f7bde6bb1db9655a7969a3692ef098fb3970b
prerequisite-patch-id: 10cc4f931221e5c9c0d3810789b7c677d75417ea
prerequisite-patch-id: f1f6a75fd262291c2d1db0ae7040067c67e08957
prerequisite-patch-id: 613548bf804a4984b202ff69aef258ae327653af
prerequisite-patch-id: b016f9065366d98a39008b4dbfab9a7bcf421da2
prerequisite-patch-id: da84335c3cc8e3fa644ce97e6bcbcf2927e69489
prerequisite-patch-id: 2acaa10ee24a9217a6fa6756473cee3edb085e69
prerequisite-patch-id: d0f34708ce430403cc3403441fba1916edfcb6de
prerequisite-patch-id: 9c4f6161055f697ec1d633cc61e6748c070957bc
prerequisite-patch-id: 3536b2b9f72344868ddece77a48446af0164f53b
prerequisite-patch-id: aade8bf06cfca120500eac3447151ba0a0ffb192
prerequisite-patch-id: 0bb85efe9f0efd7a990cbc524d6360235bbe68a3
prerequisite-patch-id: 07a4da083ce7916285d80de33f989b499c78582c
prerequisite-patch-id: 46309bf89c926711a1f97ceea206e1b733e5e206
prerequisite-patch-id: 14fa558b453aaf560eb17d163500a433e38890bf
prerequisite-patch-id: f8ccd89f399b61ec1dc867ec7955a009c8c7b694
prerequisite-patch-id: 833114edb0c81877ed1182563426ba9695b81081
prerequisite-patch-id: 2ee62b9fd3ca36941fa9191b55136afb2bd699ed
prerequisite-patch-id: 464e2f568391edd2c3a39ea0d8920756a19e3159
prerequisite-patch-id: 0ddb7cb6bf6ba3503500ba8735ef77169a403edf
prerequisite-patch-id: e11ed37bd232ccae179a6ea75391f3dc52864ea4

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

