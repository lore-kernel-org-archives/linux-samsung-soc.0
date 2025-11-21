Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 648112FF673
	for <linux-samsung-soc@vger.kernel.org>; Fri, 21 Nov 2025 14:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763735867; cv=none; b=XGUh8HU8l/2MDTAhi71/zQODPrqDJ4hW7zYj3o1HevG6+0iELrCDXA/HGsxyC71XADEToBH2I4W76YLnm7BE2OeNkt+7cnOvdI9x9Y+LjSxm7hB9wK4IFFrTDy7DaxJtStzr1GwHqqV8FSKuC+G+2WwiaOsYYldR+boklWQRHKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763735867; c=relaxed/simple;
	bh=0mZQY/uQXJ36BbaHR+QAr7ab4swYKuFR9rDpdYSph9o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fDn81/99Ix6/0cluTR7zAozIw7nVWHR73pK8jw9PpwuPQC6uxR39Wggrer6f2QL7etLiBy2PWe5am4gEg5zUFx6Ymu59wMe4FkDHrtUmNw9Rp0YfHl1V7Tz3G99SXgQCat1cksht3Ju4dvCdEV1OfwJ50EMvHn4jfl1LnxjeLU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MnYY5ovm; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MnYY5ovm"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-477bf34f5f5so7402725e9.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 21 Nov 2025 06:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763735863; x=1764340663; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sSqjmw47egF/N94mEdR3iEsMh8hAGTJSLEFFawVJke0=;
        b=MnYY5ovmWVmtpoO9ACqFSvT1oqMx6goIWNWEHHkHB7hGFx9atCSX4HK7fOs7UKnCvH
         DA5ApYF5mUlZnWmdiUIcjwmY0mFBZXAmRgjRdISEKgv7uQu0JAaR+zijZLIHRastCEaC
         RCpYyRD7iWzHP8CpuSeoh4K+X/qajNrOBfkH8a0oRf3/Wg+XNnok4lbPyhB7LRaYl5NS
         yf1d5ZvxthoBS0cqmrYRA4eW/3XoT1CavO5RaUDFSCWVxS/fWKsdvqYmG3GI4nxGgSzn
         R8aTLHnV+QO5M5imTACt3Tv62hhly8Hx2LE2s74lekreFbNDhfMe/5KlP1s+T+r0tSco
         pU1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763735863; x=1764340663;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sSqjmw47egF/N94mEdR3iEsMh8hAGTJSLEFFawVJke0=;
        b=jH5uwsS1JhgjjIsMKFO132qmZg0NiN3K0uzZpVZb/iNlDBZcxDXQvmNiLQhlAwYtTr
         oME1hQdWPKCob+GfbYCnLInnyj8hsJ2zNqWjs/Hgf+laJE2QE1Sr5gb+eWW82mQ8k4mg
         diV66TdO5e1Cy2yiDHPwkVgBMuTna7RQhNJMrpNb4UGRhcOlyOmL9BgAhaCzqqTQosV7
         P1bGL1xiWfndlOU6fbDjXzJzegMRd2+62DwCNK4sO4yoe71ub/qOCkNM9pIQpGu5OlOy
         yzxtpofTRMJxb1+UbJ4iQ0FDYGiNWCe0cXPZZ/koF4iscklA7jdhPqctKuBkpsMnGZDy
         CwJA==
X-Forwarded-Encrypted: i=1; AJvYcCVwibHrDrA1S2txLvhKC8xrjwqyghozd4+3q2bw9NN3nU7Jo4vASMVIqpdu9rZx568n23y42nuyTrN1p1tRTmjP2g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyX6rKvC+lTxzzgmTWIDC+sK30QoVqPIGpoqWT69/SojntZVYnh
	IENMOoHmYcCU8XslC69bm4qZ2dLbAbl5ilUl3paO+5CZrThd5AT/4FMOX3Zan4eik4c=
X-Gm-Gg: ASbGncsgUyIYHNm+TLE9DqOGa4I6QlEahtbsLt8TIQF/iHqgj1VsylildWhq4Jq+Tns
	NKGXpDopakSDx8AVJHSF0QLbIEPiuN/ZDLjB0ne4VYDco1mh2SfKURq5QaB5KfUH0jGfTApAuQ+
	fbbpMUECIcV0TCfojIxDmET/kNjtLj34J43bw5lH9n9m/LeceSEN3jQwseeKq4aD0oSizxIEEbS
	mspJ1QiqD8nTpsMcS4+h6NIs87vXgGa5Vq6M7Y9NnrYK7GQGV4hcja1hBIDThVMbB9Ou//kClE7
	3iU9F1KUkdOL5adEComrrqxP09UpXa7+KbfV+y3Ph7nvxaiO8kdnGziTFkqK7OJ9H93/n0FxrNV
	sShy/Tl7CxPP45/XqyxPpC3poP1enMdHWCvHRtaSZ8Gr3VmxIfN9FMSdvX/X/wM7LfZn5IQyNk1
	h8G57uQJUPfj7klZwJpWPbR2mpqY5RVLr/EJo+7Opc+jRdJ9jihrDZ9DZuntnA5zgYNBcYsTeb8
	nYV
X-Google-Smtp-Source: AGHT+IFD1wPtEuNTYpQ8xE6F8oI1MRv/OML7G8ADOWBdJfI5P969OqsJ7Zy8eXH/iFI9OqcudodJig==
X-Received: by 2002:a05:600c:190c:b0:477:5c58:3d42 with SMTP id 5b1f17b1804b1-477c017d879mr28676045e9.10.1763735863512;
        Fri, 21 Nov 2025 06:37:43 -0800 (PST)
Received: from ?IPV6:2a05:6e02:1041:c10:37e6:ed62:3c8b:2621? ([2a05:6e02:1041:c10:37e6:ed62:3c8b:2621])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-477bf22dfcesm46879155e9.13.2025.11.21.06.37.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Nov 2025 06:37:42 -0800 (PST)
Message-ID: <79cb0a99-1431-4a3e-9ec2-f70b4154b41f@linaro.org>
Date: Fri, 21 Nov 2025 15:37:41 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/6] ARM: make register_current_timer_delay()
 accessible after init
To: Will McVicker <willmcvicker@google.com>,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Donghoon Yu <hoony.yu@samsung.com>, Hosung Kim <hosung0.kim@samsung.com>,
 Rob Herring <robh@kernel.org>, John Stultz <jstultz@google.com>,
 Youngmin Nam <youngmin.nam@samsung.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-samsung-soc@vger.kernel.org, kernel-team@android.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251120184242.1625820-1-willmcvicker@google.com>
 <20251120184242.1625820-2-willmcvicker@google.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20251120184242.1625820-2-willmcvicker@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/20/25 19:42, Will McVicker wrote:
> The function register_current_timer_delay() is called from the
> exynos_mct clocksource driver at probe time. In the event that the
> exynos_mct driver is probed deferred or the platform manually unbinds
> and rebinds the driver we need this function available. So drop the
> __init tag.

Is this change supposed to fix an existing bug or is it a guess it could 
happen ? If the latter, I prefer to not pick this patch until is proven 
it fixes an observed issue.



-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
