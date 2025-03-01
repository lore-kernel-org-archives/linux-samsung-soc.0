Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1123C1DFE20
	for <linux-samsung-soc@vger.kernel.org>; Sat,  1 Mar 2025 14:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740838412; cv=none; b=GPx82nsAzYdF7cwlVG+Ms/HDgeVr5/9OlzOVpdr8WnxNYeYNiJTADfFbMD4MkoBmskIiG+YwyWkG8B+q0ed+KC005bvm4iixqnkh6eu+J9yIn9A9dLc9BMN/wnYrgjddf3hzWFt4bdzbgn617dzq13AIInSxg4HzS0jFPJ2aNds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740838412; c=relaxed/simple;
	bh=3OnlkhqkOzm83q2muEV8j1QVdQCjg4YiqkJ/xDPT168=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=uorsveJMh37l9GSh6tVcoMRWVUT6rXasvWxkfcZVaK4wXRqyRHKYm7k91XBDVjAX/t5gGjMoSjswvkvzqmK3UqF75Wfrfl1dEQ7y9+vKcMAvea4n22QJeAjpjSQGOs3LeEoEHzA9qKER+z2jC5OqpaypHMB8ULkSNBiyXs8XfMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qW5sj1wN; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qW5sj1wN"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-abb9e81c408so66870866b.2
        for <linux-samsung-soc@vger.kernel.org>; Sat, 01 Mar 2025 06:13:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740838409; x=1741443209; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BnbdHsHTQ86fPzgXCuKmjr1fO3E1oZYk9t9Lff4ycVM=;
        b=qW5sj1wNqR1fQD3JbyyY0DzqLPpOoyjHNyqJEzFiwafE2kGVFQwequKWKRIci7/Zr8
         Xq+H5hOyW39pMKT945DaA6B/vndn7teU/9vso1YqM0LMel1/Rv4VyaEqztA/cgoGc1n5
         uwGvjdJIIXcAWiSoeurByXkZfTDQTu5sVbM9gu6c76tCwePNr40DD7wFtTpBWBPYv0Mo
         /K1hWvd7jxX3zewOTJBRkYUJCxh4k9bUlfOqNsLtD9q31f7eO2JW18Lf9MGr5mSBecJU
         LIfHhR8FXuKzvDPDd29x5U0EWWrXmS2QjB2goMtOWJCaLlxskL5N02LJAy/6gXR4kB6W
         XEFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740838409; x=1741443209;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BnbdHsHTQ86fPzgXCuKmjr1fO3E1oZYk9t9Lff4ycVM=;
        b=N7Ji/m+7H/fvL62id2CP6hjeLRmGMWQgIZK+L4DXa8Gjqk9Lw5cQ+FT33+ZZXB4Emo
         eoS20nEko9IJH7MvEAdtgcghcQ8iRcYzlNxBlUBJ1FGWM5ZLcD3Jrp6oMhniXH2CNtWf
         HP7Ulc2mKinp57aJjut+CvBn/IK5EOp8HvinCutTlR2XlUSOXCicA7ezx25Z+5GtZsZt
         gw58wHnMeTDE+vvkvup34yPxePpbsjN3h1I19FNHG9iOJes+EmBqNXrCKe2yUKkyEZLn
         LZKd8SxLkUMhYmQTRy/xx1EosuL2z/mtOv6KPEsn6gM0f3YUWJwWHm5g6MofsuUYPsb7
         +fOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdZ5JdOqyNJa5B0tIUNMSqD3f+Ci9/bGiUo51NJImDXfj2Jahntbh8Q+Z1tFz7VcidPrOPhuvGASkC6VTMrkgqFA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl7fFLNSxgDyYWV16M+J7LhOQiST5XTMsghU0gUskBHvAs1g9n
	5GAJJO0ypOJxv/u0XnQbhpxx1+aVQ+lArVrGw16Y0u7uD19j9oNqq9BNlZibH8Q=
X-Gm-Gg: ASbGnct906pVPVnvkQ1jBJE7sj/hHlNp5cTJkT4nMAQUqHQR++VVZWxNtZnHGMwC4ma
	X6N2/Pu+1dWiAH6maI4NMGe1PPNL1KwZIWTf7bUdBsdZO4pLty6IGvp3YtwzH6HhZ7Kj47ti5FW
	KCXTYHJgS2QjEnjkDGhKRJA+3S2Y85/XtWubHJhE97TRLC84w2h5ayn7ORKzaSuIoRrUZeEBnFu
	3Ivds6EmDFTUdDjHcCNsbsS+NJbM0CFI5AojDNlvXm0qMOj5sPUkA8BSGQ41Wr//Tq9IUWMpuqJ
	tzmjhRiG+PIvIKSbeb3zRI3DiHx25LEHW7gwZBRr0ChzypJjzBv+vJ9HOGuy
X-Google-Smtp-Source: AGHT+IFbAre7Y2ts6f+9wyz3jeSARqJEVou9IA7TgraYYXlc+RIXaNzzDk7QN2b0NMZOmmxJ3LBOAg==
X-Received: by 2002:a17:907:3203:b0:ab6:6176:9dff with SMTP id a640c23a62f3a-abf25b120f2mr310555266b.0.1740838409375;
        Sat, 01 Mar 2025 06:13:29 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf0c0b9cbfsm485532366b.14.2025.03.01.06.13.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Mar 2025 06:13:27 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250223115601.723886-3-ivo.ivanov.ivanov1@gmail.com>
References: <20250223115601.723886-1-ivo.ivanov.ivanov1@gmail.com>
 <20250223115601.723886-3-ivo.ivanov.ivanov1@gmail.com>
Subject: Re: (subset) [PATCH v2 2/3] clk: samsung: clk-pll: add support for
 pll_4311
Message-Id: <174083840636.17657.13627418806102780540.b4-ty@linaro.org>
Date: Sat, 01 Mar 2025 15:13:26 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Sun, 23 Feb 2025 13:55:59 +0200, Ivaylo Ivanov wrote:
> pll4311 (also known in the vendor kernel as frd_4311_rpll) is a PLL used
> in the Exynos2200 SoC. It's an integer/fractional PLL with mid frequency
> FVCO (650 to 3500Mhz).
> 
> The PLL is functionally similar enough to pll531x, so the same code can
> handle both.
> 
> [...]

Applied, thanks!

[2/3] clk: samsung: clk-pll: add support for pll_4311
      https://git.kernel.org/krzk/linux/c/f33807c30664d2b134ba17f2ae0740acbe91986a

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

