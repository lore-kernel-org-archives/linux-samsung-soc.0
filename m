Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8647E3A1B6
	for <linux-samsung-soc@vger.kernel.org>; Mon,  5 Feb 2024 15:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707146705; cv=none; b=IHGpCBqZAqW4lsTp5OS0ohKmHZV6+pelU4jCsN+9dHZ82h9JVdZftj8+uL1HDgoRpi/NsCBKy90odsm6gde1GQhFu6a4NYGjwX9gnVBWFkJ7kp4Suj3pWDFv1zNbHRvfvnH98q+BwOEA8xwwZ79G7k6Xm88+fCZuK47I8scF/lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707146705; c=relaxed/simple;
	bh=HKwxeUSsLvhmFJpMmpEtAXXRzIFcWThX4sy4vjHNQ7Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EETeZDLkgrLPgvsBr1Po8d4ABLOUkg8CEG3reh+0Jo7e4nnMZhzo/XZ51I54Hke8vxSi3ceAHdBI9BbZ9MRPMDS1JW2WHcT1oLc0sAg9tKfAXl5c4qE9fAtmoT4D+vowtDiLC/m89BkIWWsOrWOoXOsmsvU8ggcUJqiba673KOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kpj4suvj; arc=none smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kpj4suvj"
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-21959190723so1131519fac.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 05 Feb 2024 07:25:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707146702; x=1707751502; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HKwxeUSsLvhmFJpMmpEtAXXRzIFcWThX4sy4vjHNQ7Y=;
        b=kpj4suvjEaFOuSQ5DCte0p/y4dABRIygiWIT+hNr+j5yZQPs2Gvqp1FF+FVXLV4v3m
         a+yeSJTeF1mhDnCepLLExo2TB4t6yi05qwz3wqiubAklu68qxDPXBGANRy89V8yJlRgP
         vdA64R0AP4y/OCqz0+as+RGEZACAThDYuIV1QtTnnDQl+l6mQe7rWcKkjLMR++FeQ8dp
         1ddmlpGhySzqTrOnoubhe/XSJAb8WwcpQSNQkMwyTyN1OOtc3VqLcNfbWp0S40MQqVyL
         DB7W1T7M9dB5131LVqiMtozFgCP6TiI0p86PBjodOxHyu5hpGnYJuIHYkw2iXc8Xpsc6
         uwRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707146702; x=1707751502;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HKwxeUSsLvhmFJpMmpEtAXXRzIFcWThX4sy4vjHNQ7Y=;
        b=ogNzIk31YsFs/Evb4biI+EeOgB/eXljf7Nuc/uyLdTyE09NHCIdg+6vAQZ+FB0Bbxy
         jnFbjkhgSJvCU00EN5pSsL156gGuXzzpsxrUf1ptG5dNMx2dLDcOhS62Agy8evgiFGRl
         TMRT2U9JQiRIcVoozyJCZ8EqXmNWgHkR+4zv56fSSRGZdVyAfdwTgO4HhZrxJN6DG1Hi
         RuxjKY5Xkvc17TjC25fYAmZEb5mu30ZBXzXcLQqQhwa1dDXt+71GE/s/X05J/uHh/4BH
         ZN/KSCJYgAzcncitFlpUQ85FjNQbeMds/V6Q6d7KHQ2NHVzW/Ixiwri+CWFqzU3HMJ08
         m/XQ==
X-Gm-Message-State: AOJu0Yxs79IN2EFVgc5LIsXMztvvNL9jZy6ITHb5BH57VU3FEKqde37R
	OmRf+BYa57ycz9SQ8dwHh7qy/y9EzUTCREISCn0is/KfB0maaeSuhVS0Ai5TXEVrv6nfwKqcbN5
	xyHrVHsBYvlw8+5wk9fG6Rn9hq4yY85wN4Z2IAg==
X-Google-Smtp-Source: AGHT+IHy/zvd52PWnVfGZ0cIa7PK3W2ziJXs/4hoP7SDCkTIOKpF2KQTNlCotEw7lTj8YOyyv/iuUThqyrMK/IlilsI=
X-Received: by 2002:a05:6870:390e:b0:219:476a:c1a8 with SMTP id
 b14-20020a056870390e00b00219476ac1a8mr13118oap.6.1707146702651; Mon, 05 Feb
 2024 07:25:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240205124513.447875-1-tudor.ambarus@linaro.org> <20240205124513.447875-2-tudor.ambarus@linaro.org>
In-Reply-To: <20240205124513.447875-2-tudor.ambarus@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 5 Feb 2024 15:24:51 +0000
Message-ID: <CADrjBPpZzdO8VtPexWJOjHh_t+4CwSF=tcn+sC-i6eLcrxYhfQ@mail.gmail.com>
Subject: Re: [PATCH v4 01/16] spi: s3c64xx: explicitly include <linux/io.h>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: broonie@kernel.org, andi.shyti@kernel.org, semen.protsenko@linaro.org, 
	krzysztof.kozlowski@linaro.org, alim.akhtar@samsung.com, 
	linux-spi@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	andre.draszik@linaro.org, kernel-team@android.com, willmcvicker@google.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 5 Feb 2024 at 12:45, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>
> The driver uses readl() but does not include <linux/io.h>.
>
> It is good practice to directly include all headers used, it avoids
> implicit dependencies and spurious breakage if someone rearranges
> headers and causes the implicit include to vanish.
>
> Include the missing header.
>
> Fixes: 230d42d422e7 ("spi: Add s3c64xx SPI Controller driver")
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
