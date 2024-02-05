Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC3E83CF7B
	for <linux-samsung-soc@vger.kernel.org>; Mon,  5 Feb 2024 15:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707146824; cv=none; b=c5kcx9faK5X47c3WHtje7B1AFRZUlCcuurjtSZsp3OVh97PBjpVe4kHkDXlxU0Pmc4SuceDHOAIMBHFPw+WEvF2uzJ3XL0WkhYE1Eg/jMl/nbMrfT7jnhKLljDgoJPp6VnkqfIGXoV4j6eoTPxnQZ/msG2tBdYBe1GY7y+6ZOLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707146824; c=relaxed/simple;
	bh=lBmyhHAc/b/ds7tFylLz6RFQYMZo8mpB75YF921Oy48=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a5PUxYcOkunzw11OwZWOuOOBsl3v4iF1eEPmtH1abi9OoaO4vlmiZt5nJKvAhJX8xWutSzwfsDUNiQR3l5HU+e6nOCRX758jibOWy31nB3Epge15u+xRaYLyRcbV6HHDFQRC14EphXYWwxI7QMYbv9w4hCYlWvmGcBvJFkeCDuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RVRpipaJ; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RVRpipaJ"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-55f0b2c79cdso5511903a12.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 05 Feb 2024 07:27:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707146820; x=1707751620; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lBmyhHAc/b/ds7tFylLz6RFQYMZo8mpB75YF921Oy48=;
        b=RVRpipaJBXzjc9qFH9fw8jISSQzJ9dwDCTzoSW2Gj/Fah07NNfrIwLQO5/sv3Z4paH
         o5fuW9ySFbVO5iGfF42uGkp+GVYEY6otdUBcgQK3bqkANYo+NkuWRsYnw6XLvPo4hEqd
         LHFPGpn8Ar8ZiHWxuMqw2/O/7YDJZ6GmwxFROH1sgShoynB2XIY897jPb8O6r1j37bFj
         c8EyirQrJ/CR35DGm3WQOMKyyuh5TpdXbYt8WvpDGC+e9Ug4fhGqokqoMcV7tbLzaO47
         QEdQQUAcdwQCA02DyJEc4vwULptmOPQ9wvIFVC+9wHEf7gJ3b8BlO06cgqNLDIJqYnA6
         BT+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707146820; x=1707751620;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lBmyhHAc/b/ds7tFylLz6RFQYMZo8mpB75YF921Oy48=;
        b=Uo5dIOW3Wafr6gg22zN9RiqgJVkSYvAaxa1uTjJr6BeLNCw2uNM2NHxxssWmqs1LW/
         NNxAIMOYHAISO7RUvqW2YLA1vzqmsNzdjIupMZ51L59KnEx9jYa85UNPGEu4AWuhBKj8
         YQAsgRPpJFqgoMa3LvDDEcz9T3zwYaT6i/9zMEe67pdwXFeCYPHSIpBccFMeN6MEStpv
         hEDZYAhH/XfdfNwVIVKIziXibxakOiiAAc28x77rPEg76BJUabDhPlgLe/a621bVtOpE
         nni9Ogjd/zP1aKCKz7JpRmsyUWfSI+1oOnwpHs+D/V96N+kbtI3BzSmbe++3tWEdnj9x
         NK3w==
X-Gm-Message-State: AOJu0YzoCSRHbcOWO58xcSoM8AMlG2t//zCLGmfnoglDg2W1U04qB9U2
	d10Yx2R79LG0RPjUHGGohjobsY/FpTy7dD3cmtQjqPrwctprK5cyPGuvbHmbIM57SUEOyLPI9DM
	ds2Ph4/gKtTX5TosQjBEA2i50vJ9B1C2TjJWhsA==
X-Google-Smtp-Source: AGHT+IFQoasCqxFOs1K52ZI+x/XzUUqCmUS+VdtJeXp3SaImGzfi0s4W0syhmRtpTA5yDxCp/YQX6n0921f0iNYwxv8=
X-Received: by 2002:aa7:d314:0:b0:55f:3975:209c with SMTP id
 p20-20020aa7d314000000b0055f3975209cmr4541024edq.18.1707146820112; Mon, 05
 Feb 2024 07:27:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240205124513.447875-1-tudor.ambarus@linaro.org> <20240205124513.447875-4-tudor.ambarus@linaro.org>
In-Reply-To: <20240205124513.447875-4-tudor.ambarus@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 5 Feb 2024 15:26:48 +0000
Message-ID: <CADrjBPoBj_TKFJnBDJ8gMgj3PwjBT=g8sy_LhXnJFUTutuMKNA@mail.gmail.com>
Subject: Re: [PATCH v4 03/16] spi: s3c64xx: avoid possible negative array index
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: broonie@kernel.org, andi.shyti@kernel.org, semen.protsenko@linaro.org, 
	krzysztof.kozlowski@linaro.org, alim.akhtar@samsung.com, 
	linux-spi@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	andre.draszik@linaro.org, kernel-team@android.com, willmcvicker@google.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 5 Feb 2024 at 12:45, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>
> The platform id is used as an index into the fifo_lvl_mask array.
> Platforms can come with a negative device ID, PLATFORM_DEVID_NONE (-1),
> thus we risked a negative array index. Catch such cases and fail to
> probe.
>
> Fixes: 2b90807549e5 ("spi: s3c64xx: add device tree support")
> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
