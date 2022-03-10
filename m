Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58A57C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 10 Mar 2022 07:11:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235413AbiCJHMD (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 10 Mar 2022 02:12:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232483AbiCJHMA (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 10 Mar 2022 02:12:00 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7ACD213018C
        for <linux-samsung-soc@vger.kernel.org>; Wed,  9 Mar 2022 23:11:00 -0800 (PST)
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 454D03F60D
        for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Mar 2022 07:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1646896259;
        bh=BueICkMD6FgxhrrQfjN2EMilGbJ5MGCC2gsTZoU+JGo=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=E4qjzES0mkSVicvwrsK2257EnwgECQLjUqHBBScm8lDzQrdzmCmPXRbR3O1/l2sTG
         qYN06HOSRp6gqoCnZ7n30J+65ddUiLlYIPKe1mxJ2WA8WCLqpkbzFxj3Jsb8jB11Fl
         n94Id2Qi3+RtX3vBQ2wChIIDjrAvQEtzO27nL6RFPYkII6t48WtE8N2jyT1RLvm+c9
         y/efOLmRa8cTEFajNd3+7hkqfW/hVIKaOhTtsdw0fBlb+c3z3AwiNqHscVT992Hmyn
         rV15ov47lFu24T3acnDuJ1VYqiNaztUOEq+DBJJRHqDQ4hT0OXFlJp5TgdCXUsx7HH
         +VpJejR1Htydg==
Received: by mail-ej1-f71.google.com with SMTP id ga31-20020a1709070c1f00b006cec400422fso2580214ejc.22
        for <linux-samsung-soc@vger.kernel.org>; Wed, 09 Mar 2022 23:10:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=BueICkMD6FgxhrrQfjN2EMilGbJ5MGCC2gsTZoU+JGo=;
        b=m2340JvoTdmBpKGUhtpzwiMcJ9k8JTTjtOENp7yuYMbDKkFYykqvbVrXy4ogdr0uCO
         5lc/msTknIK+kjmYCukyBJfHa6/RLQnzXo2tKuICjUAu18jTi40JP46RAUwlwPBl6ddp
         bnwkSgnVBb5rxxqwdE6dp9mHUR1gcD9/xF6b8I+Dl1d000fDpx5twipc7u8qItutP2em
         hgs6/tjwlIQ2gqpj1NWZshQPuF1o56o6VlucXKh509UsrNko9vqOGEQ8Ua0cM4DkBZd+
         akSyuP1Wgz9iDcrUj8yjfoevH3GTrrzDxDi55KAFgxoxgj9iTHzZSaxoUlRiDmqDBK7x
         4PuQ==
X-Gm-Message-State: AOAM533FJJLkuvH6UfccTFoB0aJ3+zXiOkmHRUdQ1LOz2RjiYINX2EtD
        lxbGe1++t68NOxFR250Gpb91Nb5HGtl1H4Ngg6rTLgEUBLinWBFQ821e4ajH5sOICYMTQHN9SPU
        ++0uLRkSCQu+CxEFfKBtkASOwFzPgOjAjp9dYpOaeDBMgQBEW
X-Received: by 2002:a50:cf48:0:b0:415:df40:9e3d with SMTP id d8-20020a50cf48000000b00415df409e3dmr2922190edk.185.1646896258925;
        Wed, 09 Mar 2022 23:10:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzxgAdUUlVgWCn3BDd95sSfdEIXsRySgjNMDORdBL9GCPE6lCshn/jNDp9p8BCG/+cNb92+Bg==
X-Received: by 2002:a50:cf48:0:b0:415:df40:9e3d with SMTP id d8-20020a50cf48000000b00415df409e3dmr2922173edk.185.1646896258751;
        Wed, 09 Mar 2022 23:10:58 -0800 (PST)
Received: from [192.168.0.144] (xdsl-188-155-174-239.adslplus.ch. [188.155.174.239])
        by smtp.gmail.com with ESMTPSA id go41-20020a1709070da900b006d643bdd4d4sm1435152ejc.56.2022.03.09.23.10.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Mar 2022 23:10:58 -0800 (PST)
Message-ID: <6e1f8e96-751b-d2c0-8616-36e0c1826353@canonical.com>
Date:   Thu, 10 Mar 2022 08:10:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 3/3] thermal: samsung: Update makefile for artpec8
Content-Language: en-US
To:     hypmean.kim@samsung.com, "bzolnier@gmail.com" <bzolnier@gmail.com>,
        "rafael@kernel.org" <rafael@kernel.org>,
        "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>,
        "amitk@kernel.org" <amitk@kernel.org>,
        "rui.zhang@intel.com" <rui.zhang@intel.com>
Cc:     "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20220310013140.127026-4-hypmean.kim@samsung.com>
 <20220310013140.127026-1-hypmean.kim@samsung.com>
 <CGME20220310013131epcas3p15a109ec7208b1442676e3c50d5b4b936@epcms2p2>
 <20220310015740epcms2p2cdbcbb6ee6065293c2d6064de1b8d87a@epcms2p2>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220310015740epcms2p2cdbcbb6ee6065293c2d6064de1b8d87a@epcms2p2>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 10/03/2022 02:57, Sang Min Kim wrote:
>  

You have wrong formatting of commit messages. Using git helps a lot to
create proper patches.

> Add makefile changes for axis artpec8 driver.
>  

Why this is separate? This means before you added a C file which cannot
be compiled?

> Signed-off-by: sangmin kim <hypmean.kim@samsung.com>
> ---
>  drivers/thermal/samsung/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  

Best regards,
Krzysztof
