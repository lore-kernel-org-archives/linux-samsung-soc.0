Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 255BFC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 19 Apr 2022 10:45:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233821AbiDSKro (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 19 Apr 2022 06:47:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242585AbiDSKrn (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 19 Apr 2022 06:47:43 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A93845F94
        for <linux-samsung-soc@vger.kernel.org>; Tue, 19 Apr 2022 03:45:00 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id s18so32104273ejr.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 19 Apr 2022 03:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yOnjnfeakbqxFzlK8WkGiM7/RlXkR35voEUsVEYGghQ=;
        b=tNXPvrwRPrdwtbEB6lfJ77vq1rmFE1peqJp+MEymzAs4HuSiZ1r8m7NzH5wm5i9ClY
         h5PCv5fKO2Lmsb4KVyPd/pTCevqjkyJZ+YJcoHhZRR2IBUUPvDkVkkVbVtaRx47Xi3wc
         ZJw73ZZqtLNGx2Y9sGA4bi/3dxv9NZLXqxHaUzHZaXeb1UUkGO4+t6hxuP+bP9P7Qbyj
         TqubiWZuvGYEQHCONAYFy4g6sSBRIJCXlmR3HBwkVc9SCRrAXIrz91a0up1ybzN4d2uz
         Z5EvD03pTLuw6h8JKtq5CikQjs9zD8H1WNCZlL8hQ8Tjzgcjif6RuL6xYIWAu105Oc5F
         PAEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yOnjnfeakbqxFzlK8WkGiM7/RlXkR35voEUsVEYGghQ=;
        b=5Dvy49ggZqIGsnzdxMvGI0L8HLG7+soxc9w3GO49NoHUcV7mVEb7k45cuvKaqwhAec
         wZHOHN03LhLD4DGZk2nREjCy97Ly6pnxGdSU7OxfgV5G00UHRM7gGuy7tTZEDZjQPtpJ
         Q1G60U5L66gQ8xEq6gnKQaWjpSS/hKgtRVZwlc80TQIQhLuqFehZohwAtcQAer2Ow7jZ
         dY7NPahrymZsnuMLmqr+5lqZbfWm/BAbtYxc+F+DnpuYbAxn+XhHlirafy6oK9VlBw8i
         unG3dOuS39OMFoT/VaNL24pkWihqjFH/iL1Ce83JQp5ritSyd+Hhl9KIA6wf074jHGId
         JSWg==
X-Gm-Message-State: AOAM530NuwTZp0SYFAwp9OWWZqXWhm/Cv/RcJKFb4PMn+XdqDy1qP1NT
        qWj1xvcrmv6oRXein9i+Nn8TdA==
X-Google-Smtp-Source: ABdhPJwOv8CJlZYU1crBAvi9zb4I0S0FXWyIFlzCT55QknepxGI6r8t/MWtUJDhx9ZpPgsX2Ft5Nrw==
X-Received: by 2002:a17:907:96ab:b0:6e8:8eac:5c15 with SMTP id hd43-20020a17090796ab00b006e88eac5c15mr12969020ejc.355.1650365099298;
        Tue, 19 Apr 2022 03:44:59 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id t12-20020a056402020c00b00422e7556951sm6010555edv.87.2022.04.19.03.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Apr 2022 03:44:58 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Russell King <linux@armlinux.org.uk>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Ard Biesheuvel <ardb@kernel.org>
Cc:     Olof Johansson <olof@lixom.net>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Sylwester Nawrocki <snawrocki@kernel.org>
Subject: Re: [PATCH v2] ARM: s3c: mark as deprecated and schedule removal
Date:   Tue, 19 Apr 2022 12:44:56 +0200
Message-Id: <165036509377.184867.10089560951309894557.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220407072319.75614-1-krzysztof.kozlowski@linaro.org>
References: <20220407072319.75614-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, 7 Apr 2022 09:23:19 +0200, Krzysztof Kozlowski wrote:
> The Samsung S3C24xx and S3C64xx platforms are very old designs. S3C2416
> was introduced in 2008 and S3C6410 in 2009/2010.  They are not widely
> available anymore - out-of-stock on FriendlyArm (one of manufacturers of
> boards) and only few specialist stores still offer them for quite a high
> price.
> 
> The community around these platforms was not very active, so I suspect
> no one really uses them anymore. Maintenance takes precious time so
> there is little sense in keeping them alive if there are no real users.
> 
> [...]

Applied, thanks!

[1/1] ARM: s3c: mark as deprecated and schedule removal
      commit: 436ce66003d5020ca02cd096761d3214e9a91d82

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
