Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6686EC77B77
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 16 Apr 2023 18:10:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229836AbjDPSKR (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 16 Apr 2023 14:10:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229546AbjDPSKQ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 16 Apr 2023 14:10:16 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1A211FEA
        for <linux-samsung-soc@vger.kernel.org>; Sun, 16 Apr 2023 11:10:14 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-50674656309so2191697a12.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 16 Apr 2023 11:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681668613; x=1684260613;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Oo9vwDAIQGWd+ZBgWogqeSzYCOSuwuz4YdLXaQda4hk=;
        b=oo/jGAthzIYHD9CeJNKGhp4vfFFhrsxkzAj1QZp2gwQ1B01ATFLNxFCGe1892EehrH
         XDK8LUfmRXSlyBXRach6rloo2FNbY9m3dYgxIXwHG/5nNm9UCSNAcK6PMrKvs2ezUL+1
         uznSFP4iNYkZ9Gd5qHACFzVgJN1s/bVZYnKv08jcGcDAD+OGXH3c6Ko4t4+07F/oh+CP
         Q/RumCJjaCzq3rdq5BlYHibK65gjUtrz7C5RH9K2HVEdquvEZR55kB96EsJ7ZHrOUDQm
         vDi/2cBrSmhL/6qh+zP1u7SibPet6IMy71FDUK2yj92S4LpwBQUJ9lh+X1R/FX11Nl4k
         Mwtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681668613; x=1684260613;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Oo9vwDAIQGWd+ZBgWogqeSzYCOSuwuz4YdLXaQda4hk=;
        b=TH0Z4wQnS/8Vdd1hlPDKV2Xv8aQ5nmYZgB5fqB5jz1b37RTUO1K0MKUKsEe/gRnj2I
         uK5yjSKWnWS6HdzVXAbyWU2JfeLQulD557vyRpeK8s1wQ/ObWaope8K1DI01Be/1CD/I
         RL3BbAz/cLk/d877y1saz/SFTLJBDN6t1LFg5qey1NTnSCPuTgV7dCDvtkEp95vIA3Se
         iedyqNdjeXCcuJHMFv5DJ34KZ58a+e+Jhwy9g5NibxMLwcrm5egK6j7pLgqieXXwW6Qk
         nRbTdKfQRom3nEDJclul26+zXl3ll5PhvKs8fTgjyjobVVjRrS5maDUzpHLwKl46OLTo
         eqSg==
X-Gm-Message-State: AAQBX9dgYYiM93Z9i6hTDRrMYDqEeV8JWp3jWJphLvIACLIYkdS73rUK
        4DfByzBl1S2BOZhsmEUHfZQUow==
X-Google-Smtp-Source: AKy350awJUSJApohEW9Y2HjTY0hDK7meag+QYuc/qIbodh49giYK5YHhG9LMgMx3rmjwQW6KlxBkWw==
X-Received: by 2002:a05:6402:1154:b0:506:83f7:157b with SMTP id g20-20020a056402115400b0050683f7157bmr8288181edw.10.1681668613362;
        Sun, 16 Apr 2023 11:10:13 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:f9e3:1d38:66a7:ae92? ([2a02:810d:15c0:828:f9e3:1d38:66a7:ae92])
        by smtp.gmail.com with ESMTPSA id a7-20020a50ff07000000b00504a356b149sm4706745edu.25.2023.04.16.11.10.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Apr 2023 11:10:13 -0700 (PDT)
Message-ID: <185485e5-fa17-dcd2-2354-cdf29d556a53@linaro.org>
Date:   Sun, 16 Apr 2023 20:10:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 10/12] ARM: dts: Re-introduce Exynos4212 DTSI
Content-Language: en-US
To:     Artur Weber <aweber.kernel@gmail.com>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>, soc@kernel.org,
        Russell King <linux@armlinux.org.uk>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Kukjin Kim <kgene@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        linux-phy@lists.infradead.org,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20230416133422.1949-1-aweber.kernel@gmail.com>
 <20230416133422.1949-11-aweber.kernel@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230416133422.1949-11-aweber.kernel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 16/04/2023 15:34, Artur Weber wrote:
> The DTSI file was originally dropped in commit bca9085e0ae9 ("ARM:
> dts: exynos: remove Exynos4212 support (dead code)"), as there were
> no boards using it.

Revert the commit instead, with necessary changes to the files if needed.

Best regards,
Krzysztof

