Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3DFB19ABD8
	for <linux-samsung-soc@vger.kernel.org>; Mon,  9 Dec 2024 19:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733772532; cv=none; b=hxOpyM6Pu6EsHhHOiHQHKrrujZoJ7832w6+d2klE9NQdHSfqTHOjShc7LXiVCuFq1r/r3lOVRtgS/70AFxLBSGwqAODPrVZlKUJzPBe4YJ7ZfeHllhhyYBDONk26Hs47ikx5P28SiQw3HnQhkcoIR9nhfecQWZprihBcQZ/acA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733772532; c=relaxed/simple;
	bh=bGhWqBXSz8K0txqXiFCuPd7y7o6C0UeSwmy15KkcIn8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gl2fozLLP+MxoGkNcZR4Q/lvCLFe3mFsSO+pavYkMHoqW5Wrur6kUn9GmD/OnsisqchpZ1I/rvl3BSvOq0+m5wz4zUDhhHVOq/XdGxY4KAiArBAzhS4ZpFJVfJC5UeMYCcgFmnOL5u6ZwCIKO11NPfDFWuQhylE4lRlaNuHBr7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WGAZv5ud; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WGAZv5ud"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-434f239bcd6so1317125e9.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 09 Dec 2024 11:28:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733772529; x=1734377329; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IuSpj/HsYjKUq+UsFvNv/TltZ5XFd6qk5tdowlJF1TM=;
        b=WGAZv5udWhX40eLfEKeSavxIbYtBKqzrVcNJVTNyO+w4ydXEKQ+TuPOEj62RHphTCe
         wj20XRC1mshoJ6MRLxTlbINbp3dYlest9osb9vMnHSx63QU4j+10SfGlSHsuiidbt+VO
         bnjoSM2MCN8zjyaGBVwMH0CPu+o4TN8ddn6EE6GbfEQSyM0SX3wHWhePUJswUg6fV7/c
         FkMAvJaW0h8BE1HsRIVXvN3SEYSYD/XO2W/KgXpIKt+I+uPoF9+pAD2XuscvnJNSnahm
         zZTeAsH2Eiz8iHD02pP+TmM5I4RmCa0in2VC3JVjEQ+H+ACPQMFarWaTsz1rH79SLIoL
         7FRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733772529; x=1734377329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IuSpj/HsYjKUq+UsFvNv/TltZ5XFd6qk5tdowlJF1TM=;
        b=YmRiZIJqzJcv9bXBOghTGo3goOm5RW+E6AMU1MCdVVFB7cPeogQhN5/WFNXDosnrlQ
         aGoqdjGZYgsQGyKcc1O/qTEogLoKdMGDMgfvQMXNKYrzQR3n5tx1Wmnu8UPmYBVppzX/
         FNSQfAjY8PtHxyReaPrUuhgvgftlK4Ba8WIMw0Al8ypoF7V5/3QO6DoyweNZ9DEQkrMh
         kXu3Y8zPzNWu/e/kb7KsRo082FuP14pOKkipqktqImh5EWXx6tYVFp30ADw5yKXAwgH0
         lVGDo4HIbbf//XgRUAwvWCh5akXqwvgqAYouLfSgFGGYB9gXM2A52PtjK3HXlgx0dGwm
         D+eg==
X-Forwarded-Encrypted: i=1; AJvYcCXBk0JAmlLLr/YGnKtVMRASjkLDAcuvL3YTwVwBmQto9cwGKUGBFhUgsIvLLVJDnUjkRxi9/+LoSzf1j0DA28Nv1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzVlqyIfo0l/uJ7ofo3DVR10FwmahwP7lyDJuhQEv3p9yOHJu8u
	dve1FEEkGISMwhHxeXVd0kp8ltqHkm0SSW7ks25mnsf3ex8u57y+YY9QEQwI53A=
X-Gm-Gg: ASbGncuCg10EZQN1oS5hjJctQWDE3RawE4E5QwOI6MXV1VxVfyGIvEd9+psATSqqgGw
	Ukf6khEDwS5BG+oIL4rBi80+hyt+df4uUeJ319x/h+kMMieJLt+DOJDucYrpL3CkRq4VahSzcFY
	mw76ihLY75/LW0CNQgRVBvCesTbGSmHREwnzd6RXXmWvLzC12uft6ULIwjirL21pJYFfu7ZRPy7
	Prr0opdsV7J+O3leU176HLc0165SZZtCwAx/o4SCJ6oObF4X/l7CmNrzJl0ux0z
X-Google-Smtp-Source: AGHT+IHptp/TSN8ArgGPm9cywAb5bVkFu4G3aOR1tLTZhOcuZyzTX0x6rWRDIu6DPFmEx/1jW4oROQ==
X-Received: by 2002:a05:600c:3502:b0:432:dc5a:b301 with SMTP id 5b1f17b1804b1-435019c8db0mr3209025e9.8.1733772529211;
        Mon, 09 Dec 2024 11:28:49 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434f13f735csm80686325e9.16.2024.12.09.11.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 11:28:48 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	Will McVicker <willmcvicker@google.com>,
	Roy Luo <royluo@google.com>,
	kernel-team@android.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH v2 0/5] Google Pixel 6 (oriole): TCPCI enablement & USB updates
Date: Mon,  9 Dec 2024 20:28:45 +0100
Message-ID: <173377246177.140612.3507892014297013464.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241203-gs101-phy-lanes-orientation-dts-v2-0-1412783a6b01@linaro.org>
References: <20241203-gs101-phy-lanes-orientation-dts-v2-0-1412783a6b01@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 03 Dec 2024 12:40:23 +0000, André Draszik wrote:
> This series adds and enables the Maxim MAX77759 TCPCI for Google Pixel
> 6 (Oriole).
> 
> It relies on the bindings updates proposed as part of
> https://lore.kernel.org/all/20241203-dtbinding-max77759-v3-1-e1a1d86aca8e@linaro.org/
> and
> https://lore.kernel.org/all/20241203-gs101-phy-lanes-orientation-phy-v2-2-40dcf1b7670d@linaro.org/
> 
> [...]

Applied, thanks!

[1/5] applied (but b4 lost rack)
[2/5] arm64: dts: exynos: gs101: phy region for exynos5-usbdrd is larger
      https://git.kernel.org/krzk/linux/c/527c9640e4f04044afa98f3ce18f8af89ac4a322
[3/5] arm64: dts: exynos: gs101: allow stable USB phy Vbus detection
      https://git.kernel.org/krzk/linux/c/95350c0ec27d906cd95375084ce343bc65421e70

!!! NOT applied - waiting for bindings to be picked up:

[4/5] arm64: dts: exynos: gs101-oriole: enable Maxim max77759 TCPCi
[5/5] arm64: dts: exynos: gs101-oriole: add pd-disable and typec-power-opmode

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
