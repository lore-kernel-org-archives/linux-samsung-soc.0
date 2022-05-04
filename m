Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B845C4332F
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  4 May 2022 08:30:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238905AbiEDIe1 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 4 May 2022 04:34:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346289AbiEDIeZ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 4 May 2022 04:34:25 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C0E116581
        for <linux-samsung-soc@vger.kernel.org>; Wed,  4 May 2022 01:30:49 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id z19so861567edx.9
        for <linux-samsung-soc@vger.kernel.org>; Wed, 04 May 2022 01:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iPeEXxPsMmuH5BIM8Ykp+funBDB9Ycw+ShEzOqZphrU=;
        b=GnrAw0TEvU0tpzme8enuhMy/H48HgVsDSO3weltpBzYcN2vuQ+z/t79AD6MRpUcxHJ
         /kSyvDrigLLu1l53uJfpmPteIH6WmgH92MCi+e0juocIVynJ62byDUdPcokBwJ9HKr5O
         2ZXKc6blHClUuu7s4vZn1Q3Hvga6xRjkGX2xtgNYnbwg39n/qI87nMjV4XArJI5bx68L
         c4s+y5+jiltmAxZ7hCN+IRmxLl8VS1ILgnQhykPDGHIJMSWh83QbEk3AT5Y7IpgQKRiI
         GXtmBG2XZ1X3vIpwKDEZKtcNVHq+6LwlDcJXTnhzeKzf5frTRvJ/niFTLy+w50LU0zBi
         hmwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iPeEXxPsMmuH5BIM8Ykp+funBDB9Ycw+ShEzOqZphrU=;
        b=a1ba7o4kWXU+EuKM44K0K8YgjkUqlAuZMvw4h3GiHRq7l8vS2znMg3NwhppcXm+TBL
         EXUbT6LmAFUp/imzxVQYh+D7HwYb3VFYhGKX9RasvLlkWulH+Yl+30uPDeuHzdU8MsUf
         4LSYYhFHfD1jS/vwFTBJDgruPg0jkae2sSMYX7Gme3sqc9Mf9ukKvkA/0yajIsxl22yG
         ylHc+sFMB8AtlQ8rwBu7AU/U3Qz1DXpMdbq6CDLpEPIc81r8kOBIdLloscjedBIqmq22
         aDzGQPO2ZGuJYhYz9GVUeOGdgTDZxsQc05gpuSWTkL/F32rQKJr3w7GaWL0QTwzODTuF
         tWGQ==
X-Gm-Message-State: AOAM531zQ/ABqwTdu437dFso7N92XQBl/cZKnyA/WN4kGWwc70YYiWAY
        KJ06r0RgP50iO45PCqz5vIx2oOzlkLw3Tw==
X-Google-Smtp-Source: ABdhPJzqm9x0tWUR2vRNRUG1rY0KzrTBJ6zQ4/f3y7Am51Ahlk1ANzfaBKjPOXcoGTgow0R7pSbzZg==
X-Received: by 2002:a05:6402:4256:b0:428:39:c6c7 with SMTP id g22-20020a056402425600b004280039c6c7mr3530396edb.374.1651653047513;
        Wed, 04 May 2022 01:30:47 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id jz15-20020a17090775ef00b006f3ef214e4fsm5377029ejc.181.2022.05.04.01.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 01:30:47 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Liviu Dudau <liviu.dudau@arm.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Broadcom Kernel Team <bcm-kernel-feedback-list@broadcom.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc:     Rob Herring <robh@kernel.org>
Subject: Re: (subset) [PATCH v2 6/9] ARM: dts: s5pv210: drop useless 'dma-channels/requests' properties
Date:   Wed,  4 May 2022 10:30:34 +0200
Message-Id: <165165303187.30033.9122414202499504250.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220430121902.59895-7-krzysztof.kozlowski@linaro.org>
References: <20220430121902.59895-1-krzysztof.kozlowski@linaro.org> <20220430121902.59895-7-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sat, 30 Apr 2022 14:18:59 +0200, Krzysztof Kozlowski wrote:
> The pl330 DMA controller provides number of DMA channels and requests
> through its registers, so duplicating this information (with a chance of
> mistakes) in DTS is pointless.  Additionally the DTS used always wrong
> property names which causes DT schema check failures - the bindings
> documented 'dma-channels' and 'dma-requests' properties without leading
> hash sign.
> 
> [...]

Applied, thanks!

[6/9] ARM: dts: s5pv210: drop useless 'dma-channels/requests' properties
      commit: d0b05d3820fa1b688b192699017f95f8a565523b

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
