Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDAD91DE8A6
	for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Feb 2025 11:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739963343; cv=none; b=LZi8mbOkzqz7l59CynF3WTt7SKvhSY6h4Vq/rpkewBawJ4kAx9SL/wlw3AnX1IRgyh/a+oFsbyyCQbqCyCADSfy5XUlEXM7Q825ld4bvwcVchJ63OaCBRpnGGou2xzzxLFutkcTJc8WGK3ht9xEvUrsjFtkkV6nHjUt3z1P4GAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739963343; c=relaxed/simple;
	bh=cvlaH9bP1Ejwnm0RINb1NYM/JFKbZqpkIyKiOdyhiaE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=vBolC64Tdf8BCODr78ZB4hyxUSxHpoMUAO+cvVKZDb6IXKmhU3VwVYCEeGGht97RCWqqcBx++1QnHy4XQhcnnn/Uli4k3zaZVHhvui4MAnlbanun6TNUjxDeF5h88/MXE+xN8C7Y7fhy8trOwiUPUjqJ7e1nH8EdhQfZtcrTLsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k2jIb/FO; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k2jIb/FO"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-abb7d5a6577so34122366b.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Feb 2025 03:09:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739963339; x=1740568139; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JIQn4T+Ol8k281C344dwvV9xtdIPcPz3ZnNCTAKTtPM=;
        b=k2jIb/FOxIqoqhZdXiANWaSgiy0MxHKOeyahb5pMBoQ8LaY6qSEd2kI+53R7jeEbW0
         qrWpfHM0nfpo6ftXVprBz/yN70CunrhPouJ86Q6KdZtEMs/kzp6uRSqBSNUCT2p6+meH
         hwgFxb9OQIanNez/irel+s3TYaapkWu49h1ZU40g0vR8EOXyhcFFLEI1P3q520w1+rJL
         kUZ8/3tURLFqs1YYm7B7+7qpG71BqXpihb9lhh/TV3H8Pnk4aXHacgYESSvHLr5WUywm
         P6RJdSCLep/mwWGiKLcmWEEX3fixuHFTugUWxG+e6uioHFvGq+cCjY08D/DlgKd5qtau
         h3Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739963339; x=1740568139;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JIQn4T+Ol8k281C344dwvV9xtdIPcPz3ZnNCTAKTtPM=;
        b=xCQRo+krsKTgR/e+fENFL0lgJwqU3VlC7BKbMASJWdF7sof07wNDXVI6qp4wa5TcFB
         sRmZGO6FhsCUQEOM3m8NVX+F7jz7Ng3xhwbNY2iuDyfBt0aUpjFl+V9WlA79i6Podb5x
         VTKATI182w965KyxnIMdw8uXhst0FWY1u36CVPRokQ/X8YvMTS10bvhU3+HPlQXgBAvQ
         nBH5D0fttLjECrlZMuJu9O6BeVcTsa33ao0pKGjdHhpoYI1Vsbw1D+SmLgB8miwNHhJ2
         1LPQmXPPR0mHVxY1JpwZf3T3dNhFVvjqyehTq708aHa43kYa8dHccd6DPId7FA8vpAHm
         nPiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgzmKlg2hxVRourUCZl+ygaCp4FTZB3i7BQWhmBoTnI5q9AYUIgeXb0eOGVRZSFbtA9Tm6asG9pEXUu0d+g1pVBw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwgOUCbtU83jZoo/n/v58LanG6PIaZ4maYnZjSc0dJ2Zo0srGyW
	5fWBR+kjJpdzmjNuoZwYtABE8wyqDtpXDAaE0meBHK8u74q825Vp2+mhHyfVwcw=
X-Gm-Gg: ASbGncuByo+gO5KFfP6AlkmaRFoEsY/SN2u64296jlewnM0PrTK2wu3oFFhaaZpxocS
	Ja1cyykRJTOhZ6I4GEXSB4S/oxLp6F1ALA1GlteUuLovw0guRsk+/xkOGiv+6A9bLumia0ZebGl
	AAhR8zAKKdHfxpzufJpUj1NAcVDFtQ11MfaiVO5UtIwWNFPpDitzrDr9Auq6kVAsbInukKA087S
	fACKB1H30o6FdqnqKruQmZ4Yt4LkWYbXb4vE35lFmnQfvgUd3RpcjVGkKimjIdn9Fj5wLWxaiiK
	951CoG1NatLjxy35TUV6YW5Cu+nTOUw=
X-Google-Smtp-Source: AGHT+IEe+1BQ8AYZk91y7yXjhMM+ta1+WK/nmzl8UeGC016o3r2DG8gtpQnMR/wNL+rcqmeldzltmA==
X-Received: by 2002:a17:907:7248:b0:ab7:bb4b:aa49 with SMTP id a640c23a62f3a-abb70ab878bmr651662466b.5.1739963339206;
        Wed, 19 Feb 2025 03:08:59 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abba4fc0c29sm475464466b.157.2025.02.19.03.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 03:08:57 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250215113248.159386-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250215113248.159386-1-ivo.ivanov.ivanov1@gmail.com>
Subject: Re: [PATCH v1 0/3] pinctrl: samsung: add exynos2200 SoC pinctrl
 configuration
Message-Id: <173996333675.137445.366892422452609954.b4-ty@linaro.org>
Date: Wed, 19 Feb 2025 12:08:56 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Sat, 15 Feb 2025 13:32:45 +0200, Ivaylo Ivanov wrote:
> Hey folks,
> 
> This patchset adds support for pinctrl of Exynos 2200, as well as
> documents the pinctrl and wakeup-eint compatibles for that SoC.
> 
> Best regards,
> Ivaylo
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: pinctrl: samsung: add exynos2200-wakeup-eint compatible
      https://git.kernel.org/pinctrl/samsung/c/aced1f7b82b1594189be98ba7c51d0a60a4a279e
[2/3] dt-bindings: pinctrl: samsung: add exynos2200 compatible
      https://git.kernel.org/pinctrl/samsung/c/bbdb937962f2261355e48965b631742d12629451
[3/3] pinctrl: samsung: add exynos2200 SoC pinctrl configuration
      https://git.kernel.org/pinctrl/samsung/c/574d0f2120b8e7e6a218d81267f4b543d586df11

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

