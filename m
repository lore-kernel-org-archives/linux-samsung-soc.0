Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9016623BE
	for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Jun 2024 08:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718701074; cv=none; b=H6dQX8OFNqadXcGQycjsQ/A7lbwEHNuVqFtKI2pqj+rHzgAA+kRUDIJV9K1ZMQW63gNKQi1Q3j3HQP2D3+hKKhPwFfn4bxmDx6UnfKYm4pU1hmAdyshRMtFaJjhsdFUicstmOiNWQfeYQzTRQTklN6i7ut9mwSzo5ifKlukMlO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718701074; c=relaxed/simple;
	bh=OfhHEECoMTrvbtNrNAx3G4SFmuDhLfL7z/fJS6M2isc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=pKcS/rf/CWi1OhnoMQqxUbEMjWlTlHpgdwpnDAkEDSyt7pcX7kOKNuhBnbzPe0ox2qD6KmuptVyv5UQiVklNLQUdSROsODPqEaB51hitPlhfam24xedLD+yDrwjsUwd2/wZT7M3fmI8ZNyWj/Gp4TTeT+HiFRkSLqsGawVCoG/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LIA+p9e3; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LIA+p9e3"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a6f11a2d18aso674382566b.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Jun 2024 01:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718701070; x=1719305870; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gQeZLyvewF8YU8DnwJSqp6ymN/u0iZA0tyrclF4X+xc=;
        b=LIA+p9e3dawrY4Ai3oc55miUebFEArdtSI88Wn4nE+O9TnJrdWUYECoydjTnye9rQG
         ZbCDZgD4m9hd+diZJcO6m9LH7QIiwmhQO9cpufgDqwcVIqjoPXUWyGgl9SwQujLwonrv
         YESWQfdByaEgzXKCInWl5Cfyo/jWzpm5YgVNdrKSOuszhnTnent4J2vU/fNETfP5vhNx
         Uk8iM1L2Fgpfm/6ofVULiVGIaf8DDd9xBU1z6ehb6gYjYe6OZpdqHHugFQqygfHjX7VB
         02SryfF/C2tocWLoRkmaVIFDHUiqg6XBkfoNj6pOXpSz5RsiTx/ZlipCkl0yFtazFToR
         AbDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718701070; x=1719305870;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gQeZLyvewF8YU8DnwJSqp6ymN/u0iZA0tyrclF4X+xc=;
        b=gZ5AjDvC5UsyDhNsfXdcvht7qkqSdBz9X46VwDYP2venwvu39vGgTUyw57jIe4MXdb
         QC3HljvuGj8HyG8ibCIVUkPwYLG1LBahOjXxOzS6gmE0C696JKGMCOfeH77QSVhLrpFT
         dFe3t+XmyLOeVifW5jivNoa5JPv+ltuHEynU2MWTBrOZnKXCZ5g4/2SN8GIUGii9rO/9
         GjNmxTD4ICyHg7htPeG4C8AK/cMMiOHNq7ZvhgGSDMzhpjqlZjzvoHKHDWOxCf6/vbNG
         YTf7tFFPirP+LTscNi/oUf2FOMiA+33kjpZH0PwF3ULuDpYbgE9XbDam5AgBPkAoHCuo
         LRcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdzMLYPgY5b21Xwf3TZjpgg9bksyVBKRneLsKJq/iyQfzP+kVY171uHjE0ASyjENSzFUbU8sg+1vwMeHUdxOmPTeSJYZtLz55M/r17JCdJPh4=
X-Gm-Message-State: AOJu0Yz4nW+K8olYjCF8gSZDcVrdVXC+BBTvfqPUGuqa/wEZ40nqvgaW
	j54/vC/ekg8sW23yiHOE9Dj3MXOGvhJXrHTCdFY+O3/fBg4GWfnwADGJSC10ums=
X-Google-Smtp-Source: AGHT+IGyqZXy5Y18iT2k+UrC5GF8C9JEdIPf7YDm/pJlw1f/llTK2DjwXfZqo1KYV/WwRuZX4jbzEQ==
X-Received: by 2002:a17:906:6894:b0:a6f:33d6:2d45 with SMTP id a640c23a62f3a-a6f60dc4e59mr687544566b.60.1718701069839;
        Tue, 18 Jun 2024 01:57:49 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56db681fsm597748766b.72.2024.06.18.01.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jun 2024 01:57:49 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 18 Jun 2024 09:57:49 +0100
Subject: [PATCH v2] arm64: dts: exynos: gs101-oriole: add placeholder
 regulators for USB phy
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240618-gs101-usb-regulators-in-dt-v2-1-85632069201b@linaro.org>
X-B4-Tracking: v=1; b=H4sIAAxMcWYC/42NTQqDMBBGryJZd4ozaP9W3qO4SHSMA5KUiUqLe
 PemnqDL9/h432YSq3Ayj2IzyqskiSEDnQrTjTZ4BukzGyqpKi94BZ+wRFiSA2W/THaOmkAC9DO
 43rmOLdUD300OvJQHeR/xZ5t5lJTXn+NrxZ/9K7siIDBRRXVFXY23ZpJgNZ6jetPu+/4FtBCfy
 MUAAAA=
To: Peter Griffin <peter.griffin@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Roy Luo <royluo@google.com>, 
 kernel-team@android.com, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0

The USB phy requires various power supplies to work.

While we don't have a PMIC driver yet, the supplies should still be
added to the DT.

Add some placeholders, which will be replaced with the real ones once
we PMIC implemented.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
Note that this patch depends on the updated DT binding from
https://lore.kernel.org/r/20240617-usb-phy-gs101-v3-0-b66de9ae7424@linaro.org
---
Changes in v2:
- update commit message to clarify that the regulators added here are
  temporary placeholders only (Krzysztof)
- use fixed placeholder regulators, not <0> (Krzysztof)
- Link to v1: https://lore.kernel.org/r/20240617-gs101-usb-regulators-in-dt-v1-1-e2242542c518@linaro.org
---
 arch/arm64/boot/dts/exynos/google/gs101-oriole.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
index 5e8ffe065081..dec2c6d9619b 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
+++ b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
@@ -145,6 +145,13 @@ &usbdrd31_dwc3 {
 };
 
 &usbdrd31_phy {
+	/* TODO: Update these once PMIC is implemented */
+	pll-supply = <&reg_placeholder>;
+	dvdd-usb20-supply = <&reg_placeholder>;
+	vddh-usb20-supply = <&reg_placeholder>;
+	vdd33-usb20-supply = <&reg_placeholder>;
+	vdda-usbdp-supply = <&reg_placeholder>;
+	vddh-usbdp-supply = <&reg_placeholder>;
 	status = "okay";
 };
 

---
base-commit: 6906a84c482f098d31486df8dc98cead21cce2d0
change-id: 20240617-gs101-usb-regulators-in-dt-bdbbcea25fe9

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>

