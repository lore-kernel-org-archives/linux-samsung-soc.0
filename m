Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8BBCE9270D
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  5 Oct 2023 13:56:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231230AbjJEN4S (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 5 Oct 2023 09:56:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244478AbjJENyP (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 5 Oct 2023 09:54:15 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E99D24E88
        for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Oct 2023 04:25:00 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-52bd9ddb741so1461840a12.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Oct 2023 04:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696505098; x=1697109898; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WAJxkRY9Sp0cHDK9nJO/7JshgcFSVSYa/FrdKfZWMCk=;
        b=mi6pE6g52bUKOV6iNp9hPLK2SVlW3XXy3UiNeQV+0k48xlMJ4pAweKaQEV3qLGvni7
         AMs9gne+09GNpMWzfB5IrcZA03C0c5BfucD8z/he75DprQo+r3z64CEm8/cF8KeG89H2
         7jLlEhR1/XgstZiQyZ/3d01ihHXHpBHodw5AApePSGXihJ5aOBM0qVYBos5K8bOtsN8K
         iP3KwnE4NnbnZRXDA4l5Gkx0Fpvi+9L26JxG/44DRNLSJGEy6q0cmtzB9lee5znznGye
         MYKFGIGo+GJ8QQ65dU8uRF4MKxSAT8+2pAsOd3htKvvB7c48/mXxgMt9layEAvZrqAAe
         NyHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696505098; x=1697109898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WAJxkRY9Sp0cHDK9nJO/7JshgcFSVSYa/FrdKfZWMCk=;
        b=hdXG7AuFp55VlVNikNcEkiRUgQhHeeA3mNWVKMO2XQtqT31Z+9VHMniKiwMGORn8G5
         MmRkx+Ep483Ndvsfb4OIpNJeaJKXVzCAmawu0naozvamlBSL2Dm0TlTIb0Dl+141YpGY
         0Fo3YD8FH7RWNqzST4ezyuA5pWaJIl6LhTqtNEn4XClnVis6TLH7LcuSo148im5FEuhn
         SH//pt6h6XyTLOe0ekTMvqymE/M3O0a2DmRW/ERX2e3QpR5OuPXE5QvjD2xo48DGxpfq
         ZIrMzeRNgzdjCEZOiWJ7PQy2At50O2/jwcbl4RydQl7fd/pJdSdfywuBSCtacqGIVB2W
         U9RQ==
X-Gm-Message-State: AOJu0YzogmcUK4xCPDtKWthIvv53WuimUOjnuPbJ0Y9xJPQLifAYqWfM
        P1LaNVqHbRHq4gPPu9k/TnJ1NA==
X-Google-Smtp-Source: AGHT+IF8dKcpZw8TltKhD1bRy085ev7VYENRA9xdx+ZACgTS++TSNHusFQsJ9t32Da0fkqFvf1UaEw==
X-Received: by 2002:a17:906:1ba1:b0:9b8:7746:f180 with SMTP id r1-20020a1709061ba100b009b87746f180mr4483485ejg.73.1696505098545;
        Thu, 05 Oct 2023 04:24:58 -0700 (PDT)
Received: from krzk-bin.. (5-157-101-10.dyn.eolo.it. [5.157.101.10])
        by smtp.gmail.com with ESMTPSA id g8-20020a50ee08000000b0053490ca10e3sm903258eds.62.2023.10.05.04.24.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 04:24:58 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] ARM: multi_v7_defconfig: add tm2-touchkey driver
Date:   Thu,  5 Oct 2023 13:24:56 +0200
Message-Id: <169650508242.145051.8232679227847989179.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231005111718.1096634-1-m.szyprowski@samsung.com>
References: <CGME20231005111724eucas1p19824dca99456dca9c2c5caa6bfeaf7db@eucas1p1.samsung.com> <20231005111718.1096634-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


On Thu, 05 Oct 2023 13:17:18 +0200, Marek Szyprowski wrote:
> The Cypress 'touchkey' hardware is available on Exynos4412-based Midas
> family boards, so enable the driver for it to increase testing coverage.
> 
> 

Applied, thanks!

[1/1] ARM: multi_v7_defconfig: add tm2-touchkey driver
      https://git.kernel.org/krzk/linux/c/c2a5b4597ab821a379cd84e385c9202ffed4c038

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
