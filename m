Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89FC027EFE9
	for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Feb 2026 11:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771502375; cv=none; b=YrM0H/Z9E4jz40L05lDnMq7T1w2k55Acjsa/r8QrhJNb/6L0ZvGq4zIYZZZyD/WMTqW5QX2vFoc6thn5TPYZDtcjue+kwF2b3WuYI2wk+11UudjGRh+qhCX8bQY4fJlX7cSeTYbqLaZeJuJvZsxaycIp7uEw1XdFwcAH1TOiKWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771502375; c=relaxed/simple;
	bh=jNG6NKM2obIk5OUBsjkkY3but/QE8iHDzB1+6teyTKs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GOUA3+hwlKLTAXxT3u+FKFePdKWw8L6i9LoCLfxNF9HTNB8JCn2pVAIOPE7qVHCBYmcS9yJh9zfJoslKAMgv0YZxNdcksSBCP9cM+pAAL5fA55ptl5JCKUpX4wEwSyeX9aAULwLIEcP5TPUmXFop00uy//ltl7Z5UbeTEmtWlv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jNtT3X/z; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jNtT3X/z"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4834826e555so7825625e9.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Feb 2026 03:59:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771502372; x=1772107172; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YmIgGmMzCzPMs3nWbq1Vj6DbI/moOSEXCUqKC+k5+GY=;
        b=jNtT3X/zG3bqhzVDjXA/iNN/yNQUuF0fndaP4qJcZgHQUdl1LpGCcGHdbUKr3l+H0R
         ceGprRXGWtwbNwFLsd7jkiS+AGUVaZz9pI7y1WKA2bEjAT9lg6g2LvEmhTA8igh8Nd9U
         zgW8a3gJ7Hte0fvupXFlHsRce7pAcyKLmqfZDLE5RlGymvjqpbaVsrR29VPHNodrheSJ
         7Zz9BwW2kQ4hQr5CH1eIT5sEo8M27mBzCyDB7k/l2mJtb0Wd+YjaPXhLG6pDU157G0vC
         9DSJE3NcKHqbnp3Ts7TCRurpK6Kc1NJLup2DUP6MobusROPDwgzrO3e4Zs+e+7Lu8Y2+
         yvDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771502372; x=1772107172;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YmIgGmMzCzPMs3nWbq1Vj6DbI/moOSEXCUqKC+k5+GY=;
        b=UIsjVsSKLdzwZ6REjHMRNvSJ7FH9aBZKoNg6rB5loNeg376JBMcuSgKnj3j0x8oe1C
         ov80i6Me2XKYLyMhu9QKCB7R+r2vy61JIyTgMsB/Pj0K2tL2XYueJyzjlnWK+ZNA1BQ9
         s3x9P3Vfq8PMvvyCVZLT5jqGR7Ptnm5jB8PcIKEzM+Q1kHI+5QBqIGCplvrTMLgkip88
         eVo3X7bLBr91NXDVnpeLrhpMMtP4XRptCz3USL+HCjirASN8gVDsw1+J/1W5cldRkh0m
         uV6KhBqYxoLwuMNYeVorfLkboS77I2zV+KccDkU501MVMu54fbn1znSDqtaPuIPKHX9P
         yUug==
X-Forwarded-Encrypted: i=1; AJvYcCVv83dnj1QmNh8EMV4vZY7nR6x7uQLurfxmeOIwPEPG5YolfZbMBjz6ZRXOWKJxcPUe8LHRo0AIcziqXxCfU8aznw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9u+ymWJHW1PP6pVuqgQRmNnkeXu0kP+lFuhoxM8r4SZbll5fR
	xJgFZ+T/KEXwjf7V8srDlnbrV/S/+2lov0vSOHCRzVMgmB7ypBtzkLAdMGa1dXHMdXV7YdxDJxv
	ZiiAVS4M=
X-Gm-Gg: AZuq6aJ2LDR98UqPuROFQeQ3NfNmXM4M6UUMAOnyJumTh0CzNWIetq9l3S3ldclwMyF
	0YsDCOrL9GUV+iSi9vY+JOquMqz7eyUaQXrAIZY12PvUWb8y/bm90a5wsCWE/NgUB+PWj0tADAw
	8g/de3q9MHAed9Yasdcshw/I/MhTKrk9uHtZR4bg+s3jCvWG/MmHVimc9NhK8Oam6RdUdJpvSaK
	gp5CV2s8+lJYDj6sAG5fVPOjOixGdMo0kbCvXIq7DP8gh66ERApqsPliyQgix5ajeR4G8Y0WhrX
	knrsOLt6fxHGBOlydytCD9uYqqOrucPWpq4HUaXtbZey6mBPkIS66pBrRFVFSnMSniGM8+mmcMf
	j+FB+UjExyAJkOtPJp06nE1C9G3aTrp6SVX1+cbyhydBZeUeZMexaDRX/TtO/ebRIYhCMFzdfLj
	iutOVHWsGt0sGKzV0gCcLKmrO4hJ6lJ3UA
X-Received: by 2002:a05:600c:1c19:b0:483:5310:dc67 with SMTP id 5b1f17b1804b1-48379be817cmr338907725e9.20.1771502371842;
        Thu, 19 Feb 2026 03:59:31 -0800 (PST)
Received: from [10.11.12.108] ([79.115.63.134])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a31bac27sm267185e9.5.2026.02.19.03.59.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Feb 2026 03:59:31 -0800 (PST)
Message-ID: <cdfa7ca0-2c7b-42ef-ab79-4c63d4c10c35@linaro.org>
Date: Thu, 19 Feb 2026 13:59:30 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] firmware: exynos-acpm: Count number of commands in
 acpm_xfer
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org,
 llvm@lists.linux.dev
References: <20260219-firmare-acpm-counted-v2-0-e1f7389237d3@oss.qualcomm.com>
 <20260219-firmare-acpm-counted-v2-2-e1f7389237d3@oss.qualcomm.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260219-firmare-acpm-counted-v2-2-e1f7389237d3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2/19/26 1:27 PM, Krzysztof Kozlowski wrote:
> Struct acpm_xfer holds two buffers with u32 commands - rxd and txd - and
> counts their size by rxlen and txlen.  "len" suffix is here ambiguous,
> so could mean length of the buffer or length of commands, and these are
> not the same since each command is u32.  Rename these to rxcnt and
> txcnt, and change their usage to count the number of commands in each
> buffer.
> 
> This will have a benefit of allowing to use __counted_by_ptr later.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

Thank you!
