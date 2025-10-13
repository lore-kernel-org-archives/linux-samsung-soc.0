Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 645D922A4DA
	for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Oct 2025 01:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760317341; cv=none; b=FH5+CbNFpU74TRYXYslyO2sYd4preCdklFBy+wWC2nxuqBN5CrrykpqpWfWbEqHrE9FZ91wV/BSrsUBtxlQdMlMqn2yOk2K2IjEhUN+oE8a5Kx2ecN6GPyooCMcogqJgDWEAzk3MKonLVAQfVmyhRSjkh0JDWVhES/jTcqphLk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760317341; c=relaxed/simple;
	bh=7LWUTdGD3fSIXfrlVlEN66Lo77zZq6a7cdAXAuHQS/0=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mQZVEFmFhL6e5stfC9JyOlh/XmKK6J0rg1/muAZbdQIz5cWeWt76ebO+sLgvcfG871fhMZkHYtV6lUsdfPAaQOcuq2BFB/fQ457V6G5z3wQaErsAxtnQZmB8h+m0MqK0wLLQDUuGsUlc7L5QkIqxtYMzadpO2RWgQ/8DbKUKTr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j0Kpn4GO; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j0Kpn4GO"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b63e5da0fdeso250773a12.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 12 Oct 2025 18:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760317340; x=1760922140; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7qskwUA9a0ZXAj9gIGOlNM1CbPhOSvyaPzijPhKtGdE=;
        b=j0Kpn4GO5OedenAcdktMf6soHOXNBz35WIeGZ2UeU9XeUZF+ilyuy1iCJPMl+fVyVE
         BdpXEUSMWjWqZLUsGvEFU8J1OZ/6WX+1P7ZBsZaRs1D8M1LFvNCM4f9pOPA3R7ek9/QN
         CYSxlvbv9mz+zviDEnQKKHwigOn3WN09nzdVXfIGYiaFapBL/rCf31Q3KhogeOSFU3TM
         ELUvaziNxma3zrMqSkyLrUdB7msUAk5C3Ffmj5kFz4GZCGO+g4NA6vPNyEuvDcutk0eX
         dggbhXEpPO1Rftndbk9AsbZDBp+/abO3aou7XymbmfwsrKSlHjep+zFbgEu1mSzYE1Rl
         3wAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760317340; x=1760922140;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7qskwUA9a0ZXAj9gIGOlNM1CbPhOSvyaPzijPhKtGdE=;
        b=GBZEZaaN5lnBo1kqiPVmZxQdI9HeaLkZTHT0QRKSMTT2/DPfOX/GkQZF6Pisu0mKij
         QGU2vSOGg45H04gm0eIYdqsVV+IgPEhLnQTQ8xJrP8TeYsdYSK4foc5dAvURv5MRtWru
         Ebl0oiys3v7A6wUXv6reqVnwfZxDl9IJu3R+kH5yTQ2ZU2E0Ob2RH6rQ8W0MUcufkTEQ
         LuNgRW1zmDudcPaAV9zFyylJnAcvWtFh/pvj2B+hcZ1J+qBafyzLGgXWxHuh+iOlN3jx
         lUEKgUoQRNylf4wnb4uaN2LVhUVu1n2fFGjcT/Vyj7SHLgtepfrVOX3QNPO11F+KuP0M
         zxmA==
X-Forwarded-Encrypted: i=1; AJvYcCWYe+4pzo6w6O6+8y3cBOt5AMyxDttmR2J4XCWDqwhoEHZA0DQ2eqbYcBVNDnvsg8D5T9iCWqdEFS7PlUlEgrffbA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8L21E8wwP+Eardzx8oJvbBkgNRQSFFjR6srlA7GG/2GvtNjkp
	xbmZrgN4871lb/ZNSa5ePSvGkfvLgEFLq7FS/HaaoQJjbK0Cokn7MN1VhB09GNCvarE=
X-Gm-Gg: ASbGnctAv2seydBtAcxcfXJcV45gl28qnpc6VgoYMTV1EOq0/NVi86XeUDVO9trErHi
	jxu+0jP6sRlU4mMqOWPwxJsgFk8GojYF1w3k+78Zss1p0QdMP6UaD6um//kA7M9ENnelRcJf4aA
	whW7A+USQhDwmIE4j5x21P270FXP9W5tO2q3OThRgr3NOFgzKazbDw5Ucg+R/aEceG/7fquR5Y5
	8Obi9X9G6iOfRBSY4V+OOFGszHRAS/ERaoQJ649nwHGg77g/jV9IAu2Qzu1/bnEtzfVcrxqDPlt
	3bh5HgBhqwPYO0TlHBe3z/q8CHVWP2g7YJTROBrsrM0/L0E86I8mqSNn9r3MeW3WpPQLmvFLehY
	4IpTQ8xifuFf1/Irdmfo2W59BnOEyTIG8Yy5ic5Hq/TtrM8kG4zq3Fuktm1/oWGmIdxJIxA8=
X-Google-Smtp-Source: AGHT+IFCIddCK26dec4n+ytGNYUXqJLLuulmf2agh5auUmkxLNW5WchdvaXA+14Zkd33rJWFKcoCRg==
X-Received: by 2002:a05:6a20:6a1d:b0:2b6:3182:be18 with SMTP id adf61e73a8af0-32da7e23aa5mr14077202637.0.1760317339798;
        Sun, 12 Oct 2025 18:02:19 -0700 (PDT)
Received: from [127.0.1.1] ([121.134.152.93])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0e2ab3sm9512805b3a.64.2025.10.12.18.02.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 18:02:19 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250905173717.34240-2-krzysztof.kozlowski@linaro.org>
References: <20250905173717.34240-2-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] soc: samsung: exynos-pmu: Annotate online/offline
 functions with __must_hold
Message-Id: <176031733717.32330.16031922861063779323.b4-ty@linaro.org>
Date: Mon, 13 Oct 2025 03:02:17 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Fri, 05 Sep 2025 19:37:18 +0200, Krzysztof Kozlowski wrote:
> Annotate functions writing to PMU registers to online and offline CPUs
> as __must_hold() the necessary spinlock for code correctness.  These are
> static functions so possibility of mistakes is low here, but
> __must_hold() serves as self-documenting code.
> 
> 

Applied, thanks!

[1/1] soc: samsung: exynos-pmu: Annotate online/offline functions with __must_hold
      https://git.kernel.org/krzk/linux/c/326312707492c136ba44cf96730e70aabc959da9

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

