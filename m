Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0DF364A8B
	for <linux-samsung-soc@vger.kernel.org>; Thu, 21 Dec 2023 18:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Y6lVslGM"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-5e784ce9bb8so9510297b3.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 21 Dec 2023 10:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1703183399; x=1703788199; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=L6oljuqvAIy93N8zvm81RWXYplalK2qFGzuO99N/A1A=;
        b=Y6lVslGMQ3kuZvcMYNeIChpChmcHjmi8JBtjCzjZEFZC7Yq0CvVAlrTsW0s0rKEXRw
         xwWqa8NV1xqOTKi/94GM5irZTKLP4JOVOTpi3FaiU82QQvh7hDSZFLXD/xe6WQM9A1r0
         x2y9l6bVTUNavwKQrrD9qXlRRchzBnOulbDDU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703183399; x=1703788199;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L6oljuqvAIy93N8zvm81RWXYplalK2qFGzuO99N/A1A=;
        b=aTAjTQfOMB3cNUMHE5b1q75SLl8dcIUlBdjK8vszyZqGACYp8ByLg6/Waf1VCgp4yU
         uWNeyrdgEoJELCkAI2MH/RlwVR1RrjDyGGPUIiosykyte+oROW4923H0vYkA20dc9t+u
         O3e4QAfbe8v8zwQd7B0OAG6/H1rsa0dzcqSNx7oj+Mcn1p8YIGkj6ZBaEKQv5hO+Vukz
         5OUY1lsfqjxavkVU5fD3jSbNRpwDsQBto3qSWfNUxje8BaR3LfEeyB2q0cbNfULHBI3H
         v1mVsFrjCR7YpbaGB3rgVPPs9OVsJLWUx/oDiBUyiTENfcFoRYEQVCZwsu+XPp10ZK4B
         xg6g==
X-Gm-Message-State: AOJu0Yz3nqDr3r8GxR05kq2ZIGn/Jo03AfshGzfvMMdf93anK/BDwx4R
	SCsMF2tpxfXlkumio/RNh0qkeaMc4jE+gqUbZihx4isDsR1q
X-Google-Smtp-Source: AGHT+IEiSrygJN7UsasZNLLekaqrAbeQ73Pp+vOq9WoBQd7rE/7pQR4T8FH5PDn+1E5Ln7pawvXptkWHT22gZYo2058=
X-Received: by 2002:a0d:d403:0:b0:5d7:5bef:e6e6 with SMTP id
 w3-20020a0dd403000000b005d75befe6e6mr818315ywd.31.1703183398828; Thu, 21 Dec
 2023 10:29:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231220235459.2965548-1-markhas@chromium.org>
 <20231220165423.v2.6.I06b059021de1bf6103e60a73211f078f2af75d17@changeid> <7199b7b7-238e-45de-96f1-0f04d0fa718d@linaro.org>
In-Reply-To: <7199b7b7-238e-45de-96f1-0f04d0fa718d@linaro.org>
From: Mark Hasemeyer <markhas@chromium.org>
Date: Thu, 21 Dec 2023 11:29:47 -0700
Message-ID: <CANg-bXD+TVHO3o6f66fJXQ7AtXxPY00TQqjvX2vwk9PyTd1ZaA@mail.gmail.com>
Subject: Re: [PATCH v2 06/22] ARM: dts: samsung: exynos5420: Enable
 cros-ec-spi as wake source
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, Raul Rangel <rrangel@chromium.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Rob Herring <robh@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> You do not need this property, if driver assumes that. Just enable it
> unconditionally.

The goal of this patch series is to change exactly that: to prevent
the driver from unconditionally enabling the irq for wake.
The driver works across numerous buses (spi, uart, i2c, lpc) and
supports DT and ACPI.
SPI+DT systems all happen to need irq wake enabled.

> I don't think anything from previous discussion was
> resolved.

Which previous discussion do you mean? In v1 it was suggested to split
up the DTS changes by arch/soc and add a cover letter (which I did).
Wrt to the binding discussion, Sudeep said the new documentation
wording looked good to him [1].

[1]: https://lore.kernel.org/all/ZYAjxxHcCOgDVMTQ@bogus/
