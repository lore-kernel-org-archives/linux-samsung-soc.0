Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52318C6FD1C
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 12 Mar 2023 17:05:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229638AbjCLRFu (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 12 Mar 2023 13:05:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229571AbjCLRFr (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 12 Mar 2023 13:05:47 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52AC83402A
        for <linux-samsung-soc@vger.kernel.org>; Sun, 12 Mar 2023 10:05:46 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id ek18so8633472edb.6
        for <linux-samsung-soc@vger.kernel.org>; Sun, 12 Mar 2023 10:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678640745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XNEEELiUGVXCtZf/DK15uOebu5AkzYw95Ilb/T48KEA=;
        b=V3iLf4wKBYDrAocnfV2OJZQyylsftUP8yg72Rq/o8yjbdM9A0270OtsbtUznGjdr3b
         31N6hBUNNKrFubS6Ey8cNjq7ulWxDzgXJMR+44I5a0NyoqYMCzm8HMYcFlNyTgheSlAN
         aqplVv8r34oBzl56MD6bTROUVWl60jV9J10nUGbYqqt9i28vzVAK49mk7dvoEKP+725E
         /ezB8yjFJ4/XvcCd9smmz/ykQ/m+Hw2weVCHtuNio9gRT6v28b7nh0OBN6GpUmsWaaHr
         Py6s+a3uGyHVYL+rDM2Lg7+z8t5pC884LkDvjlNFxyd4oiboObbEFbY4Dsa/Kg7NaLl1
         X+ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678640745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XNEEELiUGVXCtZf/DK15uOebu5AkzYw95Ilb/T48KEA=;
        b=L49G87bTctPmux7Vs+7PWon+shwctowDNcDO92+e6ZjCkgGr4C6t6Q9oDvqGKoWHq+
         ih2Ls1mMDmm7rcTDejNjwdyqcI2Pv5o+VD73dJmmq/xfIiLpZilWU8O0uvZaBN+rlsrV
         UkWEseedFxIIKaYpSNldbjMV3PP2L4OXPVU4FctPM0Db8DloRbf9KLOL6xmkaGjrGFze
         wfo1hDO4+bb8zC0MbhEc3Ba17fPd/J6YQppg/3YQqGx7sgwNmUBuUq3Gv6BzWR/k6RKE
         OaQ8fXstdxYnnoR7XdslZWKh+XDrPLSXi+XpMm6HyPPsZKGanmozu7nHTJ9iILlOzBJw
         xbUQ==
X-Gm-Message-State: AO0yUKWmO9xU0o51A2AC+QsmHuJMX+0vIkgNlB8Fr7ChXA2xjQG67XgV
        JXC0zq9CxHujFlKgtzGZcxMdBQ==
X-Google-Smtp-Source: AK7set/4mT0S9Oq5iFZaA86I9OqeBX2TkNu5AjGY4fEYAz/M2rEj2Zsq0wVpv34z4ck8YsXdy3LA9w==
X-Received: by 2002:aa7:c245:0:b0:4ac:c44e:a493 with SMTP id y5-20020aa7c245000000b004acc44ea493mr30108186edo.2.1678640744845;
        Sun, 12 Mar 2023 10:05:44 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:d9f6:3e61:beeb:295a])
        by smtp.gmail.com with ESMTPSA id t7-20020a50ab47000000b004cbe45d2db5sm2363168edc.37.2023.03.12.10.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 10:05:44 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: dts: exynos: fix MCT compatible in Universal C210
Date:   Sun, 12 Mar 2023 18:05:42 +0100
Message-Id: <167864073995.386929.11078269562382987456.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230221161653.56574-1-krzysztof.kozlowski@linaro.org>
References: <20230221161653.56574-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, 21 Feb 2023 17:16:53 +0100, Krzysztof Kozlowski wrote:
> When desired, nodes should be disabled instead of changing their
> compatible to a fake one:
> 
>   exynos4210-universal_c210.dtb: /soc/timer@10050000: failed to match any schema with compatible: ['none']
> 
> 

Applied, thanks!

[1/1] ARM: dts: exynos: fix MCT compatible in Universal C210
      https://git.kernel.org/krzk/linux/c/0e84f3493a37d50f2f629dbea670135b8a8ee391

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
