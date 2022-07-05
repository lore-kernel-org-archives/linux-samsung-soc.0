Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B1EFC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  5 Jul 2022 10:42:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232712AbiGEKmQ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 5 Jul 2022 06:42:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232607AbiGEKlx (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 5 Jul 2022 06:41:53 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DF7F15A0C
        for <linux-samsung-soc@vger.kernel.org>; Tue,  5 Jul 2022 03:41:49 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id a39so13962818ljq.11
        for <linux-samsung-soc@vger.kernel.org>; Tue, 05 Jul 2022 03:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yXc+Prr4DbJDCgfua89JS6WqSlcrYbx/0IPvUTsg/mo=;
        b=mQt+tU7RS1jXFbE8wvtCiMS6lfjLbDPt6BdZGiX/oYUOanOmZ7khKA9v6zrIyMM5Mo
         hq8JIiW/jcpErXRVxrdlWLnvhjyAOcqmh/iRAKbcIaPrxHWvClLvBWkgUGTxA8u1zFdE
         h1bkwldxqOmcn7DmonDpaUCUaaa6jiWoT9Swk6r70bdxkZMl2Diq2Rxkl1I3j8Y8AQbU
         p1FL3XjQK9QeHEA0duvzpgJWJYP9gI6t/5v2vgtE9mrp4wIWZdUDgWDp3AUnCq72QYE7
         OFyOvG8+bYLyBXpi2K3AzylrbAGjDpfCYlq1SUKYuyWRZ+8JyDZO48bx2Q+WRuOjd4Ik
         6OWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yXc+Prr4DbJDCgfua89JS6WqSlcrYbx/0IPvUTsg/mo=;
        b=FmBINnkm2+OK4eFDO9bugs09uBQfB9uu/mlNHHa69v2dgYzAdw0dNBZ1Z93fxzbK+Z
         fNbX9TVz5CM8AgG1xsQWv01JavUNyPmOW6DzdxDNbljqQyktca5MAwQlw3z7UXzuWh03
         xu3eYToCOQbiL7US6h5GyTcy8BgQpcz5ct1YJpLuAQA5M3njy88EOYnUyj2a3ERKbPuC
         Kzp8xz93hkPXq4vGX2ojXWYP+SeR7Wo+tJ9vD1eYxZcHTpiT47XW67nNXExpy8qKJX/x
         fIArQVW7Ot0sbmVz1QyKXpmJk8/yxPwi53Pf7bfLjpXWaahqnM1dYqRuSkolTNob4nPD
         +D3A==
X-Gm-Message-State: AJIora+uXznTa/dxRHDG4MwTEW7qokANshPrFk7SYQmKfhVSDDgdPC2a
        mw4kHnqftz1UBQd2AtE+7D4olA==
X-Google-Smtp-Source: AGRyM1vmClI3Lgp7k0hvQIisOwBNarbPnAGG0NmsUx5y/6BBbXYfXCc1w7b9DLnDbxa/RocKUKfu9Q==
X-Received: by 2002:a2e:bc22:0:b0:25b:c3b6:eb11 with SMTP id b34-20020a2ebc22000000b0025bc3b6eb11mr19998826ljf.122.1657017707984;
        Tue, 05 Jul 2022 03:41:47 -0700 (PDT)
Received: from krzk-bin.home ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id q24-20020a056512211800b0047f615b5cbfsm5619814lfr.211.2022.07.05.03.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 03:41:47 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        chanho61.park@samsung.com
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        jaewon02.kim@samsung.com, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, alim.akhtar@samsung.com,
        semen.protsenko@linaro.org, devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH v3 4/5] arm64: dts: exynosautov9: prepare usi0 changes
Date:   Tue,  5 Jul 2022 12:41:39 +0200
Message-Id: <165701769258.78614.14259965932829296384.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220701015226.32781-5-chanho61.park@samsung.com>
References: <20220701015226.32781-1-chanho61.park@samsung.com> <CGME20220701015451epcas2p2d3f57de43762d78269bd7981b22ea987@epcas2p2.samsung.com> <20220701015226.32781-5-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, 1 Jul 2022 10:52:25 +0900, Chanho Park wrote:
> Before adding whole USI nodes, this applies the changes of usi0 in
> advance. To be the usi0 and serian_0 nodes as SoC default, some
> properties should be moved to exynosautov9-sadk.dts.
> 
> 

Applied, thanks!

[4/5] arm64: dts: exynosautov9: prepare usi0 changes
      https://git.kernel.org/krzk/linux/c/aae10d2bc56fd5c4e9741b98f220e56ca88bf7ca

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
