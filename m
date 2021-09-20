Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 214DBC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 20 Sep 2021 07:18:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EC49A60F25
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 20 Sep 2021 07:18:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234682AbhITHT0 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 20 Sep 2021 03:19:26 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:49424
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234683AbhITHT0 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 20 Sep 2021 03:19:26 -0400
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id F1EDF4018F
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Sep 2021 07:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632122278;
        bh=K975uWTYLGkLbkETM9T3s7Y45GbdozAN4S3IGUhBhMo=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=BbbSf2IYQkzLy8pUdFju1wufZSgPWXMAomvadMGdNKyBBalbNIze4cHXOBvWrhknl
         obcC3j4W6gpe8cvCaZ/5iqdoi7YWyjA5CpjLzs8TCr5DYVwVp6iPC5om1Z1XmJ+Fxj
         tRZA2WBxJIQKDxdEpc8gX87DwGobbQTG6Zl14qJ/KYenVQ5o+o9PYzxklQCRkvVu9s
         2hT27PIpwMdf4jiGqbsu/8HM26pVgvotkiXHvcU8n5ty/JfvrbhG5Yf7NTim+y+Buf
         zTH+kHxefhvnCg4YlmLMh5xn/a3aTPbWbgyLxPVtdEy17dSExE96oej2ugdrLnpXsl
         hruUlW7AYCL3w==
Received: by mail-wr1-f69.google.com with SMTP id x2-20020a5d54c2000000b0015dfd2b4e34so5467815wrv.6
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Sep 2021 00:17:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=K975uWTYLGkLbkETM9T3s7Y45GbdozAN4S3IGUhBhMo=;
        b=0WRHtIDy+JLqyDuOQrVHUFSqOIveDl+CdA3JdkXve6ftGaZBhFZ9or6LBPpcWBDFTf
         luk6he7ZmTpzwxOEJO+dWDaeHl5skTyiCqP2yAp5c6+5JN53nCEELXX/Na7+Jtf3QFkn
         +/3pS+HjdPujZXMwH978BjLVB9HtJkBT6dndVXGmhYEMZWm850g8a5slvDurzZA8aSNB
         i4eajJOLf3IGkHPjn5f2W88cS0HyBYxaV3j3bdH7MiUwO414knJRFgVpuqK4tZNRV7QE
         RUYBdb7iAP1iyHCm6eScfIoAcDFr6IKqvpFAMy5uPjNqOu+pigi3jcOnlZaOXvhU26gv
         FKmA==
X-Gm-Message-State: AOAM5315OGNjkUZ6O4L5s5FDpR4Z1y4TZ/b84pfmZ/eOjLqArKgt2yXC
        MD0ATG7tXnf5Fs2v69S1JbymzynjRElVrmChtJPSVVN2P/tgp4jSn+9qlvyFvyJnzamPdFmJ0Ij
        VU6JN/+prlTEH9EoScMV85vxc/o1OBXG/gA7BEnaMj/ClM7iz
X-Received: by 2002:a5d:668c:: with SMTP id l12mr25958818wru.436.1632122278681;
        Mon, 20 Sep 2021 00:17:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzW4RCYsQAwDVi//vMFGQ0H5hMTUOpmow8nulLe+L4fg0CAxTaF+uxW5s557hhH8OPbHt+Sdw==
X-Received: by 2002:a5d:668c:: with SMTP id l12mr25958797wru.436.1632122278512;
        Mon, 20 Sep 2021 00:17:58 -0700 (PDT)
Received: from kozik-lap.lan (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id a202sm6990798wmd.15.2021.09.20.00.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Sep 2021 00:17:57 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH v2 1/3] devfreq: exynos-ppmu: use node names with hyphens
Date:   Mon, 20 Sep 2021 09:17:51 +0200
Message-Id: <20210920071753.38560-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210920071540.38337-1-krzysztof.kozlowski@canonical.com>
References: <20210920071540.38337-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Devicetree naming convention requires device node names to use hyphens
instead of underscore, so Exynos5422 devfreq event name
"ppmu-event3-dmc0_0" should be "ppmu-event3-dmc0-0".  Newly introduced
dtschema enforces this, however the driver still expects old name with
an underscore.

Add new events for Exynos5422 while still accepting old name for
backwards compatibility.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/devfreq/event/exynos-ppmu.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/devfreq/event/exynos-ppmu.c b/drivers/devfreq/event/exynos-ppmu.c
index 17ed980d9099..541bd13ab61d 100644
--- a/drivers/devfreq/event/exynos-ppmu.c
+++ b/drivers/devfreq/event/exynos-ppmu.c
@@ -94,11 +94,16 @@ static struct __exynos_ppmu_events {
 	PPMU_EVENT(d1-general),
 	PPMU_EVENT(d1-rt),
 
-	/* For Exynos5422 SoC */
+	/* For Exynos5422 SoC, deprecated (backwards compatible) */
 	PPMU_EVENT(dmc0_0),
 	PPMU_EVENT(dmc0_1),
 	PPMU_EVENT(dmc1_0),
 	PPMU_EVENT(dmc1_1),
+	/* For Exynos5422 SoC */
+	PPMU_EVENT(dmc0-0),
+	PPMU_EVENT(dmc0-1),
+	PPMU_EVENT(dmc1-0),
+	PPMU_EVENT(dmc1-1),
 };
 
 static int __exynos_ppmu_find_ppmu_id(const char *edev_name)
-- 
2.30.2

