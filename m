Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14A41FC3
	for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Feb 2025 00:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739491795; cv=none; b=HilJE4x5sWgzed5i7ONfryGybZqrPSbERzMxI4x3tbFA4rZgxMC7oBueznauIVDgWfSatD7x/5OL8tsoEOWdztbqe7T7IBOa8+kBzhP2mIuwbiOgnayJ6PSgz68xBgBSHvRknStsn+LOrtV5+puujw1C0Hn/e8w25O0M3K+Hqe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739491795; c=relaxed/simple;
	bh=lEZkR6Mx58pSq0zExuloJ9MtvWHa8LHWfZeVjgG9WZc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D5yl0Uy/XkR1cEV8oR+jytVM+KC8SK80WZnpnn8wH9hZpSO2Bk7kBspsaCJFyLMy41AMdrGA+CQzcFu6N8bqd8+3N2swRUhOQO8ZmNsPApmY7WV7od49TZA6OqnFV3O36tBYmemKYwn1dmPWzjM+SEe2SDc6+iwU05ryXTToh3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X9tDXlms; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X9tDXlms"
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e5b29779d74so1373098276.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 13 Feb 2025 16:09:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739491793; x=1740096593; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NqP9v9jg7baLiU2+93UgvbM9b74Tce3qrWwn1lgosFQ=;
        b=X9tDXlmsUsIQfkaNZDlkbTZOQ6yJZhTnEba9AZbqdWmtiAnd4eL5TS1OF04JD17+ea
         fOofewEVHOYcK02S5TygPLISQmY/3Uk4kcpGydKsR5TXMmFrvS7IrtDLD4vUFCTPH/F0
         PFOVKzmXj2kyXNCr2zvUlrRCHWY3AVzIos1Wif9ULHw/79JCkiQG+lqakWt9D/FyNM7l
         o+tExlNa0I7ciMuKBWs8Q4mxjQFiULrmRLSn8dKJ/qxM6IDnIzFDxL0mpoEpKtMtyKNl
         cdicpkLsAGQjNrIieya1OdDUovgu0jpQBKYWvOJTDaZ2ulvUuBZAG7hcvSX9e0cA3l05
         cXBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739491793; x=1740096593;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NqP9v9jg7baLiU2+93UgvbM9b74Tce3qrWwn1lgosFQ=;
        b=ibKZVoP8n67HULjFT0MyBq3YTTeJXyArIMRBes7nIWi9ehzAjV3qWXSNg9i8Dn+5AP
         9Pbu+LKBx/68VI3DDIOLJngy7W+l/1cQaMtOO4nbEW3mZlqvTkQ8PShwZPMeCLI4apOf
         QR4NEZ/AlXQOhlU/P4Rg5ETqw1Volahao0wxiiA8laj2+zRWuC/lYGFlcaZefJEf9T4p
         5YDVCMlKeCsvHCq3VxXUnIeQBzoS7q2RGzZdv1Qnb5SbKaBQ5c6ndeTAoKaRFJEcnk54
         dhwtybcRAsInfLdLgGWBYo55eTdzCC/IfgRfBslN8CkTssBSnFH6ElBLX6kJQRC7NzY3
         0yQg==
X-Forwarded-Encrypted: i=1; AJvYcCWl1KkyhaqYKTEs7h39iTfebn8utjqulVfXwdHQynSdcpeqWbdHz+SqVPmb4XrAslO4wySgMm8t8/hJCDOCwODNTg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyap8nBEnw8peOQOBC9KECaPVtEHwxlQx5I7oZ5xCjeaHAHm+PR
	enrYPqW6EBugsLlqudAu/seDAF/5tcChjEM9q+q5uHyhS4ycytSIn/c+XhDHOmKthN0PqeSSH0u
	BErRVkb1xunyBXBuyWnZDKmUyEftdxdvKxIQ/pA==
X-Gm-Gg: ASbGncsW0K4kmfJfbkw9sGL0tWIaGX89eN1kdNxXsw8PmC4Wm/Q8oE/MfxmfS3q48EI
	qSC2T2v9kwcrskGOwFydVjBsJeerY1lWcVqQ9NLS06Ai5m1ZrVSd7B1l1GJaiokF6dzrSVSHYZn
	TuGvgmYKUCSshZoFRhJLuiyBSk4M1fNPs=
X-Google-Smtp-Source: AGHT+IFd1EJtDVBHgzWdjgXFsf5jdNOMTYWQT9HHkgAZZC7VuvxH9RsRYnYxxoGtNZLN5u0QJ7cWcZkPmK0FyJYTFow=
X-Received: by 2002:a05:6902:13c6:b0:e5b:3f8e:9e65 with SMTP id
 3f1490d57ef6-e5d9f0f9e38mr9401293276.12.1739491792768; Thu, 13 Feb 2025
 16:09:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250213204044.660-1-wachiturroxd150@gmail.com> <20250213204044.660-2-wachiturroxd150@gmail.com>
In-Reply-To: <20250213204044.660-2-wachiturroxd150@gmail.com>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Thu, 13 Feb 2025 18:09:42 -0600
X-Gm-Features: AWEUYZnCMGwjd-AHWAZ_AQIcjbuE5HV5DBnJ9ZGUM8sZFqDGixnVhaKZX3Cd9ko
Message-ID: <CAPLW+4=STm0=K8s+BTxiHWP9F_waw2H=fQ4W9_NTm7a4JcFy=w@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] spi: dt-bindings: samsung: add samsung,exynos990-spi
 compatible
To: Denzeel Oliva <wachiturroxd150@gmail.com>
Cc: andi.shyti@kernel.org, broonie@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com, 
	linux-spi@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 13, 2025 at 2:41=E2=80=AFPM Denzeel Oliva <wachiturroxd150@gmai=
l.com> wrote:
>
> Add "samsung,exynos990-spi" dedicated compatible for the SPI controller
> on Exynos990 SoC. This ensures proper representation of the hardware
> in the device tree.
>
> Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  Documentation/devicetree/bindings/spi/samsung,spi.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/spi/samsung,spi.yaml b/Doc=
umentation/devicetree/bindings/spi/samsung,spi.yaml
> index 3c206a64d..1d3c95bd2 100644
> --- a/Documentation/devicetree/bindings/spi/samsung,spi.yaml
> +++ b/Documentation/devicetree/bindings/spi/samsung,spi.yaml
> @@ -24,6 +24,7 @@ properties:
>            - samsung,exynos4210-spi
>            - samsung,exynos5433-spi
>            - samsung,exynos850-spi
> +          - samsung,exynos990-spi
>            - samsung,exynosautov9-spi
>            - tesla,fsd-spi
>        - items:
> --
> 2.48.1
>
>
