Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30871C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  9 Feb 2022 14:37:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235090AbiBIOhU (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 9 Feb 2022 09:37:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231747AbiBIOhU (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 9 Feb 2022 09:37:20 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04695C06157B
        for <linux-samsung-soc@vger.kernel.org>; Wed,  9 Feb 2022 06:37:23 -0800 (PST)
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 9DF6D3F203
        for <linux-samsung-soc@vger.kernel.org>; Wed,  9 Feb 2022 14:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1644417441;
        bh=SlwgImOcNTsESNfIirUrDaCeHIHfLp+o6BSrCLR6Xb4=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=DtYdmrZsJlg28m9SfM5xXaf4KRC/de2bMjt5UBiWW+mwzKlnk9hypbd/HS3KQDyQR
         AUtuS6dESWDx/s9uBEYoc/8Qund2myE4EPw3aA/dbFNQEtHCAMHMp2ylMrz+ppogHC
         hRIuOveIq82TKCHGy/9Ppzza51ufbIswE0HqGWR69GLNUlFcVjfdAiHNsJ1r6Rk1TK
         vAKKTiw39EOCOkXjxQSIp/rLfjqoIKhzDwik/JtoAqesSyGFZMp54aO5Ls7cxEIOc0
         j6XVX2AsIxO+nB/p4r9Dm69Wyi29K090/KArypH8ZVUBLsKb6Wy5YEeIK75rqh0PsC
         lD5GauuSc/qsg==
Received: by mail-ej1-f69.google.com with SMTP id hr36-20020a1709073fa400b006cd2c703959so1264513ejc.14
        for <linux-samsung-soc@vger.kernel.org>; Wed, 09 Feb 2022 06:37:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SlwgImOcNTsESNfIirUrDaCeHIHfLp+o6BSrCLR6Xb4=;
        b=EpeGijvuH7lqjYQNjiQ7okug15Z+x4Cmq1BmE8sbqgYjd8L2gD5jAxTaZdyXWEEeEz
         Xu9yM2Gcwjb9oI9zOYMjRG1OO1CthvRdwQmk1XTNK02kB2ISH1ptde9Y4aVrg0lZb/zu
         t02hCVBSL0VzSOkhYCpRFm/n3WFC0kHs4nZS7JhAfLPxiMg9WLF0l2uopi8iDVxXqZWx
         UHEi+zo7w6botTpuCvoyPEv2DapLFR3HlnV+4JRC232dL1UoVa4UVdTk//7FSpCLA2pA
         KwgrgHBkaQBxGZmc4oUCvlY0j5b1N0rmWubmjCbnJHuUD5itC2Gg9jYI2/XHZ3ZJX0YG
         gxGg==
X-Gm-Message-State: AOAM533KlUr488vzlX3AXYsR9g1VC2MSOmQhhq1nboF1h3tHDygWW7Nf
        Chbq0MlyJ/DcaBYPX7559iOAoA1mpDjInIwc2jRaDgHBncKdJu2+Z+boZs3i1C2ubmOix6KbqNM
        e429dCiLIzy5GKjD47zrxJScrRHE2FEhLIg5MMVcm1Kne3skd
X-Received: by 2002:a17:906:240d:: with SMTP id z13mr2248960eja.210.1644417440963;
        Wed, 09 Feb 2022 06:37:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw36sjymzMaJhJa6q6wUBDPfAQePXwC/8alKtggTfvJQrQ42VevrxvY9v64oZZdAuv2SAoLgQ==
X-Received: by 2002:a17:906:240d:: with SMTP id z13mr2248941eja.210.1644417440823;
        Wed, 09 Feb 2022 06:37:20 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id ss14sm3871136ejb.199.2022.02.09.06.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 06:37:20 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Dmitry Osipenko <digetx@gmail.com>,
        Lukasz Luba <lukasz.luba@arm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-pm@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 0/8] dt-bindings: memory: convert to dtschema
Date:   Wed,  9 Feb 2022 15:36:44 +0100
Message-Id: <164441736490.181274.3751600144129167050.b4-ty@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220206135807.211767-1-krzysztof.kozlowski@canonical.com>
References: <20220206135807.211767-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sun, 6 Feb 2022 14:57:59 +0100, Krzysztof Kozlowski wrote:
> Changes since v2:
> 1. Re-order patches so timings get converted earlier. This fixes dt-checker
> robot report.
> 2. Add Dmitry's review tag.
> 3. Three new patches:
>    #6: dt-bindings: memory: lpddr3: deprecate passing timings frequency as unit address
>    #7: memory: of: parse max-freq property
>    #8: ARM: dts: exynos: remove deprecated unit address for LPDDR3 timings on Odroid
> 
> [...]

Applied, thanks!

[1/8] dt-bindings: memory: lpddr2-timings: convert to dtschema
      commit: 425fd283e4a2b929a88483525fda3f90dde8a2d0
[2/8] dt-bindings: memory: lpddr3-timings: convert to dtschema
      commit: 180a276c99bb861742c5c423d679b0277d4b1c26
[3/8] dt-bindings: memory: lpddr3: convert to dtschema
      commit: 28f818580e49a97876de5c33231fc0e4c3cde2d9
[4/8] dt-bindings: memory: lpddr3: adjust IO width to spec
      commit: d98e72b6f9b078c57f9d46dc64a669d02ff2ffcc
[5/8] dt-bindings: memory: lpddr3: deprecate manufacturer ID
      commit: e531932c7185b86eccb3688002730950d49eba1a
[6/8] dt-bindings: memory: lpddr3: deprecate passing timings frequency as unit address
      commit: 42f94bb962cd1b15dc57c90aca7e48848ca6c6c3
[7/8] memory: of: parse max-freq property
      commit: 4e890b2228fd14fa6269175e9816bf27ff989e84

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
