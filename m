Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AEBF17FE
	for <linux-samsung-soc@vger.kernel.org>; Fri,  3 Jan 2025 14:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735916177; cv=none; b=Ixf+ld8ZRpc1mgMuByc4mHrgSlEGWG5Ednk0BtpgaihfE4tKbVcsHzrcRRE8M9jNXAME2aA55N1CsF2bL2avgRGymU6VCDtUFT6F90egQJEtzToZTydaWEmGYP7QQPVyklSWGg/hTe3QIfq/2y2pu3ix771cgdnrHsxrHZEuk5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735916177; c=relaxed/simple;
	bh=GURb/R99L2QiRk4OoGAGO+BYfj1uJi7sjd1PiC4oDQo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HKFG9sp09t/NIIoBjOrlQnhmuBGPaCfZlFkRVm0Ef6yznSI0dzfQn0dKO1DKIiWC0fiNdTnc5RPolh/G8sceNobYnCU9XnSiPL30MO4BQgarWt9SEmsI9A9Pt0fa2OttH70z1ibh1gVyRXplf8//tYwzyk4Rn3l4ieivf6tsAdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c5fMnJCj; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c5fMnJCj"
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e549a71dd3dso285315276.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 03 Jan 2025 06:56:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735916174; x=1736520974; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zhapTHXOL6nnyzfeibqtjCKKJ3noEWy6OsULxomBlLw=;
        b=c5fMnJCjeE27wNKbzScGC+mOZ/LXYZEZ+i8YkqIIn2b9AVTilzTSiGqJEr/y8vQdq5
         GzOQ+R3NyQeT//+osfERQneVz2y9Kp/aq9EBCaDYkofnQQLINL4VOQDxAty355ew/jYZ
         D9TuhjOUp2EZBryNvF8j+Qc5t5dvo11ScPFPp3osZNMUdKbUXSOUfq1wrR2Jr7TvOvpg
         UKi2tmKdR/D6uAIVA+W0Mrd7m0UrxYIqytezN1MHuw06a83OZWAF3taQFpZK/Zu0YLhY
         cbKNqrBRezDpDJfMKVa/Pz3DdZWsOkplP7V9LDICTo5MYXSHEkT+HxYy8IlQ6B669YVF
         iIPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735916174; x=1736520974;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zhapTHXOL6nnyzfeibqtjCKKJ3noEWy6OsULxomBlLw=;
        b=u3CvPWfL4grjzUe3fujQu9/kmz5klkH2MJOMfJqjQHRxUe1QA2DQ70B80nuEHjiYJO
         5x91LQGqmeZJCryLchPXcL+6yhph+Uhu6gmRey0BWupSUk+/uzjgy5O38fpKuSKVlDCv
         gapO/GdqZF6/K9f4Zsfgxu+Tp5ySBcc4xT8RIaReds0ZQ1vhVprzMLkVRb3ynmqJ83wh
         a/kFbkg/Jkhilea2W56IdrFYQ3CraWioJjkQml8OIzssv+988bC+XK3BldfYrPuyfyMb
         1qn3igmuqar4HYYCYRdQWt/rE7dPUTYN/nsw/5U/HY56V/NjKkIk1rwOOwbqg1+7BJWb
         Eigw==
X-Forwarded-Encrypted: i=1; AJvYcCX+NeUJhczs4p13gN5QXEK44ZgFIJ3pRRjKWeSV5NLWPllLTAQJOrw5lAW8zR9EBJiRMUDwG3XjCe4zArQ22MLj8A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxOchWP3u33pWf2wte5MDmjCF6T8GcadJj/hYcOvDoJWLJMN+xR
	QgLZbjALw+9dry4lG5mdT3Fp7hLa0DRlEijowo4osqLgXKXZ3i+Y/Es74Fu1EDfgnFfroPinOGJ
	6vBAAw2XLkUKwvmeu75CHtPzMkMdD/VithbtBpg==
X-Gm-Gg: ASbGncuriechveLrS+qElZBfQrLoFAuxL67PUUJHid2wz3DjcFTcmBaFYLQNgNLCw1y
	qDRjrOVECiy1o7qsaKU4lhW+WRDMUFxt9bM3APTEMDNW8F6I9E5dHwmdzqe+wqi8f/Hv81Ukd
X-Google-Smtp-Source: AGHT+IF8PgxghS0Yr8Fk32/LsnBMib2ycn/MjDyFQwGcJ2L9c+3xpdMG7fYH2+JRjVmj3XvaZJC4FTktLg/66x4obwQ=
X-Received: by 2002:a05:6902:1589:b0:e4b:3d71:346a with SMTP id
 3f1490d57ef6-e538c20774dmr30599997276.11.1735916173951; Fri, 03 Jan 2025
 06:56:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250103082549.19419-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250103082549.19419-1-krzysztof.kozlowski@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Fri, 3 Jan 2025 08:56:03 -0600
Message-ID: <CAPLW+4ncvOxj7nmypsw-+Tvj_gk5AHoWVeE9YKL=W=8y_MTjUg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: samsung: exynos-usi: Restrict possible
 samsung,mode values
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 3, 2025 at 2:25=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> "samsung,mode" property defines the desired mode of the serial engine
> (e.g. I2C or SPI) and only few values are allowed/used by Linux driver.
>
> Cc: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yam=
l b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
> index f80fcbc3128b..5b046932fbc3 100644
> --- a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
> +++ b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
> @@ -64,6 +64,7 @@ properties:
>
>    samsung,mode:
>      $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [0, 1, 2, 3]
>      description:
>        Selects USI function (which serial protocol to use). Refer to
>        <include/dt-bindings/soc/samsung,exynos-usi.h> for valid USI mode =
values.
> --
> 2.43.0
>
