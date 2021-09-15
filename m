Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4A38C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 15 Sep 2021 07:51:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C6C2560FC0
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 15 Sep 2021 07:51:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236784AbhIOHwb (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 15 Sep 2021 03:52:31 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:44982
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236764AbhIOHw2 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 15 Sep 2021 03:52:28 -0400
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 6D3BB40288
        for <linux-samsung-soc@vger.kernel.org>; Wed, 15 Sep 2021 07:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1631692269;
        bh=OJcDamyiEF67IZ4HLmlbFhwSssZsjMvckl4Gtilac5s=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=a9HIyneAwESLrUNfEI9asinyi1dnN0t4qFjtj+P06NWDms6Vba3ex1LfD/T6GWCUE
         SkZpIEzN9VwzaVWWnkuF3BwY6vsbRWONRDYdQbRQD5J8wNGLuTzml4QHyYG+Cpf9VF
         tTQDdhToknieLqWaej14ZutYt7I/km7Jb4WOPPBGB7LZ4gJ8wjZXvc7C6c4m7b3+G+
         eDXu6TYsY+j2mKpdSeoH8/qFOBuQCMLx/bHPyCaMsxP4Rugj6becaRuLDcwsuYTqTy
         zL2fhdNgaPhiMLkltyyqRu6Nk1gTNM6aRgR07BqT3IcHEBuNqC/ohyR031xtb4OeTe
         Kiww4nYMtnx1Q==
Received: by mail-ej1-f69.google.com with SMTP id n18-20020a170906089200b005dc91303dfeso1040925eje.15
        for <linux-samsung-soc@vger.kernel.org>; Wed, 15 Sep 2021 00:51:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OJcDamyiEF67IZ4HLmlbFhwSssZsjMvckl4Gtilac5s=;
        b=lhrVxjlmGDOyDc1CdcF+VMypoUM3Ea2GBn9YDAn/gHk0R/Zyt9MQDvDh3fs7Q1wsh5
         wsNHtn33A8wKvOE0Bb/zXFFHB5ZbWOWG22lp7ivIbLHfRZSjJqik3apE6j09YmGQRR8L
         71SZOoIz+vSBDHendLcclO73BZTCLkaY3G4+s2+oZaVtfhIeVbMGCYN22izG2b5wHEHp
         KLJSJkl7ylgBkpM9M6xX9+P/p68yef3DgFmXbu/FNDbx/DFnPIqnrkLAus7y0LJ3jNLV
         PaJWfv346u2+dZ19mIxkIzmDlG0NGb8Lnadu/N/CvZV/uaDLKjKvKpLDoMgP+XRsbAaw
         KfWw==
X-Gm-Message-State: AOAM530bPIdS36mcQIGk2wfpTyWoD03uyXseUIRG8XjXOlV0YME7H6Q1
        dSanzzfKtZQLhOHa7YjNF4qK0FNJrjI7uVMR20rC8CDDDvQ3Bvu+PRuD6XC1rv0I7uq81yaU6XI
        0DziEHqvDb8XVjYVxeXAs1Q3yv5BEU1AbRDsVBMkFrxopOTnt
X-Received: by 2002:a17:906:4ccf:: with SMTP id q15mr11926470ejt.9.1631692268881;
        Wed, 15 Sep 2021 00:51:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzNm+vkHA60w37a2pVVupoCU9/UFwUDM63Pl07jb1aZJ4tzimmaSJU4NKoov1qOrN6UcdohEA==
X-Received: by 2002:a17:906:4ccf:: with SMTP id q15mr11926454ejt.9.1631692268702;
        Wed, 15 Sep 2021 00:51:08 -0700 (PDT)
Received: from kozik-lap.lan (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id n11sm591922edr.51.2021.09.15.00.51.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Sep 2021 00:51:08 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Jackie Liu <liu.yun@linux.dev>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, liuyun01@kylinos.cn
Subject: Re: [PATCH v2] ARM: s3c: irq-s3c24xx: Fix return value check for s3c24xx_init_intc()
Date:   Wed, 15 Sep 2021 09:50:59 +0200
Message-Id: <163169222223.16372.4373393862023075266.b4-ty@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210901123557.1043953-1-liu.yun@linux.dev>
References: <20210901123557.1043953-1-liu.yun@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, 1 Sep 2021 20:35:57 +0800, Jackie Liu wrote:
> From: Jackie Liu <liuyun01@kylinos.cn>
> 
> The s3c24xx_init_intc() returns an error pointer upon failure, not NULL.
> let's add an error pointer check in s3c24xx_handle_irq.
> 
> s3c_intc[0] is not NULL or ERR, we can simplify the code.
> 
> [...]

Applied, thanks!

[1/1] ARM: s3c: irq-s3c24xx: Fix return value check for s3c24xx_init_intc()
      commit: 2aa717473ce96c93ae43a5dc8c23cedc8ce7dd9f

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
