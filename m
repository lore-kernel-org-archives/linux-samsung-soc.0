Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1857F20766C
	for <linux-samsung-soc@vger.kernel.org>; Tue,  4 Feb 2025 08:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738659059; cv=none; b=W0ZPd0OnOKKTunduw300utX6ozqdBLO7j13spq6Vc0ZWWLzzDzpml8Wev6BiPq+/JrmAE+AnBn8LFmYYv56UBGHBqSz//Il/mJnljJClkz9FHYDslPfzGwNdJFSRkDEP+5EIARAv8aeigSkQKralPkXB5ROTsYYCb8QW8PyAiU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738659059; c=relaxed/simple;
	bh=1Ycwyt/5fAWWZEZs5FhLsYPnTHEm+vCc2lxvvceXYOk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=hiXQjo4xSxkVgoG7H0/P1c/WK5m3omXgg+T78bHSEiflmwO+f5PVFkUr3L3cW6U1/gzNNoGLn8JQXYUZG4kJSTKy+mMmc65IwlyWIk+gl/NrpALuTIyxVU5O0wxX6ms5J9vZmDgS8fP+XSZF3A37hKiH9gQBLr7oVVu2qLzoY78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=px5PMI1D; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="px5PMI1D"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-38c62ef85daso256008f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 04 Feb 2025 00:50:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738659056; x=1739263856; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jpjq4HH/L303d8hbOgy1GctH27ZSA0LF9W5MJwsB/1w=;
        b=px5PMI1D1bBb/KE/SH9gipn3mCjgEDIFxG268ZBW/1oNMfeJKhRHHbQS8A9LbCn+jD
         jDw5wd57uzraXDeriXJzv8X/pYd41A66TS878md36497UTYzzzPTjqBbqJN5SsGhdafC
         ndwiArqBuOAKyJc3skE1ffjc1iVg3PEpnmsbUp2BfsNOKOgiMU2tRsgGlXiEw5/UGPTZ
         9esqPdgoAr0tTz5ib8VfoGIpbD+r7ufkxvFBid5CyKh4ho32dAR48bt/Kz5UdlWmXHRo
         iMMropXEeuEug1BRn7qcryKJLIOCol9YXST6UHy31a9Mmang7F3lEuZ7tdfifdIgzQq7
         SH4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738659056; x=1739263856;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jpjq4HH/L303d8hbOgy1GctH27ZSA0LF9W5MJwsB/1w=;
        b=jxBdc5DX0IA45WmbFeo0TMSphCPYPmM7n31Wu7i9cKFO08Edw8lu37vnxbibyat/2H
         UjdvcMUX3EyyxnaEKgGt3mT4O/TIItNm1ooiJIYcGfTLjL+Ic0YhMXXtk5p1xJFwbU33
         Ykk21xxjuUpzuUuHwgKfTyPDNVs6no/LWEi8oAj3AU6nqxAV3ObIvn+BrjF6MzH1UaVb
         +1RA7zNzbW9PpZrXGDMcRThFhduV25vGt3H5rEnZcPn1mz9k59L7P0bpWyGOImn6USid
         S8W9IAWLFep8vsqSzM/iQEhkic8IdF1nUWTGW4uC2bUmg+IEOrqqTJB6Y9r5aVDd+Yvb
         y59Q==
X-Forwarded-Encrypted: i=1; AJvYcCUjGJDjwfDdsSrvDkwPYrVL08rTd8fVwaXIxN55l1meaJBtYTfbTbQ40DLDxRRh9El72Dxu564TuDq/Zf99EB/QmQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZB+hr64zgoLh/sxfXHCgB/aQREEjtO9mByHArJg3YaoJuvckW
	8Gb2sCLaMjkvnjsDZ6ZeyqRgObEk8pqZLNN6o2zi4KLcLLfoeFPZs83rwLbV5vQ=
X-Gm-Gg: ASbGncv35pR+KCZB6uV79aac+0ttgxwE3BYacYwLsoN57rdFrkHQDQgx2hMFr3Kf5q4
	Em5CSYsDsiycAk6l1GGbw1qJ6IP2ZAexEyxshzYXj2PDU97FP0C6NnMXXHOjPOfn2bnm4FvQZFz
	Hbl79CrhuF7J5ANVgapSTduLF8ERcSasDatsdvyb5msWvkLurhhps8kijhw3TvLhP3Y5EtvqsM2
	OfOIGKbjS6sOy/dQcLduTmY1vp1Jm9i8yKJ15mhVTVC+0ZSIl10Z3oL1WZSgNk0eIiV+aFngt1W
	i0QBCQQlDM0zoK6+HHBVXpYi3sp6ZW8=
X-Google-Smtp-Source: AGHT+IHdiae6H+/UVJL8cfd8QClyqaqjeHMTsfDKILCpxZ9f0zfpd+1iofPbuWssQnGq4TD+3TOuRA==
X-Received: by 2002:a05:6000:188e:b0:38a:615c:8266 with SMTP id ffacd0b85a97d-38c5a4ac5e1mr6208751f8f.1.1738659056201;
        Tue, 04 Feb 2025 00:50:56 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38daf27bbf5sm503066f8f.48.2025.02.04.00.50.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 00:50:55 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
In-Reply-To: <20250117-gs101-simplefb-v4-0-a5b90ca2f917@linaro.org>
References: <20250117-gs101-simplefb-v4-0-a5b90ca2f917@linaro.org>
Subject: Re: [PATCH v4 0/4] Google Pixel 6 (simple) framebuffer support
Message-Id: <173865905488.26600.14592491106010269073.b4-ty@linaro.org>
Date: Tue, 04 Feb 2025 09:50:54 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2


On Fri, 17 Jan 2025 17:09:53 +0000, André Draszik wrote:
> This series enables simple framebuffer support on Google Pixel 6 and
> Pixel 6 Pro.
> 
> Even if simple-framebuffer is deprecated and DRM should be used
> instead, having it available in DT is beneficial for several reasons at
> this point in time (the phone uses an OLED display):
> * energy consumption goes down significantly, as it changes from white
>   (as left by bootloader) to black (linux console), and we generally
>   don't run out of battery anymore when plugged into a USB port
> * less of a burn-in effect I assume
> * phone stays cooler due to reduced energy consumption by display
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: arm: google: add gs101-raven
      https://git.kernel.org/krzk/linux/c/2f88cffbfe61a9e257aa6d9cf03e1b9567cfc910
[2/4] arm64: dts: exynos: gs101-oriole: configure simple-framebuffer
      https://git.kernel.org/krzk/linux/c/befbb62c61a5f5ef547355f2f726a0926916a12c
[3/4] arm64: dts: exynos: gs101-oriole: move common Pixel6 & 6Pro parts into a .dtsi
      https://git.kernel.org/krzk/linux/c/58dbafb73173a944657c4a0d480d2cce50bff2bd
[4/4] arm64: dts: exynos: gs101-raven: add new board file
      https://git.kernel.org/krzk/linux/c/825c4bfd5c526b6fd18c8ad8503761143c90a142

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

