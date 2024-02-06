Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9413E12D74A
	for <linux-samsung-soc@vger.kernel.org>; Tue,  6 Feb 2024 09:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707213378; cv=none; b=qvB7IbF0XIWodbQWcNx5e23fFXi+IcylmZ5Bpn4wdqwSAFM4unJMbG6borpOg3JFsgqcpymuLRHQPDkMbea5O+9gRwd89yCjx0GQKeokqGtzziuU7A/357Y4NKuXtj8EZfT446w4+6xSOSdjVpDjVq/WrfQbIS0WdzRJ+SauMUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707213378; c=relaxed/simple;
	bh=pwU543wkEC4pEjHTs+niRFnjN9ZiwdPq48b+x0FBCPI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fQpNNorYBGgxcxyDVQ3Yat/JH8+1FsBoAXPt85Qqg+9vG7M0k7LlC0RYOrW3vFLMWUYgZc+z+M7fYJwy3by7jfVr3RnPSyVNy5Ban2ribrVcmYIPkz/Wmy8V8GzJuGpKnHhxgsULeQZmx6d4aRi37QmZpvOjYGjSBwLeDPHzd+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dNw332XI; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dNw332XI"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-783e22a16d4so28450585a.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 06 Feb 2024 01:56:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707213375; x=1707818175; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CMShq1kVjIqxhVRjaGYU4SJMpzxmIaFIwT3PC41eekc=;
        b=dNw332XIaoEHTnyiiMk3asBU5CHbddzHvxKV9wLeuItnrU4cNtduoGyNdd36GEdJkC
         K3CnLNDrnykRWlRm+USnYor2iY2Vw9p/MFMAG7BigFgvXnXDpN9atbjihgFjITDKxVVp
         GWbd14Jh3My/BF7yOQoUkXkjXdRc2gzqQ9TVlYgiLwM/MiVYRF6QO4sodB3OBjFT9H+h
         ZoI7kqDAj+LWDk4LtUU8S3adz+M4yzXfndyXVVnsh1QnDMdj4ap14jREpBZ5X/GYzYvv
         IPfP5CrbYFXq+GhE1IVc66+guvIGAusPwA7q8SKNU5B6cccyiK2yRITHySeD1SrHWE7i
         CRiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707213375; x=1707818175;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CMShq1kVjIqxhVRjaGYU4SJMpzxmIaFIwT3PC41eekc=;
        b=ONev7xYeJ3JZCSufb8moZ8xvjWycY13Joyg4V9ekUcuTAZILt+v2KN6sKZZaWryPc/
         TVrrg0lr2hIcRNl7AR+/7sWZQXxx/5jFkIRbe6VnJQ6a7fFPxG5w7S7NW8Qcxxnldu9Q
         wW3XGCGUNSsQgaPc5efaSt8Z24pjWI+yRIpoPfDZCIKwD7UwEYtG025ennGKHOlVpZJG
         uAYng033vSUPV6kkXQcz9uogWU4PUGLHgRTw55G0/TRbBAsmn7rhiJcdvVkTJIL6sCgw
         FIpW0WDt16x/Prq/mma+ctL8H9Ehun4mqSCrMK2YYNZQtUULRGoMOAUcFCHMl8V8M790
         r1sw==
X-Gm-Message-State: AOJu0YzS3WfsEpglko27M0lT8qgNvsn+ADrGMZ2GjvWVu0s5ygd/3pF5
	femi8Ek0nAwy/RKxmv0e5eR1Zyw1GgaiDoRhiTwo9ACiiZ4QsQWTuZjewFQdCk0jX9rvKX3rjf7
	dirOt8szSYH/j5LtZnaHfhe+Df0HNPZOJeyxMyg==
X-Google-Smtp-Source: AGHT+IFSdhPP6seqkN3QxA7HFQZjJlBC9D2/9kKIGZd292r7UcQK8SRWFqqkFkZYfhENYbBAeL3ygtD/3krIkOa2XD8=
X-Received: by 2002:a0c:dc09:0:b0:682:bfd0:d79e with SMTP id
 s9-20020a0cdc09000000b00682bfd0d79emr4046715qvk.27.1707213375539; Tue, 06 Feb
 2024 01:56:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240206085238.1208256-1-tudor.ambarus@linaro.org> <20240206085238.1208256-2-tudor.ambarus@linaro.org>
In-Reply-To: <20240206085238.1208256-2-tudor.ambarus@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 6 Feb 2024 09:56:04 +0000
Message-ID: <CADrjBPr7AjCOi_sgzpJWRmKdyYkgB8Vcw0HW-e4VKUVh_yT6wA@mail.gmail.com>
Subject: Re: [PATCH 1/4] spi: s3c64xx: explicitly include <linux/types.h>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: broonie@kernel.org, andi.shyti@kernel.org, semen.protsenko@linaro.org, 
	krzysztof.kozlowski@linaro.org, alim.akhtar@samsung.com, 
	linux-spi@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	andre.draszik@linaro.org, kernel-team@android.com, willmcvicker@google.com, 
	robh+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 6 Feb 2024 at 08:52, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>
> The driver uses u32 and relies on an implicit inclusion of
> <linux/types.h>.
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

>  drivers/spi/spi-s3c64xx.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
> index 72c35dbe53b2..c15ca6a910dc 100644
> --- a/drivers/spi/spi-s3c64xx.c
> +++ b/drivers/spi/spi-s3c64xx.c
> @@ -17,6 +17,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/spi/spi.h>
> +#include <linux/types.h>
>
>  #define MAX_SPI_PORTS          12
>  #define S3C64XX_SPI_QUIRK_CS_AUTO      (1 << 1)
> --
> 2.43.0.594.gd9cf4e227d-goog
>
