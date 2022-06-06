Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2407C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  6 Jun 2022 09:13:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232602AbiFFJNm (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 6 Jun 2022 05:13:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232625AbiFFJNl (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 6 Jun 2022 05:13:41 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34666248C4
        for <linux-samsung-soc@vger.kernel.org>; Mon,  6 Jun 2022 02:13:40 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id v1so16980201ejg.13
        for <linux-samsung-soc@vger.kernel.org>; Mon, 06 Jun 2022 02:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GTGE/yPhiMfGC/b+fJcRmLCKJqzzVAKQP/zluWR+o5Y=;
        b=wskVau+S5g9jlGLIreKhMxcQGm6nZd4V0ixNnC3IBW8EbcafMTxexQbeRX+KtSkjgx
         alyI3t2kcltmrGBML2xfeAg2XSZ36JmGUMPkLmIwGGUHuxwtj5F9RWYsjdatuUYEbe5w
         xp4d8fjAgqTLaru6giDv8sWrX+1Vh5w3AfEo7sYumBRESRrHaf+OdKxJxATMFsLhi7E+
         j/lzWKmrUgsdDNkz/nAxENCEh+AkMsaB9mSy9djV85ENAmwa3uaiSgq9yVO4ENiUwTCi
         Bm464LhxccQLaurwfa4W4nAd8Hqr8Jf1iqAtOe1SEJ+YmPlP8c8yQT1ZMQcK3TXjw/nj
         7feA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GTGE/yPhiMfGC/b+fJcRmLCKJqzzVAKQP/zluWR+o5Y=;
        b=JoXTzMithzZpouti5J0ArDcUNqDcALQyJCyXQNqUi7NIG8lk/niNfrfB+M5LCKrGmX
         G6kZjR98pI118jrQQPtNqLWmp1bTGKKcSfN7PMV8A1SLw008ur7Iiy/gKVKSxNLvKVKC
         QpIbhEm/m2efYtkQj+qHYyV59TXARxLJ1AbLO9gVPLufHFDzKa+gmlhNnruPvVsjTeGn
         VNJYuE9vs8jzdwjBQsAJknvweYryUfcJBVlEzTZMU6Uuj3rE2qEH4S5D8d38Zo2k7jrq
         /H1ISIDkE5vNA8miOveamrsueWQJa+NcV2uuIF3MY1PP6eTyUw01XgODrlXn99w9hgto
         UThw==
X-Gm-Message-State: AOAM533qemDmu3GWklotwLkG8iWg3S2sIxiihpSF2ynKjqoRXDL/MPMV
        EiWN8eEkppUWWpN4u+62fbgh2g==
X-Google-Smtp-Source: ABdhPJwqSCgEsCT9Z1p/mMNB4b89O8XpB2k+oqR0bo8ggCv9Pto2AYGFkTuZ6dc3HrJ+d6Wg0QNBEQ==
X-Received: by 2002:a17:906:4fd1:b0:6f3:be23:7ad5 with SMTP id i17-20020a1709064fd100b006f3be237ad5mr20729432ejw.264.1654506818749;
        Mon, 06 Jun 2022 02:13:38 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id x25-20020a170906b09900b006f52dbc192bsm6077534ejy.37.2022.06.06.02.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 02:13:38 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Juerg Haefliger <juerg.haefliger@canonical.com>,
        linux@armlinux.org.uk, alim.akhtar@samsung.com,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-kernel@vger.kernel.org,
        Juerg Haefliger <juergh@canonical.com>
Subject: Re: [PATCH 0/3] ARM: s3c: Kconfig: Style cleanups
Date:   Mon,  6 Jun 2022 11:13:36 +0200
Message-Id: <165450679893.60702.4773704114108524411.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220523064252.11938-1-juergh@canonical.com>
References: <20220523064252.11938-1-juergh@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, 23 May 2022 08:42:49 +0200, Juerg Haefliger wrote:
> The majority of the Kconfig files use a single tab for basic indentation
> and a single tab followed by two whitespaces for help text indentation.
> Fix the lines that don't follow this convention.
> 
> While at it, add missing trailing comments to endif statements and replace
> tabs before comments with whitespaces (which seems to be more common).
> 
> [...]

Applied, thanks!

[1/3] ARM: s3c: Kconfig: Fix indentation
      https://git.kernel.org/krzk/linux/c/076702da7e8a2472f8ac86f1179ddcc5e90febae
[3/3] ARM: s3c: Kconfig.s3c64xx: Fix indentation
      (no commit info)

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
