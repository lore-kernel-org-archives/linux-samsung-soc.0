Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B39320CCE3
	for <linux-samsung-soc@vger.kernel.org>; Wed, 30 Apr 2025 07:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745998121; cv=none; b=Cnajsv+/MWhvcTsHsD1Xpcp6Y9PWO0rbygPNfDkN+zGHC6yIMlHNjcdaitvb9mQLNK8/G185j+GX4k/DzqcPn4is1t0jQFzb781tr6bSjbe2LGEP6+Yk2zMcrleZuHCkj7VtkB8sRfbIvxYKMVguF08tbel6ujBZOpYAVmbKFLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745998121; c=relaxed/simple;
	bh=7vr2hgAjqIcePt/DLjBlSH67TMuNgRgGiFvKpvSxERs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=fxseKDVpCDbaOLcWCWqRhq7qE7CwQCXKCXqRMM0O0IYVjyq1ZfGV6BBh+veXR94kGZ6YldsBUH0Swehm+6LKIaJFAW+xkGh5ztJXXEVmZWYBpgmkv0cLmXebNHsE8J7GVTkiU70JWYt1h+AK7yQ5tCaFgdAyRSw0kW75904SnNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wZHfTqHE; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wZHfTqHE"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43d16a01deaso4950635e9.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 30 Apr 2025 00:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745998118; x=1746602918; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QqJMmROQSJ0a0G5OkKSFqFvvoSomW+akyYnIHyWjhOc=;
        b=wZHfTqHESIc8AHv5SUx4roAyAm25oZDGe2SLusxguuDsRHddd9i+ur7ea2D/pNYYBH
         xyRmOya/wlzW8peAAgRWSbQmOVWS6bJqNRtagcCEyVFv5BpQVRES4vQ0w8jWIldaq1hM
         6utM0tO3B/00QbOiVD+L09poQ3gD3M7ecW0LlPqZKdGijN8P59kujViMvRBE+FKoadtT
         60hq8Nay3UmmCssLxi3RQyXYnb2h1Y+qst0QIswiGVqtk97wiHSWpm1kmAoRQn+k0bs3
         KRoQBSmQurQhVfjBhXsJRn8Yde7T+ynqjO5AXv8DNhnQf8Hf2Kg/umI9Tb3h5qBYywI9
         Ddng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745998118; x=1746602918;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QqJMmROQSJ0a0G5OkKSFqFvvoSomW+akyYnIHyWjhOc=;
        b=uX9wlxFOdILM59tMvvc0jUzwix5IdS2Zr3xXMJIOAstTNFOmnL7tmWmGH9mVX3qLle
         W48Nb0TVBNT4D+rD4B5kRnvoeuoq+Hp823ymtIquLJbrKTpu3IKDAdAllDlx+2p5l2LV
         UU2X6elRs0WKAlxM2Osgi3pIUAWwuErWRbT55IHEwloZCZASpDXQex5VVfJjRT+mWYBB
         J3W31FQl5Um2C6Wv1oVPZegCOOsgGqyTtLUBufBxKXwXfdgwDkcqdZSPOW9pszxJS2Pt
         dRFtCBAWaUvN1doJHYKBO+g4GKtzG0H27Hsi8jJHl0nu4y6Yi4QzPW3Hw9PKw7bGHi+X
         3fZw==
X-Gm-Message-State: AOJu0Ywnf3FV3HXueWfTY3Imk7Nj4WkBS6KjA4FBQKyyVEgOBQI22RgB
	p/PWqiQzKp8bHyZM5jl6ne4wjJlCUNmazxxxUPn1IC3WRIne972AT8xAV0QsM0U=
X-Gm-Gg: ASbGncsupJV6V2iFDbyKfJr6xanCQss4OFUWnDoI+ZbngHDH1jnE5Cav1jASo+PkU4T
	gVCGutEAf5JZnd4TJMfv/A22+vXQh6CVtz2cPaFq5PvctK/SrKaoegarP200z4/hWXQSiIZuk5K
	lOVIhAxW/py5m6FN0BGl2wu81lKg68ed6Wyb8DI6HwAHHX+TJOyzLkf2lO8QOEbFeArsmQUQ+uB
	FQ9DTQLLO4/ekh/Di3UW+Aj0U8R4gZ98T5G7//ohVrw6ZFhwVt6aVPGFAXHHNQxcgjlys7KFyTk
	lBQKN8cekG4DA6uNOx3LhCPh/IYU7P03ktESwlWDPliLPXlUsaga3wtisDKtnVL8y9nqqA==
X-Google-Smtp-Source: AGHT+IF7Gh4vjC7xC4WSD1iD2VzffiZ5t8WLUUmff1SqKYA61CCGorcuPW7hl/AFgfoE9CQrmxQ9aQ==
X-Received: by 2002:a05:600c:4f8f:b0:43d:2318:ed7f with SMTP id 5b1f17b1804b1-441b2bff6aamr3696935e9.0.1745998117810;
        Wed, 30 Apr 2025 00:28:37 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2ba4a6asm13905525e9.11.2025.04.30.00.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 00:28:37 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sunyeal Hong <sunyeal.hong@samsung.com>, 
 Shin Son <shin.son@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250428113517.426987-2-shin.son@samsung.com>
References: <20250428113517.426987-1-shin.son@samsung.com>
 <CGME20250428113547epcas2p43ca3c8db840a4235365f61151b043fb3@epcas2p4.samsung.com>
 <20250428113517.426987-2-shin.son@samsung.com>
Subject: Re: (subset) [PATCH v2 1/4] dt-bindings: clock: exynosautov920:
 add cpucl1/2 clock definitions
Message-Id: <174599811635.45412.13637965232179255508.b4-ty@linaro.org>
Date: Wed, 30 Apr 2025 09:28:36 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Mon, 28 Apr 2025 20:35:14 +0900, Shin Son wrote:
> Add cpucl1 and cpucl2 clock definitions.
> 
> CPUCL1/2 refer to CPU Cluster 1 and CPU Cluster 2,
> which provide clock support for the CPUs on Exynosauto V920 SoC.
> 
> 

Applied, thanks!

[1/4] dt-bindings: clock: exynosautov920: add cpucl1/2 clock definitions
      https://git.kernel.org/krzk/linux/c/3c50137aa4c80c532cfcd7444a36b21710189ebf

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

