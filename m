Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50280214807
	for <linux-samsung-soc@vger.kernel.org>; Mon,  9 Dec 2024 08:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733731901; cv=none; b=OuLBfEAySyxAobO9zvEBAHw9lsFXDiFrdOKL1+k4ItLDJOpPpGs6lQQeDjYJU+Yinug/XdenxpnP7j3OcTb6IRZ0Q76Z9VfhPPZQrsmp5hs/ckYlxKqjiIjaXUAP4eTeKMbMTTyywdPnluAmcVYJp+3rLE4zD6e9JGvvVm1Mrzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733731901; c=relaxed/simple;
	bh=Rqy1ataKgral7Qwp51f+sXf8c/+cb9+T25l6Ab1PUSQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EUZ0+eJ5RPLo5NHlWXRak6DulNvWXEynYzZ0PaoBdE7EKp/yEfnBdI8yvM4HH4IoFBaRxvPOHDAp5BQ13PDkjclUUXEyRfnfFlfOextMTCgpxpHy1tQBZAx5pkJZpeCp1cgJSN8fIfRzvsVk8ZtzrHM7qtqLAwH3EAPa9Vh292w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UwDvotcZ; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UwDvotcZ"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-434f09d18e2so15872885e9.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 09 Dec 2024 00:11:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733731898; x=1734336698; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dTSM1ZL3lya31wOa2eA8/XL6JcurxnBBkRFyqfdvl2E=;
        b=UwDvotcZGYYNfOCgkjeHOGYEkjL7a43asmkPD0YOXrlmWNyAqleliIkbWvFRyBFHQF
         PCtTZjGkz/wOh7y+El5pAGYp+rwUciJL64tQ0hHxJ7Ry85AyB05bCcHoEbO+yFLm/lp4
         tMhuJvroRwKmoUNZktFg47yLx8o+XRBsYkw/ilyAM7xSIHhjoELbNIyNJbGPXWutVFwB
         gJJIqnLtw2MiOOocoOF9N886fKVV04VsAoe28wuKsPqf7qezcpqPXQ+0lDN1yQTv80jH
         tw1OJELg/nUIouxwIWY744Qe5gfddXXGUzw3cHtTplvowgHMllLrdrE29dk+2blxMGtd
         9ScA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733731898; x=1734336698;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dTSM1ZL3lya31wOa2eA8/XL6JcurxnBBkRFyqfdvl2E=;
        b=Y07XgdiDQA9cWSTqE/ZznIO/emvLsYsNxz+FbQzVDs/2DZXzB071t06HB/cSz9QIg6
         dadeyEmRCiMEZ0/cZ+Mk3q2Ruu6P/L6JIs8I1/GCwhbJQarqbnEMMpJMY7BcryhCEmxA
         YpMrAEkxyLuHWMhTIeHdVI5ZnH437Nba8j4igzgs/0XX4oIuJsiqo4N2pzB+724dBbCP
         LjgoZxNP0YV79+8zK0GUgxf9oH1836dhPu32AXMhCoSBw6xZ2Fbxs6kGMkBmUuyQPkCR
         qPIGAg9r/slQoEM7PgaVPPDXlKJ5rE6bPCSCai/YH8kEL+pn8f5kT/q189N419ObZH5H
         F7oQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxq9X3X8dB95ptsXeBuLhCRmc02s0Ywt4e07QjpkHMVBywWRWgbLN1+nzmBuc0xK6/XVMhh+HQPw1cbPQ5PbMgZw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6YENdoMqLRPoiNNLN065cObDhcz0U+sbGWr+nv7nA2hJoLpCu
	ZROTJnDpowWfMtdoFEl1m4BBEtDAZYjqLoz9uYKso/FWY+gNzyhYkzwSPS7JOQc=
X-Gm-Gg: ASbGnctdWmxRs5l4de7HQ7ncnO7YrYrRlVaE40HUj2GQ56EnG+RJXpu6R0BKUqxT0BZ
	Bk/+PgCrjzy3QBj4BaPFmmi4+EX/3VNHcY3095qSI6KMxVbQMxShdO9QZSU5zEpAezxxuu3PJro
	sF+kAj9rA075I85DzGCpn/TXlxowIAxTeZF3cUyZbaWoVDGBKQw4E+s93c9IfrKZCL5ouy2MnNE
	gte3vHrhRNxmqT96y/gOtyXDIvUyuzdIBBNKJkc9mM7XBiwpkn3HyqiSQ==
X-Google-Smtp-Source: AGHT+IFX24cUkHhTSqFHYkRi7Ptj8ZcdXz5CIVRSOflj14yH1xBA/yL8IBUKGCaXaPHX5jvTE/xqpg==
X-Received: by 2002:a05:600c:450d:b0:42c:b905:2bf9 with SMTP id 5b1f17b1804b1-434ddeb8ef7mr104821245e9.16.1733731897663;
        Mon, 09 Dec 2024 00:11:37 -0800 (PST)
Received: from [192.168.0.14] ([79.115.63.27])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434da113508sm148897065e9.35.2024.12.09.00.11.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 00:11:37 -0800 (PST)
Message-ID: <9886429b-1bf3-4dc3-b0d4-294a98e44ff2@linaro.org>
Date: Mon, 9 Dec 2024 08:11:35 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: mailbox: add bindings for
 samsung,exynos
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: jassisinghbrar@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, alim.akhtar@samsung.com, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, andre.draszik@linaro.org,
 kernel-team@android.com, willmcvicker@google.com, peter.griffin@linaro.org
References: <20241205174137.190545-1-tudor.ambarus@linaro.org>
 <20241205174137.190545-2-tudor.ambarus@linaro.org>
 <2lkowhldq5i4otniijfw7cb3jm6ttatwji3npw5w7c5fyevnn5@ynojupmdyqy4>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <2lkowhldq5i4otniijfw7cb3jm6ttatwji3npw5w7c5fyevnn5@ynojupmdyqy4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Thanks for the review, Krzysztof!

On 12/9/24 7:52 AM, Krzysztof Kozlowski wrote:
> On Thu, Dec 05, 2024 at 05:41:35PM +0000, Tudor Ambarus wrote:
>> Add bindings for the Samsung Exynos Mailbox Controller.
>>
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>> ---
>>  .../bindings/mailbox/samsung,exynos.yaml      | 70 +++++++++++++++++++
> 
> Filename based on compatible, so:
> google,gs101-acpm-mbox
> 
> but then entire binding seems for different device, so you most likely
> miss here actual Exynos devices.
> 

I need some guidance here, please. The mailbox controller can pass the
mailbox messages either via its own data registers, or via SRAM (like it
is used by the ACPM protocol).

I'm thinking of using the same driver for both cases, and differentiate
between the two by compatible and `of_device_id.data`. Thus I propose to
have a "google,gs101-acpm-mbox" compatible for the ACPM SRAM case and in
the future we may add a "google,gs101-mbox" compatible for the messages
passed via the controller's data register case.

Given this, I shall use the more generic name for the bindings, thus
maybe "google,gs101-mbox.yaml"? But then exynos850 has the same
controller, shouldn't we just use "samsung,exynos.yaml"?

Thanks!
ta
