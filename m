Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94D6FC636CB
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 29 Jan 2023 10:40:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230076AbjA2Kku (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 29 Jan 2023 05:40:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234832AbjA2Kkt (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 29 Jan 2023 05:40:49 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 296A521961
        for <linux-samsung-soc@vger.kernel.org>; Sun, 29 Jan 2023 02:40:48 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id r2so8620109wrv.7
        for <linux-samsung-soc@vger.kernel.org>; Sun, 29 Jan 2023 02:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WTwkJvcPUrpwZiiyAmt+AbMNJ4mVdgy4sHB5+zTj2Pg=;
        b=uO6e75lqdSMfis8OvU8JhWvvaJ9c5ob4xgN1sgkBaTXIyeawBKrDMb6rUi53agxzHe
         pIZQJNUGj/kWzhZRutsj3i5kTdIabUDQFJ5EtQ+HMPYYTGq37WmIYSZ26DAfEVS7zS25
         tT9c2CWl4BMFEIwKcMW6/G+z0MvEdWZeod9LaLup5bbveBkfuFU/r0A2w2Iab03sYYXP
         EeD/rvDp90oHrkZ34nt8js9BQMeoXitZBNvZFK7w91jG7Mit87xAxLgAgh8b5miD3teD
         EFLZtGZEtHYkTslzAdfR7wgLVEPVMDM8TaVOBuu/S9xHpd0NPonhaQUML+TjHg3zf3MQ
         J50A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WTwkJvcPUrpwZiiyAmt+AbMNJ4mVdgy4sHB5+zTj2Pg=;
        b=ZiV9KGKUIyi5fYnMX5whtBwBqCkiuMYFNIWRCWhiIAMte5n4Fi+maNOIgsUUPPx/JY
         N+7jyI2B4TimiJBiADz86NlxR+paSeCogG6vgwzMxM/ffOxIB1PTtnlzDkdD00h4R0di
         7rsy/ILow3HJc/+sTFe1kAuBVNamLqt5WmkaSSJj7SlPSoAz1jqxyZHei38tNcJHkwvI
         XTuFxe5LJFswA+P/yyFlBuZw7qYfUWr2/kdv3GM7fXFvU/eVgEnXN+vXlhL2bUpMaedB
         3L2//XeiO2/cHyrecXi7oHz6J6nIkT8jm4/61YXk8shul0TIrJkBjXnCNsSOnhwIhv2i
         WvcA==
X-Gm-Message-State: AO0yUKUdnw0oMu+C7IiQtk8NKvq7HW1hT7+MNrYNGiA8JwvPkdgsk5eK
        BFJgaC8RZBwo0TXKRKzpj11g7w==
X-Google-Smtp-Source: AK7set/U+PC85o/YvokMdexkotM1rpAn60AO1HioKLDFsHVLdiA2SUgO2/3nJEIAjhm9WIUc6sOihg==
X-Received: by 2002:adf:f14b:0:b0:2bf:e552:6b0 with SMTP id y11-20020adff14b000000b002bfe55206b0mr2779650wro.36.1674988846739;
        Sun, 29 Jan 2023 02:40:46 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id m2-20020a056000180200b002bfb5618ee7sm8803443wrh.91.2023.01.29.02.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jan 2023 02:40:46 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>
Cc:     replicant@osuosl.org, Marek Szyprowski <m.szyprowski@samsung.com>,
        ~postmarketos/upstreaming@lists.sr.ht,
        Sam Protsenko <semen.protsenko@linaro.org>,
        =?UTF-8?q?Martin=20J=C3=BCcker?= <martin.juecker@gmail.com>,
        Chanho Park <chanho61.park@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        phone-devel@vger.kernel.org, Henrik Grimler <henrik@grimler.se>
Subject: Re: [RFT PATCH v3 1/4] ARM: dts: exynos: add unit address to DWC3 node wrapper in Exynos5250
Date:   Sun, 29 Jan 2023 11:40:40 +0100
Message-Id: <167498882910.7239.13125754726151786735.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230127212713.267014-1-krzysztof.kozlowski@linaro.org>
References: <20230127212713.267014-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, 27 Jan 2023 22:27:10 +0100, Krzysztof Kozlowski wrote:
> Neither simple-bus bindings nor dtc W=1 accept device nodes in soc@ node
> which do not have unit address.  Therefore usethe address space
> of child device (actual DWC3 Controller) as the wrapper's address to
> fix:
> 
>   exynos5250-smdk5250.dtb: soc: usb3: {'compatible': ['samsung,exynos5250-dwusb3'],
>     ... } should not be valid under {'type': 'object'}
> 
> [...]

Applied, thanks!

[1/4] ARM: dts: exynos: add unit address to DWC3 node wrapper in Exynos5250
      https://git.kernel.org/krzk/linux/c/47fea512b4bd18b0a69142f85bf1863c221539ef
[2/4] ARM: dts: exynos: add unit address to DWC3 node wrapper in Exynos54xx
      https://git.kernel.org/krzk/linux/c/27be20e3b9d125f2c1b066d1d238c67bf5b89dc3
[3/4] arm64: dts: exynos: add unit address to DWC3 node wrapper in Exynos5433
      https://git.kernel.org/krzk/linux/c/becad83e0f2a54c8a43ece3f0437b72842278a42
[4/4] arm64: dts: exynos: add unit address to DWC3 node wrapper in Exynos7
      https://git.kernel.org/krzk/linux/c/28dd277e54ebb499bc59c166078596767bbbbdd7

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
