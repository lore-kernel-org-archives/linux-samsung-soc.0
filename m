Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2710CE81DE9
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  6 Oct 2023 11:58:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232143AbjJFL57 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 6 Oct 2023 07:57:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232137AbjJFL56 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 6 Oct 2023 07:57:58 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE86EE4
        for <linux-samsung-soc@vger.kernel.org>; Fri,  6 Oct 2023 04:57:56 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-99bdeae1d0aso388763866b.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 Oct 2023 04:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696593475; x=1697198275; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+zpOjWFgV47IagH9G+/bjSRKsIxtDpcqXD/aaWOG/Mo=;
        b=R9zpl+3YcL96IFFKMEGDX3/NI1LPa6zJFUPXq5pN4yNph/hqoL+GvAfMOmKo5Or35H
         zBNGjVPblCStNmQGXOYbik1sY94Z/MQT83LBmLDc1VoETDD/nK35louBWBAhp1c0Cnn2
         6SwJUpMj9jQK5YB94lpvt6UDFW+Bx5xHTN8C706WGA8180uYO9h/tZa1bTMQGu2clKJW
         mwDdt4Mnf0bwW7bPdPcX+/ytWUR17QfPUFKlMeauGoxePejeG6/W761tTyH5V2fyboR2
         FOjz++ct1JuzYH9yYBJsZZ0kNEBrIDPSYhYZcUC1fsZnSfcH/Mp7yphVMki/A3LjnyEH
         DMlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696593475; x=1697198275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+zpOjWFgV47IagH9G+/bjSRKsIxtDpcqXD/aaWOG/Mo=;
        b=tW7SK2piEqK67oACPS9F6/VVXB7TScwgs0Tlc0TSAz5yAw+7E2xJCNSZNrUOO8sVbU
         D0TmXm4MlfLF+ypEJiyMQVTlJOCFG/uZM3ZvmJkNFOjaYMtR2QtI8wnqL7ZAveF3V5Zm
         uYGSbY6+O0pFLel5dvmFBL2uCNF8Vhyrtc7KhNGS/tUCFJORN3IgbJcKfWcHZ4QDswus
         gXraDfFDe7hIUCgIgyEqlv5da3B2aRhLygQUL98bIIdLyIRVPVBJH3FH2nMJrXKjQx2U
         w0DF2kCO9wMsCjZP1V93i7s42uXdPJ0cq1umc/fennfo6Av8qVpzXwa/3pizVa4KEPtN
         8ERw==
X-Gm-Message-State: AOJu0Yyxd8FbJH3AAeXDN7FV3yYICGUSc9ElcQT2+ztfRx8/aHfMWSya
        jIWzSH1zKJOKa2QmJ4D792/yIirY8i0gsWBTXPf0Xg==
X-Google-Smtp-Source: AGHT+IHdwXe27ayuwVviV7f3WKHG81y9E3/oY6oQIzFPhOUJPdHydVE/YV1HshMFuU3ThTLIf/52iQ==
X-Received: by 2002:a17:906:18a1:b0:9a1:c659:7c56 with SMTP id c1-20020a17090618a100b009a1c6597c56mr7059114ejf.22.1696593475273;
        Fri, 06 Oct 2023 04:57:55 -0700 (PDT)
Received: from krzk-bin.. (5-157-101-10.dyn.eolo.it. [5.157.101.10])
        by smtp.gmail.com with ESMTPSA id f23-20020a170906139700b009b27d4153cfsm2786473ejc.176.2023.10.06.04.57.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 04:57:54 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] ARM: exynos_defconfig: add driver for ISL29018
Date:   Fri,  6 Oct 2023 13:57:51 +0200
Message-Id: <169659346899.111765.18262202506429002870.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231006110631.3204334-1-m.szyprowski@samsung.com>
References: <CGME20231006110643eucas1p11d87c94c0fc765bb856f373df553f003@eucas1p1.samsung.com> <20231006110631.3204334-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


On Fri, 06 Oct 2023 13:06:31 +0200, Marek Szyprowski wrote:
> Intersil 29018 light and proximity sensor is built into Exynos based
> Peach-Pit/Pi Chromebooks, so enable driver for it to increase testing
> coverage.
> 
> 

Applied, thanks!

[1/1] ARM: exynos_defconfig: add driver for ISL29018
      https://git.kernel.org/krzk/linux/c/438fb575463fc490e6200e5e28d02159492a97f8

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
