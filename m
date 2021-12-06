Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81B72C4332F
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  6 Dec 2021 08:30:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239361AbhLFIeS (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 6 Dec 2021 03:34:18 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:40336
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239335AbhLFIeS (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 6 Dec 2021 03:34:18 -0500
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com [209.85.208.197])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 32A8B3F1F8
        for <linux-samsung-soc@vger.kernel.org>; Mon,  6 Dec 2021 08:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1638779449;
        bh=Tml629Uq95zSJI5V07nE+j3CNsdC1fLdTAkBUTpIiTI=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=r4G3bayU0h2ctLOth5lPk/hJ3MB43Uew1QPSiLgsPQ0iDVWeTfKj9a1fnfwibc/KQ
         xQN2rSd2cq+aenMx6YJqXBGTQJpgZ8t/aHcUVPKqdOPask/FOg8nDYWc206EXq+jQl
         TAsJMuYxGsDwQ9d4WVabRuxny4BOiEOzuGFwSWuVukEo4Wjf1SdlZgJrOQC+97kCt4
         zsOCDmmap011Inh7oKHyNrYzqRWRbHBMBWnnaAOzHeuobaNHgH110miZF0nKSEYEx4
         aqtKX1HGxy2L1I8UGztii3mPTq8nF6FS4vhFIwGkXgh12G1OorLOmzO2eV4cdfDijR
         J0JkbQzt12mfg==
Received: by mail-lj1-f197.google.com with SMTP id r20-20020a2eb894000000b0021a4e932846so3182859ljp.6
        for <linux-samsung-soc@vger.kernel.org>; Mon, 06 Dec 2021 00:30:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Tml629Uq95zSJI5V07nE+j3CNsdC1fLdTAkBUTpIiTI=;
        b=74b17/l2E797rNek1iCGi6gbHD3uGut/pM3T1XDolqtd62F7h6+ZUXnEKLslZXykiQ
         a7oXcRZ12bJ9CqJ2Yb9ugXslEVD4imVgYx3Vdbe53BOBB9HHUdbZNJ6r/GuGlasRkDBk
         INHuvHZoSPgh4MmPhYOmtNPwiarF9ypgtsltDyBZgGRCD5OF71g27NGmKW2Tg3n2kALF
         zHU1VQx7TCwZmv4/24V610YJOjIRnpkQgwYhJCg+yoLXW2jZgFYnnEjMPw20igvvrUqU
         wxNGQ98k00MFIKATo4oykKzXjVSAZgp0FXDZl7CQF179Dd5bls5q7auPTabVfiwOYz6+
         dQDQ==
X-Gm-Message-State: AOAM533UMHPGjRewVnzSfzyZKFSdgcPdog/MOaeZenniApuDZmBeGwZj
        joGBkNwDjILDeu9Yz7Pc002iEXcldTt2c9sHLvpN9IinWXaSNV1hSZcnuTBZSJ7sJGyxxAASWNh
        PSnD0d0qdIcTmPX9eunsnMI+KF/jPmitlvSCdnHHjP250ieIV
X-Received: by 2002:a2e:bb98:: with SMTP id y24mr33106627lje.315.1638779448592;
        Mon, 06 Dec 2021 00:30:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJytdYeVEp8v2mHGvAwVxlTa1ujpCO/yCzbLFBVXrJkqZz7YKMn2qMy3HQWA7KgUSveKen3jGA==
X-Received: by 2002:a2e:bb98:: with SMTP id y24mr33106604lje.315.1638779448263;
        Mon, 06 Dec 2021 00:30:48 -0800 (PST)
Received: from krzk-bin.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id m15sm1296249lfp.9.2021.12.06.00.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Dec 2021 00:30:47 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Youngmin Nam <youngmin.nam@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        David Virag <virag.david003@gmail.com>,
        Jaewon Kim <jaewon02.kim@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>
Subject: Re: (subset) [PATCH v2 RESEND 7/8] arm: dts: exynos: Rename hsi2c nodes to i2c for Exynos5260
Date:   Mon,  6 Dec 2021 09:30:44 +0100
Message-Id: <163877944232.78791.17720968863028259612.b4-ty@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211204215820.17378-8-semen.protsenko@linaro.org>
References: <20211204215820.17378-1-semen.protsenko@linaro.org> <20211204215820.17378-8-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sat, 4 Dec 2021 23:58:19 +0200, Sam Protsenko wrote:
> In Device Tree specification it's recommended to use "i2c" name for I2C
> nodes. Now that i2c-exynos5 dt-schema binding was added, it shows some
> warnings like this when validating HS-I2C nodes:
> 
>     hsi2c@xxxxxxxxx: $nodename:0: 'hsi2c@xxxxxxxx' does not match
>                                   '^i2c(@.*)?'
>     From schema: Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
> 
> [...]

Applied, thanks!

[7/8] arm: dts: exynos: Rename hsi2c nodes to i2c for Exynos5260
      commit: 29bf0ff5ae18ad1a6dd183569cc097e578052c57

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
