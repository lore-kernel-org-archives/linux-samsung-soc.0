Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 608E3823DD
	for <linux-samsung-soc@vger.kernel.org>; Thu, 28 Aug 2025 05:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756359357; cv=none; b=LuYAaLwXwT5pk3MAK/SDLeESB9+myA57CVd51aPJV+qE2JpMvskSzs0Bt8BArtYRq5Uf9qOvEVhmG0G2e3f1yBiWOcULJXT4T8CeDPm5TNsXu7xX+tJfw/zgcvGvdMSEey5RHELVihJjHAhCQ6WPV+ADz/iHqVd6/FdONpYmyFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756359357; c=relaxed/simple;
	bh=rcAWr9JSebwJfCokBDML03Zmc1hKN/PsbbEvit6r3QU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KtDX+Heg/KV85pbLsBwBoCirbDaI2Rszzv0ajG15llUGp4UrEb6JskeukCSV68tC74JcEJQ+PRQgcsiEsqsVwjIVrryU7nfqnoIXuTdOf3erDu3lzr4M1YNk0dV+wiApZVBPNjRuVeaDIAD5BkTcbYrUe1ukptVN4oVXq10c8To=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MaUYOxv3; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MaUYOxv3"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-45a1b001f55so2109945e9.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Aug 2025 22:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756359354; x=1756964154; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GVN6vmL2mzYorsNRnKCEmc0gW60w1iaICM1/zHjRYZE=;
        b=MaUYOxv3AXHaqpmdWy2tM0PWw8OFhZEKF+jEJbwScyJUD7C1Zr7f7tOywNzbXlZNae
         BiIauB8V9o/NsEfcz7RDot3hTxtTBdVSQY9iSNdbWA7mNJbStfPolC21qzOJoZhq5CAW
         KvpVpyCiy4B9h1uYnDOgbtyDTzvYVpdvzVaddzvK0HmDvTcYk+GRhZKDMJ8SdEuitENj
         dE+7bR/uzRI1FmM7iue+0xixWa9corVyQaHRs3ke4s8JldQvBIljiZM9Kop0rtZ9+0Qp
         awmeRRyVPeOU6vU5m6IVFa9IW7CgXi8XdR1WgFxINBbGxD+Fmmt5UUIQb/JmV/Oulh+6
         GaXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756359354; x=1756964154;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GVN6vmL2mzYorsNRnKCEmc0gW60w1iaICM1/zHjRYZE=;
        b=lff5RewzPdHf5Cmyr9siZF97eS6dNPMIX6WfKsddq1sDTnEISz5nbQe8Pm8fTp6B5K
         ygyMYNg+u46nJ9F7atH7m02PE9SPrfvg0J8BZjgM3jN3ULWytKt+loq+wnSrddOR+8T6
         Cp0erTYfiCqO222dttf3gUZalDQcLtfDPv8V7/KmQ+glIN0SQfCjex4CFHF5YvNmAq2D
         BQ5ci35Sl5mnv+pbCVDNkLMTxoIs707/t5gaZ3268BOeK1CfNQ4vk4n22ixP2r7jJzVI
         F1o0lDaNftV0K3sgtV6QfhRc76humkmgu1ZXgWT1q1J5bDtfZw9b6vxWVJT9mAu6AWd4
         8W7w==
X-Forwarded-Encrypted: i=1; AJvYcCX8mKj3pe1wn/pRcqRF1WjS5sR8zUoJr2jmz//ZfuDwO4QeCqjtXV1DnOahOCgVRIJ3e8FaSCReyBmFE5tEg3FObQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2AxlxKrxJzPa+88PfWN/Omsf5zpAxPvAsbwcOZT67DaPgv+tc
	Nwr73AXZpbAlvLncuTEWW7LDCyZYbdIs42TN9mUS9onfWeN2TqetVF29bhzQ8SbX5Hs=
X-Gm-Gg: ASbGncu5cshF7o82qXAzXf+peMLV3i1OpCAlJQcwgGc5g1T1XUjnCqwKGkBgVSF7MPr
	Pml8muGBrglNEhiTok+C+maJOIE0dnP1Bb9pFYaRSs8FpRReJK6sk+lggIykLrWnAASlYI+5Uix
	aFHs1en9Keo7EYpco/zAflzR+0FxuMlQCxwUbpYSPIBiSXDmgxrAxfRjguw9/CnGiQ7QbkVQJJx
	HNGS1opzE2716Hx+FHCqIYLBDJM0RDfdV4PWCeLwgbphekN89d9/5YQjhbClc/D3XqMd+ygatyX
	GdnFhqXxIgtP38EichxSLQDI5NyeXly4gfTG7xRyeKxUXbYO6OUmIpF/iTDk7ZBdiBVG/EfrrBt
	e7m7m3rmmnpP4CLk013LGdk6ymITwnYyY1gDKSfA=
X-Google-Smtp-Source: AGHT+IHIR++z2ZTED5bprbyTQI3HdqS+SJGiXMbzBh/T/8B21WwlVZNnxeYMt/U1HQ0RYCeCpzMWIA==
X-Received: by 2002:a05:600c:1c98:b0:459:ea5d:418b with SMTP id 5b1f17b1804b1-45b5179f3dcmr185227785e9.9.1756359353745;
        Wed, 27 Aug 2025 22:35:53 -0700 (PDT)
Received: from [192.168.0.251] ([5.12.38.90])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cd0acafd09sm4483005f8f.31.2025.08.27.22.35.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Aug 2025 22:35:53 -0700 (PDT)
Message-ID: <407b0663-1f54-4cc4-8012-75d61e94e6d2@linaro.org>
Date: Thu, 28 Aug 2025 06:35:51 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] clk: samsung: add Exynos ACPM clock driver
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Peter Griffin
 <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, willmcvicker@google.com, kernel-team@android.com
References: <20250827-acpm-clk-v2-0-de5c86b49b64@linaro.org>
 <20250827-acpm-clk-v2-3-de5c86b49b64@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250827-acpm-clk-v2-3-de5c86b49b64@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/27/25 1:42 PM, Tudor Ambarus wrote:
> +config EXYNOS_ACPM_CLK
> +	tristate "Clock driver controlled via ACPM interface"
> +	depends on EXYNOS_ACPM_PROTOCOL || COMPILE_TEST

I'll need to update the depends on line to:
	depends on EXYNOS_ACPM_PROTOCOL || (COMPILE_TEST && !EXYNOS_ACPM_PROTOCOL)

otherwise on randconfigs where COMPILE_TEST=y and EXYNOS_ACPM_PROTOCOL=n I get:
ERROR: modpost: "devm_acpm_get_by_node" [drivers/clk/samsung/clk-acpm.ko] undefined!
