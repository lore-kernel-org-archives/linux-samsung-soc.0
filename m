Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DDE8257825
	for <linux-samsung-soc@vger.kernel.org>; Sat, 18 Oct 2025 17:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760808012; cv=none; b=tPafOFQzQLGV9pdWk11ntdqCC4e9zjT0E3nA1R9Z5Li5WnrpROqQyDKWy5ceYWFOhztPDF8C59wwS97bQcWuOOX6bwWd/txXTQ5HPNxCb2NpGeTwVAKsesj/mLz+eaAzmPEZGnw3YCAIpamtIs5gMo3nEL7P1Fk2pU1EefsHHSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760808012; c=relaxed/simple;
	bh=XB87FF4whnJCfy3lgSu9PbRU9zmybCibZa75Rgwk9Ao=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=jmeqr7EndcnfsI/G3akcOsIPRnhpkclVkl0oSHDgARggsuPcm2ZZW6/Pa6NtqzfjDBtyXZVLlX2i0h9tG9HW44yxl4FUQkt5ctQnlbV9pJdgw3Ofh6CzXAXvMZOGSx5iEC3hup5h9Poq/NZH+N/eGpxQtAq/fTlMdNhycd7qXiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FTzsMmqL; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FTzsMmqL"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-63becaea1cdso510967a12.2
        for <linux-samsung-soc@vger.kernel.org>; Sat, 18 Oct 2025 10:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760808009; x=1761412809; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yIqv0G7pcNUthypgI4hwrs447IkAWzrBTbrewno8Kdw=;
        b=FTzsMmqLutCbgkCIPEGJ1DwGe+Cfp5DY49RYOXm9BkSxfaabNOUkIPNuhCuYmxwGHQ
         QFZMmej9Mxd3Y2I1fw9vdwBTlgqLuGrv3GcpPxRdfdogtQF0Nubig/oxXalBQBrZfpsY
         IkS6GItkleU0cY5jG84eoJqNkhK9rrH7BiD0DUolPUNMTJSJuheOP/Ial1NhKfxEgMNx
         /gtBP2foIOYzA4TMqJH6qBCUS8rLtIGCBE9nkVfplQzR+V02vkAUSi0Ge0xt3u1Szeey
         sFt/SUkomMTVXdDkGh1YSbJj2YFdLhtm34x371Sy3nR0GQfsSs1+mZzOKaF/uVSBBKlE
         Rp2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760808009; x=1761412809;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yIqv0G7pcNUthypgI4hwrs447IkAWzrBTbrewno8Kdw=;
        b=jD/92D9CJgfZEMpqJmpAbQ/fa50GL4k3Tsb9eLV+V5iHp+/NELPqI52k6KpZggh3o/
         QGy0TesHpiKMRQISC+PpeefVWHpieP8LwoYAnRWLjwTwRKwXXicEM8ghMQR+CCCVxZqE
         MpIvNtFl+DbUKTdNBzUF6QflF5dHQxmYqOq2w+ySc64r8TJadTJOlu/ItL53cmtq2M6/
         7/cxV/JYd3VvIxL9QRxVs6IVR87VAgOwhrhGwaBOsCAsN9+tiqOhFnCvehiZvGOOgpOx
         VoQQKwxmr7MRfHM4EdSuj8ruQTyOFGYj3qdl3n5LepJ2PHmMT8BJ3ytaAhN5df6yk1Yd
         P1KQ==
X-Gm-Message-State: AOJu0YyR8aX1MdxgEYl2o5TZEJHp2XNL2aGh/uJ7s62Q7zU9ls2/HS5D
	2iLAlR1+048W9EJ1eCOU3YtCEpsuTKFp5kCvIXxeTovvGstvi0Syqn2826dOobNSvSc=
X-Gm-Gg: ASbGncsfFJstNaiKzt4mceuA1LdIjaPxnr0TWDkloy5Eg6BSd1cL35stB+5P0PDn9hY
	F2GuJ/TmhEnhPJRk4Kezwm/KKcQY5/2xrrr8E2QZszmWpONiSmeK0yNHsbTDvD1TASyShLcEFIj
	C9tzQ/16d1RWIQibmbg/jOT3EsSGra5/qw2IhrVi6SkJS691t11KFBvZcGmilTfBrEd4qJX8Vzm
	xLbAQcVh+XmhG3bB7wTgkEFcZ2lamFxWw/kWXb4Evt7KmqrRgKTyoOwYUsXAtnUoCoq4h2m4EVg
	QwkK3TCAVjbLG3gpBQyW/mHx8DA/iVcul9aOpKjCJ2lNsBSkngU9PKOGQStfy0RNNxgwG29G9R7
	3bRa4okgsRly6qr+qxG9215ZCbdiUx19ksVbCBrseDjke57/+ZNRMVsuBT1hcXNMKQJyZ0x+cTQ
	BCHL2CKaBYrZ60LhcFdTNCofxV37w=
X-Google-Smtp-Source: AGHT+IGBcdgM0967gN/kR0xVBFnZIJCLjXA3T7puvo+DFTCpYVp/IZYsxwyj6U2svvRV5RCZd8q8fw==
X-Received: by 2002:a17:906:641:b0:b65:c8b8:144f with SMTP id a640c23a62f3a-b65c8b81515mr175092966b.6.1760808008829;
        Sat, 18 Oct 2025 10:20:08 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65e7da2bc7sm280666466b.16.2025.10.18.10.20.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Oct 2025 10:20:08 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250914112942.2604194-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250914112942.2604194-1-ivo.ivanov.ivanov1@gmail.com>
Subject: Re: [PATCH v1 0/3] soc: samsung: add chipid and pmu support for
 exynos8890
Message-Id: <176080800766.47136.15583076071412742188.b4-ty@linaro.org>
Date: Sat, 18 Oct 2025 19:20:07 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Sun, 14 Sep 2025 14:29:39 +0300, Ivaylo Ivanov wrote:
> Hey folks,
> 
> This patchset documents the pmu and chipid and adds support for chipid on
> exynos8890.
> 
> Best regards,
> Ivaylo
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: soc: samsung: exynos-pmu: add exynos8890 compatible
      https://git.kernel.org/krzk/linux/c/a1d5955b288988596f1dc0f953f239e968a14c10
[2/3] dt-bindings: hwinfo: samsung,exynos-chipid: add exynos8890-chipid compatible
      https://git.kernel.org/krzk/linux/c/7319872fe0d4a623e86a0f2747b11d4f52b5a0e4
[3/3] soc: samsung: exynos-chipid: add exynos8890 SoC support
      https://git.kernel.org/krzk/linux/c/aaf9a2f487ad88298d94d32954f8ab9e8ae008d5

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

