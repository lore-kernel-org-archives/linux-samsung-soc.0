Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0643EC433E0
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 19 Mar 2021 10:37:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C8A5264DE1
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 19 Mar 2021 10:37:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229648AbhCSKg2 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 19 Mar 2021 06:36:28 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:40346 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229791AbhCSKgL (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 19 Mar 2021 06:36:11 -0400
Received: from mail-ed1-f72.google.com ([209.85.208.72])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lNCUE-0000sh-0Q
        for linux-samsung-soc@vger.kernel.org; Fri, 19 Mar 2021 10:36:10 +0000
Received: by mail-ed1-f72.google.com with SMTP id h5so22661777edf.17
        for <linux-samsung-soc@vger.kernel.org>; Fri, 19 Mar 2021 03:36:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ktHOzWahPd2LQ9icir3lUZmC+ztJuw75XTCkzt8BS98=;
        b=Rrbx9fb5Y92OYT2OqwAikL4rAFJUb+t6PhfFuCGZFUL/nyDU8JWa5chDz/4cCdjIyP
         1ISXeOtl8AijKDWBr9p4SrpX1i3zD3eiW9/Rxzlp5il/KB+H8vklgoYnVBsCTE+qd0Rb
         QJ1siWvh46RnjWTX240cyLnlKrkflBqvcswI9sxCqE+AlqlqypJw2cAPHAbyB/nkxKSK
         lMlhyGqyOTMFCrufzNr7H3ioZTCA9DUhagUxwWbBiOjkcDiuWORiv97qhdfhbrc+dNIU
         0weOtlPayLgc9YzwFJkOxZpfA4PtOLO8l6bxNy4WQH1vme6Yn+5jvUO8kZByQUcPKzuJ
         Papw==
X-Gm-Message-State: AOAM530KyS+EV8j+hgRGm/q9l49mEbp/HP/vtMYXgUgJmAznoQQloDFy
        Zz00gdcXHjkiPdRoZ8lmxTtxAiSYXvZFOXWHCiXYd6bGShsN8KK5kip9SLRdwjlKpj2xQAJMJNk
        CpUvn6mMG9RKQNKMWPO2viptWV6k6W73/1EUSlnF6Vv/JYlh1
X-Received: by 2002:a17:907:72ce:: with SMTP id du14mr3504501ejc.301.1616150169797;
        Fri, 19 Mar 2021 03:36:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwAQyLtHwJgaaBm7E08MxH7vvE0tikBi/QO2/jypkyZkmGfwIH5ycZjFx2iwfpRXblNOupoDg==
X-Received: by 2002:a17:907:72ce:: with SMTP id du14mr3504483ejc.301.1616150169636;
        Fri, 19 Mar 2021 03:36:09 -0700 (PDT)
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.gmail.com with ESMTPSA id h8sm3822589ede.25.2021.03.19.03.36.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Mar 2021 03:36:09 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 1/3] ARM: dts: exynos: replace deprecated NTC/Murata compatibles
Date:   Fri, 19 Mar 2021 11:36:05 +0100
Message-Id: <161615015846.19086.10537563136172847080.b4-ty@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210315124313.114842-1-krzysztof.kozlowski@canonical.com>
References: <20210315124313.114842-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, 15 Mar 2021 13:43:11 +0100, Krzysztof Kozlowski wrote:
> The compatibles with "ntc" vendor prefix become deprecated and "murata"
> should be used.

Applied, thanks!

[1/3] ARM: dts: exynos: replace deprecated NTC/Murata compatibles
      commit: 61342bc64d03d88fbdddde6247f490504257f36d
[2/3] ARM: dts: exynos: white-space cleanups
      commit: 4a4f3a07a5c419ee8e527ff2c9a35eae93c3d04e
[3/3] arm64: dts: exynos: white-space cleanups
      commit: 7d2636e9d6dd884ae2ec6127f29963d4da0dfe6e

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
