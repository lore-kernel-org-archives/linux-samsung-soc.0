Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685F52753FC;
	Sat, 15 Feb 2025 13:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739627540; cv=none; b=san3vpcXF6oLimqb0h7o2j01EzNydYewm66+yNiOwds8epSOhdXAcrhSjv0l9CnuKTM+iGcMfbP5tLUUdf4HMfSLeIyvj+47PEhHywQawNbdsCQyrnp3IJeRnFHNcuilJE1wigI8s7AErSkgLvkGpsus/yZlnxEbKEUxtzf7kF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739627540; c=relaxed/simple;
	bh=wRsSCZ5NQa/DtG+ZmvyGjZdp/eeP1UZuVt6YTQNEHK4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N0cK3ESKKPO172YcUTB01YdDX3+zDnBqbLk60MUDPmDGALOcwor5yxCjR0D9IK3LyO8Oilx0VG5TTIvuOT6IumLAWXuzb6exO/NEwk0CxuF4tixOgvkX/E5D91yEmr/vouQR8BhEp/aqCpDUp+Pur/5yZqACQZzaitt3E6IrA1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M+oGkMGx; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M+oGkMGx"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-439714a799aso3839515e9.2;
        Sat, 15 Feb 2025 05:52:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739627537; x=1740232337; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4wEV1ADnqQWD8L1k/XFokDETvht2ffBYSspDwjyPN8g=;
        b=M+oGkMGx+Yq8AWEpkzp9lZ/AiDt9cNuE4jO+DkkFk47oQlbuYPQmXPHaYv1dsYcI85
         ewhXSfCyrVyclea9fvMvL4aV+qSaOeJWF7Av24YoyuhCEHsC1cG7w/c7vNbCRQkSj4IL
         h0C8Dx+srPxkq76TyMtWA/trfKhRYoVQhu4CFApKEYmntfsG928JVyRVjcKIEsRDb068
         1QyGOpPxey/Zge0zGlRvJ6k/tmSCjtZkmQFn6fFR2pjGo3aYwbu5mfgFWWSFtXnP2zSz
         kMHdmKT3c2wJcBH8W+KLrMiA8pzhfGg0VMAY3aC1lU6BKKBj+KeCnhYDow3n7JD+Z4Um
         oRfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739627537; x=1740232337;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4wEV1ADnqQWD8L1k/XFokDETvht2ffBYSspDwjyPN8g=;
        b=GCePyXZCQiJKBrutgfcMePEsKFCZyR1eWyNY0AI297TT/kpU+NJ2N9mmbbkWdVn+Ru
         55UyD5VVBQUuA0qZQEpbC5Xln6lAjfW6XGM0CyLHjJKYhBvhlFgFvKxU1+Vq7S4hN8pn
         YCg+COCh3HveRIB3XrJdkdZLGhudrp9fus+UMzt/odkefKAK1974TO4RUiOvL0Oq1/Pd
         8O191Lcn71l/a+/TKu3sgb0fq4p8Wt3kM8LEPBN3tSDbrST50IRfug/Nm8zUy+/Hezly
         nWVFGX3NoFnaAnKISLLmgr648ptC+iuFZzlM5fTZkwLFVcxORfupsWUJZjt5DwgXj7EW
         Fu5A==
X-Forwarded-Encrypted: i=1; AJvYcCWOhYuTbjCRb2tQ7TULNlKlodNxQwXKoXNV/e70cxq5SVudZZFqlOm2HRuCg85FkzC4Sh/+N23a/EX5SRGM@vger.kernel.org, AJvYcCWux1IHNNSOTeXx6X3xH/KjpPc3NS6y4jsofrsYYxX06w4A88Dg7xPSX20l8hIvoxK6l0R4NiiJyxiM@vger.kernel.org, AJvYcCXgH6i3JojPn8oqa8WAMeJYzyhujp8fvUNbPhpxZFdg4QCgRZC44QBUK7Jk8l6qPUN0t5yAow/VSi95zZGxllXZFGE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTUKzKBwhHA2TS5NCpnNmujpnUyW2RBEuHcwkwbacspeWLOAv8
	a8opHlxqa+ewW9Vt6uQZeXUu2tFcm5HBreJrVQmgujnSO1oFIa3R
X-Gm-Gg: ASbGncsk7PX+Oxji7V8o5PGUGQIMXR5hPWyttB5Ql/SH3GQ6TgdcMzIOCzdjyCUs86B
	zv7A5NfYN5wARptbM0DOFBlNIR+x7tnUi+fUclbUbAeCvUDJE0g4JQlOHFESUVjc3dXBUbZljf8
	K23A2g4eZxvslfbUnuwxNTUAaSaTU65fuibzEJVJPWunp1UHpFb0Qm0Uizd3fF/pozuqoWpDf2L
	nbPF05w+NSdOrf4RXHLRJiJzFwDfSkHhEqD8T5vVVxIRZRMeLHwoBuqc0u4ghFjCquQSlfh6hib
	ftEab46j0Nshog06qYnHhcD8ToMvYx4Tr7bLDE3C/b5LvKdJ+eugaVR9+2GZATRUUxe9Ng==
X-Google-Smtp-Source: AGHT+IHUH/PSZrSEvYPRf7g1ThAvmE/rux13z69XbwZo1Qmd9SlXptEtu6drLDmn4VEdSVQBss2m8Q==
X-Received: by 2002:a5d:64cc:0:b0:38d:e707:f312 with SMTP id ffacd0b85a97d-38f33f53f95mr3614339f8f.46.1739627536424;
        Sat, 15 Feb 2025 05:52:16 -0800 (PST)
Received: from [192.168.1.105] (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259f7df2sm7291484f8f.84.2025.02.15.05.52.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Feb 2025 05:52:15 -0800 (PST)
Message-ID: <8bcf7557-dff3-4017-84b1-184b20e028bf@gmail.com>
Date: Sat, 15 Feb 2025 15:52:14 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: dts: exynos: update all samsung,mode constants
Content-Language: en-US
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Conor Dooley <conor+dt@kernel.org>,
 linux-samsung-soc@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>,
 Sam Protsenko <semen.protsenko@linaro.org>
References: <20250209132043.3906127-1-ivo.ivanov.ivanov1@gmail.com>
 <173920411901.476943.11749535762195189252.robh@kernel.org>
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <173920411901.476943.11749535762195189252.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/10/25 18:22, Rob Herring (Arm) wrote:
> On Sun, 09 Feb 2025 15:20:43 +0200, Ivaylo Ivanov wrote:
>> Update all samsung,mode property values to account for renaming USI_V2
>> constants to USI_MODE in the bindings.
>>
>> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>> ---
>> Patch picked from [1] and rebased on linux-next
>>
>> [1] https://lore.kernel.org/all/20250204172803.3425496-1-ivo.ivanov.ivanov1@gmail.com/
>> ---
>>  arch/arm64/boot/dts/exynos/exynos850.dtsi     | 14 +++---
>>  arch/arm64/boot/dts/exynos/exynosautov9.dtsi  | 48 +++++++++----------
>>  .../arm64/boot/dts/exynos/exynosautov920.dtsi |  2 +-
>>  .../dts/exynos/google/gs101-pixel-common.dtsi |  4 +-
>>  arch/arm64/boot/dts/exynos/google/gs101.dtsi  |  2 +-
>>  5 files changed, 35 insertions(+), 35 deletions(-)
>>
>
> My bot found new DTB warnings on the .dts files added or changed in this
> series.

Please note that this is happening because the bot didn't account for
header changes in the previous USIv1 patchset. Should be safe to apply
since the latter is in linux-next now (if it even merges).

Best regards,
Ivaylo

>
> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
> are fixed by another series. Ultimately, it is up to the platform
> maintainer whether these warnings are acceptable or not. No need to reply
> unless the platform maintainer has comments.
>
> If you already ran DT checks and didn't see these error(s), then
> make sure dt-schema is up to date:
>
>   pip3 install dtschema --upgrade
>
>
> New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/exynos/' for 20250209132043.3906127-1-ivo.ivanov.ivanov1@gmail.com:
>
> Error: arch/arm64/boot/dts/exynos/exynos850.dtsi:654.20-21 syntax error
> FATAL ERROR: Unable to parse input tree
> make[3]: *** [scripts/Makefile.dtbs:131: arch/arm64/boot/dts/exynos/exynos850-e850-96.dtb] Error 1
> make[2]: *** [scripts/Makefile.build:465: arch/arm64/boot/dts/exynos] Error 2
> make[2]: Target 'arch/arm64/boot/dts/exynos/exynos850-e850-96.dtb' not remade because of errors.
> make[1]: *** [/home/rob/proj/linux-dt-testing/Makefile:1464: exynos/exynos850-e850-96.dtb] Error 2
> Error: arch/arm64/boot/dts/exynos/exynosautov920.dtsi:309.20-21 syntax error
> FATAL ERROR: Unable to parse input tree
> make[3]: *** [scripts/Makefile.dtbs:131: arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb] Error 1
> make[2]: *** [scripts/Makefile.build:465: arch/arm64/boot/dts/exynos] Error 2
> make[2]: Target 'arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb' not remade because of errors.
> make[1]: *** [/home/rob/proj/linux-dt-testing/Makefile:1464: exynos/exynosautov920-sadk.dtb] Error 2
> Error: arch/arm64/boot/dts/exynos/exynosautov9.dtsi:445.20-21 syntax error
> FATAL ERROR: Unable to parse input tree
> make[3]: *** [scripts/Makefile.dtbs:131: arch/arm64/boot/dts/exynos/exynosautov9-sadk.dtb] Error 1
> make[2]: *** [scripts/Makefile.build:465: arch/arm64/boot/dts/exynos] Error 2
> make[2]: Target 'arch/arm64/boot/dts/exynos/exynosautov9-sadk.dtb' not remade because of errors.
> make[1]: *** [/home/rob/proj/linux-dt-testing/Makefile:1464: exynos/exynosautov9-sadk.dtb] Error 2
> Error: arch/arm64/boot/dts/exynos/google/gs101.dtsi:828.20-21 syntax error
> FATAL ERROR: Unable to parse input tree
> make[4]: *** [scripts/Makefile.dtbs:131: arch/arm64/boot/dts/exynos/google/gs101-oriole.dtb] Error 1
> make[3]: *** [scripts/Makefile.build:465: arch/arm64/boot/dts/exynos/google] Error 2
> make[3]: Target 'arch/arm64/boot/dts/exynos/google/gs101-oriole.dtb' not remade because of errors.
> make[2]: *** [scripts/Makefile.build:465: arch/arm64/boot/dts/exynos] Error 2
> make[2]: Target 'arch/arm64/boot/dts/exynos/google/gs101-oriole.dtb' not remade because of errors.
> make[1]: *** [/home/rob/proj/linux-dt-testing/Makefile:1464: exynos/google/gs101-oriole.dtb] Error 2
> make: *** [Makefile:251: __sub-make] Error 2
> make: Target 'exynos/exynos8895-dreamlte.dtb' not remade because of errors.
> make: Target 'exynos/exynos850-e850-96.dtb' not remade because of errors.
> make: Target 'exynos/exynos7885-jackpotlte.dtb' not remade because of errors.
> make: Target 'exynos/exynos990-x1slte.dtb' not remade because of errors.
> make: Target 'exynos/exynos5433-tm2.dtb' not remade because of errors.
> make: Target 'exynos/exynos990-r8s.dtb' not remade because of errors.
> make: Target 'exynos/exynos7-espresso.dtb' not remade because of errors.
> make: Target 'exynos/google/gs101-oriole.dtb' not remade because of errors.
> make: Target 'exynos/exynosautov920-sadk.dtb' not remade because of errors.
> make: Target 'exynos/exynosautov9-sadk.dtb' not remade because of errors.
> make: Target 'exynos/exynos990-c1s.dtb' not remade because of errors.
> make: Target 'exynos/exynos9810-starlte.dtb' not remade because of errors.
> make: Target 'exynos/exynos990-x1s.dtb' not remade because of errors.
> make: Target 'exynos/exynos5433-tm2e.dtb' not remade because of errors.
>
>
>
>
>

