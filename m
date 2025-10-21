Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF9134846D
	for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Oct 2025 19:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761074831; cv=none; b=LQ78RwwOcN/n/cQ4nHM9pVVikAQeQfGt+k5CnaCDS7uv8n1BohQGkW89GnYY+99y+qdy7TTkA6vZd8wnkHu5zsr2iB5yOup1/SASJbZn2lhYe1JVDyWInjG7FCrU6mLLiU4OZ+1DOyJ/d54ii9MQvndisFdCASn/byH/WeQS/ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761074831; c=relaxed/simple;
	bh=H7mmLnyjS4IJj8j/5Cfb777523++/Yd9MxdaxBFMvi4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=b6irCc7keFhK0B/EVB7hoyBxS9x7Adzt9FWQOgH3tCDuh8YImHBCTG9vdq+TEEItG1xdivp7+/dBRLOeq1qDa9cjLpkfTuWSJxkhzjDLfi3diDBMo3F7FFXPMmPqz3GH0mkXAtrW1HvlNLm+3owen9eN9G70uoN97CMuLFaqF4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RjfCV8K2; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RjfCV8K2"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-42844985499so374162f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Oct 2025 12:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761074827; x=1761679627; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ibZxuBONFvP6tEfHo6ray/hwM+JhW2wvVnRgxqq2YE=;
        b=RjfCV8K29Df2WMDDautePGhbt4yPIGXXLemqb9cmy/qDY+kqtUaInAUH8IXOAVwNM8
         4vVC+BfmXn243+566kVfTaanfMYJR/4icPDIi9JbUzHP51+LWdHAlOkZARxGx8Ow1Lwe
         aNVUMdhDaYwxVynnhUegwo2e6k0xRK/rtTCQbUUNgb/RyPoSJHBttg96nrt2GeEBFiwd
         TGFV+QtblNI2Uq83wHfYmWFx1slMcXUFHKUP8P6n1DS+yzg+xZOOEf+I/DbWu/q2N8d2
         ei7n9iL6vZYQTB53u6lnrhjTOk2AimvAMxYH9+IVAGsNlI65to1b1ssO1HtShwo0VRRn
         HCNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761074827; x=1761679627;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1ibZxuBONFvP6tEfHo6ray/hwM+JhW2wvVnRgxqq2YE=;
        b=jfk5kNGaqQJL/CcXi76PkMRXlSpmmv9huz8p9f76JaWE8tZ1grLbnks+wfPM/Oikna
         5r8f+dwuTF+Wd/oMNX+LWQWCgaYH3mi1032k/1EaA2IRj5R5FdD55olLOfwtc1hvuRm0
         KB1jWean9EmHgw+XDVPJMMelG/UQ8ah8s+ubQ77ySyFKxWUKY6BM8z/Dux467uCf2lMC
         PU143WCUbNnVEVDVCn+TiBt4GTjsGUb1aDz4+dKO3heWI5LwME98mA3D1iIsbTU/nA7x
         M9SQO5/It/OTlcRT4GslB8JaPdlrJVMwIMwWwiH7AUl7HxoGTNfqFijSq+l/0SnxeB6A
         TJsw==
X-Forwarded-Encrypted: i=1; AJvYcCVWxSBYSoDGh2RiEpKQzpCiXai8/l6VjVBmQCsJVx/Cpghr4CLbBgY8pHy3fXo4Ob0KtRd32RErax6a1JChyWyaVg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxyw5aT9RaXHEw1PyRr+ZP0Fm28te95/bdzVb7awsoZ6SQVElfg
	ec9p6wrcwBY6QENPyUfYgAOVrXVUHjMPyjawSmHCixR44LJtmYRPrUIM49LcQbp+/pM=
X-Gm-Gg: ASbGncsKbCgBFtaD0MxETpT9iwou0HZ0f81V2iwKP82WQv0PWvieZ3fIjJ++vDPyVVH
	TqoIGx0CJKD8922GUGMGgzW8JMr2ABAL6HRNAd5WJMKclWShlR6QBzYe3p2KlAMTX9g12pOz0h5
	IPXAyg5qa29u5LBf2I08Vn6sr6EQMtqAASlgb3tO58eVCb050VHMEo4/o6G6wDlmd8yGzXev2Aa
	SbOa1oOprLZMPloStpBs0rYaz+6AGtN1z2HlkwX52t4ZvamoACTKO+WKEck9kngy+T964QF3Lld
	AQzAAjZI5ekWqGjP3xPuDTLlFGlykgA/AKXmwKPQ7JM6kkwc3Sr5Z2dlARVx/sDNDrXwkFVOdMC
	2q5aDbO8m41+pxCilwXE+19YDdi0VBH9l9+v4XEp/WSV4G9wvJSE3RM736gqru6XkBNmVMD2ATk
	SGvDmhzbnW775cUko1Oytp/7yaARE=
X-Google-Smtp-Source: AGHT+IFxRo7mh1kCIiwBlgFSzvscGIsov6AOIfRYcDiKlEW/2CZnKxnmXX+fOq8J1wvQblUD1sFg2A==
X-Received: by 2002:a05:600c:3106:b0:46e:31a1:c07d with SMTP id 5b1f17b1804b1-474942605damr21467615e9.2.1761074826918;
        Tue, 21 Oct 2025 12:27:06 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c42b48c9sm7839115e9.15.2025.10.21.12.27.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 12:27:06 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: Will McVicker <willmcvicker@google.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 kernel-team@android.com
In-Reply-To: <20251013-automatic-clocks-v1-1-72851ee00300@linaro.org>
References: <20251013-automatic-clocks-v1-0-72851ee00300@linaro.org>
 <20251013-automatic-clocks-v1-1-72851ee00300@linaro.org>
Subject: Re: (subset) [PATCH 1/9] dt-bindings: soc: samsung: exynos-sysreg:
 add gs101 hsi0 and misc compatibles
Message-Id: <176107482513.33931.5052547244710731509.b4-ty@linaro.org>
Date: Tue, 21 Oct 2025 21:27:05 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Mon, 13 Oct 2025 21:51:30 +0100, Peter Griffin wrote:
> Add dedicated compatibles for gs101 hsi0 and misc sysreg controllers to the
> documentation.
> 
> 

Applied, thanks!

[1/9] dt-bindings: soc: samsung: exynos-sysreg: add gs101 hsi0 and misc compatibles
      https://git.kernel.org/krzk/linux/c/33fd5a7103959113ea3b60389a7582ec0cc2f15e

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

