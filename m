Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0B1489FAE
	for <linux-samsung-soc@vger.kernel.org>; Mon, 14 Sep 2026 16:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789403579; cv=none; b=skTjTQJW86u05zEsNia2G3yVcF+nYp157u+11G6YBx/ZTbeYfmcTY70tRFtUe19I59a784SqtrcdrcHlwNxVQPTjw+osMupPHX0HB6Xy5BmgC7ZFwkKRIkh3hrrMyM7mlx1hOKuKvUgReZXDXRDjPo3HDFM0RfgciFyTDBvlosQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789403579; c=relaxed/simple;
	bh=u3ip+RRXt4HMU6c7yGbkOPs35P2CelDhQnnshfbNVW4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=W6cwWTMIwBkv8LVqkT0Q32y9gJzPshw18/L03YUj3v1knLQogEAKdY7SRX9c+L+o5WbpHkjbZLnbhSioT62C7zA7sEz/zU8rEMece2svA17dbxvS6QeSC3U/4UGRHYQT5eXHZ2z31NR4goofdt8hEyz3YWn+m0vr+VUfNk0L3Jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xSrOcZcL; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xSrOcZcL"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49e717c9841so13027045e9.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 14 Sep 2026 09:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789403576; x=1790008376; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GVoptFjQoPJzZR3oa46rPkqQ9t2mgiZ9r55mFPnK2Qs=;
        b=xSrOcZcLQ3MJJgmmv6k2ziMsycCZHwzbN0QTjzQc6ebO/m+9SShRaov3wVnWIA5KPz
         5+CXNMQTQ7Nd4OxcNl/I7kKPZWlRV8KNYz/D9Ig0Bv4ZdFrckswpvDpn2TGFACydAwzv
         QqlSo766z3CzZ9qiebVJA0G/UswqejvyshFG2/wWrf/yCdOwjcFhc2eTNRujN8vh/Rs+
         /g16BLdSTjTdmNu8+gkCGdajo/sbiJvtaRRjZsp1DGCV8dTsJK2ZXnuFmR9EWCJ38A/t
         vQH2hkbMWaJayivFk3/0kzcXyLlyGdSWO/Kp/aI/gxKk7iianH+DibSDwLbM+DHoND9G
         ADvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789403576; x=1790008376;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=GVoptFjQoPJzZR3oa46rPkqQ9t2mgiZ9r55mFPnK2Qs=;
        b=XoUl2aUu7mebn9Ev5xyYhhtHyWU/DZKVYbQgUAVHyTJap0CwWbzTao/vKXdSRp6sk7
         mTtd/omKLXEiAQfGh2Qp5331ZIxDiohJ7bWuM2PWPntJx9is831BbclfLJ7swZw4ISYs
         c5bWntVZJm/K6h/NopX0bS2hqoz7WjLuLIlTTRcmL3WBinFnrPkLXFMC1XbcsUUABWxQ
         GTp+UbNo6d4VSAjlVbnL/Dgw44o8mUPU0h6PfWWEcLJsGM8EV28ucDcIbTvwmqb0kJwh
         dTgX5qyK/2bWm6fXSZI/baYbzCIdrNIMP4iamz7W8ngIxxZ/xaiTY4Q0PllKeGzRGqlh
         RKvQ==
X-Forwarded-Encrypted: i=1; AKwUvByTseAyoo2C+pE6Mty+I4PTwokxpyT1N3dJqvUZajM2onUEPXQ/mD6MXhVBthdteGPMHRa2Qd9dTn7QFmtf+Lwiqw==@vger.kernel.org
X-Gm-Message-State: AFuF++nLN3DI6HYvYEQOFCxEIMEwT7Y5TZriBPFJU18PT+mUfdadNrDs
	6vveqqkCVQC4JP6cVf2TqAiDOdHtqiaI2tWS7LvI9YmtYm4RHPv8efzdU7dstYisdNq3zC17T5c
	Ss4zJ294=
X-Gm-Gg: AYBFou2RHpTlrKQAQFjtges6CMqhxO1yiENDP3EovRNiqs9clg2WZcjmfppSfX/6U1P
	u6C+4qzXGmlOJOb+noSi5JPYryItC6FRN65R55KbZPQf7ATB+DSTtUlyw0o64hEBxwrsvDXO5C6
	uPWMyMJXPoXnZAIFUkPjlOjepLRfmdslaEiOp1LIZiimW1U1xeDEyCiZl9vuVLkSxbTkSeF4hph
	VOD7dFRz/z+XJ3T7/lOIZ6rGRHRpWzgDL98Dzo72ojQ2O4IKnrbsACX6VtCnxnSII4V02qXkWL+
	oLmu8G/Ums1kc/M2WYpVk+A5w5QN1gGkH1YYoukhkj7KKwmR5iHwUduug4rlMtOSkMycromILWY
	YfDP7rNVpBuY9QHbQnvEJ5B/x2Y1haxjVctwyUJ5m4ktzNSeugTc52praKcpc8fI8dCF3ogKiZG
	EsrehQ6g3RC0DUb+By7dSTdCJjVWgXydFBlDZhP4xxJn+2BF0OiciU5zAQmQgLTqARzPLYx7E0u
	qfIATFlHafN4zGp7hHX/EFQwWwyJmKZVARYjzEzuQMw+TlnRTsErYzAMzPNnJM=
X-Received: by 2002:a05:600c:6383:b0:49e:74c6:d973 with SMTP id 5b1f17b1804b1-49e7a67e2d4mr40537305e9.31.1789403575710;
        Mon, 14 Sep 2026 09:32:55 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d284a7bsm25431815e9.3.2026.09.14.09.32.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 09:32:55 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Mon, 14 Sep 2026 17:32:45 +0100
Subject: [PATCH RESEND v2] arm64: dts: exynos850: Add ap2apm mailbox
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-exynos850-mbox-dts-v2-1-798585c8f1ba@linaro.org>
X-B4-Tracking: v=1; b=H4sIAK0hqGoC/32OMQ+CMBSE/4p5s8+0pYI4OcjqoKNhAPqAJtpqi
 wRC+O9W2B3vLt/dTeDJafJw3EzgqNdeWxOE2G6gagvTEGoVNAgmYiZFijSMxvrDnuGztAOqzmO
 VliklURRzySCAL0e1HpbSO1yzW3Y5Q776jt6fsNGt4c9ste+sG5cDPV+Qf1s9R45JHRVKJKRkL
 U8PbQpnd9Y1kM/z/AVG1q3P0gAAAA==
X-Change-ID: 20260429-exynos850-mbox-dts-c9b9e7336140
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3

Add mailbox node that describes AP-to-APM mailbox, that can be
used for communicating with APM co-processor on Exynos850 SoCs.

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
Changes in v2:
- basically no updates, dependencies were merged so just re-sending;
- Link to v1: https://lore.kernel.org/r/20260429-exynos850-mbox-dts-v1-1-7f3ad27ed4f4@linaro.org
---
 arch/arm64/boot/dts/exynos/exynos850.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
index 911643008b9f..bdf177d08ea2 100644
--- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
@@ -319,6 +319,15 @@ cmu_apm: clock-controller@11800000 {
 			clock-names = "oscclk", "dout_clkcmu_apm_bus";
 		};
 
+		ap2apm_mailbox: mailbox@11900000 {
+			compatible = "samsung,exynos850-mbox";
+			reg = <0x11900000 0x1000>;
+			clocks = <&cmu_apm CLK_GOUT_MAILBOX_APM_AP_PCLK>;
+			clock-names = "pclk";
+			interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
+			#mbox-cells = <0>;
+		};
+
 		cmu_cmgp: clock-controller@11c00000 {
 			compatible = "samsung,exynos850-cmu-cmgp";
 			reg = <0x11c00000 0x8000>;

---
base-commit: 1a1de54f7369cd2b5bac0f265910e60ad3a6b4c3
change-id: 20260429-exynos850-mbox-dts-c9b9e7336140

Best regards,
-- 
Alexey Klimov <alexey.klimov@linaro.org>

