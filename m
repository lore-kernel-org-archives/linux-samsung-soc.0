Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AF58C00A8F
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 24 Oct 2023 13:37:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234704AbjJXNha (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 24 Oct 2023 09:37:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234690AbjJXNhP (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 24 Oct 2023 09:37:15 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9BEC65BA
        for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Oct 2023 06:26:20 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-9ae2cc4d17eso675502966b.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Oct 2023 06:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698153979; x=1698758779; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/gyNlHssk7VPcI9eA9kJqbgReX3FCvfI7Vr3By9Yhi4=;
        b=QA5rJE2iVjgNllWKmGhJ5bHiPyG5I0M2G0fjPvoDzZ9hbF3cJelDVZKsXNTHgurNJz
         0uaaiUElh1KiVq+0hP+CbcwWxWM/rYwDKGW9OkmktcJuE/cFkszD2DrB7/f1upAiwxbg
         EzoG3i5lVtHw6F2xPG0exJ4uDznsLb5X8n1LQNHwnu+iA6GPfd8fJWikLz4mLOYj++0S
         HpUGnadib2iqS8RdiasW2GWL266SGUNgJsqNHqwmTU+K4vE3JDKKKOqwU1QnMHWlaNqq
         mntYyJw9C+xr6tezAOhbV7DCednCu48+0civMOWvgeTqYPVb7EtSarIMB/cl6zgwWCMZ
         1YQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698153979; x=1698758779;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/gyNlHssk7VPcI9eA9kJqbgReX3FCvfI7Vr3By9Yhi4=;
        b=LoxyRkEuuuV1BIxmCmn95jmke7JtFXscEfh6JgFOKI3utKjGfdV53UJmD9huS9gUub
         I5OFgvvv4jvUpdPdyrJR7oAi32wTGhEWHYLkycbfWFJq4CBcs9hsOhicLyXo1QC0sA2h
         wGOS6gDgrwqZG5dt0v+mq2aeW4rYYfRSRQGpbJkhIJY8aEkXRnoBd1aciIztTlVrPVb1
         C8XJB/+5Cd+sxaBt64EX54V14z7WTo61WswQstHzS3CuafOB8aMqq6a3Z54VwRs+IwT1
         fwzQbJqVg4WF6dnoFuLpmahvB+b5d0vY8bicS4rj1AKMmCbtLNcBi2lHu3ATBDY3dlEI
         14aQ==
X-Gm-Message-State: AOJu0YxOMh4upfjNfIIuuj0pgijW4Qb79Ue9bmw6DaCUCRZGLt3mCnND
        tWmiYzGm+Xi4gpFvesouQaJ9ig==
X-Google-Smtp-Source: AGHT+IHGOKn4MfzpARtXzrt/xZhf+z7fzKiebIFbygjduW6NklJfnaZHtqpK9v35XDluS/8922ZriQ==
X-Received: by 2002:a17:907:728a:b0:9ae:41db:c27f with SMTP id dt10-20020a170907728a00b009ae41dbc27fmr9101041ejc.10.1698153979219;
        Tue, 24 Oct 2023 06:26:19 -0700 (PDT)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id h7-20020a1709063c0700b0099c53c4407dsm8285842ejg.78.2023.10.24.06.26.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 06:26:18 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        arm@kernel.org, soc@kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Raymond Hackley <raymondhackley@protonmail.com>
Subject: [GIT PULL] ARM: dts: samsung: Second round for v6.7
Date:   Tue, 24 Oct 2023 15:26:15 +0200
Message-Id: <20231024132615.65609-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi,

On top of previous pull request, last minute improvements for v6.7.

Best regards,
Krzysztof


The following changes since commit ef399736c3ba77fb82d778b1b7285baa65a7e079:

  ARM: dts: samsung: exynos4210: enable polling (2023-09-14 10:05:21 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt-6.7-2

for you to fetch changes up to 4a48fa417abc5b86da393c93ab63a9160076a248:

  ARM: dts: samsung: exynos4412-midas: use Linux event codes for input keys (2023-10-18 08:22:23 +0200)

----------------------------------------------------------------
Samsung DTS ARM changes for v6.7, part two

Two minor improvements for Midas boards (Exynos4412, e.g. Samsung Galaxy S3):
1. Correct the middle hardware key to emit KEY_OK instead of KEY_MENU,
   because there is already separate touchkey providing KEY_MENU and
   both label and node name suggests this should be KEY_OK.
2. Use defines for other key input constants.

----------------------------------------------------------------
Raymond Hackley (2):
      ARM: dts: samsung: exynos4412-midas: fix key-ok event code
      ARM: dts: samsung: exynos4412-midas: use Linux event codes for input keys

 arch/arm/boot/dts/samsung/exynos4412-midas.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
