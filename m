Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 089232566
	for <linux-samsung-soc@vger.kernel.org>; Thu, 28 Aug 2025 05:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756359063; cv=none; b=YJS1fkT3lY4ZgE0ENY12jtMp8Z2o2ljkLKtpnGU+5ukfyaOX3KMWKlJUU/qay1NP53HqSG3bctd6aFcoG68PH8qOssGk2SH3nPiDVvorGGYcSI+UK5DWzaoL8M2QTpDfmLFeZzHkRHKca+W1q7Qaf8BzVXcl7cb8cRxSikkENvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756359063; c=relaxed/simple;
	bh=5zKrEAuiGDKnNed1dJm/eqTT9oB2Ui5PKZfLN3hNsjw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ljl7A1q0Nq/12vq0UecnfRmFduwuIvPn6q8ThTFIj/TT7dU1LMrBRcWh9gLZ8nEc0gOD3yMtkmEIArPBCLKAyzAs123Dvf4kYMscuEyhkmACXHqMTC/wrgD7FKFq17Jf0gow+7BflA6rcxhDrnT0D6A5uxMIiTdqG1ElBa1g1HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tcJKhJ2r; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tcJKhJ2r"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-45b77f59bd8so1873185e9.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Aug 2025 22:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756359060; x=1756963860; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Dukyz/wwn5n6nYfGASrhAq9EDpRCS5QgtuNGs9mvY3o=;
        b=tcJKhJ2rjU8XiF2creoqkOcYEVC6e6SsYdTiMhu3oxjqw4HyZZP5CRcQi1Ufj4whg+
         JYbb2z60MCXFsuAGriWHxewudJ/gzRJ2AHCmJShNkH/niWb3CW8hYCxj6aA5QDZxEDdE
         L8LwmCudkPpl6tN/UiQgRYdtcjwgTnV68z/YgSWYMVwkOh0/qhEP4xBGjfuQOJJZCb0E
         rOyKLnM09qdk9TTip/XKzmZ5e2LkbXQ3OQwLc7m8MO6jJmb5LbMkFQxbRn+Jx7diEAWf
         swdogQWCmYa2BsTgAtr/5gJ+aHSULLzNCptplGychuwMWBq/WACHcbJQr89MNRGYyMN+
         0EaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756359060; x=1756963860;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Dukyz/wwn5n6nYfGASrhAq9EDpRCS5QgtuNGs9mvY3o=;
        b=uaL/US+fM7MY9H7txh1KayFhJGXQsvOLBwUPm5S1OVgIK5Z7MMh/gO/Gv40DQu4szK
         D1xJWi8lnDqofYyvQ0vpjS+CrSDhUIXy54oky6msI/rdfZBVHcdIekKrAlkwNabUVMnI
         cibExX7LF+tV2TWnb1OVcWIw7RF2uLlnhEZ127BZwePh/MrjGflc6hseN4gBEjLh1TyU
         P0ICrcRGNUG6kYvKaHpq5OsvZOwdd9LZI1Kyy8aSTOv+jXv9KHf+1wlq4tvIjE5BkzEA
         AqfJH7KJVE4tQoJE5o7LiUEh0wJbHYJnoDgoO9x7o+M/tG+gGkt967Xt/5xXKlFR8I2o
         VJTw==
X-Forwarded-Encrypted: i=1; AJvYcCUG36NGVE4pqxWvaf7i7tZCs5xhXCBx9QDhOuheLvCjpHA5v2ClSty6EKuMBAsNGD19lFPh0rlXWGrG4YvX/FiNYw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzA+mZ4WMtgOKU5OXltr4sH2sQH/u8PaH6y94DrGQBoK+FwECcR
	CdAIqOcmZF9ha+BXFqs22CH/sztfP4HZ8wXaGbzo0ud8GpO80eW5goUTtiN+LU2etrk=
X-Gm-Gg: ASbGncs2ESbeWf45eWeVArPFy1SJWY2paYg0g5jBzvnmlVj2M+EMxdclYZHxJO3Rmkq
	QIrXi1ipOhmOJTRD+jPr19L2MQRw3Y7SHO/0tbQzP5ZKchrb225iUE9TH4WuDYtCaq9juvpcELk
	7zY6E4Kn2Z7U5QeAPesOrdvc05r1jWJ6Yau+Ku7s3NVhtqWlLJ+pDMDmi0+aSZ3++hNlCGWTjrX
	1HE4OZUwsMbzgPI1qzW+uyh5tY+7bgvHPOSO3r4bAjpkPlr5J8/LduGdLclQy70EKido1sD/5Y/
	1IVRy/PXxubMsg+KyOMbBeADGqn1zpPFEj3Prd7fojm1X9iJAxbg/BccEiyX3iv7RIse3hytZOf
	WXkoqXiA5i1v5AGSvA78paEnwLOFT
X-Google-Smtp-Source: AGHT+IH4nwfNWHmZGlR8S50a3ZT7D5vEGnIKIVmskD+uwNW3XeQDTxi4IgzGD08mK38khPTU4HbCsQ==
X-Received: by 2002:a05:6000:2f86:b0:3c6:97ae:a59d with SMTP id ffacd0b85a97d-3cbb15ca063mr6020844f8f.8.1756359060216;
        Wed, 27 Aug 2025 22:31:00 -0700 (PDT)
Received: from [192.168.0.251] ([5.12.38.90])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cc4b102889sm6638839f8f.51.2025.08.27.22.30.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Aug 2025 22:30:58 -0700 (PDT)
Message-ID: <05e9dfa9-d628-4a4d-8cc3-f6854cc186d9@linaro.org>
Date: Thu, 28 Aug 2025 06:30:56 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] arm64: dts: exynos: gs101: add cpufreq support
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Will Deacon <will@kernel.org>,
 willmcvicker@google.com, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, kernel-team@android.com,
 devicetree@vger.kernel.org, =?UTF-8?Q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>
References: <20250827-acpm-dvfs-dt-v2-0-e1d2890d12b4@linaro.org>
 <175633665113.3746832.15304875656374701987.robh@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <175633665113.3746832.15304875656374701987.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/28/25 12:18 AM, Rob Herring (Arm) wrote:
> New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/exynos/' for 20250827-acpm-dvfs-dt-v2-0-e1d2890d12b4@linaro.org:
> 
> Error: arch/arm64/boot/dts/exynos/google/gs101.dtsi:75.24-25 syntax error
> FATAL ERROR: Unable to parse input tree

That's alright. There's a dependency on a bindings patch that's described in
the cover letter.
