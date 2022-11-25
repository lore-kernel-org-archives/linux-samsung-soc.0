Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FEE4C43217
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 25 Nov 2022 15:01:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230215AbiKYPBf (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 25 Nov 2022 10:01:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230187AbiKYPB3 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 25 Nov 2022 10:01:29 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B06C40913
        for <linux-samsung-soc@vger.kernel.org>; Fri, 25 Nov 2022 07:01:27 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id a22-20020a17090a6d9600b0021896eb5554so7965374pjk.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 25 Nov 2022 07:01:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YzoqxWzLbAC5xaHv8eIezGdeIdLYxY/4HqUGgZdz7Wg=;
        b=kH2Y3AbvfupiLGAvBUpirk8wOJGQvhlGXVI+TfDSUxOl8Je0lhyt7M93SsymrAoud9
         h8cFSWSTqxMUROM0H3V7xWIODzPRwg3ELTUP0F6XECXzf3DjNWcw6Ik9v8+GOrtNX5Cm
         ZSNYkpgs/h1h2rp9L87+Go1SFzDiP+9pTOu8TZ8npftunTgpx/0V8nSomCBgHla4VIHn
         Dy5CxI2d+NG5mQ/Icl4P0XRXXKoZz+cjjM1XIrET1kQQJ6xd9Kex9LMBpTuNj65gHk1i
         RLcevdCo7p/+djBxzaGpSDD92VetqSy81l6taHZeLlS3RFsM2yp/XWCsmeT4IVEMsDIM
         Cl8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YzoqxWzLbAC5xaHv8eIezGdeIdLYxY/4HqUGgZdz7Wg=;
        b=gn8JQZMka6P6+KMw4lMaNOHoTXXQQfrt0R/EpK+AGxjKqbgGGLYTdZ2EZljEQSnUxv
         +P8QwxDTU+Dd0qc4y5lFfvynNO5WiEpV3C4Z1MbkvyO6rd/R/VcVpALMLu7MmgL4w/sV
         oqpbMC6vxrGPHHIAjg7Sx/Yz+KD3fmOX7wbtdmI21LKAlcnMDRNXNqr6rfm52prF2Yc2
         +88QnNKc3cHIo2KpcnHZnV1tfpAzCwZabYfjLoz9wx1uyVRqU6y91lJuHPd1VT5o4Syg
         202Z4Gqu8Ap0vDdKemMcdvP3DdG7Kau3cpo9R2d3cuVv3QstkjzGk4Tvfh2djoLVpI+j
         oUSg==
X-Gm-Message-State: ANoB5pknt8iCPP/yKW7C95vxF3xPOy2pSENOVO6i0YIlaManjXuRvR9a
        NNiG6WvBhO1IpGpJT0+AtPXOjcyLy8DnNkcgyTTUYg==
X-Google-Smtp-Source: AA0mqf6shePmYKZfIf2OuYXE1zqCj37yUbefhBb4iV1YXC+qj6V5THYvuSCQVCkOaevgbGxM+Iz85hWJZHl4Ut5UbPc=
X-Received: by 2002:a17:903:258b:b0:189:1b50:f9e with SMTP id
 jb11-20020a170903258b00b001891b500f9emr19878838plb.74.1669388486600; Fri, 25
 Nov 2022 07:01:26 -0800 (PST)
MIME-Version: 1.0
References: <20221125112201.240178-1-krzysztof.kozlowski@linaro.org>
 <20221125112201.240178-4-krzysztof.kozlowski@linaro.org> <CAPLW+4nSLP4ZpnzYrOfMu0uOQ0OYnWsnZ=sUppxts6O_3-yYZg@mail.gmail.com>
 <ff33d45c-f4ad-49f3-24b6-b15b4af5aa83@linaro.org>
In-Reply-To: <ff33d45c-f4ad-49f3-24b6-b15b4af5aa83@linaro.org>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Fri, 25 Nov 2022 09:01:15 -0600
Message-ID: <CAPLW+4kHef4pMNMbc8kvKzM0v0qBMoX6zwH1QCQKcLLubfcWXg@mail.gmail.com>
Subject: Re: [PATCH 4/4] dt-bindings: soc: samsung: exynos-sysreg: add clocks
 for Exynos850
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

On Fri, 25 Nov 2022 at 08:49, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 25/11/2022 15:38, Sam Protsenko wrote:
> > On Fri, 25 Nov 2022 at 05:22, Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >>
> >> Exynos850 has dedicated clock for accessing SYSREGs.  Allow it, even
> >> though Linux currently does not enable them and relies on bootloader.
> >>
> >
> > Not sure if this description is correct. Of course, there is no driver
> > for "samsung,exynos850-sysreg" compatible at the moment, so the next
> > compatible from the list ("syscon") is used for Exynos850. And
> > "syscon" driver (drivers/mfd/syscon.c) actually does control the
> > clocks. I remember adding "clocks" property to Exynos850 dts to fix
> > actual problem. Also, the "clocks" property is not described in
> > Documentation/devicetree/bindings/mfd/syscon.yaml, didn't really check
> > if it's ok or it's just missing.
> >
> > Other than that comment:
> >
> > Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
> >
> >> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> Ah, then commit msg is not good. I'll update it and maybe the clocks
> should be required for Exynos850?
>

Yeah, looks like all Exynos850 sysreg blocks have dedicated clock.
Please make it required. And thanks for working on that! :)

> Best regards,
> Krzysztof
>
