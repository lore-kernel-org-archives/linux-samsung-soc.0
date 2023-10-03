Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F9E9E7542C
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  3 Oct 2023 06:26:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230127AbjJCG0M (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 3 Oct 2023 02:26:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229547AbjJCG0L (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 3 Oct 2023 02:26:11 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C648CE
        for <linux-samsung-soc@vger.kernel.org>; Mon,  2 Oct 2023 23:26:05 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-9ad810be221so88151166b.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 02 Oct 2023 23:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696314364; x=1696919164; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PpEwkCw5GnWeIajtcnKE26FVy0W9ijUsXwT0C9dhf/Q=;
        b=JLwioHnOHBe8DaG4nl1z42GWp6JAvL7f99nSkU6OW4ov5KUjQxxRVaMOFvMtajmxK1
         TWtpsQJThCZLzzYGMwkWFhd/Iovbr7DUBXtWCTuvxkCkKE3En/iWEuwTPCBJnvRO9JH0
         19alaLWTjlKDiJNP7LjPRQ7AA9rAC1wtf4JuaNefg2v/miHBwD4eq68y0uUK6C0WkWlU
         y9LHnUl2HK6Kdjn+ZabiAV4iI4oFB9KtKn2FA8aMysewsc6wcKyCQySQIEzNRV2odXgA
         1W4neCbg2GylqgDmVJ2cKDr8Xe0P8IZmnp4U7FzsOR7Rfbu+L1Rite9fyPDFP0UY2m5s
         Xmiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696314364; x=1696919164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PpEwkCw5GnWeIajtcnKE26FVy0W9ijUsXwT0C9dhf/Q=;
        b=cocFIg3f93Z7Jl27vpBPVX3BLyQxStMfg2sh4VM+4cI7C7tjLrbY/cGepxX4HmBZHy
         Qin2/lXxJR3V9T3MCTkD2ZN+35XPfdAXh0u8+ZvkwFeEDHCOVKU0MDH98jiWGaEuNjE8
         jVtqSCdmJ54XEyEg8trUCNAwQgKvudw2QrNr23DzDY2/TCDsRgxW6z9tA8+A2WhINLEy
         fN4aA/qgXVUXZFJ8j0TFkr6BE6pkb0SIvJyCG95aFhgpN8c6A+fg6uoQzG/EZMDiKoIW
         Juk27TR7SzYE4/+zflU2uuRerH3i/FmQix6uKAvdhe+PkmI8GZ+CURt85EEPKArT0/+j
         9VvA==
X-Gm-Message-State: AOJu0YwPd+IEJzWlxtuDpuT+eEzVxUUxsEkL7vYBJop2ZYgikFDQbq/3
        oQcXMeLnh2mT9cXKBlSyV4uCCA==
X-Google-Smtp-Source: AGHT+IErAzIDRQU6+AMoAoRc4mCT35WMprnfrGiXAkO9KI1yfHllcIRvQS7niFnruw1Wa16MEeymjg==
X-Received: by 2002:a17:906:518d:b0:9a5:a44a:86f3 with SMTP id y13-20020a170906518d00b009a5a44a86f3mr10749411ejk.25.1696314364011;
        Mon, 02 Oct 2023 23:26:04 -0700 (PDT)
Received: from krzk-bin.. (5-157-101-10.dyn.eolo.it. [5.157.101.10])
        by smtp.gmail.com with ESMTPSA id fy17-20020a170906b7d100b009adca8ada31sm487583ejb.12.2023.10.02.23.26.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 23:26:03 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] ARM: multi_v7_defconfig: add AHCI_DWC driver
Date:   Tue,  3 Oct 2023 08:25:59 +0200
Message-Id: <169631435596.9647.2846474395495695081.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230928202736.340435-1-m.szyprowski@samsung.com>
References: <CGME20230928202741eucas1p1b39edbdd390e2b1aaaeea5f8e364d58e@eucas1p1.samsung.com> <20230928202736.340435-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


On Thu, 28 Sep 2023 22:27:36 +0200, Marek Szyprowski wrote:
> Commit 33629d35090f ("ata: ahci: Add DWC AHCI SATA controller support")
> moved support for "snps,dwc-ahci" compatible (present in exynos5250.dtsi)
> to separate DWC AHCI driver, so enable this driver in multi_v7_defconfig.
> 
> 

Applied, thanks!

[1/1] ARM: multi_v7_defconfig: add AHCI_DWC driver
      https://git.kernel.org/krzk/linux/c/de1f6a85398e6bff2e6dfa326531daf6358b64dc

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
