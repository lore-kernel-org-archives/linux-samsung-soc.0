Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F90B23F413
	for <linux-samsung-soc@vger.kernel.org>; Sat, 30 Aug 2025 09:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756545600; cv=none; b=g1/eno8ODh7w1gMhhx5aStTr9eSgLUZb1mkvuCZeEq7MbM4otocyUVSfH7JtuRFDROhyRy9h0asRn7hPCZUVgRQD0W574gXvgKd7SGUS0PeujU1TUiaE88QRgNwRqTAufi/A6ohQuOc9Jy6PM98I1UAQDW5Kf5Qd1MZG8HRPxQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756545600; c=relaxed/simple;
	bh=VzxXJTFvTQBP4rKxruA4BdTzmvcXZSeGRHXVEynJRIg=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NhvyiGePGevWmRSAv469S/MBF/P4ljdT3p30DuCbugBoC3t7CISQ7HhHAynbPO7HjCvWCb9NjgzXm/mwV529Xemdg/yg/VZIDA5LFOz+D3lLq0klr36Jzdy5eHhqVJhy720qmJbow3HZHIKR5wJgzNasF+3+1JhX/swKuDBU4MA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LMbTC3cI; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LMbTC3cI"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3c7b4f4be98so190121f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Sat, 30 Aug 2025 02:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756545597; x=1757150397; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0dFt3gYfNqGa3u3KzJ+AyiV/voGtt/ZhOXx5ybVFlJE=;
        b=LMbTC3cIxF70EaNIhq6JYXD7DYJrl2EcVypKWUDJVR9vYWra8iow+rFP6BuWtgHGiM
         T8auKQBDwr25YblakAsYg0FFZyyQbmMAllNz5wESprMzVfNX3phkPl9VnKda048IiDAP
         G8iRWUzNj+oX8CL6up37lJr8iGu36aFM4Bq5H/g/ww6u8J2g4oyeLmanxpuFrPSrB48b
         VCfO5q6YAeeO842CNwZG+5crb7/gA30LaXdhsZAC+RnARVOjy17F48jLyvyiho/6Nvwn
         JnaPhMcLiHQcfwgAYY1OgqjduGrORRDB0K0NekT423Aw4CqOJpPPwVV8Cuu9aPxpqtSw
         3dlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756545597; x=1757150397;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0dFt3gYfNqGa3u3KzJ+AyiV/voGtt/ZhOXx5ybVFlJE=;
        b=pnTmhb1mwEqvVJvhp3zKhQVGfndqwjW4iHX5X+u+DrUORmI1/etdZTVqkg1ZMXvdpz
         Jg9qgM1tyLSe8duGYrBI+1m+oQnj9kqxZj4lWoCsKa6yG4C5cg07VbvbRiIGUt0BvNV9
         1LFzvXkm+8kNvzm3HC3ERNZsaXcHcRfvlX+GN9p2xCLAZAvLu3OTZGM9rzd/ty1kuz4u
         zvtaDj+xTtjh3m5TggUi9y/eM8DE9Wn16z66Ip5SD/huhpIHknjHUCoSSAYFU0Ukc2Ar
         e1WjaU+pV7WejtVEDCQhHz5DOXO5yKJv2LY2TcJbV7+r3DygypG6ICvMc42t0i6YOGRI
         jw4A==
X-Forwarded-Encrypted: i=1; AJvYcCVNrXPzLOX35uYYtf9vVmpWCL+AL1kWkKb2SqQ1zy35u+kV1mC5kAnGzDsmunGmm8wcqk3HFlgF9vY3qQu6Z303nw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzHWEWfQKeh5+WJXHBG22IRFHfwPNwVr7Td/BlslKpjeXs8bQL8
	9i1fuWY+CAltt0k5Hjgq9AoJhXQJ3KR1Z/ObI30XggNyH/mFDMlOzFxxVlhJ82Pbcmg=
X-Gm-Gg: ASbGncsH/pykF6KP7yKG25I4NcwtUHpMrlWuKKuoimaDSywpBl+ajIegEKmnAYkbQMx
	YNNh2n8oPOs8duLMCKBY5Bqso4VWoOhOVeu2WAlCYuTMVzB2h/5FjIOAGhi1RJm1s/UfirDibui
	j79ApbrvazK23jjUylN2r00yu/YB38psG65aJZFbi2DU4Q0Y5lUa0+sc+os963XkmjiiHkv9iBc
	20mkjQ/PfMRDUQF91Q7TGKWaGVu5Dnm2Yvinv1Cwjqvhtrha7g1/HtMTh+1uy3I3shNtidjXev1
	sM2XDJeJaEEaBTgojRWTevz+4HEkcNdzSW2DtWwcTmzEccNMqnQqdqBrTuxMXdtxk/WmaPuLt3r
	f3pOU5fnnr61BxcEZlj0sdie/Yr53m/8Yl6nKq2ZxzuYYrCo25g==
X-Google-Smtp-Source: AGHT+IGNPQduLpc/IjF1WNJ7fX3IBlI9xKKXL9Jw8b3Rr1V0XpqF83lKcev9HsYcQdmGh6fZ98hleg==
X-Received: by 2002:a05:6000:420f:b0:3cd:cb0f:7203 with SMTP id ffacd0b85a97d-3d0f6b3570dmr1860657f8f.0.1756545597544;
        Sat, 30 Aug 2025 02:19:57 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b8525a94bsm21186815e9.15.2025.08.30.02.19.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 02:19:56 -0700 (PDT)
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
In-Reply-To: <20250822121423.228500-5-krzysztof.kozlowski@linaro.org>
References: <20250822121423.228500-5-krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH 1/4] arm64: dts: exynos5433: Add default GIC
 address cells
Message-Id: <175654559607.10738.12399335584590280087.b4-ty@linaro.org>
Date: Sat, 30 Aug 2025 11:19:56 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Fri, 22 Aug 2025 14:14:24 +0200, Krzysztof Kozlowski wrote:
> Add missing address-cells 0 to GIC interrupt node to silence W=1
> warning:
> 
>   exynos5433-tm2-common.dtsi:1000.2-41: Warning (interrupt_map): /soc@0/pcie@15700000:interrupt-map:
>     Missing property '#address-cells' in node /soc@0/interrupt-controller@11001000, using 0 as fallbac
> 
> Value '0' is correct because:
> 1. GIC interrupt controller does not have children,
> 2. interrupt-map property (in PCI node) consists of five components and
>    the fourth component "parent unit address", which size is defined by
>    '#address-cells' of the node pointed to by the interrupt-parent
>    component, is not used (=0).
> 
> [...]

Applied, thanks!

[1/4] arm64: dts: exynos5433: Add default GIC address cells
      https://git.kernel.org/krzk/linux/c/b3a62f6c3573e448e8b0697a622e7bba0ddf9945

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

