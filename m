Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C343C278C
	for <linux-samsung-soc@vger.kernel.org>; Thu,  2 Apr 2026 08:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775119589; cv=none; b=oEw3uTDyl62HFdnyTUwinGdB1f6Lnw+MSe6kNgh3osvSkyWW3ChbFmAmXtn867yR0SyNl0S2qgC5ip+Jq7K8nos/eWVWii0cgpDZZJg4E8WoI7MnS+oJ/NiQW8bpUEfCy0xtrP0iIYdzSJKpySjvo8ROTKNw3GGFaBtUmQ/VRhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775119589; c=relaxed/simple;
	bh=gczMRuZ2fsGRpoCXUBhl7NeVLE82+ehtyW2OQrB7AVI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X8171g4d8jz7EM7w4GPdYsig71TLIxe1lTKvTBjYVfZg+GGSOEj6ec5Co/SGoHep8lPrxOZvhf2cQ+e2ILfxBlXZOfVgDK6KrTk9mDhNfDBKo6NcY+PRKFUw6BXPr4lZzDi6Ne9FN4t/IEGXDeL5HpzvSZtfYWEdKQ5uEuYQluM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OEbDHRD6; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OEbDHRD6"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-486ff3a0fc1so5316975e9.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 02 Apr 2026 01:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775119587; x=1775724387; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gczMRuZ2fsGRpoCXUBhl7NeVLE82+ehtyW2OQrB7AVI=;
        b=OEbDHRD6zavDlt62Hf8Yeb89S541USknmfSO92ew11z4hAE0xoo7WSiaULW6A+2W+L
         K+GN8pigmWYRi743U/dwWXisPy8xAYnnZ1ioSUnJGZUZC+3FmBAFcUPPYvJrRHGo9lVO
         VFXYdiKP7t2c5+f6CE720xSOaJ4/n051ynipwzOPbDy0snnD7au1z30J+xHsbJwxetxP
         fviyD0eTq1r69XXZyFmLDtcWBh1bCJ50bWjOoJa1wlLQGps8OZG7reCQV5PaWUM421P/
         YAWj/IZGK9quxp1KU/6/0J2COPDHZuZaLGV+gZVQ6bcqu0fvYMj/uVpoCvzBORtG6mA2
         WeTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775119587; x=1775724387;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gczMRuZ2fsGRpoCXUBhl7NeVLE82+ehtyW2OQrB7AVI=;
        b=Dd8fPfSTI+mj5RGYe9A4BgUoF0MPcmNzrWSMSROaIyZaIzeJhhXXw+M7FLRKnr/dFJ
         0bm75zWViDss1UaY65TVrnEApP4Qby6uTZUjQGgPUre+7hI/7sYAV3cIYO57jVX2YxsR
         2cRki5Hwnm9E3vggZIel8cR1zpOKW16dZKnxqaJ4LpsRTzCjN41e7Xct/hxO3aAIkYdU
         /TdxhnWmbIUwRig9egzp1HL4ZkVPkkTgEZDnV0xrzzTNzSsJhDRHeYp16UcpDdAczwnv
         FNX18REwOdVDUJTFHXUKLz6xVmKZMoLxFqGlHzq4gs2dZnXNLKm3WxcWs5Cng32fDIMO
         iD1A==
X-Forwarded-Encrypted: i=1; AJvYcCU94/UGdeU5vorCZJmZZ/u4k/y0trXuoaNQCPJnG5ggOOkyUwcfN5HJjCXfRL7K+jhbgv+Rq7HPvLyyKWRhb5GoDA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyLlnOutH/9sjdv+vQ0Z5LzG16fVclXC2Q+/GV0T9X0ZXuw5tBf
	4wAF+IgGM9MO/iZo8SHVGA+CV0sSI0c352QJCbJOsSax//e01ePJg4hfKCuoQBjkeV8=
X-Gm-Gg: ATEYQzxvKZRKxMrds9ZiIMQx7MPpIlpsjQuNY0JZ/yWussjU68pRLUDpmmWAxOzrWGZ
	6g1SCBylHUdhaUG3DoT8D9Tzc0PrktR0ewwHp7tCH8npPCUFA4XilHQXXLxdVrMVnQ4FBkGPE5l
	cv4bgIyuCpXIaBQesY8XVHnZ5jPqI2jNTbfk52zew+55HK8muHJm9oIKnCO9/KFtRq7FvEq5af/
	hqABgrSQgOwLoa4jCDdOBXxyZZx/G5YgvCJyXLcyXChM/zpUI3W6skxgqtnS+QRva7yGEhwn15m
	55rsIy97DMtEpPkxqhGpRFwXp3x8hw4tWVQcWEVWkzcDMXcbfXSjLGhOmDzCSJVtwr47Evd9abE
	zu+797ggLBO1OOpIY7VVlJ+2P85XiHTFImy1WiaE9TMcDWGQglpnIBVhL91Y8xFbf+aXTt3giul
	QmIiFP6v1fEwK/SyZvzBrDk5u7xypepMA=
X-Received: by 2002:a05:600c:8708:b0:485:3949:e5c6 with SMTP id 5b1f17b1804b1-4888b6d4fdemr41857485e9.3.1775119586975;
        Thu, 02 Apr 2026 01:46:26 -0700 (PDT)
Received: from [10.11.12.108] ([79.115.63.48])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e93cf2dsm161779865e9.11.2026.04.02.01.46.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 01:46:26 -0700 (PDT)
Message-ID: <55953d5d-c4de-46a8-a9e0-8ff952707234@linaro.org>
Date: Thu, 2 Apr 2026 11:46:22 +0300
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: mailbox: google,gs101-mbox: Add
 samsung,exynos850-mbox
To: Alexey Klimov <alexey.klimov@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Sam Protsenko <semen.protsenko@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260402-exynos850-ap2apm-mailbox-v2-0-ca5ffdff99d4@linaro.org>
 <20260402-exynos850-ap2apm-mailbox-v2-1-ca5ffdff99d4@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260402-exynos850-ap2apm-mailbox-v2-1-ca5ffdff99d4@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
