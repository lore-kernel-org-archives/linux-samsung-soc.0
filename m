Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DFE3C63797
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 17 Jan 2023 11:19:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236100AbjAQLTS (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 17 Jan 2023 06:19:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236214AbjAQLSO (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 17 Jan 2023 06:18:14 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2FE534569
        for <linux-samsung-soc@vger.kernel.org>; Tue, 17 Jan 2023 03:18:12 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id r9so7421438wrw.4
        for <linux-samsung-soc@vger.kernel.org>; Tue, 17 Jan 2023 03:18:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yNRGNwlNlCSw2219mzmzcHuVoA6n0rLRFLEvc8LW6gY=;
        b=Iyxg74bBYLWGp513et7gB2YXtL7HK3kYuRl7xNOwXLaR0QDkm7sCLEM+NWaPJW9lBm
         QQ4vUuI9S0KMD3ghyn6LJaOnJrpLD0lN4r0tTEkCTa+1SxfEOix+jowDPpRywuutMSzd
         HU55Jx5wMdWXCeLVfGIbKD8xAtFxeYKbc6MprBdj8Wv7LGvCdAKHwYpr8EiE6ohtTcf0
         PGEJtxLDbrKeMFDuRDSmJxT+Z/6cCOXebbU0texdQUj9tQoj2uQuSaBcnIlARRW4HEBs
         JLONPAuPSCH/h9MUNhrCFc2jocqEkCyLFVQ5ShH5VfqouxTQbXc9T8m1ApLc3k4JyjGR
         GSDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yNRGNwlNlCSw2219mzmzcHuVoA6n0rLRFLEvc8LW6gY=;
        b=NtpycAx2EX8xPBLLJJCfntTof96+ZvaIi/iTQsaK+R22WZS2AvvC2u91xIkUJe3Gs8
         xQ++3rCq8qoqy+HzTnpEZsFS933jPI75oKxsw0AwEkuf2QRwW2YR1OtGVrrK7vYFNBpm
         cEXNR9gMgkgaMUEuQk9JXkCCEtvEyOF44vDUrlgbyGLX14v5/OMYJ+MSRkKeKRe0dJhp
         +ek1Eiys0UKuv5DXRSrJ50+4yoEG4Z4SoUhUX3PkU9aKBhjiDMqlVQfoxGNVM820UIQy
         YPp/+VL+jkcHUeZXPSDiwneuPUH0Q6sE2bBR0aKYET7nLpqLHJKx/jaTVsAZZYqN2Qpv
         guhA==
X-Gm-Message-State: AFqh2koh3qFNQg7XBOfDkdmwZu6qdC1ZMh8o7z4HUSZO3a164Ed0NLZU
        AtA/Cs4rdBlFprWJXsP33uJqfg==
X-Google-Smtp-Source: AMrXdXuVWtE1Ni5EZq32Gzte0bp61JbiooFjWQqGOkD1Z37NFu6Rgo4WQWMFnOMwCLhEHBq3tOmVPQ==
X-Received: by 2002:a5d:6b4d:0:b0:2bb:f88b:43b6 with SMTP id x13-20020a5d6b4d000000b002bbf88b43b6mr2637076wrw.3.1673954291241;
        Tue, 17 Jan 2023 03:18:11 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id w10-20020a5d404a000000b00275970a85f4sm28466717wrp.74.2023.01.17.03.18.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 03:18:10 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>,
        alim.akhtar@samsung.com, rcsekar@samsung.com, robh+dt@kernel.org,
        lgirdwood@gmail.com, aswani.reddy@samsung.com,
        krzysztof.kozlowski+dt@linaro.org, s.nawrocki@samsung.com,
        tiwai@suse.com, pankaj.dubey@samsung.com, broonie@kernel.org,
        perex@perex.cz
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v4 4/5] arm64: dts: fsd: Add codec node for Tesla FSD
Date:   Tue, 17 Jan 2023 12:18:02 +0100
Message-Id: <167395418605.64421.2322020488377607185.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230116103823.90757-5-p.rajanbabu@samsung.com>
References: <20230116103823.90757-1-p.rajanbabu@samsung.com> <CGME20230116103908epcas5p49d65b8a38b8ecfeda508960a9543193d@epcas5p4.samsung.com> <20230116103823.90757-5-p.rajanbabu@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, 16 Jan 2023 16:08:22 +0530, Padmanabhan Rajanbabu wrote:
> Add device tree node support for codec on Tesla FSD platform.
> 
> 

Applied, thanks!

[4/5] arm64: dts: fsd: Add codec node for Tesla FSD
      https://git.kernel.org/krzk/linux/c/be8599d07a6a184a790054b9b229c0b37e418014

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
