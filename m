Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B620207665
	for <linux-samsung-soc@vger.kernel.org>; Tue,  4 Feb 2025 08:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738659058; cv=none; b=VjKVD+3a6bSzrAtKa5ZxNMuClyF8O7hTCbgXJd3RXWqU099D0SSDbRIStFpfEfqhcmRUL5n0NPAG4FuazF5SH9f0wHRYNaO7NzvyWt9eBqWXyu8Hp6AKpxvFkNjGNvq7U4JUGPOwne6mE6S8q9ABfJglQmVe51sSxVUETnCwmVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738659058; c=relaxed/simple;
	bh=kqmMsjbCNiclb8j5uBxumVvyp3UHeWEC2xIcNL1SHNE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=N1bC72L9NZ7rgt5C2D5tKH3Y444XBSkFDoX1oR+7cDRgSxCKWAAC/1SGVtrWPTHR5MEDVWgUVsJsnZBQhhTrAzkGL5ljXk/KyY45SFtysVeB0sFTe/j7jJ7Q1pLK+uMsL79wZdvtnlhS4VX1kwzNqGAQFBNpD0jDSrgK3nYdBGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G3NVP4Bk; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G3NVP4Bk"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-436284cdbe0so8024265e9.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 04 Feb 2025 00:50:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738659054; x=1739263854; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9SL4WrTFt01P5kb4nbA+mR/wAIuzdlMsYyVAk52AYWQ=;
        b=G3NVP4Bk/vFi4d9MZxtyx+0yInbv5O3cVWBtJvGMBI2MhNo6C17PteyJSGezzqNbbi
         U9YtRzwE8e8ZTjFO6b4mSSDKMbA1wtoJzJ9duJ3QXmaxKfiDICxedOeLp4jfFSycNJ5e
         kn6bDBH65MSFzP8YZ01i0dBsxtt9dkZIdSnM7HZiWXSCs/QZIsFlOTRmVtE7We7v4xZJ
         /SzYjbG212KorzFCV1ZHHJUUlBIvQ4sPE42Ie47Px8q1AXkxjNikwwv/oFSpy2NHTITT
         pAUHKvqgHQ7qnP8XcVH6ggC9tQ3jWFAeBhcmEcsQArMsm4Wju/jZ9dEuxLcxgyLtO7rj
         gPHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738659054; x=1739263854;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9SL4WrTFt01P5kb4nbA+mR/wAIuzdlMsYyVAk52AYWQ=;
        b=J5CBhFVhtV96Fjg6qKnPr5HUkD7+h5la9ZWlOuMWqsOCKvyPn1xvhGm0QO2TbYmY/o
         O85OMYS+noBpqWJHnLJw7pmO9kQ/pB2hicgmqXAGWjCkvphRVvEfjcctwjqT5ToTimZ1
         4H4rcav0QO3iuH0jL/OuepCbJP9J+BWJKT3u7eWnxmxuP7VYVr+pE6aJjVR5WfsZqxYM
         JnCL731BOhpOigVGlIrlyOFHBZtBjxjcAoG1ENctVMWFJDX8VfkBpqUfdf6uYt3OB8dO
         HGACXa8ETYvROFC8llhWxz/v/gy9+0+ipTJX/raw5C/juC13bZ/RNu6DdltnMihpQDQb
         vALQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9KwPqCendJmxgj1vNKb/uOgGdSg+Z0S+n8c5kQC4WHlx20+Lp/B6X3Fj9RO2LKMXgOg0KqbziER6mnjzoeVawFg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyO0ZetIBd4NukOXGAjb7asoLVEdrGAIjELYwhGWqroBteWzuAy
	/USW10rEF55X+eiMmEcao430Kn7rIadTFrX+J/aupKMO+aFgI2qNEs6ZY6hzWPk=
X-Gm-Gg: ASbGnctkizPQRJonWzWNrXvASlR/+8Gldq889Bm+KAe8PzZ1Q1Bzp+XCP3Pua2+aBsU
	R/4+XgcDCv5lTHfxyvo73u7vtSStPI3N+NDHD0hZKMVGSYpu+sV9kFtXqA03rm5FG4FuhY3JVOr
	srmdnIM+p9ev8wH7EmB+cK18i6CLJMn7j7BxaNmWAePIIcgNwW+d/G79Pm83QZ++ZhefEz7Ir0c
	wM6yd1pANP0ulgrL2NYjAnx9vXOpqdUVsEBAUVXks7KSyKiLnx+CQqRXab9aAuM6bBo7hKHDXZ+
	g3GswAiZs3f+1pyhJMRuMmM7Y5DrZic=
X-Google-Smtp-Source: AGHT+IEiM4BEwyj9kJjGaATYMGTVdtTyQJ6Gai0nJrlUHfZWE9a3z3Pca5QvAuf1g0u3xA6mvsDd9A==
X-Received: by 2002:a05:6000:2a9:b0:38a:69a9:af95 with SMTP id ffacd0b85a97d-38da4e1c7a1mr784380f8f.7.1738659054614;
        Tue, 04 Feb 2025 00:50:54 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38daf27bbf5sm503066f8f.48.2025.02.04.00.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 00:50:54 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 tudor.ambarus@linaro.org, andre.draszik@linaro.org, kernel-team@android.com, 
 willmcvicker@google.com, stable@vger.kernel.org
In-Reply-To: <20250106-contrib-pg-pinctrl_gsacore_disable-v1-1-d3fc88a48aed@linaro.org>
References: <20250106-contrib-pg-pinctrl_gsacore_disable-v1-1-d3fc88a48aed@linaro.org>
Subject: Re: [PATCH] arm64: dts: exynos: gs101: disable pinctrl_gsacore
 node
Message-Id: <173865905338.26600.2847324274342938346.b4-ty@linaro.org>
Date: Tue, 04 Feb 2025 09:50:53 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Mon, 06 Jan 2025 14:57:46 +0000, Peter Griffin wrote:
> gsacore registers are not accessible from normal world.
> 
> Disable this node, so that the suspend/resume callbacks
> in the pinctrl driver don't cause a Serror attempting to
> access the registers.
> 
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: exynos: gs101: disable pinctrl_gsacore node
      https://git.kernel.org/krzk/linux/c/168e24966f10ff635b0ec9728aa71833bf850ee5

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

