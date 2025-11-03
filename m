Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A3C42FBDFD
	for <linux-samsung-soc@vger.kernel.org>; Mon,  3 Nov 2025 10:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762164151; cv=none; b=bRIVnpf9fOBNDlVTYgRcYbpl2LlQoXLuU+lGkhdk9XRDa0raKGWep7wUxgcvmXzvnS9Gz774gfvwbnQ99wdFnUq3uOQhmAq9rU8zBBADeokily2xFWoluoOzMcugnHOLTJGzmVNv55xsDCU20KGlaMWQHn/9FPFgQmcA6bGkVRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762164151; c=relaxed/simple;
	bh=W0zrDmAkZxcdW8N0iwDoYZEJ2E6P0O3vg9i/EhjU7kY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=XYuhVHEQW45Ef3nF7s3I4Df6dKHeds/6JWVvL+3kyeggmM6OVBNDp6KO3TB0zShHjWpOCjeZubdQpxRZZo0X3Hrurmx3eFueX6zeecvGlKq8s57k97fVuX9D9VJWiaw4ecd2eaxp2xOux550LqNiebdHwkxeEfWaYukDXZyQmtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n3JPoNyt; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n3JPoNyt"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b3f5a6e114dso62810966b.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 03 Nov 2025 02:02:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762164147; x=1762768947; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kk5WeVX3WZidjw/Ohoo4baVD2n02pPZGtcsCU88fulQ=;
        b=n3JPoNytTryJjNZW/YZhzRHW5SNucl9bGohkFkA2Q1bHwBFBhVvFbf8zDrFS0Hn0ui
         YkKcK7hYYsnlTwwy/u08LWCR59RwH87Fs/CpUwjHrJiUxs43qmG+o5btr9dXAP12fc+Y
         Kxdcx8o1/ioHHsv2zKpf4JfiQMFbtjILKDPCIrbk0QwsUYEtHAn07mNckkjWcGp+jCC4
         exO3s275TbRa9szT5YYF+vLR+PlHAHK8VOlNWyv4EZ4JsPx6awA9HxEq6UVyCyu0TQgr
         6+576ufbHQfQQJ2GNfN+j0mJ7wyJ345Dh69zibBUMgDV0SsvCXswNZhagrHw22bG0TEW
         Dxlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762164147; x=1762768947;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kk5WeVX3WZidjw/Ohoo4baVD2n02pPZGtcsCU88fulQ=;
        b=GHNy/ZOyEV5C4y0uieCN4NMfftOA3a1fHcP3POg3vu3WuAjJhVsBI9xbQ5CkLzPZIY
         iX9OiiRbp3oCFGpTX+XeoQHDiSJgqRvOWeDTU3NqBhTrMMp/nAp3a0K3hl5nUJ+vMo8T
         1avUkZjt7M26hCB4obE7UXi3K9mFieRFnlfhv4QnBmIN8ZbZO2Qpc+h3Dy2KoWhMZy0o
         dBgXwGlUO5lbPSYfs1wwMBc9qwCWSTEoUNu3BtSro9Q2uufOEkbnkreiWA32RpPwVCZx
         d6VoSPM3LCsR0OUjwElOOJ/LIkdUF3HjvV1aBIJRkJ7jWSk1WbQl8NiN+ZimzhlUhXrK
         9Hrg==
X-Forwarded-Encrypted: i=1; AJvYcCUm7+7IeoXFRvxll0KXlakfhe/tW2Xf0/fiLUM0zHLs22Tlt9Z4K/8GhgXoVDqLecEo2LphguJoHai77dyjgCsRDA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf+OawRFl71Esv8JzxN2mSV1OgIYgtQ0U/8txqyc+txhzoGfna
	OvfGHURh+Ob/ZuKaqZRMlXXEUucx/RqXKYeG97t3pCDyp7JM/EYdJM7jDUQMSl7LyPQ=
X-Gm-Gg: ASbGncuiZXHZsJnvB++rkjrh1NJmv7mCJ1HxrecCHNRpo6awnLMwdwmubRbcbpWHlcl
	5gri9/iQ6wOEoajfcZWLaulCzsXc/hx2lpfJOyLh9Iqumu8bUy5AXLGSwP8YyZn4NAQijBM9Qy5
	wcAXQZHgN4y0n93S8tTvA59fVx8e6Jk3QuscYxWcZU4VYRopXfXh/nfnh7EIaxg86WrFDhX5hjm
	dEmKPwah3IB6dqg9nrcqGGwrJRxAA6udwZTcztzOJJyoWZIAAZM9iuMujaUFJIOxhR3R4W0rp2m
	7/OLtwyoA37xnid0gYkFAfEyu+t3JRDDVlI75NRtTtGbCRZOtcgbUnBm6nZ/EGxUaJnUy8Gp+AE
	7fsZbdjUK2hlOgN2Le4bWW+Nqh9IYxB57iSsznfIyInxjkFaaKezuOZmHnvVqqu0jq08IUYlS7Z
	kUMG1bzOp2J95dKPHMv417IO+lUNE=
X-Google-Smtp-Source: AGHT+IHhQd0Z7HhWjALB9oj1UOU7TBdJPgOnwuPH3RM+AzCngFPe/MvWD8B/RttW7aRFtZ4rAovK8w==
X-Received: by 2002:a17:907:3e03:b0:b42:1324:797b with SMTP id a640c23a62f3a-b70708ea28bmr632326066b.9.1762164147447;
        Mon, 03 Nov 2025 02:02:27 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b70b1576c5fsm433340966b.43.2025.11.03.02.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 02:02:26 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, semen.protsenko@linaro.org, 
 willmcvicker@google.com, kernel-team@android.com, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20251031-gs101-chipid-v1-2-d78d1076b210@linaro.org>
References: <20251031-gs101-chipid-v1-0-d78d1076b210@linaro.org>
 <20251031-gs101-chipid-v1-2-d78d1076b210@linaro.org>
Subject: Re: (subset) [PATCH 02/11] soc: samsung: exynos-chipid: use a
 local dev variable
Message-Id: <176216414543.27448.5786220259949366154.b4-ty@linaro.org>
Date: Mon, 03 Nov 2025 11:02:25 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Fri, 31 Oct 2025 12:56:01 +0000, Tudor Ambarus wrote:
> Use a local variable for struct device to avoid dereferencing.
> 
> 

Applied, thanks!

[02/11] soc: samsung: exynos-chipid: use a local dev variable
        https://git.kernel.org/krzk/linux/c/bea18c67a0ec75cc602aabc523d726a4626e1341

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

