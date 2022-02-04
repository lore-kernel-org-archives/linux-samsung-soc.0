Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1F84C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  4 Feb 2022 15:12:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359597AbiBDPMR (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 4 Feb 2022 10:12:17 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:52384
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1359591AbiBDPMQ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 4 Feb 2022 10:12:16 -0500
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id C4B5A3F320
        for <linux-samsung-soc@vger.kernel.org>; Fri,  4 Feb 2022 15:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1643987535;
        bh=yOhvfL3K9EM3pgKXGgKC0dd7a7sZ03wRgeDWP6xNUxE=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=m6VMO4T79C2PdfyqlWupjP1r4ruci3KzBVouAyWV9zSDfyEzjYfHhZ4eo/Isb3em2
         SZPARO5IJwTy/W52Wqm8+U9IPhoUfJGgmbCbr1Jclcs08OLaB8cNxksQX0QkoRUhGL
         BtVFOU/916kSUr/rPUilbfA0FwuCude/rx+uOv62iBshr8BDnnNG2GuFdQDgd4Jhmu
         /9wYSjhDecrG9dUOhlW/eYnGHwgNCTaJdueYSlXLryW439aViMrtp+EcAoauPyb6AS
         cgWju+3bnKbM9eozMX7HN5s1Tk8MIM9ng0jj1yJE9ZyaaygM/1GVNwQzlF6XhoQomW
         z61cOVppggmsw==
Received: by mail-ed1-f71.google.com with SMTP id ed6-20020a056402294600b004090fd8a936so3396557edb.23
        for <linux-samsung-soc@vger.kernel.org>; Fri, 04 Feb 2022 07:12:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yOhvfL3K9EM3pgKXGgKC0dd7a7sZ03wRgeDWP6xNUxE=;
        b=L3aaYd4DszBVCQ+CRR4bmUTcXFQ9BCRE/bpfokvDAwQQeASimX15jaOyhjoADM4dcY
         svR2LSskDayK9Yp50ks3Wr/E02/EHaefdwx77MgklM1/iM+rJ6YE/jWgD7HnCtwMLSPp
         yownnRjuq9UrmBcE87pOd7K7DRNh4B91lpkffOyflGfrESOntNTazzQdsYDpKZo3CUEz
         +pfZRkMaXhHGzLs08TwnRaxwyjuzjEtQmYfaZ++qiWlMqEsqzfy+0JQZrjMN0oybsobJ
         HDdBeKtNPvLzmzN0Kg0uVMCJOmzj5u6NYmSXigWL+NIbxK/zVRLfNgyG22iQHD0YdOxO
         +feg==
X-Gm-Message-State: AOAM531xPGlMOHCR+tHX0G+LRJm/srrSCQ7Ddy0IKSrQWm2bMQ9bQLDy
        vsl5vbiikMXS3tNt+dePVxn2OlaVUcEW/VNWdDEqorAeC3dk+P0jdQlxCCYF2L8dyQDPQ7mvwLf
        2caE6h3uQpsW2hsSvY+QQcmii4qnSUH0hKYOGGAoHanmwaDcl
X-Received: by 2002:a17:906:489b:: with SMTP id v27mr2827683ejq.120.1643987535441;
        Fri, 04 Feb 2022 07:12:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxLnKNw6+erLDFjnoNMlzBft5DfbylVfdBVAIS76vuUg0w0Q2ojfZrmcPS1dn44UaNJfnuToQ==
X-Received: by 2002:a17:906:489b:: with SMTP id v27mr2827667ejq.120.1643987535276;
        Fri, 04 Feb 2022 07:12:15 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id h15sm757748ejg.144.2022.02.04.07.12.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Feb 2022 07:12:14 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org,
        Dmitry Osipenko <digetx@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: (subset) [PATCH 1/6] arm64: dts: exynos: use generic node name for LPDDR3 timings
Date:   Fri,  4 Feb 2022 16:12:11 +0100
Message-Id: <164398752918.81715.4393441551336202631.b4-ty@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220201114749.88500-1-krzysztof.kozlowski@canonical.com>
References: <20220201114749.88500-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, 1 Feb 2022 12:47:44 +0100, Krzysztof Kozlowski wrote:
> The node names should have generic name, so use "timings" for LPDDR3
> timings.  This will also be required by dtschema.
> 
> 

Applied, thanks!

[1/6] arm64: dts: exynos: use generic node name for LPDDR3 timings
      commit: 931dac3d3442bb1ea01be9cbdc53310272b68f77

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
