Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4CEB305678
	for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Jun 2026 07:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782199863; cv=none; b=CnDzkDqq84ooih3/faFaNDrpA9avH6Mxb/vy694CL16nu+ShcE3I/Tyn5yPsyMv0gKk1zEyPvSrFWuYqW6hi3lFbeQ7TJzvu7BNAKTrqaGJ/gd0FU652KfbopbOPwjahJA+n6kjjA0d/HTSLvtB8jkA5cnDLY5tx7W259FTs3nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782199863; c=relaxed/simple;
	bh=+z1jZQEnVR8n3wdnGSX3AbHxBd+dIKoxZwO+RTEadyI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=V1CAQHLsiX2DHFLRisX8ROW8BDz46WPM/fG20irg5EewMNMQPph409t8CYDTmhSvROkSBcWm0lIP5zuITlSw8z18upz4RduLgTZW6LZWEsYbR0sgK4Lco9rX+6vVvtDHbS9oMUT2boJZIxEp+QLZGMhc25C2Ke2DJjqvBKIi9Co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oaqV/eaR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VWm0hh/H; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oaqV/eaR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VWm0hh/H"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N6cgeO2986279
	for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Jun 2026 07:31:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=d3ILuzr6rF0uBjm5kVCeg2dCh9Da79HKjgT
	n/WbdLvg=; b=oaqV/eaRWEZ0FU6GaybmJ8Egzx+/Ugo2FfiiOZwSLlcSccmSmjd
	Iu2CBl6rEBJUJPUxx3++jGIh3Kw8pvBobSx5IgTH3CTCGDd0LFLHRefDrkQKT+ai
	ZrzT3/bjoxOqsVmjD7jjxGh+sx2P1I9CmAREsEvN1FdrVpOlgo4ql6B3ibH+ZFIm
	F3Dgss3dmN3fy0njG1JyUtjJn8t+bWS61B/r7Lx039dJy4/tl/EG84ozamUAMwQk
	AkDUfRT0ylooHUrKf7mYz6AJYxBLbbXOJChXBA4wPNZ2R+g1XkV40Wa14kjs6k5X
	P3n/NBax+XinwE7rjA0z0DJIhH/i0kOC6hA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey3a0v2pq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Jun 2026 07:31:01 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-922ff615c39so208048885a.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Jun 2026 00:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782199860; x=1782804660; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d3ILuzr6rF0uBjm5kVCeg2dCh9Da79HKjgTn/WbdLvg=;
        b=VWm0hh/HVD6e5wpKtOyrwy8VuJr1GCGoj9JvfM6SD7hc8SGVLAQ2VR36KQlgi+SqY0
         WW/8bguaOcFWdV1WRXBmtCKCDwZa7gt95gj7NMGDWhELxEDIzeFRbg01pcZt+FR2fZPs
         WUZzdp6gY62KnYqFPbhUwKaNZwZqulD/UCk6BeaNdeJWjux3YmjEfWXI8EMW/saEe+Jy
         1V2EA6vSa0zPNLMX9O/P+PBC+WSzR/wyMPen/+lu13+cgOOwkiWPJBTtcB6u1mwtkZ+3
         q088an9Jn9xTnNESX6I7vA0q0wlEv3jcAYrypSo8GOFSPTsW/s7gTsYIeEaFvUlnR4jF
         nbeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782199860; x=1782804660;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d3ILuzr6rF0uBjm5kVCeg2dCh9Da79HKjgTn/WbdLvg=;
        b=nYTrhSYq+DB8TwnCYgfOGlQf+8O3dH+RQqh0aC5ja30mC47c8+LJG7APjGqzGpeedX
         3Z4TbdLKi6VHp/gTNZq4QhoI9Wjk4y9hJkXpupvUQBAs/v+TYK8kMUiEH8JIEV2lsRgW
         OG8kf2EzGiRPc8kJeSx+VMUMOjshi+SLxLC8LK1HvNKHOmuc1C5It36XZjvhGZH6Vs3m
         fnrOKjSlUZ+yoG5il85SR4ioCJME/gDK6ZE3p9dYGje+UQFBLr5YHLAF9UXnSthsZKOL
         qE/2vjRapv0fVNPd+7b4QfuutBdH0X8fpLyhwV3GDrCgLiB7Xf1uOx8GtjNlkQsTe/pY
         fjMA==
X-Forwarded-Encrypted: i=1; AFNElJ+hXbH3unvoztlwGHmpolHpp1B05CB5ybBQUeBhF9CNifCk2P+H/QArHPekYqjeHiQ8DtunboftQr+G1mGfAAvfTQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0Z4MckBvFIqVTuVAcrzkPtC0qUmFU5c3uyWZ7/IQzzQak07VL
	Dnqz2UmbFytV7iJPf27UDNVAsFesaBufNTDHB4TV2oUkKi0kYJX93sjlg4s4CR7KcaKnoX0b6Op
	H7ru6amk6y6Hdo85OdfC2yNefkxXyxQiyZA8pJ8+JNf47jFgxpdwi4/pc7V2dG6+Lp7Ki/JGQmQ
	==
X-Gm-Gg: AfdE7ckKsUZi2SmLC8Zg/MdJYHkGqB7ifasdVejcoRX/psa150qTOKYg9a/oDvScbre
	RPp59KNZg6H6XJs1JC7PSF/AnZ2nRLyEqF0NstMn/LFd/dzDP2Sj/0fhCxeOTzLdDYcuJG4+8MJ
	dyFR3erargJ7VGNLCs9f3A8kS6tt0frb8vNk8Gr2LP4B+w3X0Y0hey2+Tg1QKYcdFiJiblsnD0j
	ZDwTdhqlZsCafi4d9yMOx9qKym30Vbcy1MIOFrccuL102vopyMBZvPki2nbblLn4IbbcubpM9Kr
	mMnBxbDxcKkyESqdrFZOgcrHanFYm1Eur6YCnVyJL8vpFedIoSxfRZaJ/CXG07R93YWYJqIS24E
	sFpcLKiETrYP0kK/jU7YJqcJKgjc=
X-Received: by 2002:a05:620a:1a18:b0:918:7e9e:de74 with SMTP id af79cd13be357-92600a83287mr479174385a.17.1782199859897;
        Tue, 23 Jun 2026 00:30:59 -0700 (PDT)
X-Received: by 2002:a05:620a:1a18:b0:918:7e9e:de74 with SMTP id af79cd13be357-92600a83287mr479168485a.17.1782199859316;
        Tue, 23 Jun 2026 00:30:59 -0700 (PDT)
Received: from quoll ([178.197.218.240])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-466648c4fd2sm32639666f8f.14.2026.06.23.00.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 00:30:58 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Barnabas Czeman <barnabas.czeman@mainlining.org>,
        Tomasz Figa <tomasz.figa@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2] dt-bindings: clock: Replace bouncing emails
Date: Tue, 23 Jun 2026 09:30:51 +0200
Message-ID: <20260623073050.36262-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3511; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=+z1jZQEnVR8n3wdnGSX3AbHxBd+dIKoxZwO+RTEadyI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqOjYqw7+RyPgYxYdPnTEFX17TqOfRdpBrpFk/9
 nECEH8iYtSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCajo2KgAKCRDBN2bmhouD
 1/zqD/9bOBLllsidqTgIaW9n/Im7ZNh21uTUYpZWY9l0c6FHAd7+MgIBIsgU2A5abk25PiND4N4
 iFvurm6lE04BJQw1is8lJTiAudAunnJiVSTVw+xHD1fIxYqvkSx4MIUaYS2j8ZsTPMYhfGPLAH/
 owqpUIghS7KmlJeNmh3ttEzlrOph8i15uhtev00kjBZVpkjDgGsFj2bfzlKd/m+YYFnGx9nr6bN
 XBwCmuCBiPaXM9fU72ws3xZPCYo+xOMy3QLQLLe7bKq9IAn/TR2tevde29XIuXDdgskh6pZA9Yv
 w0unRiwWYjy3T47N5i+IYEylB5DsfjmN0Uz6+ZTKCXqLG0KP9az/FqYaUt0qqLPJ9ePTJQ0RWpg
 46j53S5D2dyNgpwfpDiPe84Fh+78+SqhDuniTRKh3TUCO5Y7fFfz+mQktvxLOPwwNxA/H5DXdB8
 DjUA/dZp3Ud8PrXE2DbzXfIc1M7VsFydkLUXrkfWgrJFIL0m+ErF4zPIknL9RkH+JpJBXhMIqw+
 PLfM6qcvuWRoTmHWLOlkrINuZBjbwA+S6Oh4P2TYHj3f1dlrKbvmcKvA0waBdx5Mq57WaEaKtbH
 Ogq/Zd7Z2fiFN+Lg1tjTtHQySJ+eJmHx6/exh+CNAlDQaWps/JsuBs3HtrIzbISytV+/5MXVpqa /5mVdW5lFCl3KBQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA1OSBTYWx0ZWRfX3hnN11L9Oqi8
 VbHY7YSF4AG+oz1DJ7tn+ixI1TEUU4K0uwm2j6kR5WJqEzOiiE3uZA7GXSU7gPxMfNXv+3RDUSA
 uL955vqoQqIxbDBDy3BX8PUuXKHlhk8=
X-Proofpoint-GUID: 26O0aPinmq8mQbwdQGnRNcF7I-5orjpn
X-Authority-Analysis: v=2.4 cv=UJ7t2ify c=1 sm=1 tr=0 ts=6a3a3635 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=qMZSjPy+XpteAuilWfML4g==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=sfOm8-O8AAAA:8 a=OuZLqq7tAAAA:8 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=hD80L64hAAAA:8 a=eM6w23YO-tvBst7BRO4A:9
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=sptkURWiP4Gy88Gu7hUp:22 a=TvTJqdcANYtsRzA46cdi:22
 a=AKGiAy9iJ-JzxKVHQNES:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA1OSBTYWx0ZWRfX4bvCPq1WvUfd
 4eK7nyUTOObb8Ps+jUjJ60gBZnRksNOPig4ie69AqQnCJxe00KIh8/qBVQauQLPerh7Xn+u/XCC
 DtLk94WbRfHKBXdc2vOfHSmsFrCla5KfbqwphfYrFrw1YNrxTJa3AuYk19g1R49fS7F+eUJ1O0l
 KIZc9Ri5AcWOgGq9p+gxxBlg1hxM6nh9SoMnpbe//C1PkRh8c0xeSIyfqKRv4kSOcStrlPZVDvP
 gebUb12jNmvMhVWHxO0SJOj2osPM/hFyRvf0Uf6HcsMyov479IHwWfcYGEHdsedcEGueD3t224q
 ukudheaGLegPsrYuQzT4qSbFbhAErVLKbjo8HyidGzbbPUvkC9LvLB/wVEkj1UokS7fZYKS2cd1
 ZDhwlRyU7m1xc4hBuVScqoKIyvXCLZ/1Jj1vOHWrlVeL9sKM0J/2lo+Ul9yLTK+HOFI8RNU0iZV
 yzRCPHhgpwOmcxkXssg==
X-Proofpoint-ORIG-GUID: 26O0aPinmq8mQbwdQGnRNcF7I-5orjpn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230059

Replace permanently bouncing email addresses (550 5.1.1 Recipient address
rejected) of Adam Skladowski, Chanho Park, Anusha Rao and Sireesh
Kodali.  There are no new messages from them via other email addresses,
so drop them permanently.  Add Alim Akhtar to Samsung ExynosAutov9 SoC
clocks, because he looks at other Samsung clock hardware and drivers.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Stephen, can you take this directly?

Changes in v2:
1. Also Anusha Rao.
---
 Documentation/devicetree/bindings/clock/qcom,gcc-msm8953.yaml   | 2 --
 Documentation/devicetree/bindings/clock/qcom,ipq9574-gcc.yaml   | 1 -
 Documentation/devicetree/bindings/clock/qcom,ipq9574-nsscc.yaml | 1 -
 .../devicetree/bindings/clock/samsung,exynosautov9-clock.yaml   | 2 +-
 4 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8953.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8953.yaml
index fc0360554f68..9f2b970bfb48 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8953.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8953.yaml
@@ -7,8 +7,6 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Qualcomm Global Clock & Reset Controller on MSM8937, MSM8940, MSM8953 and SDM439
 
 maintainers:
-  - Adam Skladowski <a_skl39@protonmail.com>
-  - Sireesh Kodali <sireeshkodali@protonmail.com>
   - Barnabas Czeman <barnabas.czeman@mainlining.org>
 
 description: |
diff --git a/Documentation/devicetree/bindings/clock/qcom,ipq9574-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,ipq9574-gcc.yaml
index 5b128fa841aa..1337bd87fddd 100644
--- a/Documentation/devicetree/bindings/clock/qcom,ipq9574-gcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,ipq9574-gcc.yaml
@@ -8,7 +8,6 @@ title: Qualcomm Global Clock & Reset Controller on IPQ9574
 
 maintainers:
   - Bjorn Andersson <andersson@kernel.org>
-  - Anusha Rao <quic_anusha@quicinc.com>
 
 description: |
   Qualcomm global clock control module provides the clocks, resets and power
diff --git a/Documentation/devicetree/bindings/clock/qcom,ipq9574-nsscc.yaml b/Documentation/devicetree/bindings/clock/qcom,ipq9574-nsscc.yaml
index 7ff4ff3587ca..a35bbc7b1924 100644
--- a/Documentation/devicetree/bindings/clock/qcom,ipq9574-nsscc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,ipq9574-nsscc.yaml
@@ -8,7 +8,6 @@ title: Qualcomm Networking Sub System Clock & Reset Controller on IPQ9574 and IP
 
 maintainers:
   - Bjorn Andersson <andersson@kernel.org>
-  - Anusha Rao <quic_anusha@quicinc.com>
 
 description: |
   Qualcomm networking sub system clock control module provides the clocks,
diff --git a/Documentation/devicetree/bindings/clock/samsung,exynosautov9-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynosautov9-clock.yaml
index e9d17d48b4f3..3dcdfa7a8792 100644
--- a/Documentation/devicetree/bindings/clock/samsung,exynosautov9-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,exynosautov9-clock.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Samsung Exynos Auto v9 SoC clock controller
 
 maintainers:
-  - Chanho Park <chanho61.park@samsung.com>
+  - Alim Akhtar <alim.akhtar@samsung.com>
   - Chanwoo Choi <cw00.choi@samsung.com>
   - Krzysztof Kozlowski <krzk@kernel.org>
   - Sylwester Nawrocki <s.nawrocki@samsung.com>
-- 
2.53.0

