Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32BE633CEB5
	for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Dec 2025 10:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766484898; cv=none; b=VXa/JPapt8Sp9OQX+ygDy4TN0w4lH854kOEtMjkRMobnyGzSK39JE+A7eqoPGtistWfoY+B1wUIytTWfg850+WybzhCm052Doac+wxS0mPhjvX66UPayKum5fUHH39edbLvzjUWZ0Ee9rHoErMYr9/ck32wKLeiItBtH/I/Ajr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766484898; c=relaxed/simple;
	bh=YvOATeMAwdTgxPzcCpWS9B+0hVDEc47zv3yPoRUKTQo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u9lDptOZ9MIO6DJKzR/7JCfUfb6Aoer6/VNQaqji8IavhPyleBIhkJpD4tL2Hwvb4bu4Jb79w+fOf+EDnoxj+GApDHLZeJKCtE9ds9YS29tcIiWLmoMJCr4tnLMGOkDyqaLSQkLdx9gsDim+Mt2AHfjiE4plUFMyEdsrUcsh9Co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qERN5aGz; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qERN5aGz"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47798ded6fcso27271555e9.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Dec 2025 02:14:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766484894; x=1767089694; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CZaR+VLWbkJkXmW2vL4cv5W5+vLpcKE/YHys3L1wv5k=;
        b=qERN5aGz7Z+yEy1jrOiTHiSoHJrCTxBfvXrkzHnW5B3d0y4ZPPXvLDqCWEhsvD+kmv
         2pPUPWpR1AxJCTGjiD2ILwyt7GY27rrQB4wR09McI7BcVF6yfd+IP6osoKW4mw/jOq09
         ZvlFEDVTSD5sKljIf8CfBiHTdWR4jOc6TaPGP+O+TRHE7wFQJFsaOH9p9lQktNGRRrhx
         EPsQSzOgZLCfDr16yZnrRu1gyXvNDsAsEC/K/2AoFpEzvrYOMRaV7N7WE0XeUCgHYKhp
         lfAJEeekD6tfQjzYa2zTP8wxWzneXwoJOA4Qx80EX+OvUhCnkVX2h+X9tixUOZVvP+0H
         l69w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484894; x=1767089694;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CZaR+VLWbkJkXmW2vL4cv5W5+vLpcKE/YHys3L1wv5k=;
        b=Zhv95zfaf6oELOUFgYBujq2BDRzknHbdCzFSc3SAObF32kmG5sOeNoGkhd5lmLCwtZ
         UjJlLVKA4pmJobL2fLMMqns7olHG05M1I2NXNI6+xqWyHTP7r+/flsiMbvjkCQy7huLx
         exmWi34ogWYE8u2umzmaCvHqwnUr3hUVnMbPAo3AS8MBpnll/yZpXHM1conbyPraPlo2
         jzTBUL/pb2jO6btIuejnJ53QDcWoSip19gJbn08aRMpdy3EJ8MBQL5fw8LSHELgeoawD
         tAmjJValI3G4OlC88Ke4wwLQ+Ps1mtYEf6pMjw9sFA59M28i9TbyI6bfbq7JEZQZD0NR
         cm3g==
X-Forwarded-Encrypted: i=1; AJvYcCWVZdGBwwEMqGJDqke+f4wHL/KIXX10ZL+PQpAGN2WtjMVZw7OMLwKLDhXTqu7KwpCSq2TP75PVnFPLYYndPvIySQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxcA51TOliFHsGfMHD03o7ohHcDpmDqy7HX9dD6MzXh53dJ2uRM
	59a+5CqMRSO8G+xuI2Op3IKfeSDFmVh8/OdUiOyQX/1w7M+JJHIuigdSwaWBdZZa91o=
X-Gm-Gg: AY/fxX6riuMg66I5XZrRS+xlcsBmiRbnSq369cglVRveNSGL69xGmVFWxQRKl9QdSPy
	1UBz1zFSp6kGsoOpjGqiqN6mKIaCqmsIplS6Ehn/mRJqacQmMnNUczqpNnVz9l0Bz1PCgbSDmSs
	IZkbbGYAEKLmPZGrePXL0IwRO+zZSd6f+CLVbWgrr/4QJECQzM+Mm/A6HfsqHlTM7NwPM7rfM/n
	4bwdShEJpNVt5HjevcO4fdavCDhZhOLylgnMymYVhNdl1inaAvYdCx4XsFAWFQ0sHTREQTDUbRF
	gEHnBiVnhQHgLgZbvvfKxvOwzVKhht49GfpAnDuymt9aUQfLeQ06Wd9E2TicJPQ3eL1YF0sTIsw
	ylEUn5rGslWmWUMdpl8auyWcJT9fMSFHqbObanY+TPqnukpJQ6KHbRTdjAGLZfMfBb+5s1PISxn
	eWlBUUqQsixNIaIsYjTxGG9LpxPIfUEqc=
X-Google-Smtp-Source: AGHT+IGkYED9TKqYRj98ZVsQIZdbyoBxf1Q0pfuNnIsOb1AlKfTwyNT9W3VSOvf2y07a+vc1dZJIgg==
X-Received: by 2002:a05:600c:4e8f:b0:475:e007:baf1 with SMTP id 5b1f17b1804b1-47d19591166mr131317275e9.34.1766484894279;
        Tue, 23 Dec 2025 02:14:54 -0800 (PST)
Received: from [172.20.10.10] ([46.97.169.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be273f147sm294947695e9.7.2025.12.23.02.14.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Dec 2025 02:14:53 -0800 (PST)
Message-ID: <51565d98-ac0a-44f4-af30-6d42b68661da@linaro.org>
Date: Tue, 23 Dec 2025 12:14:49 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/5] soc: samsung: exynos-chipid: rename method
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 Srinivas Kandagatla <srini@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, semen.protsenko@linaro.org,
 willmcvicker@google.com, kernel-team@android.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251222-gs101-chipid-v4-0-aa8e20ce7bb3@linaro.org>
 <20251222-gs101-chipid-v4-2-aa8e20ce7bb3@linaro.org>
 <bf1bca0af63f161afe351cb0e449896cec11cdcc.camel@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <bf1bca0af63f161afe351cb0e449896cec11cdcc.camel@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 12/23/25 11:55 AM, André Draszik wrote:
> On Mon, 2025-12-22 at 16:30 +0000, Tudor Ambarus wrote:
>> s/product_id_to_soc_id/exynos_product_id_to_name.
>> Prepend exynos_ to avoid name space pollution. The method translates the
>> product id to a name, rename the method to make that clear. While
>> touching the code where it is called, add a blank line for readability
>> purposes.
>>
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>> ---
>>  drivers/soc/samsung/exynos-chipid.c | 5 +++--
>>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> I'm not sure this change helps with anything, in particular as the
> return value is used to assign to soc_id, but in case it gets applied:

what drove me to do the rename, and prepend exynos_ to the method name,
was that IP specific drivers should not use generic names for methods ->
those shall be left for the core.

Now about the s/soc_id/name, you're right, I could kept soc_id to align
with the soc interface. Happy to resend for this if you think it is worth
it, or drop altogether.
> 
> Reviewed-by: André Draszik <andre.draszik@linaro.org>

Cheers,
ta
