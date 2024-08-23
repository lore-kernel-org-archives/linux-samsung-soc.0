Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E272646556
	for <linux-samsung-soc@vger.kernel.org>; Fri, 23 Aug 2024 13:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724420496; cv=none; b=LyMdAMLjypjLGOqmIeZtO16baDD+W9E2KxVVB7/0L7kWRHdk5pTrs8nW1OIuqDSgN9p3v/fy6OFBKHu7jZgc+P3qlm5vHS3y8LfFOF1W42Dw2LSOvjrVMzVbd4KspTXFrYX2jZf0AAhfWEeCy6ot/vjwvIUvqBIwvn4ce0TiJS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724420496; c=relaxed/simple;
	bh=PJaIxgOdV8WYNarq4L6gg4MyoJXnyxUqZQl5qVXDwb8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=i/IwC1QrO0k05+qrl7dVY9q6zCAJceC+LGs6MK/o0KgsBsFLkoEldwhJtpT8/vlT+Vv1qu8ffsyEBLcjZOMY7Kvt3hk/YKEong5TxWyJOmXBhp+fcbqe4zVd14AViTXFXi/WE2DL3K4r4JNvdD9/ZuvoI5bdQKPwEPQ4mZQ3dGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vx6NtFDd; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vx6NtFDd"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-371c5cbc7c8so266735f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 23 Aug 2024 06:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724420493; x=1725025293; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zLXphlx4Jr/wlEp6hPPEJ9LkWbBrVmLQW+HX4IXSgtQ=;
        b=vx6NtFDdT7J6aB0reF6ZnPCxLExWkot4DYQHlXnzCfDs3MjUSfX1Wi8s+4A0uovFkm
         DRZRa3b+OLOAvuqucqPWYJyc1jvis7+IC3QMyCEMELBYi9uQ8zz2guVGbmt8VMmL+7+v
         RyauLWsmFBAxs4X1LMZexMQSVyFrb5ARTOwJoArDUYn4iqChKg/FAIQDDZnpKvj+RRLl
         xh8vJwlKZjOCZZ5oJAvP8bmhma1ZrfG65ITUJd9Hap1S1H6G2gc/64J38pHqBAmYQre0
         QDUYNHfv4ypsvRHpZg3NAOCwLf3TAdgu318nKgcGVA9AhbtgzJMfROJVdoS373AE7dos
         C78Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724420493; x=1725025293;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zLXphlx4Jr/wlEp6hPPEJ9LkWbBrVmLQW+HX4IXSgtQ=;
        b=MJd2mf5i7Oa5BIRlzCyIi+cp0Cca+UiHuocy12a407CgySv6dRzpf5lcH8Gb4TNyTD
         c/NermyNGHIeykONKyYBdeTgyjCs5GnQZ2st4FzIw07NwlTpWfho6Y55gv6NTSyXKjW8
         3d+0geirgrQ9tPUODJrd5X8QzFyIyE+dKYXFHBkwz+qeQgUWkHhgfnpmI8Hsn9Ug1Q8r
         sMBzIlot37x+bo02CtIRH2EGQEeg8aS8ma0VDz50VipielN9t7hGkIEQ0bYmIVFTANXS
         1I2gKQT6HenZRgwBFXziq7z61S3uy8P/QTTprFrjXQSEN/U4MQCXc0mzvUG10aO0D4AI
         5jEA==
X-Forwarded-Encrypted: i=1; AJvYcCXz/Dd/5/YNVSKy8Q4tXheD6HCvH0Ze7QC9LL+HOx/xDkKAmnzoPZ9BJh1N0qZ8PZYLpOzk0YTOWEZQeCC35KQ22g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwCzQJsoWmfvvUjK+SYSR9s6paehLOCJo8O2FA/mKNHyOqL8LKK
	ryM1ezjvgi1Ni87QBR4BcRSkOHXS2Tst4sbU1aFPwYJt2sf/fskrRSOgUmebLJg=
X-Google-Smtp-Source: AGHT+IFAy5TWXluGypKumB4L46fCMYjfuXS/7gcYMZMUIjnPaNZc5SXlvykLSSlmd7HczFCeAQnMLg==
X-Received: by 2002:a5d:6c6f:0:b0:368:4e31:7735 with SMTP id ffacd0b85a97d-3731191ea94mr885503f8f.9.1724420493063;
        Fri, 23 Aug 2024 06:41:33 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42abef81777sm95905955e9.27.2024.08.23.06.41.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 06:41:32 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: krzk@kernel.org, s.nawrocki@samsung.com, linus.walleij@linaro.org, 
 Shen Lichuan <shenlichuan@vivo.com>
Cc: alim.akhtar@samsung.com, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, opensource.kernel@vivo.com
In-Reply-To: <20240823114441.50648-1-shenlichuan@vivo.com>
References: <20240823114441.50648-1-shenlichuan@vivo.com>
Subject: Re: [PATCH v2] drivers: pinctrl: samsung: Use kmemdup_array
 instead of kmemdup for multiple allocation
Message-Id: <172442049174.83535.13112470931201037762.b4-ty@linaro.org>
Date: Fri, 23 Aug 2024 15:41:31 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.1


On Fri, 23 Aug 2024 19:44:41 +0800, Shen Lichuan wrote:
> Let the kmemdup_array() take care about multiplication
> and possible overflows.
> 
> Using kmemdup_array() is more appropriate and makes the code
> easier to audit.
> 
> 
> [...]

Applied, thanks!

[1/1] drivers: pinctrl: samsung: Use kmemdup_array instead of kmemdup for multiple allocation
      https://git.kernel.org/pinctrl/samsung/c/39dbbd4e6778ac5580313ba34409855250633c61

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

