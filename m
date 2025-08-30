Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16BD9260592
	for <linux-samsung-soc@vger.kernel.org>; Sat, 30 Aug 2025 09:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756545602; cv=none; b=Y9sp7ztA5rWvmPJSioQbcDw2dZF203W/AoBotqHAV/2wpJnDYTTE6/xrrLev2dAoIIlhi6zkSzv4jM0MQ6+09fLDF2/4YtsnsRHSrHBFOZMABnGuGsRFup/qW5N6SZE9S+0hgn7Inft4taXN0y9FQt1NOtaXmGlAD31sFayh9Zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756545602; c=relaxed/simple;
	bh=eoKplZm+kkBtEjqGIAHB/J7TjTlViSlS7wYncCljPF8=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=SUlK3f6KRlTPiKK3YCz5wy+UmUAVK081VTFsH8HIzL3Q+xB0htOJGR1M3lakGqrO+VQk25geWd5TTaeokX+T6Ug+KqHveqhc+zlIKskFAhkHgtVYGElTsKvZmgjYnHzvzu+AOiY9lQHr5Qk/KAkkP1e58Qwcf03VjDXKREhWzeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=afKd3yoc; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="afKd3yoc"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3ceed75169cso228403f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Sat, 30 Aug 2025 02:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756545599; x=1757150399; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4RvDvjixk5xDNrFQLv4PeECHMMHurHSG9SqBUI6Nr4E=;
        b=afKd3yoczRgI/i04d3VF+OZlyTmGrsWYfQREfG/gtAJZGWmGd1d2T1UpRY6+F5Ufpb
         mEKhjE3wEom3UWnDAidK5moesAPXBuQaOos6i3wdnGsm305xlXp7OsNXD55Fv7UYvGu5
         bPXBw4QVdxRmcyoC+lFfyU+lQGIcdnrsd9fJgfYEzvdOiyeIPlwjUil43LiHBworJ0NY
         UCjdwWwCQzDVx/26DBG/f2LKY7/xjlaT/cB7W44IYc9dSUCFg6sEJe8kvp8lUMlS5/XU
         edO3izGEdFKLGyCHGNqkMr1zMrgpZwFxr/lmE9CsN6fIF0ujW+Z82jHTZWNEZGUujJVN
         wPjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756545599; x=1757150399;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4RvDvjixk5xDNrFQLv4PeECHMMHurHSG9SqBUI6Nr4E=;
        b=aVJueG2vv4UVCwx5Jl0XTLubV6oSNhLl+2UHmM+btM9Lxn7HF6kvQzcBaMPiKikSax
         eZTUHYePe7RTMx9VbvAgvumIYcIjSY9Z7OAPdQE+huAk+X4WAhsyBsoxeYuElf7tWgn7
         yq3AN3YB5AlmdraeJP2V7qGhk7pi8ZNq6/jMYxcCLNSloxfxoo3yLBIGyAQFsif+2BU+
         I2ajmWTw8SQm3uNWt5GB4RQRfgtm6yuKe8hTbui2DWtnnfgvGo+boyicu7pfULDvtFpI
         fwl8yS+3aHciXYZJB50YFu1WW7wX2k1pR4mcpX4mE7tiUblUqgRujGGsshe1+ZUQMWdu
         U8pw==
X-Forwarded-Encrypted: i=1; AJvYcCXrdJHGhEbbNN3CW1K31G0UpamTiaDjlCVUZSOAjsfgJrx7Fpulu/12rcbHxSUu/q8OfFrLyUOvZHlcF/0G0UoIPg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwAYfDlxZNT4bU1mpux+Ylf9r6H52u3zCY8VAB+NPKAuOul50p0
	sptsG9uriS1ufyqTWRtDP9s4G0AI6jtSCMgqwbDLOezZOZyNkoouX/5Zg3yDrqQAXmg=
X-Gm-Gg: ASbGnctp+2nO8zCHSp7oaEG0ny58lemCMfOxIgKHf/SdMFcM0FE+zJVp/p8EPXYD6d3
	lma/+zp46hnW5Q6u3/JUMi87FwC61ng1XLNe5hU7DYxhMNJl0FSOmlh6/fCuJh3Caj8+xBPErl7
	AZooGFv4Vnh2C90UlLZ51/x6hF4gf2w5Q6nhvYf8bxgKRDr9T6bYCfMMDHxyuDth59OGyIy+8/p
	KSSTToOIrXELI0gjFgvuqrtSr0y4WDSI8xcCx4x4edfO5cmBSSMLTDHbGShDn4Hg6lL/3GFObnr
	uuUP7t5uCs5x+3hEskAgCbSgxSENm9fNkdaxy31yRtXWnCFxLhVJWAI8H6spFOPo00xHq1Qlhi3
	8t52OJzD+1y72AdGafc8rK41XkJaci8fB3fSfZo8=
X-Google-Smtp-Source: AGHT+IFR+X0EgGj5F+ZAPuNA44QJat2dgEsfyiD1C0mZqTk+bdaBYGDrDIoBDhP+GQBrz8+tvaUhmA==
X-Received: by 2002:a05:600c:5287:b0:456:2137:5662 with SMTP id 5b1f17b1804b1-45b81f120bamr19089785e9.7.1756545599375;
        Sat, 30 Aug 2025 02:19:59 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b8525a94bsm21186815e9.15.2025.08.30.02.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 02:19:58 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, linux-fsd@tesla.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250822121423.228500-6-krzysztof.kozlowski@linaro.org>
References: <20250822121423.228500-5-krzysztof.kozlowski@linaro.org>
 <20250822121423.228500-6-krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH 2/4] arm64: dts: google: gs101: Add default
 GIC address cells
Message-Id: <175654559768.10738.10874618252730969524.b4-ty@linaro.org>
Date: Sat, 30 Aug 2025 11:19:57 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Fri, 22 Aug 2025 14:14:25 +0200, Krzysztof Kozlowski wrote:
> Add missing address-cells 0 to GIC interrupt node.  Value '0' is correct
> because GIC interrupt controller does not have children.
> 
> 

Applied, thanks!

[2/4] arm64: dts: google: gs101: Add default GIC address cells
      https://git.kernel.org/krzk/linux/c/a75d45adb261cbced86701d2512098044a6d310f

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

