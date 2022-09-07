Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B942CC54EE9
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  7 Sep 2022 11:52:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230049AbiIGLw4 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 7 Sep 2022 07:52:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229701AbiIGLwy (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 7 Sep 2022 07:52:54 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA0986D54B
        for <linux-samsung-soc@vger.kernel.org>; Wed,  7 Sep 2022 04:52:52 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id i26so6287405lfp.11
        for <linux-samsung-soc@vger.kernel.org>; Wed, 07 Sep 2022 04:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=cdVqHqPCKx36tLKOaUP1rRot7WAowoU5bcxA52fdRL8=;
        b=FQjJxM11DO5lE8Hh/L7toy34lHsPwqSnGDxUK6itZXBy1miZ6JVV5oANyYfK5icS49
         WYFepCZozX/1VLGNgbiTpqOh0nK8sDxCI1+dD+t+07HK5n+HkmyaBtdR0yI8DgKFATPR
         rz9Xos18Zb70XBjfXCdLsGf/Y9trnlyvPulbbsAZQqxu4AMMvApddBCTwnsqcpQNjcMH
         3Tjj2KZvoqhc8M7avrNu6uMAIDel2gOScH71YAmmx8pEZbbQlg9jLdJmFUrERB4RfAL+
         2IBvWQcNc2Mmp4md5+vhdU5jIByHMmWfAiqR13TxFSLzY3Q2pnsQjwl8zPMHE5Dchvaq
         7h7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=cdVqHqPCKx36tLKOaUP1rRot7WAowoU5bcxA52fdRL8=;
        b=lKBluCw+QH+IxJWcsIfAYCzt9iRlHYNC9hubicgiO6RQNclh1tJIuJ+EMmQ0VisBuW
         K7ZETLGK9KQd4cbWRylv6khkPNqbm4wT2XoMCx3o/dOMfUxP7Nuk0rs5ZBOa0WO5stz/
         7SwBSojVfMr3yJymVd+qkeTu9FoLGDzmdxmNkfYxpCb7kZOOV37bUJ3CQZzIdYv4DCBE
         Pv3SKCUUyu1E8HPug7/WLFyPxSYRM552bGBPZ+NvgWtZByrzuiikrnh5Wq9lqWKFLOOt
         R5wf1rPAkhg/a+C5PGPJaXv3BSiC+hZwEs19hTJHBLJOl7ZpGY93y+yEAFzzTaob8PBU
         S7xA==
X-Gm-Message-State: ACgBeo2VpcFWddEdbdS0igkL/ZmyikZx02Xeg9+js3atoLLmAX3VU4Gr
        G+uS2fd4+xrSgyn+AOel7Hiftw==
X-Google-Smtp-Source: AA6agR5yuHKYZVas1pQBmyY2r8bGC0yIVaTwFxz+W5feeOYS2XO8hONK2cT5Joj8q2U8PP1XAbib/Q==
X-Received: by 2002:a05:6512:169c:b0:492:ca5c:eb23 with SMTP id bu28-20020a056512169c00b00492ca5ceb23mr1052420lfb.646.1662551571123;
        Wed, 07 Sep 2022 04:52:51 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id g1-20020a0565123b8100b004947a12232bsm2383321lfv.275.2022.09.07.04.52.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 04:52:49 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     krzysztof.kozlowski@linaro.org, robh+dt@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        inki.dae@samsung.com, linux-samsung-soc@vger.kernel.org,
        krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
        sw0312.kim@samsung.com, alim.akhtar@samsung.com
Cc:     robh@kernel.org
Subject: Re: [RESEND PATCH dt v2] dt-bindings: media: samsung,exynos5250-gsc: convert to dtschema
Date:   Wed,  7 Sep 2022 13:52:42 +0200
Message-Id: <166255155746.50111.6462325647652564835.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220830180927.16686-1-krzysztof.kozlowski@linaro.org>
References: <20220830180927.16686-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, 30 Aug 2022 21:09:27 +0300, Krzysztof Kozlowski wrote:
> Convert the Samsung Exynos SoC G-Scaler bindings to DT schema.
> 
> Changes done during conversion:
> 1. A typical (already used) properties like clocks, iommus and
>    power-domains.
> 2. Require clocks, because they are essential for the block to operate.
> 3. Describe the differences in clocks between the Exynos5250/5420 and
>    the Exynos5433 G-Scalers.  This includes the fifth Exynos5433 clock
>    "gsd" (GSCL Smart Deck) which was added to the DTS, but not to the
>    bindings and Linux driver.  Similarly to Exynos5433 DECON change [1],
>    the clock should be used.
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: media: samsung,exynos5250-gsc: convert to dtschema
      https://git.kernel.org/krzk/linux/c/1d27e716805c6d8784122ab3d4ea4fc591c340e4

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
