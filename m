Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11F6BC4332F
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 26 Oct 2021 09:47:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BB1D961002
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 26 Oct 2021 09:47:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233313AbhJZJtl (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 26 Oct 2021 05:49:41 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:40046
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230174AbhJZJtk (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 26 Oct 2021 05:49:40 -0400
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com [209.85.167.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id E470E3F170
        for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Oct 2021 09:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1635241633;
        bh=lwt7psYc2Id4VnKMQAjNQXybp8Ipe4Z993o3ysdvm2A=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
        b=nNrP4u25DAI04WwABVxLnWHIJGtLAz7UhWIoOqf2c1s/AxNFphehIoZZlTgax09Z6
         DQqrtjowPHwMl+oNFfKAAT3icsOQJmEU/M0zEOOG3b1sFVsG1bjpHl3Wzui6LFkv7m
         nkOioJK91Pft1Tg0+3W/M6BpuAWKkcnEJ2c7+ob8ZdkDp5GnLIAegl0mMkCyYVEtI5
         zsd0akPViw2cOymqGV5yXCM+R5lswC25vubITE3ANrd2cSBtM6zaCyawcHCwjA7XbJ
         9Zn24EU96F/u5d33jGLWvHqADXtTNjdhwX0ZbNnZocgIx1EH8RJ8S84VOoXBmpMh87
         Shr+MrfuBR68A==
Received: by mail-lf1-f70.google.com with SMTP id bi16-20020a0565120e9000b003fd56ef5a94so6029397lfb.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Oct 2021 02:47:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lwt7psYc2Id4VnKMQAjNQXybp8Ipe4Z993o3ysdvm2A=;
        b=eLoIQ1g7FcT6NkNiFV2pPJa5uZ86OdQVSeNnXasG2wOJgL81VWytysi2XyNF/pxs6Y
         /33i3bmbgqalpUIZNsGxYvOneLizdhE6OHw5JDbE4wvr6rEXfit+mIehKoZpT5YZTNfn
         o17ZEAmVSZMgdTavemE1oBHHH3VCbpuwVc7WFzbVfq3UGjUC/8NDAGgfjNnan+TOVKhS
         P+OX2yd4rA3746prMir62lQqzQ9XReOGQCRuVVCTt56S1nOK/Ur4RtTIdK1ZiRGkC28x
         eQ/JtUapbJ+VP2Rv75WJp8QIVUGZY22gOjR0jMifdJGBN8GwCET3qrLqKTgods7hXw4W
         9gTA==
X-Gm-Message-State: AOAM531t26o5DSDasJP5MkeVL33Q0l3YXMFLFqg7qTSlEZq+8+EqaxAK
        NVbjZva1hlgwN60Jdj3pKYCL7jwJAZi/JbctvGURBv1HdsIbmIyQ04mnRX0v7JyNJgeUJUm3IMq
        VYoSzW2+sM4B1CJp/YmvXfuu34M1ANOld6JYFy5NxzuFKRybU
X-Received: by 2002:a05:6512:3408:: with SMTP id i8mr22545561lfr.16.1635241633291;
        Tue, 26 Oct 2021 02:47:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzd4N5qdnZjcm3JgueKSlcmI503aNViTDw74yMnkI8iPyqp/pmagYhUJyj3RegJGUDrzXfhdQ==
X-Received: by 2002:a05:6512:3408:: with SMTP id i8mr22545539lfr.16.1635241633083;
        Tue, 26 Oct 2021 02:47:13 -0700 (PDT)
Received: from kozik-lap.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id v17sm113794lfo.167.2021.10.26.02.47.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 02:47:12 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        arm@kernel.org, soc@kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 0/4] Samsung late changes for 5.16
Date:   Tue, 26 Oct 2021 11:47:05 +0200
Message-Id: <20211026094709.75692-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi,

Late changes for v5.16. Except the drivers (1/4 email), these are really small.

The DT and DT64 pulls (2/4 and 3/4) are on top of previous pulls.

Best regards,
Krzysztof
