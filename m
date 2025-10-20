Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC5FA2D949A
	for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Oct 2025 06:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760943355; cv=none; b=oeOWQvQIByD5Z2TkwUNgrFkX1XZtyunZouhdlyglXR2x8+sfjzzb1NXHfGMZztmaIg2NqqbNzd1KmvGYyGxJJNSpKD65WK4Mp+cXRsO3I4ELteNZSfB4sk3O5byp6oeyPlXdnGvLNjHCmCF20DhK7gd0V7hw7tsg9dqs1oQx3pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760943355; c=relaxed/simple;
	bh=IKZ1q6LfIYFaUJY0dyFQno0dTQoazdrIq/AGAGI3qVc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=U9C1TBNBkBqcWmL407EufnXPbYzrXlgP3lSTbDoB8zmW+NAXSULIrLWXd20yBbQ9oNvoiwatr8lNTVCl0JVTplskyv7brQj9CoqfJlyxYuWEenLlHLXiD0yNQ8ndaTYkHq8deKPXiqIkuiCu3HrjLlhZLqTht+GMLN3VvP7CAro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s3C7y5ti; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s3C7y5ti"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b3ce040db85so61753266b.2
        for <linux-samsung-soc@vger.kernel.org>; Sun, 19 Oct 2025 23:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760943351; x=1761548151; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=06zgkTdvLdS4MNITPMlUpp0m9/L1LkTY9remEcOcFr4=;
        b=s3C7y5tihsoPIL89q5f/2OMvqHvqK/8wDNfPkGjWu4yawYC4cTTA6YlRFkRo9B9qEr
         rmmtd1ylbPvBpO1JatrK2Yp1DCyWGKkjbvQdguyLiy5Ft2J8L8HMb3AjYX2sYVD7ptLN
         J6QjQ52MYQPKDVOJS4KBX2ij3v+sFHL+YfynPsNY7gtT77FPEzPYmAJcu9Xcxh6eIlwg
         ++xpJBNojPz0wUIaRZZbBQKqlP3p4NsSTOKc7QzrL1KDerc0l0USM2yoWao0X9pzAiEu
         TvvcB1ODyNSm1uJ2cuymCJlERI2D5l6CvRfAbjAzvDCKe1HygsJo5lbYgSJwhpprYpvC
         AtbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760943351; x=1761548151;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=06zgkTdvLdS4MNITPMlUpp0m9/L1LkTY9remEcOcFr4=;
        b=CFx3WEfHMUZb3AXoX2sjakB3iDvrLPd4OYXPs06JT1OJ4t7yG3skb8Syy2hQL21TpO
         VcQKX6pxiE2cnUPt81kRCwYZ7t1ZSDlS8zv2OGjW6hl2BZXE7sggHfeut7T34eZodVI4
         8LedJj3TfHuwweNeQGzPLILxHFwesuoW65yNysrc7xfDhybhGhe+i9GouiBk7PMwn2/D
         AaEDMCsi+SLPaOuDRHkK9rpUzJmFJJygI7nOFKFhj4+JkaFwoKXb3o3axATQucOcTZm7
         KgnENh38rhxeG8VgHLS5qzVvWVHyyqN0Bs6rXzZ0wyCQWelaZmLq9Xp6vVUZiI83RhYN
         8NQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVg5782GcY0O6gIvDKQd+MwPhi5cu5SAXdkGAq3BZR8aEHxvVyq6Rtj/vpof43gQAilR1HSL/pAz1hf8a0E43DkxA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwPZzYLSmXv9RSxbaR1SkOplXEiaw7WQAY4BoyiKlzL61ny8IJR
	z+B7ZQ+0KCT2zFPbS3L4LkDY6gpn+qMBZLcsWhs8UeXyCv88jMkHMuwsyQEK2PkBVyI=
X-Gm-Gg: ASbGnctUK8sCVDmiJARutRNePSSvdTBKaZsWjZxuOH6qS9iU7b9DQ/6kgoRNY9zihZ2
	Cp8ErixpHkHqg3ya+KSvhPozGNAijDPoIfj5ohd0xb5V6Rt7xIfISS26YUkXHW7w5Q0+MOq6I0J
	buI76dHwq/RQ/yKTnkWy0jMOdzfh76cu0U92d7MbTnpWaT84oGhXVS7fz/LkOKwrm42B8ROuOaK
	06CT4aFzkGm/KHuf4d9XtF1A5zQ+tum1g/4pgK2n0UHa3se7S/ZNpHidAyCZnNG+TCm6iFqwGFL
	8+sQhMJxvWpyq2pwwOiQQz6fLvWFFV1SAWL3oYJTUbCBJ29KM1o5VbO1iikeSppVCh4KC3zU7uE
	QEMdKoskCaRIgkGFnRgoiZx/LEmuXts758vhrWLaROzohvWQTVN2GjZAQyHkUGORbtuci9RnD7D
	cmU1F/mfM+G4dCnZpKFx/3KZGWA7M=
X-Google-Smtp-Source: AGHT+IHAht6KxB0Ngh4X743mU/9uv/8gNjvcOQoHdUUnr/RK7iqnks8KTRJG0OT6ymzSEGD6XZTvrw==
X-Received: by 2002:a17:907:7f8a:b0:b50:891f:66ae with SMTP id a640c23a62f3a-b6474639388mr840879066b.9.1760943351216;
        Sun, 19 Oct 2025 23:55:51 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65eb036a3esm711731466b.46.2025.10.19.23.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 23:55:50 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, willmcvicker@google.com, kernel-team@android.com
In-Reply-To: <20251010-acpm-clk-v6-1-321ee8826fd4@linaro.org>
References: <20251010-acpm-clk-v6-0-321ee8826fd4@linaro.org>
 <20251010-acpm-clk-v6-1-321ee8826fd4@linaro.org>
Subject: Re: (subset) [PATCH v6 1/6] dt-bindings: firmware:
 google,gs101-acpm-ipc: add ACPM clocks
Message-Id: <176094334888.18498.257368855953115301.b4-ty@linaro.org>
Date: Mon, 20 Oct 2025 08:55:48 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Fri, 10 Oct 2025 12:46:31 +0000, Tudor Ambarus wrote:
> The firmware exposes clocks that can be controlled via the
> Alive Clock and Power Manager (ACPM) interface.
> 
> Make the ACPM node a clock provider by adding the mandatory
> "#clock-cells" property, which allows devices to reference its
> clock outputs.
> 
> [...]

Applied, thanks!

[1/6] dt-bindings: firmware: google,gs101-acpm-ipc: add ACPM clocks
      https://git.kernel.org/krzk/linux/c/83c4e3c39b2b55afe56ed0d14b93b5f219350c81

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

