Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rZDMmXth"
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36D30ED
	for <linux-samsung-soc@vger.kernel.org>; Sun, 10 Dec 2023 15:39:51 -0800 (PST)
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-5c6bd3100fcso1927061a12.3
        for <linux-samsung-soc@vger.kernel.org>; Sun, 10 Dec 2023 15:39:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702251590; x=1702856390; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZRlK8XSOgjLEALc1Z5hQNRyRQl5uMFZ8VhU8lledO9I=;
        b=rZDMmXth+QtQs5MiTf/Iupg1yKdttYePVq4u7N8MVavGkyTOxS5jxkhOmE/CMfoYXE
         4SKUbksEnScIqYGSBl7zsrUX8CSphCmBPM1Td14wlMToL8vsKMokfjiqiJcDWTruskrT
         iI8+s6Prg9jeTnFg6QWtSvVo9R3ZNSRSdDvkfXFcwf+G5luK7FdlEvnkgfBVt9KwG8ia
         6IpDl28rNur6wXFh79eJ3Tq+Rh18Sodz2RhDmw1de3RtKdcnMyio343YL6EIiuY24cUn
         TFq4uRikU7zFOXQKdW5DMRGgpPmF5q31dP5PKzbxb49xOJ3RjSMC4XK4y3FYmZ45JqVT
         WLQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702251590; x=1702856390;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZRlK8XSOgjLEALc1Z5hQNRyRQl5uMFZ8VhU8lledO9I=;
        b=ZixjL+iHzekaAnkkZZ9keDREifhMdv+ZdeATTE2065mgltYi3YrjKShEb2FGBFWCkN
         r3z8kZ4uZWHY9qJ/SOKm599gaz6J0f4hEmJZZC5tf1yd6UwpWQTAQzKGdF1pjCuVtGgx
         ZMTlmdkyWkonT2Z6YW+tdwHU+EQkr939YM9GQCYDWYV1sQ/6i6eKFgXzte8frLJ6KkTG
         VzC1fYKC8qqK34tibCVCqLYYDTeeZj8Gs5b+XWS7Cs91oXs1EAgNZzfmyc/yHaGb8LkO
         v3YRgsf296+uhNNV6itxfpTzqzivG2e9UwU2ETWP6jp/Uk9+i2SIfVMveuzT+Q68yC3c
         tIyQ==
X-Gm-Message-State: AOJu0Yysvxtua9jsS2fw3WmtXQvJKYfHE6unFwPT4xAsp7oxppQLGsu9
	HJziSvjZPuzh8lj5ydQZ7ocLegWcht9l7wp7SpvE3g==
X-Google-Smtp-Source: AGHT+IGsxFuYOhPbXcOyI8L4TnUro7MH402Xh7LjA1I7HZsXimGjb/gGb5R5X025i0dHUk0DjPb38yxObtyCuoxUp/s=
X-Received: by 2002:a05:6a21:998c:b0:190:228e:4c26 with SMTP id
 ve12-20020a056a21998c00b00190228e4c26mr1570718pzb.31.1702251590680; Sun, 10
 Dec 2023 15:39:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231210134834.43943-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20231210134834.43943-1-krzysztof.kozlowski@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Sun, 10 Dec 2023 17:39:39 -0600
Message-ID: <CAPLW+4nKzYLTPpTAba9X3YmeGwY_avpZoPr=Lw8Uy7ktSkH4_w@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: samsung: exynos-sysreg: combine
 exynosautov920 with other enum
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 10, 2023 at 7:48=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> No need to create a new enum every time we bring-up new SoC.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  .../bindings/soc/samsung/samsung,exynos-sysreg.yaml        | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos=
-sysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos=
-sysreg.yaml
> index 2de4301a467d..b00f25482fec 100644
> --- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg=
.yaml
> +++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg=
.yaml
> @@ -17,6 +17,8 @@ properties:
>                - samsung,exynos3-sysreg
>                - samsung,exynos4-sysreg
>                - samsung,exynos5-sysreg
> +              - samsung,exynosautov920-peric0-sysreg
> +              - samsung,exynosautov920-peric1-sysreg
>                - tesla,fsd-cam-sysreg
>                - tesla,fsd-fsys0-sysreg
>                - tesla,fsd-fsys1-sysreg
> @@ -50,11 +52,6 @@ properties:
>                - samsung,exynosautov9-peric1-sysreg
>            - const: samsung,exynosautov9-sysreg
>            - const: syscon
> -      - items:
> -          - enum:
> -              - samsung,exynosautov920-peric0-sysreg
> -              - samsung,exynosautov920-peric1-sysreg
> -          - const: syscon
>
>    reg:
>      maxItems: 1
> --
> 2.34.1
>
>
