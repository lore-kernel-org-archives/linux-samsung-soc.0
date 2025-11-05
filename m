Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E2612D3EEE
	for <linux-samsung-soc@vger.kernel.org>; Wed,  5 Nov 2025 07:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762327530; cv=none; b=REhNBT/SSBRFhXo+mu0TRo8F+rQYCS61GNKG32mvKLKDBeCpjl3Hp0X9vwHfd/+Dm73nijLHb+p6UX19CankceZRwmtC2i91cCU92esttzoKqoFgTbHcgnfsuNCT4E10wnT1rte8cGo3byD3hvgs1gk/LwjaiSKNPXg91nNQia8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762327530; c=relaxed/simple;
	bh=9rhD4dmDekp23csqlrhuysA0+MtGz+uIxOlCxPQhmZE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=V81IJKIO4EHZ+x/K5p2fCvQslDTZtbQgFmZ6khXkXj/yP2sEcRMkPjAXWgDZ/RIjApoVm6FVBle0J593R7xEvUrgl7mzfzw4OjSOeakrK+L1FQdCycr04Fv3olSCuXL2qaYu0ngq6qR2AoIG9RBU7m7rE7TbtEowx29Ag1RP1og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pJeAXZSE; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pJeAXZSE"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b70ca7d1e78so49963266b.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 04 Nov 2025 23:25:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762327527; x=1762932327; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mtTea7R3YJBuOC6RfV8X0XMfpykeCTOh6GwDCkF3AOw=;
        b=pJeAXZSE+a52azyJCdhLFC1UqOfLMnGAFb+bI+cgWgwcNdXeJt9k7PvotwSLC5eJOl
         rV/UOZUPNW1lAJh9CrLw743+entQL07yKfjzjLAoqOfaGERyHPPrX8nSpu15xoyv8Fo6
         BRPyS7qibTi5J/zRkwm/ZSx745ocPb3tCe2cciW3dWMDoPmfZV/jpk250HXK1S9x1ey/
         VsLhvn0i/+A1P2Ck8k1c6RowrUIbrY/CFOoGcjSTgD1wBgPFYjgTaTqajUF4G44ayliB
         iDH+GgbwPRWTmll2LbFhfEUv1GZAfF+YbkzjG4+lNwN50lcljL0B2qFxfxujkcIMF/Gs
         sAbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762327527; x=1762932327;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mtTea7R3YJBuOC6RfV8X0XMfpykeCTOh6GwDCkF3AOw=;
        b=FASV4VhP68zBlYLNS98ar+BYSobm/OGd+ZQevMqLqztYIUjWqBk5nDW7M+srCt+wmA
         qWxVPTa6NUHHssEOezNvP5OQiZAt8sX7sQ+8bVNFaRqwC8obIFQbJV+pc+qRRpoVuqHK
         cRxxp66aRdPA2Gur32AQcZuemGc8DM11bgl+mKMYgOQb54D6XiCs4PGPwiyurfego9Fl
         KiMKowuP1TMUwP+iXTohn269yV4vBC8YLYJHkPHEh0fyosjhP8IG3oLiFGNmwi5Ks+v6
         VxGegQnp++yv+v3JDSWiQN+XPx0FzFx8Xz9c75MuhxkOgGC3Dbm5Cx4aiWhT/4cbe5gS
         +4Rg==
X-Forwarded-Encrypted: i=1; AJvYcCXQ5Z/TXWQbrXbJBK2DU/k6IFVhOtud6GyDCNeBudQCv3uh5vRAA61YEcClhhTCnWLDxpbnLayzilZOmBgCozPBdA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwGt77znw4jquWwx57/N2Q1rTWxTSoAx4QbDNG28dTzK/AL9HnE
	fcoBNo1uOZssL+5L5cJd4sA/FdEVoZkagkhRAKoxQNr5LnSaa/ybntB+2S9DN2luVgc=
X-Gm-Gg: ASbGncsWdPrtkhiZaolOEq7sAUDVMUeD4bcBABl2Nrpt6fUXqlobRpEuJgS+4DbnDGZ
	kOOJqGFkhNR0tQXT9IUpr9TVs4yA8wnEDnmTkL8HdtgO1IcC4WNdWjJJHMt0ohq3ZaZ5OHxrkkn
	qecPfqQG8JhRzQ92oKT78x2VpxDvnDHyvm78JeVK3Eo+VTh6adyFDMnRnyFmRWSec8H56xuxNca
	zdNgq3Y+luLti3RIxdCpITSdedyFpAobNtw/hGhz6Bgy2Pwiz3xqZ/Zf1UGexRmIHC1TM9dVc3d
	EaXrGdlFMut60az/F4wz1Vrc0Il1icvs97Nl9rkUAlGhaRvDvlusXr040wWppJCNpayoYfyC7Ae
	PGw6+SGObzwbo1DF5Lb9cIUr+o8XrocfTB4uxa63rGMNRxSk33ff7K75S0RzShPZGLXRG5h0ZHs
	PmkhmqajDOHfYV2+DW
X-Google-Smtp-Source: AGHT+IH5piUBnmYvJgxB5GNOkBUWa7uI3f0Itj2oI/p6wHP7zi/ZySBa/bWL+wMjtsFvIeyWMU8PkQ==
X-Received: by 2002:a17:907:7248:b0:b71:a627:3d9a with SMTP id a640c23a62f3a-b7264e1fb60mr110002166b.0.1762327526646;
        Tue, 04 Nov 2025 23:25:26 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b723d6f8c5bsm411534866b.20.2025.11.04.23.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 23:25:26 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20251031-exynos7870-drm-dts-v4-4-c1f77fb16b87@disroot.org>
References: <20251031-exynos7870-drm-dts-v4-0-c1f77fb16b87@disroot.org>
 <20251031-exynos7870-drm-dts-v4-4-c1f77fb16b87@disroot.org>
Subject: Re: (subset) [PATCH v4 4/5] arm64: dts: exynos7870-a2corelte:
 enable display panel support
Message-Id: <176232752532.13426.618023682429747371.b4-ty@linaro.org>
Date: Wed, 05 Nov 2025 08:25:25 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Fri, 31 Oct 2025 00:50:18 +0530, Kaustabh Chakraborty wrote:
> Enable DECON and DSI nodes, and add the compatible display panel and
> appropriate panel timings for this device. Also, remove the
> simple-framebuffer node in favor of the panel.
> 
> This device has a 540x960 Synaptics TD4101 display panel.
> 
> 
> [...]

Applied, thanks!

[4/5] arm64: dts: exynos7870-a2corelte: enable display panel support
      https://git.kernel.org/krzk/linux/c/ba2cd209cf8dc6e826f3ede80212911c23ed2076

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

