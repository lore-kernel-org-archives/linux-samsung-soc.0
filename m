Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09683293B46
	for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Jul 2025 09:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752139079; cv=none; b=C3wPp7rxFU36EU6Au8Vu92ZgNXYo+xtVSfBWo4SK9qm2Vi+hnckoUJgMJxCA6bhtQIc4adjCq8M7hlvkgqIUtFCejGRuDuQJkbGMwroKhlzeMktvuCIQivhhU8q4xT6fYwElFlUMqDB13nEjmLLZo4Z72qNdzZGDjYJ9l6pYgV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752139079; c=relaxed/simple;
	bh=SPFjUorJ1LNNt6IjkgTIiv1ZSNVUKKr2QMBxhxlfSyI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QQElm5h+AROezctpId1WVo/o9N4xXDLq1/Cxsm95PWmukHgwf92ohIg/AyAwUUm1Rgk4CP/w8HTN21eTqXYbH6GsL+lYzLMQUmm7JMvaD4He+C7oEX5iwZsq4PIAs2waPsusp0UUz1d49LPBGQQb6ssgl1z07z8tz3fEBMTZ50g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dmIfAR97; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dmIfAR97"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56A8xKis023135
	for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Jul 2025 09:17:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8ty1qg4MgFp/1KipjRpIWVF3P1K5EDIoLCixxlG+pA4=; b=dmIfAR97TkwUQ7Lx
	RnPSqBd6MFiaq/ha9POQEwKOOxDLFMXwItwBfB7t+S8E+OcVlnLQQcYZtKe0ReYA
	OF9pKO366O8724350FYgb4Kwacsi5oJVnpdxufv/kGOeJrQ0mQr74g+8Bm3AaMDb
	DwiWWhHUmMys1IfijrkU/TBXVYpziQl1l3xZj9lfbp9jxbAyP8F1qak3bAR6A8he
	KCkhN/ILC08Rrng235FTL4y0eSAnGWwX49oDBo9y6mPKd8vEXGjodyjzk9RLk0st
	t8P5q33CrixLGGswukojELhulegDKWVgY2P35xajEekZ2nwErH/5Z9g/SdOFFcXi
	k6S9nA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smbemc7h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Jul 2025 09:17:57 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3138e64b3f1so1118452a91.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Jul 2025 02:17:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752139076; x=1752743876;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8ty1qg4MgFp/1KipjRpIWVF3P1K5EDIoLCixxlG+pA4=;
        b=ZALi5idGaHfnuiobyppI43k+ieqnq/uH0pYiHY+Hj1iGkEF3s88EQINPKECCaO1EAY
         weW04nvxecokkoS0N4zYOikyNQm0k3yQAZGZAt5kMklXEnk5w498HG9UUrYKElNAv4xL
         1qLwOEv92jvRy5jm2Th0p6vabcfljprAIpNI4KlhpJVxMz34FXxlL7N8DN//pUlAmFi6
         Y3Q2eYS3t4vugHpoKLGrg1Zvoa+PwOoYp2AZ9Rsw4in20MqrId9zDVNqca4+0Kivlmb2
         zEOQ3Mw1d1JVDzxBqHcBypvc0+yu22uStqML8BlmCDStiXbFD2S/WT9jhb2ySfmTjLy+
         I3IA==
X-Forwarded-Encrypted: i=1; AJvYcCXEj3s2imYxSzToepHn53ECwkiTOn3AvicNBIJ1DK/rFywFziH6bDI1MK2pBi8tzgiiRMA/4eWyOnIllOoabmDmnw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3R4xzCzZjBqT7IuTKMKmHMQ1x9SqL5kch3jPR3bB1Iky17ytc
	QX5wzYfh8rd99S9VkfEPNvlr7Nx+4z75kGxzRXnG65qi6WrynCy5ZL2t8h/SLJaVJ24ETjVjkS8
	P454VXYAA3vd/rJl006MVD4a+XnOpcSMhMlxa3GNWaNjprAJG50IXIuy5emcMimwqL/aHiIr8gw
	==
X-Gm-Gg: ASbGncvMFU23wCxMSXJxNScTz6TaeuzaTmKnhQAvlz4qnwH1h1kSb9VPhvGGd58ofuh
	XAb+RoHTGscaV7gY6zofOTtxcO1Q8yqpe8nTgqpmUanmC1iz3766SEryuP5Fu+83c6rHC2YUfWQ
	3mfa0GLAW266Z6xH2GBpwN0+kUq3LP+HTngT6r3Vs3hQRXnXXyozM0Jo5mG7fzlgt+mMrW7PWMt
	mhtv3XO6+4M8aDMYmNauQQSURR3t7C9m83LmNWluvHaRSh+ejGBV4JqQdJTyW5s8e/NmfcpZmCr
	3O5LCHYnbTdSSrugBfZ5kH139pJy6/P8nR/+S9B971QDA/mKGosd4hu1uqg=
X-Received: by 2002:a17:902:cf10:b0:235:1706:1fe7 with SMTP id d9443c01a7336-23de47c3198mr27936055ad.4.1752139076508;
        Thu, 10 Jul 2025 02:17:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZ5DuAv4hQzhi6yKoAY4RR5pKmk35nKETW7dTCDtaIHn7ZT+nH76uc5gC9jWo86sxbpSIxlw==
X-Received: by 2002:a17:902:cf10:b0:235:1706:1fe7 with SMTP id d9443c01a7336-23de47c3198mr27935715ad.4.1752139076096;
        Thu, 10 Jul 2025 02:17:56 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4341d51sm14837765ad.189.2025.07.10.02.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 02:17:55 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Thu, 10 Jul 2025 14:45:50 +0530
Subject: [PATCH v10 08/10] arm64: dts: qcom: sa8775p-ride: Add PSCI
 SYSTEM_RESET2 types
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-arm-psci-system_reset2-vendor-reboots-v10-8-b2d3b882be85@oss.qualcomm.com>
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752138982; l=1717;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=wgknhYAt4nROUs/wPHMPDduf8A/Qll4soAM+xxnL6qQ=;
 b=3xptDSMJeo3n/kz2bsmlg89oPR2D+s7/G71KUw980yLr9mXAK6CEeli4EB/FEKrVloHBfPGNw
 SkdWoG5CPJdB2Plv4VSr76tB6ulp/v0kXwZhRefVTk3eBv1h3UuMEBA
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDA3OSBTYWx0ZWRfXwfZZD8jK6Vjx
 HrqOEJvsFefO5R5Rd6R2zZtCb8J8yL9Zn+x1kdO3MrNp1sRQedK+wQGt/I0eXC+dbdzEhrG7QSA
 6Jmsvi+uCDpQnAWCBW7s9DnO2dYI6Ue2q7sDjIWOvWyqhNwaaBcMKVSbzY6b+yDSxs26fFC/77Q
 cQAiP85riDsGNoemqXhHGvblw0iHJuMJmo9Avu2XnnEELpfq2FcxmurLckOb/ck1cYzghrE/xEa
 WLRldopaD7/g/YSNcCg12/5MD41UcaxVEi3SvvuiemE7hQN/vDwvAqACFq3LQhoJojDot7Jg6/2
 5pXqqDdQoGTEGSgk1WxxJFQpBDSCpFuIuHiM7SoZ8w2Bc+XpvFscM0K4lgRgX5BgJQLO1F62HsZ
 kAxjn1XuUadRQNh3rlXVflKomycgoqz9fdp8f7aSYmnqUs3OQDJoKm+ddh7b7r2zHokz63jB
X-Proofpoint-GUID: sogdZHova8Xt7El4UONQRJsQBtNd3g4w
X-Proofpoint-ORIG-GUID: sogdZHova8Xt7El4UONQRJsQBtNd3g4w
X-Authority-Analysis: v=2.4 cv=VpQjA/2n c=1 sm=1 tr=0 ts=686f8545 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=agHhT1tg99JF3qhwDn8A:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-10_01,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 suspectscore=0 clxscore=1015 impostorscore=0
 phishscore=0 mlxlogscore=912 lowpriorityscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507100079

From: Elliot Berman <elliot.berman@oss.qualcomm.com>

sa8775p-ride firmware supports vendor-defined SYSTEM_RESET2 types.
Describe the reset types: "bootloader" will cause device to reboot and
stop in the bootloader's fastboot mode. "edl" will cause device to
reboot into "emergency download mode", which permits loading images via
the Firehose protocol.

Co-developed-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Elliot Berman <elliot.berman@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 7 +++++++
 arch/arm64/boot/dts/qcom/sa8775p.dtsi      | 2 +-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
index 63b3031cfcc15fe2cce58c0fb7502b19f058b80c..44840c37c2f102e7939f64c8eaaf8a872ba5a140 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
@@ -874,6 +874,13 @@ &pmm8654au_3_gpios {
 			  "GNSS_BOOT_MODE";
 };
 
+&psci {
+	reset-types {
+		mode-bootloader = <0x10001 0x2>;
+		mode-edl = <0 0x1>;
+	};
+};
+
 &qupv3_id_1 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index fed34717460f060e6a9dfdd4e29ca4025c401b83..b1f151aff478dc268e3405ef5bdd85e67bc25cf4 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -622,7 +622,7 @@ pmu {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 

-- 
2.34.1

