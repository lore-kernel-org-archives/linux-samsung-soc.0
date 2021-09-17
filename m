Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85DF5C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 17 Sep 2021 17:51:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6B9D3610E9
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 17 Sep 2021 17:51:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233099AbhIQRxL (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 17 Sep 2021 13:53:11 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:39664
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232203AbhIQRxL (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 17 Sep 2021 13:53:11 -0400
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id BB7CA3F4BE
        for <linux-samsung-soc@vger.kernel.org>; Fri, 17 Sep 2021 17:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1631901107;
        bh=MMF2iWv4kcxI3pzDDiyV/HVjAyM5xI6kvs1LvzNHODk=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
        b=AO502w7SMhi7l4wKKmK/tbdzUdkJ6zv40nNbVLyvpOt8Ak9wh6GIJby8hiUZ6FwlE
         /nmIAqcH5lsBoj155XhQlpe1G/GwjfsZn5e6NPOuZDficszXge4Sj4CtJQqLNEpdMI
         nQVlJzcWdDQLOvWZfhl4emLvS6uwyzvRvRXGIYDimN2EcY0ObgZlGhfxj9XPaiZdUw
         kYThOXL4WBwkymZ7/zFnl0sIgvSOo2UzhK9JTLT5fE1XDEjHLJPblBsAfgJcfE7tN1
         vHfoqJNh3d4b5zIhM7n7LPu7H40FDNBNgyMteLdQmwjsPmsFXSYIhHUJC2p10DCOlc
         PpMjs/yLAQsZg==
Received: by mail-ed1-f72.google.com with SMTP id o18-20020a056402439200b003d2b11eb0a9so9756078edc.23
        for <linux-samsung-soc@vger.kernel.org>; Fri, 17 Sep 2021 10:51:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MMF2iWv4kcxI3pzDDiyV/HVjAyM5xI6kvs1LvzNHODk=;
        b=NBoTvAbuIh4FVFGIv3ATVL7vE8Tjtaz+0s7wWPi+0bTdrs3THeVj4Wbo2ic5vAGgCl
         9hS1wxQ/n3E/gpS13mzaP0ralgPmI2p0IgVsYVXitvAOwDa0PNmKqgbeA9WL/yc7Z2NL
         B6j+kjViYN5Ao8fsf9Ah6pSdFPuj37zSJaOFid6SnXn7dx9k1YjfIsH/a2nD2fzidOqn
         hrVoLPdzZ6DBoeIUX207f7Jehbl+pvw1IBkbVQ4zPe+7MeygqO46UbHTxQ1cYv6dpjjK
         0/ZyMHC9r1/5cMT8PmMZgkkCYHKt8w8ae7J4MVpyEMA/CMeyuGOAFtWI0+oegJkBMowp
         gotA==
X-Gm-Message-State: AOAM530miw1nuCOV/Fb62V//vFEVDVQ3dkEElI+cwIEKm5UbwO7CA6Ym
        J01Im7fCkx2L2YrgkhOfJGzUXKDHUYj5HZFf6my+hTucEv4z7i7GYUQ0dNu4dzQZtOX601D8zav
        doXuzw5sD6oLTPqRT/zcScy+BaJOgR7g6hhWsGJjoQjU+1ziZ
X-Received: by 2002:a17:906:a18f:: with SMTP id s15mr14093629ejy.269.1631901107484;
        Fri, 17 Sep 2021 10:51:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwSIzcpv+tMyR6TNvX1deHw1+0dUu13dndrvmjG4VR4paQlLXKULMAl5QGjqAySEq52fFnZcA==
X-Received: by 2002:a17:906:a18f:: with SMTP id s15mr14093598ejy.269.1631901107301;
        Fri, 17 Sep 2021 10:51:47 -0700 (PDT)
Received: from kozik-lap.lan (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id l11sm2951345edv.67.2021.09.17.10.51.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Sep 2021 10:51:46 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: [PATCH 0/2] soc: samsung: be a module!
Date:   Fri, 17 Sep 2021 19:51:32 +0200
Message-Id: <20210917175134.252882-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi,

A question - what is the convention for naming modules: underscores '_' or
hyphens '-'?

The C-unit file already uses a hyphen "exynos-chipid.c", so I could
create a module named:
1. exynos_chipid
2. soc-exynos-chipid
3. exynos-chip-id

The Linux device name is "exynos-chipid".

Best regards,
Krzysztof


Krzysztof Kozlowski (2):
  soc: export soc_device_to_device symbol
  soc: samsung: exynos-chipid: convert to a module

 drivers/base/soc.c                   |  1 +
 drivers/soc/samsung/Kconfig          |  3 ++-
 drivers/soc/samsung/Makefile         |  3 ++-
 drivers/soc/samsung/exynos-chipid.c  | 11 ++++++++++-
 drivers/soc/samsung/exynos5422-asv.c |  1 +
 5 files changed, 16 insertions(+), 3 deletions(-)

-- 
2.30.2

