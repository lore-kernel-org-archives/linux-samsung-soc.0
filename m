Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A05238C1D
	for <linux-samsung-soc@vger.kernel.org>; Tue, 22 Apr 2025 08:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745308984; cv=none; b=D7xZeB+ioa+oN1sZWQgtjgMxZWFUKsYYnpZ+veiCNvna0W4lndyz1bWLAS/v3cLPsmuJydO2pLWtH0/EIMJ1XwJ6o6bnSBzizJCf+ZiOIeXzWOcdz22k6jpGqy0yAZJS/HEdDeFbD27yMI8U66e6iW38vC6+xHQiST7g770+QHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745308984; c=relaxed/simple;
	bh=OEA9CHqkYBMoeGzaFZ9WJIDikxvYbquOXzaHyeG6RS8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=uIJ+VTWgBMTOZzBitgIGOXBQcKJH3EPTvMpnNBxfOQJMHKvsIHCmvnNjf6faIGA1kfm+46YV9n0m5kPWpSXlYb4ali0hAgzhrmI1/O7YBAheudR4P+cddpaTcT3EXdJFlA8VdDgdCrZShEmejGLpIbUCWve+aVDhKUAyOx8U4B0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OlSS6s7p; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OlSS6s7p"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5e8484bb895so1448397a12.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 22 Apr 2025 01:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745308981; x=1745913781; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tm6ce7FCfnEHxhlUwpit5ul9aj6xgc9Jgba3jLGI3iA=;
        b=OlSS6s7pHWtyPb+t5aDqxT99ufcU3W9ftOc1pgMvQ59+nRIbrSMAqSe5YxK76VvzVU
         Zum/nKYIqZZvB1EI/nxNfgIL0PIBGOuxdD/kL3dCB1grXjiIX1ijpPqjgbyZvDMyltG5
         udkd92gC4AzCQRvkc0W/GCsTB4Q7wPInwFIa5H1lJep91RoO5R3PKICTx7ShcDOPqBRg
         729PbiU6F8KcJR1Zww3SFy7Osn7RdoFWgWSMiTukvI7MaWLMUbBkZw1f3bg889b0D9VH
         j8UITJiw99tQeGD6zDtrTOYMEjljqZTonnuNXSMuSwL+j/R5RxfrMG5Le7T/ZroJzQRH
         vvUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745308981; x=1745913781;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tm6ce7FCfnEHxhlUwpit5ul9aj6xgc9Jgba3jLGI3iA=;
        b=hGaeOjItO6jwgxhQd7Gf0hXXkWFHrf5o6YMPn8GjBdfIPAPh9MYg6PTsLWjmumADec
         sPIT3ZWSMslFSVaXnFdaJnInknDlxDEbH4d5zfrNJP/nm2JC3sbsuxFrT74yxhSLNhu6
         p+OqlkS2SHiuwYOKgobvSzthYyIalWUDN7Cgp9KVCKv6SuvBHiC6Zwxyx1EUJs9m8jjI
         AJY0sK1/iZKH9GwOt85WHgBeWzolL6JTuQEC17bSXWDxmJH3JdOaG/eHEdg7lQMYJ9p4
         Aod+WvYK/Kj7J5BJp/EMPcp2++khYWMEuKT51NavtkFzkIXeeuBhVdb2+2j4wVmPUnfz
         210Q==
X-Forwarded-Encrypted: i=1; AJvYcCV8lWkDmJpEOpIXdM27HueGl2joZ50vfxAWd6nc8l8PAAUvisZmsCwzyRD/FVeJHpMy/1xQL1+hc7OU+sFfbMc1Og==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOCm6bCw//+yiG1+sNHIk/bMojWFQnR7sMLtz/H11wOo5vgw6Q
	uzW93vUAFxb2azxvM6zUlnOQv9KYj8IRYCD2ywC8MRUyhDy0jYuSrf8//0MYAm4=
X-Gm-Gg: ASbGncsbST7Q4STDJt0M28EsFrDPFcXjzVsF79m5cWWn+zbhaIvvjSLgAMQUaKJs/VZ
	i+Yb2an+qOW3VQH6oENwtPBPxegsARq9y37C5VymdD/ZAYWb69Kc20WubcQqidP/LlPa1G1u7sy
	L7hELKn8epEaPvHK4Bb2ZLwGRSr0THApFEUKe6hPhdXoKWKVMbnkMN2ed0L2jMWCUNJH/yK6S4O
	9wtcpcQM7L75QNlVWKjl2a3nIXFT6AoXtqS0s2lUxY2LLvRUHEiqlM/qiiX+VB2hh8dIEAOvc0q
	aHvkEWy+NaWZbIXK3BY26yCHUCAYL1pdjh41yq/xTd4v31SwvzPQSvcW5Wc=
X-Google-Smtp-Source: AGHT+IEj9zYGHMUVy+ByRdrUePKsN+UNEN7rQuSwVrU8g1hXbVY98bZH5MP1B4l378YIYlw97Pfaow==
X-Received: by 2002:a05:6402:524d:b0:5e0:36fa:ac1e with SMTP id 4fb4d7f45d1cf-5f6285e560cmr4530395a12.6.1745308981069;
        Tue, 22 Apr 2025 01:03:01 -0700 (PDT)
Received: from [192.168.70.232] ([88.154.3.194])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f625593409sm5532352a12.37.2025.04.22.01.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 01:03:00 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20250319-acpm-fixes-v2-0-ac2c1bcf322b@linaro.org>
References: <20250319-acpm-fixes-v2-0-ac2c1bcf322b@linaro.org>
Subject: Re: [PATCH v2 0/2] firmware: exynos-acpm: read fix & reduce log
 verbosity
Message-Id: <174530897813.9276.2456248075934997064.b4-ty@linaro.org>
Date: Tue, 22 Apr 2025 10:02:58 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2


On Wed, 19 Mar 2025 05:38:22 +0000, André Draszik wrote:
> While trying to use the ACPM driver, I stubmbled across two issues:
> 
>     * acpm_pmic_bulk_read() doesn't return the correct register values
>     * superfluous log messages during boot
> 
> The patches attached are the result and hopefully self-explanatory.
> 
> [...]

Applied, thanks!

[1/2] firmware: exynos-acpm: fix reading longer results
      https://git.kernel.org/krzk/linux/c/67af3cd813695fd3e6432b0849c453250c4685aa
[2/2] firmware: exynos-acpm: silence EPROBE_DEFER error on boot
      https://git.kernel.org/krzk/linux/c/53734383a73888e6d765aa07f4523802fdf1ee10

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

