Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2971FC4332F
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 15 Nov 2021 13:44:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1A8C961B2A
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 15 Nov 2021 13:44:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233455AbhKONrK (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 15 Nov 2021 08:47:10 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:48542
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236497AbhKONo1 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 15 Nov 2021 08:44:27 -0500
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com [209.85.208.200])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 268EB3F19B
        for <linux-samsung-soc@vger.kernel.org>; Mon, 15 Nov 2021 13:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1636983691;
        bh=n5Hadb6xbkGaApkV40DUT8mQVW3mxdVMSv3mHiuuCFI=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=sJX5/MKUeQQeoxtuykbeBi3oVeXrAdV3P5dn3zCyi8yCQhb92hrFzmAHSOIMF/I7J
         7x2IzMbve0Jb+qdQUofnQAjOTHGscxFl4a3BZomt/J+JPB3cg+mr8mvjn9iOg5xzNi
         X7Jh6W1WcXwMmN3P3bYQcvalwKv9rGWF/N7wi2TwJKFg6oV70CO39mX8JMWvf1mjjV
         cRwkDn2Q0hDdTZkqR59deZTY/6qoO37p1w6DLCnylj6S9KHaHfTALh490F75TiCqSF
         inWLpkEy6+5dnlhXVOtT7Mpj2whJ/ulEXBBE6HuvlhsYOHHnxHyL+TUBCO6PB7jQww
         KS0vRwfZvuGyA==
Received: by mail-lj1-f200.google.com with SMTP id y11-20020a2e978b000000b00218df7f76feso5122131lji.11
        for <linux-samsung-soc@vger.kernel.org>; Mon, 15 Nov 2021 05:41:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=n5Hadb6xbkGaApkV40DUT8mQVW3mxdVMSv3mHiuuCFI=;
        b=tJu/Zcb7jBOVQW79a2k+47ObPKgZ/7lh6tsHWSYNsdVY8n0Y00ltj/8NRzQzK/ovv0
         ZJF5XvYclF5AFG0lnjvPytpg4ei9WoVFCqsf/IKevFlU4UtQr3XHve/E05P4B4ia5vNY
         7Pm+4SMsNuwKQsL+SrwjyJX1mALpU2VWRr0eIcrj/hFjTO25ds7LwEoPXJI9o9lCIOox
         akFbJfxmJC7LcvbTzP3EGxkAroYaGOVKUIa7P00toF+s6XQWtHwSoWT+QdCktidhKNBB
         YutBCZjnod+qVnwU3MAuS1pfbmmi4hyrqPrwNVRrfQBqkpPy9i0wsZd7Zs+WqVTrvHKr
         1hgg==
X-Gm-Message-State: AOAM530D36M0F6OFNPtaS4zFuePZvC7i7UEpsIYtDmnrYEIvpEto9wK4
        37SsNwjEDzrFFSlR7kBd8dHQLFASHyAPmF9HydzGItTVHq6DOdr2qR8ZvGcz3TTgdEuJoZSN9Ci
        tdgTbS44T3mnV4R4AJop5kmImM3hoe5DnVD9kyQfDjfav1Z/7
X-Received: by 2002:a05:6512:c19:: with SMTP id z25mr34685705lfu.60.1636983690561;
        Mon, 15 Nov 2021 05:41:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxkpYeMAsCvuBUvs4Vf7PmAZoAzIjj2DCCMvm1MjqXaC8vi/q3I1PtjMWlG7VswioAqYx8hvg==
X-Received: by 2002:a05:6512:c19:: with SMTP id z25mr34685689lfu.60.1636983690417;
        Mon, 15 Nov 2021 05:41:30 -0800 (PST)
Received: from krzk-bin.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id i3sm1421786lfu.156.2021.11.15.05.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Nov 2021 05:41:29 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     David Virag <virag.david003@gmail.com>
Subject: Re: [PATCH] soc: samsung: exynos-chipid: describe which SoCs go with compatibles
Date:   Mon, 15 Nov 2021 14:41:25 +0100
Message-Id: <163698368315.132512.16798807565852524443.b4-ty@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211031205212.59505-1-krzysztof.kozlowski@canonical.com>
References: <20211031205212.59505-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sun, 31 Oct 2021 21:52:12 +0100, Krzysztof Kozlowski wrote:
> The Exynos ChipID driver, like most of the Exynos drivers, uses one
> compatible for entire family of compatible devices using one devicetree
> "compatible".  The compatibility is here described by programming
> interface (register layout), not by actual values, so the product ID
> register on one family of devices has different values for different
> SoCs.
> 
> [...]

Applied, thanks!

[1/1] soc: samsung: exynos-chipid: describe which SoCs go with compatibles
      commit: 569e45a1135497d8dddc647bc615e26c49b070a8

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
