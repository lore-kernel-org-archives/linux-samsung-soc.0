Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 437A3C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 31 Jan 2022 09:02:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233694AbiAaJC5 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 31 Jan 2022 04:02:57 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:38532
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231173AbiAaJC5 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 31 Jan 2022 04:02:57 -0500
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 9496C3F1C6
        for <linux-samsung-soc@vger.kernel.org>; Mon, 31 Jan 2022 09:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1643619776;
        bh=VPxWUBO6RdX14HL+ygIvVwiE8ezYmob4dZE1Vs6HWz8=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=URCuYMpETv41RsKCe6JElvsYu2Xa8FwWLPJvJToP7hkADoEHdbfNeYOTjDRChx3rd
         SFdoYd8s+y4H+oC1TCCFzGnOFhmdnjqHLQl3b3t1yNJseYDORYHBnYuH7x+crFtaJg
         vx0/5Wn6tCcNfaf55sHFbO6U9HXAlkVYRDJo7dCquwTra6c+TVASTgbrfzz1Ufrm9o
         VgNWnAF98M1SkV0Whxrz4WMB1Mpp6//IY4B6vAWpIcBG9BpscgqkTiYP97ywayRfmG
         cjjatuVXoV5+97J2F/ICoVUnK3f1KvV3t1YHxyNNE00YHCBi1MaTYJIGNgQym/NyeE
         BRmLxnnuwzu8w==
Received: by mail-wm1-f71.google.com with SMTP id v185-20020a1cacc2000000b0034906580813so10064195wme.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 31 Jan 2022 01:02:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VPxWUBO6RdX14HL+ygIvVwiE8ezYmob4dZE1Vs6HWz8=;
        b=yULi+3mnujkU3p/XuRCsnr8MmCnuJEeqcp7YwrsS1FmnbnnFwioPRUIeRRaal4/S8C
         N0I7b6UzxcZ+lfaOX1omqtP2GaOm1r6K7E5YkWxBPArmotff6/W3WEujjASx2JjkfItX
         xSdoGX0WUi0jSb1OIMFHd/VbPQ0P+KdR+2OGu9W3b7/ZdFe7rbLGWkBmwfWj59pgi0oc
         fQ8UqX4opc+kPW2LxaB9oxPr0h7amBrPhQF2J6/z8UyctZhCUG0ggn5FE21Wj5crv4d+
         UAEs0z0bawyIYiSfuSglo3SNiIN0VPKQaSiEsraS3fFQSDUtGuJW4w0Fp0LKYi2yehZn
         B6Xg==
X-Gm-Message-State: AOAM533QEC0LwsU+vxg30YEkg3hHjGaknsQTn8UQstHOJPfvvyM8vdFD
        RogqFOb66WJ6wZQqZpJ2tiHotE4n6MJciF4ViRXmH15ioqnln+76/jKnegLV0nrRhcKOEdFBZL7
        BSjF+0Rta7by8o/VZygG46ognCr9utbDz4MErNYeVo5xWdiVr
X-Received: by 2002:adf:f703:: with SMTP id r3mr16858346wrp.354.1643619776406;
        Mon, 31 Jan 2022 01:02:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzBrLJFSY4y+ymZIDvgLm9S/yZmXBOYfaqH+6ywjDWDjBGe7K6nX5M0jnkU0z/nyHAV8DaVrg==
X-Received: by 2002:adf:f703:: with SMTP id r3mr16858318wrp.354.1643619776211;
        Mon, 31 Jan 2022 01:02:56 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id c8sm9219866wmq.34.2022.01.31.01.02.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 01:02:55 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Lee Jones <lee.jones@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        linux-samsung-soc@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-serial@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: (subset) [PATCH 1/5] arm64: dts: exynos: align pl330 node name with dtschema
Date:   Mon, 31 Jan 2022 10:02:53 +0100
Message-Id: <164361966593.14585.5079368192105542217.b4-ty@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220129175332.298666-1-krzysztof.kozlowski@canonical.com>
References: <20220129175332.298666-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sat, 29 Jan 2022 18:53:28 +0100, Krzysztof Kozlowski wrote:
> Fixes dtbs_check warnings like:
> 
>   pdma@15610000: $nodename:0: 'pdma@15610000' does not match '^dma-controller(@.*)?$'
> 
> 

Applied, thanks!

[1/5] arm64: dts: exynos: align pl330 node name with dtschema
      commit: 706d8df83c8ec9cbe948ff8c8bd082b7819f4196

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
