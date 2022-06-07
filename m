Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2030C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  7 Jun 2022 10:43:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241297AbiFGKnq (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 7 Jun 2022 06:43:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241307AbiFGKnp (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 7 Jun 2022 06:43:45 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 109771EC51
        for <linux-samsung-soc@vger.kernel.org>; Tue,  7 Jun 2022 03:43:44 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id 1so18718267ljp.8
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 Jun 2022 03:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AGodPBye9UXlI+EMJig0MHyiqcWK8Mh2BBBh7WPiDtk=;
        b=H6oTP+RJHqWcIElLUG+U95H8gWQGDnndMKIicjO1pRvcQ8oaW4sND8oheC1ayfuwXA
         rZ3wbYcjTSliDxsvO45ClnylkbEauh5NPGeQIhHXLSkS71InNOxTvFSnTaQDqK2WdHBn
         3cvlCUXs8CQejZ8fjwYIAJoFq4AFlJf1OuIslQu1pqmJ+cNT/YQ1cLTBWDDERwSKy5xR
         htd7gv/Xh+XHYAmuxFijvJe8IgXZz6CKuMXgyTC8KxtWPYoJqE+q77ScirzQQlQubnMF
         Sd9XaL2pPVyQoUnB9NmCAGmTkIYNM1M6YjT0QIyGnKwfApjBIboFc4FRuGdSDkPQFJ/2
         Ejhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AGodPBye9UXlI+EMJig0MHyiqcWK8Mh2BBBh7WPiDtk=;
        b=q7fVn6wJBGG9IC3gwYJcGbFoALtR/D9USoVTiwZnekKFGgDMZkDOE2HfW3zEtDyXYn
         b9jWVCSmrlQ4dxJ+54jCE5APgSGom175TYKKfZAVv65MvlYIWDTId8+B8dkJZp/wofev
         DH7+47HjBQfFPef8e3jyj3bkk9U99iExXrdt1jmXWHpKEnV1uex1qm6J8W7tGCgL4vaT
         XwHsRISVEJ1Mh9WLxOuMbajSo9pOk33oPPf0ewfUYbgY8doBF/f1Dine4xpoK+4r0PWj
         J+PilxheF11FuVmH+gc2opvk8qjGkoBTDEwc/ghM2I0AaWz5BPaXmRjen/n1inV2OviO
         t9hg==
X-Gm-Message-State: AOAM5330dAjxJxA6UGzhWNYMypenJbS3/eQ3W5xvoxxazYYFlAAucZZu
        GUt/YzUV/lNNEBRPbVx4svOVLyV4qbJs6jRJNHidGg==
X-Google-Smtp-Source: ABdhPJxchGY4Nt4vrOH/YTDzMSq4XSFMMYN/oBy1P6pcguyqh6vTohfv9M/2OI724RdulYxRsmcMro4+ctsRdKwqR4Q=
X-Received: by 2002:a05:651c:a04:b0:253:f0b4:a406 with SMTP id
 k4-20020a05651c0a0400b00253f0b4a406mr41537049ljq.4.1654598622293; Tue, 07 Jun
 2022 03:43:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220605163710.144210-1-krzysztof.kozlowski@linaro.org> <20220605163710.144210-5-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220605163710.144210-5-krzysztof.kozlowski@linaro.org>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 7 Jun 2022 12:43:06 +0200
Message-ID: <CAPDyKFp7VtMS22vEW==X_GsoPmKZLTK-G4HqG-Mt1ZD2ht7bgg@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] dt-bindings: mmc: samsung,exynos-dw-mshc: document
 Exynos5420 SMU
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Jaehoon Chung <jh80.chung@samsung.com>,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sun, 5 Jun 2022 at 18:37, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Document the compatible for Samsung Exynos5420 SoC Synopsys Designware
> MSHC with SMU, already used in DTS and driver.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  .../devicetree/bindings/mmc/samsung,exynos-dw-mshc.yaml          | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/samsung,exynos-dw-mshc.yaml b/Documentation/devicetree/bindings/mmc/samsung,exynos-dw-mshc.yaml
> index 80c557e938a2..fdaa18481aa0 100644
> --- a/Documentation/devicetree/bindings/mmc/samsung,exynos-dw-mshc.yaml
> +++ b/Documentation/devicetree/bindings/mmc/samsung,exynos-dw-mshc.yaml
> @@ -19,6 +19,7 @@ properties:
>        - samsung,exynos4412-dw-mshc
>        - samsung,exynos5250-dw-mshc
>        - samsung,exynos5420-dw-mshc
> +      - samsung,exynos5420-dw-mshc-smu
>        - samsung,exynos7-dw-mshc
>        - samsung,exynos7-dw-mshc-smu
>        - axis,artpec8-dw-mshc
> --
> 2.34.1
>
