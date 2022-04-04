Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE88CC48BCD
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  4 Apr 2022 21:25:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237667AbiDDV1I (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 4 Apr 2022 17:27:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379379AbiDDRD5 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 4 Apr 2022 13:03:57 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D2C540A28
        for <linux-samsung-soc@vger.kernel.org>; Mon,  4 Apr 2022 10:02:01 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id i27so14188062ejd.9
        for <linux-samsung-soc@vger.kernel.org>; Mon, 04 Apr 2022 10:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XDRai04CA05RswVKu5alUWJtGVzhDwT89lcIpEMtwKM=;
        b=YGjEVbKrxaCj2fiISbwvOvVSLZ42rj3jHDAPpX+ykNsk90fFh/VsuaFoFMNYtyxuzF
         nVi1FnYccUZfV3/L6BEPiJ0lmNO/JN8Kl/CXMB+yUcnqfXIsneiUpStjBd+YralAyO8R
         JLRIj8Rz1nEW9LenHRh9+U+poKxEmfIx3v0EhYx8lPOK7IVh+YyBW2M/utkM2TUi6YtW
         ecN1C1KwqD/KkxPnoqCS1NdxfskdpaEB08QOhOK7NFRh4ccuynpl9jFvSDFIFCiqBGEg
         hD9fv5XB7Jz+vbUMOAPD6yJO7KoPbmdn4G0J5eypih98p+tNOvZfhExy67YIyPuCt1Y7
         P6SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XDRai04CA05RswVKu5alUWJtGVzhDwT89lcIpEMtwKM=;
        b=7ezNN21cyPeXv4c8UucMbFQEGlWCuCVDmC18CysslvmiGIzYYrae8Wgd5u+w1L8rat
         3aXk0mdlr+V/KcjgVe28hJifoDJbUAJIHlmXNSXjRa06k8eekwIuv6RcCqrUXtUbBI0U
         0FN+PQ0vMUtU/qFbYhjxQcBB+q33D6wOjPZGroOALyNE7e0nySPT5z5SjBb+zoBRmxq5
         Yuq1+rdhRK4l+UIdUL21DaISWrWWbUKaFISC4jY/QR8NVyHPFNOiozeDPoqNMQUYX9yy
         rtbUBP69vk3myiuukdYT6/aM1nkKMLba9r5ssPJmS8k5jX7X8GPPHMyKpEdrbtLMdWOf
         qWUg==
X-Gm-Message-State: AOAM532z99wo2MvPx1TcR4xe3NtTrB1TTI9v5F2Lin3x8mgDv+U6I7Ey
        GOh1Z8EGmIUGfiInbT16HyR9bg==
X-Google-Smtp-Source: ABdhPJxjxE1555uF2gVoe5qYPFLZ+9GXlrvyiQUh8yEYi1nxgJCJ+oxDdo2NSpOk6a60bL6TomwbSQ==
X-Received: by 2002:a17:907:96a8:b0:6e7:c54e:66e4 with SMTP id hd40-20020a17090796a800b006e7c54e66e4mr1100334ejc.322.1649091717687;
        Mon, 04 Apr 2022 10:01:57 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id c5-20020a170906d18500b006ce371f09d4sm4557770ejz.57.2022.04.04.10.01.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Apr 2022 10:01:56 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH] ARM: dts: exynos: drop deprecated SFR region from MIPI phy
Date:   Mon,  4 Apr 2022 19:01:46 +0200
Message-Id: <164909169269.1688455.14606590160258224493.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220314184113.251013-1-krzysztof.kozlowski@canonical.com>
References: <20220314184113.251013-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, 14 Mar 2022 19:41:13 +0100, Krzysztof Kozlowski wrote:
> Commit e4b3d38088df ("phy: exynos-video-mipi: Fix regression by adding
> support for PMU regmap") deprecated the usage of unit address in MIPI
> phy node, in favor of a syscon phandle.  Deprecating was a correct
> approach because that unit address was actually coming from Power
> Management Unit SFR range so its usage here caused overlapped memory
> mapping.
> 
> [...]

Applied, thanks!

[1/1] ARM: dts: exynos: drop deprecated SFR region from MIPI phy
      commit: 04398e04173f1be0b21d7cd50c54e8affcebe106

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
