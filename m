Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB051C6B4
	for <linux-samsung-soc@vger.kernel.org>; Sun, 25 Feb 2024 16:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708877479; cv=none; b=N9tE3AtrlyBwizWujCxUUKHIgo0Qz00yDbnDnGfMNDVkoUOTpd+CbQo/khfUdm0GHXEVmwFOM/qOOvL7Q/v9HHK3f4uQ9sxFX/KXMJUa0hr9BSRq1B61mAyqQ85d2daXYGhbRaBNWzy4g5B1BmP9gj0HbAD4IAP/5Nm42mkzjFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708877479; c=relaxed/simple;
	bh=P80jgCoJx97whY8RZv7ltxiyxidW6ExA+D1/++A5684=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=SvpZNLjn2isUkMsuv9g36VsaP3B9c1QEc4oYU7DjTMZsMRyoQMKJ4Tx1qPoDHdpeopNCovlPImBRe9pmcuoLjg/AWuLp0ZvTAZuEGi/GWyyzyVxzmkchYvXfSzOFVmKGOyaBfZ8LbhlxNUTJ6StKRF+6uAWmOoBeLSuxaHUo76o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eMacf//O; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eMacf//O"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2d180d6bd32so34510911fa.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 25 Feb 2024 08:11:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708877472; x=1709482272; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PzgKojf3trYLunnGeLiGp/WQF9mJK3e1ky7A6J0BwN0=;
        b=eMacf//OK2/Z+1jPCjCNCQs240fETw+moV7bNsSpyW6U7it6+s5eEDQ7cTWPw8XTWs
         NaFADShrjMOGiJXAmeyzAjytIWN6KLe4wMZ2PdgMxjbG3GxJ2l3Jyz2l+vRws/SN1xjr
         EHcGcjTsj2+KVWDBWnhYNwUvC0f7+j6FZ5GGu6GJV3ZrcITTcUZLRzG9uy+gcd+I2FjD
         g64gurCdvbHmmZAz3sGm1EIHq1PFFlMXnIIpSRmI+SshgcFlBUVc8Agw9QKo5ttEHMhU
         SBytp+SKRQIc/ahwkunEwkraN50+u6wGXc39CsIMOlF9o7aq8r66P2NGwlCXyFchhN11
         wfJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708877472; x=1709482272;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PzgKojf3trYLunnGeLiGp/WQF9mJK3e1ky7A6J0BwN0=;
        b=uBXjq+L5M9fjdPX0X+byUG7U5G24I8mx+akyidqdV4P45vePJ9y0VjBUA/AW3v0lsu
         +y9m7fZZ1Ji2HWK0kigvrPCeuMMmJtPDybFL/RYHBSIeN9Ew4Ko1UMeMHPfV4Jb2XIX5
         /iNTTFZC6sk7bqyVu+zotldaMnWFBt3Zp7t5Q7KSBJKrEIBDxRxqYjTSxFnlZ+Q4fV1x
         CDW2Zx3kyQRvhCO8R9HIVomnFLxMF2GK7zLtR8jQIeAFhK9itslYSZfYXmzfYiVNSn+1
         DPxfJCMnBZ/3oFdMa2VDx9HAiWr+m0PV6Oiaj0Kvbf2yFIDo64UzC8Z1VQn1rFAOkTeK
         88gg==
X-Forwarded-Encrypted: i=1; AJvYcCWEmwU0kUtXdCT+dU3LCifUd5WLf0V+Tk/wZ1Del3luvPp6+t0tdsOPnpoIN6Ye9aToCgPGhqmGRv7SbTNnemFjmuNaUU9Xvr3ygvXdtcmK5PU=
X-Gm-Message-State: AOJu0YzGvQXOWVEr6ixwiVdLh5A9u0L2R/bGnfWoVGIFOoAyjusOsCgM
	epQPM+iFe/p5QaVVOeuwwCP6DSudYdJMLo8Z5J+tkImWQ8sEyy3+hik62WzDyQk=
X-Google-Smtp-Source: AGHT+IEaAI1AU10HJTP05nLv6Cuo24RSPsM278RNSVdPqNxpfxcrIfDk93zPcr82zgNkjNqS+LG+7Q==
X-Received: by 2002:a05:651c:2211:b0:2d2:8814:e3fb with SMTP id y17-20020a05651c221100b002d28814e3fbmr1056659ljq.49.1708877472590;
        Sun, 25 Feb 2024 08:11:12 -0800 (PST)
Received: from [127.0.1.1] ([178.197.222.116])
        by smtp.gmail.com with ESMTPSA id n21-20020a2e7215000000b002d2697570fcsm579184ljc.93.2024.02.25.08.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 08:11:12 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, 
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20240224202053.25313-12-semen.protsenko@linaro.org>
References: <20240224202053.25313-1-semen.protsenko@linaro.org>
 <20240224202053.25313-12-semen.protsenko@linaro.org>
Subject: Re: (subset) [PATCH v3 11/15] clk: samsung: Pass mask to
 wait_until_mux_stable()
Message-Id: <170887747056.215710.9176001640764201554.b4-ty@linaro.org>
Date: Sun, 25 Feb 2024 17:11:10 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4


On Sat, 24 Feb 2024 14:20:49 -0600, Sam Protsenko wrote:
> Make it possible to use wait_until_mux_stable() for MUX registers where
> the mask is different from MUX_MASK (e.g. in upcoming CPU clock
> implementation for Exynos850).
> 
> No functional change.
> 
> 
> [...]

Applied, thanks!

[11/15] clk: samsung: Pass mask to wait_until_mux_stable()
        https://git.kernel.org/krzk/linux/c/152cc7478677dee6a11685585fd17efbce6e9db5

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

