Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1B8EC4338F
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  5 Aug 2021 07:26:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7DBA060F41
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  5 Aug 2021 07:26:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238611AbhHEH0U (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 5 Aug 2021 03:26:20 -0400
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121]:40644
        "EHLO smtp-relay-canonical-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230446AbhHEH0U (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 5 Aug 2021 03:26:20 -0400
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id B3B8F40641
        for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Aug 2021 07:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1628148365;
        bh=g9qBqxkhsVrwTaR51E6CfuBSIwrS5M1PgyyXHDx+vl4=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=WtLuQsSagMl4L//2PQzlWEilTrFqRMSNgApMiKbamShSBojiQSoi6bqWAwM9ih87j
         YXTod5qy41q9XMqQV03xM9mjpqqX2IxHMqggxbU5hZK5wrLkzDO40KFgpFE1vyVqsC
         YzZmm+vEzZg4ZyuJa2R895e4GiYxmPjyIaXR4HJYgKP2yLaZaG47NzU0sm0Ax++4Ra
         K40ry1WIVE0s1OhoHPs9id+rq6+xIUm+fanPda+gxhG0SY3cnvTUF9rnjPE/CVA8aK
         Ocium0R4E6HGgGcGrCoGhyw6x/M7Kxe9MencBX0X0oEQ+x6USy+lcqluhJ8CvzUIIG
         lq+5A1tyQcniw==
Received: by mail-ed1-f69.google.com with SMTP id d6-20020a50f6860000b02903bc068b7717so2709144edn.11
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Aug 2021 00:26:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=g9qBqxkhsVrwTaR51E6CfuBSIwrS5M1PgyyXHDx+vl4=;
        b=Ce3KM0rMerm27Cu5xHniLKkjJ+AEc91C5TG28soUzlmjT45ej7A20zNoT70Qz8gXZ6
         XK17e/SxQ5HfIoivDn1DU80cf3bP/kV+bnIOLXs7E4zykDAuxPhqmyZdAD37y3yIj4D+
         E1T4YpQRezQjtipLWol1i41lxnmYrzlrS7fCWf9DyiXppiXnBGuwxmaRWlQ5kCMFtY0e
         8EOwG30A//zUpSsc+a5EqJx8C+fvfqb9ezQ8rWQ2vXwr8yUP2ilU4WIzKiW/BvgesZ/L
         ERXOhh+U0b7z6LOQ/VEoOPbs2P7I8NwyWwpH/5HWWR55Sx+6/st2aIqakaagGMQNoEGn
         3KEg==
X-Gm-Message-State: AOAM530cL2pL9pqBENYjGbUViRYndhBiiYrub91yU3O8gDGQ9SQscWrK
        FboJg2Gu+2IEwOICYfSDfBd/wp5Q1iRMdA5W3oCHhk5kHnm2VasTPqFtO5/SXLV+bcO9BSF5KbP
        vn6WP8VjdjaB3D0IILibVg8LpEfhbMI9pqeZiPm9fhiUI9GE3
X-Received: by 2002:a50:be81:: with SMTP id b1mr4735901edk.295.1628148365326;
        Thu, 05 Aug 2021 00:26:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw+pEeF0AYkyWCT4YC0tcD+JhvhWIIsPWvWkaXRRVc3F27jZY8cg94BFy4gyubfS81YcRMbvg==
X-Received: by 2002:a50:be81:: with SMTP id b1mr4735896edk.295.1628148365185;
        Thu, 05 Aug 2021 00:26:05 -0700 (PDT)
Received: from localhost.localdomain ([86.32.42.198])
        by smtp.gmail.com with ESMTPSA id la23sm1399073ejc.63.2021.08.05.00.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Aug 2021 00:26:04 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH 1/8] ARM: dts: exynos: add CPU topology to Exynos3250
Date:   Thu,  5 Aug 2021 09:25:25 +0200
Message-Id: <162814831970.6166.12328372184939604484.b4-ty@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210731092409.31496-1-krzysztof.kozlowski@canonical.com>
References: <20210731092409.31496-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sat, 31 Jul 2021 11:24:02 +0200, Krzysztof Kozlowski wrote:
> Describe Exynos3250 CPU topology.

Applied, thanks!

[1/8] ARM: dts: exynos: add CPU topology to Exynos3250
      commit: a2798e309f3c67ab69073582dc4b8102a9013e25
[2/8] ARM: dts: exynos: add CPU topology to Exynos4210
      commit: 900dd07d13e46b2937522ac7cc46a9ceb49284b6
[3/8] ARM: dts: exynos: add CPU topology to Exynos4412
      commit: 1fb5b5b0dc491613eaa42bc39457589bfcb2b2b9
[4/8] ARM: dts: exynos: add CPU topology to Exynos5250
      commit: fc6d5c9953757c61042676db9bb32ecd7af958f3
[5/8] ARM: dts: exynos: add CPU topology to Exynos5260
      commit: fa0c56dbc3a1b116d280c3a3a97052ea38e4ea2b
[6/8] ARM: dts: exynos: add CPU topology to Exynos5420
      commit: a73d3069f6f7717bbd31a2fcfe8ddb3d98076b1d
[7/8] ARM: dts: exynos: add CPU topology to Exynos5422
      commit: 6cad6db75231a18f25dc7d610d5a0683160ac545
[8/8] arm64: dts: exynos: add CPU topology to Exynos5433
      commit: 0cdcca7ec37cfe54cd2f0668eddcf5aef87a05e3

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
