Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 288DEC4332F
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 15 Nov 2021 13:44:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 153C461B01
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 15 Nov 2021 13:44:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231906AbhKONrE (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 15 Nov 2021 08:47:04 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:60746
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236503AbhKONo3 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 15 Nov 2021 08:44:29 -0500
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com [209.85.167.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 363B93F1A8
        for <linux-samsung-soc@vger.kernel.org>; Mon, 15 Nov 2021 13:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1636983693;
        bh=W9TxYBi8xwenWIBn6BQqnXfpAh7fA6t6YIh8inQiH2M=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=Vo/Jzai1uJnI/evB6hfGuxeuJc1oT+IuxlxirLufoQQ/7hXLZk0E6Z4TDmopkVwSH
         Oqkqqi+U0DghAJ9VTw5Q1VAXhL7qvV/yAxkSbjKf3h5LIHe0H2rzGeuLAmtxPEnMx5
         stMa8V4yPpWkbs796bzYPFzJuB62JX93ppEdbKu/kT2XlYlir0q+pPf16bAQxIHbzu
         zGBrze97+3b++acZZRzZF49rimtmMPQYPP8Vrejpc6s74iaKUz0UNmEEu2vxz1fPEj
         W1IJPQ9ahxUg9tgErjlgJH+qNxrQzk/Y70N+LagOzwPi+zw/3b/8NQvZC4CXtIJx5U
         90u24Pu63v5dA==
Received: by mail-lf1-f70.google.com with SMTP id bp10-20020a056512158a00b0040376f60e35so6766742lfb.8
        for <linux-samsung-soc@vger.kernel.org>; Mon, 15 Nov 2021 05:41:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=W9TxYBi8xwenWIBn6BQqnXfpAh7fA6t6YIh8inQiH2M=;
        b=pNgYHo6bSb54yeh/+q5qvW52L35puPRKSNHWstxL1xselsxds05Y5oB/mBwezNdypP
         37K0Nla0ae/C637UXh+tdGnmNWW2bn/+rYRl63OnQNIchVA6zhn3q5iXlPEMbEQCcMx5
         RvQ5PqWurWk2yZ1+oIZArbpFWAoygaOBgADSieF6dsdeWOm8S3BIsnF0+wnBXJ0BC5i+
         5vIKP3BRj7MIxiVKB+Z21eXf0EhW9/L009lcjusPPEO1cqEGKKa9ZHD709PxAfpmWtBY
         jzLs8I6+LWbggcwvpz+uHT1m2WV1nnFGHUZudAevAOLL5blQRCIhsDs4sx75ZSCisJFt
         FOtg==
X-Gm-Message-State: AOAM530VNkE/On6+YPRG/6WKGhuoj+rOzc5p1R+JkcMdhLhR99wWrRID
        S3B/GVw6DLUeuFefU8km9X3KADiQibheYLN1IjHYyyIewp2pPZuFaKLvUxpDSqIoGzhaiEV9T/o
        XtAuVnIbjG9WMWQ18NFvk6qWUfv6d1CG70V9bVCppDmtQZ4In
X-Received: by 2002:a05:6512:ac9:: with SMTP id n9mr29162857lfu.59.1636983692700;
        Mon, 15 Nov 2021 05:41:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyrPrLBQAmwLdJ8XBy0kTXbK9lXu2tr3L4nIiQC0WlfOZzt6acqyS+eR+YwzMYf2vnWA0+3Jw==
X-Received: by 2002:a05:6512:ac9:: with SMTP id n9mr29162838lfu.59.1636983692545;
        Mon, 15 Nov 2021 05:41:32 -0800 (PST)
Received: from krzk-bin.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id i3sm1421786lfu.156.2021.11.15.05.41.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Nov 2021 05:41:32 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     David Virag <virag.david003@gmail.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] samsung: exynos-chipid: add Exynos7885 SoC support
Date:   Mon, 15 Nov 2021 14:41:27 +0100
Message-Id: <163698368315.132512.12680181156505233960.b4-ty@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211101004853.55810-1-virag.david003@gmail.com>
References: <20211101004853.55810-1-virag.david003@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, 1 Nov 2021 01:48:53 +0100, David Virag wrote:
> Exynos 7885 has product id "0xE7885000". Add this id to the ids with
> the name.
> 
> 

Applied, thanks!

[1/1] samsung: exynos-chipid: add Exynos7885 SoC support
      commit: 214f78060713fe13e3ba3701dff51e46d9576a9c

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
