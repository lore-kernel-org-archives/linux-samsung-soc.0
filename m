Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 413AA217F48
	for <linux-samsung-soc@vger.kernel.org>; Mon,  9 Dec 2024 10:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733741401; cv=none; b=roskfN0Rskbs0ltIRJHc9TPbi5Ze9/yYra6THF8+TgXRmk+asBAHnVPc/v9v+Wp4ALnuYWX1iLydYZH+xy3FGqmUka8ZAg+zvskj8DXIOSd4XVw0Bt0KCFLTuw9P2AuL+ndVs0ke0v0tSiZuTWk8ippUN+VeF9rNUTcakW+mZ7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733741401; c=relaxed/simple;
	bh=PWJY9T7StgCjlU/EoLY1YnAftn+uydTuW14dCopwpBM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mOIFfJcWVXTIaYf2OwHhHkXqcL2OpSFi6mgA0ox9oudbRqdv7Nsc4gonjaTeTlomCvCaX1YdW1mBfnXns3wyga2Csxy1Ts7f1WfwAaoEIybGUsaeI8ghCxYMzurdjzPtXL1YYf139OnWZiyD8Ffo3KdTNvu6LQNg0tdUZhQI6yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d561UqDy; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d561UqDy"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3862e2c9bb5so274953f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 09 Dec 2024 02:49:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733741397; x=1734346197; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HldRgXZlNwLf5fyqIyt/xpE8o9fTDtPf3iGgDTBBGX4=;
        b=d561UqDyIloQiSWd88UWENMh3OZMNLU7vkJOSfA+epcNhPilmNHJFn24z4Dmn3ROu8
         ngH5ypClPJ9PcK01TnfLfDaDjcfLQiBI2ZaEfy+KOx1bfwRNnpIknEbk6g5Jo53m8/4+
         DjHF7n/l2XQtoJxQBF10pAmwdpKGcwMyBdsz1CIpCM5jVkKXKc+oygvbMoN011sPNEh7
         uyTgZodmx4M9izY3Y3CpgrkLRUFBNg22V2mPlPgiOVqbqUR+iHJrXKqxta/u8it5ZCPN
         CObeUNP/nU5PMLnv3ChvPbHKZqkIhL1px+0T0XSIvvxd3SpLnwub2+6ubR2rxec2gta4
         LT9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733741397; x=1734346197;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HldRgXZlNwLf5fyqIyt/xpE8o9fTDtPf3iGgDTBBGX4=;
        b=vlwv0W5xjUnPm+U0lvKHzXjeUQK1cX0OTEZzcmfARwpLs/+hjTg+nEYCIqI6e8N/A7
         5o4iocIpmt7ZlpjPS1GYe9wL2YI3hSEYXNYE5GTq6Yz21UjrS8NRKoUDjm/Klbc0iHpU
         AGVt48shy/htegph978DzdlLbAISKdF/jLDq3wzBZmDx+hoXeO2itzrRON4SY3Uc5UfE
         sR0Yljnnj/8ANo6mvqcuOWYzM1biURarHksRHXTMMckPCRfLk7+cTMIAMeaiVewD29X2
         g9cECSmvBeWqsutwSUloHpXE/2u/HYb8OR+JfqqGsCUmZlIkeC5637Bo45bI7K9PZ7zK
         r8jA==
X-Forwarded-Encrypted: i=1; AJvYcCW2ZZc4bxWmztoSqgoO/eUUCi9OMyOh1LHpu1fPZAkhss0bLDZMzuESE+LjwCQ3I/kctPWkMbJ/FiEgMRI9h2TnCw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzlNqSK/EUKAYhgZHWzGdVT02hvqUtmYxDv8tmlGIPengRA8JTP
	ZimpAxhvcYkKYjj+RQpI6m0KC5/+LGekUUR32pWw1RYL6ogw+10Kl6NEBnUgHy2xi2e009FQCQr
	t
X-Gm-Gg: ASbGnctgIhIDhxm5g0hciy1Ab5Pdg7D4McKY8GlZCOuW2MEb+NG07xOaDcNxuxkPd9t
	rQ3c7IFrhIEeId162bXwnSwzlSA6Z8GS7ffNSqQC4pR78ucs8In8g2aUjRsPvEWERpJZE7U3HMi
	iK3o+05DTWh4TXYIK7hhf6pvTW7qX+kHi1gD9MNvT2WJaskMUvHazhjxpLe/t7Kpnw4WIFbsgpf
	9Z2rsxh9YlTV9O4UkWEaviqnU+pQdqzMacqnOH8WtEXGfXmDhQ7p0FgySQ8YdPo6Q==
X-Google-Smtp-Source: AGHT+IHxRoXs2saioOScD36Qx8G113XvIArop5p7MfwoQX5UHxDTuYrweuCHNEqAi0Kh1dl9f33ubg==
X-Received: by 2002:a5d:64ec:0:b0:385:ea11:dd8f with SMTP id ffacd0b85a97d-3862b368a48mr3146673f8f.7.1733741397649;
        Mon, 09 Dec 2024 02:49:57 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434ea1ae415sm80301445e9.33.2024.12.09.02.49.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 02:49:57 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20241204145559.524932-2-igor.belwon@mentallysanemainliners.org>
References: <20241204145559.524932-1-igor.belwon@mentallysanemainliners.org>
 <20241204145559.524932-2-igor.belwon@mentallysanemainliners.org>
Subject: Re: (subset) [PATCH v2 1/2] dt-bindings: soc: samsung: exynos-pmu:
 Add exynos990-pmu compatible
Message-Id: <173374139637.46435.13275133164438214681.b4-ty@linaro.org>
Date: Mon, 09 Dec 2024 11:49:56 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Wed, 04 Dec 2024 15:55:58 +0100, Igor Belwon wrote:
> Add a dt-binding compatible for the Exynos990 PMU. It's compatible
> with the Exynos7 PMU design. It handles system reboot, as well as
> other system control registers (i.e registers for the USB PHY).
> 
> 

Applied, thanks!

[1/2] dt-bindings: soc: samsung: exynos-pmu: Add exynos990-pmu compatible
      https://git.kernel.org/krzk/linux/c/33ebc0fb73ba8fabbc1c8f581f7f512a0b277645

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

