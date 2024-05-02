Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D318BFF
	for <linux-samsung-soc@vger.kernel.org>; Thu,  2 May 2024 06:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714632555; cv=none; b=lGGLCduabN2qbxOYOcOHxqDKNPvkU8WqiVq6UpXunvFgBIsjV95R4nfEcm5tBD7tK9404SNt3/82Rj1qO99GrM7MNZoAxuX6GtutXokK/HQji7x2M/AwnBvGz0NfDEW4Da610oweW9tLSR+RyLD9eBIE7zVgZNKgpSQneoU7QLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714632555; c=relaxed/simple;
	bh=gczMRuZ2fsGRpoCXUBhl7NeVLE82+ehtyW2OQrB7AVI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lQHCp+hGVviqitlG9VpscAZZS+WBymd3snNUEGJShyooixkhVe6/m8Qcgnp2hx0kCHShs5+QxAg1rWihu+CsoRxepcoDgMiGcP5CKUyrmNg8W91fi/UarW3/5fjxV+OHXzLEOov/3dtoCGZRLOUgr8f1KcIotdzrDleTH9HINg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z1kFLvvR; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z1kFLvvR"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a5878caeb9eso911284566b.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 01 May 2024 23:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714632552; x=1715237352; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gczMRuZ2fsGRpoCXUBhl7NeVLE82+ehtyW2OQrB7AVI=;
        b=Z1kFLvvRojrI4uxlIx0cZ5n+DYxnfokkUqfXGy3+U6bFxLLNLy8mJZueGBebQwm8g8
         9QBkXZqJDskOPNruyzljLEhz9Z+oE56EM+VkFT+xiMITd9ecnFak+LJYMysLOcNXCHe9
         MXqGvGOTYo5gRUPtCwVfTiboIpD68AEQlINs1hZAz7gVNU98jtOFev4rSwmz5vg+AXH7
         3EikyOdJKmkArumMnydGeRwIa+hTC4LJt909pNS5/a3DwkP3xIRPEqifSoskpdYvr9DM
         kgaGE0fOOzqP4JCTVAaOJrORksyXOtTyUX+mMSTNlaR6pVnyCk12/hWlwTJYoOeTR5a3
         OzbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714632552; x=1715237352;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gczMRuZ2fsGRpoCXUBhl7NeVLE82+ehtyW2OQrB7AVI=;
        b=TRAEhfXNS/lm4ukg+QyxEK2caWd1dve5ePPKDRVPV+de2KxDvAxtdu6z5nnhb0cdD7
         1fOur4S7II0KVTmdjmU0yxdxCkW+BXfNg2gQYsm5ibV14sY7o4+lekpcFZSm3YssqfOG
         ZgjSnXzBrbGqMuiuy5xEBV9fNtsi2W19sZNDezYZtudUub9YUmM4dacqqr5+LLNbwpPw
         zS3kjTNHgWHMT2fGynDCP4EPsDgejD7mC1DWjlCvGSKbV9XASFlr28A1Bxbi/si51IFt
         mBvXQaMy8dFMdr3yrWsf8onBxGw7Y9W+sVwOqPYk52RSmj9hNbrxRmnkCkwZd4Odxwjd
         Uxmw==
X-Forwarded-Encrypted: i=1; AJvYcCWVQPnApHC+fB6m4Tw65tFCYPJ3IRq5+hIe4jryq7UCMGq1egZxVrJaX9yD9MkahOR1eMJkgrrnnwxxWWIvu77jxvtjcizVW2DuPlqcUdRSafM=
X-Gm-Message-State: AOJu0Yx8cg7WRWod6W+R/rA6ryXY8PEERGxVBHp3pwyx8vl6ptPetQzD
	JAm7CoAXhGSrKl559tf2fRj6Cx1h17zHC2gBRL7Vv9+adQGUyPKiGypi77+tZ2Y=
X-Google-Smtp-Source: AGHT+IFkBbgVvaFJQenOiI4ZqLFxEZ91nE8Ab9fUWsy7cMO00V3YYbkqeWeoAC9aai5hppSe79rGhA==
X-Received: by 2002:a17:907:7ea5:b0:a55:5504:6f7c with SMTP id qb37-20020a1709077ea500b00a5555046f7cmr528581ejc.20.1714632552593;
        Wed, 01 May 2024 23:49:12 -0700 (PDT)
Received: from [172.20.10.10] ([213.233.85.172])
        by smtp.gmail.com with ESMTPSA id bn5-20020a170906c0c500b00a58f3ae5bc2sm178588ejb.154.2024.05.01.23.49.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 May 2024 23:49:12 -0700 (PDT)
Message-ID: <cb7823f0-390c-4f28-a797-237afdcfaf68@linaro.org>
Date: Thu, 2 May 2024 07:49:08 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] arm64: dts: exynos: gs101: specify bus clock for
 pinctrl (far) alive
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Peter Griffin <peter.griffin@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>,
 Sam Protsenko <semen.protsenko@linaro.org>, kernel-team@android.com,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240430-samsung-pinctrl-busclock-dts-v2-0-14fc988139dd@linaro.org>
 <20240430-samsung-pinctrl-busclock-dts-v2-1-14fc988139dd@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20240430-samsung-pinctrl-busclock-dts-v2-1-14fc988139dd@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
