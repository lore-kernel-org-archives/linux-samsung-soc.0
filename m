Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25666298987
	for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Jul 2025 09:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752139070; cv=none; b=BZju87w2b5UGKhyo2u3AdCopvCJ6aR+8N0YAJa68/lTsurLdpSQikzNJVNJarBcL/iry/9qgO/7CWhSWWMiD0KCTp22hmB46o7RUXzJ/tY7VcytFpCYtfwUWkHUOPY//gvo0pVwhJf2XQPjCQWVxSfzWwSybzOzWIQq3IhrToME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752139070; c=relaxed/simple;
	bh=BcXSb8+CR0HgJL8ZGlO3s8zt5KfV3AVBmUeP6D5jawo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V7SG9R+YLghON3/OfWoxsQwGw7qSMyZA4mbA9UJRjTfU8+Vf4GUhoR+3Pa1qR6fDsquaiAUuj0NSQbwYGW7VVp5/nrp7TTO6mN1BVA9YMk90gW3dfagUNnrnS6AUNZ8uCHrM/OGrJ0my4ESuMx1nOgh+wM4jzUC4jua60VhwWBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T2leWwQn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T2leWwQn"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56A9HFTf010099
	for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Jul 2025 09:17:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LHGeVOx0U2s9qP0ikhLwIs2P+IuUNoY0lfi0EgG0DtY=; b=T2leWwQnvLvOkFT5
	FqxaS8UlSjT2B3VyMJW/m80MFFazSucqvPBpJnIE0FykN9J0Jrnn0TBJjigP3BFp
	HC5rSlMxaCCXV6ZY8ZVsx2Urc4vVFfdjEmW+OiaYUeRYXredSnDRdup+9khzzpxk
	Y4ZoRaX8ySim5buzzTB5VFaujIvS3dBRpSSReF0L3SahKEkiyGO3vRBSfzieGYtv
	EKKUQszXEPp+NWhoiCHdFb5cw9Jrn2WFcCYkOeug/I7wyK32bMS4J026Yl3ZbmLo
	4gtNC5Ddh9jurzukUaEA3mUSYVGUzXqUi9P4m3rUqXQDK215N6e/BtyeWqJllsVF
	D34PwQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47sm9dvbmx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Jul 2025 09:17:47 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-234fedd3e51so8452975ad.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Jul 2025 02:17:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752139066; x=1752743866;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LHGeVOx0U2s9qP0ikhLwIs2P+IuUNoY0lfi0EgG0DtY=;
        b=JjIExOMWaP4ZeRC9zSZywr5Sib4wBFsKfacOO5WpVCIjiKrPRi71kbRlW4FnPNti7B
         Yz+NeFqGKHMVV1HxGp5O01ltmOBm1HdO2Y9M2t3yvqFgK5WNggCeSdm1d2h46Rpm2dDc
         4TqdMg44l9H5Uv3szXNs5qp5CmDzwpPy2+Rt5ojrv2ZO/9314wVb9YXqckkQf01ZBUNo
         k5PAMemWpN9FTBio5oE2kHU7iZtPHn/NaDG+9lukUg0fj8pq775Lv1VnRDNtpchje0kW
         QOkNpVx19IsyExFCsw5RGNZl3ebJtc9Ig3pYBtIceXGu6EdaTPmfkXyqcwtI/ipINZck
         xEDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmMMK3MpzaRMSyKdQchjZXVW7ZCBA1ema6gP+VELbqXPS957XWsqQ4izSeDPJ+7TBQzY0PHzYOvmcRvn5jxwFPSw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzlI3T3JIOKdJACAa74bJT+SXbiuohVDjCLEqlQBoJSBxjJf7OU
	YZgrDOiDFvBqRpnVCL5PAZn0ZJ48dR42/TP6G/4N+Z10xLDAoCatMTyL24YNCC9dLoVEid3DyY3
	cngSvuwlaDwzGT9rXRO+a2y+Imn2cV2oP/XJOEW2qJKABjYwusfc+yWbhfhf//2FyJDafi9ziBg
	==
X-Gm-Gg: ASbGncuTL6/ly6GU7P/lwC0UNWk5j5yQMn0BP1rLdN7PxEGpfQ5wlZEy+vgnqQ8vOqR
	AUTe3aSzzP59kzttUQ1uJ6zHMlnf5kWR8o/gbTFyMNGP1+XD3uxt1//PpsBO3PZLUhXrMfRqwN6
	NvJz1M91k2SQTeHwDDd2n4C8x4j7ZfcP1xETRCWxqJLxrxKbDs5SJEX0T4uj6Q5jAYNykdn3MGe
	Gm2/X8G7t6gjHGffRu99FYBNNq43GCHpIBPzLCuzEMj1q3G26ZjllUHPu8Frs5E5BgtTHMmmesV
	WmknObHm6UurLge1sTo9HdQ0Roz82GgNRxv6ETfLf41Ain1wck7HgzoFF+8=
X-Received: by 2002:a17:902:8f85:b0:23d:dd04:28e2 with SMTP id d9443c01a7336-23de24f375emr43328155ad.35.1752139065785;
        Thu, 10 Jul 2025 02:17:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRrq1v9TOcKehLshyNd7Q9DOKQg1TlB7iqx+awqZ/WY5auAdU7wXya8kio0FJy8iSW3PY2Pw==
X-Received: by 2002:a17:902:8f85:b0:23d:dd04:28e2 with SMTP id d9443c01a7336-23de24f375emr43327605ad.35.1752139065322;
        Thu, 10 Jul 2025 02:17:45 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4341d51sm14837765ad.189.2025.07.10.02.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 02:17:44 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Thu, 10 Jul 2025 14:45:49 +0530
Subject: [PATCH v10 07/10] arm64: dts: qcom: qcs6490-rb3gen2: Add PSCI
 SYSTEM_RESET2 types
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-arm-psci-system_reset2-vendor-reboots-v10-7-b2d3b882be85@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752138982; l=1169;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=hDcOEnYaWsyU0iqVg0jGaDC9VsmHgvyimm+9MopdURY=;
 b=LLxxdiwC89+T3X5nLirDzCvhuvPRD/c3MNOaVzUQd4mRVGpcSzTIh7ADcfoFeLkJX+zkArk/k
 5kif1NoHvivCPiFySaWIVEsxNKuvF2Bu4vUXGv4gtaXwnEgWXYmX131
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-GUID: DhX9VpSscI7vM1UG_7oeuALaDRpqjOmI
X-Authority-Analysis: v=2.4 cv=W7k4VQWk c=1 sm=1 tr=0 ts=686f853b cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=mlMSzhu8tE62a9u_TvcA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: DhX9VpSscI7vM1UG_7oeuALaDRpqjOmI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDA3OSBTYWx0ZWRfX3Te8rY2Q9Br9
 QPMBCO6IlBBIM6PKqsTieFQM8Ws6rvc6lybVywwloZ4ckZfjDJqC6JNCBV8nGFZ1/SizeYx7CmE
 uSeGv3+zSBFtF5k4+AFJz2ZzAjorywxc+8VwYUgcslA5q0jNSJ7Dpukm3Swy/SnfZNIm8iTVtms
 imZs7BTIv5HGplawaqicFJeAWqhoSjnH6ErkzTITnNA6qj3b0QheJfI311DMHEbJCQnFxVJTay4
 +u1N9Nh9mGr7nfsjVnmpsETTdagC5wAdje2X9lyAQHZ5FnNV/mktzpuin3lnO+74wAO+rocabG3
 jpc57R377k6+9l3nPFY151i7x1jtIRL/eNruCmiSwOn3Fdd7PlzLLyc5dOU4OOVoQskNec9zIU5
 IvHU/6SLonaFt7KshV2XdbMHU500jz+Z/H7LS+gZcrr53OUhe1ROSb04UQKK5DMAG6EGeX8E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-10_01,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1011 suspectscore=0 phishscore=0
 mlxlogscore=932 priorityscore=1501 impostorscore=0 malwarescore=0 mlxscore=0
 adultscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507100079

From: Elliot Berman <elliot.berman@oss.qualcomm.com>

qcs6490-rb3gen2 firmware supports vendor-defined SYSTEM_RESET2 types.
Describe the reset types: "bootloader" will cause device to reboot and
stop in the bootloader's fastboot mode. "edl" will cause device to
reboot into "emergency download mode", which permits loading images via
the Firehose protocol.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Elliot Berman <elliot.berman@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index 5fbcd48f2e2d839835fa464a8d5682f00557f82e..7c06fe496e800e758d59ca793785d7c2907df8dd 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -966,6 +966,13 @@ &pon_resin {
 	status = "okay";
 };
 
+&psci {
+	reset-types {
+		mode-bootloader = <0x10001 0x2>;
+		mode-edl = <0 0x1>;
+	};
+};
+
 &qup_uart7_cts {
 	/*
 	 * Configure a bias-bus-hold on CTS to lower power

-- 
2.34.1

