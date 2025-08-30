Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B50B247284
	for <linux-samsung-soc@vger.kernel.org>; Sat, 30 Aug 2025 09:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756545599; cv=none; b=rnqRs88y1zsKrTltoZtpuZ27PQiTFiXjOR4oKyBiKasL909s438Ln43cMpkgFHzvd6GrSqjA5HKZ7IW9CMTke+NMqJseRVs4BbWExjU8533QqAQLH+UrVNBDh/8q7jG8aWgHGGnmrNoYac1y7FPdzHP1819lVO9s38CVC46hoIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756545599; c=relaxed/simple;
	bh=va4dxn6FAG/rkvLkOTSt+fhm2FMOlsveamQ4+F7Pdck=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=sjVvuoB5pwz6U1x4BD28TPMAOnrasZiVFXfsMSxICtYviJGLtlRfOOrvuqhrOEOrXkjSmCDLY5oRlV5UTGOs1tUZlZgG0LSvjiBJffTAKziKzRxd9XeaEnVjeN5/GiR3l9+sAYIEOxY+1fAaue4cGgc7zey2psiJTmqCO6K79nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S5RNrbR/; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S5RNrbR/"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3ceed75169cso228399f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Sat, 30 Aug 2025 02:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756545596; x=1757150396; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GwyiQhik7suc6gbVzjEP6jIHrXVEYERHfJGEwviQmSk=;
        b=S5RNrbR/CfjqlOJgyGUQ67MZepqHnH2xk46SBgU4gjvfMslf5v9XiwhTH7wVqzui7Z
         58HMYAuORzJeTYHDJjRPXDZ/AYmuw2kAJwds7+H4nAgGIwS8ibBx9TTR2H4GCBBOYCkF
         0R1McOE8MGIfVGz44G8YYc24EVELSZYNLOrRQ6eITXRVrnEnD/agjO+vjbKuFC5m5ILg
         txQ/7z4KRuyjbaO/HEsLM/G4vHHQiAJDAUvoMezihmg5O0IikJ50sOGE1seh81j/Kys6
         PCXDeijkoY1pZaxUGu4PL2IzywXWhjke8hjqDcXdzSdJzuTHbEI3JKCXGtfjGeE37HPm
         Mx1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756545596; x=1757150396;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GwyiQhik7suc6gbVzjEP6jIHrXVEYERHfJGEwviQmSk=;
        b=UL/HL28gv3Ol6VqzYdpCNiBTtfhZA+mAsuUr9pptDSnnJhPoTNSOF20aMZ/ZIqTLK7
         3AP5NREWce2sKELzxa0obg4tVbpIUf840JeQeD6ieSTYVKNRpSqZlTj0tDl0O/z5TBlB
         6Vg5/4/3MerTrK1HiHr4J7hFb3OiTFsWVIJC2AXXIq8q84nJE7mibZMJYaboFf7V/CBo
         nqs/oknF6+jW432sqjRt8LlzMm3/e4xVv8EFu2KYXnojy8MLxeoMMH28YUVe9KgBPU+Y
         DTWQaANXLbEZZH7BxR859qzvyBDmaI9b6tP6ePAexxY24LS8n2OMFGNkwWRTCrDHWFIF
         3/VQ==
X-Gm-Message-State: AOJu0YyQsCLNMYoD4Vj8gcCpn6C3BYYI4GOkQd1254x51fVM2X7/GFEB
	skydNDFxOjCxzcrMXdMxDgjUfsg+AUZnK3MubUAnCFPsJo046+fwSEbyevK9T8Tzzc4=
X-Gm-Gg: ASbGncuLsI52Xgb3kBvPh+/BAfGg+zhgbeCxWbczo7QUehKIohrRIMZ/MhNZUUMILDB
	syMqpZVBMg6/onHvHTAuaEy8TeVm/ytyj6SB9Qca2HMO7TqteY/l0pn3wWANF2zcueahK5iYfE6
	GJjMHNs6CE5GCdodVisUc3p4AqXdjHY9F29+lG95bRFSlyuVswXFykaaHS8szX6sgJwtdvCXT2L
	LNyDaVRqrJcvRx5mgO/MF2pnL/2hUFsVaJKY5JztVpI2uiNml8cVToeEBkVBBrvu1O03AbTN5x+
	kyx0jDESQBWfra5TkcIMU7YrXTTisHROuSpNUryDwaQd1scj6ABnPr1Xk449ThrtccrdznzsXXK
	jj9fiCSq5srEWafdfiJ3ek5ZGzIr7WXb/JOJPibpWsNIgrXOkAw==
X-Google-Smtp-Source: AGHT+IEqjNRxfqqCNOguFU7c3K/j2n3eHHM7h5HhcZ/u9DnUpSaUb/8k8UWDRGTaDD9Zj2mt2IJwjw==
X-Received: by 2002:a05:6000:4310:b0:3ca:4e3:6e82 with SMTP id ffacd0b85a97d-3d0fcaaaef7mr1613229f8f.11.1756545595916;
        Sat, 30 Aug 2025 02:19:55 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b8525a94bsm21186815e9.15.2025.08.30.02.19.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 02:19:55 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250815070500.3275491-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250815070500.3275491-1-ivo.ivanov.ivanov1@gmail.com>
Subject: Re: [PATCH v3 0/4] arm64: dts: exynos2200: introduce serial
 busses, except spi
Message-Id: <175654559458.10738.12093256253809127560.b4-ty@linaro.org>
Date: Sat, 30 Aug 2025 11:19:54 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Fri, 15 Aug 2025 10:04:56 +0300, Ivaylo Ivanov wrote:
> Hey, folks!
> 
> This patchset adds serial busses, implemented in usi, for exynos2200.
> It's missing spi, due to me having troubles with reads when testing.
> Serial_0/1 have not been included in the patchset, as it seems like
> they're encapsulated in usi blocks, but are the only implemented
> protocol and/or do not have a dedicated register for setting other
> protocols in a sysreg. That'd at least require patches in the usi
> driver and bindings to add support for.
> 
> [...]

Applied, thanks!

[1/4] arm64: dts: exynos2200: fix typo in hsi2c23 bus pins label
      https://git.kernel.org/krzk/linux/c/1219992e16689f4937a333c98d90cf80ba91860a
[2/4] arm64: dts: exynos2200: use 32-bit address space for /soc
      https://git.kernel.org/krzk/linux/c/ad8ea30db80f825215d071370989b8ac45298a1a
[3/4] arm64: dts: exynos2200: increase the size of all syscons
      https://git.kernel.org/krzk/linux/c/0dff00633bbc8566fed6483daddddfa0dfdcf83a
[4/4] arm64: dts: exynos2200: define all usi nodes
      https://git.kernel.org/krzk/linux/c/1bc8f09ce98ca8a56f2059c9a8fe26cc351318f0

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

