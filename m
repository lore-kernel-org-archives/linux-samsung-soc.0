Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5400E21C161
	for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Mar 2025 10:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742208531; cv=none; b=dsk8op9pxssAJ1NN6BzOY3XC4lGirqmC//ARnQ4xUHW9YwFPXCxmSWVa5M698i0I4Bf+DUaQ/upULtyZflKCfgsEKxjs8Kg+l8h8pvK3jEabf2QY8fLEQk6WxT+eSqQP/jsLOfV2ZTffvL5XT59TzxaRyqY89Njt2yPOxm2HXeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742208531; c=relaxed/simple;
	bh=p75LrdmcmOCqHM4SAzLua2uSyJuWodBI95URCCVuJys=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=SOwxowIO0OyIFI2rnzsOhNdafxNAD2+ycuOA0dXlXlV414ldsjx8vERlfG9DQocXzdopiTDrUeWBlTZjpXhfwWHzBJyhEkjmGLn1X6gL98D+T425Dy4eMY4QUy5//3fsfAX+zokSY4p2/bRYdHuVAz6VOi5uhlqH1bYw+WRcJBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RteWM9GS; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RteWM9GS"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so12555975e9.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Mar 2025 03:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742208527; x=1742813327; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eycY61Wk6wfvZBg4chYuMAQviSFft2VvOnLfN3NdZe0=;
        b=RteWM9GSXmh66sH+f4L8W7ou2imnpeAJAp9zhYl53WO+NYMq1AdTy0nZmyD5+8iwcx
         ov/c2f5iyfNBVU2g0Lm1mn6YjeJNMg+TGT5x/hN0ta8pMjWwVlHhajRrPw+wiOngx61+
         I+hGykruscc68XCUKTbE4gHg8ABFORxzjBbu+SUkpbVGWtEdLj3oer7u8zK/wMRBwEu9
         vjzQk+eKsSe02rH+YekUtCjf8hTJh0Q96vLR4ypyFBc5FboYrUNYYvWB6U6QLFTas3mN
         rtYWKsLL8mnkPZcCIEAMODKLBM1jTWQ09HvtzGfEsuXPLaTqXJzyimAkXM5+3+BgK92x
         WhEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742208527; x=1742813327;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eycY61Wk6wfvZBg4chYuMAQviSFft2VvOnLfN3NdZe0=;
        b=r1SMykducvYVnvOl9KD2OioZt6oo9NlCAbLYuTMENqeK6WyIegvmIf4jCOpAdknwHa
         NpzZqqF4hpz8l7bnLkMVmKj0opPT72ZkYSLBv5hFHIrtrCEKTjsjOBGseLtCTqzg1Rv/
         nrFiQGzJ1Ut7pSCF7be8uZyR5nG8tt8zT3G2v70JbQL2nV6pPiEsa1EJNhJy+s3CjGze
         VEhsPAyPoZmM93LGrFmZbldLQx1Vt4SaPgz0T6L67wizjKvQb7pn+dyu/H3ElvfZpKTr
         SaG3Pme8UCHIDw68ELOLxmWela5gRQupR5mbIvmttXKcX8W53rMZyF/fsgs0GYuhPWMk
         8wTA==
X-Forwarded-Encrypted: i=1; AJvYcCWG+95kEo6vVai7/v7HHhFwDmf5xY3D0JcIzn/thWvbZMJoV8/if3sYqEU+bke+WoBjtHa5OoM+xdV61GC3nWjQrg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSGtaOQLtj+tmdQABUso26eyfm92dDt0NtuiRcWM647ib/tGRS
	ZJCXqDSrd2W0296hlDqD5e1c66OBxfQx8HM0LPXk8lQUp4f3x5dwbsxFWrcie4c=
X-Gm-Gg: ASbGncu7BpATKmkD64PcIgpw1ugItM8m9Yhy2XKAsW0TWlHDHjBeHkxjH+g5ZZEP6Up
	zXOZAqlZUydbRDr9s6inleLmMv35wT4GW+MFKB94DaSlztb+6Fm2FmdtXgMPuI2KkLMYvMQVF5U
	UocAUaB7fulTJI+rlNhqbxGzkw4DlhipAV9EIOva0Y97Xye1BwDaDkKSm0ZxuN/8gaCxI5yo6MB
	GF5445blMQSOOhL3C6GUatobOZr4WKD/mpJD4p67hdVYt0zPelqEhdfC0RhEDCvhFhCx7189x1C
	ij25mGlk/aLng5Uk/9qyHcmGpvkEGDQLItRvji/0cLotXKkSAt0X77hHYGs1AMGVmN8hI8Mqvwp
	ydJFcDcMeyIdUi2KfQMY=
X-Google-Smtp-Source: AGHT+IHwbJoYZqGiwb6co2hREAgWTQOaf/s4YEZo96aCVG79kC6hdFtxQajN7lHob6EAvFbTP7K5bA==
X-Received: by 2002:a05:600c:3592:b0:43c:f44c:72b7 with SMTP id 5b1f17b1804b1-43d1ec86200mr141007775e9.14.1742208527614;
        Mon, 17 Mar 2025 03:48:47 -0700 (PDT)
Received: from ?IPV6:2a02:2f04:900a:ff00:eb98:2c37:6a77:39? ([2a02:2f04:900a:ff00:eb98:2c37:6a77:39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d1fe609a2sm100628115e9.30.2025.03.17.03.48.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 03:48:46 -0700 (PDT)
Message-ID: <d2e162cd-b12b-47e2-9190-2ecce3489b9c@linaro.org>
Date: Mon, 17 Mar 2025 10:48:45 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] firmware: exynos-acpm: silence EPROBE_DEFER error on
 boot
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>,
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250314-acpm-fixes-v1-0-ab03ca8e723f@linaro.org>
 <20250314-acpm-fixes-v1-2-ab03ca8e723f@linaro.org>
 <638cf070-9fd1-416e-8172-75f189ab0dfe@linaro.org>
Content-Language: en-US
In-Reply-To: <638cf070-9fd1-416e-8172-75f189ab0dfe@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 3/17/25 10:26 AM, Tudor Ambarus wrote:
> 
> 
> On 3/14/25 4:40 PM, André Draszik wrote:
>> This driver emits error messages when client drivers are trying to get
>> an interface handle to this driver here before this driver has
>> completed _probe().
>>
>> Given this driver returns -EPROBE_DEFER in that case, this is not an
>> error and shouldn't be emitted to the log, so just remove them.
>>
>> Fixes: a88927b534ba ("firmware: add Exynos ACPM protocol driver")
>> Signed-off-by: André Draszik <andre.draszik@linaro.org>
> 
> Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

I see you kept the error message though for of_find_device_by_node()
failure. You either get rid of that too, or maybe transform all to dev_dbg?
