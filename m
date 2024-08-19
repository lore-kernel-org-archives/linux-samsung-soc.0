Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2436B13B2AF
	for <linux-samsung-soc@vger.kernel.org>; Mon, 19 Aug 2024 18:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724092005; cv=none; b=Y7RJeXaJIPvHYgLwXRdnpOFdHyl7vgVmDlRRYyAh5BX/CnsIv4tTA5Qt90NcOo6igvv/7mtabEJRJqHobKURPy274UqujFjoo9xcjejJvh0D9/Zu5ZeFBDt7+3/DEvZoyFwjx/6Amr8pWx83qdFWcMr3ioYiI7u6HnbbxNPH41g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724092005; c=relaxed/simple;
	bh=5MQnDfQg0C24LyZXg2Cg/3e2ntF9Sd8G/H/VwrXWHOY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uGEPUO3LSAfqHsbakQqhwmm0oQHNAnstO5pbLvxrS06vEf0iI8e8KuLSN4CrQETW32Gx+01HN5HJKo8OqTuTi7QQ6lRECQD9ywcsBQwlkssrkovnlTBlOgRfqeyPJoppmh/G4IpnRabeXL7GBVUIM2Iw2rLFJ4eeekcWT8e2Ohg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r94+SewC; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r94+SewC"
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e115ef5740dso4916038276.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 19 Aug 2024 11:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724092003; x=1724696803; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YByhFPkfPzhPmiVtK1Ws9JjJ1pYxs/CDLFifKBG4kvY=;
        b=r94+SewCvBw9PC5AHGQ/dXFBYInfKnffrEO74tFNDeaUyxJNiHFkZFiw4EUDsm0Z0G
         1kQz9C7ygwjomXOu7x2kCGEXCRQvvZTEdfosP6OLqWgMXYHC5uqgLmjPNa7GTKoa/8tH
         b/aoym83kFmZ76ygu+kxKUY8xGpZJPtRDph85hXob0C+zhQus27fyvfHUD9P1S8cfF19
         +sZ9k5IjZLphsulJ2/88YvuDWXy44KUnbFynV75Pj6OoXf7PUNvgX9342SoW1Pf0MWAd
         755gyhqWOafaYWebPM2ZtBmP8ldlz/qgJQ0q9pYHEV00p0AFZ75XPd/zXho4miU2RveI
         qtYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724092003; x=1724696803;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YByhFPkfPzhPmiVtK1Ws9JjJ1pYxs/CDLFifKBG4kvY=;
        b=WpQMCVMIGpRUpzXu0uixSCFQMqI1gpm3itheukcHGmjeH7zILvkT3nh15aILib1F2w
         4NROEI1Er8nTaK0GDUMsH3jNs5VpVCfkIqeI0MyJAQwX9liKTwYuGRpZsX01d9vRrdUu
         iFD+V7eaoDK1U5PuTLlBpohNZQQTEgfGcCUvYKudGwj+W6JVUeCkFAPuIAJfkt2YFJGP
         izV7XakwNB+UkG/WkaBZOzt2Xm9qQc0whL+I8TSyejpb1z6iVvCKlY6Wrb2G8i2Ue+rT
         VkqnCosCp7daigzbNms7QpE4ycK5bmfRQlHFiKkjvoWmxBBurtQmwSrDaGfLBjqiVUCP
         o70w==
X-Forwarded-Encrypted: i=1; AJvYcCUvKYpCSbd/bMc0LvujKJ4t3QgX3fTO60gbi6gvAE9TFtkX9WQIQZLS9TbLbWJqZIkntfJFx0aVIPGXk/Pz/kYpifblspxrO6gE5vKX9BpPr9Q=
X-Gm-Message-State: AOJu0YwlSrY0AB8CCKGdtaovFYhWtMx8ZYSRQfbBs2ntD5xg8bWv9OWj
	3u4YXNNX0g296j1LE7r1t1mxcWHjg9G1iBgbAI6Gj0NmtFuVuGWaOmuu0hwU4xM/+wrSRnI2IPX
	2DjS5SbHYM3M+0ImOlVOJ1/JS6LkQWirmEC94WA==
X-Google-Smtp-Source: AGHT+IEnQ0qhBRiMEKWo4R6ABVuJRwuK7fIq2ZUycjGU2s/QR0txn5fcF8ylMq7Q69EGdS8HtwEP9XdhC3f4Twu2WTI=
X-Received: by 2002:a05:690c:2d07:b0:64a:e7ec:f3d with SMTP id
 00721157ae682-6b1b8ce933cmr111378807b3.18.1724092003131; Mon, 19 Aug 2024
 11:26:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240818172804.121666-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240818172804.121666-1-krzysztof.kozlowski@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Mon, 19 Aug 2024 13:26:31 -0500
Message-ID: <CAPLW+4ksmXNwdACEzwBaK_VKubZ=SSduNCakkaBn8JRgHTYnoQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: samsung: exynos-usi: add missing constraints
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 18, 2024 at 12:28=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Properties with variable number of items per each device are expected to
> have widest constraints in top-level "properties:" block and further
> customized (narrowed) in "if:then:".  Add missing top-level constraints
> for reg, clocks and clock-names.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  .../bindings/soc/samsung/exynos-usi.yaml          | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yam=
l b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
> index 8b478d6cdc30..f80fcbc3128b 100644
> --- a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
> +++ b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
> @@ -32,11 +32,16 @@ properties:
>        - enum:
>            - samsung,exynos850-usi
>
> -  reg: true
> +  reg:
> +    maxItems: 1
>
> -  clocks: true
> +  clocks:
> +    maxItems: 2
>
> -  clock-names: true
> +  clock-names:
> +    items:
> +      - const: pclk
> +      - const: ipclk
>
>    ranges: true
>
> @@ -113,9 +118,7 @@ then:
>          - description: Operating clock for UART/SPI/I2C protocol
>
>      clock-names:
> -      items:
> -        - const: pclk
> -        - const: ipclk
> +      maxItems: 2
>
>    required:
>      - reg
> --
> 2.43.0
>
