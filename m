Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C531EEA5F
	for <linux-samsung-soc@vger.kernel.org>; Fri, 22 Aug 2025 15:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755875026; cv=none; b=GzJck5S/oy5MhUS8oqolH5iYOKyYbJuFoSph8bGDg+TdQSvxP10uWNyztVNN9q+Qlkl1bAQK8L4VqnklV3ETdaCc+7GQaK6mcW/f55/CGUyPQO6QJa63Qvg4kNQ6d9MxIbHURxzrWaOA+3HtyoY0LcbU48Gn28l7twSf2JCBe3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755875026; c=relaxed/simple;
	bh=cevULq5F47U5pn1UQxro5Ou3EUsPb0j9aD0QUfQ/gUE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o/0e0Xqi4aGZPokjGHxExEAol93R60a2JN1iaPq1j5fUoVtKk1kpWxPqQUpcDFCLgJ2E/SGYcxx9cqTIqHANLpCIsedOm3+dtlPD449SRrYvDwWRObOJHK+HJtt+uwpyogqVpv5Ty9s0nC+MECMCNsHqNPKQ7H+cG5nORJvwZIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nZHOyjjo; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nZHOyjjo"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-afdf4c4a2beso429197566b.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 22 Aug 2025 08:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755875023; x=1756479823; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wWh8PyGxlWxe5MHSxxwSqq6RuwtxVFP35Vd46MU/svw=;
        b=nZHOyjjo2836ZM/zCSCZmCOnl2oGlnhFz000cUAeipCnpp4SovKuqPAtiAANZEJPok
         NTEBSMhDb4Z2mFQFW6XN3E1MflS0cWcom5wfeUIYsDOyMGHoA6kZt6k7bCG+IoXAr0wV
         6wZ0othq0dYvNYG500kCi7B3gC7njq+2lPaE90oSmnMH2sePsqkg5Ud9lNnA4l10pV0l
         57LRG6g+6n0a1XpKcsXThb7IK/jHciwQwTyk1MKdO1RWPaq0hCkbABJpBZURgUQ6VGGV
         7R47MQKKu6/yKU/adebHOkKyRRGDDKJOspVT0hBsAOAgNyTpYkv9b9ZfGIPS9iH+D1k5
         4efg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755875023; x=1756479823;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wWh8PyGxlWxe5MHSxxwSqq6RuwtxVFP35Vd46MU/svw=;
        b=sixj2SWjwjj2HLrX3S5JuQvlaD9lc545AfP3FH32bqELuTw9y/8YQhGJ9h7Tqgno8i
         LoEyZ0pHPWDM7sBAuOo/BbMXZkSVBARUknvwhzYQ+Ou3kcEGj5y4zydQRP+li0PhodIW
         XVQWYm+3fyVoULiLsBv6mFzbXY0DPP4gZM1/iLa6zyiy89mz63BQBNJigIoTA3GoPgX3
         hoCi8adXyF3L7FR8KQrNhnrMBvsEcEsIOb9iARrgoLqZncogRDJa7ChfiiA0q0biFw9n
         USpcBcSOo1UWGd/j9NQ5kU2S5q1WNiaPWP4D70iohQIuR3pbvscn7GXojORjHAe4l+Zi
         6bmg==
X-Forwarded-Encrypted: i=1; AJvYcCXFK3IXupQ5cz4MzciTH1gihRHSRqCQSRS4uMJ6CISphy9NcGe6BAtSd4mGQWsE2DMKqeD8YtK+9QKTi1BV/GqV/A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwxT5WL9b5ofCi2u/Ei3NLBuM34/evmB7DfikY4ONMUBJsW78vU
	J9ACWA2NgoykU6Bign/0raRIlegOo223pvKca74iJbtL1C5kZWBomMUP3nnUGpz281I=
X-Gm-Gg: ASbGnctWfi29brbHdU2/OogN0dqwWV4UH8p+UV40/UrGDgS3sgG3GJWRBQowm+5Cznp
	YYlZDKu2faOU7wZsytkUx8N+9muyS+FscupLBIugjvs1d2uP50IXsS+VwaTH+5sDSeBJ5op1NZw
	p+62oUNKXDCJahSRJ7VK28HiAAbUU+9pexPGtxQFwd3hfX+9i47490GmeGxp3xnGhE9NR3J1bs9
	6QjMspWefYfPHEBxDc2OBlsDpZZKJSaSA1XiaaguOy7dYERKOGG62NoBlA/CddxJebQDOiblV3C
	H0BnQkmgsMSW9H1fjAnZ7TH/AUgKQlpIv1SCMu3LbqEPcPC6p2ICtRxxHOOo1ljY4/xnPl7DW1Y
	p8MKXw03dwH7twQIXZLSCLZbjugOKsL0D
X-Google-Smtp-Source: AGHT+IHFLMYgpEsUwExR4khNq/wCqpieQpwMLNU5LCmqz1CCYVCENyfpLn38R54b4utgze14geVJgw==
X-Received: by 2002:a17:906:7305:b0:af9:8739:10ca with SMTP id a640c23a62f3a-afe0b497404mr587666966b.28.1755875023083;
        Fri, 22 Aug 2025 08:03:43 -0700 (PDT)
Received: from [172.20.10.10] ([213.233.104.29])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afded539d2esm621862866b.113.2025.08.22.08.03.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Aug 2025 08:03:42 -0700 (PDT)
Message-ID: <ebea336e-c43f-4519-b2c6-4f8812e29448@linaro.org>
Date: Fri, 22 Aug 2025 16:03:38 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: firmware: google,gs101-acpm-ipc: add
 clocks node
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Peter Griffin
 <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 willmcvicker@google.com, kernel-team@android.com
References: <20250819-acpm-clk-v1-0-6bbd97474671@linaro.org>
 <20250819-acpm-clk-v1-1-6bbd97474671@linaro.org>
 <20250822135521.GA3487754-robh@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250822135521.GA3487754-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Rob,

On 8/22/25 2:55 PM, Rob Herring wrote:
> On Tue, Aug 19, 2025 at 11:45:36AM +0000, Tudor Ambarus wrote:
>> The firmware exposes clocks that can be controlled via the ACPM
>> interface. Describe the clocks exposed by the APM firmware.
> 
> ACPM? APM is Advanced Power Management aka the predecessor to ACPI?

ACPM (Alive Clock and Power Manager) is a firmware that operates on the                                 
APM (Active Power Management) module that handles overall power management                              
activities. APM is built around a GREBE processor.

In linux we have an ACPM protocol driver that communicates with the firmware
via mailbox channels. It's similar to arm,scmi if you want.

Cheers,
ta
