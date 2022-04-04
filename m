Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C56A0C43217
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  4 Apr 2022 21:27:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379364AbiDDV1d (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 4 Apr 2022 17:27:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379194AbiDDQmw (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 4 Apr 2022 12:42:52 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C750F35856
        for <linux-samsung-soc@vger.kernel.org>; Mon,  4 Apr 2022 09:40:55 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id b15so11819378edn.4
        for <linux-samsung-soc@vger.kernel.org>; Mon, 04 Apr 2022 09:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tVwuLd+neUM3VJZqwOr9z7OtY6A0RB3h0nUP6lYowGE=;
        b=V2K4q6ibqGhSE7TxUzONdqpSYVxHZIS8L6fhDOv6ddPgwl+iH/orvorDfWmX50HfgN
         qzjyYuGjnffRkaFXlvpTFsrsWeCmimskBN/96Urd2y+/T5OSZBKIfW0vO3eeqIqIhmD1
         sW7apuqI74Am2bflyhlKBvuTHKOTvNXQeOS1fllgPyyS6H3z4LaaWPGIgfQBhtnmMQes
         EUOsOdpHRYHBRF1yLpc4Zxbl/nx1+dDhDyOwCfeuh1/N56QKeYTwvpR+TE23rHxniM1P
         jFfKxfLZiOueCmQEJg5j/qudZoqpCa/s0IkS7vYtoqdnU5EHDMvb6LAxYudO+dzFIe+Q
         +o1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tVwuLd+neUM3VJZqwOr9z7OtY6A0RB3h0nUP6lYowGE=;
        b=xXszV03iTMmSb4YsNmndsrf5hCJ2ew0YzOaVmshdHyHVczH6nIPE4OqnTZXjmdl0FO
         i2djTBfL38BUgMHSvlerEHVf2NctBsf7jNh8HHVSKd1YggNyb/QTQQrlAaJsax79O234
         Iyo7KoeZDROjWR9ngOqBRi0YN731mgIZe8SiFTKrxSto4V/i8emkbTvcKhaY09huNY6h
         d284FKoy3bkYeqo1awvIbcDeHcaCYY/VsqCe5pZIknhb8ijky//ZabB3WjUhqpfsWN0m
         FW7aObqaPVysY/aNf+OhQu36sc78Nsm8tM1tkK5Fc8O8aBGo4QePb+IE2REQ5ffVBIzA
         6pyA==
X-Gm-Message-State: AOAM531ajy87IAexSxvM+AIrbogHzsicM0cymjxJDMnzheA4+1jsmFkI
        rdt/RWhG2xKngsTiUOaaFiVKlzQQVStq/ig2
X-Google-Smtp-Source: ABdhPJwVMvrOArv10Im+H85x8XD9d6eXEzkCXvq88uTli0UsvfwF9EQ1kELuKKOgaIgJb1GrdMBrSw==
X-Received: by 2002:a50:cd97:0:b0:41c:d36d:b8ca with SMTP id p23-20020a50cd97000000b0041cd36db8camr1072873edi.256.1649090454316;
        Mon, 04 Apr 2022 09:40:54 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id pk9-20020a170906d7a900b006e05b7ce40csm4548231ejb.221.2022.04.04.09.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Apr 2022 09:40:53 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-samsung-soc@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>, kernel@pengutronix.de,
        linux-arm-kernel@lists.infradead.org,
        Arnd Bergmann <arnd@arndb.de>,
        Russell King <linux@armlinux.org.uk>
Subject: Re: [PATCH] ARM: s3c: Drop config symbol S3C24XX_PWM
Date:   Mon,  4 Apr 2022 18:40:49 +0200
Message-Id: <164909044624.1097466.13477744007661317538.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220328082638.112185-1-u.kleine-koenig@pengutronix.de>
References: <20220328082638.112185-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, 28 Mar 2022 10:26:38 +0200, Uwe Kleine-König wrote:
> The only effect of this symbol is to select PWM_SAMSUNG. Drop it and fix
> the affected defconfigs to still keep PWM_SAMSUNG=y. Developers using
> MACH_NEO1973_GTA02 and/or MACH_RX1950 now have to manually select PWM and
> PWM_SAMSUNG (and get the freedom to select is as a module or not at all).
> A side effect of this change is that allmodconfig now contains
> PWM_SAMSUNG=m (which was =y before).
> 
> [...]

Applied, thanks!

[1/1] ARM: s3c: Drop config symbol S3C24XX_PWM
      commit: a0861079a218aeca314eba38245a47f33d51f476

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
