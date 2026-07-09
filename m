Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F23129A31C
	for <linux-samsung-soc@vger.kernel.org>; Thu,  9 Jul 2026 13:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783603747; cv=pass; b=DjypLn4mGp9z/iw4QE8uN9+h42MQmtj46K+kCMunfnC7QaN6J6hDNO06ugcf/wY/wOMOu2G1/Z3oHhOEDaqDX0zQ37Vtbw1w8Em/h6iuVHUYG6MiC8OxWd1SE88wcLzeTfXQ+8zUXG46/tWMpE05sI/RqPLZ5ttrKytdjrNTEE4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783603747; c=relaxed/simple;
	bh=fy4AU9FWUyaAiS8Jr4lYhNN0QnZMjnaBoIWT5Ykot6Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aRYla5lO3QMZuYX1E5U67oVZmtrGwh3od4YrqdmqgNScsf4jzqV3NNuU8Zkg+qg2dwOV+YQrxnV5gIEyrRqGwqE6Nak/gc5hbsmGn1Zx43OCAjSf9umNXK7VphLwu/r1gn1UcX1KWfHfOwgA3VQHqriTRu7h8QZaNk63NK2giCw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LfM5cbj/; arc=pass smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LfM5cbj/"
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5bef75a83e4so571828e0c.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 09 Jul 2026 06:29:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783603745; cv=none;
        d=google.com; s=arc-20260327;
        b=NTxjgz/4ln/OELyPTuHYm9RycQQOxB3G0h21oEIsNK16zQ3FREf8xa8iztrYZdgrPa
         Scx6CvRzGFXhFe3BIDCTBdXqxkj1GipWcmkfJiYWpJkIQ3GcG/Tiol6Fka7h0QIjP9xw
         kh+bTa/lhcuRfM9yipjLoSmsCPC5Cl6bf+3zaHloNkfIug0IwrlXCkAQaJRWOrMj7moQ
         TkObxousvOKhQQV7NasozLF+L3hXSnYw4rjJDX3t4AAjjsMPQtSJpocuzdu4r1fBVcHF
         2vOB5EJoWL0j99hHur3As4+iDHKjc1jZWOwxHGy5giZvdlNcAgYI/U/WjyrZA1qDmxoB
         Iiqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=sYnuvdL+MuprbAstUVA/KMXRVODde6kDTXIYHwY7dts=;
        fh=QxMyRjjALy6o4J929JAmRjNZeegas7pkSC/hDDlUB8s=;
        b=s3LOqwVrCXArHcW1A73IIYUFEO7P2NsZAyeZ0n53HiciIwCl8RBNNZ0PSIWvFRJVuY
         hyWF0/q4vHEkTPJjBFMbMagCO1NXTyB8VtG77nEAvYiL/zM3zNKpWzGFOs4Z9OlfLUu+
         xmpg4Z5PV6wx/0Xw39T9x5q379bIGh3Hker725o8gbjd899GkwTl4sTVjltWsFD4OaSY
         N/tf5hRnpiNcLWBpQ2MW466WehKhGnTyYHZuyf1Mir5teBAWKipP2TtbEfYFJnuAQ7Tv
         Nd/vdiBvis9Z23E33Mb7NwcSKy+gHiaaK2JLMuYi8Tm1rhQckIQdrGGoMDmYsKKl2gBn
         rjew==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783603745; x=1784208545; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sYnuvdL+MuprbAstUVA/KMXRVODde6kDTXIYHwY7dts=;
        b=LfM5cbj/42Hh5pnG5nNvBgVwwxQWg7QlTxmKcRO9WUlXc7FzzOagFfyjWgisQJHFj2
         OZmzJyCpnLeFKMba40jkVd3p6DMynIZYmPZtrTVVn9fwMxAP0c0EnIBK1oVVUrJ2KUGc
         6x6nXgq4M8b7nibDwxElAq6Jl5Knq6USMQzGm8svji8FhbUA7YCsJaXWkG7yDCIv/bPz
         LYZmBn7OpBwRztnkLIfU/WARG6vtfpRRPum/2u+Rwo+VvFV8CQNMpU9M4tPCc0ZXRKOJ
         wCwe7ML3KjlVfdcioLYNU0/h4LPwD/QM3eQmzp9hGq5xTo+cwP1xkV2BNGJfJSD+HSVH
         /zMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783603745; x=1784208545;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sYnuvdL+MuprbAstUVA/KMXRVODde6kDTXIYHwY7dts=;
        b=RqBOXkzPXKxGGP0XouHIj6LEgW1p+e7CNFWROl83CQNF0tUAonmBodqYYKrOJV0a3x
         rbBz8shlJ7mjUMlXbEuRu0gOseWD2mCRIk949sCWxDNO/Hva7lLO76c8cKCUHcHQQeXS
         0+gaPzlYS/XaZTcGIaCpv8CP+HF351KfDD+z8Ocorj08norXoULFi58F2jhcbLpf02L/
         +d7T/woctUqcUt268YUdRnVob6jvGw+zxwjJKR2sUo4Rm5DSwmJRU+2KbV6aA4psVdMC
         Cxp7AEr1S6SiZthQKTtVSI+LGXyids4GYHnRNsoMgNV/xyT2oropxITfrM+F+2TXfflk
         JcwQ==
X-Forwarded-Encrypted: i=1; AHgh+RqUu1RNyXvBDZhVJOXrMmggl0SwjVf0pofxRGzC5voPPTbZUzdV6P4+DB1wBajvFMOuAwr/1Kcf3NWssu6oUU09Hg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0KwpIfF/ukyGQvGPchhBhN45aHCbmDyX7JVIO+GFs08waZZg2
	ejIA601E7ull0atbIUxwCyA8uA3v6T7amqCz9Wqf5CRw900iT5Liux1MYnjL5lyMFIEVZv5o/Ux
	jYDtDCF4g7pCd46t1EFVyyA5dhrZr4oZuYSR/dx+GFQ==
X-Gm-Gg: AfdE7clPzF/UQ/7fCnVvdrv87vDEx7L+Z5Aujn5+DZKfB6vEXJtuvXjxFExB+4qEPXO
	cLw10JzAu+H/rKSu+fks6fkP+v6EfReXM+d5U+A747taJ0dMnfzhFCsl0iYRZNdAxIY3+1Ug0t2
	K3kqZLoKJbia0enGYGaKhy9sFCmWY0MZJucXtvJRezJay3AMInVzRfp5OOHMC3p4rnDFpkPJLo0
	k3JHdZRgBVyJ195nUvHlAhrrqohBoM07WvuHYXjCI1emkLbBadAIhdr1/SyBpuXr7S33JN5yqDG
	Njm7KjuMBzGEOQyjrhve7/J81VzFYMI=
X-Received: by 2002:a05:6122:3790:b0:5bd:ba0e:1d6e with SMTP id
 71dfb90a1353d-5bf75eab5e4mr3740101e0c.11.1783603744635; Thu, 09 Jul 2026
 06:29:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20260627165410epcas5p3567172b20a463006bcf3686b3771f212@epcas5p3.samsung.com>
 <20260627171228.2687857-1-alim.akhtar@samsung.com> <20260627171228.2687857-3-alim.akhtar@samsung.com>
In-Reply-To: <20260627171228.2687857-3-alim.akhtar@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 9 Jul 2026 14:28:50 +0100
X-Gm-Features: AUfX_mxnCWBF3-jtSm-4vtEit0N4j6s0qQ7pEzHoCtPwv8N5Ycj70d6sCmI8TM0
Message-ID: <CADrjBPrR_N6SrCitTtWxa7JUM8816cCbTY1rae2qyqnRVWWd3Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] dt-binding: pinctrl: samsung: Add
 exynos8855-pinctrl compatible
To: Alim Akhtar <alim.akhtar@samsung.com>
Cc: krzk@kernel.org, robh@kernel.org, conor+dt@kernel.org, linusw@kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	hajun.sung@samsung.com
Content-Type: text/plain; charset="UTF-8"

On Sat, 27 Jun 2026 at 17:54, Alim Akhtar <alim.akhtar@samsung.com> wrote:
>
> Document pin controller support on Exynos8855 SoC.
>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
> index 7b006009ca0e..c4773701c92e 100644
> --- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
> @@ -53,6 +53,7 @@ properties:
>        - samsung,exynos7870-pinctrl
>        - samsung,exynos7885-pinctrl
>        - samsung,exynos850-pinctrl
> +      - samsung,exynos8855-pinctrl
>        - samsung,exynos8890-pinctrl
>        - samsung,exynos8895-pinctrl
>        - samsung,exynos9610-pinctrl
> --
> 2.34.1
>
