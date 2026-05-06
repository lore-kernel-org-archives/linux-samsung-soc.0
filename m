Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B24A0423A82
	for <linux-samsung-soc@vger.kernel.org>; Wed,  6 May 2026 11:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778068451; cv=none; b=UHihQhlSeZTvMuXZRf/soUkaisHp05y6WTRLFrKFU04WA5K6yvVP/S1hz+Z3IapeYedT8IhYoz42PKtapujR4OeCDgOa6RCMmhTZIJ2IcWOpslR1NhJM1aU+T/Xh35DWntc+G+STTniLeCvAuMn41tRB69E1wU+SR3hnJJJ7B4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778068451; c=relaxed/simple;
	bh=Yyfk8X7hQAsUD9G+4fe4CzUE4boCyIRsCV8/4Z21Gnc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lp6rc/pZjWT/dA+D1VukA+RRX//s9SX6vf+2ybdxTC4MmLbDWTZh07TRlKJwzuOtAt0lk0WlRJ6ROh2OqaHd8ODsFKHo987ygxeNNGwzpiwXg+yaYDnCdE2+lHag/0N/Hr8DbH/I5SsisI3D8D5bjunob1xbuP7EQPKjKBpFH7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vCDhER9Y; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vCDhER9Y"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48374014a77so75041075e9.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 06 May 2026 04:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778068448; x=1778673248; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Yyfk8X7hQAsUD9G+4fe4CzUE4boCyIRsCV8/4Z21Gnc=;
        b=vCDhER9YWn7V6zQ7i4yxR+/yve7kiShNsDKsvail0HAUNIQlnv1sbmYPrwJqaLFnJf
         1ZVBVKjRGLF0EWrG+cqo0SY0ryrxgNiO5LHOaDd49ruBeBnrx46aSwCkXp9JT2z/xaCX
         IOkmKrCNTa0TYW9+w45jQ7cr0EG5YruABlonZx294FwWjg7vpwaIchDBEWBTkJSzMlLX
         aHn4hQnQsqj4w1XxZEmF29ftBoMMPUVQ/niXnhydVPJJFlo2duwyxVKWOS7eo8w55K3A
         fxK9OUci4fSsrFTc7KkfNCFPzAgHudDV+WbKgpfT0OG94SDV2WMK7Wwccz0WNJxioavI
         9DdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778068448; x=1778673248;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yyfk8X7hQAsUD9G+4fe4CzUE4boCyIRsCV8/4Z21Gnc=;
        b=KRulA6qWsL6PcHKjLh3HhQJnm4sXu5x1+J1eXHukEZAx8g9qNgQ4kJCZH9G0y9khtr
         YSUkZo03IVTZoiVnR+OM1XhTqxNbdRCZRPhGhA/ZyDon0gi1wj2AbvCcwf8Abf8TXeKi
         +mrHIHUzGwpJtGYtL3nTBFo4TPKbjTSk5NlAu07yzfSUXPPLSUZe6/pwcQikPDhu122y
         vKvHrCpoS7r10UA+WVTR6xqZzTPEfTEwyOcorCrTiom3Kkg2qRBgZi7CAy0t2j1muyWA
         N+lrdxsifqqzxa73rvD7fCXd8Jhh9PlsxClU7RxoXCM/emW3Tp/oCIaaVQePBDrZjcpD
         rYyQ==
X-Forwarded-Encrypted: i=1; AFNElJ9vnahAhQ+KHgdcoFJL6QInjK/iGHdol+nwL95teSmTwNUAh/s+AuCSMvE6rjzsUzkAn/zcBfxoUY5+nETZYyXvzQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxaXgP2aefq5lZGecZ6g+YYbii7BXwhJiCgEFetUPdmPh8gvYHs
	ylxk80/l6w+b8UXFgOpQ3rBvfhwshxvNZlhCi8PKMsAagjrM5OKmyDVOinCrwGD+nB4=
X-Gm-Gg: AeBDievex4hcuNQv0Rsn/6+AVUGdiio86B4PwNGzmGgrYwPqY0RYRqvWaoqorqM/SSN
	jstUEwmw2JTpwt4uljaUFTuhowlzxdZtdbYp4+ow0Q/SVmp0UGzeotk6d0750j4NGpRqIu5M+R3
	0R4Vj4cQBiYer9R14mrwcXNnEvKkFCsPt0aqwLtAX4a4CfYhzZerd3ZZ54dhMLbMvMPV05jOOj3
	DnO8kHTO/uk5EFjNXiLUWofNVV9w6pRzVuFaalKOteqK4N5HkDEN80joY6gLaQt7srRFxS83X2M
	nJ3DDK1LQ6vDN8dcCz9Yb0GhLzqcXN5d7pYluGbRpeJbyuX2jpkVw3xTF3YN6pLRZFIPT2AiF3J
	TVdNwx9MxzIb5jt0ckcrPjNpD/oHLtCvHYFZijNLNtNQ7AeS401eGP4tsUsLY/y00wCjLVD0ehE
	ibrSz8jrwHgJ4UO/RxWOz6UssSpnsCoQ3rf5I5DDfa4xw=
X-Received: by 2002:a05:600c:8b8b:b0:48a:97b6:7420 with SMTP id 5b1f17b1804b1-48e51f4143fmr55989735e9.24.1778068448039;
        Wed, 06 May 2026 04:54:08 -0700 (PDT)
Received: from [10.11.12.108] ([79.115.63.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e530cf964sm29851845e9.1.2026.05.06.04.54.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 04:54:07 -0700 (PDT)
Message-ID: <c38cec65-e8fe-45d8-98c2-c86c27dfa6c1@linaro.org>
Date: Wed, 6 May 2026 14:54:04 +0300
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: samsung: gs101: Fix missing USI7_USI DIV clock in
 peric0_clk_regs
To: Kuan-Wei Chiu <visitorckw@gmail.com>, peter.griffin@linaro.org,
 krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
 mturquette@baylibre.com, sboyd@kernel.org
Cc: andre.draszik@linaro.org, alim.akhtar@samsung.com,
 semen.protsenko@linaro.org, wllee@google.com, hsuanting@google.com,
 marscheng@google.com, jserv@ccns.ncku.edu.tw, eleanor15x@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 visitorckw@google.com
References: <20260505171457.1960837-1-visitorckw@gmail.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260505171457.1960837-1-visitorckw@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
