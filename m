Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F1622D78F
	for <linux-samsung-soc@vger.kernel.org>; Thu,  3 Jul 2025 11:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751540478; cv=none; b=lnSF/sZnv/fbD0xic4ggnycaCNjrCLQ8U0OiQ7vDpOSsBFk9mynsUveYF+j9rTngNmJP0D74wMSmwYIniIM1/NcGHT558F0tXKm7eA9V+oXcGfnDy6dC7XvCppvawYpcGcrEnwrtB2NaEgcwTAkC+flqJKtqoidNSE3A3ILdZxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751540478; c=relaxed/simple;
	bh=XL9mj5YIkNoC5JCykpYkHaa5t3F3PIC3UliPRQHLUDE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qsr9Ulxg3B4AydbY6SOTtWW9hD3KB+aYpozfTNRMXu/ZxE1VREhUS+XYcQHvxGrf+PO4Yf67HpF6l26ZLE0Yuo3j/JuHcPhFi2nr8o8+GOj/dN5mNay9gnZ+m+Sqj33HCI3eKs12ydz1bnnRnysx8Qso5vljwUun84PpG/NSYIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XUII3I5+; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XUII3I5+"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-451d7b50815so42294715e9.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 03 Jul 2025 04:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751540475; x=1752145275; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=he9iT9WyI7YlpqKEh8jhMVFH9zJFZphKaP2582ttrGw=;
        b=XUII3I5+d35ALoIa6MqKWEYXw3e664O5FOHxVBeU9HJb+ptdAj/faO9vzFo6tlbvg3
         mUjQOtDrFpgbW/9eH2vJip+CN1hm6zzmF51eOQ7rD4FkaCVBD6UYoaHzJNMhfJLoVOA/
         oFULlM7Xl/l/6KgPLfs47ZHG/dHSL4GZNWivh+VJ8cbUaiBDsTasSDjjacW7mUNGnsvh
         1qo2T59+GBlX8LjQatM8FxhSs7TdTblu75lIE2sjIYpLDpc+UazOBao2wSAAqOqGxdHf
         iXrmbmAdJHfO+jv68GaKZ0Z1ZzYbbA6mlfeBQX2JLvo8r201QNxLIPI5T8XZkrNEKZm8
         m1WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751540475; x=1752145275;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=he9iT9WyI7YlpqKEh8jhMVFH9zJFZphKaP2582ttrGw=;
        b=r0uKxHKh0xuVtgNdZqbhGbKEI1y9Lf7KlNA+b+VS3VxAWAVScZrAPKqfuyL7ELhQ0i
         czVvbhFC/aYmBoQ2YzgEYiKoZVvB6bAkw/D8i2C9tuXQNvd1MfZaEfA8O1R+CA6qchUB
         cVP/7uYcxAlZTJewzz+XAtkdtUMU/CUaRYyYqxRJFBTyIdtfwbQp4HMrjbupmZ1jIVuv
         Mo1TqG2j2RG5TxfbVbGbLe6x2i9BzGePlZcT+4ZV/K53vW1Z4Qdcocuy4UGRAS0Ro39I
         8tSerJfYOCcQtOAdrrc0gj9twSwDwMQaRaqCUmB3XfDdN+9UCAq0YYlKt/iVHROqBIzs
         6DbA==
X-Forwarded-Encrypted: i=1; AJvYcCVDpWJWpJRQA7GmWDL4MT9PhR0nd/TXvpJD8Xj9cJ28kPo4YTNqEKo5O/gxoU0XKG1TUxo6oMTAYHpEzh+AaW666w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yymx79PPaM1bn73u1XGaNaWGk9s3+HPC+2rC+zq2R7uHnAzh8/M
	pX2QcS/ylWx9u1WGy2vldDoxFlUEe7b9OO3w2z6hXXc2WUI7I/oJIqvVC3ItzPirYuE=
X-Gm-Gg: ASbGnctkQVXn52AVALciLd+dqrq5ISzuYaJ3ubQDOUONu0GJsBtFwSJ7n7qu9/YZ0FX
	bP3KTMhWmKqlDS3Jo+3y+fbM3YAmrWtcAdu+D//iVLg/4RgkQ7vOVlEZqsOmVHsvJiM5QwvuC/4
	FdiqdEy8s5IE+DNkz3SxTwsNj3GiGfSd+VN0jY21R10dmYs345F0gKCtGdYExgz6Zzumo0MRI+N
	xfp7FHoRyvpAW90/FrgmAV//z2IwbxBZnKND1LS7+KcIwClLIvwwjq1VF8tyialhLlnd4wj3QRJ
	88/TPyNVu+SUAi7NPVsFZP/XGgWdxvU9nrRd/njNzUt4KKJnBn9Cnq8x016ZCOUnqw==
X-Google-Smtp-Source: AGHT+IFmsyLTW5PbUc7ffB5ixd3FjfkYoUZQCDDDXT+dNjoFbQ1TMzjLRO6Z08bG9VoRMBxKr/UkgA==
X-Received: by 2002:a05:600c:1554:b0:450:d4a6:79ad with SMTP id 5b1f17b1804b1-454a9ca8543mr30636995e9.23.1751540475173;
        Thu, 03 Jul 2025 04:01:15 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a9967ee7sm24208965e9.8.2025.07.03.04.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 04:01:14 -0700 (PDT)
Message-ID: <53a214b4039872ce7584a2ae6e688fcef0c86d7e.camel@linaro.org>
Subject: Re: [PATCH v3] soc: samsung: exynos-pmu: Enable CPU Idle for gs101
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus	
 <tudor.ambarus@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: William Mcvicker <willmcvicker@google.com>, Krzysztof Kozlowski
	 <krzysztof.kozlowski@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-team@android.com
Date: Thu, 03 Jul 2025 12:01:13 +0100
In-Reply-To: <20250627-gs101-cpuidle-v3-1-0200452dfe60@linaro.org>
References: <20250627-gs101-cpuidle-v3-1-0200452dfe60@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1+build1 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

More small comments. Sorry for the drip feed, just trying to understand
things...

On Fri, 2025-06-27 at 14:08 +0100, Peter Griffin wrote:
> [...]
> =C2=A0
> +static int gs101_cpu_pm_notify_callback(struct notifier_block *self,
> +					unsigned long action, void *v)
> +{
> +	switch (action) {
> +	case CPU_PM_ENTER:
> +		/*
> +		 * Ignore CPU_PM_ENTER event in reboot or
> +		 * suspend sequence.
> +		 */
> +
> +		if (atomic_read(&pmu_context->sys_suspended) ||
> +		=C2=A0=C2=A0=C2=A0 atomic_read(&pmu_context->sys_rebooting))
> +			return NOTIFY_OK;
> +
> +		return gs101_cpu_pmu_offline();
> +
> +		break;

break is not needed after return, and generally there should be an empty
line before the next case statement.

> +	case CPU_PM_EXIT:

Should this also handle CPU_PM_ENTER_FAILED in the same way to bring
the CPU back up in case of failures?

> +
> +		if (atomic_read(&pmu_context->sys_rebooting))
> +			return NOTIFY_OK;
> +
> +		return gs101_cpu_pmu_online();
> +
> +		break;

No break needed.

Cheers,
Andre'
