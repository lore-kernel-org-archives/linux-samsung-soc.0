Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BD6FC25B50
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 23 Jan 2023 10:02:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231666AbjAWKCA (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 23 Jan 2023 05:02:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231624AbjAWKBz (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 23 Jan 2023 05:01:55 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1270B9770
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Jan 2023 02:01:51 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id f25-20020a1c6a19000000b003da221fbf48so8103820wmc.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Jan 2023 02:01:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QDRXGMLivFOcZ79NQl3aMUkhwQ0hIeAn1Ufeiz9Vo2Y=;
        b=fu7mfQyJWuiY5HuPpDK6cdHqLRbimSOEqokU4KyVJ6X3zD/9XYNNwp7YiLLHOWMq7l
         2DRLQHBaaXsRxKH1CE3tOm0HXRpjALtHpU279MBJRdJi0uLP3oCv0wcIg3X2MVmAOUiv
         ULfPo8sEOl+CqwQkJ9Js7a8ixloxaR8jjHrVxJd7eA+RuZVcwAvHiQR4Pcq9gsZvWUG2
         iDxo/QY+ovTtcKrbVv4rDZrgwrCPQbcOxf5GQNCS0SDz1dshEz+Kvxdqsvb7kpyD5QiM
         NmXROIU2UMDIUGYFKVtUXD9MyYvWkpDW0VvkG5e6JktsXcaK8dpSuTV9avdxt2mraW97
         wgmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QDRXGMLivFOcZ79NQl3aMUkhwQ0hIeAn1Ufeiz9Vo2Y=;
        b=w04t8bB7xZnib8j8eoPX7b/EkRZGnwaQesKzIQHjikK1udFjZdPuaJYQwAPs45PqEj
         xaXlL2lEFG9y6PlJ57jBRlsYcYOSuOZ+Wx9KPdzgEPH8VlDCy+f1e7rkGlqfN6s/+XZI
         F8snmfzCZaIO6W51lSiad77FkgOVUQPgmhx/XiiYDCuGyOqaMYeL24owUossRRQvt7us
         ez0MuMo2U7vtccq+NxRfUkCsAte36y/XfLwq9y5PfqlpFdXysUxmRbrSvGQ6DZsg75nI
         OVf+ezyvvScGSqkYzdV2VYySMzZqDSP90slsuMvvs3BlNbGGzcSbTVMIGf10X1a2EHpW
         9hvA==
X-Gm-Message-State: AFqh2kr4y5zNbZNHRbBayDWgmI35J5Oi9yAlRh6uNRKuqGt604fUy8r4
        dxxFzf5duLR4vDE+AqFbcqwZgA==
X-Google-Smtp-Source: AMrXdXvxxcmeGtlioatlJ2BEj26cKVQDb3mhBz/+8zADp/Rkia6XVRhOQ4/fKNi90ZleYySqOW4uGA==
X-Received: by 2002:a05:600c:3583:b0:3d2:2d2a:d581 with SMTP id p3-20020a05600c358300b003d22d2ad581mr23431609wmq.30.1674468109516;
        Mon, 23 Jan 2023 02:01:49 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id m2-20020a05600c4f4200b003db0ad636d1sm11050831wmq.28.2023.01.23.02.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 02:01:49 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH] ARM: dts: exynos: align OPP table names with DT schema
Date:   Mon, 23 Jan 2023 11:01:40 +0100
Message-Id: <167446806831.57213.14407925625428994492.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230120064724.40621-1-krzysztof.kozlowski@linaro.org>
References: <20230120064724.40621-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, 20 Jan 2023 07:47:24 +0100, Krzysztof Kozlowski wrote:
> DT schema expects names of operating points tables to match certain
> pattern:
> 
>   exynos5422-odroidxu3-lite.dtb: opp-table0: $nodename:0: 'opp-table0' does not match '^opp-table(-[a-z0-9]+)?$'
> 
> 

Applied, thanks!

[1/1] ARM: dts: exynos: align OPP table names with DT schema
      https://git.kernel.org/krzk/linux/c/e1c7def07c5c1d1cd6d28aefa8f11e31032c90fe

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
