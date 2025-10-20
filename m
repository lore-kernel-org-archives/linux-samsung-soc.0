Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 247892D3221
	for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Oct 2025 07:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760943985; cv=none; b=SpRR1qsD4KLlMFazmGZt9rlz01vxSOd5zR/12oLgHukzuCLz+L818YvhPlbx1+CgGoiYQzTxix+iy9RuHagZV9DcbLXILfpTxh6NlNWU+mxq/bmMVyv8K/hIK/c4pjz/T2Yt1yUh38YZNMR68AGxJibDGHUbYH0amOIQcpnt9zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760943985; c=relaxed/simple;
	bh=rMm7BYc9re9L6JYscXwi2llMLU3UnSVoJxhS7c8RKYk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=r5survd/9C9eoKBvknHNHw2T2SboVZY9628MKl+DNV14/Pb9pyF6er3S4zNQtIycqxPCxdX9bugwe2KwwjZtBbfqOkXc8u5D5mr8c2qMyx3/fadxeHwv6BLLyZ2O6j0Ci8OqBeqEoqmBY9MWGODor3jefSvMrvKkbJVqAIE/Wks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uiM46Q14; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uiM46Q14"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4270900c887so384335f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Oct 2025 00:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760943982; x=1761548782; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BL4ZYF94aOfs6GrfgQH7uz/6YUTAgWONeedgmFFItcs=;
        b=uiM46Q14qy/hoHK5gicz12T8unN8yFHSllvw4zido9me/SjUh1PbU1xSrSiFri6lha
         WV+T/r0pk9AxHt1ZaO8tWGXwWVMCUZSW6PFBFpc6gw9EWt8KKUHPUiQ0F2RXKgTUkYRz
         JddG84uC/QQ4N1wN0IbN7Ld5KJ8cpRfIiC8NPBVTmtxPKfdBKCzF+8qhcm/IEQtm4DA5
         9/0ebAMOwAUGZ8zWsYf8FAUCtoPKAR5i1kHGN4cl768n9sKQ3Myul7mvZwwidgLDyWwY
         /OWWuTKQUcxa5Q+if3eZ6qRhBMO6uZLxvH2UW3hFwzqgHTRkIZx8sFG38STFViTiO491
         OZZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760943982; x=1761548782;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BL4ZYF94aOfs6GrfgQH7uz/6YUTAgWONeedgmFFItcs=;
        b=krrNIrX/O7AHxYQ6E6eFnjjdrA6sLUFlIV3afXFb3reKQWHg+aLmS/8De4sqV3U5UY
         yjPdBsIY3tK5gqkKkZ3ZsFbd3WDGD4fcbYROOsbjcnia+WAgvLXPp5aXu+sgPYm5SCvA
         qMv1zsjV6cAEhgVcz+F5lFf4DAIB1CBpqgRIHtHm8j7Avh/q96cnEFn4K/9NYvWKuEmj
         5AJIaZxebGPB8KQpC+x+yJplbuZzHWbhVv2lHNv1VtoOhFod6NpOo5ucBTOk6V67hNsU
         c9fgFdknayniSLvYyMlhsia+PVBLbpyK9wqeREQA5pN/42nRgwW6i7BYksSUvcttexco
         DCLw==
X-Forwarded-Encrypted: i=1; AJvYcCXazwQ1SonNNyHruppuAcBdcBiIMsdJJ/GM/UmEmnWWVY2yhQgQMnNWzTfi9vyuoZGQWvubrZVvO6CkGHlpevbOBw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxGJv8Obmj2KdzCCq3okSX87WbE5tODRbT+cvpAbmp20k2h8bc7
	15S7O9MYRCc+bwkkAS2UUCN93WGcjYf9vxsGruivJgPeSQS5o/JDMN87EItCCG/m3zM=
X-Gm-Gg: ASbGncs45+nT3WYGfc8r/aOzwLth/fvNs3UVEw43fKI/PgTWWeohm14FtEhjusfPwM5
	cv/eyO2gYAhdB7k5vbLRdahgBqA84YGRpeb14qHU01l271x6PIVk0Iwd9JR7rFHaQezX050JxYW
	BnEJRS2uFImWKcy4d9wGKtYE+QS35XriVxIbTRpBTBIckeRSUWeE7wPTdsyzx4uYkhaPa5SYeSr
	SDy6/DARY7gbg8o8/P9vSaP0VxWEYOqnbnxXFEiaO78xxjtJniULCIm+zO02bfbO1mCRxRh6YEH
	7Z10RjNgFuDeaku+tjcqee3NmYJhMcERxjmxBNTkfLcl598qKyoBvGOoLoCiJCMlVXw82rC9PBZ
	abcuH9bnJ/YluGtXOJpL6q41uSR4MbyRWR2gD1y/n2xla9Hbtw2bQ3XltMJehNpvVXe2d49Nzgp
	qMSX9m1b9oelSAVZM0
X-Google-Smtp-Source: AGHT+IGxcE1H5Tv0iSV8CsOY/ouiQBwzdpqvV8wjkhYvo0l+T5f2NGZtvR5ODn0Yr9X/Rd9I1QZNeg==
X-Received: by 2002:a05:6000:1884:b0:3fc:854:8b84 with SMTP id ffacd0b85a97d-42704d55175mr4636053f8f.3.1760943982413;
        Mon, 20 Oct 2025 00:06:22 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4710f28a920sm102535935e9.7.2025.10.20.00.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 00:06:21 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 willmcvicker@google.com, kernel-team@android.com
In-Reply-To: <20250924-acpm-dvfs-dt-v4-0-3106d49e03f5@linaro.org>
References: <20250924-acpm-dvfs-dt-v4-0-3106d49e03f5@linaro.org>
Subject: Re: [PATCH v4 0/3] arm64: dts: exynos: gs101: add cpufreq support
Message-Id: <176094398077.21021.10319434896360598218.b4-ty@linaro.org>
Date: Mon, 20 Oct 2025 09:06:20 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Wed, 24 Sep 2025 15:14:40 +0000, Tudor Ambarus wrote:
> Define the CPU clocks and OPPs.
> 
> Patch #2 has a dependency on the ACPM clock bindings sent at:
> https://lore.kernel.org/linux-samsung-soc/20250924-acpm-clk-v5-1-4cca1fadd00d@linaro.org/T/#u
> 
> Thanks,
> ta
> 
> [...]

Applied, thanks!

[1/3] arm64: dts: exynos: gs101: add #clock-cells to the ACPM protocol node
      https://git.kernel.org/krzk/linux/c/2e96df32009c2d7e4e210afdcce40bab17d0076e
[2/3] arm64: dts: exynos: gs101: add CPU clocks
      https://git.kernel.org/krzk/linux/c/025707fa269b0cf65fc2e10bcdf23359fd0e978b
[3/3] arm64: dts: exynos: gs101: add OPPs
      https://git.kernel.org/krzk/linux/c/bb103f6c7317bbc9cf4ee3a2482e74483876e412

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

