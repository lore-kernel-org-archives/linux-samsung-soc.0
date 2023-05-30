Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97F68C77B7A
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 30 May 2023 07:48:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229473AbjE3HsT (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 30 May 2023 03:48:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229475AbjE3Hr6 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 30 May 2023 03:47:58 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEEA1188
        for <linux-samsung-soc@vger.kernel.org>; Tue, 30 May 2023 00:47:25 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-97000a039b2so752906366b.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 30 May 2023 00:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685432751; x=1688024751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2CJ/jdt5ToTz4HsGN0SUmAFj8fhZwa0w4KNdEIXItN4=;
        b=IieD8l7Dsc8W0T8J3IK51/jVSZNptr02K/pU6d/n4X6Q5WKZxkgQfc7Sn4bu2drZpY
         BLqDdSCbPz8wSCHwnBq5seBzvoTFKWzXVDUnQGsisqvi/53XM53x5ppfBXO+KBT6GaYs
         z1b3YrT4yBU7NUkfHkJr5lLsqD0Uj1NY69Ldr0h9wrCCUKeE17d9SKeuFicjsCEOMbWS
         /l+PBBoQWkve/Q8ulR6cQ0Df19IH6X+kSg0vUF0zpGXTHTrxwB+ppBfjl8iwEVbLNwEl
         x8j5JBs998dxrGWL6rJqwRGXekc6+avZEbUuf6Nr4MVm9t7VVcMesVBIl7Vu9VAIcOgw
         qAgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685432751; x=1688024751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2CJ/jdt5ToTz4HsGN0SUmAFj8fhZwa0w4KNdEIXItN4=;
        b=JT+OMZ4sfaB0zMpEyW9ks4fgZpDz7WGqnta+cgCeu9I/fQ6eg6xluvnFno7cktJTTE
         IaT9iFoLo010uYXEIZG87kZH/CCVYpefeK+470xiao4ELCEyLKu/r86778FSrI05gmT3
         cjWx23XM5ib2sHRHDmAjXCO3DNiZfIQHkGofQjaUihIskj0dQvJ2INS6B/IofEpDj15w
         ai4DQOz6L987K32XqE0Y3PoW0XMmrLn+RwnMVZ/V3cQkvCPGt0YQj99CNHCD7ZKl1tZl
         88eUjTTtyFN5wPGTmXuLsB9j9alMIVXOETkZCHaAKQHMU6uqbfJ20Bq3vuaNxYqyHp9N
         Smzw==
X-Gm-Message-State: AC+VfDzdjAb37FZHtELggAFi/9EwiC7w5ltsJDbFFtiqOYGjqdRyBoP+
        XAgLBJiznE01fcwpHwNTFVMmcA==
X-Google-Smtp-Source: ACHHUZ5y3krPfedbQs54gM8P+NWWDmTSo9CkScOOWkgMTsp0pbGRN+H+NkrNoLC67eeC/VdgyoArRA==
X-Received: by 2002:a17:907:8a11:b0:96f:9cea:a351 with SMTP id sc17-20020a1709078a1100b0096f9ceaa351mr1808296ejc.37.1685432751328;
        Tue, 30 May 2023 00:45:51 -0700 (PDT)
Received: from krzk-bin.. ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id a3-20020a1709066d4300b0094f07545d40sm6938832ejt.220.2023.05.30.00.45.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 00:45:50 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Russell King <linux@armlinux.org.uk>,
        patches@opensource.cirrus.com,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH] ARM: s3c: Switch i2c drivers back to use .probe()
Date:   Tue, 30 May 2023 09:45:48 +0200
Message-Id: <168543271188.12093.7915373684614866148.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230526214003.2134595-1-u.kleine-koenig@pengutronix.de>
References: <20230526214003.2134595-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


On Fri, 26 May 2023 23:40:03 +0200, Uwe Kleine-König wrote:
> After commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new()
> call-back type"), all drivers being converted to .probe_new() and then
> 03c835f498b5 ("i2c: Switch .probe() to not take an id parameter")
> convert back to (the new) .probe() to be able to eventually drop
> .probe_new() from struct i2c_driver.
> 
> 
> [...]


Fixed checkpatch issue in commit and applied. Please don't skip checkpatch on
your submissions.

Applied, thanks!

[1/1] ARM: s3c: Switch i2c drivers back to use .probe()
      https://git.kernel.org/krzk/linux/c/ca027ae58eaab3632966158ce440a7f50da52bef

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
