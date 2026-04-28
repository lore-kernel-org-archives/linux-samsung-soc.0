Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CF2F1DFDE
	for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Apr 2026 13:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777381462; cv=none; b=qUxJObkrxdgFafdH2h+VDB7qzQ0o+h2FIUnaNQwyUeU9e8Hh8MrnfN/Pkd+s3Gf4HyRmUB2vw2YCyrlZNoBdudndYFda/E0koDWUAaU6nOLbPAcgsIcTvLuvebz+sn4lN9RvnCjsu9EFlp7AvneOPm9JP2TS1kHUg841jHHEVCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777381462; c=relaxed/simple;
	bh=yvfWbNsf7kvzImbLhP8AA1uE2RBdkUT+264nPwInwps=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s+XIJXXVVX8dFKEcyhylCb0eyk9LHe2qWiziulKxhQm9Z2gXxdw/uMvKsbXbqSMh4tYHv455I9bfLoiu2w6Zaa2zMi819T/yKarxEMPvwT8j1LZN/YZH8wxj8KHCuDWRAN5mzx3fh12svziyBJ188Hlq133fpqbN4Ief2S50TGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KliFUdeM; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KliFUdeM"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b9358dd7f79so809045966b.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Apr 2026 06:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777381460; x=1777986260; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yvfWbNsf7kvzImbLhP8AA1uE2RBdkUT+264nPwInwps=;
        b=KliFUdeMkJ+CQ6Odbn4kNAS1DOmHwGlILKqT/xzQs6Tk3jXJZ3ssU44SCXNTVWOoQn
         2SYcdyU5OFNg9mHMgbWDVNPPl7fK9Qa7JfddxUZ4qq9TB3CPwMs3+G7YOiwqNQeq7xFE
         u6tHppJdtye+WKwnGTfeicjG+vHXWQtZcwcV3QGxiAQ8y6kJEZKuxd7+EAXR3hWpwhgj
         0A+0m9g8VTzJtI06q4gQ3xxFT7iLDOWRd7FqKYNN3vyLNh9NmF7UXGktIyPnintfhWRE
         KcgCd2U42DW/PvHSagJB+MpzJsXqW9Dg5nfJ+R3EP5mlIs04xeizaNkS/NHlVmWw9T38
         kuFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777381460; x=1777986260;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yvfWbNsf7kvzImbLhP8AA1uE2RBdkUT+264nPwInwps=;
        b=q0+ZHy0JK9L06fUZltpFRl/9a8XnPpedfR8b9SHRmkSl82lgyR9m+cdgUx7G4meZdc
         /+xJxXjZjkSRrEyWoQOvLlsP4v6o+BAXjC3xTmJSWzHgT7ZVCa/Sk7qTO4Z+WEUZrG2J
         i3M73bQDVXdi1ltYUlgbpCVwuh7WS8pcRHEgzJmzHMOjLF+WN1PIRHSmZLxIyJaWQwlz
         +4toUsAHN+8E50cpQcykBApF3VS3BYdKAxA5tcRLsZCJ+6T+qgFjnWwroiUmtYDSdGoI
         jrtUCt9Vk+Tpkd/ehJ9H9h6i6GIrRtyMZtS5k9M/Mn/pFNngEdtGW0db57Gnharlg8rT
         McLQ==
X-Forwarded-Encrypted: i=1; AFNElJ/e0FjDOI+L9ldn1QwHHvrVU/KFFM9qHRAaBnM8HKUkmbFBl18wyKx36dFgrUmevUC9O7pqrUpYSzIOgkSZ9Z08Bg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwnsPRroD+RqQ20RZnIk0+ObraCY3EKCn9qXvYaeeBv7hhqE3V9
	II1yr7r90rO9X9lUKxW8l+XiEuXv6ECJGWAMir92/EYOnrqTzb6iXqLjJwQIwE0ZZ1k=
X-Gm-Gg: AeBDies9i0ES6uQPe1ty+XSH9O4fsa7WMser0I+hpZY9ZvelYmujOlGXnezHYr3M+ty
	pa9ZOQxxTspYriR9NGG8EVQals2vcU4Rv4M0ky0GfftkdP0R2XrwkYWskc7BHw0nWZS9k4gBtmy
	RCBWHSeVqgR5pDp4YeCAF7A+ZsLWBtqds5IbzQOv/Ur3ZUk0qQ172VYWNUY/C+CSDUKzmC6W/xh
	6kKkgy7eDaXgvy6aTmBc74vGxAGfK7krmseCOql6UZH+pcv6c8WJkytKUSTtVrmOFlDbmZXzggb
	0a/Bzy0tTJ0paSFNmEAD+49xR3U3lGBF/68WnRpEUgIT9x8AF0EzeCZzT70ptG9Kh0TjrnExd1n
	QfnmIJl2PPsImvfqn8Hx/Agrw0XR7G1riKSJZdOvdU2TZX+zGnz3RYh2tR1ARZ9z22BHNz0b9Gx
	AP0TPh6Dxk7JMvqAQTjPX00X6ArfSNS1spAcsurvnK4TLS2+Te+YjWxw==
X-Received: by 2002:a17:907:9454:b0:ba7:e3ee:47a1 with SMTP id a640c23a62f3a-bb8018dccb7mr182160466b.4.1777381459520;
        Tue, 28 Apr 2026 06:04:19 -0700 (PDT)
Received: from [10.11.12.108] ([79.115.63.228])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-679b685290dsm754196a12.24.2026.04.28.06.04.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 06:04:18 -0700 (PDT)
Message-ID: <60f71fd7-1079-4936-b4b0-9d45a2c112ce@linaro.org>
Date: Tue, 28 Apr 2026 16:04:16 +0300
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] firmware: samsung: acpm: Fix out-of-bounds read
 and infinite loop in RX path
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, peter.griffin@linaro.org,
 andre.draszik@linaro.org, jyescas@google.com, kernel-team@android.com,
 stable@vger.kernel.org
References: <20260427-acpm-fixes-sashiko-reports-v2-0-1ff8de94a997@linaro.org>
 <20260427-acpm-fixes-sashiko-reports-v2-5-1ff8de94a997@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260427-acpm-fixes-sashiko-reports-v2-5-1ff8de94a997@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


FYI, I checked sashiko's review on the set, and I shall act on this patch
and extend the checks for tx_front >= achan->qlen and add zero length checks
for qlen and mlen that were read from SRAM. I'll do that in v3.

The rest of the review feedback doesn't apply, so together with the changes
proposed in patch 4/6 that will be all.

Cheers,
ta
