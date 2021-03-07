Return-Path: <SRS0=VDBE=IF=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B682C433E0
	for <linux-samsung-soc@archiver.kernel.org>; Sun,  7 Mar 2021 20:09:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4BAA564F2C
	for <linux-samsung-soc@archiver.kernel.org>; Sun,  7 Mar 2021 20:09:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232824AbhCGUIc (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 7 Mar 2021 15:08:32 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:56962 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232823AbhCGUIW (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 7 Mar 2021 15:08:22 -0500
Received: from mail-wm1-f70.google.com ([209.85.128.70])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lIzhN-0002l3-Dy
        for linux-samsung-soc@vger.kernel.org; Sun, 07 Mar 2021 20:08:21 +0000
Received: by mail-wm1-f70.google.com with SMTP id m17so1148137wml.3
        for <linux-samsung-soc@vger.kernel.org>; Sun, 07 Mar 2021 12:08:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qSQieJ8nQE58ekoGafigYdMDYrreYYyCtjGaEuN2LQo=;
        b=idD6LeR34iaxWGKjfUrAmRE29vGpdayl8j7pk6JVC2LnLxLg70I1Yvd/VwJzae7K9f
         ouoj+Egu0DvJ/MYr3/06liLdOc7sNDPQWlJLVthp/6ORvrtUoLWbhhTrdF9SO/qZ/mEt
         d8zmK1B1kZUgSdSvDxzMlObilj0VyruUzeSuuqn7syaTsy48Wvze+vAzo9SMbwOjaKUm
         JmDwiGYuHmn8xFva5XL4lalXzOSmux2bKy8s1FYNOEOkUwg992QoJt7jt5reFN1w0QMG
         ZCzE1xOZI0qYGejXSZ9vxp41R7lgnFq/dORkS196HgsKDC3JXayKxd54C/+D4hCzubDP
         GWVQ==
X-Gm-Message-State: AOAM533QRxXwuIXOXsUVHqyObgvBBKewqxHpViNeyRX8GtPzxUV8FsOg
        ia7IYMR9jDf1P1LJhTHWHxwzKoh3KGZw61Tj6VzVepkfeHIfkf8jv7Q+uRUXp3o9jZpXg031V8T
        i6s4l2RMrQ8AZJJoA3gev1xT2g3jkymhPLb2praG83mf6GuPv
X-Received: by 2002:adf:e791:: with SMTP id n17mr19437520wrm.322.1615147701149;
        Sun, 07 Mar 2021 12:08:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzSvNTOZIGgHUkrKnFIH0hoAo/Z5A03xBXmm0JmPTuNu4ee6LFgLxcRQ35yz+mgjO+3yTg71Q==
X-Received: by 2002:adf:e791:: with SMTP id n17mr19437513wrm.322.1615147701044;
        Sun, 07 Mar 2021 12:08:21 -0800 (PST)
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.gmail.com with ESMTPSA id r2sm14225087wrt.8.2021.03.07.12.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Mar 2021 12:08:20 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     linux-arm-kernel@lists.infradead.org,
        Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-samsung-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>
Cc:     Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: (subset) [PATCH] MAINTAINERS: use Krzysztof Kozlowski's Canonical address
Date:   Sun,  7 Mar 2021 21:08:18 +0100
Message-Id: <161514768474.92984.2303716384239569013.b4-ty@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210304075751.9201-1-krzysztof.kozlowski@canonical.com>
References: <20210304075751.9201-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, 4 Mar 2021 08:57:51 +0100, Krzysztof Kozlowski wrote:
> Since I plan to use my Canonical address for reviews and other
> maintenance activities, reflect this in MAINTAINERS to avoid any
> confusion.

Applied, thanks!

[1/1] MAINTAINERS: use Krzysztof Kozlowski's Canonical address
      commit: ca881b97dbe1ce3ed94e20ae185b246435d86ead

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
