Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3BEB676
	for <linux-samsung-soc@vger.kernel.org>; Mon,  6 Jan 2025 09:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736157306; cv=none; b=TcKPMZk554jTDZSgN4Ww/Xm3Nka2nn3L/JZ/Iwz/MVU9XzX7L/EnIYp+5CgvuljihvmasLx2iwUjAs4ko+/bKAWiYY37kMoe6466L9wqEQY4WE2Ip7bg6ksFdzSl9eNOidfrd/+fhFc4OPp3ed/P+XEJyCmNlkUeAs1BrpzqX1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736157306; c=relaxed/simple;
	bh=hsfv2qQhw8XRex5wRZMxOjS0luK+pUcgyVbIRe47p0g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=U6aRfy/jrTirIKN68OeFtagZXwPSU8/Wp42g48kOFeXBY5tXbpOGG2oC5Xu+8JdDhoHeTsl8O3z3Ig58NK6Xynv0aaQ+wXVAXuzWPhJxLw0cAsoWfaa3wiKICtjDjPCbyJMZMkLOT4ogsoiGda/3YDwCVa5t1/ajrMh+ZFnoVn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SbAoHQfY; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SbAoHQfY"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-436246b1f9bso22641615e9.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 06 Jan 2025 01:55:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736157303; x=1736762103; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U2iPJI5Pfh78RwJ7NO/ObtKaRz1jBQUIZUPPXGPcrds=;
        b=SbAoHQfYpqUlR/y820afSIUh0LtujNhVQ1Kfvih8Iu8dcYZB3G/lpSe7wgoCDAKscs
         JecL+/YQ9+iy+piSwkuyrrQGsru+IOsdXK6ABcOHLbUC5qfz9BJw0zZUdIIKcUKwPl8h
         BYkHUDDgEGL5VXe0oUaSvsPw9Pg3uQaTg+pjU9etvFwS5mPJ3btyNYhT4EEnDsOy6pht
         //aK7eOkiU2wOq1Evs4tuLgIESgeA22e1giKL/E45RscC1VjUSIG8XMKevnHA9JPjnsH
         6aHVgjVedD3bkAtJZ4Z0Lj1AMCyo1gFiaOfrsiic4tmi67xzkR8VUUyN3SOdHMZ1O391
         bJUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736157303; x=1736762103;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U2iPJI5Pfh78RwJ7NO/ObtKaRz1jBQUIZUPPXGPcrds=;
        b=wjXAc95sMAls8Z/dzts5T7S3D7xr7BSmTAHBxEZK5ruwXY97bnJeotQrtZni8cq2Qz
         XKCDwFpTukshgHRqch7klU4xHEs8BjaCScox4Dlp3MAvnMSjC6T8NjbhXUwMOFnJuCtN
         GRDFBVT2D+RZfQbE1UdCF2pQGTpkHpvtEoaSiYivSp6A2FRU7dtX6l6A4azSvEB6uH3N
         y7txFMcT2kXVMPyvCqLYo/I0Q0f0tFGwUUKbgdsxdtnFCwU5wFCrSU99FoZ0ZblfNo5m
         r9EmTPROI39bhwQ9feOfcQB/UFbP6rZjKFnr6rurO+8v48mN8w96JgXCOSEwtgsIEEPs
         wGiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUR2oocxRDX8tCxL6uiNIWoQwRtt3hF18o+GHS9lq2CDEZM4yLGV41vGk1IhZYauCU3SbkbxJnC0A7MqoRQ+I3uHA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwoXRF70f5fOncMwyqbiRBcg95j1DbZyMB7JfKCsaCuaiuLciRc
	pHZgGOTQjXjZVPknJBvHe46PyNndWO07BMFZ1e2Z6w/GKbvGbsTSfp/Uv04waI8=
X-Gm-Gg: ASbGncsWN37WR6vdJJieWpn1GOXvW+ysn1EKR9Y/4nb3nocLNuTuNeQfgms3GF0JR+S
	U3fAGvR9pb2IOSAtjJBx0EPXaloyEu3WCYe9om2/vg8hvYLmUmZ7ssNue6F/qnLmtQaaEjjYNp0
	p5/ZEPhx8vRym4z5ADe/+jCcN3bZHDRMKZMCZ6X0K7nGBRNhBBeeJ8iHY87+TlFd03LujL2frpL
	CJo8IBMv9nr+9YTEY9S31JK7ZR4qe2H2M665MkKXaCQfJXpJwpITYXe6HWvLjGNnJk4Y+y2
X-Google-Smtp-Source: AGHT+IGhzA81lWQR5haiIkxbk3kEop+JMPG5/OlSuDW4aLrYxnYZOj1Kch9Rz9kWVISox4P5OqqHAA==
X-Received: by 2002:a5d:588a:0:b0:385:f79d:21a2 with SMTP id ffacd0b85a97d-38a222070a3mr16327253f8f.11.1736157303498;
        Mon, 06 Jan 2025 01:55:03 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c6ad3e3sm49080520f8f.0.2025.01.06.01.55.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 01:55:02 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: stable@vger.kernel.org
In-Reply-To: <20250104135605.109209-1-krzysztof.kozlowski@linaro.org>
References: <20250104135605.109209-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] soc: samsung: exynos-pmu: Fix uninitialized ret in
 tensor_set_bits_atomic()
Message-Id: <173615730230.114023.7997873261724277424.b4-ty@linaro.org>
Date: Mon, 06 Jan 2025 10:55:02 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Sat, 04 Jan 2025 14:56:05 +0100, Krzysztof Kozlowski wrote:
> If tensor_set_bits_atomic() is called with a mask of 0 the function will
> just iterate over its bit, not perform any updates and return stack
> value of 'ret'.
> 
> Also reported by smatch:
> 
>   drivers/soc/samsung/exynos-pmu.c:129 tensor_set_bits_atomic() error: uninitialized symbol 'ret'.
> 
> [...]

Applied, thanks!

[1/1] soc: samsung: exynos-pmu: Fix uninitialized ret in tensor_set_bits_atomic()
      https://git.kernel.org/krzk/linux/c/eca836dfd8386b32f1aae60f8e323218ac6a0b75

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

