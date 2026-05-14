Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 390C041C2FE
	for <linux-samsung-soc@vger.kernel.org>; Thu, 14 May 2026 14:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778770024; cv=none; b=Q7sgZb8vZnMEx+xHs20HmcVbjd2k8U9xZplHE+lbb9GNNvHe55FoAs1BwlDYImVTdtQbjNu8hGiL7aD3JgFcG6429VBszc5GBWi9tqPL0CYPVL/lzp04FGx7yH2KT+xyIJp8QzPYTquTqEj55+Q8jy/yH1MD/Ic7DIoREEIYCiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778770024; c=relaxed/simple;
	bh=XBgsJzzh1Igu9BQ6ze8gVJXAK3iTc1uKe+SPXuPW3Mw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oLK4v8oNBS1YTeO/uQKL/JFUIADYm8CG/3d9CeW1FpgiFOyQJvegXV1TVrbM4W3isfhLiPQMgabDz6cPDxi+tbHWDzMvw7t8b+jeewBNX+WQI9X8qZHhEzI7SChTnep0gLiwSQL8p6xfotSyPeXD5Fr/Ji+3KbPyYYl4eaQ7i8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r9aXNEzT; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r9aXNEzT"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48a7fe4f40bso92109715e9.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 14 May 2026 07:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778770022; x=1779374822; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XBgsJzzh1Igu9BQ6ze8gVJXAK3iTc1uKe+SPXuPW3Mw=;
        b=r9aXNEzTrD1KcseQDKeYOVQhoeAT4pGIUwJduzays8C8A0opR71zGhTOsRvtPWJ6/x
         Q4p9Yjq2JaMmoz5gKDz6TIacZVKE/ySABBkXqV945TQ8OYwFYOQQHr8JkZj0Zt9Gb68U
         wXj8QwZDlt6vr1xPFNixvd5Wlwenf8NCF6jRZMwyfSPpaVV8ayXwz9SDUYkIK2q6mMRW
         MBfntvywir6CSs1nVai4VZIfxpyKoRqhM5HsmJ7g7/0FrTnlpLomos+l0KKnMoyBLjuX
         oTM05JBeEkYYMAgGmuOopKo/GeqOV/vVMSrE3udq9f5FEYhiAHBB5ARzvIb/RE5sJjoe
         lzSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778770022; x=1779374822;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XBgsJzzh1Igu9BQ6ze8gVJXAK3iTc1uKe+SPXuPW3Mw=;
        b=CEhpm8bahVy31BIwk4KGWSOS6ttFnGrJ1EQFEOsxfoyfPtag2JS7q2rehJm08uvgN6
         NcqBmK+eJAEFL4CTj8XsIIIsSweZwm3yo/uRItHtTjpUKlzbIhy6WRp6898lquZjuTZ7
         t5sIJrl3BKmYfaEboamDu2SL8geAHEgvlzFAvoyhQ8bDXTSWifRZvM6glyi+yGuLU6Sr
         v5r8GrULj3YIKVdfW2w3oNme69Qw+kCjF3ABiR4fuIpQDjSE5BprYv+f702RsH20hFd6
         pklBxshditCKXnrjABgRA624ou82IYQXc02hbGUtIa6uJidTxeBKeuE8Ix9aibcKMMEB
         tVFg==
X-Forwarded-Encrypted: i=1; AFNElJ9RA7Hxs6MiWzM57A2axyCNIxby8Ra2GiL1nuAsAEDltDK3E1oXyMtorM+RdTtoYLAdB/e2IaWBvfrH5NS0Izic9g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9uWazUHNoZF5YL4ZaKyWxRsTHI/mnrODptO0WY1tN2/+QAkQl
	UEDSknya+jk7MgdlH0lM7plrNjJNBswz/ro6ajO5roXYi7NXBTdxFuM7xekYoSbzaANZUOcwN6U
	KJlKTDuc=
X-Gm-Gg: Acq92OGxfOdHbk9L3OYtG5LrtrXUmihUPkQdhCYLhv4TE0e91AOCiQJeC+7l8vhU8ZE
	Ciyrn19uNTnkoFqW0aUhZDAcey5FCdkED5DGHrq3oAVWpyyRKCuoMJr2fKCQF7yalBXzzHTQsfB
	y7eWzRY2qm8Bqvaz4yljR09gdgU6xFSmPa1BLjnxlBZ+PZ/P4+owWibtLp/WGJsUOxeYpX7jPYq
	NY0GFvXNFlOWBR9khn0a8Taeqxl2WlP1d33SOheFh+pwkwNlhtqjTz8nTVYHtuEkgNsTS5S4lzg
	M1mR41QPZjojgMQD+k0NiR1LHESu00jhrJ7O/YQ4pxNrzqB2X5UyRQGjzn7mrihjO3xGgt+yLRp
	YOwwU2KXxttZdYBsKYw7+hbu9j3LmmapANW6up71dG/WeKqr6IgGEbj3lOfhw7jpx6gtjfGOI6L
	3N1MfgoCcU38CnFnW+qcsUW9yPt442s7Dt
X-Received: by 2002:a05:600c:a02:b0:486:fba7:b150 with SMTP id 5b1f17b1804b1-48fce9d9271mr113000745e9.15.1778770021624;
        Thu, 14 May 2026 07:47:01 -0700 (PDT)
Received: from [10.11.12.109] ([79.115.63.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe464e92dsm2595315e9.1.2026.05.14.07.47.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2026 07:47:01 -0700 (PDT)
Message-ID: <e91496f2-3b7a-4982-992a-91e8326367be@linaro.org>
Date: Thu, 14 May 2026 17:46:58 +0300
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: firmware: google,gs101-acpm-ipc:
 document Exynos850 compatible
To: Alexey Klimov <alexey.klimov@linaro.org>,
 Sam Protsenko <semen.protsenko@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260513-exynos850-acpm-firmware-support-v1-0-3858d097e433@linaro.org>
 <20260513-exynos850-acpm-firmware-support-v1-1-3858d097e433@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260513-exynos850-acpm-firmware-support-v1-1-3858d097e433@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Alexey,

Please check sashiko's review from:
https://sashiko.dev/#/patchset/20260513-exynos850-acpm-firmware-support-v1-0-3858d097e433%40linaro.org

does the gs101 pmic constraints apply to e850?

Cheers,
ta
