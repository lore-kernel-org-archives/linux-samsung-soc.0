Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 869E0C54EE9
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 19 Sep 2022 08:26:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229839AbiISI0P (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 19 Sep 2022 04:26:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229706AbiISI0N (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 19 Sep 2022 04:26:13 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 990DE1E3ED
        for <linux-samsung-soc@vger.kernel.org>; Mon, 19 Sep 2022 01:26:12 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id b24so3071860ljk.6
        for <linux-samsung-soc@vger.kernel.org>; Mon, 19 Sep 2022 01:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=O2MgMIBBQEimoJdZbXcMWrscXFrilAA+hSe/6tn94n0=;
        b=MnzF7R+IGhfKCspZo8gZeidv6vRNzFRZYpqvo1Q5kocJ07LiCnYhoOlT/LOAsqz/Ba
         Bfbl45vt14+WGz48V514izOMO9xu73v34/ecgQZZQc+aPO2haWgfmAG62N2w7Efmw0cu
         iG7WpGkiUyWKViispqUf3trIREmDG9iDmwq/Naf+dLaBZCJ8qH0AeYO4O0jfQ8CJWd1I
         1OXNOskQ5sPzzOnYLx5iijG+Xxt6eawPcUU7FpQGA1CBg/FDyiVixQKlxopOJ+/boZ4m
         BAHQagAWzXoZEWGwqJiapGsTf1Szg+L8klu9jpsDxmEpOeUveZnldkSIwSDxK4lC4bbG
         XIMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=O2MgMIBBQEimoJdZbXcMWrscXFrilAA+hSe/6tn94n0=;
        b=ceVDd8dyNTF0OtCZjMFt/rgrqDF7qkjTqdQiptlc0D+x595Z4XnzENAwB/xYslZJVK
         zjZyd9+4chqdiLufg2ls6br5l8PKVyl5q2xftEP73fDZvXTTBoT2fdl2Y3gxmTImLRhj
         S/R5qG8TvaTfdqOJur1GihIEMGVay8vT93L0j5SSZG5pJOcNZ85rj2qUJDJSa9M88j+X
         q/SNCMp7cOdxREF7ryAaH5FaSsUyCuaWX3zjfVbd7xnBEy9RrqVlXDypJM8S/qnjK16w
         /Zvdb0RkI2Dk1G21g2ULWVRqK9a5WeTpEE37HcBXC7IhsZNuD/EI04Lolh4SB3zsmczO
         xdSA==
X-Gm-Message-State: ACrzQf0iv6wo2v/IMJF/lIEtOmt6SVODzR0CNao0cR4WcG6/5O1oyAPa
        isgwa2aR/8EUbF9h7xGW7KnNDA==
X-Google-Smtp-Source: AMsMyM6R0ZkLgcMBtQPLr262w44WE2V1Xm7RMzUhBE1s99vWW45VnpQoNJYie7PdXEyCe8MY/aekDA==
X-Received: by 2002:a05:651c:1795:b0:261:af46:9d12 with SMTP id bn21-20020a05651c179500b00261af469d12mr4837011ljb.122.1663575970979;
        Mon, 19 Sep 2022 01:26:10 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id 15-20020ac25f4f000000b00492e3c8a986sm5082846lfz.264.2022.09.19.01.26.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Sep 2022 01:26:10 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     mchehab@kernel.org, alim.akhtar@samsung.com,
        dmitry.torokhov@gmail.com, linus.walleij@linaro.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: (subset) [PATCH 1/2] ARM: dts: exynos: correct s5k6a3 reset polarity on Midas family
Date:   Mon, 19 Sep 2022 10:26:09 +0200
Message-Id: <166357596576.15357.16775014746077893385.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220913164104.203957-1-dmitry.torokhov@gmail.com>
References: <20220913164104.203957-1-dmitry.torokhov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, 13 Sep 2022 09:41:03 -0700, Dmitry Torokhov wrote:
> According to s5k6a3 driver code, the reset line for the chip appears to
> be active low. This also matches the typical polarity of reset lines in
> general. Let's fix it up as having correct polarity in DTS is important
> when the driver will be switched over to gpiod API.
> 
> 

Applied, thanks!

[1/2] ARM: dts: exynos: correct s5k6a3 reset polarity on Midas family
      https://git.kernel.org/krzk/linux/c/f539422ddaff0680dd1d4ad94df11be4703ccc93

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
