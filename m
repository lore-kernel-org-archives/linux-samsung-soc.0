Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6BF63C1960
	for <linux-samsung-soc@vger.kernel.org>; Thu,  2 Apr 2026 08:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775119552; cv=none; b=fuXZ0VjULtbHxdZIcDtjoK+HQ4+nI2p46hfa/8un+uVG7OH9yB8jhIQbIsidL4oXVjl4u4W2ZMVqKfBFJxck1zKxTdf2mMXXRohb5bYF4dP/WP8OwQ7pXj84uaSGWp6UDITQ5fGfxW58A/JzrOsNd7fsSybevFC9qeKg2/bphJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775119552; c=relaxed/simple;
	bh=elSSYXaQiu0A5lBgM08eBjafoWyayI5FV2gno1nTSlQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FQtvehWQbIjZBhugpbrWM32S71k4r708+gfXCnVtQOtJlnr4Lx46gUM74gs3k1BDuNT3lK/5k3q1xpH/ZRCVP7R0eDisDqJJKsfSJ2TSWuTSt5pDAgN8JP4T4ehzBKDQHXN/MK0/7XeSTEL6qjZPR6Cyl3fYfih5BA2/ml5Wtgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Nvt1mO6G; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Nvt1mO6G"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488895ad947so6618455e9.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 02 Apr 2026 01:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775119549; x=1775724349; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=elSSYXaQiu0A5lBgM08eBjafoWyayI5FV2gno1nTSlQ=;
        b=Nvt1mO6Gxb9wjMZnbfGWU6KOes2J/I/XtdiBqLj7t0X5GJQXaVEkleuzMUSy88+zP1
         VK2kqPgMZaYr8QlQCiirHTO4oE6RypoILnxsfvYYioAzAihhXi8Y/SU4OvQmTXHSxZps
         LDIAFwZJA+Yhc9Okkv7Go7H3gntU2evSOLqKjwV6fK5SnNXwU/61gA0oaSMmAGLcefri
         uSzQvJxZeY3m8nHfWlZPjH8MnSzjfGLaKX3rZgenjZQ83dDuC92aXOoD10plQMyMmY7z
         GrplZyxr73khsbQikK73rp/Pa/qSG1N6qNqpWmh+JcWOqFVMoyUpite5yDuWAOtw7c2L
         UTSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775119549; x=1775724349;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=elSSYXaQiu0A5lBgM08eBjafoWyayI5FV2gno1nTSlQ=;
        b=L9svC4kDZJXB7tW/idoKFMoLhGkmfurEJ6CFHHVu0Qr0Dwh1LluuMZN5ZyNWi2TyRc
         aTOVP8f2uc+UvY+gzXRstxDrzEEOl6QLvxFz91ReUxS9+TRA+X7bazPRJceEM6YCXyx0
         YU32+f62Qq8EaH++XRFyeDn1HS7sT3iwgiBAv+V9MtEdft+dVRKxm0bbV48utuWAz820
         FHwbT1BrLQyRnnn9FgtW2DfCGc2460OcZ0K46AP+7dhpaq5gHgSnCDCo65mJ9sQh/6E0
         VeILGU11KA/3fJrkRWzhnqLltlTWhrTraGcwEU0PxDjjWmFGL2CkjCsgrQ301oJrnqfQ
         c0NA==
X-Forwarded-Encrypted: i=1; AJvYcCUpmV1F4hbSjbw7x0g2OPfMPIdX8e4CRS3tFIC6MzX7v95QS2F3+7QgcFLs1N4plJymumypTsjEUwZsG7H8GIGCDw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzrtSzPUaTy72zED6pTZElaRnGPCkYyKxL7DIdPD7ZiPAPp34Qj
	ZxmEbHhW1kkfDEyWszLiin3myYcxdYPn5QW3VERbScI5keA5uA1/1zRz/tqXy1zpQ48=
X-Gm-Gg: ATEYQzyckjCuDwGSlmxnC26YOeRCZ/UFyuJFz+TD5u73jgW7VAlZ+rjLw8GSrn9zLI4
	dEaG5QlCrrxyanZ2G02gTe938SJou35bNDYNXtoc8NWRX5koy7jeZ8qvZ2PRizNbAzmOQmCIL8A
	09hCnza9EMpWcD88sKM2YxATfP6ucHdjh7XQMvIXG08jO2c7bkGQMxe3skSuPd5OTYLJcGl4FNj
	v3d50rS4CNgZlakxoJLW5imsHo/U1yYgRTUHqFeaIBMgDwj4+I//2SCPdpI6xB0o8fxfVFhMyiR
	ijctpWAuolNkq+eREMPMM/E3TQoJuGgziBqHKNtPLYDHfiqQRfWahlFHcYcb3FPaXorBYLj2t1d
	ARHdUj0ujSBnTRzsGsrl8nBBDLnOvRp9FwaRCLfK+f9Y1r9G2Lg2VxM1vWqTQvDe6K27yWAedpZ
	cATYAMZ9CPjHIfPFx5DR2ezHzENbx7uco=
X-Received: by 2002:a05:600c:8903:b0:485:4533:9c47 with SMTP id 5b1f17b1804b1-48883595155mr86661735e9.22.1775119549263;
        Thu, 02 Apr 2026 01:45:49 -0700 (PDT)
Received: from [10.11.12.108] ([79.115.63.48])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4888a63c963sm55395375e9.4.2026.04.02.01.45.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 01:45:49 -0700 (PDT)
Message-ID: <d9c714fa-988c-4b0d-b756-c6e7a40da587@linaro.org>
Date: Thu, 2 Apr 2026 11:45:42 +0300
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] Exynos850 APM-to-AP mailbox support
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
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260402-exynos850-ap2apm-mailbox-v2-0-ca5ffdff99d4@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi!

On 4/2/26 5:20 AM, Alexey Klimov wrote:
> This patch series introduces support for the APM-to-AP mailbox on the

If AP initiates the communication and APM responds, shouldn't this be called
AP-to-APM mailbox?

Cheers,
ta
