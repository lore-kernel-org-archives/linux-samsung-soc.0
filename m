Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87E4AC4321E
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 10 Oct 2021 17:17:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 66929610C7
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 10 Oct 2021 17:17:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232452AbhJJRTc (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 10 Oct 2021 13:19:32 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:33690
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232469AbhJJRTb (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 10 Oct 2021 13:19:31 -0400
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 22A813FFF4
        for <linux-samsung-soc@vger.kernel.org>; Sun, 10 Oct 2021 17:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1633886251;
        bh=u0/mmDKbEck8WeT+fwXTrJ3+XiT83o8RI6Fb1vkOIIs=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=raJkXc79xY6YBhrzXmFfp1WOp0xNQgC+HhfeSWsaBOxvGQ9c2inTNCaheCavbULcg
         +6k1TUF1ElhhJjm8eALNAvWMP2Q6zypgtNtxmMhO731UEt9X5xstj3hDwRU29jH16d
         e5N5l1Nshx9Nf/ckX9W//aCp44J4auDevn6UZC4fKpfXFFcpxBM3erd9JWkYrgK5iO
         nrm1L/8wQ4iy3fV0me2YZok0wCrj5VQ7cqwQwdo76lR6kDIUN5f2hAuy3vAt3qPVn9
         oeG/YYIVNRWaR6LtpmYEf6FWp+x6h3tvG+TgWTnJk6Fg5bu8k5bdQkKN+07Yufx6DX
         jp77JVRl5Vpfw==
Received: by mail-ed1-f71.google.com with SMTP id u24-20020aa7db98000000b003db57b1688aso8299913edt.6
        for <linux-samsung-soc@vger.kernel.org>; Sun, 10 Oct 2021 10:17:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=u0/mmDKbEck8WeT+fwXTrJ3+XiT83o8RI6Fb1vkOIIs=;
        b=XM3YbC5CTQNRsw/iGhQM93Z39Smr61SOFCHf2AuAbcD8cgb3QgzDM+lxUNhD5Uv4zO
         a+8tEgVqDUMfMO957YdQ8jcgc0R+IENG7PmMHMOO4RYBiarcQi4ZkQXxh1qoVu2zPUhh
         a+aPOsg+y96mfpxmPXBHAEpI1Q3JQa7qSjzsRPOEi8dGTaF58PnzGWhrsHrAqDXDqBx1
         xcTiKBrmtEy3dfYKAUbdenbI/BuKgIukEpcbRaDnAhfQwQ8s+jVWUy/ruWqTsJVuBLEy
         IbQsgvGS/bv63D0h2NldMzeotdvFNGlTY5CTJj91S9oKJoxFWGVr5ty3HRAXGNw2D1NQ
         +0PQ==
X-Gm-Message-State: AOAM531/D1ZUkWAG02PqJ4K3VL9cnQCVMpMOKxj5W2o2Om03VioU6R1b
        BBh6agSBitbf3lrAVICu2ocetsosSG6R5cfte8tbZYneeTyImpAXYvAJUyaEoYHkZX9ILvLyGly
        n09uNXsRuyJh+ECfGCM9Ls7dhPPZyiRHTmSojCQxQpehmg9so
X-Received: by 2002:a17:906:3d72:: with SMTP id r18mr6466779ejf.525.1633886250842;
        Sun, 10 Oct 2021 10:17:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwULoe1r7gtplsH7VwMtTw7dZPaE/oWFm+Yvn4E8fkz/wvGMrgbSxgA6IUKhjcqCIHOcnMyWw==
X-Received: by 2002:a17:906:3d72:: with SMTP id r18mr6466764ejf.525.1633886250723;
        Sun, 10 Oct 2021 10:17:30 -0700 (PDT)
Received: from localhost.localdomain (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id p6sm2792009edi.18.2021.10.10.10.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Oct 2021 10:17:30 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Chanho Park <chanho61.park@samsung.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: (subset) [PATCH v3 3/3] arm64: dts: exynos: add minimal support for exynosautov9 sadk board
Date:   Sun, 10 Oct 2021 19:17:26 +0200
Message-Id: <163388622665.8712.16297389599779361113.b4-ty@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211010032246.146939-4-chanho61.park@samsung.com>
References: <20211010032246.146939-1-chanho61.park@samsung.com> <CGME20211010032456epcas2p15f951954f7bc7ca505806fdcea4e6390@epcas2p1.samsung.com> <20211010032246.146939-4-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sun, 10 Oct 2021 12:22:46 +0900, Chanho Park wrote:
> SADK(Samsung Automotive Development Kit) is the development kit to
> evaluate Exynos Auto v9 SoC. It has 16GB LPDDR4 DRAM and two
> 256GB Samsung UFS. This patch enables only serial console and ufs0
> device.
> 
> 

Applied, thanks!

[3/3] arm64: dts: exynos: add minimal support for exynosautov9 sadk board
      commit: a89d8b5ce9af2128db074a5f0f5096b2716085aa

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
