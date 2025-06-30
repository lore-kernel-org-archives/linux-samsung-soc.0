Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F241020DD48
	for <linux-samsung-soc@vger.kernel.org>; Mon, 30 Jun 2025 06:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751266606; cv=none; b=WY1fpnkuNmYtWeA/LT4nf0vHWGqOGnw31+7DqZGgavb/fEop2fblLunK8U5T2+stqXpL+6QKjnEVpp3MDEqbWh/C17YcT0bvhYfjsRoMiua2x/agmbjEX2CjNcxUB9+q6Mt0BRYVYmYROvyv2hw85OyUDOK8d78dy84JT+Fd+xY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751266606; c=relaxed/simple;
	bh=/OJdkfuxyOzXu4rfQeCVTf6S+zbG5rW+/0MB2W1q4xA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=A/LHusRaeFxJKfJNBNLy6POVrs3Op0LPLgP3ZZQUn5/9Y0QRHXKJpC+IHSU9vlGvi1i/6sylh+8PyHvlYv/xplSkohCFcKeiE84/pPAzhSuTSkoNIdprjpTla2jsQSDBZU9LT9s0G6eLTc1OO3JYr+zeH8tsIkKRuayZWRp2ys4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JBG8t4iI; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JBG8t4iI"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6075ca6d617so682491a12.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 29 Jun 2025 23:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751266603; x=1751871403; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EbcEwlMPoK+8K0Wa3mxW6OSQ+8uP+x2nz1ulJY9SlpQ=;
        b=JBG8t4iI25BxkvJp+pWQ6xcScJavjgT1kotIUk01K4W5MRwnYKZCuPPHGFJntOfgzk
         ibPosLZOXsD3gEewKwBRiqBSHhGI4JIBYEZz28pwK9ff0X9nrvviOKc2NX9UeQV/ANzr
         +dLmb9rK3etYC3J3/oBoPZI8fcOUDl5zapzgfcQ53ihjNka+vtvWedcjRF6FzjfWgUhC
         7sb3RBXUlRSF3LGg/97Rd7IknVJgJhSth01NoNBntmhg6zuOEjB54mWTQsRBqzuVHy8p
         JHmWoEnNTXMLMvveKG5whX+WtSivMbBYE63JIKBNdruGkFP5xnnnHe6wboHR1+E2iHZn
         DOfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751266603; x=1751871403;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EbcEwlMPoK+8K0Wa3mxW6OSQ+8uP+x2nz1ulJY9SlpQ=;
        b=iUP9Q+qbmMubJOGcgm0JbsTav1lhNXHQRpt99eGwyeiZLaUGKgDEIYxwdU18iFOees
         HfItfMGlawii37Z6dMPugKrqJWTy4BtPahgLMvdtCnKpSuMs65AlUYelLgJbNq93xmgh
         Zl0F3FURczt9021Ic7hqOAfrSZjplnoZ/nO/Umbfh2f1bEjseabO2AwWl0YrZVTnhmfB
         Z7H02PlD3NDLB4UgX8xXi7eGG/d0NEylyWLTPsBzYI8yh0EtlcWZuDhep/6bD/rWRTAK
         AXg2M3fs8PRWTqXcN6qAZEIvIhbj/lU74impTRvGHrok2RnjphDyrlJ1hTDiAJTLTeq7
         Htjw==
X-Forwarded-Encrypted: i=1; AJvYcCUhCknFP2NRlQyrQ6PDq/wcNYD2TdOQT56C2jINRR0eHw+HMWt2VlXQjz6Nc/xTBNCKXbNLn8A3N6jhJiRFYnOwQg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+V1A8OH9o6H8ZKEceqR4Zi3tEV/qWT+1idjzh9Nk5vY/u7b+m
	TxiCWSNGdEsQIc+XLDVbjLlX7MbjzWCNpfa68h2bOsZXNXZ93mxEwxfFah1/MfBrFlQ=
X-Gm-Gg: ASbGncvptS9V9Vbb2i8rTtfkwIWqeDZvQz+RU7puGACakMU/YOdmUMvt/2lnVz/vFra
	2z8ZOpqUOPYVEo5dlpitadCVAKMc2AAU07TlWXc+gfrsvSgG6J5Dza+oN1OP43zZdBq+opGX+fL
	lU+CAepJ2pFXPnBbv0XF3/pRc1uRSgAn3MIH5/dNPWo3ZUKHVzB6LEEKdvYIUZhuakw1qwcVOuj
	oGzG7ZROFLq1eKqwtKt7ZndR0xeLa3ocbLbdqfXHqHt91kObXm+2/hVlS1mE5T2aC4c8xb+EcOr
	gCLbmyyKToKJ4e/kCGK3H1vC/lRqmh2ozer90BePtIc1akh2tKdRvhS0u3VexsfWaBzXRp6z+tv
	3
X-Google-Smtp-Source: AGHT+IFP0wQ8NEUxXNo3uWDGN4V5O/Owg/HraPOpJkav6IiJwSf1ANe4iXPDIZitMnEo6gWmmey5OQ==
X-Received: by 2002:a05:6402:5023:b0:60c:39b6:69e5 with SMTP id 4fb4d7f45d1cf-60ca3de328fmr2215955a12.6.1751266603199;
        Sun, 29 Jun 2025 23:56:43 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c828bb118sm5368960a12.2.2025.06.29.23.56.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 23:56:42 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20250627-gs101-reboot3-v1-1-c3ae49657b1f@linaro.org>
References: <20250627-gs101-reboot3-v1-0-c3ae49657b1f@linaro.org>
 <20250627-gs101-reboot3-v1-1-c3ae49657b1f@linaro.org>
Subject: Re: (subset) [PATCH 1/3] arm64: defconfig: enable Samsung PMIC
 over ACPM
Message-Id: <175126660170.23797.11112517547521144221.b4-ty@linaro.org>
Date: Mon, 30 Jun 2025 08:56:41 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2


On Fri, 27 Jun 2025 14:29:30 +0100, André Draszik wrote:
> Enable the Samsung s2mpg1x driver as this is used by the gs101-oriole
> and gs101-raven (Google Pixel 6 and Pixel 6 Pro) boards.
> 
> It communicates over ACPM instead of I2C, hence the additional
> defconfig item.
> 
> 
> [...]

Applied, thanks!

[1/3] arm64: defconfig: enable Samsung PMIC over ACPM
      https://git.kernel.org/krzk/linux/c/a7d7aebed4005b9c287f9bd9d22c273da63c9028

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

