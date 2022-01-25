Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BDD8C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 25 Jan 2022 17:05:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239236AbiAYRFd (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 25 Jan 2022 12:05:33 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:50790
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1376949AbiAYRDO (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 25 Jan 2022 12:03:14 -0500
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id B89853FFFC
        for <linux-samsung-soc@vger.kernel.org>; Tue, 25 Jan 2022 17:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1643130191;
        bh=rw3iKwjHVF1T+M8vGLUxyKNks1I9pnaON9d7P08zG0k=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=cTm+Bsvs5cdjF6YbRi8GGCFZzHHJPieTzdu5pRTe08/BOS9qGDfaBYv7CXqcKsRH2
         2EnGDxjYAv5zhOt1GdefRhbNgIukaC9iRamVesqG9khJvYIimQszWcwFCv4cVZmlQH
         YGxBNGRBzLrMC2gBEkVu2GCi/QaQZRc1q7s3WxpVEKT5DmorMTtQzP2rKVc6oMihQx
         ZMHY23fH92+2acs7Q6LRGgy4g4DwSR1FuvRdApQVExL0+JT3JcawBFIj2QGHiVNri/
         z5wuC2H/mZWoxXRRWQdH5yVGBxEhFpfy244/apAaOLrkq1EHqRlujvqe7vum9ZyTRr
         HGgEcdSy+F4Iw==
Received: by mail-wr1-f70.google.com with SMTP id m17-20020adfa3d1000000b001dd66c10c0cso809358wrb.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 25 Jan 2022 09:03:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rw3iKwjHVF1T+M8vGLUxyKNks1I9pnaON9d7P08zG0k=;
        b=lfSnVkJrT9BwgXoUfqkoX9yqNZg/A0eTWhEFLVzKngc2yRzc1l0TUJFdqeteCcXdh/
         1HSRUAhRzRpDf0UtbRULjw3/QzgNGTKUbS5TI7Ey+D+KeUDCHaISJ31nvmzsBrNgUVDP
         3l3iKcG3+3g2cJOylEJ0/SxgloTCTZqLExFle95UA6hsDYTrTJn8VeVGGQv7GzWENCAE
         x7OLiHxqJaajsZxdP+17Fdaf23xG5uxyS/cJ0QVgc6NueaLDg/xH1hkyAKUuxMZl3f7n
         kwlY9zTyVVdxUYX+Jjf6DHRoSl2FS/8jYBFG/szBM7PNqIfLs67d/9ZjIMuE5BC1lUFl
         OoCg==
X-Gm-Message-State: AOAM532A5KimzTUav9YmO1gy9Ilpk4YCFg1cloU2wsCmvRq2cR4VcoNB
        U04xD118drGHNwQ2Li+J/i9j016Gv97F5L2OSiZLasPZr3/TSLr/cbxssdLvEsDBDQ3JXXBPJgi
        8Kq854TPMBnnsd7KlQ7e3LbAITKcWrgrGYMhyeISYeH5z3+t6
X-Received: by 2002:a05:600c:1912:: with SMTP id j18mr3688452wmq.155.1643130191280;
        Tue, 25 Jan 2022 09:03:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJytGJ9TI5VtzIsjGQXHuW43/peZ43AFiVhcRxKrAIWgj3XRztUpx3XwN+qMJZWd1jMpp/rqWg==
X-Received: by 2002:a05:600c:1912:: with SMTP id j18mr3688422wmq.155.1643130191014;
        Tue, 25 Jan 2022 09:03:11 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id i3sm17162548wru.33.2022.01.25.09.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jan 2022 09:03:10 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
        Henrik Grimler <henrik@grimler.se>, virag.david003@gmail.com,
        m.szyprowski@samsung.com, cw00.choi@samsung.com,
        ~postmarketos/upstreaming@lists.sr.ht, alim.akhtar@samsung.com,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        devicetree@vger.kernel.org, semen.protsenko@linaro.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH 0/2] ARM: dts: exynos: Add support for Samsung Klimt WiFi
Date:   Tue, 25 Jan 2022 18:02:29 +0100
Message-Id: <164313008959.78836.16815768434682839337.b4-ty@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220124131241.29946-1-henrik@grimler.se>
References: <20220124131241.29946-1-henrik@grimler.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, 24 Jan 2022 14:12:39 +0100, Henrik Grimler wrote:
> Klimt WiFi has product name Samsung Galaxy Tab S 8.4" and was released
> in 2014.  It has similar hardware to exynos5420-chagall-wifi and the
> two devices can hence share a common base dtsi.
> 
> Same issues as for Chagall Wifi applies: CCI has to be disabled and
> only 4 out of 8 CPUs are brought up at boot (see
> https://lore.kernel.org/r/20220118185746.299832-4-henrik@grimler.se).
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: arm: samsung: document Klimt WiFi board binding
      commit: 8d4d0d7c43e6f87df02a0acac206b50c265962d1
[2/2] ARM: dts: exynos: Add support for Samsung Klimt WiFi
      commit: 21fc732222559c7b5a8731571d30501d5fcb631c

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
