Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBB94C4332F
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  4 May 2022 08:30:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346301AbiEDIeW (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 4 May 2022 04:34:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346289AbiEDIeV (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 4 May 2022 04:34:21 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B226516584
        for <linux-samsung-soc@vger.kernel.org>; Wed,  4 May 2022 01:30:45 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id p4so902272edx.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 04 May 2022 01:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=auEeftEHQSwPy7eGdwn5Xk85e3UKiUyX7y7kZHtUjr4=;
        b=U8CMHSVak2dXCFzpQBP/0JLPfyPcuAvSA1X3iV0lGYBFTVQ2JbCSu8Hza9bogoCYto
         FB2TReYLqd+5eTu+PFejmUoSP9s/UFVCcbk699yjKle8YLdoqk1au/uc4/PJVxoCRdf7
         SGS83eVoOemNcZANTmftiNXuI9EbsPYe54wlLFuTOo9O43cFQ9QQtkvAqtpk+nWtOt+i
         GZtiKs+1CN+Ko1ATfvUUVYUpuimtDt58tANyTNvn7t6haAEGz/sQVDFI5p0vUqqF/C34
         c3UD4SUPJPyr7/xMMuD7s6LJbMTiqaeOl60Z1D+Q2MhczZFmGpRmzuoM2wMS9Mh/gQqW
         2iag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=auEeftEHQSwPy7eGdwn5Xk85e3UKiUyX7y7kZHtUjr4=;
        b=gDaGchjcH74nNPGsj6j0WyfFrsQ1m0CZwM83kAMcQJxtXfHCeaC4zYXdAzhb2VFmSu
         zrHmuAxBY3OfAYnQpLLiMYD8KaW2uqD/YUyHQkiTxjzGH/un61Mp1JbMdngVadf4WxER
         KqVbDqQ4ITFVT/hOei76CPK8bA9ncGeG6ZrVsVwMRXRnFK/VxZuQzCZBzil5xGwJIJBZ
         /e32mRVzhhIRmSo2PKDj3clF0+2wW9fqfxtc9w+39NsFHSqGrN6+R+42syuo4wINSfva
         Jmida908L/YRQ1xXNeAOqegKVWV3J1thCrjITdbSpqzSpgKfyBiPOGrm5kyjCSy4Pytx
         5PPQ==
X-Gm-Message-State: AOAM531PiOSwra/XnbklNsn+yX3kAR+cRPjtdi5xiI7n+RnXQjDrCoKy
        prNPl0/rUXNEdLXSC+jya5KElg==
X-Google-Smtp-Source: ABdhPJzavVgMPFF3LvvI4Kyh2I0OhYvRz1waU3e9UdYcLZPETh2JgD6/fJsBBVhGMhA5RIk7AMgFCw==
X-Received: by 2002:a05:6402:c98:b0:425:d806:7e9d with SMTP id cm24-20020a0564020c9800b00425d8067e9dmr22034519edb.337.1651653043880;
        Wed, 04 May 2022 01:30:43 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id jz15-20020a17090775ef00b006f3ef214e4fsm5377029ejc.181.2022.05.04.01.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 01:30:43 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Scott Branden <sbranden@broadcom.com>, Ray Jui <rjui@broadcom.com>,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Liviu Dudau <liviu.dudau@arm.com>,
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
Subject: Re: (subset) [PATCH v2 2/9] ARM: dts: socfpga: drop useless 'dma-channels/requests' properties
Date:   Wed,  4 May 2022 10:30:31 +0200
Message-Id: <165165303187.30033.13385606512590831084.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220430121902.59895-3-krzysztof.kozlowski@linaro.org>
References: <20220430121902.59895-1-krzysztof.kozlowski@linaro.org> <20220430121902.59895-3-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sat, 30 Apr 2022 14:18:55 +0200, Krzysztof Kozlowski wrote:
> The pl330 DMA controller provides number of DMA channels and requests
> through its registers, so duplicating this information (with a chance of
> mistakes) in DTS is pointless.  Additionally the DTS used always wrong
> property names which causes DT schema check failures - the bindings
> documented 'dma-channels' and 'dma-requests' properties without leading
> hash sign.
> 
> [...]

Applied, thanks!

[2/9] ARM: dts: socfpga: drop useless 'dma-channels/requests' properties
      commit: 361736cf495ccc49df5ae66d0f9f10a55976d2da

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
