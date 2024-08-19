Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02E2E1DC488
	for <linux-samsung-soc@vger.kernel.org>; Mon, 19 Aug 2024 19:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724097357; cv=none; b=FRK0UYzugEPLfB+cb5TvS6FuOUOPFRlYyP6Fy96iEa6RPB71uB07+L58EY7w1MEbeFKWBPiSjuRkAmhLdtvn2QoMAVBjzHz6fpChgss26JJ0Ll/yNmbRIlIXy/18yapc2bwBuF66zK5qgvwW/Ngt6hL/DUMNUfA6ZwhY93Y1Qmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724097357; c=relaxed/simple;
	bh=56kHQwtpg1lPKjewNCAFNUEpIF/ZSEbFuo5zwprX+pI=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=fH9Zs5UMDGxBWaBT8EqzatTj6L49wmNIWikaLBcronQLHdoV3to4cmerB/dQaMG+jZfnSCqrNjYc/nAEAVC+XktKEvjmR5mfxdaSjbvz/tS2RKKgOagpna2LV0glGkoplvvJy9VFejm1o+2rjjJB8Qr0u8MdPGYazYtKDnuSdyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZPB7fugQ; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZPB7fugQ"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4281faefea9so37041375e9.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 19 Aug 2024 12:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724097354; x=1724702154; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1SIXjnL9/zmUd0fcfye8I+jXnw5Z8DSrvcZ8Np3gZyU=;
        b=ZPB7fugQQcIjo6QSAXEgsjT+aitpSEJ7LdI5r6MBul+RniSRrmFudM0oN7w8gd0dwC
         dt8ulzKyDrdGLDde2FG3Z5higKjodONQ799xQeDVaXng/SJRqJ7nWX3cYQuGukqhKZXu
         lC5GdXDLhtxg09stttbqDAQ/ifN8RX0O8MDDhJysYL3Ls2HLkZXxzl2Xve8TT1o19GUJ
         WvWMS69MvrIPrWsScLUeC18Ptc9fYiigEoNLJlULAEEDEREs0jGRrYTJ+s7NQsYCluzB
         7WGsqkMd/JCxb9SoCVi3dMVLR2HMLW/bNR+WtJPS3o3jgr0D0Nvl6oN4JH0mR8ylk891
         AZwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724097354; x=1724702154;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1SIXjnL9/zmUd0fcfye8I+jXnw5Z8DSrvcZ8Np3gZyU=;
        b=mVLHgDp0zHrWLEY9CQ9Qp4dZCFmZZDb6lSxJp78dLAxhdz2OLT5VrhJw6n6NSGnuZd
         3+dSy7tEeVqFkAaW7tmKmtsWfG4vvPTQw3QMYJlodBHfw++rrP+q3xoCikpISrdGUbCT
         hn9pB2DLij7O1bg+GR6sKg+vlir/PiaHlY8kvuiSn6ZgldhUn8mXurc9uDSc7y1XrvlS
         b9LDbBb4XZ5Z7faAkO0JcZd2tORGOZW66lMIJ6J9WvWPSrXsvBN8CRT4aaKPSe//FHDd
         dWkeMXr81htngtR9CpgT23eg6JzEAHxsmkDb84+ejAKoE7dIHPyaSh4EFoksXRjgHrFM
         2EhA==
X-Forwarded-Encrypted: i=1; AJvYcCUAcQqDsNj0zkcYUOY+aelEIkgQ/XB1xbUAyRKVNH4pSjH/W1Y0eIQYJfDD7RWvsbyvItjd7RiEeNM7YnqjXTOAPo6QOoRrflgZTdPoGfBA/AA=
X-Gm-Message-State: AOJu0YxIQ/dYJpOxKWBlvuQHX+vZ0ASInqsXjbLy/knQ0dHb9/tExjvi
	Coww2W7N8jBccBpeLO3TKcJKxoa5D/zi5XKjopo6bsibAkh7Ge3i9Kr46Gk9lvyFvDFYdEQOEWt
	P
X-Google-Smtp-Source: AGHT+IEIMesZrsjAsrBCHt62mqeJkbFhD1Zoif7mP2C75jr9Zqo9nsQfgVItQh8BA+hL1eweWpL7vQ==
X-Received: by 2002:adf:f54e:0:b0:367:340e:d6e6 with SMTP id ffacd0b85a97d-371946a330emr8076461f8f.41.1724097353863;
        Mon, 19 Aug 2024 12:55:53 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bf0b0cc99fsm172687a12.49.2024.08.19.12.55.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 12:55:53 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240818172804.121666-1-krzysztof.kozlowski@linaro.org>
References: <20240818172804.121666-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] dt-bindings: samsung: exynos-usi: add missing
 constraints
Message-Id: <172409735248.112951.16161782902762535598.b4-ty@linaro.org>
Date: Mon, 19 Aug 2024 21:55:52 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.1


On Sun, 18 Aug 2024 19:28:04 +0200, Krzysztof Kozlowski wrote:
> Properties with variable number of items per each device are expected to
> have widest constraints in top-level "properties:" block and further
> customized (narrowed) in "if:then:".  Add missing top-level constraints
> for reg, clocks and clock-names.
> 
> 

Applied, thanks!

[1/1] dt-bindings: samsung: exynos-usi: add missing constraints
      https://git.kernel.org/krzk/linux/c/84236ed0a2b1d40a0b72e8dde4b18d641263f5f9

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

