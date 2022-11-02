Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57A13C4332F
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  2 Nov 2022 20:22:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230056AbiKBUWD (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 2 Nov 2022 16:22:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230510AbiKBUWB (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 2 Nov 2022 16:22:01 -0400
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com [IPv6:2607:f8b0:4864:20::82e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27E5755A7
        for <linux-samsung-soc@vger.kernel.org>; Wed,  2 Nov 2022 13:21:59 -0700 (PDT)
Received: by mail-qt1-x82e.google.com with SMTP id c15so34560qtw.8
        for <linux-samsung-soc@vger.kernel.org>; Wed, 02 Nov 2022 13:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lNJVosPNdci0vHdXGVs2cdHuEF7DCHwmyiOAOfe3bjg=;
        b=aag3Q6rvohNiU2mvHEM/YNYMwiTlmVlXjpg2FkFSf2xvsl4jlUZe2s3GGDSTnb7Ule
         1ztKxAm0hvppt+0TkbP9fVRWxWHq18cr2bQ34aEgoo1yYATiCBtrbt31+X46FHnC5S3t
         fpJJ/7woPzc6EzA+DxDjwd1K0+HMUUXFmjdKKGGtcM9c2OM+S7SWdzldPaBwFJF6PGfV
         oqnugcvbFdyJMMLqniuNW+3OBLz5Tfo9miucJN/UvRfQG8tYKbFOsGlA/fTq6c9UMWm6
         mWybycEUQ+vnkYg8oqXmEp4PBrgxWQh/xrKqwhFZ3QtnJK/VzTITp9l6uyTz3Cr+dgDU
         mcuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lNJVosPNdci0vHdXGVs2cdHuEF7DCHwmyiOAOfe3bjg=;
        b=2gg2X/hleRUps9OqgV1+RzORD8GDhg2yU3t8BBZ9EU9ynbhu0zPuEk7hISBUpI7o4E
         VcZvRau9iO6gewHIwYrWOovMQXIwWeZho4SGjIwfgvpjNgxxJwTXTKU+cz588YAnhsnY
         WqYZVIpRJY3r59tl6q+OwhxOQJang1qNZxGuRLQCfWs3vUDFh4hE1qUbJR3fy3ni2LI+
         IetZA2Vrz62rdbrlBRctoHIGY1dm/3FFtrAhMOHEC9uyjHLdKCK7R9IXhBi5WYYYPmEe
         I9K5nG67Wb1YJz8IRcZJXqfuYH0XRFXPZ0ESC/k9HSYTvx8zrlGJAv6cbUDX6o/hjqcd
         ONKA==
X-Gm-Message-State: ACrzQf3/M8bg//CT7/Do84h7OGOUrqjq0FZNENEDJLs5MJOSO/hAumEK
        F2SU3P0bqzSyEITbJDidgAl6Ew==
X-Google-Smtp-Source: AMsMyM55attEsYX0NHeDvMJiDWhSkZby8BQWWdMuvTRAlvzA5XgZG0q3sde2KYvGY5AfXLic9icfWQ==
X-Received: by 2002:ac8:5245:0:b0:3a5:3e52:2d97 with SMTP id y5-20020ac85245000000b003a53e522d97mr7396482qtn.121.1667420518371;
        Wed, 02 Nov 2022 13:21:58 -0700 (PDT)
Received: from krzk-bin.. ([2601:586:5000:570:28d9:4790:bc16:cc93])
        by smtp.gmail.com with ESMTPSA id f11-20020ac8498b000000b00399ad646794sm7119581qtq.41.2022.11.02.13.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 13:21:58 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Pierre Gondois <pierre.gondois@arm.com>,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob.Herring@arm.com, linux-samsung-soc@vger.kernel.org
Subject: Re: (subset) [PATCH 06/20] arm64: dts: Update cache properties for exynos
Date:   Wed,  2 Nov 2022 16:21:55 -0400
Message-Id: <166742051292.139492.12539582422109367063.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221031091945.531874-1-pierre.gondois@arm.com>
References: <20221031091945.531874-1-pierre.gondois@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, 31 Oct 2022 10:19:45 +0100, Pierre Gondois wrote:
> The DeviceTree Specification v0.3 specifies that the cache node
> 'compatible' and 'cache-level' properties are 'required'. Cf.
> s3.8 Multi-level and Shared Cache Nodes
> 
> The recently added init_of_cache_level() function checks
> these properties. Add them if missing.
> 
> [...]

Applied, thanks!

[06/20] arm64: dts: Update cache properties for exynos
        https://git.kernel.org/krzk/linux/c/58710ae94589a2b2baaab6b6986064b691124b0d

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
