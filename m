Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 952074175B
	for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Jan 2024 11:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705922121; cv=none; b=eDjFheyJDZbkZUiyndBlo4Ik5uV006i6VWTiqOgi+tS0GKpebx53/VD8+TQnB0i+GOMxNZNb9WYnIijM2yVsac94BuvcOqF7NtsBe//u9keB0SCcETc2QSlDPxjyDPljO5TiDarWrqa0uW/rBIeB7cv9x6aPpqfFxlGJ0iJln+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705922121; c=relaxed/simple;
	bh=794SmaQ54MTymb/u9d7+gEUbL2vd8+0mViFrNstCDK0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=iHYyhBJ9ckF1JZRTi3UmsY8BN+7kiuGeEJLTBqSa1vmM4wh2BRBU1AY9lQrV3488gZ/pcuxAjRob1pLlsesudNdwArt2ePW8hS3W2zwXOj+REFowKUtsw4dwYvkgvYgn+4w62LDebOC4ZDvcJvuXAx4LdA2s4XKkVc+9bov4NWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ps9aw/DW; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ps9aw/DW"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-556c3f0d6c5so3753083a12.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Jan 2024 03:15:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705922117; x=1706526917; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vytVuxKwk7apMR9cep+8YcY9zbRhD9DG8uyD8/fCDqc=;
        b=ps9aw/DWu1JTZWqOSk8yTMxeqLJp8ISgAzkoegiLdh3Gy0swnQR2N3mcJAzQ9nvEFI
         qiLbdd5+7Y4Ys8klwWhgVUkwh7NRrUsDGNXfOkzXqbJRM2TYDQ2hsbeelMU8WpdM1kbX
         9d5XionESYl/UfHtPAyME70R8xVCtng9c1qSb8Kn9c2Z3QxT0uAcYov0NvZaxqpiPB4Y
         o/mI070sHnbpM9lUVQvnIQ9ZYYw+PzRGqsIYSR7EDSDaPoxwVA4SP+tCsE6OX+yVwdZi
         nafnfWh/SrqwHOBqPBirwocd/whSYkTiMfJfMzuDIrKocy+IdZsIMl6G/AXpIg2bl6K8
         P2ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705922117; x=1706526917;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vytVuxKwk7apMR9cep+8YcY9zbRhD9DG8uyD8/fCDqc=;
        b=b6sF3P0TUsM+JZpHnpbvlofgzOPolp9xjv8YW7RxPevBka2+iQQHX+h2NNepax0UB2
         2WPmuOmg8T44IY/7R5NhajDM2TTogLhCgyPeEnQB7XusvYTjhxRapg5uCUWI0U2AEqtd
         dZOE0DAAFtQE84baMK8Y8XjhG0qw91rnOhoAz3Rf+ggwM0pgQ2iROknrFiTQxN3+L6Ew
         Mm+cdZW75meMkEwbJE1FlBR8COrOVr10Nfzl4ehmTSIzSUuvWsGcW3Buw8rGvgGAllOq
         JJeW56SPUECghX0BVomiM24t6iy9GWyWZeF/Pwuqrwktnn8kDWDovlgonaYtRlLEz+lv
         MU0A==
X-Gm-Message-State: AOJu0YxJxjeV2N7kocVShgpk79od6CVhRCcxNJ1hkL6juGaNrJNkhJ43
	06m6dOr485MPkBMXfzi3FpEQQnudrmcACYnVK/gzNafY5Vx08eV5E6+Fu9z4MvsJhVefo7abQ6A
	ljYc=
X-Google-Smtp-Source: AGHT+IEDDoaQ5FumWXcQ+GiNDG8GKYL9DoSZ+GpQ9roqhxjxGEabcOEJ7bXH7bZ9xuE5vQasN6xjJw==
X-Received: by 2002:a05:6402:3586:b0:55a:480b:6430 with SMTP id y6-20020a056402358600b0055a480b6430mr1723594edc.116.1705922117679;
        Mon, 22 Jan 2024 03:15:17 -0800 (PST)
Received: from [127.0.1.1] ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id h27-20020a056402095b00b0055c643f4f8asm179422edz.32.2024.01.22.03.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 03:15:17 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: peter.griffin@linaro.org, mturquette@baylibre.com, sboyd@kernel.org, 
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: andi.shyti@kernel.org, alim.akhtar@samsung.com, s.nawrocki@samsung.com, 
 tomasz.figa@gmail.com, cw00.choi@samsung.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
 andre.draszik@linaro.org, semen.protsenko@linaro.org, 
 willmcvicker@google.com, kernel-team@android.com, 
 Rob Herring <robh@kernel.org>
In-Reply-To: <20240119111132.1290455-2-tudor.ambarus@linaro.org>
References: <20240119111132.1290455-1-tudor.ambarus@linaro.org>
 <20240119111132.1290455-2-tudor.ambarus@linaro.org>
Subject: Re: (subset) [PATCH v4 1/8] dt-bindings: clock:
 google,gs101-clock: add PERIC0 clock management unit
Message-Id: <170592211606.45273.847576093222095843.b4-ty@linaro.org>
Date: Mon, 22 Jan 2024 12:15:16 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4


On Fri, 19 Jan 2024 11:11:25 +0000, Tudor Ambarus wrote:
> Add dt-schema documentation for the Connectivity Peripheral 0 (PERIC0)
> clock management unit.
> 
> 

Applied, thanks!

[1/8] dt-bindings: clock: google,gs101-clock: add PERIC0 clock management unit
      https://git.kernel.org/krzk/linux/c/b393a6c5e65652a19733978c3711c7c05c497594

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

