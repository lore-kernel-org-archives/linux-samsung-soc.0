Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C741D1E7653
	for <linux-samsung-soc@vger.kernel.org>; Tue,  3 Dec 2024 12:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733229630; cv=none; b=syL4Y+CfTULBdd2OD4Ayqt4z0QLhP1Evs8dS2erPq/+TM4qnpzry4Jz+MIvyqYOsLY2QmyPyfeW4Kiloo4h8M4GWhkFHngdFKYV5I2HMhDSCDiaei0pBeTPrDoRShsio7QhpWAaaaY8LXpcxXEo3zPP6WD0A3Hj2acE5RrPStpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733229630; c=relaxed/simple;
	bh=ErHr+ubnC2nccg316Z42nK3s1bkSHAlf8m9iyKpuF2A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uAhLTs6IMXO6un1/vicYxJo8DDHkrDKqp4RK6SD0nZ0ELoASRtzilDDFMta8SMoJ6+bVN8NiTWBuj5QO9EpQ8rJE48MNjpG7qoroCKpx5ojfhsPDfbNF3dUovO2jJjPlVqsT4hGFXLqPZPqd/N0sVrxClm3/KRa7jBDBl1DhwdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ADFBl/vv; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ADFBl/vv"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-aa53ebdf3caso262574366b.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 03 Dec 2024 04:40:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733229627; x=1733834427; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gSM9DgJ8s8ciANY65GvKwivzFuJwV1VAivJ5cEw7IQQ=;
        b=ADFBl/vv/P9Oyj3DQxcRpL61ZPtzDcfin/WZvXA2NG6ptuiYCkOmuHLe8T0c9huOov
         jCXwhMpRkTaA/Isuh4gOr38yyXMb7Kpvc/LMRCqx8AlrcBF1eDWZ5G+0yhq0WHzBwSlM
         sNPA+o0q3MucMgplUWmBvlvwJQbi7d1IQrvAYoOQWB7K0+bnKNGxGoZqb5f+a6Dos6TK
         w9qW/0aqr1azCYaX3xjZdmEjr7Y8xf50WeKNujYXcFZ/7o//Y2m3racKlYa788hNl5SD
         CPSfew7wCFgeKifYsH33HSYRUs2Hvbmitx0sk37y7FseWYRMQnGv5zYivzaW4QsuY3OD
         s1AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733229627; x=1733834427;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gSM9DgJ8s8ciANY65GvKwivzFuJwV1VAivJ5cEw7IQQ=;
        b=xJXKKmHUlkEjmxjxCv0wuqDm8SnJfAhfdKW2y3AReA2QUju4gCI32eAUV/Jqt8cHbq
         Dp0JHKbm5x5nT4Xv7o8WttuTVskEIqZSVeIpYpUTqIDpYL5g6Rvv+BTS8dPj+8d9FicE
         P9c862wcGREhdbM8zJu2e27Zmg9J8R2yyyvf8knU8xOWp5LSbvyBcOb4sGjKdH1aCItD
         tJGBPU7n4fB5PfstYtB46iEelm3ofpUMuexE3UrlFEQ+B8WZQIE2YwNIAyX2JyRV2hws
         Dm6v1zb1KoHZZALYfX9zNxfqIziO/D65wgNCrhqmPvJ6Wqf1EZa5wYRjovhoI4HEAwUe
         rUVA==
X-Forwarded-Encrypted: i=1; AJvYcCV1c3pMeMAuIuIXuo+tmSJMoxPvSS4VqF8Upcj6mRcOCLnbSLoZrbRKZXhP6JZ3BRCIiY6/k9ILlLOkjAgSSqZEeg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxTGTJzR4/wGTpoXyDoLPcl519ZRIRhXStoyTqr/mDfauthAbTV
	so+ldtsY7w6INEBPiRwIR/QbV3GoBDA5T2Jb74DacMyEp2PaserTCzKVLCvKUlA=
X-Gm-Gg: ASbGnct1aDGVa2No+5Tm9SSP/i78ebQbGhU8M1zrwNDZBCoPg0vv2UqleE941zQ0xwR
	fG5LjRRkCm7GwRJgO6lwGWc08L96hkhgpc6u5LCKuPVNZ50VOPJmuBw7Q/FeSUdL8W8sCMcipoE
	7P0+QnrQ4gIMlCCPsRTaCkaW7khjHFOyPipNR5By9+sGHK0ik/bm9goV5WunvGtrejg22lP0DPP
	ZLo9daSa7erjH0hrUs7pYtUPdhqnzo3SSEdyYXINBrVqKsKEbcbxgNPP2J27S1peY4txOcdIm0t
	02RrQ/u67Xj5luBFYIM0aB/zd5Tzxx8U8g==
X-Google-Smtp-Source: AGHT+IHow5Ax9TALz74PlLZBVVpeQZfnTQ4QfucP7E9gMwHlWhWcBplvAxbKn5vgo6QeTg9aVvDQPw==
X-Received: by 2002:a17:906:1ba9:b0:a99:4162:4e42 with SMTP id a640c23a62f3a-aa5f7eef4demr200217966b.37.1733229627078;
        Tue, 03 Dec 2024 04:40:27 -0800 (PST)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5998e6a4csm616809466b.106.2024.12.03.04.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 04:40:26 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 03 Dec 2024 12:40:26 +0000
Subject: [PATCH v2 3/5] arm64: dts: exynos: gs101: allow stable USB phy
 Vbus detection
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241203-gs101-phy-lanes-orientation-dts-v2-3-1412783a6b01@linaro.org>
References: <20241203-gs101-phy-lanes-orientation-dts-v2-0-1412783a6b01@linaro.org>
In-Reply-To: <20241203-gs101-phy-lanes-orientation-dts-v2-0-1412783a6b01@linaro.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Roy Luo <royluo@google.com>, 
 kernel-team@android.com, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0

For the DWC3 core to reliably detect the connected phy's Vbus state, we
need to disable phy suspend.

Add
    snps,dis_u2_susphy_quirk
    snps,dis_u3_susphy_quirk
to do that.

While at it, also add
    snps,has-lpm-erratum
as this is set downstream which implies that the core was configured
with LPM Erratum. We should do the same here.

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v2:
- drop snps,dis_rxdet_inp3_quirk and instead use the mentioned
  properties. The former alone wasn't reliable enough in all
  situations, e.g. when attached to certain USB hubs.
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index 18d4e7852a1a..c5335dd59dfe 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -1302,6 +1302,9 @@ usbdrd31_dwc3: usb@0 {
 				interrupts = <GIC_SPI 463 IRQ_TYPE_LEVEL_HIGH 0>;
 				phys = <&usbdrd31_phy 0>, <&usbdrd31_phy 1>;
 				phy-names = "usb2-phy", "usb3-phy";
+				snps,has-lpm-erratum;
+				snps,dis_u2_susphy_quirk;
+				snps,dis_u3_susphy_quirk;
 				status = "disabled";
 			};
 		};

-- 
2.47.0.338.g60cca15819-goog

