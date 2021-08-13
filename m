Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 676E5C4338F
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 13 Aug 2021 07:41:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4879060F14
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 13 Aug 2021 07:41:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239578AbhHMHmN (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 13 Aug 2021 03:42:13 -0400
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120]:54584
        "EHLO smtp-relay-canonical-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239415AbhHMHmM (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 13 Aug 2021 03:42:12 -0400
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id 15AF240C82
        for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Aug 2021 07:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1628840505;
        bh=lmvnwgN1nqiFs3gT3XouJcWEtaMB37eH6Bp0fzWosJo=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=F8iBOEKoq2a+47kfb5fapH4OMAlvk+zsIRRcalXBDIaFvjUrP7dU6DKopZ3/EHgZ4
         JGIC6pjPUz0y60bGkNEjG8B8rlljuPaxd/lOSogCvmHqf8MKZVVVbibwXet9W2p3pw
         RkHWL2EVYhl1dpFx1Gbq1o0qj3Wr9YrJ/Z8DmfWyqGdriLrGNNWpDJ4yWQb1SUzISn
         5MMPIDbwLKENNuz+b77QQpkVnWEbXYHv23b4nYic0JdQGH8QkuUvW/sD7hUXUQRTBq
         U8HJaPdDuNNhvtorZ3X49CgQdHmik7h0EkK6stWrvNycz1kwGJzwM0YvIM/iTS+TBq
         0ZXC6qIGnXW3A==
Received: by mail-ed1-f71.google.com with SMTP id o17-20020aa7d3d1000000b003beaf992d17so1622386edr.13
        for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Aug 2021 00:41:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lmvnwgN1nqiFs3gT3XouJcWEtaMB37eH6Bp0fzWosJo=;
        b=Umh4uLfue6f3rVERQRGv/5l/cpSfo8eWmyQrfD6oPWN01tif1xWGoKpkUua5fBm5Ow
         86J5tAVwxksodTiX5n71v+5URjhNAxauCCr+NgsOPHLroeytoEOyXts25xtkGead+af5
         vzJl4CeIkg1vtALQYAQgnzDmDwyXntL8XG7rkZudFM2bE9UuJKgT4uc0O2y99zOiOm0g
         +fbbaGnzWaCHQaAVYDaEkNKLvWy70SmUg+NwpXaUpysiM2BTmIrMwLIyU+Gr3fjjogyz
         T9iX9vo/pdfGSCh6g4UvzXOscpWn5vfRe/OC+2WgiAvQCUusek83RMShJ+IU/TYZ7EaX
         /cRg==
X-Gm-Message-State: AOAM533cfcUYMBf5mAdwEknmrDpB3m0DFSENUhxWjPGWl9+iY5ZGsbR/
        eNr26ImJBaVcYT6KIQch8bjFnfhujbycTX+lRnLsLAOFDPo1B9okfkCPqoAHlg10iC+fl6ApF+m
        RAGYVVi/4nKH+FtEfc3feqG30+5rKZbljQTod1nhn1hMF3PMJ
X-Received: by 2002:a17:906:4c89:: with SMTP id q9mr1193542eju.118.1628840504637;
        Fri, 13 Aug 2021 00:41:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyGgR9Ep8EBsDxSeJUlxlgBMuS2Gxb0p0j9SvvvqQz9poFkzuAyxjESTmqdBeNOiwH8/02XGA==
X-Received: by 2002:a17:906:4c89:: with SMTP id q9mr1193522eju.118.1628840504493;
        Fri, 13 Aug 2021 00:41:44 -0700 (PDT)
Received: from localhost.localdomain ([86.32.42.198])
        by smtp.gmail.com with ESMTPSA id ks20sm268665ejb.101.2021.08.13.00.41.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Aug 2021 00:41:43 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-kernel@vger.kernel.org, John Stultz <john.stultz@linaro.org>,
        linux-serial@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Ryu Euiyoul <ryu.real@samsung.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Tom Gall <tom.gall@linaro.org>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, Sumit Semwal <sumit.semwal@linaro.org>,
        Charles Keepax <ckeepax@opensource.wolfsonmicro.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-samsung-soc@vger.kernel.org,
        Tomasz Figa <tomasz.figa@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        Marc Zyngier <maz@kernel.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v3 0/7] Add minimal support for Exynos850 SoC
Date:   Fri, 13 Aug 2021 09:41:00 +0200
Message-Id: <162884044884.8593.17144936297459767250.b4-ty@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210811114827.27322-1-semen.protsenko@linaro.org>
References: <20210811114827.27322-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, 11 Aug 2021 14:48:20 +0300, Sam Protsenko wrote:
> This patch series adds initial platform support for Samsung Exynos850
> SoC [1]. With this patchset it's possible to run the kernel with BusyBox
> rootfs as a RAM disk. More advanced platform support (like MMC driver
> additions) will be added later. The idea is to keep the first submission
> minimal to ease the review, and then build up on top of that.
> 
> [1] https://www.samsung.com/semiconductor/minisite/exynos/products/mobileprocessor/exynos-850/
> 
> [...]

Applied, thanks!

[1/7] dt-bindings: pinctrl: samsung: Add Exynos850 doc
      commit: 71b833b329d65236285cc73f4528f08c7d3c274c
[2/7] pinctrl: samsung: Add Exynos850 SoC specific data
      commit: cdd3d945dcec0d0dab845175dc9400ab54512aa6

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
