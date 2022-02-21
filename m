Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43C87C4332F
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 21 Feb 2022 20:36:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233757AbiBUUgd (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 21 Feb 2022 15:36:33 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:52486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233744AbiBUUgd (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 21 Feb 2022 15:36:33 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6D73237D4
        for <linux-samsung-soc@vger.kernel.org>; Mon, 21 Feb 2022 12:36:07 -0800 (PST)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 67E7C40042
        for <linux-samsung-soc@vger.kernel.org>; Mon, 21 Feb 2022 20:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1645475764;
        bh=U1X8yA1Izrtu66/dEyXiQXCP/Yonm2UMSc/H4P/UzfQ=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=RgffgGfANB2Q5Y9AqrynMK7Sn7kFtHYKCLzl1PusPvRlWXm5M/DG4RYNW1RnaRk7R
         m4nVh8UBdL+UzfvebqX/H18o+BdhbuqPwvM29/2857Q67tt+0zTggf1AdwR/0YUutT
         e+RUCh2w1J8VrdP6hzTyqkg2ChY9SRwqzcvXlUSOnlds9x6XWmkfIhZjcW0NngijVi
         5WWtEhtwptNwD80oxQUEk1jgvTVSha7KJ7PSXcg6vZ5tlFxqiPag4QCNZuD4PUTIES
         BHsvmbpYS4X0rqKE6BOrdWxIB99I4Od5vMH4yUcQ+K9KHiRHNzGi3mmL17A7TKXjNy
         a1HGb9QABzN+A==
Received: by mail-ed1-f69.google.com with SMTP id r9-20020a05640251c900b00412d54ea618so5015194edd.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 21 Feb 2022 12:36:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=U1X8yA1Izrtu66/dEyXiQXCP/Yonm2UMSc/H4P/UzfQ=;
        b=YbbbEmsugTnRNZKtbv9D+S6oh0iGwk7PMg8NZjeJ7o1nhOFdzZ+vUFVOzu0eFpnP8W
         Opz+Zw855rmf0nJTElVafNOSAtUQMUPopQN4SHcKU1u3nip1ifztjZA/Xjk3m9UzicGp
         uQJioNV1nBTx8VpGAts6HXWkadKDHKnpfUMprBj2o/AYMYkBF/Osi0CqKFNwy+pASUU7
         836zkD+kPxcpdSkyR8oXz/HOPrwpQpRlmyA49+RcHbb+MFabYAggffby6aCylDkw8l+u
         xc/qvX6qCnHSIg4Y+RgYl+ecw4sVv1x30ZBET7HARr4Vwrp5bcT4meOXrKnh4mgKB3i6
         T1aQ==
X-Gm-Message-State: AOAM533nzliS77GVxKiO3IsfehGhpGQprhLwssjl/OU/pVty7Gf3XSYW
        P50fhwQTFngqmaDdE2aDG8D/Z/FUSOINQPC2hSmug529n3fDAKjj58kUsqX9OTlPofDUzGbryTt
        0yRP0iQkeXyzKKMx8YPlYx0zWhDkmv4P/09c1bkSLcGLWPewu
X-Received: by 2002:a17:907:2954:b0:6cf:7634:c6b7 with SMTP id et20-20020a170907295400b006cf7634c6b7mr16672980ejc.683.1645475764045;
        Mon, 21 Feb 2022 12:36:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz7JyJzqH58SpigIPgDM+kaxx8HSCtkrYGrEFZflvAXrNDd7Y3eppYCEgvt5S9ho/TzPnIXtQ==
X-Received: by 2002:a17:907:2954:b0:6cf:7634:c6b7 with SMTP id et20-20020a170907295400b006cf7634c6b7mr16672965ejc.683.1645475763784;
        Mon, 21 Feb 2022 12:36:03 -0800 (PST)
Received: from [192.168.0.122] (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id ka26sm992729ejc.170.2022.02.21.12.36.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Feb 2022 12:36:03 -0800 (PST)
Message-ID: <eb9d0fa9-78c7-30d9-b9d3-5ab9490cf38d@canonical.com>
Date:   Mon, 21 Feb 2022 21:36:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 1/1] arm64: dts: exynos: Add initial device tree
 support for Exynos7885 SoC
Content-Language: en-US
To:     David Virag <virag.david003@gmail.com>
Cc:     Sam Protsenko <semen.protsenko@linaro.org>,
        phone-devel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220221194958.117361-1-virag.david003@gmail.com>
 <20220221194958.117361-2-virag.david003@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220221194958.117361-2-virag.david003@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 21/02/2022 20:49, David Virag wrote:
> Add initial Exynos7885 device tree nodes with dts for the Samsung Galaxy
> A8 (2018), a.k.a. "jackpotlte", with model number "SM-A530F".
> Currently this includes some clock support, UART support, and I2C nodes.
> 
> Signed-off-by: David Virag <virag.david003@gmail.com>

I guess this goes with (from v5):
Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

Best regards,
Krzysztof
