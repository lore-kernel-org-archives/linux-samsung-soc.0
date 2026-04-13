Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40BF93CCFB5
	for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Apr 2026 14:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776091954; cv=none; b=OcoCmuaosLIlb6wCiAHTnfg2KPWz3l3tVXgtnqyn+LMA4M7j+GZtQg9XKySeL99QLoXGtiZoGG+K4VTxAriQL6wZXRO5zAp+LMxmZ7SNX6ITt9gt31bQK9uo2KCi8fPwg1ieYKpggkPXRc4WLoaAPs9pikK1D+yf9YVeFxRmeFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776091954; c=relaxed/simple;
	bh=cCubYueH0qLW+QWfSQsLGhAjtj9WSnKpp4/RQAx3Jx0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=S7eZ1wBNvVg/PAd3Kyx5FCFbrlzrnqUsnZyOhQ0KNlEINuqyy76sD5HbyF7adloFd+FKJVuYOPxJlHxy/3Xd+n3qUk3SPd2oVry+4gqHQG7g/44IN19KYrvSsX+UZMMCBD3xOcOdSXEEc3IP4nbjwBeDp4wQdF0KWmwS/2eYqOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=on7DFg29; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="on7DFg29"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-488b0046078so44779045e9.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Apr 2026 07:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776091952; x=1776696752; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p/6HMiyt/iS0Y9mWjonqDekXe/RdLN17oaBrG39N3lU=;
        b=on7DFg29KQmqSxhQ9jHUfU4HLJ+YGVjZ82TRLAtwfQ7wbkIwONVFXlb+t65qJLzp4Z
         cpVZr8MF4ncD4mAv01J5qzw/xrsnRaELDVYqO1BnPgBDQ+oGURmWJiQBm2d/mK5lbZc4
         xaULjBurUhHNKGDVcUJTGsEO8s2xgchu5Usm0RRqS0zZSPSA2CCcAkex2fo8yENbohOb
         HBBr1aQ9obLFRltQPhYrgiWxhaHZghczwnkKIeaNpsWPre/0n401Eru8Az/19Bbs/LFj
         Jj52Xnf8q7mmc13eMXiHXhHvxM21ffslraxUUbtL1vaoozQ0dXpJowYlnhUCIF77NmZM
         EcUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776091952; x=1776696752;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p/6HMiyt/iS0Y9mWjonqDekXe/RdLN17oaBrG39N3lU=;
        b=DnHBbjJBabtv+6t/zcX/BqYl72XEUXnFeovDAIM7OC/mjBDj3jA1MS0PJkcndJotRx
         dSwFsX6OmKLIYX9ittWMSkVp0MU507Unzqz4X+YXSWQBbc9RFG/CbMUXu8ToEUJ8QdZI
         hAwpDzUaUxIJ+9Rdsmzp0ojPLdI7SXE+Qfpj+QC/D9UaA6iotO53RvnZUdrdjUyGljhV
         oqFwOOsNgNz/eJsbI1e/chakd+v+Hsnh4ZfNTQkX287e91KrcV8X1aPKUGfFzJ9G/vpg
         iGGYaMxf/HOxo5pfeuS72Ju0rYBGml4uoD2aE+GSg0mVzDXwhcLbNtI3J4GjH5fHQMkR
         g23w==
X-Gm-Message-State: AOJu0Yxh1NRdMnejo4vWUhsE8vMuPQw0Z1FxPF4W0K3xyD83Us5YGGIb
	ZbOX7EQRI5G79p3l1RxPt2j5GxT35G2p8wJ8a90/d/1MTUfaPJB149jTjlmPgz3Lv/c=
X-Gm-Gg: AeBDies4Eo9LTIBf3sKCTtjaN4vkyM7fuIfdykDnl3QZ2eFrHh8XF30V0N1hWpkNZ+q
	9tTxbDfT7M7X2GWeelTBtye6boNZxwjwkXzrqLfoeOWFw8pqBTUsCWdWOgr/DazKlMJ/g6dz2PF
	ulcxzRWAzcSgEdIlxYazArEwXd6cuYmKIiosKMjNAC2S28tH5uGLfoCN+xISLFNbpJA0I5VfWn2
	w0liWrz6DaX+HSM8uR68FaqrWPAd/QDl6Zo67bq9gG+ixgJzNUQ+XiT81TBsP8Vxhn+GB5QVlZv
	ZpFT9JpkGmSlfV8APx8SaLnWp9/wJvWppGgtmiSLJdSsaxn2GtpG0du5Xq4NsGPCq+K5JypW6fd
	bPlCnPFFMd7KGKBaX+lh51VhKFUmW2ZBlFP9bUb5lB1CnbZYZfrxQuG9shlg2DYcYsD/vOlOoIu
	fEyNVakFyIFf+dS7unplG+to3xcM5hNu12Wp+8j99j1CEZcrsxcwCLJAUCSazWIH40AQvbakgGF
	Rokpwnx1NR/8BZj
X-Received: by 2002:a05:600c:3b24:b0:488:c078:bfda with SMTP id 5b1f17b1804b1-488d688d2a1mr187716825e9.26.1776091951590;
        Mon, 13 Apr 2026 07:52:31 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5344e28sm323015825e9.7.2026.04.13.07.52.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 07:52:31 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Mon, 13 Apr 2026 15:52:30 +0100
Subject: [PATCH] arm64: dts: exynos850: Add SRAM node
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260413-exynos850_sram-v1-1-7fda5b7fb7d4@linaro.org>
X-B4-Tracking: v=1; b=H4sIAC0D3WkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDE0Nj3dSKyrz8YgtTg/jiosRc3eREQyMDgyRLy1QLIyWgpoKi1LTMCrC
 B0bG1tQCLfvyjYAAAAA==
X-Change-ID: 20260413-exynos850_sram-ca1200b99e82
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexey Klimov <alexey.klimov@linaro.org>
X-Mailer: b4 0.14.3

SRAM is used by the ACPM protocol to retrieve the ACPM channels
information and configuration data. Add the SRAM node.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/exynos/exynos850.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
index cb55015c8dce..cf4a6168846c 100644
--- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
@@ -910,6 +910,14 @@ spi_2: spi@11d20000 {
 			};
 		};
 	};
+
+	apm_sram: sram@2039000 {
+		compatible = "mmio-sram";
+		reg = <0x0 0x2039000 0x40000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0x0 0x0 0x2039000 0x40000>;
+	};
 };
 
 #include "exynos850-pinctrl.dtsi"

---
base-commit: 66672af7a095d89f082c5327f3b15bc2f93d558e
change-id: 20260413-exynos850_sram-ca1200b99e82

Best regards,
-- 
Alexey Klimov <alexey.klimov@linaro.org>

