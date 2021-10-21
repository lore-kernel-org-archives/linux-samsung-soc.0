Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5605C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 21 Oct 2021 20:23:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9D82F60241
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 21 Oct 2021 20:23:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231976AbhJUUZR (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 21 Oct 2021 16:25:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231579AbhJUUZQ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 21 Oct 2021 16:25:16 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 070B4C061348
        for <linux-samsung-soc@vger.kernel.org>; Thu, 21 Oct 2021 13:22:58 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id d3so3591992edp.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 21 Oct 2021 13:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=T80sY77P49CzqkBALaNy1F1k3Uh9yhdfwkAHlGutXxg=;
        b=mpr8kErdCV7sUm/XbyfJcxCKeOGw4geiYjdZu3EnPqJE6KQDeELPt6Tc71HvT/i0jk
         T9RU8d3GNQJl+gWLhH80+va9tGv1Y2n09/FWB2NBSVtZvo3Uf5kRjkowqByhPp2gyLGZ
         NBIQujgw75vCfARufR+rwueYBVp2dQrHhEBjcfnSS/+RG8l41OYPk20i9nex6eAsTalD
         NnbSFM2THxIymS0T6JqthRcrjBeBQ8y3nZ8UigP/KvGwoZwXEsQ9M+kyJORtZNjMLAuS
         aU0SLNx7238RXLJ+/brcRY7K+yZ57BfQjU/up7m3QNtgvmzKBWFGjcsUL8zIsMhqGyxK
         tQSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=T80sY77P49CzqkBALaNy1F1k3Uh9yhdfwkAHlGutXxg=;
        b=dgpKRn+lzAshKJfM27j0MgpzVIytqciIbc5rhkjh+bNM/M9K8tCAGETLK0cDA47rXB
         XZ8Gb+44YGYoZHrg5GNXdZk1YAnMx56F3axMryfx0kFrJ7fDVcZBvxAqHV3aRlY/tX8j
         5YWAqrsHynok7FemPqwKZmntPHcB53hMWwApn+5wbmO3sfr82mPqCgz3zAHCHA7+Bxi+
         QwnHs6cK/XABEmQEt5gGYjhNERM1B1/i3S+cFYDoNpKfFgZpbJ7XmboYs7v1cQxbOQkb
         f80c5FXOkzHzJ/xow/y1MoU2qjGjjYor+s0Dr6cU/rI6Blsm6yci/MapLDNJSVGwdGuY
         On1w==
X-Gm-Message-State: AOAM5300E+mJ3DmxYsdLP6NP3R4EtiYfXEefzraOutJKi6DBhW4Bd+2t
        3DHdc6PoPqfsiFG1SGvkwU6k6g==
X-Google-Smtp-Source: ABdhPJx0+JePp8cicOVplczmBdeekxsIj//rFIruiqx74JXCwnDTP+gqnS0/dJ2NlOl3UVi28xR4nw==
X-Received: by 2002:a17:906:4310:: with SMTP id j16mr9886395ejm.48.1634847777469;
        Thu, 21 Oct 2021 13:22:57 -0700 (PDT)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id y22sm3696001edc.76.2021.10.21.13.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Oct 2021 13:22:57 -0700 (PDT)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     linux-rtc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] rtc: s3c: S3C driver improvements
Date:   Thu, 21 Oct 2021 23:22:53 +0300
Message-Id: <20211021202256.28517-1-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

While working on Exynos850 support (where this driver works fine in its
current state), I've stumbled upon some minor issue. This is the effort
to fix those.

  * [PATCH 1/3]: moves S3C RTC driver to newer API usage
    (no functional changes)
  * [PATCH 2/3]: refactoring/cleanup (no functional changes)
  * [PATCH 3/3]: adds time range, as [PATCH 1/3] made it possible

Changes in v2:
  - Dropped "rtc: s3c: Fix RTC read on first boot" patch
  - Switched the order for [PATCH 2/3] and [PATCH 3/3], so that the
    refactoring patch can stay w/o functional changes w.r.t. previous
    state
  - See also changelist for each particular patch

Sam Protsenko (3):
  rtc: s3c: Remove usage of devm_rtc_device_register()
  rtc: s3c: Extract read/write IO into separate functions
  rtc: s3c: Add time range

 drivers/rtc/rtc-s3c.c | 106 ++++++++++++++++++++++++++----------------
 1 file changed, 65 insertions(+), 41 deletions(-)

-- 
2.30.2

