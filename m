Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8391C54A9
	for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Sep 2025 09:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758878112; cv=none; b=IHtzIY1pHfav1jXmckRc6HeMMHveQww8JHmHhl6RmJUcdb7pTAWzgKAKOH7Hh7dihTvW3M5wIwflwJWBzikXsUDEXk8vtFlZZCsFXTBSIOwsmYv8NFAxVlbzNwJll4PaD0jgMi/+efIBjXtBRghSLWbvkOKb9gnBNGLHikZ3AWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758878112; c=relaxed/simple;
	bh=TUFDRPK9OZWQmZ4Io6Lu4cMxFKXBj/5zzJ9fa5uYkLQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TXXINir5x5jgnueS+c9THKeUKbvk+lISt2UHCoIsCRsVqTLH7+GseN/f8TeBBdbB9T14XBdwaP6mrogqFDTIaa5F9lA6YlzOXkdoEguEXEnM6Myq6mLU8sjNYD3odkRA8fBj7EvhkBFlU2SqMjtv4TSf477WPUh29u7TIIDbM5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=odRhdtWc; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="odRhdtWc"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3f1aff41e7eso1853506f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Sep 2025 02:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758878108; x=1759482908; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KFTjY5/OntfnPss18xMJfKbpZ6ztPp46Q2iJkWHJLes=;
        b=odRhdtWcmyjJzDq+4robwRjA7HdxMSBLQGQNJhWqgJ4cKlZos6MhVBpsSni9P4Rk0O
         1oejhDZZAJBy1Ca8fVUthLGzuFh/BYnzYNyNLnBb1bCvJj9IXUd72mGSD0CCaLN42nI4
         oHsze61RC+7DHvBN3lMWmtIJv3jGxcNEP6GEWxcOTNZAL9ynjSZl6JZo0cKHg81paI1k
         ygusMKdV9fB/4LCJU4E0cDou9fE9gvldJUyqLET11EIEyDBOIdD2I+cGIczrRxJ0CTJ0
         TFGKHNqT0ZjBjMTvT2xddrvfzp6Tje4v20Je6lQWWrWOPMf+uUDs3bDpj5ROu4N8d8jo
         mSmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758878108; x=1759482908;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KFTjY5/OntfnPss18xMJfKbpZ6ztPp46Q2iJkWHJLes=;
        b=CxhSRPbb2/GnbA7Mu2B8VGZj2qYsGOGyhi0sHx7Ls2nHQ8ACBoifVc6MMBXgxa58LP
         XWJlI4cobd9py5fgc1i4B1hDX+Cd7f+/lRGBKvaq+v9RklKMsVmliM+wf1C2z8MxNg/W
         upOiaULYoWCnIgNP7oN+GclG7s1pWOcNhbolUcaJz/a8LgbvicDBH0ZzcyMuWSDlTTHH
         LTcdHN0UlWH/zTMMTyrZqBVjX6isM80WXA8BPUleDI2RMEgQbi5a3ZRL/Ks2OGqU4W85
         0m/TgqCLmGsOf0LE/+ESe1EGhkgOtIVTDi+y2Uafi8in79JRA8i27LFPL7b18kTBydp8
         dZEg==
X-Forwarded-Encrypted: i=1; AJvYcCWd3y0ByhLyiqdSTRdtwl3NRkCtORfaeruj/KnPJ5UWPSnEn0s/PG/TgNtkypfS19HpGB69Xi89MAf5W9Bi7HvzVA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd3SKOElodwyIcuYXKOcY1hnkAMSnTQG+KDjbNHWzvYD1SWUXb
	b1+izOH7NcG+cbf/hXQXGR6MqKtE7GsFbOllIKsICoIM0fl77Ng4tU8DlnWnGL0m1Wo=
X-Gm-Gg: ASbGncvmBJlDq6BzY7hqqWsKxXzQfvSy6w29OxxgDPj6Ol/82JoXS0aSX17oGzhQdbY
	mtM7WV04BH+doawsLVdrItI7iBqSTHyF9fJ0ms6D2Ajeiyp/4hyi/gaaLgXYbk9TqFLyIbprL8K
	Q5cU8u8HqPCJCO2WmpbKq79UJd2M3HwB6Tje9eHCnYFMhuMG2alF9NM3IDQWi5I+RjLjM2hgtYP
	ETtQFVFDhtPceBl7KegMioeQksKWpN8N7Jdt77mb/ILL9YSUjLJZ5ztEuaI0hKHdmqKobP7rTNN
	z48dJ1tonzgbgfo8yyql4ortKWohzeYcnzsGvkTZ5Dqv9u6I49BL8up9L/9YzvBuv+Gmx/0YLkO
	AgoD/kN2Jqf10sF6YeYpbfcCQ3ZmTNWSTH/pMOu90DG8=
X-Google-Smtp-Source: AGHT+IEVX7V7+nffT3CJ9dpetDYPOn1G7WuDY6pTt+HXts5dckr78/uI1tL88mQFYL4fesUlu07JBw==
X-Received: by 2002:a05:6000:2585:b0:404:ac77:6598 with SMTP id ffacd0b85a97d-40e429c9c4dmr6196945f8f.11.1758878108352;
        Fri, 26 Sep 2025 02:15:08 -0700 (PDT)
Received: from [10.11.12.107] ([79.118.185.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-40fe4237f32sm6185169f8f.63.2025.09.26.02.15.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Sep 2025 02:15:07 -0700 (PDT)
Message-ID: <586c85d8-7638-4e52-8f96-1aa4640afe64@linaro.org>
Date: Fri, 26 Sep 2025 10:15:05 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/5] firmware: exynos-acpm: add DVFS protocol
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Peter Griffin
 <peter.griffin@linaro.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, willmcvicker@google.com, kernel-team@android.com
References: <20250924-acpm-clk-v5-0-4cca1fadd00d@linaro.org>
 <20250924-acpm-clk-v5-2-4cca1fadd00d@linaro.org>
 <03cbad1f4f311727b4dce9c969404e2bc138c556.camel@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <03cbad1f4f311727b4dce9c969404e2bc138c556.camel@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi, André!

On 9/24/25 4:24 PM, André Draszik wrote:
>> +	unsigned long (*get_rate)(const struct acpm_handle *handle,
>> +				  unsigned int acpm_chan_id,
>> +				  unsigned int clk_id, u32 dbg_val);
> Everything seems self-explanatory except this dbg_val. What are API users meant
> to put there? Maybe some kerneldoc could explain it?

I don't really know, there's no documentation. I can guess by reading the
downstream code.

Grepping the downstream sources reveals that this field has a value
other than zero just for the edgetpu driver.

Looking there I see:
#define TPU_DEBUG_REQ (1 << 31)
#define TPU_VDD_TPU_DEBUG (0 << 27)
#define TPU_VDD_TPU_M_DEBUG (1 << 27)
#define TPU_VDD_INT_M_DEBUG (2 << 27)
#define TPU_CLK_CORE_DEBUG (3 << 27)
#define TPU_CLK_CTL_DEBUG (4 << 27)
#define TPU_CLK_AXI_DEBUG (5 << 27)
#define TPU_CLK_APB_DEBUG (6 << 27)
#define TPU_CLK_UART_DEBUG (7 << 27)
#define TPU_CORE_PWR_DEBUG (8 << 27)
#define TPU_DEBUG_VALUE_MASK ((1 << 27) - 1)

And then I see methods like:
static int edgetpu_ctl_rate_get(void *data, u64 *val)
{
        *val = exynos_acpm_get_rate(TPU_ACPM_DOMAIN,
                                    TPU_DEBUG_REQ | TPU_CLK_CTL_DEBUG);
        return 0;
}

or:
static int edgetpu_vdd_tpu_m_get(void *data, u64 *val)
{                                                                                                                                                                                              
        *val = exynos_acpm_get_rate(TPU_ACPM_DOMAIN,
                                    TPU_DEBUG_REQ | TPU_VDD_TPU_M_DEBUG);
        return 0;   
}

These methods are used only to be exposed for debugfs.

So it seems it's used to __get__ clock rates or voltages, and that the dbg_val
acts as a debug command that also specifies a secondary ID, TPU_ACPM_DOMAIN
being the first.

I find this a little ambiguous, so I refrained myself from adding a description.
Since I can't tell what it is, and whether TPU is really the only user or not,
I propose drop the argument or not describe it, as I already did. What's your
preference?

Thanks!
ta
