Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 923E91F959
	for <linux-samsung-soc@vger.kernel.org>; Thu,  2 May 2024 06:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714632707; cv=none; b=e1K7orGiP1LdNxkhC6tHlXEG0zjbQA9aaTktiBLUfAKM/hbLf3qrErOVF/7k/pozqdUy9KV/5HKl3ObLi8hFHThc+rjK7noEjxDYhCwoFXg7JvuTGcKq2B5rF7jW/l5y4e9HPqu0euq7NO3LonGOsGiKXaSgFRYQACrIJKorEsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714632707; c=relaxed/simple;
	bh=AzGGXMNisgtOgDKqW2TST5EGH/yE9Qp4z4if1pjzE3A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wz0vv/llD4G+kViIyoFrzt0sBlFkicmHAzXj2az/nLroDs/RzJFlXSghooiMHZYQbQ/yuKFub0lKWGuX8ps05f+b8E6AV7egQ0co2dMmdc7V5t0UJVCeNSw7DYRXab6Mott2iHEYdlwpO5oavFcELSfsDi/9/feKi1qWDQUCG4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=piLTaoHC; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="piLTaoHC"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a5200202c1bso968115166b.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 01 May 2024 23:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714632703; x=1715237503; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AzGGXMNisgtOgDKqW2TST5EGH/yE9Qp4z4if1pjzE3A=;
        b=piLTaoHCddCTbweKGPSOrGUGN19/aMGd4HEoB7xrHyCqtXkHqQlparP86cw37xNR3j
         +7ppqJldaeFiDrdQ3O21spS6Qt0Fvsgh3R0IQ2A0nwcZWeeMpVYmi3zJ/yi0n9rF9v78
         sPsR1RFx+6s0icnCUjiG90R4I9bYZQ5VuwndudqMj8c99uWzhkXpAaDhRNYKWGl+tVoC
         Kqz/iW84t32h39tn2QPpsw3+R2ZTVcSk5CT91DTKUOX5dEE9MOC7DcTk2jXC+lPfNEDt
         zTq7ozajc9P/lvS6cBMGwspTxG4D/4peMoE4fovCCIRA4jXW1qcvyhGtT6lrYuLDHHqk
         voOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714632703; x=1715237503;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AzGGXMNisgtOgDKqW2TST5EGH/yE9Qp4z4if1pjzE3A=;
        b=OeIcAEhY2hMoh28a+wkCMW1UL5+iq9oRJH4Sm74k1opu0JAVhqfyoMROkYmqgT3RKQ
         uTGJOsKM5CebPwXgWWPpkrobmvouE0WKWIhxOn/OdiUknkWLsabAsqITrYVc8H46b/me
         YK6wf5PjdxZ4L8jOYJmBzoMj3HRbq9VWZjhWYL930McNcwgRxoveVA6HhIovqgpY/AQr
         84aJHa002IYrO10eNzTcfL2v4R2SAKJf11VwCFFyG7PcOPtTyog+TnX9hAf/4xB9VZpE
         CgHjku8zMYGVd4qrmWGqdxAhefFwbO56yKZOuIMsh+r6kHjatr1QONKvoiceEB4Op1aB
         VwBA==
X-Forwarded-Encrypted: i=1; AJvYcCXaxkRoKTz0FFYIpzWXVrkfn8YijXaOxqUjdHx6gQj5pJyGI7A6wpsxCYzCs0ssvcn1eWyJyO1fWzFzZZ+GYJPqufvTowiurzDAUZf9APnczjs=
X-Gm-Message-State: AOJu0Yx1XdGx5RHCURf6LDhLnsJBPByiIWkWl5ZTg6w2D3aH0jjWuPk8
	jGgezwGUdzB5U4sYzQS+hN0RQnp3zB8+hVO3nlbkgxnEmmWssg5n2uRmhWUXe1A=
X-Google-Smtp-Source: AGHT+IGD8e3r3noDyYD2YIvp2atQuDcHh14YWuoYf1EutnrQXpRjic8pwNHE8h4pntM0COs1kCdDDA==
X-Received: by 2002:a17:907:9722:b0:a59:70d2:91b7 with SMTP id jg34-20020a170907972200b00a5970d291b7mr285927ejc.13.1714632702898;
        Wed, 01 May 2024 23:51:42 -0700 (PDT)
Received: from [172.20.10.10] ([213.233.85.172])
        by smtp.gmail.com with ESMTPSA id t23-20020a1709064f1700b00a5544063372sm181102eju.162.2024.05.01.23.51.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 May 2024 23:51:42 -0700 (PDT)
Message-ID: <498ff366-b247-4586-b02e-5cbfba5927ac@linaro.org>
Date: Thu, 2 May 2024 07:51:39 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: exynos: gs101: specify empty clocks
 for remaining pinctrl
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Peter Griffin <peter.griffin@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>,
 Sam Protsenko <semen.protsenko@linaro.org>, kernel-team@android.com,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240430-samsung-pinctrl-busclock-dts-v2-0-14fc988139dd@linaro.org>
 <20240430-samsung-pinctrl-busclock-dts-v2-4-14fc988139dd@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20240430-samsung-pinctrl-busclock-dts-v2-4-14fc988139dd@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


All 4 patches could have been squashed in a single patch as they do the
same thing, but I'm fine either way:

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
