Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A573C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 15 Oct 2021 07:50:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5854A611C2
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 15 Oct 2021 07:50:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236012AbhJOHwG (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 15 Oct 2021 03:52:06 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:41348
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235761AbhJOHwG (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 15 Oct 2021 03:52:06 -0400
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com [209.85.167.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 4697B3FFF8
        for <linux-samsung-soc@vger.kernel.org>; Fri, 15 Oct 2021 07:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1634284198;
        bh=7smbl6eLUD4Ng7INT7EmfV0PC0U+CLmxI4ShvMsaSUI=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=B8i29hH4yogRx9ntY1Ljwr40zzj/pjFQxbj90LFOAFSKavo4ovlMg/8bSRJvM0slL
         ITfSxTU0Tmc9bJq0nAisXtlVtjUK1+SZduLRGl5ZdzpWyfihE2zDqo8zbz7i8P0SX1
         Efyc4RmfTnZ6/iX4jHmIUAjqxqL+MQmrvqO+rB/+Va0jzE7X4oC0+kSnvorr0oxJIR
         WNIDm2sTl4qQF5KdWKAt4xeeuorlLf92/A6r4XeI2mqqJQX7Vqnx82nxUxfDUJ/56q
         tC65OWVhd9+Dwge4pPdkwXJO7Atc+A4mCUs7tJ9GpYYdzbZTGPZwRwBZUiuMLIl+87
         Kv6co+3BJ7hkQ==
Received: by mail-lf1-f71.google.com with SMTP id x33-20020a0565123fa100b003fcfd99073dso6111183lfa.6
        for <linux-samsung-soc@vger.kernel.org>; Fri, 15 Oct 2021 00:49:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7smbl6eLUD4Ng7INT7EmfV0PC0U+CLmxI4ShvMsaSUI=;
        b=cLP98/I/2K/f7/+3gRy7DqZ6CZ26Q9aIo7N+DAXqKXsr2U6ShXZk6iEdjAOkdo191K
         cdkJHnfUjyzQWCSY/h9/sgpT3wXy2m9NZd9Sxtw4bhZ/jZVljMIQnqqwoI6snw3zN5pj
         0ejsf6DZKGq3YDfuJa9bTFkcnh8wD5VUXUrN6MG0FOYqh6Wgn30P6haEoIhmlORolGJH
         KaMczzZT/QfPd6EBEIGNbmWBSzIMeSyW8/JzPInZ3OPtDeOC+FHb7kJk0L5tiflsIumu
         45nlTVtww5lZ0TFctcl4LGt9ljqWfbpQ6gk8hSiqrxFRE9kA1f7GCuSt+zKyrRLpnQJy
         TqQg==
X-Gm-Message-State: AOAM533cMYZ4IPPzwS5HR51t+lObTQAeGcnoWW+pHUj1FSpRnzeDOWBS
        SCv0Nos9/ssLlc+UXdTQKZwAmNZhAvp9L8HPOT2FABdmyT+fgj4oQy8uupg6W/LORq08NhXbU8k
        ++TXCxiXDHKlazQ65jsSF10Xj8Dolq8wMEnVaUXb6WvqH9qjb
X-Received: by 2002:ac2:518a:: with SMTP id u10mr9699296lfi.367.1634284197780;
        Fri, 15 Oct 2021 00:49:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJziBffQry3SgAM9Levwhe7XIZoAbKqytJfrPn0AsnDIQAmbq2ACnGZxDC3eOF/mYKKppo+2ag==
X-Received: by 2002:ac2:518a:: with SMTP id u10mr9699284lfi.367.1634284197607;
        Fri, 15 Oct 2021 00:49:57 -0700 (PDT)
Received: from kozik-lap.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id p16sm431493lfe.166.2021.10.15.00.49.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 00:49:56 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sumit Semwal <sumit.semwal@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/3] soc: samsung: exynos-chipid: Pass revision reg offsets
Date:   Fri, 15 Oct 2021 09:49:55 +0200
Message-Id: <163428419206.64320.1460944164027641564.b4-ty@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211014133508.1210-1-semen.protsenko@linaro.org>
References: <20211014133508.1210-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, 14 Oct 2021 16:35:06 +0300, Sam Protsenko wrote:
> Old Exynos SoCs have both Product ID and Revision ID in one single
> register, while new SoCs tend to have two separate registers for those
> IDs. Implement handling of both cases by passing Revision ID register
> offsets in driver data.
> 
> Previously existing macros for Exynos4210 (removed in this patch) were
> incorrect:
> 
> [...]

Applied, thanks!

[1/3] soc: samsung: exynos-chipid: Pass revision reg offsets
      commit: c072c4ef7ef09e1d6470c48cf52570487589b76a
[2/3] dt-bindings: samsung: exynos-chipid: Document Exynos850 compatible
      commit: 0a0124065fcd6b5e42968edbe33f85c7846d3f8c
[3/3] soc: samsung: exynos-chipid: Add Exynos850 support
      commit: 81a51eb6be3dbb76790b7353ec8dfaadfc751782

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
