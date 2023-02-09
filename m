Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D35AC61DA4
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  9 Feb 2023 12:08:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229898AbjBIMIF (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 9 Feb 2023 07:08:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229873AbjBIMHx (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 9 Feb 2023 07:07:53 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 957E11C595
        for <linux-samsung-soc@vger.kernel.org>; Thu,  9 Feb 2023 03:59:48 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id j29-20020a05600c1c1d00b003dc52fed235so1336466wms.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 09 Feb 2023 03:59:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7ENx1BlMiFFp2IoPqIDNCRtS0BoPqJfHW4nQVqKYr9o=;
        b=F4BeqKwaARMgjeu76MVzv4QbUzWJlju3wOKLYmwaicSUmQQImF+LmXugMwe+v8PckS
         e8SWMyh5k+8OFwmmHNSy5PmVDK8ffQI4/FC9YC01WgJzqlQnZ4fpqfvT9KtomOyHCSpL
         LKm3iUQNwBisWpGoM/ePatMD1AJRqlTsVvQ8wh+8PctwSIlXTcmJ9dLHYlyX3K9yY8Ev
         sPvB/Dnf6iHVOq8R1ZaHp+/STgGIw2EQ0WEJaBtG2ZsVBWut4MF82t1oyqtOT1FxfRky
         mlQGe7X1XrPwClbiCpEaDuB7OPzvlWKj357btrD/X0IGvNCxLbrPFmMSdDKOmo/Rp2X4
         oMcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7ENx1BlMiFFp2IoPqIDNCRtS0BoPqJfHW4nQVqKYr9o=;
        b=aF4dUlTHSFh2hISCCWLka1E+AIPqGDoaXR8F3jlCL/CVKaZKJFI/n26gmhSrz7uhfm
         pSlb5vjUq7j9VRSBZBeVZCuLUOykOFW7CgLnf7N23AiYUvIu7DigPSOky29kIwSAVnTi
         GtE37wsqcURjs/7XFS1PlNd6AFWWUZ6h90CTGINlQ9HYlVJbLNlGo4r1HyNG6wUb5QX0
         Yas6A7rYXdL23yVdprVx/I+f3lVEHBquMpDCJTP/zXVhDMPutBypSMRaqiW+6KTHiLPR
         cvg/rMYZgO1CK1eZwDky7kKAuTvP/V3P7mDgbXqRlVUwXny1wFVAUf+ONBt0dRz6GSZG
         fpAA==
X-Gm-Message-State: AO0yUKXJiJpu1ikNpHNUKN4j1Sg10pgws2xPUuf3cfPGwlWS4mGmKz9m
        0n4Tx1vnw6/h9ALgu/CMxcO1gfYBvZA/z1Sw
X-Google-Smtp-Source: AK7set/93LzZXc2ETQeI1iMfQkCdxX2mN03ZhK1l+5AOtK6IVpqR5uADbh/hURLTNDJn+GsCsPzDmg==
X-Received: by 2002:a05:600c:13ca:b0:3dc:5937:35a2 with SMTP id e10-20020a05600c13ca00b003dc593735a2mr10965053wmg.9.1675943945890;
        Thu, 09 Feb 2023 03:59:05 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id n19-20020a05600c3b9300b003daf7721bb3sm5264513wms.12.2023.02.09.03.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 03:59:05 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>
Subject: Re: [PATCH] ARM: dts: exynos: correct max98090 DAI argument in Snow
Date:   Thu,  9 Feb 2023 12:59:02 +0100
Message-Id: <167594393974.789355.9583895741497134321.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230208160424.371678-1-krzysztof.kozlowski@linaro.org>
References: <20230208160424.371678-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, 8 Feb 2023 17:04:24 +0100, Krzysztof Kozlowski wrote:
> The max98090 has only one DAI and does not take argument to DAI
> phandles:
> 
>   exynos5250-snow-rev5.dtb: audio-codec@10: #sound-dai-cells:0:0: 0 was expected
> 
> 

Applied, thanks!

[1/1] ARM: dts: exynos: correct max98090 DAI argument in Snow
      https://git.kernel.org/krzk/linux/c/301d3dd05525e3a046f6cfa6ee4dea6a3b7111ee

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
