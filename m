Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 337982F83C4
	for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Oct 2025 10:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760954905; cv=none; b=O/XwDny5KQYdhNkSEUuc5Ob39MlShFTHZ1+4tRlhTs52ISFqaY3kyuGcgzjCf648LqgfpMi85kA7/vZup0J+A1Co1gWj2fDczFdaewrKgpYgjErA3bCxljhvzRHrNpICKUnrPTtyKRZ53tVs9h4QpBixEWPJiUxRuVCMKn/AJro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760954905; c=relaxed/simple;
	bh=oA2ElgPBvOiCxkFvL8m89chK28aoV4jvlA52sYjC9wU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=IhiVuXgv7ZhbYl5q7HkA4ybO7GySb2t/p71s/yq5F3bCnvEWEhe4FNEQu7SSoQqSpwlag9VbmtDtkKejF6dE7DnTNhxkxsuQC7ylChcPkIXodhNLjHbTpR25Y0IXpgqDZoegDoOMU35pCBNCg0XRAICcd8j0xXnHLCTQDGSAvv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CtilXS4w; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CtilXS4w"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b47a5a17303so67235766b.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Oct 2025 03:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760954903; x=1761559703; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sAIc6gY01YpxCcQ99z0flPHCre83HKOO57mvnvOjC0A=;
        b=CtilXS4wyzpoU8xJg5k3/lnfxmeGCV6m2HiQzCNiixi8pL6I75nth7u/vh/pbr+G/b
         YJBeXOiMdVLWiTbXbrNqE7PCDQDAoYC7H6BPJjdVAxs7utzgBU2TcZtgjUm4PAQ4oT1m
         /7F3l3GT4ky6GkA6dIeuzpNBKuzEdJTDqEs9BS0Bs893g1c3Ni1hfU3XsMROJiNeqHHB
         kE4khEm+A8IOdN7xzEH74Aa4RmCgYPIv74eqJwVIN6+g8WPndCSi0RVo1i9yAmLzwHzJ
         qb01d7/nRWAMlBKWCRkTB9ledytRRy7x5CwD7bZ8klfcIVcGkyP6DEVr9k0tvgbhZt1L
         k3+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760954903; x=1761559703;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sAIc6gY01YpxCcQ99z0flPHCre83HKOO57mvnvOjC0A=;
        b=DbirItwHXoKYzpOK/4MVdfDkbGz4BUkJfz1HsQ+GixnWHZbTrl/8GDFMS36P3uL5je
         zKfvEy4BsEc4gfwY7cRXLRilNFQ9sRc+MxLXk3ija2eRHlEdbsX6GETUWWrw5/q2Z3j5
         08papQ9tQonj4PcxQrVfe08Rjnp8wYd3SWDEXCnmyeObqZ108YqMNW0PlEYwQ6a9aJZ7
         /3DKcSD4RtXYZFEdRXFPs+Da6Id/bRXo4LbXk3u6b/DqVxTDDdLoySr4+1Eyu4D0h4bd
         wSCe3Vztc8AwObJGS52rYc8Q7s58QjrzL5E3W1QSIyHlD93SNLhdTClXzMw+V6UhgT7g
         EgqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUUKUWr0Wyyh/1W766JTNjpO9lC5qjcdNhM9Ba15MgBC4Nx/a9wjjHATjx6pg0x400eVYViihRHL7d9MWPYhMVwQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZE4fQLiyxUODFaB5k+ut+/whLkF8M/64+uHY/s5tHjquODVVH
	/t94UKqYejCes92fmkG7GvUCRyTdt/EexB2guW5KMGj8ABC3F3G1Dcab/QlheovHRl0=
X-Gm-Gg: ASbGnct1RQDHkKZUEMz4eToiWOv+WWEfB4inG9e3DPRsSHOhwKECcR4cNnFcq5ZYOQW
	XEQCRViols8B4qMBwsIEAfskj2p1uanIQt3nfIEVDFoE3HyHY4w3eJ/Hi8OWD9owHH4dD+YCuFT
	qnxUBwSlVXU+AVJcQdVrv/xjpESf5/KXGQYOiiFgZZCHMY5sp8x4cO82MopD2J4cGl6YLfWODU6
	w+KcjgpNQwGx7dxSllIlPY7HGfZtAcNJCjvhbYRw6EQVvlEen3B5b5wugIBfCDdQj3Efz8xsEtQ
	2cS/WQBywjMp8dPNVtIj0NH/qBCGBnWnzhUtQQVSjBBgHlopmvV3L2aLSW9Q8PjHCjcxCvk4NZ5
	Ca9KqLym3WcBPEuY7vsxvw6RpOt59ApQ+PRODLa4XF7khhFcJl4rMQAHf0ZTuFaAtwSoIkFOPCZ
	JCUPopUenKi/RoBsGh
X-Google-Smtp-Source: AGHT+IGbEPDs6ivtDg6VzwLTuv9vaft0NZuSPujUXbh434PC4DZqXM9ezasAKoGltsR6KlNX0oCeaA==
X-Received: by 2002:a17:906:9c83:b0:b3e:c7d5:4cb9 with SMTP id a640c23a62f3a-b647395aab0mr801507466b.5.1760954902572;
        Mon, 20 Oct 2025 03:08:22 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65e7da33dcsm753414466b.12.2025.10.20.03.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 03:08:21 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20251010-power-domains-dt-bindings-soc-samsung-exynos-sysreg-v2-1-552f5787a3f3@linaro.org>
References: <20251010-power-domains-dt-bindings-soc-samsung-exynos-sysreg-v2-1-552f5787a3f3@linaro.org>
Subject: Re: (subset) [PATCH v2] dt-bindings: soc: samsung: exynos-sysreg:
 add power-domains
Message-Id: <176095490095.45974.5198951258133478877.b4-ty@linaro.org>
Date: Mon, 20 Oct 2025 12:08:20 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3


On Fri, 10 Oct 2025 07:29:01 +0100, André Draszik wrote:
> On gs101 only, sysreg can be part of a power domain, so we need to
> allow the relevant property 'power-domains' for the relevant
> compatibles google,gs101-*-sysreg.
> 
> 

Applied, thanks!

[1/1] dt-bindings: soc: samsung: exynos-sysreg: add power-domains
      https://git.kernel.org/krzk/linux/c/ebd2160ee6ff3e8e4c7b17b45380900307a34b6b

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

