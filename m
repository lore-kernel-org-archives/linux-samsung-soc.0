Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88E24C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  4 Apr 2022 21:27:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242271AbiDDV2A (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 4 Apr 2022 17:28:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379386AbiDDRD7 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 4 Apr 2022 13:03:59 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C00540A23
        for <linux-samsung-soc@vger.kernel.org>; Mon,  4 Apr 2022 10:02:03 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id r13so21299247ejd.5
        for <linux-samsung-soc@vger.kernel.org>; Mon, 04 Apr 2022 10:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fTtmY+6kEY48dXDt92pAxKFA5nufZVaGUszJn2KSj7Q=;
        b=UoomhqtwgUrejeY/SCN+1Dep4CWzZhUfhrmtVDDBEt4UhRyFQ3a9DQY0HZGJxfZ8h3
         1eiFIoyW3Ezepg4hYMtIES9QgFXXqVeuQJjAHGIRNr2GE9htsMnv4tRL1bBQnpRbwMHL
         GJGHJrvuDF0Pfymdr8RHYq4aIdeZWIcVtJkjNpBBa3P2oZhKtbHX01oKUUDk2wwxWaNy
         OypSqHrPAo9MHrKZa8GKblq5dRgkRTocm2oA7GEr1/nwzT4Voo5ugca4Rgn0w+xvHDFD
         apQvJb8YLhrDxvABOX6lb+F3IA6zeuwokQsrXGQwaw7IuXoCzSXeqCSMyJmGV5h7uMDk
         HiIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fTtmY+6kEY48dXDt92pAxKFA5nufZVaGUszJn2KSj7Q=;
        b=xdXlFuxFy1Ts1iHQxUToiCSCdgY094tRLSxw7ahXhAyUuDdUmsbAjEGK6ReSTdqV8D
         EI9hAvA0FC91Ic27iXycsSc0Z+5gKDRV9mH7jrIpSvVtxQ3p8QSXpX2j5VYykfZCvuay
         DBFe57DBC5K3NUhZiPZHpLKHZZZrM85W0dR86sgqeY2xIxLDIekQOF41pcuFjWTySv4a
         RA05u5S8GUcGSeJ+QVn7YHZeu4kXyOZ8HVRuCukUdxP382gQ9BWh5f7LzUEemlGdTbE/
         Bxqv64IQa4ndzlieFd95AZ72CL0tRybBbxltexAxCBvzADC0BFLm2OdIRuNxn3CY7eCs
         4yjg==
X-Gm-Message-State: AOAM5302m4KosfgQF3OzB7xlaQY+4fqDFjPCSV65kPTBYYScZcGGL7Ru
        awkv4KPdgREZgSyk15+d5F4GFQ==
X-Google-Smtp-Source: ABdhPJzNNWr2tpPZJ5TXhj+1dMy4Ij5a4dyOvyKFovCPsbkyQci20MirVmatIhBwjLaXk1L0KkhiYg==
X-Received: by 2002:a17:907:608f:b0:6e8:395:43fe with SMTP id ht15-20020a170907608f00b006e8039543femr1005391ejc.439.1649091722097;
        Mon, 04 Apr 2022 10:02:02 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id c5-20020a170906d18500b006ce371f09d4sm4557770ejz.57.2022.04.04.10.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Apr 2022 10:02:01 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Thomas Gleixner <tglx@linutronix.de>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH v2 4/4] arm64: dts: tesla: add a specific compatible to MCT on FSD
Date:   Mon,  4 Apr 2022 19:01:49 +0200
Message-Id: <164909169269.1688455.2895247009152071238.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220304122424.307885-5-krzysztof.kozlowski@canonical.com>
References: <20220304122424.307885-1-krzysztof.kozlowski@canonical.com> <20220304122424.307885-5-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, 4 Mar 2022 13:24:24 +0100, Krzysztof Kozlowski wrote:
> One compatible is used for the Multi-Core Timer on Tesla FSD SoC, which
> is correct but not specific enough.  The MCT blocks have different
> number of interrupts, so add a second specific compatible to Tesla FSD.
> 
> 

Applied, thanks!

[4/4] arm64: dts: tesla: add a specific compatible to MCT on FSD
      commit: 22cbcb8f4a17c194d208f686fc3ea37fc860bd71

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
