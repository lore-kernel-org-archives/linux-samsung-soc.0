Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4176FC432BE
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  9 Aug 2021 10:40:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 231DB61040
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  9 Aug 2021 10:40:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234025AbhHIKk3 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 9 Aug 2021 06:40:29 -0400
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121]:39996
        "EHLO smtp-relay-canonical-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234060AbhHIKk2 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 9 Aug 2021 06:40:28 -0400
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id C256C40643
        for <linux-samsung-soc@vger.kernel.org>; Mon,  9 Aug 2021 10:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1628505606;
        bh=A7M2AilJW/lVZdtGV4sHBiigy49SQd+8vPDsg10Wywg=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=k/7c+xZYb+pCLrxegcApY7ek2ySOXse7xTjlYou9FCyCJyqVvp2A34qRNMFPbOaLL
         69pOk3ybnCb/2iUiBxLQnCA6Dc0fPGywh19T4kZQ9teE8x2UzvtogMz+TRrJrxV6Pd
         9+JZ/IgsqSTx/WvnivQYjMHeWeqFnfPaP8AVQHIQZ3DW7tGmQwUltb/LpErGRUWO4I
         ikITfmGmot1a1ytNZdM9y2RcE6XQ3u4Q+tOwn8U5vlQlqbJpR6sWtK6soRZLrF5MMM
         l1DLAW2zghN/lflq6n8iUXxNtgznlPpMsS2BpxFOgCa9qEvM5dCRJD8ciAzP8k8tNE
         OQsONNZWLWN/Q==
Received: by mail-ej1-f70.google.com with SMTP id n9-20020a1709063789b02905854bda39fcso2565538ejc.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 09 Aug 2021 03:40:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=A7M2AilJW/lVZdtGV4sHBiigy49SQd+8vPDsg10Wywg=;
        b=iGkvJZ7kyqxaxYZWjs/Zl6qqHSEq2xNWY2VGDgJV12K8UHMWR1Ni905ev3nj7PI6Rf
         ChMaNr6IjlPD5+/w6oBjcB7daLOGhPS87X7hS2YzpItLvHSkC1qvGjHjCbx/TehK9IZ2
         isPzNSS7gNKXIM9Zk5sYoV15D8U+jYQTB9kS/zhM+OpKvpxm6czmAcaFRIfJEAOMbkMg
         fx6srlMIfLjfhBZELPkpKEoqiAsodQfkJE8LASOHzfQP2wdZU6ljZB5+x9rX3AVt+fls
         5T5sMrYQwtxR/oMrZHgsjfaOty1UYTf9R7RFVe/gTF7mN2lBVT7tFp7AcOLcb9W0P44c
         CGIw==
X-Gm-Message-State: AOAM530cTiUrrE5jwfauMbEHr8i1c8qGBDo5MTTuYxUtT2G7Kyuu4F3/
        iygq5KRmKFeTpP6hUUOiL1cw4Zq8SSeygaAtPond6huGZ5QiHPmQpaWSdLTG4dnaNWXjCpPSNMU
        5mBlC7Mq2so1xF8Xd0EX1ot5zpH+8vYQKPD43AFki9KgqDn7e
X-Received: by 2002:a17:906:58d1:: with SMTP id e17mr19211174ejs.383.1628505606570;
        Mon, 09 Aug 2021 03:40:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxwNBxDVyqZJE/20HBUWBb/vMu6ZRyYBzmBGhNHn0UTFRQjlV7SS2wC1vaJWHqvsUUWRYmyTg==
X-Received: by 2002:a17:906:58d1:: with SMTP id e17mr19211154ejs.383.1628505606444;
        Mon, 09 Aug 2021 03:40:06 -0700 (PDT)
Received: from localhost.localdomain ([86.32.42.198])
        by smtp.gmail.com with ESMTPSA id dg24sm1314968edb.6.2021.08.09.03.40.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Aug 2021 03:40:05 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        Pankaj Dubey <pankaj.dubey@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH] arm64: dts: exynos: correct GIC CPU interfaces address range on Exynos7
Date:   Mon,  9 Aug 2021 12:38:13 +0200
Message-Id: <162850548977.33781.16424242900051733609.b4-ty@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210805072110.4730-1-krzysztof.kozlowski@canonical.com>
References: <20210805072110.4730-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, 5 Aug 2021 09:21:10 +0200, Krzysztof Kozlowski wrote:
> The GIC-400 CPU interfaces address range is defined as 0x2000-0x3FFF (by
> ARM).

Applied, thanks!

[1/1] arm64: dts: exynos: correct GIC CPU interfaces address range on Exynos7
      commit: 01c72cad790cb6cd3ccbe4c1402b6cb6c6bbffd0

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
