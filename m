Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47DFBC04A68
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 28 Jul 2022 08:19:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235082AbiG1ITD (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 28 Jul 2022 04:19:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234999AbiG1ITC (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 28 Jul 2022 04:19:02 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DCA861DA6
        for <linux-samsung-soc@vger.kernel.org>; Thu, 28 Jul 2022 01:19:00 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id a13so1144426ljr.11
        for <linux-samsung-soc@vger.kernel.org>; Thu, 28 Jul 2022 01:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=aXKmRuqkXHotqonWYfs2L/PCZMNtvl3EGlRN1rI7LFg=;
        b=JGxCq7NhD4NYoy3DxtrOst0byfsqR0WKi2g+wM2gQZRVGsSYjp5iMY8xZ7xxRG1LvB
         f/ulN2lxbQKXrHzaf8XUkhN8bX0Hkso9s/LNea2EjuVt9hQXOu0PDn5SMBA53DgVKme2
         wd/G0u4ykd+PfcOBWcW+JGOmS3mePdncdfzdnGJAbcZw7cnw5wNcHqVEDmzLX8uzxYVO
         yKbj9LLdMDVjf4bNS/PBW/u4WFYss4ZVImQF5rXS8aNDwfGb1gdnd6xufxTJZJbbeKoA
         hA/+r8Hck/uzp/Cd3gj6bWvhMIJN8KgC/Nfp2HOAG+G5k8k4sf7ZRYy5cWff2ljiMa79
         WpkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=aXKmRuqkXHotqonWYfs2L/PCZMNtvl3EGlRN1rI7LFg=;
        b=Bwv8yEipbAvhkZOwxI8rpMZGcxGEoEm4CAM7VKyFSi2BcWU97cuE8beik6o3Rj9HN/
         RLPxTxWhDula4YcgvubP7tAy6qpXVlLUYWe2XWL1KzUOrsjFaTJZ2SQAtcA28MitINTv
         Rhl/fkDFnoSU9l/j24MOfli1vIb91xMWS+3Yh9E/8oD1b39kqG54UPlmHQyaWOcFGprg
         HBRXXZZEmbDR/nDac5K1ufPTOqyNuk6TekWieDu9OR+T95iGmvFIiSsTSZg3cINIEL0q
         iUXxvXaJhWgIJQf/ApJmHfkVvVu44Wg5VYZjUGr2xRtl1Rr+vRWrwQHe3rQ6n0ORG1Su
         P2dQ==
X-Gm-Message-State: AJIora/BMZr1hANlGpOazg1z/ooelJD2bJZKtjuzaQrB+n4Lic0OyVnt
        nupxn60+FsMEA6W7GDIf/beGtw==
X-Google-Smtp-Source: AGRyM1uVhea3xWcNM6QdeZ88fAnaalwXRMSzB9MOZg98RCK281xh8cHY9k0H/dlQwdFkTSnHqGo3Gg==
X-Received: by 2002:a05:651c:38e:b0:25d:87b1:b50a with SMTP id e14-20020a05651c038e00b0025d87b1b50amr9478648ljp.168.1658996338685;
        Thu, 28 Jul 2022 01:18:58 -0700 (PDT)
Received: from [192.168.3.197] (78-26-46-173.network.trollfjord.no. [78.26.46.173])
        by smtp.gmail.com with ESMTPSA id g29-20020a0565123b9d00b00489cc0dd59esm86551lfv.90.2022.07.28.01.18.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Jul 2022 01:18:58 -0700 (PDT)
Message-ID: <2df77e10-a052-74fd-1f30-620a51fb88cd@linaro.org>
Date:   Thu, 28 Jul 2022 10:18:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 3/6] dt-bindings: clock: exynosautov9: add schema for
 cmu_fsys0/1
Content-Language: en-US
To:     Chanho Park <chanho61.park@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Sam Protsenko <semen.protsenko@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20220727060146.9228-1-chanho61.park@samsung.com>
 <CGME20220727060612epcas2p4b844ea92fe11c302337a320b222947d3@epcas2p4.samsung.com>
 <20220727060146.9228-4-chanho61.park@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220727060146.9228-4-chanho61.park@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 27/07/2022 08:01, Chanho Park wrote:
> Add "samsung,exynosautov9-cmu-fsys0/1" compatibles to illustrate
> cmu_fsys0 and fsys1 for Exynos Auto v9 SoC.
> 
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
