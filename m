Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA9C8CDB484
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 19 Oct 2023 13:11:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345690AbjJSNLL (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 19 Oct 2023 09:11:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235390AbjJSNLJ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 19 Oct 2023 09:11:09 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B31312A
        for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Oct 2023 06:11:06 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-6ce2add34c8so330013a34.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Oct 2023 06:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697721065; x=1698325865; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Jm6DMSO8fMKHAOH/Ts5yTawuQ5qbJzgnz2SgvPmjiJE=;
        b=BB/ERAskv535SK29Cyt2aDn+ySYPGvQFbp+h+u9LxFu/8gF4N1X/xK3KXw4yVlS+Gm
         9mVXBQQecNRr7cmLDiqp0pjz9m2OOz4BaZIiXW9+2SR6uGPmwmBo3xq6zAPOs3pXvFMY
         ACc84rVcih8wFCf02VlgNOu9JpEcAfALwipSV3O8mytmS4fMHj2stlXv7Q2GSW8uAPAQ
         KrXPq0hccZIn5nS/38wW2ZQ2qOcnDog6yzezxvrOXh2UysktarYAGSw5w1Uhyx/4C9yI
         0v+JJYTi/6elWx2YJwXqUxSA9HsUbez+Jpmu25nCy4KzqnaJlp+sYhKXo3XvGpyOMxwe
         Yovg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697721065; x=1698325865;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jm6DMSO8fMKHAOH/Ts5yTawuQ5qbJzgnz2SgvPmjiJE=;
        b=ZZfwmXL1MKh1iSyRU4p7sGFtXkxEPh83jAwNuIDM993hu2AscszTnTc3aPT4lS1PTZ
         R1/B9KDTRgWFBRl1jPa+zYdVlS0Fd8WWfjqMojkcYp61Py5dZwPmVqWAbKtaz7cPNFPU
         n3YLr74t6UDVrreGLnINiRGJAHBCApXTgiKsovkYis5gZ0ZR4yMjEzOzyekUtQVroTIN
         mze7iFDiq/Q2KTgTf1BSV9+UnAjx6PgA090UD7eVSeFocsoPmm6sK82npRMLeLX91lgj
         xDdTxC4VrrqKBpPyDHej5oxxP27K9YCoAMXHCfyxVKX6STk5rimQiFzPWjohdc3UhXUF
         ierw==
X-Gm-Message-State: AOJu0YxdWAXx8M5aKI6e22CXfYKQqNw1o855PheogrM624PO9ikCLZbl
        /1sEydv4ws2k+vRcJH/uqzm1dKkrDni8VkoPoPXzvg==
X-Google-Smtp-Source: AGHT+IE/jHTUAAR6nIMpfuFVHDcoOayI4LJaNRr2xjsoB7z11oXnUYLoafVN7xD+i6Z21o/jjAiy3LIc6fQpznqcdbw=
X-Received: by 2002:a05:6830:438c:b0:6c0:f451:ab6a with SMTP id
 s12-20020a056830438c00b006c0f451ab6amr2505339otv.8.1697721065336; Thu, 19 Oct
 2023 06:11:05 -0700 (PDT)
MIME-Version: 1.0
References: <20231011184823.443959-1-peter.griffin@linaro.org>
 <20231011184823.443959-4-peter.griffin@linaro.org> <20231016133649.GA2641997-robh@kernel.org>
In-Reply-To: <20231016133649.GA2641997-robh@kernel.org>
From:   Peter Griffin <peter.griffin@linaro.org>
Date:   Thu, 19 Oct 2023 14:10:54 +0100
Message-ID: <CADrjBPo8xYQtR5qyLPgcUU4VKE9Ecfrb3XGKX4BV8CBLggJE0g@mail.gmail.com>
Subject: Re: [PATCH v3 03/20] dt-bindings: soc: google: exynos-sysreg: add
 dedicated SYSREG compatibles to GS101
To:     Rob Herring <robh@kernel.org>
Cc:     krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
        conor+dt@kernel.org, sboyd@kernel.org, tomasz.figa@gmail.com,
        s.nawrocki@samsung.com, linus.walleij@linaro.org,
        wim@linux-watchdog.org, linux@roeck-us.net,
        catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de,
        olof@lixom.net, gregkh@linuxfoundation.org, cw00.choi@samsung.com,
        tudor.ambarus@linaro.org, andre.draszik@linaro.org,
        semen.protsenko@linaro.org, saravanak@google.com,
        willmcvicker@google.com, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
        kernel-team@android.com, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Rob,

On Mon, 16 Oct 2023 at 14:36, Rob Herring <robh@kernel.org> wrote:
>
> On Wed, Oct 11, 2023 at 07:48:06PM +0100, Peter Griffin wrote:
> > GS101 has three different SYSREG controllers, add dedicated
> > compatibles for them to the documentation.
> >
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> >  .../bindings/soc/samsung/samsung,exynos-sysreg.yaml         | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
> > index 163e912e9cad..dbd12a97faad 100644
> > --- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
> > +++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
> > @@ -30,6 +30,12 @@ properties:
> >                - samsung,exynos5433-fsys-sysreg
> >            - const: samsung,exynos5433-sysreg
> >            - const: syscon
> > +      - items:
> > +          - enum:
> > +              - google,gs101-peric0-sysreg
> > +              - google,gs101-peric1-sysreg
> > +              - google,gs101-apm-sysreg
>
> Alphabetical order.

Will fix

Peter
