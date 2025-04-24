Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26664222574
	for <linux-samsung-soc@vger.kernel.org>; Thu, 24 Apr 2025 08:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745484423; cv=none; b=aX5GTwu/bILqFUhirbYZB+5BpqQnCk4aBuWu7Vyt3UeRG0JDNZonrKkXMfRR4IihzEbzTJAXowqrAvI4Qd6L5joKeVE1yXbpKm34xwjkIRmnIIEDDRPWW3dpsgmAypkrBUyBLbXgVMye51eeedGi6+IwL8R4NKx8P9KGzmx40/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745484423; c=relaxed/simple;
	bh=I97E3x+4QGH3F8HH8iKxf6zuq25b9jMkkXtPCrx861w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SBXxm/JMBfmA04VvZyaEXTUaiUEU42xaer55ITDglbrT1DTwWvgOcbHzVXbWOre6LVkwI2XahJxnU0LBRSQOlTt5Jo2so69hiudKfVAJB1k6ZwrPnkCVAelmjXMeSKmNPVNrOwlL2nMQbY7nVb8Fk0WKLaPYG6prMuWHka156rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XvE4Yyni; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XvE4Yyni"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ac73228ea73so7196666b.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 24 Apr 2025 01:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745484419; x=1746089219; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=InmVeShwvVjzvGgHpHUKVWXO3tEYZy+95XoB/RnU86Y=;
        b=XvE4YyniX733luBoLe6//HxXMZzjXCzCRNZ7H+PNRDotYycGEw5VfU+a3Grss7jU6A
         cjvdWgqHYbrQ5Yl+nTieVDuaJNvVdaASkpbBu3HQtA28DoYmxS14LZbdgZ6LPMxnJbp7
         eVnZTeAOiFyl1Z5eFtz3h+pSFZ+vGPf3iQxe9Ir8rdk1WVAj+ycxJZirCA1LSuVMOFo9
         tSY3n4FFx0bVb4otbPEJ3Ace/Pn/c8/QdxZUv1FV/W5FRkKrRErwCYyUM8FuEiv2+RVB
         CLznchfIvkb5KYmmEHW1rVM6BeIOsbDYMXV46zHEpwgwlFzi4RyOIvbhQapyOa/qZOGh
         UxaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745484419; x=1746089219;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=InmVeShwvVjzvGgHpHUKVWXO3tEYZy+95XoB/RnU86Y=;
        b=Qtrw1CXZNmjxqVsfFxQVsiH2DqzLRMvcm+uN9HPgMH2CLZoU2Lo4Hn4b6Y3PGwuoqE
         D8ENATWKO89kjWM8pqiprRRh10ZlyviYYAdG1pdaXWGsRr5XOzrYk8Y9P+DP1seurI8t
         elQTEh2ooShTv2fbO/DCTlRi+/7Nx7W1Hq8iu91e3SdUhSRJHcvNgnG7Vs0o/XeonHcP
         8QJe1XndQMSZlBCe0a4s74f59hyqROzBKoud40pL/fJ5PNntDDLWARLZLp3zQmvzO+BC
         XnyWdw2f8qad7fGxFWcc2Ee5/tXxk3QvLWMvPb0K+8LaMWtbGZ6ZuNJwk1eLoFz4ebp5
         rZtg==
X-Forwarded-Encrypted: i=1; AJvYcCVFqZxMj0UOUvimxCJ2/pJzx08itJl/d/I29qBOp0XvgdUJVTc3B0DVUmb3+XyWI2dWT9bq2wRM376+xxOWx6yxkw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7pCtnruxsaWkFRO6aB3RPU9MzqNXarpT5C3Qgq7AMlCakKfP7
	JfgmNXz3SaAKYRUQH+ABDjZ6JQNlN8KABpXBvNamL08BLR5Roumnq09yThE3LYo=
X-Gm-Gg: ASbGnctw4Qb4jtRbKtjMsCFN4RiAVYMk8Fann5yTChWsy70dHUsQ0oPkMN8qkyoiDz0
	H7C3Vy6UweI9h2/lVrNgTG6DCwE+6eBbS3Tl0ZM/dneu/bL7ddVv2x83ujXmfcCabeeZyOkcjCQ
	UMb5Au/L7OXhriT5oiDr3X3URMLnig/+Cb7hUyQ0SdNvJbGpdboILhdHAaKTU7AUI+Cn7MfUojF
	e99j5+meu0M70bm/DS/syAByQOjzUYJEjqo9WswtmPpL2a9DEvgf8ypVX1XDHHyNCooA91dgVWO
	Ox9VSyCtAqFXhG/TnUdubw72uY58FAn+H1L9kzPuP/6D/cP5yg==
X-Google-Smtp-Source: AGHT+IE9+DPre4j2x6keFqgEO7PT+Wn5fGJGtZZ61C/F7fDAucCVLJyYO32bRzby6KLv1OyEu9lE/w==
X-Received: by 2002:a17:907:3f87:b0:ac2:6d40:1307 with SMTP id a640c23a62f3a-ace57429fe2mr61424966b.13.1745484419430;
        Thu, 24 Apr 2025 01:46:59 -0700 (PDT)
Received: from kuoka.. ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace594b63ecsm73139266b.0.2025.04.24.01.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 01:46:58 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] ARM: dts: samsung: sp5v210-aries: Align wifi node name with bindings
Date: Thu, 24 Apr 2025 10:46:55 +0200
Message-ID: <20250424084655.105011-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit 3c3606793f7e ("dt-bindings: wireless: bcm4329-fmac: Use
wireless-controller.yaml schema"), bindings expect 'wifi' as node name:

  s5pv210-fascinate4g.dtb: wlan@1: $nodename:0: 'wlan@1' does not match '^wifi(@.*)?$'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/samsung/s5pv210-aries.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/samsung/s5pv210-aries.dtsi b/arch/arm/boot/dts/samsung/s5pv210-aries.dtsi
index f628d3660493..153514e80c9a 100644
--- a/arch/arm/boot/dts/samsung/s5pv210-aries.dtsi
+++ b/arch/arm/boot/dts/samsung/s5pv210-aries.dtsi
@@ -855,7 +855,7 @@ &sdhci1 {
 	assigned-clock-rates = <0>, <50000000>;
 	assigned-clock-parents = <&clocks MOUT_MPLL>;
 
-	wlan@1 {
+	wifi@1 {
 		reg = <1>;
 		compatible = "brcm,bcm4329-fmac";
 		interrupt-parent = <&gph2>;
-- 
2.45.2

