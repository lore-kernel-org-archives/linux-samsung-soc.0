Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A43CC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 23 Jan 2022 11:47:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232966AbiAWLrB (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 23 Jan 2022 06:47:01 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:38900
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236191AbiAWLq4 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 23 Jan 2022 06:46:56 -0500
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id D59563F17B
        for <linux-samsung-soc@vger.kernel.org>; Sun, 23 Jan 2022 11:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1642938415;
        bh=t1Mr2leewf+dJOw+raj7dTmlAldoGuESwLMLnJL3mUo=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=UeSY7HEbDIEI29Yuog5Wc7qmAGEEkRRL4gUX8ShE0tLoKj/CAI5idXe2LkObNTRYT
         GkDg9xVTO3wQ1QLw+ZubpMrqAnrabalTOTE0+qKgkCEstqIUpIqroVNnaVuawms4b/
         AFYThjE8TMfGb6FJLrrVbANly3ZcIns76N0xF0yoJbaUUXlicLDeX1SsHn1Q4H0Hec
         aQDXPRnAIqoH4xYj1E/bgQDS5Z36S39LSv6Fy76kP7o8Qo3Dup3Bkdvw5Bo2qJfx8+
         wNO2IUzae016VE+1eY2mmCdKOSOQfR9yDvlxYpG2RWAM5QPmHYpZxTEvL8cSCYjje1
         U8F4m4n891yzg==
Received: by mail-wm1-f71.google.com with SMTP id bg32-20020a05600c3ca000b00349f2aca1beso8989437wmb.9
        for <linux-samsung-soc@vger.kernel.org>; Sun, 23 Jan 2022 03:46:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=t1Mr2leewf+dJOw+raj7dTmlAldoGuESwLMLnJL3mUo=;
        b=CcW9jPMtT9Xy4V6SR+1N+jiF5URQ5f5EpDLGeMbxQzVecYA6lODTyM2HZYieL0iHkr
         sWwj3257sk1zWPqLOpjSGvuxPpwNBUc9L82rSbvw9PAaIykte5/Q8V8zbnxKYjDiUDRj
         ZQjsl8tTOFnA33AKDfCV+yYqaN+UdVKIoDyD7Nb/HzyExoHjYX2+4EGi52ufyb9q1nyk
         wRPTNlwxew9gj95d7npmuIjgkMiDsMyraQLGMewQBgayIVF4+UwSZv+ZoTUE0AV8Z5zM
         V4Mr3rESEI6FCj27VymdBsHKuigrEzc55ooH2RDpITUwhb+SjtM7taj6mg/wQL3P0irp
         HjAA==
X-Gm-Message-State: AOAM532lRFOPeawgGv/1mfBPP0SCvo5u622n1+cYpnFZO6uZUCjsrrYs
        A2wZTcakqm9Wk8WfHqYijPxsaq+NGGI75FFOz9sYPCOqHsk++8fqhFu0D/bz3+hykHIvYO9o4sV
        2eOTfbCO40LkgFRzOLZEHTGhEEGkKWh+Q2dtni5F62DRV9acZ
X-Received: by 2002:a5d:6e83:: with SMTP id k3mr10395742wrz.506.1642938415402;
        Sun, 23 Jan 2022 03:46:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzS480IySxN7r/zMW68vwN+Cqc0h0XRSdNUxo2T7syZh+fpKi38vkV6Glz0y+IeA+oKqVXahQ==
X-Received: by 2002:a5d:6e83:: with SMTP id k3mr10395729wrz.506.1642938415273;
        Sun, 23 Jan 2022 03:46:55 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id r2sm16992751wrz.99.2022.01.23.03.46.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jan 2022 03:46:54 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH] pinctrl: samsung: Remove EINT handler for Exynos850 ALIVE and CMGP gpios
Date:   Sun, 23 Jan 2022 12:46:51 +0100
Message-Id: <164293835975.31601.16620899683024964008.b4-ty@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220114203757.4860-1-semen.protsenko@linaro.org>
References: <20220114203757.4860-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, 14 Jan 2022 22:37:57 +0200, Sam Protsenko wrote:
> GPIO_ALIVE and GPIO_CMGP blocks in Exynos850 SoC don't have EINT
> capabilities (like EINT_SVC register), and there are no corresponding
> interrupts wired to GIC. Instead those blocks have wake-up interrupts
> for each pin. The ".eint_gpio_init" callbacks were specified by mistake
> for these blocks, when porting pinctrl code from downstream kernel. That
> leads to error messages like this:
> 
> [...]

Applied, thanks!

[1/1] pinctrl: samsung: Remove EINT handler for Exynos850 ALIVE and CMGP gpios
      commit: 96f79935015cf3d7ca6fabf63cd13b8af45a7713

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
