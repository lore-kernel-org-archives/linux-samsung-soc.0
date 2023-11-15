Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3773C072A2
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 15 Nov 2023 21:24:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344731AbjKOVYI (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 15 Nov 2023 16:24:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233593AbjKOVYH (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 15 Nov 2023 16:24:07 -0500
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com [IPv6:2607:f8b0:4864:20::830])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BB6AAB
        for <linux-samsung-soc@vger.kernel.org>; Wed, 15 Nov 2023 13:24:02 -0800 (PST)
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-41cc75c55f0so11408941cf.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 15 Nov 2023 13:24:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700083441; x=1700688241; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nAMTI965yKRymeplVxBCZKMPT9nQRVKnmgoIwdtDSmk=;
        b=Pnqm4iTI087dHfvyTSuWs8z5/n9x+gvxpaj4AjZtUBgNfATO2vSZy8jPo8Ulv77i6v
         YIxq2hNXR9kc0PD4ZVgaN5xWiAhxk4yeHyM2lxe3g1elBja5GQGYxJTVWfxqmgGbrFMs
         UhSMGqlU5vf4gBkmcXRUGUsqFXH0Xsu3chwlKmOrgX+S0z4M0lp5GsfBLLojOD9KaZl6
         a4UD1cq580KrrwRvHhomTxoKtCvcXcsTxrbRn/XjYKleuDRrpVmI92wcOa+jTzuXBkmc
         rFozNY14Nexga8ejorkI3uu8KUmhyJIW8pkKjgI6uZv/nAz1tSHGWs5+J9jPTC97xec9
         9KFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700083441; x=1700688241;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nAMTI965yKRymeplVxBCZKMPT9nQRVKnmgoIwdtDSmk=;
        b=QdiX0CFyknOQ7/qOjOudoiZ3D1w/qh7qA2bKMhIkA3nYmyM/sLjl7fFhVs1vdgXPvu
         Y5sFmTUC/+iaRJMWWry6NWBwEwG6Yu/kRsMVPHyXmZoeJ7/Qlub5asM2lHvPCNVSqnpy
         gsePJURr0nX8uVDsFFjNTEsGs/aI/vW0t2JfDbHvSTxFZdBJqpp0X6OVjhjZWDhHUwNv
         Su814U0BhSqdSmZMJ64GYEjB47k59oWmOPEbeG6otTCFN9khf87nKDPQ0TD3fJmh043Z
         ttNip336BmyrhOiem8MO0mmd2GXacZ3IdeVMwQjdv6m3MroresYoPERSbr2Zs/3PgFUR
         yOLQ==
X-Gm-Message-State: AOJu0YzpAihR7wANdlcAoFeQKyOKu+qij86pqSL1ZFkA/+7E7vSInepH
        qoemeE8/X8x45g4MF3TepyxC4w==
X-Google-Smtp-Source: AGHT+IGzygePpmpcWGYG8kJpIBOhG7+gdAgRPvmdp1e3CnzqNyv/Q4OjXwT9P+NL+dlHZ7YhuIa7eA==
X-Received: by 2002:a05:6214:1706:b0:66d:6a92:16c2 with SMTP id db6-20020a056214170600b0066d6a9216c2mr11586371qvb.8.1700083441639;
        Wed, 15 Nov 2023 13:24:01 -0800 (PST)
Received: from [127.0.1.1] ([12.186.190.1])
        by smtp.gmail.com with ESMTPSA id t18-20020a056214119200b00670e0f71ff7sm843262qvv.90.2023.11.15.13.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 13:24:01 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230722121719.150094-1-krzysztof.kozlowski@linaro.org>
References: <20230722121719.150094-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 1/3] ARM: dts: samsung: exynos4x12: replace
 duplicate pmu node with phandle
Message-Id: <170008344099.8771.17170805240532407985.b4-ty@linaro.org>
Date:   Wed, 15 Nov 2023 22:24:00 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


On Sat, 22 Jul 2023 14:17:17 +0200, Krzysztof Kozlowski wrote:
> Devicetree for the FIMC IS camera included duplicated PMU node as its
> child.  This is not a correct representation of the hardware.  Mapping
> the PMU (Power Management Unit) IO memory should be via syscon-like
> phandle (samsung,pmu-syscon, already used for other drivers), not by
> duplicating "pmu" Devicetree node inside the FIMC IS.
> 
> The change is not compatible with older Linux kernel, which does not
> parse samsung,pmu-syscon property.
> 
> [...]

Applied, thanks!

[1/3] ARM: dts: samsung: exynos4x12: replace duplicate pmu node with phandle
      https://git.kernel.org/krzk/linux/c/797bf47d8a42792762cfc74dc84109d6d893ddf2
[2/3] ARM: dts: samsung: exynos4: fix camera unit addresses/ranges
      https://git.kernel.org/krzk/linux/c/ba2a45a48503665f7e8eeec51f8b40456566b0cd
[3/3] ARM: dts: samsung: s5pv210: fix camera unit addresses/ranges
      https://git.kernel.org/krzk/linux/c/07e6a553c2f1d385edfc9185081dee442a9dd38d

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

