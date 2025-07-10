Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 753832980B9
	for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Jul 2025 09:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752139058; cv=none; b=cxkp+xpp9YubCZLYoSsTQPVL8OwiPScoh93Hi+RyBgA1jeNv9Emk4k+fFdGBvoMN73CRIHqh11eI0/sZg/JdibMsS2DBdJk4KWy9L6So/M7kuH6eYY+HfRFlBomR/prF7PV4QHy55RKRMqwe/A5YDmWCXCXD95d1Gq7Zxrjnkmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752139058; c=relaxed/simple;
	bh=WRPvBg2xZwSvVeD0jkJE2F2CXCNgW24WQEv0gSZ4OPI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A3qa3T696qq0ZU8xIZ4IJY099R6zR8k9Rb6gMdvL3U2SAzVvap8dee66Kibac3/iUvPXNi/ETXRy0GQ3Z5GMHhVjFhgFmXOjVzZavMU1B2T/AfFaaUvC+XpPZNEFwvnj4Atooj1bWvbDPNF7+LN8K+7CwLcfeic1sl5BOZ39nAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LhOfv43e; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LhOfv43e"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56A9FxO3009948
	for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Jul 2025 09:17:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jjnERpSzmYvkUrDgRq9M98U0DkVLcbK7HnoX1+rdKUQ=; b=LhOfv43e1mI+3rdy
	MtydXTK8trGflHcht5g6SX78LUPNwCXfdtA298j+BxH/JPAD9RvXS80ZufPUoHAH
	Rx+KtMNwiNLV2XoVcZyQT4MRrK7zmmoW+sggNLGpPSCyjFxfULRd2nThxkaqzWAg
	+U9UvWbcN5kAt9zbo143R1POcWIUvsCwUWNhPbbjgIyq/o0kc68husWRTIzUEPqG
	/4xAHa1uFkYz2RnMyGSEhSb57YdSKgOfEpsyAfoOgJF71wMfYazlTB6N9GC/dxdN
	IiQ14FVJS9bJlCtQ9JhS1Ii4RLDjJ9O54+W2XapvtazbIbGXzOozVR1dfTKMJ3sZ
	ODBNwA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47sm9dvbmc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Jul 2025 09:17:36 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b321087b1cdso1016273a12.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Jul 2025 02:17:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752139055; x=1752743855;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jjnERpSzmYvkUrDgRq9M98U0DkVLcbK7HnoX1+rdKUQ=;
        b=c8kYDptFkbZx0+QWfWAB7Fp95i9oeVMvBTiM2t/C+KwF+2PsmpzkGYTPTLYcXKHoC+
         rGZqqQ2pHMjs4JaGT2A7teeBjXf8OxF96/+iS/1aWX0GY2TdcTQyeymAR/6CqcGVR32w
         jIXFpD9KeqBnvs+dg7T80xBBI2sXx36SuCYKhHdIM0kHxWi8Hs2xGUf8n/M83wRfbYdJ
         wgupiUkevNUbVzB2efsd82WDBRPEOGex0HMl3BU6YxXoMZ7lYPkGsLJkfbZ8mJt/P9i2
         W5MSs9BW0Wn8SVFDHakHBv9RDAygbapnoXik2lyL0cBYFdXDHv1VetHAQNJD9SjlVHXd
         U2wA==
X-Forwarded-Encrypted: i=1; AJvYcCXZ4HWfbvEDSAeDHyNXGf4Sj1cBZNuW20lgo196CcaiO2/T/5hCEexcjgzxGbSdMfD8ikITWFEw+7hoypPU/E+ZPw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwS0t6r9+mbYVTkZCQckshq0Ud8KlmUSxAPBucflf0Pc9kAO+uq
	1bLB+JsJUdx8/EWfUNug80DDzUR2X00bIfrIGAdIMfFrYQY2EU73I+NKpZzZfv5B/PViNMemSB7
	aueg3ph5etOf8Dz55HaGOYWy9AOKw6t0QC+q8GKB58SIF6wZa4grmY3GQ/+V5hXfgV67DBO3Guw
	==
X-Gm-Gg: ASbGncv8grE6F8ICk29A0z/YJ7ayKQ7xZm6V+Jga5ztRIKXk+BMbtT7Bz9WJGqApeGQ
	rKzaXyYiLQss5kkrXU33KsknS5TK/9gokwshzEsnhuqW1KblCiWuV1Ft5jnW5f6AOpLN+yfOgZS
	/mesDRkQEftK4KRam11yHCnKEqEkg8eC357Y3HyuRM8z0HyvlMrBCbL+SUPVnyfuVRbF/8tyDn/
	Jrrx/dXE5r0iCdoIKTMlFo2yIGEuJfacdQy4PjkQsHpLJ/AX054d7MWoSfKat0mcD8gr4hdSLlN
	rIOll6OBsrzQFF7gYTmrrJuShLXALqRZwt8ZJxGMST66eyfRErZx3QzuVnY=
X-Received: by 2002:a17:903:40ce:b0:234:bef7:e227 with SMTP id d9443c01a7336-23de480b01emr22477155ad.18.1752139055193;
        Thu, 10 Jul 2025 02:17:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOJVHab5T9iz/Q1OPBfJ6QDcI7he8gMDHrdEtDIQENvV9ux+bR1aR59bdZF7+Pu5JDOhCy3g==
X-Received: by 2002:a17:903:40ce:b0:234:bef7:e227 with SMTP id d9443c01a7336-23de480b01emr22476875ad.18.1752139054755;
        Thu, 10 Jul 2025 02:17:34 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4341d51sm14837765ad.189.2025.07.10.02.17.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 02:17:34 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Thu, 10 Jul 2025 14:45:48 +0530
Subject: [PATCH v10 06/10] arm64: dts: qcom: qcm6490-idp: Add PSCI
 SYSTEM_RESET2 types
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-arm-psci-system_reset2-vendor-reboots-v10-6-b2d3b882be85@oss.qualcomm.com>
References: <20250710-arm-psci-system_reset2-vendor-reboots-v10-0-b2d3b882be85@oss.qualcomm.com>
In-Reply-To: <20250710-arm-psci-system_reset2-vendor-reboots-v10-0-b2d3b882be85@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Yan <andy.yan@rock-chips.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Elliot Berman <elliotb317@gmail.com>
Cc: Stephen Boyd <swboyd@chromium.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        Andre Draszik <andre.draszik@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org, Wei Xu <xuwei5@hisilicon.com>,
        linux-rockchip@lists.infradead.org,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
        Macpaul Lin <macpaul.lin@mediatek.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Elliot Berman <quic_eberman@quicinc.com>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Elliot Berman <elliot.berman@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752138982; l=1684;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=C/j1pRyxrqegE9+HlfozjQfjDAmabEKYItoLHtiCbfY=;
 b=oe8WmAtH5g0NNJLno0zytsw/dFU5witrI2BFN5XbefWtdYq5E2r0zaV+zXXXQr+UPw9ahC1h0
 tBeRlLEJRy9AsD9sm0fL0JabkRyYC2H18E+hF15CP1nzH43tmkUZ5Im
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-GUID: fXBOeSIoT5d-oNzXxOsc17YFu5kLm21C
X-Authority-Analysis: v=2.4 cv=W7k4VQWk c=1 sm=1 tr=0 ts=686f8530 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=rzkh05IFTCqOtWkwyAIA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: fXBOeSIoT5d-oNzXxOsc17YFu5kLm21C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDA3OSBTYWx0ZWRfX34/Ep6r16NK6
 RPiHXwkIbQ10JMBKNmkf0WA8+m3xe+w3t7yROlW2VxYbYwHRAwtoM3RMAOS5Ibknp5YDh2fslBT
 C7Pmnj02f5UP8wK0RVCyuOHLeFrefhXe31GPpkn+os19SsWFUC6sYElxeSgawqG4lfvdxmaOuIU
 TtDw5sq1U2UPKjY+DmcAMZ4N3ovNqldu62iy0NdQJkr8zrQCNhbPo6IXGHshirt7kfDDHD0RJGt
 s3hcqSUBfwXB9OinGR0ZAjLUs/6rRM0QXJ8XRfbSL1HDYzV6fxHO2PsC75Relsn9PHZeR1MWHnz
 SwJeulP4xM2YZfDqTXajyy2FDgT2U4xmCq+XX/JbFvrCCqjHM7GV7sgpI0K6ZynPU4h0d23ltD5
 XQVAb2I1nMbikgmnBEcgqnv3Y4YzGCFrfSyV+baA3l0DSUbQjh50eYx0h6KAzN66lEj5kt4X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-10_01,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 phishscore=0
 mlxlogscore=832 priorityscore=1501 impostorscore=0 malwarescore=0 mlxscore=0
 adultscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507100079

From: Elliot Berman <elliot.berman@oss.qualcomm.com>

qcm6490-idp firmware supports vendor-defined SYSTEM_RESET2 types.
Describe the reset types: "bootloader" will cause device to reboot and
stop in the bootloader's fastboot mode. "edl" will cause device to
reboot into "emergency download mode", which permits loading images via
the Firehose protocol.

Co-developed-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Elliot Berman <elliot.berman@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts | 7 +++++++
 arch/arm64/boot/dts/qcom/sc7280.dtsi     | 2 +-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
index 7a155ef6492e176390faa3f2dbe419f5cfa62f0d..6de4b140ed10b0da72f3bffae524f65406d8f571 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
@@ -654,6 +654,13 @@ &pon_resin {
 	status = "okay";
 };
 
+&psci {
+	reset-types {
+		mode-bootloader = <0x10001 0x2>;
+		mode-edl = <0 0x1>;
+	};
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 64a2abd3010018e94eb50c534a509d6b4cf2473b..e6a99ef50b9b9ade9d2a71a14fcde429f8076dd5 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -857,7 +857,7 @@ pmu-a78 {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 

-- 
2.34.1

