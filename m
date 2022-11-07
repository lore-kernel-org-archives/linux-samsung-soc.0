Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E5BDC43217
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  7 Nov 2022 14:36:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231376AbiKGOge (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 7 Nov 2022 09:36:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229638AbiKGOgb (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 7 Nov 2022 09:36:31 -0500
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD5DC21A
        for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Nov 2022 06:36:29 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id u2so16578142ljl.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 07 Nov 2022 06:36:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LqIVZEeBf3uiHZU4NmaZFcaInDSQv2WV0V3yZxmUSaM=;
        b=yriZm8CvC+/u6Ha3VhxGKctXjrWrVtg04n+IwoYHZrkNOK1i4AZyiQrN0r5smL+q/Z
         rMDrz/WV9fTd+TWZurNqWfGl9UVEPubVX0HsnsOTuRkASKznAQ+Py1NI8k6AZIb45bn7
         JjgadSRwG92CPFIrd80y8SVbIHEuMq8C8SnmeK86rgOhQcZhwLBvOuldlkmHXIRK+fKf
         xDPbJfjutvOTiUsRrKaebBS8bohdPmB3HeEXgMoULGexEzAyFTwyaS67LHs465jt8Vuu
         1d+xKFJYqSHms60eWWkaFFmFiVol3KEfwD20ekcqoJRli8n9ChHhO8TakrYLsBvqYUqU
         yelQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LqIVZEeBf3uiHZU4NmaZFcaInDSQv2WV0V3yZxmUSaM=;
        b=ktQdCFmxWMiJ03XykHP3kel/GJ8AUYepGPwfR8XzPAmmk31K7/tt5aNKZu3k159v5Y
         8GuzX3V+6X+QXvKgHj82nyn87yQ+HQx7uaOE7yUaht8LZBxFhmC7SwHIB4+5oY11XkCC
         zjAM3d+XC0oGZpCtP4IrxuhsdCtOZLYT6X/kSnR4Zhv6+Bs/fdWxMxumrLQgr4w9PHqE
         QERPFb8u0/fAYjvGcMZk+zGRQpu5CB3ewPeEQL/NvI7Kscdo9z9Dy2IQRX31xddIl4xz
         zQFlmwW4oGTIeAFUf9hQAxL2x/0tYd8mf2OYpfgcvroLyQv1itYlm3q8X5kzqwTwuoP3
         OHkw==
X-Gm-Message-State: ANoB5plpE2WYGDF7IbUChKU9/FV0K+Ejnt+B5a+fRz+2zj8blTB51Hl+
        YO/L0Y3OV9y/uMIbUfRbamcnEg==
X-Google-Smtp-Source: AA0mqf5RmQNBqtBRxyGo20Mn+gZ2BBYK+tzFf/gbojSwxL0JPqZy60SjJAwKKAFCXqi8QNURwjvKjQ==
X-Received: by 2002:a05:651c:212a:b0:278:a461:cb7d with SMTP id a42-20020a05651c212a00b00278a461cb7dmr1576286ljq.246.1667831787939;
        Mon, 07 Nov 2022 06:36:27 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id v12-20020a2ea60c000000b0026fb5525ee4sm1250408ljp.116.2022.11.07.06.36.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 06:36:27 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     s.nawrocki@samsung.com, tomasz.figa@gmail.com,
        cw00.choi@samsung.com, chanho61.park@samsung.com,
        alim.akhtar@samsung.com, sboyd@kernel.org, mturquette@baylibre.com,
        robh+dt@kernel.org, Inbaraj E <inbaraj.e@samsung.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        pankaj.dubey@samsung.com, devicetree@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: clock: exynosautov9: fix reference to CMU_FSYS1
Date:   Mon,  7 Nov 2022 15:36:25 +0100
Message-Id: <166783178314.199427.8409536178718528714.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221107124337.114135-1-inbaraj.e@samsung.com>
References: <CGME20221107123641epcas5p26e310f1ab6addb4fa6757f5147b8e50b@epcas5p2.samsung.com> <20221107124337.114135-1-inbaraj.e@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, 7 Nov 2022 18:13:37 +0530, Inbaraj E wrote:
> Fix reference to CMU_FSYS1 mmc card clock to gout clock instead of dout.
> 
> "gout" is output of a gate clock.
> Unlike any other clocks, the fsys1 mmc top clock does not have a divider.
> So, it should be "mout -> gout" instead of "mout -> gout -> dout".
> 
> This fixes make dtbs_check warning as shown below:
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: clock: exynosautov9: fix reference to CMU_FSYS1
      https://git.kernel.org/krzk/linux/c/4854e8b083d800b421c02d3a8482fbfe27fb33ec

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
