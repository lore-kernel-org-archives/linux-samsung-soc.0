Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6918676C87
	for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Jan 2024 17:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706550407; cv=none; b=oIRkr0hlMVcxzDFTCrEnx2I9sURbXRupUXMldIyIA265TUumLzIMjj2I4GTju44mcfPImfyOxLvvRaw8cgluJqAn8pf5aAhP7Ckegv+/Pqb10lq11W4Qat60AacddJkl67gCj99pCZqiMMH5fofaWy22Bsl8CPzxn6cM7eqZhJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706550407; c=relaxed/simple;
	bh=vV6AH3YtSu3SS+W/E8VEkUhNHcf73by0FdjpTGcjHC0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZEZqwX/3htQdT832TKGt5S4BHaeQNETaXZ6mdKSIl2k3eW/FynHeGQ9rzb91Y4NaxZiK/xYY70bkMx9ujlJfSJZ28Ov0bPh7+o2KmzsRZpw9GxuOrchuio07kGxeKPofTU0KvoUZUP/UQKtRfyhkHDXDFmlAZpuluZ7O58hXx34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z8K2GGoo; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z8K2GGoo"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-55a8fd60af0so3023676a12.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Jan 2024 09:46:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706550404; x=1707155204; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vV6AH3YtSu3SS+W/E8VEkUhNHcf73by0FdjpTGcjHC0=;
        b=Z8K2GGooR4enSqufn2rR2lGDaogy/6IqtABiJIN/dd85MJcsVM5PQOucvznTmcPkgC
         hI4CKeilq9mv5/II5mph5yCgCq3cUyTumpdwFUwX8hQU79oA6Dq/09uO3UodjeGUGBbn
         YLygRm+GYPXEx+rvX17ZHW/6BO+7ck7bMx5dU7hOH+4z7JN9ZtffjLImdCBCp+QZjI4d
         EUGfCFOy5gOY5WlO7ccbRvEz2Gv5H88y/DhepSFfOj/6vAb6hbY/UmY8xr3z6Q/OiJa/
         XrE+VhL+6L267bLby/BwEQNirN6pxOtU8RnjnIzIAJjcRlWzEenfvusgGAMIYXCQLBwq
         iTSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706550404; x=1707155204;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vV6AH3YtSu3SS+W/E8VEkUhNHcf73by0FdjpTGcjHC0=;
        b=BRxzHw+fz7/O7r4qowgZc+9AnF5EWq+x1Y40rcajvQ+MmSnSLNFP/cV4XWlXdhyz9W
         47nmNw3uh7SyYZ6nnG9ZV3zyHw79+O9c9VHrj/hQBQFtJMhHX1BSMI9mTlmUmMhNylCO
         hIam5NkZPfWKdHSyKFYi1OS/kWECTcccJnX3QxKck9vRtpvjCXi9RUy0xZVIivvpYaQv
         t9e1sJSVNSIwQGQhOL9ubFO/saA+wLvsV7Wl0v/YxRWfF4cWeVNtunm+j3xzY+V1miPO
         NDyytDH6QGdrfd8anKb8gbmT1yQBJCZLMlkNeyawat6OhZk+0ghAOLOT/6P8eJ5gCrXS
         7a2Q==
X-Gm-Message-State: AOJu0Yzv9dzNpaLSpDCcEdSwqF0bGNO4EIKMN7tDNV4Bo8v7uUDfRpf8
	5fg4c9DDrysTuXlSJg3HWwiDGNEOtZpFnhnlVMWFFj7jRL1GRkDW+2h6EH7TmFUwTmNVghNVZOF
	s
X-Google-Smtp-Source: AGHT+IFqKB6Afd8ptGOeQ1QAT1e1DmbB0LTR7hNkH3waGYNb+bZ3bz0noe/Y9mqDg1A1YIeGo4RQmg==
X-Received: by 2002:a17:906:33d2:b0:a2d:bc90:de6b with SMTP id w18-20020a17090633d200b00a2dbc90de6bmr4726997eja.30.1706550403711;
        Mon, 29 Jan 2024 09:46:43 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id vo2-20020a170907a80200b00a352c0bb7basm3288323ejc.81.2024.01.29.09.46.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jan 2024 09:46:43 -0800 (PST)
Message-ID: <99b7501d-6780-4227-8558-488b1b9da758@linaro.org>
Date: Mon, 29 Jan 2024 17:46:41 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] clk: samsung: exynos850: Propagate SPI IPCLK rate
 change
Content-Language: en-US
To: Sam Protsenko <semen.protsenko@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Tomasz Figa <tomasz.figa@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20240125013858.3986-1-semen.protsenko@linaro.org>
 <20240125013858.3986-2-semen.protsenko@linaro.org>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20240125013858.3986-2-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Sam,

On 1/25/24 01:38, Sam Protsenko wrote:
> Which should cover all possible applications of SPI bus. Of course,
> setting SPI frequency to values as low as 500 kHz will also affect the
> common bus dividers (dout_apm_bus or dout_peri_ip), which in turn
> effectively lowers the rates for all leaf bus clocks derived from those
> dividers, like HSI2C and I3C clocks. But at least it gives the board
> designer a choice, whether to keep all clocks (SPI/HSI2C/I3C) at high
> frequencies, or make all those clocks have lower frequencies. Not
> propagating the rate change to those common dividers would limit this
> choice to "only high frequencies are allowed for SPI/HSI2C/I3C" option,
> making the common dividers useless. This decision follows the "Worse is
> better" approach, relying on the users/engineers to know the system
> internals when working with such low-level features, instead of trying
> to account for all possible use-cases.

Depending on clock frequencies in DT and on the order of probe, one may
end up with SPI changing the frequency for I3C for example, there's no
protection on that. The more conservative approach, to which I lean, is
to propagate the clock just to the first divider, which is dedicated to
the end note, thus you'll avoid such problems. I think this fine tuning
that you allow is more suitable for downstream. Maybe this is more of a
personal preference, I don't know. Curious what others think.

The patch is looking fine though, and if the approach is considered
acceptable:
Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
