Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFF5BC433DB
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 28 Mar 2021 18:12:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 906ED6195F
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 28 Mar 2021 18:12:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231373AbhC1SLp (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 28 Mar 2021 14:11:45 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:38670 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230092AbhC1SLW (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 28 Mar 2021 14:11:22 -0400
Received: from mail-ed1-f71.google.com ([209.85.208.71])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lQZsf-0005wI-38
        for linux-samsung-soc@vger.kernel.org; Sun, 28 Mar 2021 18:11:21 +0000
Received: by mail-ed1-f71.google.com with SMTP id o24so7522055edt.15
        for <linux-samsung-soc@vger.kernel.org>; Sun, 28 Mar 2021 11:11:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Rey3AlF6bNMfZTTg+jkx/LiRPjc90KdJa4L+s9E+65I=;
        b=ikVfsqn3S1UKuOxCy6v285lraSce//QM3n11/f0TUVVQ7Kih0bWNfK8RzKSGdQfZii
         lJJ+9Ev12CzH4iB/hLJRDT4/tmk5OB+DOjheNZJdsWos1n2Md+jFUpSo0/FTRSIPAcHt
         62t4lfa7D+T7WhFIRZNnn8ps+3fI6abOFye+MBQLdzEUrSNUiOymviWo2sdAr6gS4NUR
         k/VztAiuN4k5aWHgV2lf4fiKLm226PBJivJBJMteNjTHPwQaGP9ahOJ730iVqrzHU81i
         2ovEBJIzzoE4A269frseijx2eGRYDygQTKEGyTU4TxDtKv8CMO5yHExY/D3Ymf6AvDL6
         B7Gw==
X-Gm-Message-State: AOAM532IBr46atK8DQUY6h3gDJsTcULuT8NM5bsFG6ERkh/T7JKxDZ0q
        gcp+CrnaaZ9zR35XkAfuBYUQ3K17x277BIl7aF9TMkrprNTemLbFsDy66Uj6oyhgCT0PF9LalRX
        GoK2fbAQyJ+k7eRGF1z4ePncz4tIddSnzN0cek8lIsWbHIzos
X-Received: by 2002:a17:906:5495:: with SMTP id r21mr25458712ejo.471.1616955080889;
        Sun, 28 Mar 2021 11:11:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyMqzeyTcGYaM/gLqBM9Eh62h3335SF++m0WO+Z/UFRWGHlTnAkUvRVICLPJ2uKs+ueEa0cVg==
X-Received: by 2002:a17:906:5495:: with SMTP id r21mr25458700ejo.471.1616955080791;
        Sun, 28 Mar 2021 11:11:20 -0700 (PDT)
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.gmail.com with ESMTPSA id bt14sm7670364edb.92.2021.03.28.11.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Mar 2021 11:11:20 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Timon Baetz <timon.baetz@protonmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v2] ARM: dts: exynos: Add front camera support to I9100
Date:   Sun, 28 Mar 2021 20:11:16 +0200
Message-Id: <161695507016.4212.18409865650409500354.b4-ty@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210327200851.777327-1-timon.baetz@protonmail.com>
References: <20210327200851.777327-1-timon.baetz@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sat, 27 Mar 2021 20:09:01 +0000, Timon Baetz wrote:
> Add node for Samsung S5K5BAF CMOS image sensor and
> enable the associated MIPI CSI-2 receiver node.

Applied, thanks!

[1/1] ARM: dts: exynos: Add front camera support to I9100
      commit: 7f4ebf3e4ce10a1ed8ff2aee5d75568dc3522b2f

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
