Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87A51C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 25 Jan 2022 17:19:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346408AbiAYRTI (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 25 Jan 2022 12:19:08 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:55150
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1343708AbiAYRNe (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 25 Jan 2022 12:13:34 -0500
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id DF3873F203
        for <linux-samsung-soc@vger.kernel.org>; Tue, 25 Jan 2022 17:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1643130712;
        bh=g7yYrXHImPhCQwOj0UskOn25n3xq1OGmRzWasb1bHQQ=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=hkdgSmAcmhMivsu2URlDkCXI8f63RavIJYIzrssxpjF1rnioTXzejmjLjtnZ6qPvf
         xnqUJS/AVKxZxn6/OSmfufnnU2veX8jPodPaXTf9ftVnQp2m6EEp2ou0cln9sW59ya
         fBlTS9I7bf+2r+3JVU+EiJUkjRQwMyt1RnPVTxQ4botx5jnQ3eZfD4XFuzkDHit2GX
         tP9CbpmovQtBDPJJT26Ys9nZM1YsNtQ5N3VyQrdXOL/qsyCou2qJyhxqoWmz3x2Faj
         KFOu3mEZBYE8ndQEnlkux4R1GB+8PrxYA4d37Sucns4ZTGTfGq4VZPfaIBA1h3edA7
         wuy2KPSKxrllA==
Received: by mail-wr1-f70.google.com with SMTP id g6-20020adfbc86000000b001a2d62be244so3335049wrh.23
        for <linux-samsung-soc@vger.kernel.org>; Tue, 25 Jan 2022 09:11:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=g7yYrXHImPhCQwOj0UskOn25n3xq1OGmRzWasb1bHQQ=;
        b=2jUeK2Za2ql4sSl0frTipYttH1gj8nYcG6uH1aiJ0WyGfvXhFj2W+va8edYakmbbwf
         +FsrVWVCZ7cpk6pqnPXZlLzamTzmja/vtRC8u3UK8owVBjA6hpt7oAR6ATxE2GV1YhxG
         beG0SX6kexQba9IOmwDSjj0V5XBCfv9+gDKlxgfAeyXb/0JbmEPTVoECN0l/JQVTL5DX
         jupxtetwnaDbBpBCSHubrk7j4ELe3q+TgWXiH3hHa/vyVpmwjmYLAcck2ezor+VCGgu+
         WZj17baYPIUwp7WbunchHaRN/UpLuuJbudMlHX300lWqENKbPP1B1vE8XoYmeJiMpbZX
         Q8ZQ==
X-Gm-Message-State: AOAM532rWXpV7wLjLsYm9+TA5bzUUQdzm8Ybao8IsyX56aLj2igN3ZX2
        X1gN1zxtdnZ3wiofyeIZf9PM/aglFgH/gnSHbikMAs8u5lck9Mxzp36PQGjeQaZ3e1eDc79L/N2
        QTyAbV/+lpj7ccoOsN14AsQdGK8oPvuT2+D82KNxLuSC0MAQy
X-Received: by 2002:adf:e592:: with SMTP id l18mr18490655wrm.217.1643130712378;
        Tue, 25 Jan 2022 09:11:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxmNgL2L2/wufXJkt0M/aVg1sqAVlqZZAkIIrefWSMS+S6RErnsKS/CAuAI5H838RBZZxTQ1g==
X-Received: by 2002:adf:e592:: with SMTP id l18mr18490639wrm.217.1643130712199;
        Tue, 25 Jan 2022 09:11:52 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id f8sm1185826wmg.44.2022.01.25.09.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jan 2022 09:11:51 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     linux-arm-kernel@lists.infradead.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        devicetree@vger.kernel.org, linux-fsd@tesla.com,
        linus.walleij@linaro.org, olof@lixom.net, soc@kernel.org,
        sboyd@kernel.org, linux-clk@vger.kernel.org, arnd@arndb.de,
        linux-samsung-soc@vger.kernel.org, catalin.marinas@arm.com,
        robh+dt@kernel.org, pankaj.dubey@samsung.com,
        s.nawrocki@samsung.com
Subject: Re: (subset) [PATCH v5 13/16] dt-bindings: arm: add Tesla FSD ARM SoC
Date:   Tue, 25 Jan 2022 18:11:04 +0100
Message-Id: <164313065136.81319.902005401446620690.b4-ty@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220124141644.71052-14-alim.akhtar@samsung.com>
References: <20220124141644.71052-1-alim.akhtar@samsung.com> <CGME20220124142951epcas5p255712c3a9e37b9542687587d8114bda3@epcas5p2.samsung.com> <20220124141644.71052-14-alim.akhtar@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, 24 Jan 2022 19:46:41 +0530, Alim Akhtar wrote:
> Add device tree bindings for the Tesla FSD ARM SoC.
> 
> 

Applied, thanks!

[13/16] dt-bindings: arm: add Tesla FSD ARM SoC
        commit: d25c5eb511df3439cd91517bcbce4b274f8972b9

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
