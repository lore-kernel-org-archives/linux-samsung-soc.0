Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70D84C54EED
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 23 Jan 2023 10:01:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231488AbjAWKBt (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 23 Jan 2023 05:01:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230520AbjAWKBs (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 23 Jan 2023 05:01:48 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B480586B8
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Jan 2023 02:01:46 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id q10-20020a1cf30a000000b003db0edfdb74so4031014wmq.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Jan 2023 02:01:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HBW99nl/bxZsTE1SNWWJvTeEp3Nq/6dlA/kis96/OGU=;
        b=utTGrb/3fg+7tKVMVMXYVYrKAKW0FRoIeNF1MdJG1DSB4hTuxJ8tO7TdOM/KYj+eOq
         bt/gt2WC4QzDAwlOF8pO67FEmmCVTM0E11nD0utz17Q7jayfIAFYJidKi7PvN5vLOFP3
         +T2o9zBcZxSXF/rfoFcLfATPe5gOxlm75dbV+OuFQ5juOAjCfsTqubQaFs3n4G/qEWsU
         r4+obCpbDN+8CqWZ6VTOpxONRmVYLi7+xeBjKwM0KA8MnI+K7gmebwDLmERjOUUoHQ/E
         OBgepXJLV48Gmwrtw/nvsWWzlqFoRkbs9woizoq3yAj1lCDmXhFr3ByqDdEFauk5V8LV
         xn8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HBW99nl/bxZsTE1SNWWJvTeEp3Nq/6dlA/kis96/OGU=;
        b=JfxUMYI6LWfABhR0uQIIZpC0lGxTfb90GLoC+U57R4zSseinCwwhDqYq0g+bWRe6Rm
         kEDZFcbqom2AQQAeKZ7PENdjpttNoBa40tMY2K1AqT1j/i4Ddi6zBMjSLq9i5Da1HrqW
         MiDqp+aKpaJaVGxSom5nK6Y2vqP6c83Wc3L8JrboMbm+6dXxZGfcLZiKdjG+P8C6A8N1
         TUvHNWGbXUseoAQ0F62Zu1lkLNt7fhJ2tq8rLH3kzV93YyouFdUGr5T4kIlg1uvv19GD
         XWtr6HcYqpGYwxO5jOKpPG7ulest9To4elbtyobap3WqY41ivGScnLr9NW2jQJSPx+ws
         IfOg==
X-Gm-Message-State: AFqh2kqUrJF+ZLXfCGm/ISbjGCUhfE60KZxg6ISyrB45PVRLuGfSYFZh
        gqHQ22EQxlTs17IsMQSGatN3PQ==
X-Google-Smtp-Source: AMrXdXtTrVcaPCCBSgFX/j5Ycf6bevTbzhzytfwtX7u/nET/Yox0ixtMdIVw19MyyI5EXWgbe2l5GQ==
X-Received: by 2002:a05:600c:3545:b0:3c6:e60f:3f4a with SMTP id i5-20020a05600c354500b003c6e60f3f4amr23476158wmq.1.1674468105235;
        Mon, 23 Jan 2023 02:01:45 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id m2-20020a05600c4f4200b003db0ad636d1sm11050831wmq.28.2023.01.23.02.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 02:01:44 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     linux-arm-kernel@lists.infradead.org,
        Kyungmin Park <kyungmin.park@samsung.com>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Kukjin Kim <kgene@kernel.org>, Inki Dae <inki.dae@samsung.com>
Cc:     phone-devel@vger.kernel.org, Henrik Grimler <henrik@grimler.se>,
        =?UTF-8?q?Martin=20J=C3=BCcker?= <martin.juecker@gmail.com>,
        ~postmarketos/upstreaming@lists.sr.ht, replicant@osuosl.org
Subject: Re: [PATCH 00/11] ARM: dts: exynos: DT schema fixes
Date:   Mon, 23 Jan 2023 11:01:37 +0100
Message-Id: <167446806832.57213.6257020240038382720.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230120155404.323386-1-krzysztof.kozlowski@linaro.org>
References: <20230120155404.323386-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, 20 Jan 2023 16:53:53 +0100, Krzysztof Kozlowski wrote:
> With this set of fixes (and few other earlier), all Exynos ARMv7 boards
> successfully pass DT Schema checks! All! Hurray!
> 
> Please kindly test if I did not break any boards...
> 
> Best regards,
> Krzysztof
> 
> [...]

Applied, thanks!

[01/11] ARM: dts: exynos: correct wr-active property in Exynos3250 Rinato
        https://git.kernel.org/krzk/linux/c/d15d2a617499882971ddb773a583015bf36fa492
[02/11] ARM: dts: exynos: drop unsupported desc-num in Exynos3250
        https://git.kernel.org/krzk/linux/c/49434cd203ed3af220145f2e5e5791339dac347a
[03/11] ARM: dts: exynos: correct cd-gpios property in Exynos4412 Itop Elite
        https://git.kernel.org/krzk/linux/c/78b93ffef4ad1800f884e4892c1bd79ca5512cba
[04/11] ARM: dts: exynos: align pin node names in Exynos4412
        https://git.kernel.org/krzk/linux/c/f370a3d0fd16cd260248c387cc085dcb8a6d32b2
[05/11] ARM: dts: exynos: add ports in HDMI bridge in Exynos4412 Midas
        https://git.kernel.org/krzk/linux/c/74ac07e485bb01e232c7f3d67632ffc9b64604aa
[06/11] ARM: dts: exynos: add panel supply in Tiny4412
        https://git.kernel.org/krzk/linux/c/c2387ee9a318dfb7cb5a7a210e2825c62d4932cc
[07/11] ARM: dts: exynos: add backlight supply in P4 Note
        https://git.kernel.org/krzk/linux/c/f845ae570231bcaa677df65af620896fdf3c5705
[08/11] ARM: dts: exynos: align HSOTG/USB node names
        https://git.kernel.org/krzk/linux/c/eeb0fd23bc0fc823032dd2a2df22651ce8369aed
[09/11] ARM: dts: exynos: correct SATA clocks in Exynos5250
        https://git.kernel.org/krzk/linux/c/712c852a7b0dc0ac66fa6b89997f4f952483a5e4
[10/11] ARM: dts: exynos: correct HS200 property in Exynos5260
        https://git.kernel.org/krzk/linux/c/865b7ea364f892a3de7838eec04628efb945939e
[11/11] ARM: dts: exynos: correct HSI2C properties in Exynos5410 Odroid XU
        https://git.kernel.org/krzk/linux/c/5dd60c69047ee3fd92a9f64b28377f4819536d2f

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
