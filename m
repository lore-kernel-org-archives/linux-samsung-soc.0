Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF838E81DE8
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  6 Oct 2023 11:57:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232110AbjJFL5B (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 6 Oct 2023 07:57:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232062AbjJFL5A (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 6 Oct 2023 07:57:00 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22BE0CA
        for <linux-samsung-soc@vger.kernel.org>; Fri,  6 Oct 2023 04:56:59 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5334d78c5f6so3626679a12.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 Oct 2023 04:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696593417; x=1697198217; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u0Dzxf+Os0AYsxBPD7u9XCaaEw4b9htSY2XbYh3HWpM=;
        b=svLOVXSAAkG6aLfY8byT/t6VxkkSn0PMY0jkVmZtzEWkYOBdkk7JtduuxWa9KhGyiB
         H61QE9mQRjne2AVNqDQZdESYP7A7EjFd1mBJY63EGv3PQax0qYh+txCamyUxw02ARdAF
         UTDyOV9PkwijCAsci8HC+NNxwrZbMPDnnsziujycvKBNbY8JmYpzhNv7RMlW4UkdOQ2F
         iBRRP/mehd8hrDwcG18axz3Vs9B5OyMEMweFfpleV56+7Px435TNcRGL+DKEWJQQBoJB
         1qXxksM0YjUIcLYhDEpHcAwYq3nTxsbpLLFap3GPiTOZVOAFogNYnBKq7LHVep/X7WSB
         q5Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696593417; x=1697198217;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u0Dzxf+Os0AYsxBPD7u9XCaaEw4b9htSY2XbYh3HWpM=;
        b=AChAiWRpX7njJiY7zfS4YqlUk6FqrM0lIfuOPirq8zx3MRtmOT/do8rZ3P5Vu5d2Z2
         7A0iBLcZr3Ew/zb2czLemaDsWb11YLiyyymp+j7l++TkGqp8LcRG5tlQuE5UA3j4u3HK
         W3xPh9gzki/EKbRQAykiDS6/GygbSHHsw1HcHdHLLlCOO+4laXC+jA5h8hUBESXFlO9t
         2/BuMTg799eA8hs7LHaRhZBZGWn1Su2jxTajZC62hEGOftFUR2GCGi3MMnLoX/HEpzw3
         Dy48n3BvyB4Vbuih2eANKLczDxJuNAICVO2gsoQliXphdDk4Nv6f2SwgR5S63nU9sK+B
         XWCw==
X-Gm-Message-State: AOJu0YyBfRblxrt5cnZ9l4gFdS8H4I1WhSY3l0i25MtoSm28y+7l9zVe
        KONQZfO/Fe1hpOqThfNT2LmcaZszXz/5CkwA9nD7kQ==
X-Google-Smtp-Source: AGHT+IH3IBNs7pFdWXusUzl2thqz+uMbwcWUaIH92Unq1fmMKdLYyiX+YIptuuDRNKULiA3C0X39dA==
X-Received: by 2002:aa7:df86:0:b0:52a:1d9c:83ff with SMTP id b6-20020aa7df86000000b0052a1d9c83ffmr7579896edy.1.1696593417628;
        Fri, 06 Oct 2023 04:56:57 -0700 (PDT)
Received: from krzk-bin.. (5-157-101-10.dyn.eolo.it. [5.157.101.10])
        by smtp.gmail.com with ESMTPSA id c11-20020aa7c98b000000b00536ad96f867sm2450453edt.11.2023.10.06.04.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 04:56:57 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] ARM: multi_v7_defconfig: add drivers for S5C73M3 & S5K6A3 camera sensors
Date:   Fri,  6 Oct 2023 13:56:54 +0200
Message-Id: <169659341099.111335.14112470385814291229.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231006112106.3205618-1-m.szyprowski@samsung.com>
References: <CGME20231006112123eucas1p18923904c9290ace8fe5240bd76867429@eucas1p1.samsung.com> <20231006112106.3205618-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


On Fri, 06 Oct 2023 13:21:06 +0200, Marek Szyprowski wrote:
> Samsung S5C73M3 8Mp camera ISP and S5K6A3 RAW sensors are available on
> Exynos4412-based Midas family boards, so enable the driver for them to
> increase testing coverage.
> 
> 

Applied, thanks!

[1/1] ARM: multi_v7_defconfig: add drivers for S5C73M3 & S5K6A3 camera sensors
      https://git.kernel.org/krzk/linux/c/669216528852c99d32be9e894120d25b48b71a52

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
