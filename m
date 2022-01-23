Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BA13C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 23 Jan 2022 17:09:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239097AbiAWRJl (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 23 Jan 2022 12:09:41 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:42954
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236859AbiAWRJl (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 23 Jan 2022 12:09:41 -0500
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 3741D3FE09
        for <linux-samsung-soc@vger.kernel.org>; Sun, 23 Jan 2022 17:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1642957780;
        bh=TgtO7ZkMovAWiw5w+Y4UYv23VvVmT7SJgd/4D6WS0jA=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=krJKXU8dEDIc91BwaJavkHU3Xze56pNgwRO6NofO1YbQXvyZu5E+Fc2QRr+u+dHZ0
         0Nl+FQAfiEyNl8Tu5alF9SSFQdTfjLBv/FQcGlOD94EqTO6xD15V67WkzEY9VBseHS
         tMxfsNRv9cNUNp5oKtuc5L0sWH6l1oZTCoOWmLXP+sJn4V1BlCOVY1tIYcYYnlmSIZ
         TGmWdL8UdwFd+6GtB2bnzEMQF0xGP/4GW38IgPTjcrsrXCczsW/GEOQIc2NXb5sFI/
         NaBNyT1Wok0Fkd9SUOzHHZYpCZU2J1LrcEM+6ljq/uaAqlXAkRGBGgeNM23WxRfDzh
         mGEB4HCBzivdw==
Received: by mail-ed1-f71.google.com with SMTP id j1-20020aa7c341000000b0040417b84efeso11503130edr.21
        for <linux-samsung-soc@vger.kernel.org>; Sun, 23 Jan 2022 09:09:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TgtO7ZkMovAWiw5w+Y4UYv23VvVmT7SJgd/4D6WS0jA=;
        b=kzAA5O6AM5P5s43SkXndfqSthn0pAIC7tbZUNnIB24gX5eP9Cu+bV7axm+PKIffZoo
         bCn+VvwLfK8xNlQzEHS/Z940BWxdTsbPMikfWVSk/zwR60naeiNYiMSRNaa4qPaDWoxb
         3qKC4ZfpimKRYJVJjOEb1YqaXa0PerjRcw5QTfP20sdCTx2qho4f2FddDxN9h6i5oi2F
         M9t4tBc2TA6fvmpEDFXB0D4xfRkyzLv2T1Pvot9J6bu643toKLlh8uowk47crUf+srh3
         AxLzi3M/poF+XEiWHWkdJ+UyCrpZGrG37geUDQjcXUMxbQmb7RoiWixe9PuRXi3ed9j0
         NUsA==
X-Gm-Message-State: AOAM531I0lwqn3Kjs2y4HaE1gqO1jXtnqJobcTjFi18IhDB91bCFULLH
        hlFtCfOhdM1QsNJP+q1usOvwfDBw6E8n8TSvIDEC2xI/axqJIoW8ld3ERNLNihgWovrKsaGE/ci
        a3MrOb65y65ENwhBtAv0MgC3bci9laMwXUtk86dH2RHhv+4Kr
X-Received: by 2002:a17:906:5596:: with SMTP id y22mr4933834ejp.8.1642957779865;
        Sun, 23 Jan 2022 09:09:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxjA2F45GSpnl5ytJPWBo0XSK81ZtQr/XkcjbvsHagdiOq2Q9QE7mXXhSGHXK1Sv1kN7m1Zmw==
X-Received: by 2002:a17:906:5596:: with SMTP id y22mr4933820ejp.8.1642957779679;
        Sun, 23 Jan 2022 09:09:39 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id o11sm5268176edh.75.2022.01.23.09.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jan 2022 09:09:39 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     linux-kernel@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-samsung-soc@vger.kernel.org, s.nawrocki@samsung.com
Subject: Re: [PATCH] MAINTAINERS: add reviewer entry for Samsung/Exynos platform
Date:   Sun, 23 Jan 2022 18:09:29 +0100
Message-Id: <164295777264.25838.8443338247221856221.b4-ty@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220105164341.27479-1-alim.akhtar@samsung.com>
References: <CGME20220105165351epcas5p100b28a19d5a5e5614ea82adf5e0037b0@epcas5p1.samsung.com> <20220105164341.27479-1-alim.akhtar@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, 5 Jan 2022 22:13:41 +0530, Alim Akhtar wrote:
> Adds myself as reviewer for Samsung/Exynos platform to help
> in review of current and upcoming SoCs patches.
> 
> 

Applied, thanks!

[1/1] MAINTAINERS: add reviewer entry for Samsung/Exynos platform
      commit: 94bfe2bdfc5059a0870447ccf2c8048f3d016898

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
