Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7E68CDB465
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 19 Oct 2023 14:33:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346145AbjJSOdP (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 19 Oct 2023 10:33:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235485AbjJSOdE (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 19 Oct 2023 10:33:04 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB49010E0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Oct 2023 07:32:30 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-5ab53b230f1so4310360a12.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Oct 2023 07:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697725950; x=1698330750; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+XNrx3US1TBoOT89cC/5dM/an9l4kgmeujKRHDCLupM=;
        b=IFYDZo5lAbF2e10ozpQXYA9YrKwGIuwspFDgA+0fUygPYHP5/v2JqhCVXAPVIGWlQC
         qgWDZ+6PvRDa2X/1GBKbyhbQHpyalEKtHfm+EPtsuheiljoGk1cG4b9FbHFwTECAjT68
         lu9CYAoA5A9u21MeQztev2qtCYokCoYTLt4gvOetS+byi0lnkKVYNxW/aOWr53uKOjnU
         XSzLN3Nh1b+DNkpen+QYkC+qWIYYjJkCYH4wfewUnE8XOZLieNMwtwmAzdUcmjp2ByZr
         17FJ+Ksl31izGAhRcN1+0yLsbCvzq7eguMETPKWT3j5aq5iRkawbahM5R8TEA1AFj8TS
         6ArQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697725950; x=1698330750;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+XNrx3US1TBoOT89cC/5dM/an9l4kgmeujKRHDCLupM=;
        b=AA6xpeYd7zcCPS+OhLoA5xLtXxoaD64wXyPykuiMpdaJQCMOTBMlgYngZcjvQybL54
         kTPbKULuL8i2HYRDV4FoOf/tQ6Aq6YT8dfpcEf5QfqvYlLWsH9PhSYhAZiQELnzb+REK
         DYE4YxDq6HLN8BndLE6NUSkf7ZTCJj7RV3CYygZhXSIvzn+400KtSrShHXwtnSQWvY0c
         3blcJMsFGzeDt2Qdtoz2Z5YE7ZVDVWe+YRbkuGUe+X8NB+J2t4WdyFBdLS355JyVQ55n
         g7BiOJ1E4XOoPckG1sx9cKMnj4bM/6//qx3hU7Bg3uwwle5c6geZ1oaB9QyP/b0TdHk4
         o/tA==
X-Gm-Message-State: AOJu0YxuDHB0RPSGXkc64uC1z60szjiSIbt2rH8Iuh9nf+VHSVuGx5Wo
        7alE17jT5hWcj4pUigHqN2zMPAmOgiJoVn67p/YqPQ==
X-Google-Smtp-Source: AGHT+IF0maLNEBc0Dq3xbTv91IIXRq9WGF5Xiw5WZ5EZSw0JzAXHB7waQNn5r9NmgLXvWrREApajxxBXEDUsi9Q9LUc=
X-Received: by 2002:a17:903:238c:b0:1c9:d25c:17c6 with SMTP id
 v12-20020a170903238c00b001c9d25c17c6mr2158169plh.1.1697725950072; Thu, 19 Oct
 2023 07:32:30 -0700 (PDT)
MIME-Version: 1.0
References: <20231019100639.4026283-1-andre.draszik@linaro.org> <20231019100639.4026283-2-andre.draszik@linaro.org>
In-Reply-To: <20231019100639.4026283-2-andre.draszik@linaro.org>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Thu, 19 Oct 2023 09:32:19 -0500
Message-ID: <CAPLW+4=DG2g1=fZB9do_xb+q2ZU+BcyTgH5i15rqWoi_WUcdVQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: serial: drop unsupported samsung bindings
To:     =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc:     linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
        jirislaby@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        alim.akhtar@samsung.com, linux-serial@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, Oct 19, 2023 at 5:06=E2=80=AFAM Andr=C3=A9 Draszik <andre.draszik@l=
inaro.org> wrote:
>
> Now that no implementation exists anymore for
> samsung,s3c24(1[02]|40)-uart, remove those bindings from here as well.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  Documentation/devicetree/bindings/serial/samsung_uart.yaml | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/serial/samsung_uart.yaml b=
/Documentation/devicetree/bindings/serial/samsung_uart.yaml
> index 8bd88d5cbb11..d45079ef7bd9 100644
> --- a/Documentation/devicetree/bindings/serial/samsung_uart.yaml
> +++ b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
> @@ -24,9 +24,6 @@ properties:
>        - enum:
>            - apple,s5l-uart
>            - axis,artpec8-uart
> -          - samsung,s3c2410-uart
> -          - samsung,s3c2412-uart
> -          - samsung,s3c2440-uart
>            - samsung,s3c6400-uart
>            - samsung,s5pv210-uart
>            - samsung,exynos4210-uart
> @@ -96,7 +93,6 @@ allOf:
>          compatible:
>            contains:
>              enum:
> -              - samsung,s3c2410-uart
>                - samsung,s5pv210-uart
>      then:
>        properties:
> --
> 2.40.1
>
>
