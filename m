Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E961AC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  4 Feb 2022 15:12:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359610AbiBDPMV (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 4 Feb 2022 10:12:21 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:51128
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1359604AbiBDPMT (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 4 Feb 2022 10:12:19 -0500
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id E6D853F1C1
        for <linux-samsung-soc@vger.kernel.org>; Fri,  4 Feb 2022 15:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1643987538;
        bh=00B2qCrzeyDH+uH8/dw2Cjp7WLU/oGst7SCYDobRn64=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=V9vhsq5j/uQ725vhHYIVizH3SHirRNR5JHaUVW8kblnQM9YsvH8E1xdwOcXsFNLzZ
         +yu8sO2GgsIZ7GCQ6JkxLsSvZm45QrbR1fObkwMQYEHZJxOukB3uBtWUn9eMbns01h
         XNYVIH5oTsvu+o7kpcQIB84Lpa4sYG1cfpnZ2wmjlmk94/+pVI9Dfe9qkNIxEzabeL
         4oA9YTrQGCVkSO8C5w55zFe6M15gZfAjSonGFWQ0Tps6pNLr9phHc36Nvm+tgztURo
         Oo1SRYsLZj4KchUdXa4nz64b1FUxiyycooL6731/xMLBvY4FAMctP67Vlug0tpyWxj
         s15yzk1a5wu5Q==
Received: by mail-ej1-f71.google.com with SMTP id ky6-20020a170907778600b0068e4bd99fd1so2698187ejc.15
        for <linux-samsung-soc@vger.kernel.org>; Fri, 04 Feb 2022 07:12:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=00B2qCrzeyDH+uH8/dw2Cjp7WLU/oGst7SCYDobRn64=;
        b=gmpo1wxUYLcu/fm36Tt8XPfPtGIUAO0pTf/bqGpWIcC+JWJCgblSKz3vPoah4Blk0s
         IAz/9YX4iPSyupuATctq3CWcfvuuoLO7AwC1IwCIb39ek0kkGgJL7HriQDcC3kj9nuwd
         U+TBLus6oLCwJnEmkK6JFP6OvzLKbxEhJ0S3I3ukDj2F1aAAMmSgiTOZ1Hg4pPA7fnAW
         9BptsgQWjA6RmclVgLcF5s/gZWzA2Y9MGJ75VLSyynFwYUdav89SJmFGChzHk1KexxFg
         332I2wCt5r0GGHU2z26tWTlaJrGnfNfTO/IcaaK6Uhw8SwAgE+sw1AgPnZNcspl6nbfC
         7BYQ==
X-Gm-Message-State: AOAM532flwbR/uDk8XN64j8O7m3ZjOIWkRp/sF0La8fyS+LMZgDdCjwg
        mSfMoc2NfZJe08vD9sfwdyHrOnciWGsyO5oIVkblkQ+a/sQb/Pqah+5xv2ipvWgyAuY7OX77KZn
        EnbINBDj6c7cUL5vQJdfd1kMnNuFOWcfsB+93yo+KRVHwMie6
X-Received: by 2002:a50:eb46:: with SMTP id z6mr3423795edp.229.1643987536916;
        Fri, 04 Feb 2022 07:12:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxb7QZV7uykHzljTBp1XTCcqRb+uEgrBmcfwCNo3JGwEadAja6qKSSvp1JuF6RGg5AIg+FgSQ==
X-Received: by 2002:a50:eb46:: with SMTP id z6mr3423779edp.229.1643987536749;
        Fri, 04 Feb 2022 07:12:16 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id h15sm757748ejg.144.2022.02.04.07.12.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Feb 2022 07:12:16 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        =?UTF-8?q?Martin=20J=C3=BCcker?= <martin.juecker@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH v2 1/2] ARM: dts: exynos: add charger and battery to p4note
Date:   Fri,  4 Feb 2022 16:12:12 +0100
Message-Id: <164398752918.81715.4450526381656731657.b4-ty@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <d7f7b0f87a18b5cc44ba97390461c15469439829.1643919230.git.martin.juecker@gmail.com>
References: <d7f7b0f87a18b5cc44ba97390461c15469439829.1643919230.git.martin.juecker@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, 3 Feb 2022 21:29:47 +0100, Martin Jücker wrote:
> Add device tree entry to support the Summit SMB347 charger which is
> built into the p4note devices, as well as a simple battery node.
> 
> 

Applied, thanks!

[1/2] ARM: dts: exynos: add charger and battery to p4note
      commit: 38dfe352b5a56df9cdf3e40ec5a09bb539757352
[2/2] ARM: defconfig: add SMB347 charger driver for p4note
      commit: 300ccbb25491b4d4aa67098161a953ff7652d650

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
