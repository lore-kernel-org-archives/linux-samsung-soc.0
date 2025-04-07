Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE5718FDAF
	for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Apr 2025 06:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744008434; cv=none; b=YKDZ6PF9xpuRttYISy2QnADYetkAnGAkkCZ3mdBCZrnssN2+6EgyoY3c/qBiqxoYKgkzQLRhNUWT0nOvEhJ+xvHNA0BVnbV8bonFjYV7uHqHctRMb0VQBmIl0NuZmAO9Se7SeBMhWehOAcGXW+fMNgy08XAL/Xc6tukNSr7BEq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744008434; c=relaxed/simple;
	bh=ccZN2lS+M3ZhqMKO3KcrCSac4MB9XtO/AGqThFv4LUI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=HRAOolHmliIEnr6GBP9aK4jXHo473epy9+UFR0/10yINyLqlNqGAWUlAU4f/t/ooRrupj1UwfoJqfsFLwLswvIDEwpMoU+/mav5adcEhgo/SA2+drMEEpfBi9rk/Ibz42N1h8Lktr0IlWOVk1fiGO4ewXw+ImK6v+yczijuqHf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=O+KmUO58; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O+KmUO58"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-39127effa72so395063f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Sun, 06 Apr 2025 23:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744008431; x=1744613231; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XX4Jkq7F2MHTZ19HnSyenZ2sT8C/TpJOx93V1M+Do4Q=;
        b=O+KmUO58yXANYtVlLfT/O/5cm9BgiujVsWaloSWbri6pMeQWzQIzkWQFxUD8dpEtBV
         MQj3QrGB5np90FZQ8aSPEjgtH9nJA23kZdw9LboI75QI1aik2IqS9RCvOoyUeidqsw8g
         vU8ZiTEyryqwg9xseoSXApOUBhUaCNvFTsrarNE1JfLwoSWRjowQQNr3p7RiQCIvbcje
         /8/Fh5MdVa7c3f5VpgJWJ6gmWcEqRvAQ5gGQF0vj8vehmyvOvqvdhfu1/QvrpqzwS6qW
         Eu5nYaCykjdJOhRe2Sl88nqk/f3XXP8YuPppdEbX1cI0dk+xlo0ACLalqhRhpjqVnJD/
         ZP7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744008431; x=1744613231;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XX4Jkq7F2MHTZ19HnSyenZ2sT8C/TpJOx93V1M+Do4Q=;
        b=Av/aIjEnr3qD6C8bvLqiaLt88VszH7bZm4kg3jwwLw4Ws8vY7/aP9H8SU8Lj5YwDfK
         T/D+9Sq/nG+htmCUIs+spD0fSoMXVwFlzZVtFa5BHVedc2GKARyILY7Ql7984E1r0Q5c
         R5BfwbeBQMd37g+HPKWEJCdmco67xIrXIKMRc05fQuGzpj6OzCerq/xaTGynR9rbdINJ
         xarxv3D+XwBnAPx6rVA6hina9LiiE+FmDoKeg4hjQ16DY7tnxxuAJUBzrsWDPbrIILnN
         nu2UQ2ZZ24j6mkxi0rPwRbcCu8fyT5t5p+Schb0oTOb5orkuAnMIdMOobff6M19pzUG0
         lqHw==
X-Forwarded-Encrypted: i=1; AJvYcCUFAKxAK8yCJ0j3d26qNJiLh5tBiMkdrPWMhJyqVxL7tbZGeFUZIjwjL1BzZySB+G/KY+TMhI9AX4udGbvW5K1GMw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+4A9omUvqKRDWjJ7xLj8y/96JrlntuzSgilP2AmGv8zQ5/y/6
	JLaSzzRlO07sxW78Sx6j8Uz4hm2k+5NvbftszPdEfYan1RAkNl+3LAUtL3qtBkc=
X-Gm-Gg: ASbGncu0LUZPMjQ77EJ0TIktNJ8nWRBdeaRcNgNFeF0ssAfvMzUqg8kg5hhnsbfNZVB
	Imv/wG5roJB+LT/DT2CBQAeMQ2A0oFRhBeBNbcOIPlePPGE7061K0XgSexfIVDyFjX9JIn3j6lk
	4X2C5nYtcAdDspoTKS9p11X2ncXKTh2hlTj78W7FMhNyCSe19OjJqjnUdRnAbWMBB81keF2FvIW
	Rkde34d2dVXhIhFd0fWA0YRR+LXcvLG4Qt+XvWvpx23a7S7+OMuD+yzEei197hJE3t+nm9equ5d
	79E44eVVXimVwDmncufYXyJEqCGX2u5pAYgHEaVIbOrZ3FhwZcem6UamAdxCxic=
X-Google-Smtp-Source: AGHT+IFPlo+ogc8IoUpTutl/PEc1yBD2j3zf2hRxADVMO+meHMTOAqAONXCBpw+hbR5fT9xhQjl9zw==
X-Received: by 2002:a05:6000:2511:b0:391:320d:95de with SMTP id ffacd0b85a97d-39cb359e2b0mr3957525f8f.4.1744008431518;
        Sun, 06 Apr 2025 23:47:11 -0700 (PDT)
Received: from [192.168.1.26] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301a67a1sm11024855f8f.24.2025.04.06.23.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 23:47:11 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20250325-acpm-atomic-v3-0-c66aae7df925@linaro.org>
References: <20250325-acpm-atomic-v3-0-c66aae7df925@linaro.org>
Subject: Re: [PATCH v3 0/2] firmware: exynos-acpm: allow use during system
 shutdown
Message-Id: <174400843030.38277.2924199101043205009.b4-ty@linaro.org>
Date: Mon, 07 Apr 2025 08:47:10 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2


On Tue, 25 Mar 2025 09:46:06 +0000, André Draszik wrote:
> One user of this ACPM driver is a PMIC driver that needs to communicate
> with the PMIC during late system shutdown [1] and at that time we are
> not allowed to sleep anymore.
> 
> This series address this by switching the code to using udelay() in the
> specific case of system shutdown. This approach was inspired by I2C's
> i2c_in_atomic_xfer_mode(), which has to deal with a similar corner
> case.
> 
> [...]

Applied, thanks!

[1/2] firmware: exynos-acpm: use ktime APIs for timeout detection
      https://git.kernel.org/krzk/linux/c/d2098981eb7b7d20edd294a8431908f8a0d2f9c0
[2/2] firmware: exynos-acpm: allow use during system shutdown
      https://git.kernel.org/krzk/linux/c/2d14c680e92f09d18b984cd1a8fae437f9ebc2ab

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

