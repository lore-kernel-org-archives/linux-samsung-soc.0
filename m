Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3A21EE00B
	for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Nov 2024 11:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732705306; cv=none; b=fD+kMD6gPY5+lTDOUXDwW2M9/1012NN7WL8fgHb4FUcTR2uXr6yJyVqawlb2KHvWVfMidHJXSK3e27cD2rxCl4ab4kQrLqafGlfgev5M/1wA8B/9ArJ9MFM5zu5zeXSbzUb38z2MHJKtxfjiDt443ZGCSCx91U3qKDHQl257GuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732705306; c=relaxed/simple;
	bh=Fx6JxYmZAWNFmGBaodns3MA1Cp/zInnAqGQR08vTJZM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y3adpcxkuqNT+XIxkhyDH2SLyvFEzNJT1lpIOADaweDv8nkD04sjxj4++rudBmQssuETysvSJ9N3jI6iRKQ+XkqUi/V3t5x7WgpkbE3leboskWTHs6v5QAUE1XajWCntvLVeXwOLPze1YNQzI1z5rbWsraIhFynvADMGQQmoOao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P1Z0kSbo; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P1Z0kSbo"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5cf9ef18ae9so1194092a12.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Nov 2024 03:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732705303; x=1733310103; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HOjDTz5quesA/57iR2U9/Cgnc4v0qy5hefL79EGSNfA=;
        b=P1Z0kSbo2mZaFm+sR7yUylpf7IO3m/SFtHR3GgHKgAZ5df+7O1HsypqJ6Jq6hVc6e+
         ixwJbebmPt4arP9UlrvR4wfFEucyB3LZji58ZDMeZ5OZ8/qjiRrYFooQLaSgS4N5BzaE
         N2LfQaTRfeDHoru099SXdt9d8nRmwLXFy/9kctIJwGcys5QQdKH7lhHYQG12WJveEpdu
         rvmC07krAEOpp/CjiF3z9mEA1Y8DP/+vtHfKujoTDhxKM22RSv8THMLeJA35YCWc+fG2
         lHd7mKImA6tzGGeSGez10MJl3Si27rKZFoAeOGCV4YThNKjosIui6+/9Wvkvk3lmrCgb
         LJVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732705303; x=1733310103;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HOjDTz5quesA/57iR2U9/Cgnc4v0qy5hefL79EGSNfA=;
        b=hKTJ6246vBJAZ9JjLlBqK7jbi4KEog98BNqbUfC0kJ7BZdBHbaYUDK+hNM+3fneKCr
         HWquL51O3ZZFh4LuPfsYjlPMYLkMRBs9J8bjT128RTjvzzKDiaZ6PGhZVgb3rJ/yg0As
         ddT3tMVdBshbQonRFpDV5gvUNf5GZNZRdvnq6ZgsW/EgmxUWQ4n7hyVLrytkz9WoyS02
         69tFP0MtRZW9SjxR4rZbuwUue0RWUOrLVUnBgPK6wck7iMeotOk7KB7wFklBIRC6RpkB
         z3A/yRPrWH140dBb6nkCfuxsapz+Bu8xkZIo2BT5Vfny7uhzp6vUorBbCGyONZZuTvkA
         DLeA==
X-Forwarded-Encrypted: i=1; AJvYcCUI4RKUsXVd/OTtWDnhxFEMP0gULUZN1nSyQPCkGfv5Nwf3UZ5mLnSC8sGHmC7AC1ah4iFus299scYdK5KX+QXPAw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVHTytZlIojffw2pZxfWPqKoE6c//mMa3RfHR1RuUoRGH81I+a
	iBGiSXNu5D0SjbyK7LRcsPkEi+V9osAZbtoAaBkU8RUPaRxnwfsywRKXEy8yxms=
X-Gm-Gg: ASbGncsm66r6UMuioHB9Pz+cpKSNqbVPaBk/gtu67Gg11bxS6SIEOfFSh/jkox2+r3a
	eHIU3IYo/BVI64oItz4OGWFRYG1STlkhFnTGsaLYLRvgNKA1R47dCxK5JEQB2sZIchgXyF/h6Gp
	cegoe/AYoLDs42MpvbeQ1Ry8Trvqqrw4CkQDhWNVFcxFp9oqrTZpv/+OjQf2dccOhNdNj9otdy/
	kfoACetwHLol2/UsGu/EIVeO3lI9dhr7ZTlxKEIDWT/62/I4cigbCPCphZzez1NixLgt4JEOO4s
	e64n0HPxLRmi7sI9Zb5M0d2CaqHWRQzfag==
X-Google-Smtp-Source: AGHT+IHB5KUzcTjH16njBBTQ0xCVSadda6wBBW1QR/hMzlosFVnEKcI8ZmV5cmxHoXIIbnCGjXeWgg==
X-Received: by 2002:a17:906:318b:b0:aa5:1cdf:7bfd with SMTP id a640c23a62f3a-aa57fa99a0fmr256898166b.7.1732705302951;
        Wed, 27 Nov 2024 03:01:42 -0800 (PST)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa50b339612sm693762966b.84.2024.11.27.03.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 03:01:42 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 27 Nov 2024 11:01:42 +0000
Subject: [PATCH 4/6] arm64: dts: exynos: gs101: enable
 snps,dis_rxdet_inp3_quirk for DWC3
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241127-gs101-phy-lanes-orientation-dts-v1-4-5222d8508b71@linaro.org>
References: <20241127-gs101-phy-lanes-orientation-dts-v1-0-5222d8508b71@linaro.org>
In-Reply-To: <20241127-gs101-phy-lanes-orientation-dts-v1-0-5222d8508b71@linaro.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jagan Sridharan <badhri@google.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Roy Luo <royluo@google.com>, 
 kernel-team@android.com, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0

This is required for the DWC3 core to reliably detect the connected
phy's Vbus state.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index 18d4e7852a1a..ab016fe9b99a 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -1302,6 +1302,7 @@ usbdrd31_dwc3: usb@0 {
 				interrupts = <GIC_SPI 463 IRQ_TYPE_LEVEL_HIGH 0>;
 				phys = <&usbdrd31_phy 0>, <&usbdrd31_phy 1>;
 				phy-names = "usb2-phy", "usb3-phy";
+				snps,dis_rxdet_inp3_quirk;
 				status = "disabled";
 			};
 		};

-- 
2.47.0.338.g60cca15819-goog

