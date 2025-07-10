Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B7B229550C
	for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Jul 2025 09:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752139039; cv=none; b=biHq9zM68Z4+ev7DQV11sA7vawn5waJhsCWzbnTyyf7RC9VhPux82BmMJF/X1QBhlrJpHguUnRQiD73Y4x9/XRbbF6j13oXlGnTfjTKLGXY0KyipKo0FT7xXndjaytcdsuQc9hjPXFJdL/I9ev0u7A+8elyelPMUAQGXc8gWjQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752139039; c=relaxed/simple;
	bh=khn8GMlrTtxNNR634wsCseHe/a7/+U/2qtnSEpHb+ZY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Rzzvg7YNRSDY9/lMmTCGKH2jY7bTpaMU3vmxq9RPlr3R+AtX4CMcV+sxoxfcF2YGwjDT+jazWVKYYgdblKQ3Pe/LjqQTSHZIriicGop3cQhfG7nglcNaxJOSfoZk1ja5vvvFrmRMBM9xbsGl/7iLhAiHiTeD4qgabp6KHQwtPB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ni2uPbDR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ni2uPbDR"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56A9BRI8014483
	for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Jul 2025 09:17:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bm688pDoN1t58GLFHGhBI++/OTcmZdbP8x57uiG6loQ=; b=ni2uPbDRJeSqMnI1
	f5s4NXc92iTmeb4IiqlqTefRpdkV3ssbPXnkVqXkAAld3lrVzQD1hX4klx2Ooj8f
	89z5aHK6uVOdc3rE0936FhwbP75pr+yoDnkQdLYtqtjf4Sar4xpk3loikBcq+FMK
	Cjch2UovUfMG/CMATQlqe6GOo0ToMf/kqj++zc3uQ9+bzXtydsNwW5n4FVoD+5Bq
	fMfP7H12VkLkSD+aKEin91RVxLZIxvtZJiQJhrbRpFyboJbPSLnEmtbxNQRf+A5C
	+IESMd4WSO4/mANV5+oUz50rfb1+fMNHA+wdy+B2XuxNBwCqx4L1RpgEaUTPS/Q8
	vnPlQQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47r9b1591b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Jul 2025 09:17:17 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-23536f7c2d7so13341165ad.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Jul 2025 02:17:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752139035; x=1752743835;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bm688pDoN1t58GLFHGhBI++/OTcmZdbP8x57uiG6loQ=;
        b=AEmEi5erHBGH656qLpYSdbr1O7EBEqSQ2EeUdCQQdl33JfzrQhysMQxLgIgyDvUtNr
         +dzDivXJaVslGjuR7b8KAM3a0ZIY0dxh5CzPsxjv692GW3TTI1gjeriRhZf45KagCEGH
         At+d1Dn/p5D/FP6EbrpgN8kWbb15iQT27OCIe8MNLxTmieJcQYI2JA0gG/pfghb/iqhv
         YKGtgKzSIzZsZtihsBQgt7vJaCub4+k/S/lB0FyNWxd8RPEs8+NTujfq3BC700IRx7kq
         ndWr+tfFXfXUzZhxq8N/z3bTumRFvGwDTyhoHeaRrf/OfJXnzJcetdjOVMAA1TaKDu4b
         s8sg==
X-Forwarded-Encrypted: i=1; AJvYcCVIRlLQkRmxn67OFDmEY9lolhA9NE/qHwFYcKOFqBq1QCmOBdAau2lSrUaN5jvUwzmutTHu6ujcqyECcFZYeKzm7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzELy61U+H4+/84ZO/zcGJEYoHkJdK9cUWfSLwRtQc+H6Spovq0
	DX2ktDyVviNHTYJ0AeyBnj5Bwg4VKOXdVecTYKQ7lV4S9nYqGX2v/s+ZMQvczHTay3GYHm04G11
	gYffx+Epg0wXslGX8ywQWPUt1sFcJtTDtdzfc40LGl3ynOWs1rlXJ/yKj5N04Ov5ylHLJKL92+g
	==
X-Gm-Gg: ASbGnctf35QjEefklQQ+kMFNFFrgvI3xwLErpn02kRu/eOVBZ313Cxf5jr2pu1LPAb/
	H+mCJsT+e2UxAczQjpGhK3h9j3tvnbazrfnGnh9h9fqF08zTFkGQWrgKhLLcWy851Ji1sXuhB/8
	9Qms2TCfeHH97V3rC+gmGPUL8UN56XlbMTHg2cOxKmLCc5leZVSHGY3fWjKMaRF8dEQZ3FouBcx
	N6c1oak+6E36ZweAwB5bj6ZK3kk53dK4vs1+4jx5hdVkcRJK/4voGPEbt8xHL5uHWCUyxzwCcgg
	SVpl42P2UmOoExt1i/269uW1jq0gTBqTbOghjIqM9/YFXl4JvsCqzqZ2VeY=
X-Received: by 2002:a17:902:cec2:b0:235:1706:1ff6 with SMTP id d9443c01a7336-23de46edf4bmr28705445ad.0.1752139034628;
        Thu, 10 Jul 2025 02:17:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHwquEcV/DEQgNHo5i5rKIMG5wYJOS8HD0ETiQ+J8XjUT4+2RRoWOqCstZDWnrO0s1dBiyXug==
X-Received: by 2002:a17:902:cec2:b0:235:1706:1ff6 with SMTP id d9443c01a7336-23de46edf4bmr28704665ad.0.1752139034147;
        Thu, 10 Jul 2025 02:17:14 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4341d51sm14837765ad.189.2025.07.10.02.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 02:17:13 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Thu, 10 Jul 2025 14:45:46 +0530
Subject: [PATCH v10 04/10] dt-bindings: arm: Document reboot mode magic
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-arm-psci-system_reset2-vendor-reboots-v10-4-b2d3b882be85@oss.qualcomm.com>
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
        Elliot Berman <elliot.berman@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752138982; l=2500;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=LJQmaaDtgt8TROVTUTsTmEnpeK2uj+7rigIrzNpy/l4=;
 b=iy9PU4ZJOiTEn2epqZUOkW8+Xr7tjFQnf02iWN5UFpijHHJzDb+DQE9zwiCZcqY66/IiKYTBH
 Qa8lCfgZ15ZBxIImBn1nkijQHRDyoW0jh2GQrhRaXOvI4e1VEJRpOEa
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Authority-Analysis: v=2.4 cv=dYuA3WXe c=1 sm=1 tr=0 ts=686f851d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=UInjrUrXc7y1C1sAkbYA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDA3OSBTYWx0ZWRfX5s+MsPn6Gert
 cdWW2rfcsIPqrYFaJDj7OwO7Cvo39ik2dGqI4pCZ0baq/6gZFAMfJASJQXRNbO/gHieAvdQiGhe
 qlVDKMVqWn/kUgmD6urJuUeuNv9LlNcaWBmXfzXRvPtbtpKTGh+eE3SI6tfVnkmD5o+XDNXvElT
 I3dS581fduf5wEAEQPFoXSjtPWRsGrt0XFKTeWhbHX/2PhECqigd52uZbtIXEi64uYr3EWTqnHI
 tl0+j2pRnc6rHrbycE6TWXsPXKFOpYAje7YcUnE6QyQyt0wYzcov5szEWMaqw+PrWDDoqXRNACt
 6xgNfEpT50bnNPSiWy9u6ik9brVxIhBcpSq/elkziTtUgSjIGJpggYpLlEngltGRSYf0xUGukxo
 fkt5GVO+jdJr5EQ7b0ZcB7iC7TDihUqZOU7PqluRrQX9nipO4IGnuykBo3yohxDwvQVyvNN3
X-Proofpoint-GUID: zJ2e88Ccg7J3dztFgtBDtryFJadSN9-I
X-Proofpoint-ORIG-GUID: zJ2e88Ccg7J3dztFgtBDtryFJadSN9-I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-10_01,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 mlxlogscore=999 malwarescore=0
 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507100079

From: Elliot Berman <elliot.berman@oss.qualcomm.com>

Add bindings to describe vendor-specific reboot modes. Values here
correspond to valid parameters to vendor-specific reset types in PSCI
SYSTEM_RESET2 call.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Elliot Berman <elliot.berman@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/psci.yaml | 41 +++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/psci.yaml b/Documentation/devicetree/bindings/arm/psci.yaml
index 7360a2849b5bd1e4cbadac533c1a7228573288d4..672fc28f69ed7cfed4baf8c2185e0cd7b2024376 100644
--- a/Documentation/devicetree/bindings/arm/psci.yaml
+++ b/Documentation/devicetree/bindings/arm/psci.yaml
@@ -98,6 +98,25 @@ properties:
       [1] Kernel documentation - ARM idle states bindings
         Documentation/devicetree/bindings/cpu/idle-states.yaml
 
+  reset-types:
+    type: object
+    $ref: /schemas/power/reset/reboot-mode.yaml#
+    unevaluatedProperties: false
+    properties:
+      # "mode-normal" is just SYSTEM_RESET
+      mode-normal: false
+    patternProperties:
+      "^mode-.*$":
+        minItems: 2
+        description: |
+          Describes a vendor-specific reset type. The string after "mode-"
+          maps a reboot mode to the parameters in the PSCI SYSTEM_RESET2 call.
+
+          Parameters are named mode-xxx = <type[, cookie]>, where xxx
+          is the name of the magic reboot mode, type is the lower 31 bits
+          of the reset_type. Both reset_type and cookie must be specified.
+          The 31st bit (vendor-resets) will be implicitly set by the driver.
+
 patternProperties:
   "^power-domain-":
     $ref: /schemas/power/power-domain.yaml#
@@ -137,6 +156,15 @@ allOf:
       required:
         - cpu_off
         - cpu_on
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              const: arm,psci-1.0
+    then:
+      properties:
+        reset-types: false
 
 additionalProperties: false
 
@@ -261,4 +289,17 @@ examples:
         domain-idle-states = <&cluster_ret>, <&cluster_pwrdn>;
       };
     };
+
+  - |+
+
+    // Case 5: SYSTEM_RESET2 vendor resets
+    psci {
+      compatible = "arm,psci-1.0";
+      method = "smc";
+
+      reset-types {
+        mode-edl = <0 0>;
+        mode-bootloader = <1 2>;
+      };
+    };
 ...

-- 
2.34.1

