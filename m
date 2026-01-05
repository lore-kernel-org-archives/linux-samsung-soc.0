Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C731D6AA
	for <linux-samsung-soc@vger.kernel.org>; Mon,  5 Jan 2026 15:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767625349; cv=none; b=usxo0MNJpLI4wIelHS446SU6mwwSBRR6PaIuk6XqdLHkSniNflnBB5+M9iZIbjNqmRerB0ZkK4Yu3lIOhmR5AR/+K9ziR9nhNg3UOArGPIGsJK9R2rl0xgjN7+jeFh0WGts8yxSLI8GJDysUiUBGBRxpHvAy+Fn4bYAqNMV5h8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767625349; c=relaxed/simple;
	bh=hXM5D20oQxki71exwmG9Z5fOtPb37LNXSBDUTU4L/Ak=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OrrS/h4d/ssTR8cL5neZX9MoxRFT6D0YnQ/Qe6bJfhwobplFX4F1nZGcEq/AmSmwfbtL6kUMre3Wni8J52Dh6y05YQHRSIIvtvlzhjU7ZkpfVwlf3tVJ0Aw3uUkWVYFCrGMLUxHm//5Oyd5eZ8+nelS+5FKpR262zeHagD/nZmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=esJWfGD5; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="esJWfGD5"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-64b4b35c812so20032902a12.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 05 Jan 2026 07:02:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767625346; x=1768230146; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eKLhOm1EGO7KiVaRio9S3BSdKkAkAUK/rEpRWJAD0/Y=;
        b=esJWfGD5nNDpLD5BXJgASigPf5wvgtUMTVW/tF+vOi3opoV5HF6ID6H/Il6JCIcH+O
         SvB1l66asIsHdlHPtKFum0x7qVjryWHo3XyX49l6U0fXXnKnhpMV3HRDlmDNJGUBhfhG
         TAE44mPmr8hR3r8GR91lCKTGifeOLxgPyM53W0S5FnZ0vsxelIIQoyjvC57kBUneq+Lx
         fFFwjleH2omRQ09kLw9sB4j1kyhHBpRGDgtjK0GSMgdxKqeOnATZQcXzheYLNdw5UW7/
         6JnAmbHohtZh40xzVFBeWu4JKTWlP9I5cReJn55dw7bYv/ftzhIsZi+C1oW+W5eY17aY
         9cBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767625346; x=1768230146;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eKLhOm1EGO7KiVaRio9S3BSdKkAkAUK/rEpRWJAD0/Y=;
        b=wqMjwv40G+eXdga869zsXtLkLf9h68KogGWiYfai0ErUoy0xXZQFYwnUIJ7OF38VYr
         pNhJb6lJimz5gdZ21IPQ2s4x1CYDodNdZW1GAULhPdWE/rHF/TOfGtYXsnviuDGbMXeA
         DubAQdnQF3TlUuXN9M6TdX4Sg9MlQYkB3PkV7xgWm7fSMQc3o7F/pFao4Nuf5mjHLDvg
         gxIbeIUnuL0k2RvYiQ6W3VkaTFX32ogtIumUj7Cqb2lyHC/whge/RvpapB40Pl6cXoYF
         eoTRwnGXcX+St3tqrjdKm8fHN3GaDssBYhNQNOmXafR+slZTIVG/rhsyWtXa85G0Ntfx
         tHwg==
X-Forwarded-Encrypted: i=1; AJvYcCW5P35nSk6XCZyyObYVtomUVxWc+BZaYi/7OZpWv1KxNFrVQo6ul+x1jWdPhxcpBH0aUER+Nalqbna5JOaykYGJXg==@vger.kernel.org
X-Gm-Message-State: AOJu0YytdPq91jrBi/uv0dHahlGieGq+xeu9XhWBtsnrk4/bYRdLd6qk
	jPO5xz4t3Pa5UVv6JWUPU4DHUNLtZAPhYnG7UmsmAmwRhKlnnC7xkOJSxadRQZDqG/E=
X-Gm-Gg: AY/fxX46NLWuYyhJBCvv7WcSNuS7iN7ex6Xsz0VyKNarS0c0y1Y9M5lb2uq5lRqWF7W
	pVZMcyb7wceC+1bvLHvoRrgwaHqxMZcx3YeOa/2r9NUGcfIOOlRPE64+N10AGSjS3Bmc9vWZYer
	4rKKmesKK5qCqQkJvMvbT3Eo9vSfYlBrHZk4V3zS5s0Hld0qLsRXcqhTMWPVk2MArk9FKH5dtL+
	391rkjVAAMkfVQPMCQZMnQv6ACOUQme7xVxwgtUUSOxbmp1LI/kGdxdpZS+cJ1d0SFf71lv0SOg
	WtNVzFCWKNH9/hzQSaDQx6WMYxsPxN6kbjPLeM2YTUdys6Uedjyl5NNv0ILqGh9uDwv5wXaHY5Q
	iOGutQiWx5IjOOCy9awsF8oJa3sNx/o9kjzZMjJddIsSpttvEJneFGF9P32A+FwrnVUq1p3eXIM
	mcoDU+S/MjHlREik7lAg==
X-Google-Smtp-Source: AGHT+IEAWpC59x+QqXtzAbU3aYnA9kRQspD4kCFsoe72YD/sq6zSK5+EWzvZxjFYxJjc+vRGaIzw+w==
X-Received: by 2002:a05:6402:210e:b0:64d:1a1:9de4 with SMTP id 4fb4d7f45d1cf-64d01a1a027mr46987198a12.16.1767625344267;
        Mon, 05 Jan 2026 07:02:24 -0800 (PST)
Received: from [10.11.12.107] ([86.127.43.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65075c1b6f7sm23205a12.11.2026.01.05.07.02.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jan 2026 07:02:24 -0800 (PST)
Message-ID: <f8b935cf-9211-4c21-9d52-5afe92d6e955@linaro.org>
Date: Mon, 5 Jan 2026 17:02:22 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mailbox: exynos: drop unneeded runtime pointer (pclk)
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Jassi Brar <jassisinghbrar@gmail.com>, Krzysztof Kozlowski
 <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>,
 Will McVicker <willmcvicker@google.com>, Juan Yescas <jyescas@google.com>,
 kernel-team@android.com, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260105-mailbox-acpm-pclk-ptr-v1-1-8474de8c4584@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260105-mailbox-acpm-pclk-ptr-v1-1-8474de8c4584@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 1/5/26 2:34 PM, André Draszik wrote:
> pclk is not needed past probe(), just drop it. This saves a little bit
> of runtime memory.
> 
> Signed-off-by: André Draszik <andre.draszik@linaro.org>
> ---
>  drivers/mailbox/exynos-mailbox.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)


Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
