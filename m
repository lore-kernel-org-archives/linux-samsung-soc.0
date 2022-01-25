Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E920C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 25 Jan 2022 17:05:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242621AbiAYRFi (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 25 Jan 2022 12:05:38 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:50812
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1378812AbiAYRDQ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 25 Jan 2022 12:03:16 -0500
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 5311B40049
        for <linux-samsung-soc@vger.kernel.org>; Tue, 25 Jan 2022 17:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1643130194;
        bh=Khs15J5Mbq9aHaNEf8S9OePqypIZSb0dV1fDUx3j1zY=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=K5fG8gmRWFM6AwGXI9XORP2/4TCu0+fB5XpDcuqryZPLdzr+IgL2lgFlV/b8Tg3us
         rwkI7xBAZLHQ8y+XgzB97sLsqgWfYB+V2xdAT1Fj5UQ2hd1xIT6JBdslruSrEc1OHB
         bkXvLxdVNXtayptwJ5Qy1ZNT1m8+5vrBE6Oqqt7MyuZxmnIqCiGljhdVZhiEIPa5hD
         AV0/l8d2b74/aDTvWvXWxSY4sePOjNjxpYwplbADLbmjyevZhKoz05rFIN+qfTn8Cq
         Y7hLCk+9jzFwsUIQBhmUkP6A9N+15IJe7YZMaGP7Ojet1QpJ1ycQT2m7YoUuA1l9ce
         3pjb9AJx5RlQw==
Received: by mail-wr1-f70.google.com with SMTP id a11-20020adffb8b000000b001a0b0f4afe9so3332847wrr.13
        for <linux-samsung-soc@vger.kernel.org>; Tue, 25 Jan 2022 09:03:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Khs15J5Mbq9aHaNEf8S9OePqypIZSb0dV1fDUx3j1zY=;
        b=CEHNdfyfRCXUINBbfVwyWt2UOK585qBPLwnoZ16a3Re31Pl7K9CpnG/n/KeSdF3djJ
         ChVO7VYmA3dW84dXbplJBI4Zlxs/vJxWtmBH29JCEgfLPQR4CBRMcPyKNgeQmsZw7cLb
         EsmBpYH4xk83QF/lhF8/jhWgeLm3S8ecrmgyYVtF3I8IwkgGH1slsnl/BB6zU0IE8G5w
         Kmm286qPuZvjbMV67ghd+7S5wUQM2ULcYJXdboB5+3DbxT2CBjzQdEHuLVA9X8LX2BS/
         /zES90LHezCrvNiUU8Ng5i7sl4qTRpvJev5FdBCyJVxmnsPxJYAsDNLWoqJi5Z82wfPT
         awYQ==
X-Gm-Message-State: AOAM532c60bHO4QIlNXwmYH8PdIfLU3Vty7HHm2edCJiMQkcUVMUHbon
        mV6D8s5PGvTG0U/KQhEqBsMv0vsanuDJuPl3dKzOGWIgvfgQHT8MLOWMZhkzcF5g0s0r98N2KZJ
        xHu8cH3tyl+x58A/pNhmdf9QtiWwb0EypxotbEyyTNaH2m6wD
X-Received: by 2002:a5d:4343:: with SMTP id u3mr18313344wrr.504.1643130192796;
        Tue, 25 Jan 2022 09:03:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyG9zjm9t7btrydRtRdnKDOUoYdpl+wsZCbJPwqP/WbdmBoRfkoAn21BZz2+hcP67O92cBkLw==
X-Received: by 2002:a5d:4343:: with SMTP id u3mr18313323wrr.504.1643130192571;
        Tue, 25 Jan 2022 09:03:12 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id i3sm17162548wru.33.2022.01.25.09.03.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jan 2022 09:03:11 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     linux-samsung-soc@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 00/12] usb: dt-bindings: samsung: convert to dtschema (subset)
Date:   Tue, 25 Jan 2022 18:02:30 +0100
Message-Id: <164313008959.78836.16134870344795249201.b4-ty@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220123111644.25540-1-krzysztof.kozlowski@canonical.com>
References: <20220123111644.25540-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sun, 23 Jan 2022 12:16:32 +0100, Krzysztof Kozlowski wrote:
> Dependencies
> ============
> None.
> 
> The DTS patches are independent and I will take them via Samsung SoC tree.
> I am including them here just so automatic robot checks won't complain about
> DTS differences against newly dtschema.
> 
> [...]

Applied subset, thanks!

[01/12] arm64: dts: exynos: add USB DWC3 supplies to Espresso board
        commit: 31c33503fdb3965d6aaf0db4a8c42e7d8cef1dff
[02/12] ARM: dts: exynos: add USB DWC3 supplies to Arndale
        commit: 52d53d937da8889964c60216a0333cb19fe0812d
[03/12] ARM: dts: exynos: add USB DWC3 supplies to SMDK5250
        commit: ebbb07b8d349fc2eccb67780850d2d1bbfc918d6
[04/12] ARM: dts: exynos: add USB DWC3 supplies to Chromebook Snow
        commit: 9745be7b5a3be39a00e6bbda3305e2d789ee4082
[05/12] ARM: dts: exynos: add USB DWC3 supplies to Chromebook Spring
        commit: 111ea2d6dd217684db4e7a97a2bda3bf14734427
[06/12] ARM: dts: exynos: add USB DWC3 supplies to ArndaleOcta
        commit: 0a14272479627bb9388ece3b0ebac72a3928062d
[07/12] ARM: dts: exynos: add USB DWC3 supplies to Chromebook Peach Pit
        commit: 7adf978462dadc41ea7d4138de53bc9a15922191
[08/12] ARM: dts: exynos: add USB DWC3 supplies to Chromebook Peach Pi
        commit: 72477416ac12e88384a96575c5f2e4bd7ac8feeb
[09/12] ARM: dts: exynos: add USB DWC3 supplies to SMDK5420
        commit: c441d2d73107fcb45c0affb345fe6b9bc3fd3bab
[10/12] ARM: dts: exynos: add fake USB DWC3 supplies to SMDK5410
        commit: 4043114504cc05d0a7ca2a061838699b500599cd

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
