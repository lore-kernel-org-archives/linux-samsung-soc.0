Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C81BC07E95
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 20 Jul 2021 06:48:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5AE7161186
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 20 Jul 2021 06:48:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238073AbhGTGHq (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 20 Jul 2021 02:07:46 -0400
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121]:48758
        "EHLO smtp-relay-canonical-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238723AbhGTGHS (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 20 Jul 2021 02:07:18 -0400
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 80D594060A
        for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Jul 2021 06:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1626763647;
        bh=9bjnp4VdTOhlUgHVRYNbcFZSNnpvzt+yxsss2JuyjpA=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=UVBQ+GM9iYg2HyRLl+EXS8esp9pqprihMP/kh0fYmYLNIF694CDTJ7O4Q8627sg2h
         x11RL1VirF78L2aXZMWpu1YfxHqdbULFf6DVdQIERnriNtAphRV6qutgurd8/6AkNz
         SWasMv9wu0k3AAAQ+oGjzZWrGDsEjV1pEeV/Ly+zjffz4lSHlWmJF137hWRXVkQ/K/
         2EUT4k9/afODlQ1LS7B1XGqJN5N+rwuyYhVd/euzAFn1nm/hfxzIlVVjv6W/rLzQ2V
         JWoCx4d7G6+fmwIUNS9sTQIE67Uu6ZaVZXS+47QGVoSPZXaZKg9W6KItb5AYuaIIJV
         b6UiIVevv0aAg==
Received: by mail-ed1-f69.google.com with SMTP id f20-20020a0564020054b0290395573bbc17so10381414edu.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 19 Jul 2021 23:47:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9bjnp4VdTOhlUgHVRYNbcFZSNnpvzt+yxsss2JuyjpA=;
        b=Kpx+YST33Yr2YB+UZqYikS7Ky3ye0HWOP9q5hGUo7V38yeLE9NszrFn25b7B/CjZbv
         xBz6EEiGWk+hKxEwtBiwqNBQhmd17mTyalQF2F902W6yYmCfxct1Ae//Y7MBl/E6jHrZ
         wFsMAqYYoIf7zQzqyB7p+cPYuBQVlVDD26sXX80yu19EJiot8encYStuWUn7e9BECY2Q
         /vS8F+kquFB74ZOsCUGk/hcopmsoWzOQnDQH4cKQq0tKvYQpTlwtNH3wntu8zQqQQcSj
         +hLgBBLGPcWnAHooV92Xdj3rIqTUKQWe9InMWE8VO544g3028vtejNm1uWFBp9L9wbYl
         tO9A==
X-Gm-Message-State: AOAM5309lUBeughb20ecAMbRsK49S/Iu1pnXk8jKwQbufksXN9slexw2
        45rmk34V/vsZAXClWN5IC7qYx+yn05iS7DRY5fSgrnlgdTkv0MmchDZAi8bBssZ9YE7eqLMPCL2
        SYmxhaEWyAwa3OouSwqcE6X0x6Z+ISExKXrJv+/73/m7WJ6ee
X-Received: by 2002:aa7:db54:: with SMTP id n20mr38976219edt.21.1626763645693;
        Mon, 19 Jul 2021 23:47:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxfdAbxAfgsQyWVvVvL9el3lD1RTbIyD8t6txu7+Dc08cxsfYwo/u+BxJMkUjVK1cgq1/6sew==
X-Received: by 2002:aa7:db54:: with SMTP id n20mr38976208edt.21.1626763645579;
        Mon, 19 Jul 2021 23:47:25 -0700 (PDT)
Received: from localhost.localdomain ([86.32.47.9])
        by smtp.gmail.com with ESMTPSA id i11sm8733359edu.97.2021.07.19.23.47.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 23:47:25 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Jason Wang <wangborong@cdjrlc.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux@armlinux.org.uk,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Delete unneed variable "delay" on line 79
Date:   Tue, 20 Jul 2021 08:47:20 +0200
Message-Id: <162676353666.8616.3777556078126347689.b4-ty@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210624055627.22295-1-wangborong@cdjrlc.com>
References: <20210624055627.22295-1-wangborong@cdjrlc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, 24 Jun 2021 13:56:27 +0800, Jason Wang wrote:
> "delay" variable on line 79 can be deleted by returning "0" on line 88.

Please use subject prefix matching subsystem
(git log --oneline -- arch/arm/mach-s3c).

Applied, thanks!

[1/1] Delete unneed variable "delay" on line 79
      commit: 8729ca2a6f2dd154e32b6d4858425ba29b012f7f

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
