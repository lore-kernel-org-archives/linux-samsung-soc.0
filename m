Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44ECC1885A0
	for <linux-samsung-soc@vger.kernel.org>; Sun, 22 Dec 2024 10:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734862102; cv=none; b=kM/qRWD4mscpp8MnHrKwsoxhbMt/Xk0q49f0roN13427FKUkzllawGs66urZuyTx3uIUwQ+AKhPSkDjYdennhDOpOsnHXP3DLv1AZ0fmD2TB0KI2+ykJXbmEKoPEJjAhi+kCGc3+qAoQwM5Gs7KELj3Lg1ytRNAXyw7qgFrr9tQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734862102; c=relaxed/simple;
	bh=f7qlKwjyHU2R/7epqrorIwViobfnknfYkuky5gSijWA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=p3aeA0s6x/8E1HYCV1iLIGoNqJcLi6D0XnOMgn+jf4kPJDH/4OAnbxhcTBFXzM/ectk/kLYyR0a8AGSCKDswsHY0FKTiVpuIeearlEre8lKbdjsOd2WzW8i89G7uozcbnN2YZmpThpxFvtJotV6ym1vLJcIqMhzpaDUDj87b2m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CLta0Ikr; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CLta0Ikr"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5d3cd821c60so535177a12.3
        for <linux-samsung-soc@vger.kernel.org>; Sun, 22 Dec 2024 02:08:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734862099; x=1735466899; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vKBsYFS9v4iubTvWXqou78ADw4DmyfMOcWadZXgDRNA=;
        b=CLta0IkrHu0ZkmFMoTTlY1daiolc2B/qIolQ8oJC5CBe3goozyNLQ79KdfFzH8lASu
         z+Ok/C5J+8JFhxM9/b5zs748f+Dygw2O55RJ+cLc2YGGl0qwcKEwhh0hRpw1E/Z9jg2Z
         HuzHokiVTdRExbk3WMkgvX8vJR/hLpSnP7LAQ1rbyFfaWkuRdTiL7KBNK2he68F3whzT
         6MtDOQ6EMZMQ3dWRPN9JpTMWAeFC+8FVNDd0VSiBtT5hzHXiX+K9EqIXhKG7TEpxig5/
         QYA+C1Qk9yFaBdtgEX1d41TzLuAJeyL4nfCnpfODFLoj2x/B/NbErwfN/xLqYgZ8jCum
         woDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734862099; x=1735466899;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vKBsYFS9v4iubTvWXqou78ADw4DmyfMOcWadZXgDRNA=;
        b=nGoPdYXbnC4awDIDj7opX/nkROa1DQ+vue303WduBlnX+UQcfw9zFRWVJ/c7xMtMk0
         J4eIOklIFYCplj1xylHwui5pV4The9ga3q6ESBn+w6KCz5lA7LeVc3R/1H4Enskk4vcV
         mRIGBT07O3vK5coUW6Mg/LQIdZrVrTgX02BAz9U8GUemgQ1ihYa9EQTmjp/gdZwx3iTw
         A7w3T0zjnO3bSENTr+x6yoA1nsxOZKaY7DUjS2iGTA7sUHQbyB4T6eciilsjfCRiQ1Va
         QmXMWR/Tb3ypFOkNS810k26uRMvoKLDvQcOQ/L1/ZJojLzFl18rDRA5vdHYB79kC4tgL
         pIBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVObvZqFNYz/QkaG4J9yFJSSO3zT0xWpDsPrQJcKuz3bGUqdX/ssF2hC6dCnCkIjxA7HuZP013wiEP4d36eT7jkDQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwhAcpdYmQL4WIT6xjnJuyDDNj5AOprxEqU5QuMpJkqGyyprzWk
	I3u21p8Xcq18urX2e97/c0o0IiMKNVJpzuytiEMF6eDQiC7HnYV7dsxn4aPL7DM=
X-Gm-Gg: ASbGnctwUzqB1GIHn0ET+7vuLrX7xhhMaF3y4G2rEDSjH9Rq/Zocyz2xGSXP9NOUXNn
	D+5sN6Fw1bekYG0toRR1M2SvQVsRpAK5Cckwlr9+NXjqJGrwIPajt9D6IlxkDZzyItSXUPNUdXe
	7WDmYw6fT8nKUjl52/1VKiCyFmoLCqK21PuFp9pcOVxDcpzyre+sKD3FpVRXSG4E1AJWfv/fewx
	jLnPDj755eszErgH6Cx+N6MVNR3H4PcRPWTMCjAjI0OPdWLm7S7qXzgIa3foUwim2/GhGxGU3Ys
	yGa3aOFsr8ipNoUkZ+RzTxiTkjmdgw==
X-Google-Smtp-Source: AGHT+IE54OW7NxT5X1sBmLNd/D0kS8uVGSQ68xoYttBlaJ2oUwzQEa9S1NxTmY5pBfaOMmcVqyxeVA==
X-Received: by 2002:a17:907:1c22:b0:aa6:8dd8:8152 with SMTP id a640c23a62f3a-aac33559ff6mr278592066b.10.1734862098635;
        Sun, 22 Dec 2024 02:08:18 -0800 (PST)
Received: from [127.0.1.1] (46-253-189-43.dynamic.monzoon.net. [46.253.189.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f015b53sm372279266b.163.2024.12.22.02.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 02:08:17 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20241220-gs101-simplefb-oriole-v2-1-df60e566932a@linaro.org>
References: <20241220-gs101-simplefb-oriole-v2-1-df60e566932a@linaro.org>
Subject: Re: [PATCH v2] arm64: dts: exynos: gs101-oriole: configure
 simple-framebuffer
Message-Id: <173486209717.9271.11039463162908346528.b4-ty@linaro.org>
Date: Sun, 22 Dec 2024 11:08:17 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2


On Fri, 20 Dec 2024 10:32:50 +0000, André Draszik wrote:
> The bootloader configures the display hardware for a framebuffer at the
> given address, let's add a simple-framebuffer node here until we get a
> proper DRM driver.
> 
> This has several benefits since it's an OLED display:
> * energy consumption goes down significantly, as it changes from white
>   (as left by bootloader) to black (linux console), and we generally
>   don't run out of battery anymore when plugged into a USB port
> * less of a burn-in effect I assume
> * phone stays cooler due to reduced energy consumption by display
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: exynos: gs101-oriole: configure simple-framebuffer
      https://git.kernel.org/krzk/linux/c/e32a7fc0b14564f9094f90053c74f500809ddf3c

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

