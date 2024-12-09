Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5030E2185B7
	for <linux-samsung-soc@vger.kernel.org>; Mon,  9 Dec 2024 10:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733741404; cv=none; b=t1KVF9BSRd+9MS85Mzt7ybAJKI2sZtXL73e23e8ECYW3DfP4SeLE6i0Ld5gYpVZW1jdj4FTNZ48fdFoqycTltEJq7Ny8c7j5aNcwga7AK7CJf4wHAry+JGqS8o5efwZMW6jfhNmqTK3OPZYweIySoEhSf4BbiIIaBU6lcGgqU80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733741404; c=relaxed/simple;
	bh=FftsgxtfDTEmsXVnEf6EANLKtzGpTZydxJ/p9GsktPw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=GxdnDiuOz/a2U+HvlMmG8VefAQHt8KA40j95S7xxibz5hSY9Ge0FB4ZnIr5ZihfRyG+mCYF+dqxLS/8bc+fwxLTc/vnYhyPZAF7wNjkFla/4sSwKfgrQdOTTb6QVE6Iw1njmBR+RdFrH4ZJ9qta/Jq8exonbQ2ZXZxciqh0BMQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YvcwAiGH; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YvcwAiGH"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-434e9e22a99so830745e9.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 09 Dec 2024 02:50:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733741400; x=1734346200; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fRioCcmJDy8djkmiyQ6PlnLYMCijDL6jrj6MyazB2/8=;
        b=YvcwAiGHxcd0TEUzGpXVC5P7zCmIbxz9Urye04bBoGL5qgyx+uq4+/7xJ2J9411FxY
         njwNrx2AR2MgrFMr10oy4I6AZJwotGV4PBfZq6Z+BzbFwgsWgRleY14mxKERG6cMvBlU
         M6v+twTBJkqeshglty6+MKXWJlQyqQB/XPVmvX3m4HB2hwv40Ww5WJdKq0Oy6qCyUuD/
         0NUxTB/ndU/u/rm6sObn9AdVsJlVhQMPJr/jm76EtI53YKyzMSHRzH3wL1oQA2Rr1RGS
         c31nQ7C/exqDpXW/78ZgoiMkQmQHS08VhMyxU21M6taFmO+dHC9KMCNcMI67Talo5T4z
         GAEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733741400; x=1734346200;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fRioCcmJDy8djkmiyQ6PlnLYMCijDL6jrj6MyazB2/8=;
        b=c6H1eFNh1FWEv/lSWxo8uNbD6u7fLiWG+fSIHXxwoYlWFkq72z8e9A3KVBIOwI5RbE
         i2i8BAI0Hll69mCqQhMmD3lLvRw3aN56+KG0pNumC1XwKvrPm4iD3LPvuP7NVdtXNzmD
         vBkGqlvn4H9poo/4NGygwZnJBRqm3a07tTdNankcnuSCpIBvo5zsEOKttTpxhpyixkbF
         FMJeRHy1ToLnW7WkJYu1A6icp5Fx2aluX+MiKKtyVezYwa3mbgzEiFph5CX5nZQtem4j
         tLm0rsEczcAMU/VTDbvP1+hOz3mqxPtp/hipNLMP7BP7UZYIqM8VM6ruH/SGuhVolO5p
         2WxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaGFtifDdMztADkw6wTvFyflu2KrYXMkNgJHYoCsdjlSg+bHzUU2xdpkfxRc3t3IziO0Jpdkq8Q06dZdfEg0M2Ag==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj84j/WPb8qBEhc76dgAYIFgGiwKz8ak6VSGwpdOIaZeZ4Hy0j
	VohplJUqCdJ2f9mpN3YN1tgG7E0RdUPbA8y5TO2JLLi54dD2X07UsfcRuQFnEnQ=
X-Gm-Gg: ASbGncvFt3AFxYLAqV3gThA+2JFtmEkwZsiYJIJl8BMavoCJOWZapsDCPSziJ70eDve
	vcKf1eGb5Y08U7FpKzOyLq+v8aSz2EDKQ1zUq4Aaz0ubxDMLSZI0GmNbISSLVmClnxKiF8vlIPa
	q9Dcm+OPFjsSIxDvE7T6wwqJxMysgG1jaopqGFLTL1p9c1RJuEcW+HHd9LoQPyAZCU5dQndACPc
	406yFqwJosx28SwT5lZaTVNA0oFm7eQXaaZ7D5T1IsUnH/OytCqtSiylstpwG8mog==
X-Google-Smtp-Source: AGHT+IE/viVovSPI39lIWcVsezgqXa23ODao8hwSq2oIVnwoBrcfPb0n+9g7Mmj6cCGSK0ndX1fPlQ==
X-Received: by 2002:a7b:c3d5:0:b0:434:f001:8680 with SMTP id 5b1f17b1804b1-434f00187bfmr20178805e9.2.1733741400471;
        Mon, 09 Dec 2024 02:50:00 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434ea1ae415sm80301445e9.33.2024.12.09.02.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 02:49:59 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org
In-Reply-To: <20241203-gs101-maintainers-v1-1-f287036dbde5@linaro.org>
References: <20241203-gs101-maintainers-v1-1-f287036dbde5@linaro.org>
Subject: Re: [PATCH] MAINTAINERS: add myself and Tudor as reviewers for
 Google Tensor SoC
Message-Id: <173374139927.46435.9500356182814320037.b4-ty@linaro.org>
Date: Mon, 09 Dec 2024 11:49:59 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2


On Tue, 03 Dec 2024 13:03:52 +0000, André Draszik wrote:
> Add myself and Tudor as reviewers for the Google Tensor SoC alongside
> Peter.
> 
> While at it, also add our IRC channel.
> 
> 

Applied, thanks!

[1/1] MAINTAINERS: add myself and Tudor as reviewers for Google Tensor SoC
      https://git.kernel.org/krzk/linux/c/da9ca3164d1794660d9ad650beb807b9a47fe18b

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

