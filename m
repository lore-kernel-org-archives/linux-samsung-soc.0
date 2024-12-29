Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD3763214
	for <linux-samsung-soc@vger.kernel.org>; Sun, 29 Dec 2024 10:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735466990; cv=none; b=ekxVVcI5E+brppMQRcVwlxe9bauAABsm2W67zKvOtzBwj93iv5jCZSRteRNevgfeU89LiFvZPqC1W5FFEX+4XKiyRT5MVNbxd2yddRB+4wJjIZVo7OKnbVBlKsfTpY4rAux1pwnaQGHL4brXIhMGQqV90IuSKnHf2C0CIURjSYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735466990; c=relaxed/simple;
	bh=MY5gvoR02XQafSvexQUK+I6oQbVwQJQUKQQW/DExqNI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=A8qZ/JQ/Ev3dXCZ+oWcCPWXLhxdp5JhkA8L5fLFIhJtBL9DZpr48pDwCZ12wkfFEs+dGF+kiou0ph8NSOUqE7tq1F5QZf8Ned0UNPHhXupQTuWRyu36jEqYd0ZffFvR05qJP+DkqvRiQK8FKhFLARjRu5frmtyAP1jkkXBTRbWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cSybqazi; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cSybqazi"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-436230de7a3so12800375e9.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 29 Dec 2024 02:09:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735466987; x=1736071787; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IL/khryOY618fuPYLIWJhXwZCcvoPJMIqjkg4oXBPz8=;
        b=cSybqaziAu55OKS11NWt5B3tBq9FWs3JJY2YE0zfsfnXh/2qji3ir29/+PiBjpiZXb
         T+9/XKnIISDUV46GttQzphfCgdJAZKANlGskmTfcwbMKgh2YBVQfr1d0Lm1GJayeyS2A
         wZLf/5lARmiQJ8sruuV0dyZlm0Xshm4VA4KbO2rqE0xxXtEGxy4INHTwKLjMeS4zMTTU
         eHgm/4gWRV0v1tmFPsUX0Petq9Q5tVBephG+ThQoo6Ur8n6LMYPNuAgtyXQFdVnWoYs8
         rVIn75Fo3SU1l5puJNUWsMwXAuutbF4OTRXAjX60NCcMIdG+HrGU0kWe2OQ+jc+yaJv4
         Ch/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735466987; x=1736071787;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IL/khryOY618fuPYLIWJhXwZCcvoPJMIqjkg4oXBPz8=;
        b=oXJ9MG/G4DXSl0V3dhw8q0E2wuUNZDGYTV868HMjdOsGN6OKAXbnK7iGKPz23Zm66q
         aw1bfZct4pWNT4q7vY5c0K5jQg4yheDHaASBN1Hv4tPCg/9oXtWZlr2RQ/BG+0/lmSsN
         t/8k9ZFgnjcz0E84NeQFyK3hP7ll8zp4oBVkTw/FxrVojLOoRif3HaHWN0lKCMsW1lQs
         prtbT9lqRkx5f5jkn/aOw86QxFcXrL48tgcLbpxOyhJAz4F9nbVLPL7AIeXJ3RiZWNeL
         kTyMEVm8GigL8WDBgGO83QWcinmEbpvQwKD290tRzlDqIqA09OPYSQuNaXCgKJjfZe4N
         avtQ==
X-Forwarded-Encrypted: i=1; AJvYcCVa1KG08wHCLWpWSUV9ICZtF0jEcdsIDd3HEsaFjdzGZo/JXsUmW+f6y6vL8RTSPgMSER8l7vJekaBoacnOoM/r2w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPMoVEHlnp2Sr6vmSc7LjQ8H0ZW4YjhgdZZXNKL0QSQM0lwNLM
	FO6Yiz2e5ernaJPHOrmdNVcJD7GvGOYBD7wUoeTuSXjsEyPEYdNbeJyvLsnVqP8=
X-Gm-Gg: ASbGncsrQQNXAM9TBYwbJbfKjoP3ACJO8HaHEhPwciKKPF77J0spULPOh9wq0xnq63H
	j8o9b+wkddfX1MUVj8z/AGd8eBni5ZBv2RaHAKQvm37sigdLBy0GpxtGiGzwYWvVSHWXC4705LF
	lR8UrfiS+rBrA5s3++USn6mMqu8gY8cDO90vavy/bI9fTmrRMHYm7bzuyPz/regDxanVMN9L9I+
	U0f1gdMISgUF+0A04cXiSSDL0YCt2v6rrK/hUcxAVYoUGsV2BeE00uiyQw6gHWQNY4sECSi
X-Google-Smtp-Source: AGHT+IG4cLGqiI6g6J7zatXOGtwFy+9Y2s3YmPVDRuKkDTEQDgLgnySobqp+r3yXYCUk+Z9YqGqDAQ==
X-Received: by 2002:a05:6000:1f8c:b0:385:e10a:4d9f with SMTP id ffacd0b85a97d-38a2213e1f5mr10814535f8f.0.1735466986988;
        Sun, 29 Dec 2024 02:09:46 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4366127c493sm318174575e9.28.2024.12.29.02.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Dec 2024 02:09:46 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Roy Luo <royluo@google.com>, 
 kernel-team@android.com, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org
In-Reply-To: <20241203-gs101-phy-lanes-orientation-dts-v2-0-1412783a6b01@linaro.org>
References: <20241203-gs101-phy-lanes-orientation-dts-v2-0-1412783a6b01@linaro.org>
Subject: Re: (subset) [PATCH v2 0/5] Google Pixel 6 (oriole): TCPCI
 enablement & USB updates
Message-Id: <173546698425.10457.12735336354134436171.b4-ty@linaro.org>
Date: Sun, 29 Dec 2024 11:09:44 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2


On Tue, 03 Dec 2024 12:40:23 +0000, André Draszik wrote:
> This series adds and enables the Maxim MAX77759 TCPCI for Google Pixel
> 6 (Oriole).
> 
> It relies on the bindings updates proposed as part of
> https://lore.kernel.org/all/20241203-dtbinding-max77759-v3-1-e1a1d86aca8e@linaro.org/
> and
> https://lore.kernel.org/all/20241203-gs101-phy-lanes-orientation-phy-v2-2-40dcf1b7670d@linaro.org/
> 
> [...]

Applied, thanks!

[4/5] arm64: dts: exynos: gs101-oriole: enable Maxim max77759 TCPCi
      https://git.kernel.org/krzk/linux/c/ddbf40d8ce4a6b35821d0a0453370ec1422d915b
[5/5] arm64: dts: exynos: gs101-oriole: add pd-disable and typec-power-opmode
      https://git.kernel.org/krzk/linux/c/817473b6ddaf9eb5f2bc7d6dce9fa13a921477a0

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

