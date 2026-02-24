Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42E1A396D2A
	for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Feb 2026 12:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771936074; cv=none; b=m1BXewPiRfUDkyeTETIkmuA+326peQKGOcKreRFYRZzRzDH53POUiylafqGCuAepoeuuEXcdG4xCJtCUCU9VIO8FwtRbVwln7kQOHyZ8TvVw1I2S3Nu4pxhv7rROE8+dXFoe8pZV9ro4lNERC8BprivqIzPpo7KOdtiXRvFvF1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771936074; c=relaxed/simple;
	bh=J9Qef/qoIJidbPmIW/Z2j438gZALQ1kgT5Gn27Ae9xk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Py4l0ugA+kXgQjLS+cj3K044eErPF4qdR/SODgzKjhHrCbQ3XAQiLlQ+JqD2uZTg+efMtS31sc7V1YXfPblbbpg+68tkt6+Dz9aA8KIPSkZW2KO20NQagiT2Z2Ii/BZKt3Wi0Fm71DpRy0TUHRsOnkQRcETh7cyHFhSYQAc3Ewk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nSBHgL08; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h83DhRdb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nSBHgL08";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h83DhRdb"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61OAFNQ72006384
	for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Feb 2026 12:27:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=9Ir69B/GEyfS1puBfTgdxzD/7c4cirDkBJ4
	obVkyjhs=; b=nSBHgL08dO2nmd67Ftux2WonYJ7Le4osBhaK0anZmbWilGtSxwk
	dL6adwJahus23lMqCJ3qMS4BduzBmBBjx9c2lfO04DpjzVgLnhtgVxz/81lMqB24
	6u9WgVuxjTRtfKMI4TVinRRhtReBtoNNLbtYHPSyO6vEbtvb+8RYXv+ro9YWGPVG
	gP/rOXdLAj8S2QwQcuw29qjcUEJlfvHlRE5gsiHCrpMsNNs8wk9rlrweGEbqtnW2
	Qqqd9eGg9ZbVT/Uv5IeE2By+Wejf1H1265wympM8xIgCA1KgwE9WZUfVpM2zmJQ4
	bYF+RT6SNVZyEqWV7kEr8bHCnhFByMoFEKg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ch4569ew0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Feb 2026 12:27:50 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c7166a4643so5215899485a.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Feb 2026 04:27:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771936069; x=1772540869; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9Ir69B/GEyfS1puBfTgdxzD/7c4cirDkBJ4obVkyjhs=;
        b=h83DhRdb7m4DP/BtFv42u8gmSCxe6rEMIX6BDm1fx9goiVul6aCIBf1XP3bAnS53LJ
         bDRxUPnPCESAUZ2jJnmxAVjbPH5pRHuNxPHRVtMVc/1gfWbVik8eNIYyeX+Mr1du25YR
         3+bS25wbciQTMg6w2YIlwPV3dYI6CjrjCiUWKlmAnfADrpHvnmnRr/M6o0UxFtGQyb2q
         QjC8l1ZGJdJaH0hT7IJiYmbqhDR67C1sj/St/yU/+EDKJHOtgFcAJ4QnAkezJ8pTUWiI
         4nP2soUYzOlwfb3cag0NgEmEvTotASM0z2cxV2i0TsLL8Fgmj/fveYgkUZHNjblM+ra2
         /uFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771936069; x=1772540869;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Ir69B/GEyfS1puBfTgdxzD/7c4cirDkBJ4obVkyjhs=;
        b=J6ViHqE3jjLtcImr8XNQpFgwMH+iQHlQhPdySKXsJGK6haVfPewd+jYdARGQnXTmSN
         smtjCYtr4i/Lix3/j1TYGZt6zKSXAVpTpfDqZ4S+eJyUTHg6h40NyBbl7LsapJGxRpux
         WoQXYz3xN1JeD0vyCvqCvNKYJuFUV8B8/et5bFwuP6/EynTxXQJf39tVVlrwP+b7CV2P
         /PsQv+qPUDeY55c0Qqk4xKZbFypQDp/bVvas509ffZQLe2zzW6RnHYwclr2idLNZ7hHb
         jJMVZxPJ828fVJf6JN9QUdTo5BJrnMVlkb56JgmUmLcfPJ2vjDxHGIKMxLPeauKEUw2S
         ulfw==
X-Forwarded-Encrypted: i=1; AJvYcCUXj/RfFojK7G+RhPU+Nt3xC3d1wLsOWhO9ohrDzA3SPEdIJqSalXGl9Paot51iPo0WqTJ3HbI+OSQ0CL0c7U29bg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzO/LIK3SRvUReEau/P+qgRL7ZwYPse8cTIDpMcWgM6SxDsjVAz
	uBygFd5DTflT0OcWw/kKqVjAdQABtTceT8oJUwcog0cgBjfOIZRCl4m+kkOihPRDRKgSFz9Qcf/
	Ve727hV4rkwEXoPWnlm9Af2IOEJJY4FX74jCQnHXqkxcuZjPceO6pOf80Yk1l4ih6Lqg8tJTSgg
	==
X-Gm-Gg: AZuq6aITB5mJtnz6fQE+9eoOOqwtw/hbmG8nKFRK96H2wZg3zjP6IH1Nj90I0042ZhB
	Xw93ZnucN+20ZfwR6FHLMce71tnlwLk7wWQoQHMrm75N45CQVVYxs8cObXKB2Snt72nqOaoT/03
	bmQra4BMdUfmrSjWlomruvZVCetk0TQaXb2FWHhh4FgDiJ3sUWKtTB4cNmNnkFStJJ/MHcqKtUM
	oU2fi+DiqQHwi5I+u+/ryX+1I/k/0Ra9JMG0D7OkEZ8IircZPSklwkQ2Ju2vM4XnTwLwCPtQzOy
	5x7wW8kbyP1xU51y/Zs5EuwyzbqeosRC8z6bBm5APJ2/gyKGG6OJp32OHmm+/7EVethZn0LXjW+
	gc4Ou7FElhGbOIxSUKIGkMZCOKCTseyGjWbsGYA==
X-Received: by 2002:a05:620a:199a:b0:8c0:cec4:b6fa with SMTP id af79cd13be357-8cb8ca8c47dmr1409091585a.65.1771936069359;
        Tue, 24 Feb 2026 04:27:49 -0800 (PST)
X-Received: by 2002:a05:620a:199a:b0:8c0:cec4:b6fa with SMTP id af79cd13be357-8cb8ca8c47dmr1409088685a.65.1771936068880;
        Tue, 24 Feb 2026 04:27:48 -0800 (PST)
Received: from quoll ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43987f3ed03sm4678682f8f.16.2026.02.24.04.27.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 04:27:48 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Jesper Nilsson <jesper.nilsson@axis.com>,
        Lars Persson <lars.persson@axis.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-arm-kernel@axis.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: axis: artpec9: Fix missing soc unit address
Date: Tue, 24 Feb 2026 13:27:40 +0100
Message-ID: <20260224122739.95168-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=917; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=J9Qef/qoIJidbPmIW/Z2j438gZALQ1kgT5Gn27Ae9xk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpnZk7YL+y5BtlCOGbKIsde/kmK84p9VqZKPbbc
 9SBtBQp4bqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZ2ZOwAKCRDBN2bmhouD
 1zahEACLGmkzLLklQhtZqcb4Z4zRNXWDokwSrb46fcOxI0zB4wDMy1U2kfpWP8f3wYQa0F7B00U
 9ad+D0+rDK61kav5GVYNptR5RLuDdjHrsrTy8mBNLLmiWDuSlroI9W6QabvJDSbiwiNVRi/mbnZ
 HwZyac41zwc0Rzw3q1qeSg3Ihd1s4QPSxmg73fkoai+gZhP0X+40xk1AiZ9hCSpXbssBhrfv0EX
 TlHgrjT4e3Jns4OdD0/Z0pFMrg/A2ndK5bTNi5NlHmqEiofQCjht59xQcN/dlSkB2k18bH/RoA1
 6S/+P+5i9LHCcdrfod1We6/SiMBPdk+bipOauy9b0MGm+EL2kWFayd6Xm9zZWpUSzORTUleOUZq
 ePlAPu+BkpuTbnvk5cxSeryvfFOFzL3nqK2R87RjcVG/97X2qTt1goUo1wZRE0eVOWYEZzfqs21
 S9xAew11x/89ijbLyLG+7xrCij6RBwxTz/T/cKOJCzwZ1RibkgbAfXIaa7U0HSEfZ+trRe6dCbs
 EeIXeALKfCHlWdzCFcL+NpSHgZIAer2l0BJWt3riiO7W2kxW0weiSetRni51zPp1hTBjJzWOx6R
 VIp80iF5hvon7OzEN35T3tZy7fv5eUSiEYFuC1nMD1MKhAzmX7p49QSKZEZZgfSSBu9iAn9lf3S z2o266kfRE5+Vkw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: oBpQZb0I367hCYh57AU-u39EGtzbmjUW
X-Proofpoint-ORIG-GUID: oBpQZb0I367hCYh57AU-u39EGtzbmjUW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDEwMSBTYWx0ZWRfX0vHyhi5KXgel
 InJncP7zy9vp4+beVSfs2klAuze287S8JY/g7TMRNhHqu92LZhS0f5TySOE2H8r5gSsuPNIfDjr
 LGvgnq+W4r6mZ4gmuwpIBlud+R1kmjVf/yDJTDLmRJO5DyBb9WTZrbU1+Wvx06fm9KzLa0U9qAC
 SeQoA1Skk9hrVJ5fy875cXurnyDdRWc74d/3AT3R7/RYVIOr7anFyWFrazhrHoVLrQgKd9Gd5AA
 D8R4K4ApDRWF7EsHALeACFNTYSSnD7l0f6VA97EySox+ixZjAqRIM04kWTI2gOc10Cx6KI08D4S
 KOP0k9jNqqozMwywTLJ/s+ierXk2ybZLE5VUOm2bJLYugwWWmoJQY/FCHZVoevuAB3hCSv9cvIH
 Q1sOU72Amh+kOibJ9Eoe0tSNZcPdcjxl0z6WVmz3PxcW1Tjr2wGXHAL3XxZlTvStHscl1+tyhd1
 mcXbZLfD2C/e0wkJ2Zg==
X-Authority-Analysis: v=2.4 cv=J8enLQnS c=1 sm=1 tr=0 ts=699d9946 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=MnJphn7iKxffC-OSF-8A:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_01,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0
 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240101

Fix W=1 build warning to comply with Samsuung SoC maintainer profile:

  artpec9.dtsi:121.11-268.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name

Fixes: 3ae2b7442cb8 ("arm64: dts: exynos: axis: Add initial ARTPEC-9 SoC support")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/exynos/axis/artpec9.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/exynos/axis/artpec9.dtsi b/arch/arm64/boot/dts/exynos/axis/artpec9.dtsi
index f644198fa80f..f8ed43c6e825 100644
--- a/arch/arm64/boot/dts/exynos/axis/artpec9.dtsi
+++ b/arch/arm64/boot/dts/exynos/axis/artpec9.dtsi
@@ -118,7 +118,7 @@ psci {
 		method = "smc";
 	};
 
-	soc: soc {
+	soc: soc@0 {
 		compatible = "simple-bus";
 		ranges = <0x0 0x0 0x0 0x0 0x0 0x17000000>;
 		#address-cells = <2>;
-- 
2.51.0

