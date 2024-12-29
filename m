Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3643214
	for <linux-samsung-soc@vger.kernel.org>; Sun, 29 Dec 2024 10:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735466992; cv=none; b=RRhqdaSQeQsSypZAsCvqwL/+gjQgj4Qqud5t9HOpMbuaRRemVMHuVxewbiXgYgV2+C7K/iBE2orAcNGdscpQcb5EOadzYs+4gf0ncA3iE9Bf6wp5oQya9rIGr6Dt5cOQByc9csG2bh1GHpumZBwVqzjkyJ6YuSxKJAnzUi1zHFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735466992; c=relaxed/simple;
	bh=jPOh1OynGqcbQC5/mSoptiKpbQiYMH0Azq4m2i6raNE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=OkOEysfQAC5KaEKPq2QeZN1up38xHkiCc2xHkuyBwOEuJyEhUaY4nPX6P4LDU3disIAJEcQcGSnpQnoSL67/MiSpF3PM7KmL/xLMET67VCGj3Ii7+uf7gF7spzaNa0nsYFR8Gro6SdKBNIG/90XJGA/bRNQK0nqCP3jq+3PiGeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ErzQKxvw; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ErzQKxvw"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-385e44a1a2dso1060085f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Sun, 29 Dec 2024 02:09:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735466989; x=1736071789; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B1e4Zcdd64n/Uq8SZYq9uZiFwUddDGBarfIwN7jA5P8=;
        b=ErzQKxvwPX8Xq2SF75I0DxtROwSnLosp865rPp3yRN2++9G9/UulYRT3F/KhwGPkxU
         EFOJMu3zW0b7Vv79X8/3OJja7Cx+ZqO/36KYNW+DkVtTJfFU0nyNJjrEfRhRh1Iz1qSj
         AhNzp8MGwHxW061bzkRoifYC0Ypq+yDL4drC4QMknwVbqYiwJVhfeuE/GP0fSEGlVj2i
         NTuRT7SdcEEj0k+/h1u5qhY1qQkoghmcMA2v4PiwUl9vPT4uEKTfoph1sZUb2BlGVW+b
         3xvib0P7Lqb/+MoBTb+rUkB/1bhpSKsKsXs//DdS/WY8GBjS1xwkUX54tq5nSiZerdpW
         q4JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735466989; x=1736071789;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B1e4Zcdd64n/Uq8SZYq9uZiFwUddDGBarfIwN7jA5P8=;
        b=E/PbWoK9v6CmBtyPrKmxmauUtT2JNkzPL+JO9n20oVIttlkPwLd74xlDvdyj1A8xom
         ycG+dyVotAFRMvaFn7M9A+PQH+JD7iJotNu1sc4hdvgfIDKJU8rpfdvws1Y9aotcxOxL
         iiE2rwM7fVY4x47kSKV5m3zQ4a99iDqrBNPmHIeqVbmJbs95pt814EJ6CNpkDX8uA9rK
         +YcPZHnQNRhndqObPPWeLZTQcx62AaIfuuoLH5PeqCwjBueBXNr0/5QGzjJupBlKSWIF
         y3HyaDacGF/zkwOIq1Za4oHKwF3qF2h2iD9dgu4dQJC6FIGHII/s6pb3Zfxva7+BgF9b
         qcOg==
X-Forwarded-Encrypted: i=1; AJvYcCV3xH33Z3MoUlLTMDRIkTXhbl0ZCAVlV7zur6eq+QKS7RfZxIFD9+B1tH4Mk8httd316ZNMV2z4YWxJVqljYM6uMQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzYo4Kp/nPEC9FGSuxnghVBQE8gQ/3lU/HVMzb8Xqd8nup47YV9
	FAsJPmFsdVu3kPrzMaJjO3V0hQ7GcD34NEurD3EaTyU1FrTHlYdr7UJWkhy6YRE=
X-Gm-Gg: ASbGncsExgGMGUT8cKjIBuB63M2mAuKS/hl2ilocTFpKcGWo7D9M8rruLyIXbkXGwc0
	uh8EG68+G/xwAWK5+ACm5ObNE3hb9v6A4EaAWvgoeLRB3OK9jY6rYuTMbjpZLVS7b8BkrhqEEVZ
	tflZzWrvMBct0BJIhYzoU7wF77q4Uah/V1p0onlQtIMEdA6JrS2NvSddXRqqWihyysJ2FUj2eKO
	YCzQHpcGeOL5Xvb0mbNLv2XBBFgVY8OB0Yt32KRNSGUMPHuzW3YmZPA4HZIc9YIs9tkcmLA
X-Google-Smtp-Source: AGHT+IFqkvxQps+KrzRziDHQFsICEA+v2gm37Qee519mhPRQQR4sbGLqJY626OMpwV6K23g0gpxUnA==
X-Received: by 2002:a05:600c:1d07:b0:434:f335:aa0d with SMTP id 5b1f17b1804b1-43668547269mr115138885e9.2.1735466989158;
        Sun, 29 Dec 2024 02:09:49 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4366127c493sm318174575e9.28.2024.12.29.02.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Dec 2024 02:09:48 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20241224-cmu-v3-1-33ca24b2413c@mentallysanemainliners.org>
References: <20241224-cmu-v3-1-33ca24b2413c@mentallysanemainliners.org>
Subject: Re: [PATCH v3] arm64: dts: exynos990: Add clock management unit
 nodes
Message-Id: <173546698710.10457.3695234536331992206.b4-ty@linaro.org>
Date: Sun, 29 Dec 2024 11:09:47 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Tue, 24 Dec 2024 04:33:36 +0100, Igor Belwon wrote:
> Add CMU nodes for:
> - cmu_top: provides clocks for other blocks
> - cmu_hsi0: provides clocks for usb31
> 
> 

Applied, thanks!

[1/1] arm64: dts: exynos990: Add clock management unit nodes
      https://git.kernel.org/krzk/linux/c/f21231ac28f44cd5daf50bc8fdae381f451b46c9

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

