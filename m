Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ECDAC61DA4
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  9 Feb 2023 11:10:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230089AbjBILKy (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 9 Feb 2023 06:10:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229645AbjBILKv (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 9 Feb 2023 06:10:51 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 607FB12F32
        for <linux-samsung-soc@vger.kernel.org>; Thu,  9 Feb 2023 03:10:50 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id k8-20020a05600c1c8800b003dc57ea0dfeso3622229wms.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 09 Feb 2023 03:10:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8oSi64E8kaq5qVsK7gvPtC7I4dgXQobi1UrBcoHqmA0=;
        b=ceIsNyHVZBUFWZ/cbxIsCjMGhv7C3K1xKcT5KnEp7jA/tKmnEf4huZSX1Pa8iTmlAx
         Ytb4kTRAfIy/R08iZ5WQlV+1w+9H/0ONZzQSH1+BKOzOG+38kukiDgl+f7U8CBXQF0QS
         iu6Dc1RSAOA7lvTNg8Ui6caCeRh4YdgfB6J9+cWW885E7z82XSpRuLGjxfVTDLrdR+Cx
         rr0ZOCxz4N3r8+obbvhkDc3/XYzSFnaJ0nr5WtTNn7qVmpspa+i8jzGXESxBGhNwxe10
         EMKC1dLp8yuqEBLaZkH0J4K8S0hJe/F9cwuZnzHcE0zMj54aUHRSDXloOzBgo5dxGLcQ
         R4Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8oSi64E8kaq5qVsK7gvPtC7I4dgXQobi1UrBcoHqmA0=;
        b=CE1/BqNzj259SotISXSowVXrYAHgJYlg7uO7lBb1rvOknE3tVNWReBqd5YPMYBeiSr
         VFL1IsniWF8xxsk8J+W4NWRWSCQMSb9P/L1pwY+ww1ebGlHGqpfSSkzIXscToN6wNuMs
         mnhWgrZshXSK+qVlwe4kiIl4EYGYjWbnRVMX55ByZLXyrU6L5XNOWX3xWq++C8Yx0fu7
         WIhyo1OU9bYWcB8s9Yb7FpvMCa/4B6b2/uqno/DJYo6jsjPG3zMi+gf6YwS61opdk0A5
         DNemmHqJnz4LxgLGx3+g92XF+LD3Ecdipyl5d8RyPgpWhpkVAyKOR/9jRCwM94PbOwMK
         edVw==
X-Gm-Message-State: AO0yUKVh+jmkAe5tUxW9ITpRBFrPZPmacf3Di0UdtWUWfgcMlD1IhZ4c
        JPNEbP4P39fm19XcqKNLijMGzA==
X-Google-Smtp-Source: AK7set81s/3QdNNOkLaKgnLMXQr7muQ8FLzbe9X29CR6eE/Q2HjXvO9iH52KdPZY+VJBBtYyX/eYqg==
X-Received: by 2002:a1c:7417:0:b0:3dd:62fe:9914 with SMTP id p23-20020a1c7417000000b003dd62fe9914mr9597819wmc.18.1675941048899;
        Thu, 09 Feb 2023 03:10:48 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id q13-20020adff94d000000b002be099f78c0sm963207wrr.69.2023.02.09.03.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 03:10:48 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 6/7] ARM: dts: exynos: drop redundant address/size cells from I2C10 on Arndale
Date:   Thu,  9 Feb 2023 12:10:40 +0100
Message-Id: <167594102110.781687.18285546889431466418.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230207210020.677007-6-krzysztof.kozlowski@linaro.org>
References: <20230207210020.677007-1-krzysztof.kozlowski@linaro.org> <20230207210020.677007-6-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, 7 Feb 2023 22:00:19 +0100, Krzysztof Kozlowski wrote:
> I2C10 does not have any children because it is used in HDMI DDC, so drop
> redundant address/size-cells.
> 
> 

Applied, thanks!

[6/7] ARM: dts: exynos: drop redundant address/size cells from I2C10 on Arndale
      https://git.kernel.org/krzk/linux/c/c118f3d23531fccab2f64cb02196b2b52ad8392d

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
