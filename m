Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B8FEC49EA5
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  4 Apr 2022 21:25:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379136AbiDDV1Y (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 4 Apr 2022 17:27:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379366AbiDDRDv (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 4 Apr 2022 13:03:51 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF22340A23
        for <linux-samsung-soc@vger.kernel.org>; Mon,  4 Apr 2022 10:01:54 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id b24so11852917edu.10
        for <linux-samsung-soc@vger.kernel.org>; Mon, 04 Apr 2022 10:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RGptGrNZelR9JKVq1BWhBKbQVjZd3/xj3o182YDaEYw=;
        b=wN0B3I2YMUijNaCS0FdGQMC+UAGANBqZaFbHGHxTQaPGpkyRHmL3zhQYem4MOz0rFv
         ufE7ADvxR67DZR2Kzcd+QT1fghipuHYwzts0PSbyQRrJ9SZdTDca6c12zhPhVe7X7CW4
         6zVCL7YnMdprtCIV6y01V0x+DVDFyERgRbTnBMqnnIdBd1sJE/xMvRX+vtkKu8pqZOKt
         r9tmsLb+opNydRn3mR/AfZlEipGmw1jew7HVS6Q0Q3vC4ZVELgQm3C2qrETBWVd0WUSS
         KiFJSY3g1viYg46qfo85XSEIppSh+7RjK8qxYIMelmBjKW4vwClQYT1BZcjNmwh8L3AS
         4yOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RGptGrNZelR9JKVq1BWhBKbQVjZd3/xj3o182YDaEYw=;
        b=UeM6HsYpHiSXdNyBifbb8Kwi/es9AKUaNmnpLeiody1Zs2wBrxZWPRGQkPDUkBfuMt
         Tnlpv8TRC4CsXtVEwosJj0784cMHwV785OJnbjY/XMlIUBsyEMgTt3V43CGtVuUuos+N
         uR4OyncO6p2QvalP4Kq5ZSOaF8R/bKhzERWPEi+XoGEo+HHU7YDcLM3KkP7+R6tmE/kS
         LHlfEOHYVG31QezYfK2FMCswc5HubHmJomDzahsGZpiLTxq3cluXYRrYzkS1SdXpayIJ
         K7Kc6JEhGJkGsEf5FhcuGhnQL+xaP0smVWkoyR9F714ob3wCkmsw/Kmdl9YjWoW49WL+
         TEHA==
X-Gm-Message-State: AOAM532cQLej7ZyFmOZzfNM8Qc1y111GRwk+Vj7tka3x1KPlw3MT4N0X
        ywQOqCAeEuVePmHbyuioqt1nwg==
X-Google-Smtp-Source: ABdhPJwVUc2KM4C9VsdYwbL7pQninjHatsNdC1AkoZOIkqVtasAdFBDiVq03mTdn+fuTxNI032mzwQ==
X-Received: by 2002:a05:6402:40ce:b0:41a:6817:5b07 with SMTP id z14-20020a05640240ce00b0041a68175b07mr1159480edb.7.1649091713286;
        Mon, 04 Apr 2022 10:01:53 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id c5-20020a170906d18500b006ce371f09d4sm4557770ejz.57.2022.04.04.10.01.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Apr 2022 10:01:52 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     linux-usb@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-samsung-soc@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH 1/5] ARM: dts: exynos: align EHCI/OHCI nodes with dtschema on Exynos4
Date:   Mon,  4 Apr 2022 19:01:43 +0200
Message-Id: <164909169269.1688455.8158070235970871603.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220314181948.246434-1-krzysztof.kozlowski@canonical.com>
References: <20220314181948.246434-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, 14 Mar 2022 19:19:44 +0100, Krzysztof Kozlowski wrote:
> The node names should be generic and USB DT schema expects "usb" names.
> 
> 

Applied, thanks!

[1/5] ARM: dts: exynos: align EHCI/OHCI nodes with dtschema on Exynos4
      commit: b412be7d3c0a248db0de4b7b53ee6ad44d49c71b

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
