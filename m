Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C6D51EEE0
	for <linux-samsung-soc@vger.kernel.org>; Sun,  9 Mar 2025 17:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741542882; cv=none; b=U7Boaqo5MKLIRY3bcgYGIkacOyViHFGeCKu4GYXyYv0A8Znn65GD1Bum68qJNQHUMmbEKm3XiKPIQJ0+oB9RTB+lk2NgtwwKe8CSqLRt9rWT1hauqaBe6BUxfADq841v3PEjZzxuiKsgGyGnsE5GwYHDmLL8C+8ku5zD3h9LT9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741542882; c=relaxed/simple;
	bh=Sjd6eO3hcXcao/UsiuWYpFLSLNgg7a8oNviIVpcaneA=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=lh9u5OzlVSceHrDUYu4ItlKliW5N3Ivklq2qvnkwsN3CuCc8+XMUlzlEy1mCmn1aVGKLTlxHJm/DmRHP/8R6WrsdDR1VhHUoSSi4V98L64u+IsTaByndWhLPrWj0/cx+R17sv9Tce+YcFMEpAKCuKGHwQx15KwNzMf2IlN0D4nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EnPPfSFw; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EnPPfSFw"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-390e0f7b272so250622f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 09 Mar 2025 10:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741542879; x=1742147679; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZAqFx78SArbrBH5Q1+Ilkti3+dZ3JAByQkBS9egtY1g=;
        b=EnPPfSFwJ1Hc2Sg7X+FzpbzbeJ3pcyCsnNzxG/CN6ER+7T2RD80W7vxLVKgzOnFP0H
         1FvyRGCJ2hRWqLlByJh0q5x00hoP0wQxqvbjeodd5gvmzbCFPtyV/EIliTm30tQE+Gn8
         F1vKl3BoQpPGLMpMfZrcgBngphCfsmaUqFKIN39s60YzhaK0nQKbsuZ9oQmhO+1P9VZw
         EEt48TtA5WZ41r/aQfzuARi7bD/VewDdtQU1DKGfl7W1r5DgLybcnD03WanoPpqARyNz
         PDMkUjqBbdCdxcfsphb/5JkVRqh3SnrRJSVpGK382SmIb0jewdvnw3CkA+nzLsjbl72s
         gTog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741542879; x=1742147679;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZAqFx78SArbrBH5Q1+Ilkti3+dZ3JAByQkBS9egtY1g=;
        b=anSXElnHO3zJ4dzP2wE6vp941MMzUaMTe3oLnEFekjeboubIKnhGtznEls+Hwssz6/
         TrXnj/BlpDdY/0XspXNbORxldVzssx927nC4xe+W9U07hdaisn3oF9bhtxyAEPJGqk93
         7wKIowYbZKIJQ82GsLfgVxyFHNSXTaM4xLzG4LrAwhJpZ3EUSuwVOKGA+XZOJwooz4ZS
         DoAo+FLb5/VmRnlp2HQsCmpUym5+U8VDj4/9Z8Hgb8ixyFRz2n7ARfsSHj+9SREUTwxa
         87Jd/GXA4jLKjFGcpy14iiJljN3vNycZyBbX6MMT8xQlWfK4MsTGQzvlSdqAuNOjTmj8
         Lhlw==
X-Forwarded-Encrypted: i=1; AJvYcCVdD0Lq4LoYlNa3fDojk+SRr+152Yx14CgdsomLJSz/EyuFeO84FmaAtlu361aZfbU4U7uPwykFphZbsmF5ndzzCg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwgeHrTrv81Ap6zr2Kp1Zwut3YcnkqZKD2B6G52XClAXAi/EB++
	6jhzGrTa6rK99+YvxnX1g/lvbavrK++1nNzyMFaZkwDodxbLRb70YpF6YanMLIw=
X-Gm-Gg: ASbGncu3bqK3qvbeFUvMY194Ms5oDfVg2mfnqSG51tPXxAQJ6nFlsp+URhuVbBnEqkU
	AaKMDjXCmgTTu7MXaI288s5/+OV13hGrKPSHpUUxnINdDLZpmwqG7DLjzVazvkEt+shXbNu1y7m
	IpdHqoaWJcmWbt/vpVhIGe3vAaIUk0myO38V/z6pokX7XB18sflLTcXhsYOySSmvhgqnS3sg0mt
	qNnNuQMALxsf+hnve6yPBh7m3rh+9xDS7x5FfH+LpRvulrfNr3j8VH/x+1qERxwts4nwmj7EKQx
	wr8570t4AwxZmEXSloLXicBFhZ/l6eqkiJ3iWf7BuE0K2WerAdDRgNY4MPmf
X-Google-Smtp-Source: AGHT+IFYzKEoA/0BD629Q+oyNq4LgcHKydsos0JaNMt90Qxi5qetmVUanZhNd8Ow0nb+R9OCR/6Ciw==
X-Received: by 2002:a05:6000:178e:b0:38d:d743:7d36 with SMTP id ffacd0b85a97d-3913bba4880mr1367921f8f.10.1741542879038;
        Sun, 09 Mar 2025 10:54:39 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912c106a1asm12425578f8f.100.2025.03.09.10.54.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 10:54:38 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250307081341.35197-1-krzysztof.kozlowski@linaro.org>
References: <20250307081341.35197-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] dt-bindings: soc: samsung: exynos-usi: Drop
 unnecessary status from example
Message-Id: <174154287672.7465.7756190815598140333.b4-ty@linaro.org>
Date: Sun, 09 Mar 2025 18:54:36 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Fri, 07 Mar 2025 09:13:41 +0100, Krzysztof Kozlowski wrote:
> Device nodes in the examples are supposed to be enabled, so the schema
> will be validated against them.  Keeping them disabled hides potential
> errors.  Only one child of Samsung Exynos USI device node should be
> enabled.  The node in the example already selected 'USI_MODE_UART', so
> enable the serial node while keeping second - I2C - disabled.
> 
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: soc: samsung: exynos-usi: Drop unnecessary status from example
      https://git.kernel.org/krzk/linux/c/8f299df1b75ad0939f1340182c265de019eab438

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

