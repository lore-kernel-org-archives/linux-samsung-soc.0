Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01327C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 30 Jun 2022 05:59:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232039AbiF3F7f (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 30 Jun 2022 01:59:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232385AbiF3F7e (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 30 Jun 2022 01:59:34 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 768786554
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Jun 2022 22:59:33 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id by38so21663135ljb.10
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Jun 2022 22:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Rj55wFa+cwBwJLUF5zB5D7ughNA2ZeQCpO8eyDVzukE=;
        b=oDSwztU73dz6Yd5TtYHJpoHj+g+8HG9vzz7XC9t+qaaICCML3WeETUPIibHX9xdmOI
         nas/HsCNs4Ekpebb2Ee0dwHO+9kP32Dp8W1dOifpzg0ZLvqiZktAjH3DhwyZfyH2YFvR
         xYeeg/4X2UMJf4volwohGNzRctOg1f1c7V/DbF+gghtxGPYa+gWh29Jh+BX+MVdnQraE
         J/67twegu6EVYG6T/6pwTqJhuEt2I37edoho7M50a7OaVT0WoLsdW3FsnZgbyZjr1P2F
         DeBbzlzQ3zHD7GWJAry3zTi6WT4SWMDXVY0XIYpRoUgzzYGs33KImzG/Bq6Kzgu3HVHo
         vTow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Rj55wFa+cwBwJLUF5zB5D7ughNA2ZeQCpO8eyDVzukE=;
        b=xpUbCpmyzV2xIC+0H+/JscF6oQyOV1UuYs80Z+QLx7sAuem9wRGIWlRtgAIgc+kvBr
         p3M1x5EnybakT8ihHdfATJaeH28hzExiK81m9pZt6Ss2aFfwVjZK+t8cBHa5NaUqDk+Z
         oL0fOHg6zOFhXdtgCVk3xtRjJvQdujJrH/WGTkViwJ1p6zRRVkwGczvWqcOpzi0BwtWU
         +9P4ecIAnrlMeEcucHDmAU5cgasnHM8zDKHFAsE4eODjFUqOoMUKDETGxJipBLtuSwcK
         laLVatBSNPzFoCI1HTTW0GF84pfJ3ykTTLme7feKFs1UqNXnl5642WlUQFk97/h4w++Y
         zYPA==
X-Gm-Message-State: AJIora/N2rbKREPMFSdgQV9sQlfMvpf4VmuXu7ZDEL2iCr9I2nQkZgrz
        cU6NavEquDjmwJxbKexOI+i45gsHqVT1EV+CsvgE1Q==
X-Google-Smtp-Source: AGRyM1ucQG/qsZjKDQSwgiXTqjD0CajwMVbG19J0dnNN2YqHzmx896/P4iARa7PaEMmBqD0KlVM6KEtODCv2IywCdmc=
X-Received: by 2002:a2e:8ec9:0:b0:25a:754d:db39 with SMTP id
 e9-20020a2e8ec9000000b0025a754ddb39mr3974428ljl.4.1656568771680; Wed, 29 Jun
 2022 22:59:31 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20220630021951epcas2p26cd4a554f01f9cb6e44acd813eee15fd@epcas2p2.samsung.com>
 <cover.1656554759.git.chanho61.park@samsung.com> <8d7029cdf7b2ce0d1c43e6f91b3b9fdadece08ee.1656554759.git.chanho61.park@samsung.com>
In-Reply-To: <8d7029cdf7b2ce0d1c43e6f91b3b9fdadece08ee.1656554759.git.chanho61.park@samsung.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Thu, 30 Jun 2022 08:59:20 +0300
Message-ID: <CAPLW+4noFAHc+g7jTaaiMQH871OkqcOWjZ85-mpfPVbjiFO1iA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: soc: samsung: usi: add
 exynosautov9-usi compatible
To:     Chanho Park <chanho61.park@samsung.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Jaewon Kim <jaewon02.kim@samsung.com>,
        devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Chanho,

On Thu, 30 Jun 2022 at 05:19, Chanho Park <chanho61.park@samsung.com> wrote:
>
> Add samsung,exynosautov9-uart dedicated compatible for representing
> usi of Exynos Auto v9 SoC.
>
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>
> ---
>  .../devicetree/bindings/soc/samsung/exynos-usi.yaml       | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
> index fde886a8cf43..6e806e950a36 100644
> --- a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
> +++ b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
> @@ -22,8 +22,12 @@ properties:
>      pattern: "^usi@[0-9a-f]+$"
>
>    compatible:
> -    enum:
> -      - samsung,exynos850-usi   # for USIv2 (Exynos850, ExynosAutoV9)
> +    oneOf:
> +      - items:
> +          - const: samsung,exynosautov9-usi
> +          - const: samsung,exynos850-usi
> +      - enum:
> +          - samsung,exynos850-usi   # for USIv2 (Exynos850, ExynosAutoV9)
>

Why "samsung,exynos850-usi" is duplicated? Maybe it would be correct
to leave only "items" and remove the "enum"?

>    reg: true
>
> --
> 2.36.1
>
