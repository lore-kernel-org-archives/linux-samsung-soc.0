Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D34127B51
	for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Apr 2024 17:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714411812; cv=none; b=iIuotIA3zPk+XqnmL/3roHZho8+MlFWvFwIlUFL4/wkdYU16teaAhpYLKhV3cAdNn2TKaOLKhvwHOq/BWcWOdRaT7NuWSxgq8hi8ljj3r8Fq9KRuAuVsJRZt6klACDPVHxwu6fQVli8vHvQmDibEBskn4k1rhIzvqK8BerfBTRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714411812; c=relaxed/simple;
	bh=cRkiJUAPzdyGSuRp9yfhNiMROQ+tPMAI9gPTeFbgk3A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=eDpPG5N7GLW2ROGEt4q2Tew/CEoWn9GMh75ebAViaS8U9ODUvml+KskNcSotZxuSOS2m3lI8csUeEDTi8+hUrLhwv7T68pgVF1t/IaS4ONd9TTSUSdMDTHRHG50WbB58mL8/WvOiZr5Z3pfMC9hSuiaOVLxivcleHubNOkEv9Gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LyfmSKZr; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LyfmSKZr"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a58c89bda70so404364066b.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Apr 2024 10:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714411809; x=1715016609; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lKhKqy5/7Ei/RZU9HCv/MdOytLVhH+m1/UF0NQoH4no=;
        b=LyfmSKZrguyPWiMWiEJeS7vRhuXQCRkaOUH/ixA8lUONKjsQOlApj/nZ0VFEa3UwkP
         hDqPqT/ykZRACgQFUr4K1xvePKew/dDCkRzIaVnYoSzSjXPnYszXvUQK6w15pmHMc9jz
         UTpSbBFld4Ux0XPR4MBkJiK/9AyV+JZKtib7+LWaLV+LQTdCGJuzTzMrXm2VSRfyBDdJ
         c1OtYOy1isY9t9Et7WM+pY82uX0FXVMMl9sAMlrXvrLHe0Jx8v7XubFojSG6LdOqj4ZU
         LZb7+Px3a+Mo+qplSk56c2g+iXhNmJS+3Al5rNMPcF/1ssE+H8iDJrqqM/Mngy0XH3l8
         0LRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714411809; x=1715016609;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lKhKqy5/7Ei/RZU9HCv/MdOytLVhH+m1/UF0NQoH4no=;
        b=CLbcPFidr2YdoW0Z7smk40upKZrUkXVvuXwPDgBY6wH5udMKBZP7Bb0W5iBPcNGsp/
         1H8EBpgdYwJ2jc0R3w826flToogsbjVEKxrU8TGrjWapkOee31X9M2WCYxpsvKwdA3FE
         FYB9uhXBPFnpM45zzKmLoSZMyHdjAJYPiebeTEgmj29H0eY3Z9wmvOkMsKd5mFAOYS52
         gcF6sdz+iJhwW7nJndBEk1WIM8/IjnNcDfhDAm7Ql3r988sqTz1ZfF41YK0UdHBUBh9o
         rKc5m31J+EsdSjdX7ysHQd1igxU6nf6/KwQ0OaJUtOUtdDemKFhZWOetQ/pUfxKoJlmc
         5x7g==
X-Forwarded-Encrypted: i=1; AJvYcCUxIM+X3dMdxNxPLJP3v0N85u+5SIXaxawkbvAZ7JHQ+Erv4hwcK/rKaDPefpsioEdSMdbMsxSJk/i4Ct+jasHvZ2WWYMEwVV7P90oty83BQZQ=
X-Gm-Message-State: AOJu0Ywa/qQ52oAdnhIFvizOTw4dkOZqjIs57OuFT2aQ/si3xlyOFt2g
	rKpzjmgqSb3+hYzROoZar0TIYypU0+d1evzTKqlEkR0lVq5dyGOBRI5s0AwJd/0=
X-Google-Smtp-Source: AGHT+IFMCwYKqThp3mwiSf+4+XCuztnSTcv7W1qMoW81GVcGEYxjbTiZBj/6VWTRdTIMLOWAQTjavg==
X-Received: by 2002:a17:907:1b16:b0:a58:725b:a021 with SMTP id mp22-20020a1709071b1600b00a58725ba021mr9532292ejc.15.1714411808790;
        Mon, 29 Apr 2024 10:30:08 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id x10-20020a170906298a00b00a58ed644d6dsm2770173eje.127.2024.04.29.10.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 10:30:08 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 alim.akhtar@samsung.com, Peter Griffin <peter.griffin@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 tudor.ambarus@linaro.org, andre.draszik@linaro.org, saravanak@google.com, 
 willmcvicker@google.com, kernel-team@android.com
In-Reply-To: <20240429111537.2369227-2-peter.griffin@linaro.org>
References: <20240429111537.2369227-1-peter.griffin@linaro.org>
 <20240429111537.2369227-2-peter.griffin@linaro.org>
Subject: Re: (subset) [PATCH v4 1/4] dt-bindings: soc: google:
 exynos-sysreg: add dedicated hsi2 sysreg compatible
Message-Id: <171441180684.306855.6625584588248689841.b4-ty@linaro.org>
Date: Mon, 29 Apr 2024 19:30:06 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Mon, 29 Apr 2024 12:15:34 +0100, Peter Griffin wrote:
> Update dt schema to include the gs101 hsi2 sysreg compatible.
> 
> 

Applied, thanks!

[1/4] dt-bindings: soc: google: exynos-sysreg: add dedicated hsi2 sysreg compatible
      https://git.kernel.org/krzk/linux/c/6d1434a7d95939d21cf300f73040e3e6a02e84f8

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

