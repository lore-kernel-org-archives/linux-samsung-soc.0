Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E27CC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 18 Feb 2022 13:18:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235742AbiBRNS2 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 18 Feb 2022 08:18:28 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:42798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235734AbiBRNSZ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 18 Feb 2022 08:18:25 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2F4D4C7AE
        for <linux-samsung-soc@vger.kernel.org>; Fri, 18 Feb 2022 05:18:08 -0800 (PST)
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 4279D3F1C8
        for <linux-samsung-soc@vger.kernel.org>; Fri, 18 Feb 2022 13:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1645190287;
        bh=BpW5fQh3uUN/Pfl9NCOaES86qNesPQDykTGq/4H1dKc=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=FUwtRl33/B7hD6TEdCZly7bvg+EfubdbrGpZgd+JROVD9ClNjOQCA6OL/JYSDY11X
         edlm6A3HT1NMJuhjUIDxUMaLFrYfyxjk8pB6IoXWwmX68Qef/+U6O01Vx5N1P5JMun
         58noQTYu1+CA7RnYl7QVspGugPDZ2H8ACaft497ZTBnjfTXwL6zJ4y0eVlNwrRmAls
         mAR3zD3llgJBtCiozcH82N46qovFbYQ0I7GkWqXYRw1T8jXsgU/6dj8D6s3Zf5l1d4
         BqKTggyh731a1AdytY50R/P51IPPEmJiAFTlmMlu2FGSV1Kt3/gixCbdoA/bRO3MB0
         BvfakG+F6bcLg==
Received: by mail-ej1-f72.google.com with SMTP id mp5-20020a1709071b0500b0069f2ba47b20so3000340ejc.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 18 Feb 2022 05:18:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BpW5fQh3uUN/Pfl9NCOaES86qNesPQDykTGq/4H1dKc=;
        b=mXTWJDHNhDdUJ663PhirneQvhOZNoma5i3dr9FjI71hHaeSao/sAjacUIPoe3LjB9E
         You6EnNJWbSyXEftK38w8boSEcc8PNUpjjndv2pTvlKV4n3/2zR/tawMqD1Pmun2B/s3
         +as533zWlVIVDpG1oIjKNw/A2fkv889LCggi7+r9lGnsstxSTDLpw2O69vIj1Wk+w/RF
         vzecU+1YAs/8ZsGpaGXftPry6F47srKAr+kAVTnhojddw7c0Knd7iTcIM2P3AQ23GFJd
         rtebhTxDvxjKP1TKLtZD+J/RY85D/iBGK2yc4qmMlKeyxZKo9s1nxLIJRRm0WdzMZbnD
         OV6A==
X-Gm-Message-State: AOAM533OqtX2Hobm4zQKoacYxSRymxbIQo3z6b04ovPQSsPT0eoQYrXr
        mYYmT2DqA/pMViABbW24r5UKI607BDWxCpkhWNBmiwsmDv0L+opaoOxLNAAFA4ddRL6wACHOLCs
        ln7XbGw+BGBQiUtdh6LkMWk/gDiYZR02cV2EUt5X7JrV8oXGu
X-Received: by 2002:a05:6402:4305:b0:410:d56e:efe3 with SMTP id m5-20020a056402430500b00410d56eefe3mr8202062edc.440.1645190286900;
        Fri, 18 Feb 2022 05:18:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz8g7ylX5DfI5GDGYJJcRfIXiBC/rxttQWz/VkkQYf0o469gjXG/o2FNvU6gl8bykHatt6NgA==
X-Received: by 2002:a05:6402:4305:b0:410:d56e:efe3 with SMTP id m5-20020a056402430500b00410d56eefe3mr8202031edc.440.1645190286702;
        Fri, 18 Feb 2022 05:18:06 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id 12sm2281255ejh.30.2022.02.18.05.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Feb 2022 05:18:06 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     devicetree@vger.kernel.org,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        linux-pm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>
Subject: Re: (subset) [PATCH v2 3/3] ARM: dts: exynos: align PPMU event node names with dtschema
Date:   Fri, 18 Feb 2022 14:18:04 +0100
Message-Id: <164519028097.19535.13626825371267810296.b4-ty@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210920071753.38560-3-krzysztof.kozlowski@canonical.com>
References: <20210920071540.38337-1-krzysztof.kozlowski@canonical.com> <20210920071753.38560-3-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, 20 Sep 2021 09:17:53 +0200, Krzysztof Kozlowski wrote:
> Use hyphen instead of underscore and align the PPMU event node name with
> dtschema.  The event-name property must match the node name, by the
> design of devfreq events and PPMU driver.
> 
> 

Applied, thanks!

[3/3] ARM: dts: exynos: align PPMU event node names with dtschema
      commit: 7cdfe3b3b60c89f0e12e8ee194a7cfbfd46515dd

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
