Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FB01CCA481
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  6 Jun 2022 09:22:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232763AbiFFJWz (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 6 Jun 2022 05:22:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232711AbiFFJWw (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 6 Jun 2022 05:22:52 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30BBFA470
        for <linux-samsung-soc@vger.kernel.org>; Mon,  6 Jun 2022 02:22:45 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id q1so27712790ejz.9
        for <linux-samsung-soc@vger.kernel.org>; Mon, 06 Jun 2022 02:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YRul4En+zUsvPscyNur2BYtLJ2pA1uRWUnvIRnDGwd4=;
        b=pvyIsI7n6qmT9178HKdHJ+asUjScObVc4OEl1M7mzVYo4ABDlmCZMmwt4+NEkQi3dY
         Tqr4aGLjZwyhmHZqYpzAWUewSdELp4B8lhQxwq0hm0dynLQFf/PmlGooGA5YxSfoZAV6
         NqSEUpEbhK6NCZgUGPmMsnb80byIWbiH2Jd2rl1PxEFNG8iyy8LqeZna/kno2f2RorEI
         WIsHR/EnSH3X5XslvgYyd4VUixl3jJ+KXU6nU+Ec2j8/uwKxxUdAxZPQYBNtVArh2qMf
         ALNrMXO6+9woEyca3X7h1am4Bt4J0z2cWDteO5KKuZBtCPTh2lkfK293+hmIT0Jemm7q
         mQkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YRul4En+zUsvPscyNur2BYtLJ2pA1uRWUnvIRnDGwd4=;
        b=hPrEBBrn1gaIcYwQDy2lLXlXtgNousu6BH5uY0ssbcdkflprt60kGBkLhlkdyKE4Pz
         v4Nqreh80MTWPqTJAxPjOEKdT1UM8yCqjYSKbwFtceOe3BhxRkccdrUHIg1aNnn2hhqg
         xqcnUjIuf9svdcDvSW0L8Xh4KxhMtsGT0Q02rsTR72ZfRQ9yHS0u3IbYYMBD5V4AEtsC
         mlzCPwhuiYoTJVi1QYRDADjce9lnBheQXnQqLPGHU+KBpgAKUHZFUVHT83MZszs7aSmm
         5JFZejCSqY4aa8LLaWLsmrEwBB38IX+mIPgr3gty7S+4RRIh7HTFU5qwTShEA+jP821p
         he1A==
X-Gm-Message-State: AOAM532MsXhFxxf+OEwUVIXfpA6Ro8T1tevGB7OemWXo3hP9LiIsu2yL
        we174zlFfzQXBqNw9dkCP7SIDw==
X-Google-Smtp-Source: ABdhPJwKE3yxHKkpb+wb3yYnG20dDaj72u4ByxtQEbBoT8JgvyXTD9DJ5O3+EtlrYr2h87XGF3eF3w==
X-Received: by 2002:a17:907:6e12:b0:6fe:c2fd:89b7 with SMTP id sd18-20020a1709076e1200b006fec2fd89b7mr19647703ejc.581.1654507364209;
        Mon, 06 Jun 2022 02:22:44 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id u21-20020a1709064ad500b006f3ef214e14sm5956397ejt.122.2022.06.06.02.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 02:22:43 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     =?UTF-8?q?Martin=20J=C3=BCcker?= <martin.juecker@gmail.com>,
        linux-samsung-soc@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
        Sam Ravnborg <sam@ravnborg.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-kernel@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>
Subject: Re: (subset) [PATCH 3/3] ARM: dts: exynos: add panel and backlight to p4note
Date:   Mon,  6 Jun 2022 11:22:35 +0200
Message-Id: <165450734050.62970.863137205835285072.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220516193709.10037-3-martin.juecker@gmail.com>
References: <20220516193709.10037-1-martin.juecker@gmail.com> <20220516193709.10037-3-martin.juecker@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, 16 May 2022 21:37:09 +0200, Martin Jücker wrote:
> Add configuration for the LTL101AL01 panel and a pwm backlight to drive
> the display in the p4note devices.
> 
> 

Applied, thanks!

[3/3] ARM: dts: exynos: add panel and backlight to p4note
      https://git.kernel.org/krzk/linux/c/6c52573bf4c3a0f6e7142264fb36b31ae2c3707a

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
