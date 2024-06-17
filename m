Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B5131662E4
	for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Jun 2024 16:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718643149; cv=none; b=OZgZKW1mafjcVcpsaPTr1z8yGhr8fSmybpL6nUApaLhCgEGyUo91lw0nJbBs4Duoxbe0ynhwQSvMWdMIjVeK0o+UY305H4wiypQuOPXNF+NtPPg+Lem0NsdhEeRcQfil9R2j6RwRr1Ojy8doJlNNMiYdiL2jlhP1YcYaFxsahQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718643149; c=relaxed/simple;
	bh=QlFWWrphdJLUKrnqdX/WA0FmGEy2H4QxLEAk/Rlk/Ts=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=r0Gzbd3sNlCvM5XSlEKgxuUyadz+oCOTZkPlgMvBRqgPUmnI4lktnPe6QdUGWXt304n0HqwaZ1x3DO2SG3sTc2sFefZd9jf5769YEaNZwDHuHb90hzTlWojOo8wbYBOX7FnXDUX4ZeU5WNytpYU3iMJRWnkWx7mHd/dI9cI9JJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zxH3gaZu; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zxH3gaZu"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a6ef64b092cso558885066b.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Jun 2024 09:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718643146; x=1719247946; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2SXqfMqzsmgi60tzvZSO8Ci7JwFaQflPhy4e9Xx/RRA=;
        b=zxH3gaZuO2hl7boyhtUD01r5UkeNqAlviSKD/SKNqWbel76bBSOTBaH8wplVVpZW+b
         7Bn+YUddHxLaLUDxjizruL0P5QgHnccxsUpFM/0HHqefzQiQUHlZlZrXbrHk4lpstx/t
         4oa1hfuAfREVfetR3YO3j44xsYs5UfQT5EVw6kXIqW1AVybYfUmCnSGeemqf1OVz4U/2
         2spEXHv9KoC++qpzHRGQrEgqRSPwCoSpZC+0byI6hD/oGNxhNZ4fGom30APHmNFFhr+J
         h82wFFNEC1dlsy37OUA/JdMsYEeuQq0y/FjgIKOydUdiw89aHJVXw3wQ8wubPx0ATGUH
         KunQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718643146; x=1719247946;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2SXqfMqzsmgi60tzvZSO8Ci7JwFaQflPhy4e9Xx/RRA=;
        b=Zq2qE5fm69GgJK6n16DZlBvJF2xe2u/kd2ZYivDI4btr42zJzEPQUr48U7S8RuTQZ3
         LOWgoONXfwVHGS4WzG63GqhTX8kyH2m1MwGGhPxPMW+yBxMrAZtI5+OujI2+9cFNrO8J
         IA94jBxDXlMTpdXJyaWswONwLU/VZufY2qIZjFffIwK4tg7MMOYShXva1QVYCamM/SIY
         D+IClXTeg4cZs/99M/2VLPWdBt0imivhgkB4+SvDZWBpbnplpY0xMp1pm2sEA/dw0Apx
         gh/JZdBffaEJhHZSeU7jI773/mQUkVg7wG9W88/HGHura/3gktRGXq4yj0z8IEh97PCC
         bIDw==
X-Forwarded-Encrypted: i=1; AJvYcCUHzcB7FrGaZnWsdVW74LY+xim9MJQI90+zJyVshs4xIyeUJSCd4/apXwWnNUZLlTwgtbTuwnQqMHGV8Xai8BVq/6s6rlCAi4ISg6BWEjhuczs=
X-Gm-Message-State: AOJu0Yy3TvBW/4Jfw38EqRRDi4qcXBAQSeJ+z05TC0opkjnO4KoNmGQ6
	sd1IHbipoo7fhEJqwS4ow4oyKDtQand8166Dtkan34oEIGfA3gFhTot29gYL3cY=
X-Google-Smtp-Source: AGHT+IGdOXSsdt9wpeM+S7PJouIKDjRGTea/R3paOf2QC08kw74Op/Ef1S4OlA1jnZ9Lbhjly1OS5g==
X-Received: by 2002:a17:906:3c05:b0:a6f:1cf9:9b56 with SMTP id a640c23a62f3a-a6f60cef3bdmr659622966b.9.1718643146286;
        Mon, 17 Jun 2024 09:52:26 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f8176eea5sm190176766b.88.2024.06.17.09.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 09:52:25 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 17 Jun 2024 17:52:18 +0100
Subject: [PATCH] arm64: dts: exynos: gs101-oriole: add regulators for USB
 phy
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240617-gs101-usb-regulators-in-dt-v1-1-e2242542c518@linaro.org>
X-B4-Tracking: v=1; b=H4sIAMFpcGYC/x3MSwqEMAwA0KtI1hNoix/0KjKL1sYakCqJDgPi3
 S0u3+ZdoCRMCkN1gdCPlbdcYD8VTIvPiZBjMTjjatPaDpNaY/HUgELpXP2xiSJnjAeGGMJE3jU
 z9VCCXWjm/5uP3/t+ABWWvJ9sAAAA
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

While we don't have a PMIC driver yet, they should still be added to
the DT. Do so.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
Note that this patch depends on the updated DT binding from
https://lore.kernel.org/r/20240617-usb-phy-gs101-v3-0-b66de9ae7424@linaro.org
---
 arch/arm64/boot/dts/exynos/google/gs101-oriole.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
index 5e8ffe065081..1a79d9ab3be0 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
+++ b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
@@ -145,6 +145,13 @@ &usbdrd31_dwc3 {
 };
 
 &usbdrd31_phy {
+	/* TODO: Update these once PMIC is implemented */
+	pll-supply = <0>;
+	dvdd-usb20-supply = <0>;
+	vddh-usb20-supply = <0>;
+	vdd33-usb20-supply = <0>;
+	vdda-usbdp-supply = <0>;
+	vddh-usbdp-supply = <0>;
 	status = "okay";
 };
 

---
base-commit: 6906a84c482f098d31486df8dc98cead21cce2d0
change-id: 20240617-gs101-usb-regulators-in-dt-bdbbcea25fe9

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>

