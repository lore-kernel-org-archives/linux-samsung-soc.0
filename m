Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D002EFDB6
	for <linux-samsung-soc@vger.kernel.org>; Wed,  3 Sep 2025 08:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756889565; cv=none; b=PTFXKLGHSocxDCxWR13Z6cbqCgpK4oP/0ynjcIl7UZnqdSKox0qEpVBdXfPUlhDb5FSO/C96N4BPFbE151QDh4fy618y3j2vtlTVMNQfi6KEczHiV6BlbEmWUzYs6QjZuUZEK1kqDynEplMwYWIpAvrgHxdSgAZ9Iuuv8I+BxMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756889565; c=relaxed/simple;
	bh=xgkUY21Rbxol8p2BuC1ppQ62HUjYK3ElgQPpX3aSKvM=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=PU4GkV8vINcvB4IPrfBY9liPRz9sJDx58O1uvB8S60CQbvJxgDBIZtCN62C49WuaKnGBg16jpeNTVSDQvIdRbI+L+GiRVt1cJadqAY4wcOu7S/UiDKSYRGwIqXv69oSXYFwA8OKvnWNyK9SgyObWlSsxCTA1ZgwJEendSFR9cuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E3uC/N1h; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E3uC/N1h"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b0413cda0dbso67364666b.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 03 Sep 2025 01:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756889561; x=1757494361; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SXuAsC4/EYitpuT7j2ogEhP8VRvM8f6E0D+ICyRlOQs=;
        b=E3uC/N1h8fYevu8eZo9KF4dE1PfoHmRoazEJAAGAL6IshPEiQC3pT5W/b6h0+gJGlJ
         nwTkWJAW0J5hf1GPE0ELag+KGmDBCstmInbve2p/+lIgjr5URKLKu6qS7gIq22wTo6h1
         HDGxeu3KZI7aMG4NwNFdhQO57XOn5iWOy0pz1BRHie8dNnKPyymsW9ESUiRMEp1VLpNH
         1kAhOxwsId6Xk/9Pd898cZWP6syIYb5oETBCHP+rQFg1K/eLjFoMcc4obY+ZilsREr5j
         9Ah9DaR55nz/PQnvvrDOSyJsvyQklHNk3lS4ncGrBh3YkHaqO51far7MxPZHzcr8tgGT
         ZaKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756889561; x=1757494361;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SXuAsC4/EYitpuT7j2ogEhP8VRvM8f6E0D+ICyRlOQs=;
        b=UDtzvIK5mW//Vf1F9LJ6KGLm79hPID0KTRwGQBeAS3CCtGh0MDcoV03rGTBAdy5ymw
         XGafbuGR6/xoSTEaYR70UN4x/HwZZrg3XMBj2D95Vg/egolX6CHb6m4jHZ2eAJeXpieo
         OZXEGGyaqddyh0eqww31jP9YoCb9jS7OSpejCBBDDXeLhUGII6mto5hbPsR4gbA6FE2d
         VTByANONIJdLYRgqbOsgkW92SN/CSgVwK/kubhjoq7YNUgcLb/fkAUeLfK16zdjIRvWM
         Zns4E31IlwKLTKZq7QZa0OIx402dWb33ExJay4ec0E12gqkJ1foVq4ixRivdo+GW6ykO
         Z+HQ==
X-Forwarded-Encrypted: i=1; AJvYcCXu0pg7kdZVIxdOFK2F3pNlQNIz/8J6h718kVRhPmknJOV7s+wUvubeLcZyIznegHTD7s95+8ILebXEMcD+CTzzIw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxa3GQEsORiBh+0uMlhtboHO/PMxyS73l3sTSNClwLbL6S/Byu1
	LgCRraI3jFBFyHqOppkdjIoY0sBMkMW4cR5LoBa8tSDSOArUOksGC1WmxHBN0bco2Pw=
X-Gm-Gg: ASbGnctoYvKuWsaLhu0LiYL5X9LUC81DreA62BsOpX4ZNsolvKIV/3i+Ap4KAYKLltu
	BV7mxtzSKNLzcy9yRksZk7F1X5U5ukHHstjFmTPr1BfZsT/iB02M3ni4/y/98K2mBbVAoGqE2OH
	mhUXTTyoQfdrBMsHJx8//HWwDUYJ8yJ0yD70M114gJknkJcCsQ25ztm3YqkheIb1s5tl3g+7FcO
	5kQYRAxiIKbFmJPcoD/NcxMOoMKOdHG2zyd5BhYTWXHTrUM3Lv/gIYKbQG6AUqvGgjbintgSGYG
	nRjmGN+caflRxUBAeqGhkhi2eQVP9Cof7jQjCo1OMQWPH5QJjkE6zdl8e/YEagpsahs9Xi11Zap
	9OlqztgOMsyqoWt9CgbUR1J6JiudplZwsix4L08g=
X-Google-Smtp-Source: AGHT+IF79RuXHW2pwxOc2+riBp+Wf+b0VTzVijhXxVtt7yjNxZVsCII4hmqvTw9cMwLtHMrwtHfYWQ==
X-Received: by 2002:a17:907:1c25:b0:b04:53be:7652 with SMTP id a640c23a62f3a-b0453be78a7mr304851666b.8.1756889561565;
        Wed, 03 Sep 2025 01:52:41 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b046eb335f5sm53713366b.28.2025.09.03.01.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 01:52:40 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250819131641.86520-2-krzysztof.kozlowski@linaro.org>
References: <20250819131641.86520-2-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] arm64: dts: exynos8895: Minor whitespace cleanup
Message-Id: <175688956033.32106.10753846034561344868.b4-ty@linaro.org>
Date: Wed, 03 Sep 2025 10:52:40 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Tue, 19 Aug 2025 15:16:42 +0200, Krzysztof Kozlowski wrote:
> The DTS code coding style expects exactly one space around '='
> character.
> 
> 

Applied, thanks!

[1/1] arm64: dts: exynos8895: Minor whitespace cleanup
      https://git.kernel.org/krzk/linux/c/045bf0f825cf8dd53468e70fa494b06aa17e2d33

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

