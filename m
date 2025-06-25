Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 273E72676C2
	for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Jun 2025 14:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750861304; cv=none; b=kLZ5felxPIFzdT9QPUkk3jA3q5Sp84UlISdPHZ9y3GiQbACM6B27mIpEHAli1I+DgY+KYiqFwFcgfT0JIeFUb9o3LM+fShF9GK8c1dQ2uyum8zeQRXe7T+OEuL9b8GBqQtOc4l7Yitv2+ays2XVTw1dXD9BVyjmHtNGT4iTJr0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750861304; c=relaxed/simple;
	bh=UeR7AlanEE//RWGS4QT9FCi8nRyNju65KKz3mOMQXys=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=jWPclH+Z++AwyJd0Kj0S+0Ey7O+V23B5lj6cfD10ctq9943LxlGp9mOB4qZP1lS9RFp734p6Wu2KkuBvJQ3K9gWXe8FFPiEd0L1RSq6e8RtHBr3xR8kMo60BzNXaMS0mOPrPs3wci/bwNSxwd7nZZare5GROloBq1PCVP4oEWeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QWmkYCns; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QWmkYCns"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6071ac68636so1409828a12.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Jun 2025 07:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750861301; x=1751466101; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+QvC8vYW+AfbB/VDXT7aW0XL4OlqMpYtfCw/7F5yAwA=;
        b=QWmkYCnsB7OqkNL6ByXUVFwGo0cKXTQBOVn2rDS7MEm0CqHXJjvE51NAiJCcaLhAO5
         xdU0TPz3UAdFaGU5W+QD2XOSYgWSsFcCtoVRWwDaVORzrD31bt0Mwez4XJ4TeTsy7gws
         PfiT3XZVBY/vUyRT0RGQXbFy1Oug59roq7I1LSh0dXrKQIdv4ikhon9ixnT5z/WHbcXd
         hWlHEw5SjwqLTyTxGU/+oa+twAqa7vYn1pdHcbtefI4S42YufAOZsXjTMmxOSr9F9kto
         6wX/luMlINCjjwuyPAq3GLPhp+J/vM8d4C/LTH0jq5euVocIer6/BDgw8COrvJxInTxE
         dUMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750861301; x=1751466101;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+QvC8vYW+AfbB/VDXT7aW0XL4OlqMpYtfCw/7F5yAwA=;
        b=MDo/WFTxk3xvjHPbWhVPRAQMO8aZ0/57RyLzaxbmhfXUVebyBKfIXSnXh3v7QXfPhq
         JibFAkkcX74hjL+ZXyryTuJ4AoSQxv5IKRmQbxXwKkc7bgddz+CNtb7psYdIhncNXWA3
         3Nh6go7cBhgOTAE6zYq0bdXXcUjrysGRcq6YBv4As4l4qh4u/JhFE9vjhWD/9fDV+j7I
         wEZ74H+AcNr294LQJG6TclAeIoazqhufo9+XMc+mSVf0yh//eYeF0M8SdbilejFeh7Y4
         ZiAOimHWySHhaobXay8p3KD/hYUs7UHhqp/vuH1MHo/EhoYunTD5lYn4qRF22k4H91ga
         HeFA==
X-Forwarded-Encrypted: i=1; AJvYcCVddDw6+MLtfoWw7bGhGQCNdRpb+3YEkCMt2EMWh/PUrJfxgSzJzTy+WVtGtw9QslvX1GQLk0a9jnVpyNCeF1MYMg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwjwmCzQM89xqBvKUFV0Ex35T5Mve+Ksly0CLKOOtl8rz1qEcYD
	SJbVc8MbvEzXITee4aD1Jwl4T3YKALyi3i5WtOjZ0n2tu4v/Kc4v1+BbcWuJznX+Sj0=
X-Gm-Gg: ASbGncv2Fml0JKn6QILf9txMzvHLH89jvER00IiwUchYQiamAqhIftFUHLP+9a2MOII
	iuntDVpQYBtp3NMPChc1jxxRJbMch+z4cIHVqCBmc0EN82J6llluFsp+ZH9fMpXkVAhBXgnUgDr
	0PiBaUvLzxb/RtgTQBJKVx5pUt/Qh/qBsL6zqjHFKjHMm/RdpByBWBgwTeeRLbhLyMsHYGbFfbg
	cp3vdId9PBosgMMOKJUQI3ScClMLaW+Yv1Q0qedP1WMjrbPmjkX9g5d5mnuzgk4g5GdKIERkT5F
	yhH0JYEmwReoxNiFoznOk0NxhXShvRTqlQm5kIzhpkjK6BxZ6I6PwfndVKmY3x7oqVc6Xuu5X5j
	DfqV8Kyqd79bWPGf0
X-Google-Smtp-Source: AGHT+IFYm10YxIFhCnCipzjlfWjOLtuMr1BPt2912OnJxUKbMSfRM1bD7rOZCEZPooC75oZ3Fx2Jaw==
X-Received: by 2002:a05:6402:4003:b0:608:c773:8b3 with SMTP id 4fb4d7f45d1cf-60c4dde8f1cmr950949a12.7.1750861301433;
        Wed, 25 Jun 2025 07:21:41 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c2f1ae8cbsm2584006a12.21.2025.06.25.07.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 07:21:40 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel-team@android.com, William Mcvicker <willmcvicker@google.com>
In-Reply-To: <20250619-gs101-eint-mask-v1-0-89438cfd7499@linaro.org>
References: <20250619-gs101-eint-mask-v1-0-89438cfd7499@linaro.org>
Subject: Re: [PATCH 0/2] Add support for programming gs101 EINT_WAKEUP_MASK
 registers
Message-Id: <175086130008.117696.12548441312202680982.b4-ty@linaro.org>
Date: Wed, 25 Jun 2025 16:21:40 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Thu, 19 Jun 2025 12:18:14 +0100, Peter Griffin wrote:
> The following series adds support for programming the gs101
> EINT_WAKEUP_MASK registers for the 67 external wakeup interrupts on gpa0 to
> gpa11 (alive and far_alive). gs101 differs to previous SoCs in that it has
> 3 EINT_WAKEUP_MASK registers
> 
> EINT_WAKEUP_MASK  0x3A80 EINT[31:0]
> EINT_WAKEUP_MASK2 0x3A84 EINT[63:32]
> EINT_WAKEUP_MASK3 0x3A88 EINT[66:64]
> 
> [...]

Applied, thanks!

[1/2] pinctrl: samsung: rename exynosautov920_retention_data to no_retention_data
      https://git.kernel.org/pinctrl/samsung/c/c8edb80494407f65a253ea63ffbae3fb831f397a
[2/2] pinctrl: samsung: add support for gs101 wakeup mask programming
      https://git.kernel.org/pinctrl/samsung/c/2642f55d44ce563f227dd9c620eda0dec8d882be

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

