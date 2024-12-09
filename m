Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4799A215075
	for <linux-samsung-soc@vger.kernel.org>; Mon,  9 Dec 2024 08:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733732382; cv=none; b=btc25LwfdJR3hUhEuBuMo9EBCaIomM/4GyrsM8C4dYc3zzIuoDwshhEZyr2UV5EFEl2gYPlc94VQ7YfAAQ4ESv4e9qwa3Y+BPBmJuk6xcPqfTaZP/IaXPapx0abdcfYApIxab+UZS/2qgpqKvWz5dSFucEIMKDawJSna7NnqiQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733732382; c=relaxed/simple;
	bh=Ugyo68y+AEY8u7i/30di80rPWhNRRQDEi6tQUQwpdh4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UmMhStEqtIpHfVqiG/f8RHi+bjZXypXrVNt0Z57mWIqBEE0XcZoxvg8V5PhMdIQXMNqPT2qa6vcbgh4c03YxwgXZPkQsg8Dwwwu+utOB55UL3+xUpQC+T/xtnrtQJGLGCTAc8ndRt+wFGbHiA3RIqIW7FCGhODn5zjJ9E475Q40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dpn8o856; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dpn8o856"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-382610c7116so2062244f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 09 Dec 2024 00:19:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733732377; x=1734337177; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xQiaE+JvK4g7UWmvAk+qy7K9dS4ykwXQnbxiADZaYvI=;
        b=dpn8o856fSc3sXmA+VG7hVtQTQPGOBbNzj+rObF+P+QQpPk5SXCxvmyuOuJviEg2uk
         hrtzFVYEva+7L9zyLwFQvwNHH5JSIjy65MWwtTSN5mBQkw6NbYB3/8VEykY6TwhMmLWb
         PK95Ak430d3OuBqLaPj2RAVjwewEqpmz/lZ94914T4IZq7xzyxQvroa0BtXATy/iV/Ln
         PS81jJjIy9Ds8WDPe/MmfArM7FiOKOSNFr9vQ7FZ/ORsBxu0/oZSmS9S04VdCBZSA7+1
         4bvcPVL5rygGPHEoDedGl0tewaKMO/6YGBmBstc7/J5QEikxFq477h1YxxOvxf6THstk
         na3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733732377; x=1734337177;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xQiaE+JvK4g7UWmvAk+qy7K9dS4ykwXQnbxiADZaYvI=;
        b=xDNIEN7HUnoSSa3NVAxwjaupEoWydQ69vbXQLSQp8V9DWknFbL/qYOTKVa4x9/nMYO
         ORAqvtkUAYjUW9+yD7JMsHS+fCTH0ablnWF9J4Y2aWELxAyl6Lo9qi8IYQlwAZPVHz2z
         6HbWj5W1Ilb4kqDItZgGqPuRXCazeDeEkpLiSgepR2sWnVhnTJCaFPpHmWzpzfvCLsR6
         dlStV1AzKvfNwldFCStVcE/rRu6f9mZAsD6hrW8KYZY0ZzMol8iJeWg9kumfHMkMaX3d
         UG3fuWFI/57sEfUQh8SWKtTzVIUdccRw3Jj4sWT3i0JGf2zXHlLQ85Rrg0H71PoAUEAR
         iOJA==
X-Forwarded-Encrypted: i=1; AJvYcCWT/0/1L+IgXNgDspchTMYztDW+0kmeAbfSgIlCNQoXEiQP5ItnJWUNMsnbTuQ9JxolTKxgX1rkhsXCwQvPmm5M6g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzvtjThoRJ1DjL++pvZ9b/moNwXEruG/Axp/ORfn+oc7WfT4jAT
	XtjZYeanxOgBDX6gWbEU43pqXV/IgTj/bU5YuNmzVxg8cgkhpLSRTGPtE7X30JY=
X-Gm-Gg: ASbGnctIyp6suWpISPLIYQebyc0WSQziauWLZxqsDiv3r2q/W5bHEVrq85FeNbQvPRD
	Cn7ScT+5Bga9fct40M62IwHa5RCKFIDN0INglC3hi/6Ts15IS36M77cDFc1zm9CBc98XeAcCKqT
	4n/mvgGZpj9eHqB55DcAh9WUWcnJ1ZyMdgkHA0KG4+fghfP3bglNC1dWQ4FEkeCV1JBZP4ELREh
	702XQBFylu+jaPeb9wO+eNuyujeptGQUpGR+LeCOTP7ryi2/OhlMOBLhg==
X-Google-Smtp-Source: AGHT+IHbzDErJOZQABXZyJP5tU7I2SyjaZPz5Bn/mEn+KluRKuUJnEKdIGQOObo2GOY0FS81Gw2PTQ==
X-Received: by 2002:a05:6000:1846:b0:385:e8b0:df13 with SMTP id ffacd0b85a97d-3862b3d5c9amr8412126f8f.40.1733732377593;
        Mon, 09 Dec 2024 00:19:37 -0800 (PST)
Received: from [192.168.0.14] ([79.115.63.27])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434ea1ae415sm76326735e9.33.2024.12.09.00.19.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 00:19:37 -0800 (PST)
Message-ID: <e36da496-04f3-4f00-aab1-f52aa0c1450f@linaro.org>
Date: Mon, 9 Dec 2024 08:19:34 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: firmware: add samsung,exynos-acpm-ipc
 bindings
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 alim.akhtar@samsung.com, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, andre.draszik@linaro.org,
 kernel-team@android.com, willmcvicker@google.com, peter.griffin@linaro.org,
 javierm@redhat.com, tzimmermann@suse.de, daniel.lezcano@linaro.org,
 vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de
References: <20241205175345.201595-1-tudor.ambarus@linaro.org>
 <20241205175345.201595-2-tudor.ambarus@linaro.org>
 <k2pnpu3ef2rgy6wre2qrearwmetzb4v4meiyqpy7oyg45hohlp@kmnzulhbmdk6>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <k2pnpu3ef2rgy6wre2qrearwmetzb4v4meiyqpy7oyg45hohlp@kmnzulhbmdk6>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12/9/24 8:03 AM, Krzysztof Kozlowski wrote:
>> +  initdata-base:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description:
>> +      Base address of the configuration data in the shared memory.
> If you really need this, then it should be rather encoded as part of
> shemm phandle (phandle-array with describing items, just like syscon
> phandles are done).
> 
> But OTOH, I don't see why this is needed at all so far - compatible
> defines it.

Indeed, I shall move it to compatible. If firmware ever changes, and
uses a different offset to the configuration data, then I can introduce
a new compatible.

I agree with all the other comments as well, will address them in v4.

Thanks!
ta
