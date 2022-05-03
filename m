Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A10E5C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  3 May 2022 09:17:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233343AbiECJVT (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 3 May 2022 05:21:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232033AbiECJVT (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 3 May 2022 05:21:19 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D64C1F616
        for <linux-samsung-soc@vger.kernel.org>; Tue,  3 May 2022 02:17:47 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id m20so32220246ejj.10
        for <linux-samsung-soc@vger.kernel.org>; Tue, 03 May 2022 02:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=iR72bbWvs9heDvh62xMCV9iFDgybIOyf+rVEB/GIUpQ=;
        b=ROwKzvPYEOarkoqa9kRjs1uVrWKgVFaRoKUprIzBUyM2hblSPezuhoC07IoPjKG1D7
         23e32psmRKgF3CqymtQpngjV/SVmpnpwNJBdxpdQu9exqGsh11rWPqtmRX5elqdN5gzF
         f14lBYs49n55OgR8+un++3PVLiOja+ciVdq3uLryVpB7xiMPivfQILIKFYxpv610uzRb
         e0rlGKb07EEpcKhHsw02aC6XsbCcL0e6C68pknVIs7bJA2Xv0mDHqxGeoQeHpcgIG/su
         OIm9G9vfthmTrYBVV6x1yh0my3Q1eQivrUqvSKOsJ9xzuG5XjZfEIQYYb182D5PWSV2E
         hC0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=iR72bbWvs9heDvh62xMCV9iFDgybIOyf+rVEB/GIUpQ=;
        b=i7R6cG4ZSAmjTqfWNwE8lXBQvMxzBCNo7+jAu4FsqHLSG9X4QZf/5nlwCX3SShmVRc
         tWQ+YEdgJ/p6cqcyv/mFt2QLU6Y3ZyVfi7/uyJ+iggLHzRh/pWN0g65LBiheP0QuxEsS
         d9LiP2BD4H8MuOmWAF5vWSH2OnGBmv4LNRbcpfd1EDIsNOVtzwWHRGCSZMh51j7PP68G
         aQOoYDc2e+O9/qWHffoMaCL/bij76ccihMKQ15osnCnmBmigitBUTVjpwZZQg+gNfJUZ
         WtaEyS5zBdoGftlFm1v4nWD0ylutYryOhlcNwl6zml44T1L159OrTTex+11Ytsa5i9pa
         0Gvw==
X-Gm-Message-State: AOAM530lWZOGoE05S+f/ifDSbbDXBvBtOib33/nvsOeA5Rxiye67NYji
        21FI38n0wx/qk1Rmf2vFcZDC5g==
X-Google-Smtp-Source: ABdhPJwzOtlBNhXhfOLMHBbN/di8NCBaswGBqyVJhPNWFM3lWkDTAWSV631mD6ikfNAUcZU8cYnv/w==
X-Received: by 2002:a17:906:478f:b0:6f3:d0b7:b254 with SMTP id cw15-20020a170906478f00b006f3d0b7b254mr14538388ejc.562.1651569466200;
        Tue, 03 May 2022 02:17:46 -0700 (PDT)
Received: from [192.168.0.201] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id g7-20020aa7d1c7000000b0042617ba63b1sm7658747edp.59.2022.05.03.02.17.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 May 2022 02:17:45 -0700 (PDT)
Message-ID: <2b7d03fa-e0cf-e46b-787a-8e9b932f9970@linaro.org>
Date:   Tue, 3 May 2022 11:17:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 09/12] clk: samsung: exynosautov9: add cmu_peric1 clock
 support
Content-Language: en-US
To:     Chanho Park <chanho61.park@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Sam Protsenko <semen.protsenko@linaro.org>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
References: <20220502090230.12853-1-chanho61.park@samsung.com>
 <CGME20220502090101epcas2p38a695a825488201724663ba7f5302b2d@epcas2p3.samsung.com>
 <20220502090230.12853-10-chanho61.park@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220502090230.12853-10-chanho61.park@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 02/05/2022 11:02, Chanho Park wrote:
> Like CMU_PERIC0, this provides clocks for USI06 ~ USI11 and USI_I2C.
> 
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof
