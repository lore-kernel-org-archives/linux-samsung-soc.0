Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92DA8C4332F
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 25 Nov 2022 14:22:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229922AbiKYOWf (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 25 Nov 2022 09:22:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229626AbiKYOWe (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 25 Nov 2022 09:22:34 -0500
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6CA6B495
        for <linux-samsung-soc@vger.kernel.org>; Fri, 25 Nov 2022 06:22:32 -0800 (PST)
Received: by mail-pf1-x42c.google.com with SMTP id 130so4275252pfu.8
        for <linux-samsung-soc@vger.kernel.org>; Fri, 25 Nov 2022 06:22:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Hb6OAvNcPbIiStohJr2EfSLMgJE0aIxz3yM12gwheFY=;
        b=Bb7OOpXAaJFFBKWs/LFVLbuHWpCOay8V9IuuJ2hP5lCavGUQiQewRHSJzllwqUoeEe
         TwD1KMAksVNS/cCGAtvJNxcYBtstUF/jDxSgYQP33inOCp4dCEB2/xYPv2m7fz7uyS0x
         HIzGjYwlC6Y3C9jZKTWqmcRdL/tQtu3SRn4ll2jskglasdZ12a81/7gEr6fuMu5Jf1+F
         fEoOdqR1G/eGfdpknh8YPaS2H5skdIIZvbtAVKNf2x2K9G5MqTwlmWZ+43UX+ciT/ZKi
         a1cUvsK7QXpv/CgynDSXG3BaIVdt5MZ7+RF7QuYa++EqmLjFVd7vLG7gPUOFugQkhHL3
         wmkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hb6OAvNcPbIiStohJr2EfSLMgJE0aIxz3yM12gwheFY=;
        b=ekQhPnojbw2/5vXg4oyR84dH50PK4WxcqiszoDCJtcv4p2mQNGuddjoHpn7R/pPuEw
         MX9Itpo/MpgXaE/1XAraGcGWKipxyuXiL/sI1SSS/+Doc7C3CI/rq4Ymu2QXRRVzLOQQ
         s8qW7XOr8dieA7BLv1D3wqEO01lmkMZ8rUy9W9v6JkfcOyGO6HKNgCuejKX3ZX76zAeY
         P0flpPYEop5mIjZ2r5KYNyaOJCLtw60twjK/LbsI7vaCyVtCwe8w90DUiMUEPk3Wtz/v
         JmpzGAwDxhRJgkK0io3AL9GprmEcOT26pYwPh2AQT3U99sHvPsvX0EU7tqKkCaRQUJM7
         I8nQ==
X-Gm-Message-State: ANoB5pnJMwy0g0FFrwbmVuufCHDmoMef85CYrtMAv9p3BDqH4v97k7Fg
        OAjYJlAkEAK2Nv57LUfnqkDCdtyYvDilLOx8hJfP3ZuRxqaoqg==
X-Google-Smtp-Source: AA0mqf4SASCGtN7jjhGQniRU+kCqkMRcJl/p66QUtfQ7Qmt+BHXhyNzQ8M4on7CigVIb82iIGZEH7erF3uBaohbrMvU=
X-Received: by 2002:aa7:9057:0:b0:573:1d31:2b78 with SMTP id
 n23-20020aa79057000000b005731d312b78mr20847975pfo.61.1669386152267; Fri, 25
 Nov 2022 06:22:32 -0800 (PST)
MIME-Version: 1.0
References: <20221125112201.240178-1-krzysztof.kozlowski@linaro.org> <20221125112201.240178-3-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221125112201.240178-3-krzysztof.kozlowski@linaro.org>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Fri, 25 Nov 2022 08:22:19 -0600
Message-ID: <CAPLW+4kwFCLaiowajdCnA09eT4emOB-3d-6cbA=ZYyRLwYuCxw@mail.gmail.com>
Subject: Re: [PATCH 3/4] dt-bindings: soc: samsung: exynos-sysreg: add
 dedicated SYSREG compatibles to Exynos5433
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        Sriranjani P <sriranjani.p@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, 25 Nov 2022 at 05:22, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Exynos5433 has several different SYSREGs, so use dedicated compatibles
> for them.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> ---
>
> Cc: Sriranjani P <sriranjani.p@samsung.com>
> Cc: Chanho Park <chanho61.park@samsung.com>
> Cc: Sam Protsenko <semen.protsenko@linaro.org>
> ---

Hi Krzysztof,

Just curious: what is the rationale for adding those more specific
sysregs? AFAIR, e.g. in Exynos850, different SysReg instances have
pretty much the same register layout.

Other than that:

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  .../bindings/soc/samsung/samsung,exynos-sysreg.yaml | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
> index 68064a5e339c..42357466005e 100644
> --- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
> +++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
> @@ -17,10 +17,21 @@ properties:
>                - samsung,exynos3-sysreg
>                - samsung,exynos4-sysreg
>                - samsung,exynos5-sysreg
> -              - samsung,exynos5433-sysreg
>                - samsung,exynos850-sysreg
>                - samsung,exynosautov9-sysreg
>            - const: syscon
> +      - items:
> +          - enum:
> +              - samsung,exynos5433-cam0-sysreg
> +              - samsung,exynos5433-cam1-sysreg
> +              - samsung,exynos5433-disp-sysreg
> +              - samsung,exynos5433-fsys-sysreg
> +          - const: samsung,exynos5433-sysreg
> +          - const: syscon
> +      - items:
> +          - const: samsung,exynos5433-sysreg
> +          - const: syscon
> +        deprecated: true
>
>    reg:
>      maxItems: 1
> --
> 2.34.1
>
