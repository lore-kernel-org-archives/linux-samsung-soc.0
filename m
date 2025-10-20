Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 022992D8DB1
	for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Oct 2025 06:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760943358; cv=none; b=Wp1oDOkuhB1TyDq3caZt8T3FgU94+jZgG97gRD6EFmaUVdtcZbQ0kYxSMPdqsaU8lHGRIXWUVY4OXUyJB248Bjnky3vykOOw4+8q4edYvaDo0PW/E+bgTIBpltME04COBI3RdNZ3DJK8OdARBRg2p+efP30dKqvhHAiVW+ny0WI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760943358; c=relaxed/simple;
	bh=mecDzN97h600ak8xyTQUYCNTdSnUFsMCyfQwupMXyXU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=I0ASq1vrEhmOFT8HeyiS9jdVNE12VrBJQnsCL67G/sYP1razbnnr7BvkeiMIb4oCAXihcFOxtUIaY93iPeJB8daO4Ke0mqWPpEABBgS2iHF2QtwL2PcO5SiEz7GHSxQM+KM5dDr/gMDFUQTFaQtTLmxfLiGIZ3oaCF7ZxugLBhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Tic0+zRJ; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Tic0+zRJ"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b3df81b1486so76214866b.2
        for <linux-samsung-soc@vger.kernel.org>; Sun, 19 Oct 2025 23:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760943355; x=1761548155; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jaVK8QBoBqs9ihl8Ihmd+vajoOav06YKNVafHor6TD8=;
        b=Tic0+zRJKoBAb/XOsggVV821SpszQxvsXVwov31kOsGDq8k0uqQYMvu2ZJGImPszJQ
         id7siSBnNlKG3g5tSAbFtaOTxmpGN44Ae7KBZH+bGcdHBnO4psh39BzCusooun+9FZzi
         Lmeuiu6Nm19craV3LUYyu45/Ou2kJpq9e5CYz/rdfneU0up23o76sP89GBCLqXOJi3S/
         E1RvAPJByDegVRch8EkxrhdhHXk8DzNcfCdLqqaPB826gDXGk9p1PcZ5k6VSE+9xHsLZ
         1cDRSVbzuIbm7r9AALGCzYIuSsmqKAXcY8CAsSrQCLUQIrDVUfzKMYPScPBgamswynZG
         xA+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760943355; x=1761548155;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jaVK8QBoBqs9ihl8Ihmd+vajoOav06YKNVafHor6TD8=;
        b=tLXUwwlMxu6RHex8LCRlcNmi3tY7iA4GB1y6P5Sxt9OcHncFI2UlFLRG3vVZyShAwL
         TtlUd3lbuu03ntfykQ/ndMF8O/wo8QwhfMsVQnb4BSsPItDq0tZKL9+Is1e6P6aVtRwz
         nYb4euh997VkaCDh8g76AnnE3yVvB9deJzOt2mvs9jdiZwcO82cMkYVEpy6Zu94eYZ53
         elYdcYTF386zKLW1fXyRP5ifqWQoPZAwxLZOUj676l9ONxJ5ZRv3fnYiUZFzZ+xwXycl
         MHxoF7EqNaRm0dWKImRbtvEl33FnSV/YyDc9xr8miBAAZiNlMhjRiFZBrU7MWnA4Z7d1
         S8Ng==
X-Forwarded-Encrypted: i=1; AJvYcCW0fjb3M/frGOqsbQbMOmttnedXnOas9fihTR4kn1bMFt2RzsFcT35TRO5B65HambnlAAtkblIDZpztKQufeSXMyg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywdk2YvAEgdYgcbZ3hsTQ6qkFDSM9Q3ByfP7da0RSuBMh2qI+QX
	OIzzjoE58NuRTG668KIIx6ve4GPU1pS7XuTdQjiWawq/Olm54VlDbygmKzHFrTNBRHc=
X-Gm-Gg: ASbGncuWr3XYI19WNnqZY5eMKlMfkw4DOHMb64KKu/dwGBsBTo3r8+aJC29gg9I+6UD
	LEpI90BuPcSian5gwko//3fUPEwJjBirB+fS8+GkUuP7dlIK2FVFpq9jf+EJ89B8mm4LsxEU4Pf
	XDOfs43PH9LXA4f97fzmNlKiEBep+M+dGv4EzyJcN42/UDqod/1DURblOvDVd4nPixX0XpXcGyX
	XZ8UlKtGnVHvjxbA3y70mQyGuAw+dPviywwE3wUKijZ/7MEwmpZTJMeeUQ6R5Vx5T6ATG9MIWsJ
	EhJTkKXVFgtPaS5QgaBV+9H4cIZtGjBr7jkGdBdp6R/G4PxUIa3di2qBpgpBcrg03CaEeh65t3/
	Czigxs2v0h8WqXFsKywYGiIxEUDEwmLYWuwXJOYDa6+Uo+kjaLLdKuKDYRBKf8Q8HWoaEL5XuJm
	E94KqTkbilLWl4ZV7xX8n1HIcxzts=
X-Google-Smtp-Source: AGHT+IEACXSl3jMi8mrVrI9HpYdMwelIyG0kqNi6i/MEHpYubXK9Mls2weDpSKYlpFEBDaF0smnKKw==
X-Received: by 2002:a17:907:268b:b0:b3b:44a8:c64b with SMTP id a640c23a62f3a-b6471d45511mr806758766b.1.1760943355217;
        Sun, 19 Oct 2025 23:55:55 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65eb036a3esm711731466b.46.2025.10.19.23.55.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 23:55:54 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, willmcvicker@google.com, kernel-team@android.com
In-Reply-To: <20251010-acpm-clk-v6-3-321ee8826fd4@linaro.org>
References: <20251010-acpm-clk-v6-0-321ee8826fd4@linaro.org>
 <20251010-acpm-clk-v6-3-321ee8826fd4@linaro.org>
Subject: Re: (subset) [PATCH v6 3/6] firmware: exynos-acpm: register ACPM
 clocks pdev
Message-Id: <176094335329.18498.4540786180572368152.b4-ty@linaro.org>
Date: Mon, 20 Oct 2025 08:55:53 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Fri, 10 Oct 2025 12:46:33 +0000, Tudor Ambarus wrote:
> Register by hand a platform device for the ACPM clocks.
> The ACPM clocks are not modeled as a DT child of ACPM because:
> 1/ they don't have their own resources.
> 2/ they are not a block that can be reused. The clock identifying
>    data is reduced (clock ID, clock name and mailbox channel ID)
>    and may differ from a SoC to another.
> 
> [...]

Applied, thanks!

[3/6] firmware: exynos-acpm: register ACPM clocks pdev
      https://git.kernel.org/krzk/linux/c/bad0d1260b6dc229657b942400c5fc4f257f50cd

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

