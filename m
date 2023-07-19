Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB609EB64DA
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 19 Jul 2023 07:36:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229644AbjGSHgb (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 19 Jul 2023 03:36:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229875AbjGSHgX (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 19 Jul 2023 03:36:23 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF1601736
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Jul 2023 00:36:20 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-52165886aa3so7551188a12.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Jul 2023 00:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689752179; x=1692344179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ASco8vj7+XaPQen56URwDE1RtWpxUMyxaWBEjOtEJHo=;
        b=Cnz1csnoz89sYWUFjF5+rCspweC7RZvwPEU4Cg5MAF7UKpXzochmOa/qauV3CKgkjv
         fAJRVMXPFDrQNYOPUKdgZ7EU7ck3LB0bn8XcyOtCVRNMpYOcRn5TYaARwdkfvI0h4Vyd
         N6SGOv0GYyy/lVRTQFQF11PtuSiZi4ZBakUZUOGM/IEt7aPqg2Il7ZUODmJExn5d/QHq
         uYoqJS3rLdn9zbPr87U1Djc03IfPrAvt/2/XB/dzfMVqRMXfoq6t5q+f2DvhwH05s6Xo
         I8HdO07cSAQ1BJp6rwLZvx+SFNFdw1/iwSqYgVw+BPHGQMPlCDAW+CAwVbvhe2rKd0px
         kXKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689752179; x=1692344179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ASco8vj7+XaPQen56URwDE1RtWpxUMyxaWBEjOtEJHo=;
        b=cj1Z20wR9xdw7dOvcMrzanFRiQuP693bLUfdcRacBNOF338E6seTAC/zvU6nKQDAzu
         M8232DvQGXhPims9GpFvSams9iOQpyL7kZGIAPi2LX/q825vDIJJs68GkZh4XaFzu+/E
         iumMNFUYp97HsePwkNPWpzMvs06F9o4FVf6P7AR9MzUvqv6X27JYbExCnLFmNbzHPBmc
         obnZ2pbWNylqc3lod8NSFb09uf0qmzBntoI6mpXaSOXnaE1E0y2hktncSpYbQ5G1mPN2
         affvSfeJ7zYV4bEenRrdk//W/jydmdM7Apiy7rmSobNLPMVCCsO1pkqmN6oY2DmSj3KR
         qPag==
X-Gm-Message-State: ABy/qLbPCCpgMSFw3VWhx7qHKqJL0r7WdEdWo/ZYG8jpjZHIpU33HgsT
        M8W0rtr7i+KUWSB4q+4geqmtGQ==
X-Google-Smtp-Source: APBJJlEKMYKstWVoOwy2osy2Orx7A7obEkkxdyX2eTBoa5l4pHTs29W1yKNfhK6tTJHPkKTVCn1cOA==
X-Received: by 2002:aa7:c74d:0:b0:51d:ad03:95f with SMTP id c13-20020aa7c74d000000b0051dad03095fmr1780896eds.7.1689752179304;
        Wed, 19 Jul 2023 00:36:19 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id v5-20020aa7cd45000000b0051e069ebee3sm2310594edw.14.2023.07.19.00.36.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 00:36:18 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Alim Akhtar <alim.akhtar@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/2] ARM: dts: samsung: s3c6410-mini6410: correct ethernet reg addresses (split)
Date:   Wed, 19 Jul 2023 09:36:11 +0200
Message-Id: <168975215984.14599.16321800531414229232.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230713152926.82884-1-krzysztof.kozlowski@linaro.org>
References: <20230713152926.82884-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


On Thu, 13 Jul 2023 17:29:25 +0200, Krzysztof Kozlowski wrote:
> The davicom,dm9000 Ethernet Controller accepts two reg addresses.
> 
> 

Applied, thanks!

[1/2] ARM: dts: samsung: s3c6410-mini6410: correct ethernet reg addresses (split)
      https://git.kernel.org/krzk/linux/c/cf0cb2af6a18f28b84f9f1416bff50ca60d6e98a
[2/2] ARM: dts: samsung: s5pv210-smdkv210: correct ethernet reg addresses (split)
      https://git.kernel.org/krzk/linux/c/982655cb0e7f18934d7532c32366e574ad61dbd7

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
