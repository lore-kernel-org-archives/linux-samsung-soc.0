Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3A5153803
	for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Feb 2025 06:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739514683; cv=none; b=EPaGXqdnabG56GbeqPlolfTk1atJU7/wUyZ/6dvKULgF33GcF8SY8kpEGsOzI2VGepeK4UCx+IjsSwA4PgEApDTW2S3XgSO1Xlh/LS6AvsRXJiN9MMrWQuz506kqe08XNcrP2WxWyRUJGNxLr1N9BppWogaAQyOJp2IzwKFDjow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739514683; c=relaxed/simple;
	bh=bd3Ix1OlxqfISy3/YXIyFe4/qznReagdpNKuiCq9fzM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=jXLB2Kf8tdzKc+no2dZmbcDQDHNVYN3vlkqN238flJwBAO5aVJi6FFSh7baVQxrqQNe62jlwMwiRsboawTrgzcZl/0qSfhqeK+x9cUIcbMe/KwEKjf4L0dVHYTFbvG6NVldzDvK1KKoBqQrM00IQVbmURtd3kBDdP5/gXPI/QWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GTq+bIyv; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GTq+bIyv"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ab7e9254bb6so259378866b.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 13 Feb 2025 22:31:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739514680; x=1740119480; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RS4NhYdSKIq0ZCVoddU4UM3ba+/5N5wTfgewbJrHpVM=;
        b=GTq+bIyvVaCw26jlpZ9dhBnWI1Scr3lEuVZhWSEHpar+mQi4qnTNxJiM18DPvM44V5
         vLaw7lAvoZ5HT3MgnNDZ+q8apl0N2jj1zU22I8OME9DaKcylJ6ZnlQj+wFErF/xYxlf0
         hdEKG9Q5ZagUhG2331Ixj6hSuLvKgOUuLP4GFD6J7846BqgHTFxwIyALqhU2rBb6dQw1
         1YHCAthQuli0sOuix8qqKsIbotyIr9QvNu5Ubrl6/0NtYxoTi6FaRsslYgaKK1BAf7ww
         B7xcpEItFgdl8g3zGMsYD09bL3PBGyl2OpQaVJevPjB0hKqs19dtkStQyxAIOs6c81ji
         OyqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739514680; x=1740119480;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RS4NhYdSKIq0ZCVoddU4UM3ba+/5N5wTfgewbJrHpVM=;
        b=X2WSnKh90cbFL59JjI3o1nhvF/bjT0y5JeyIVlwutqYMtu6PemR/wqSsq6wIdzT+u9
         rnqOx1KE+IjmGyjnE5Pzyey58iKGdf2tNDBR0fLsPKHQCc1fCZ+VZU07Xm5Yi/JfADbH
         /bbIeEfnn3B8pa5+7vD9pJxCZk8itn3mJlCS7jKhdUE+lFv7gHNOn27nS8na2KqJ8uYJ
         bI+5LLzQ4tPLbRHzHO2avelmsVJgUatmaca0WSFBSkyKr4lZSD4rDRatYMeoa2D/VXL7
         H3lhX7ctcfYiTuffukTKdGqLxfNwNg1lnNT0PCecTte6FEvFAtwYHhTIr0CVECYC1E7C
         sZCA==
X-Forwarded-Encrypted: i=1; AJvYcCWvHWs1XNLZT0Zg2PRIzRNmn/qJM50zg5ISGd67r8Y7zShsxdvFc8GvFVcInd9db65t2XduEl4iZwSGLPby3t8mWA==@vger.kernel.org
X-Gm-Message-State: AOJu0YybJr6gWNFkFVktMWN7sz2TP05c2dLWy5mF69oYVjd5q8nxxRae
	EFpAItl46aLL8cLHhodKhcL+XXbPAF4hUAxoZgSdNLNzmtUl9qF034PcFcs+rh0=
X-Gm-Gg: ASbGnctCrW7pSiA4SS8Gqd9R560V/Pt1qOrVebG53QnYArxzMfU44zVMyADoHP2xlgm
	MT6BsbhgfDlylB75prXCJfJRZxh15QiJQsFkQ5ZzaXeJObFX2jhVadI0wSgL5h/sKpcWBZnGVR7
	t0pMB4blnf3i3F42Qf9XLwnvSq0pF9bA5YZWG1HC2gaGHujNJXIcuJNAMZB9qYdAyQsHLbuoU8Z
	Vda2MmYIZICl66g2Reji8i4a80L97gJ5TyjEVVxfA05A+G0W4IbNY+UNyS08ngbR2LJSLNeuQOx
	pcDniPNyTOj1h0P0mtTeSb++
X-Google-Smtp-Source: AGHT+IEN/RRE5hxQ5xNZNtT7rJsPTV3GPjWwm8qrFkScK0MAqhU1b09AXyINMIOW8g0Zg6OABiY4tw==
X-Received: by 2002:a17:907:3da8:b0:aa6:79fa:b47d with SMTP id a640c23a62f3a-ab7f336d454mr924285066b.1.1739514680163;
        Thu, 13 Feb 2025 22:31:20 -0800 (PST)
Received: from [192.168.0.14] ([79.115.63.124])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece288e38sm2350948a12.79.2025.02.13.22.31.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Feb 2025 22:31:18 -0800 (PST)
Message-ID: <49ce4bf7-fec2-4d1a-aff0-e342b31c4f57@linaro.org>
Date: Fri, 14 Feb 2025 06:31:16 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] spi: s3c64xx: add support exynos990-spi to new
 port config data
To: Denzeel Oliva <wachiturroxd150@gmail.com>, andi.shyti@kernel.org,
 broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, alim.akhtar@samsung.com, linux-spi@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250213204044.660-1-wachiturroxd150@gmail.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250213204044.660-1-wachiturroxd150@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2/13/25 8:40 PM, Denzeel Oliva wrote:
> - Added a default "fifo_depth = 64" to prevent crashes when "fifo-depth"
>   is missing in the device tree (avoids divide-by-zero issues).

no, you shouldn't use fifo_depth as a fallback, it's misleading.
fifo_depth shall be used only if all your SPI instances use the same
FIFO size. If that's not the case, as in yours, you specify the FIFO
depth via DT.

You need to determine whether your IP works with 0 sized FIFOs and if
not, make the the DT fifo-depth mandatory and check that its value is > 0.

If the IP works with 0 sized FIFOs, you need to update the driver to
allow that and let the fifo-depth property optional in DT.
