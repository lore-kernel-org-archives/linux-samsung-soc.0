Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D271C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 21 Nov 2021 16:47:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233693AbhKUQuk (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 21 Nov 2021 11:50:40 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:60952
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232018AbhKUQuk (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 21 Nov 2021 11:50:40 -0500
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com [209.85.167.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id CF90340022
        for <linux-samsung-soc@vger.kernel.org>; Sun, 21 Nov 2021 16:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1637513252;
        bh=XsoOn3ND/sAh8NvQQ/Y8cZAkyJcKJL0OKHYA60c2Nrg=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=J57g+2R4lZJY1pViwSwuno+DQRf18ijqYdd3Mo+sVbYuz8RUyBz8I5XoIp2EiJumL
         Yp7qz7YT2cehe3O9HDO4098syfFw3f8ADCJ+Qev1VO639CTpDH2Vwgz3dz2vMKT0Vu
         1VtAQKCEuA1+ACTBglrm/WUWhGlEeBEj7ncL15O861gAm5IUIlnCTpA7kZRWBV32fz
         Qh42f3U/J7lx16lNIPbahDznxp6X16PVO3fdX0O5JnocJFz++ocCaZMh9U1njctfx6
         gPmJHMeF36J0QOWkAKr/3cxjMhZGVSjlcB6UIQlUtpLpk4Gav9Jwk3WfntyK3exrjT
         kILr5IeazFz7g==
Received: by mail-lf1-f72.google.com with SMTP id z1-20020a056512308100b003ff78e6402bso10268605lfd.4
        for <linux-samsung-soc@vger.kernel.org>; Sun, 21 Nov 2021 08:47:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XsoOn3ND/sAh8NvQQ/Y8cZAkyJcKJL0OKHYA60c2Nrg=;
        b=7wO5uRLcVbKte4sTza4hjnuZl2rmqoFH2VvRX1swQJ8Kdp4183crSTHmfZrH1cPb0s
         q1dMDIe6lXyXAmgSbwCNmS7Jo9twoS3XPHN7dACoiOP1W4dxexdSSKUUkaM5DeGSCkZE
         qvXa3vYX/weoz61Tz6JkmwdLOrNofasTIB9cvZhl3OpJmvsD5oUGm0ei2e8RnIEPh7tN
         JdsLkrvq3Sju4+5pBUW6iuK11+gJpUtxWolE77a4k6/kH8LyKwvKMAU92/dYHa1VdGqo
         eD/kXE+UqermXHBN3zR+MXEqvMFretUmS6/fP5tFt5kbEmfPiRbA6Z4NCZSfSkbVVsfZ
         mvyQ==
X-Gm-Message-State: AOAM530lqNQccvywwUKqCEWX60zUblTtAOpOhQZ9B2Rd2WZsPUiEU5cw
        FIX7pKmXxdy/IKl0V6u5DKTVwVsvIZ7fxKBUIaZDywo/Gad+5LfTC09x+sV0WuTLAMeqWmT+5dM
        FRwFs6Bdqbxc7quPrKrbi8GTWWVGInF0FA5aW4nAwZ7h7qYks
X-Received: by 2002:ac2:42c6:: with SMTP id n6mr48523140lfl.553.1637513252033;
        Sun, 21 Nov 2021 08:47:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy4hlDfeLcmS9sY/YWfSzCQe00z2kJ8KKHqYotO5YUEAImib8DLKRzP+dSEWcZ5jYW2Y1Jxyg==
X-Received: by 2002:ac2:42c6:: with SMTP id n6mr48523115lfl.553.1637513251856;
        Sun, 21 Nov 2021 08:47:31 -0800 (PST)
Received: from krzk-bin.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id s15sm631835ljj.14.2021.11.21.08.47.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Nov 2021 08:47:31 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Will McVicker <willmcvicker@google.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Andrew Morton <akpm@linux-foundation.org>,
        Russell King <linux@armlinux.org.uk>,
        Michael Ellerman <mpe@ellerman.id.au>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 1/2] arm64: defconfig: Enable Samsung I2C driver
Date:   Sun, 21 Nov 2021 17:47:29 +0100
Message-Id: <163751324653.4740.10340111836301836511.b4-ty@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211121150558.21801-1-semen.protsenko@linaro.org>
References: <20211121150558.21801-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sun, 21 Nov 2021 17:05:57 +0200, Sam Protsenko wrote:
> i2c-s3c2410 driver is needed for some arm64 Exynos SoCs, e.g. Exynos850.
> 
> 

Applied, thanks!

[1/2] arm64: defconfig: Enable Samsung I2C driver
      commit: 0e9a9debf0427164fb845403a6eb9439558f1684
[2/2] arm: samsung: Remove HAVE_S3C2410_I2C and use direct dependencies
      commit: 3ac5f9db26bb7a227ccbf160c36a5567b5394299

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
