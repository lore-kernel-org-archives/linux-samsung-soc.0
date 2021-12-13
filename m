Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7F57C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 13 Dec 2021 11:11:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234405AbhLMLL4 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 13 Dec 2021 06:11:56 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:45936
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229836AbhLMLL4 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 13 Dec 2021 06:11:56 -0500
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com [209.85.167.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 1CC6B4005B
        for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Dec 2021 11:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1639393915;
        bh=TWX9z7B2SDW6pKVI7CzKeQKxNaS8eqsqW7IHGzb9lGc=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=hvGsRPHH6yOZKiGMzHS3xbYMRc5kYRHK5/hRcp/3Xwe0cL3McN+40i/wn8/+HxbOE
         CebspWW6O4QGfW1nsPmH6xCeESjiSQ1sccoJzkoI5tC5Acqy9SoPhmPb9P9QmCvkqu
         oBZGLfcVgN4Dc7VNccn8p4EUJvsnO1KxCIstgZz4whKi7TSZgUEg39pzgcZ87izhst
         kg7Fx0+BtdLUqo2L92sLfIB1RzKyny805+FOwMgqdJyoo1SUaEke86O3KpkT+7RNxm
         tFcx0CNy61/ALByRxuzg/0cC2HMuuOq32kVK7GB9OHAZy6sSS3OXioE66pAZeurQMJ
         iM4pCt2bqlaBg==
Received: by mail-lf1-f70.google.com with SMTP id q13-20020a19f20d000000b0041fcb65b6c7so5130486lfh.8
        for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Dec 2021 03:11:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TWX9z7B2SDW6pKVI7CzKeQKxNaS8eqsqW7IHGzb9lGc=;
        b=Verl0C4St1ZPvcia93gt6ukfWOvP5C9h7wDOODNjVjFA+ImBdgp+A2Dme/Vyraj7na
         4cgf7QRWAr3hzMeNDyC2S6gfOr5GszhRJ5jcZ1M5GveblStXEZ6d1Oq7wwzo4EddRSnG
         gnnFZeTB9lI6RXsi0Gu/eiXCyUhQ/I0b6tpkUDZ+jDEISxmKb+kyWLaRXqFIvRzyOEvr
         IOXsAzsdPBNEcTsoDW77MlIjyNZV2xZ4fwb7kCo1mqTSerQLfInCDp/K5rz/dRvqkCuS
         1s5co2fqi8ZYNIYT+iLvPI1nMVpyl3h9hKghdp2mK05ITDokgLbSGbJujzUpfzHHSX5x
         s69Q==
X-Gm-Message-State: AOAM530SmXg4uOSUDj2AufqiKOpd9AOj4o6GzYxi6pWDg6TYCz7WIJ6v
        HNjpmvE/aiIUg/0HG/jeyPJajq9KYr5NlzAWXq7ySQHSrM1KIWDwDOx06Vh8rzK2wsjrjAFG4aY
        XwCgnJdLKhMgSqsUVuPiB2uaXuLkcCnsVKrixq+Lf3AbNbCwL
X-Received: by 2002:a05:6512:1324:: with SMTP id x36mr28203962lfu.495.1639393912436;
        Mon, 13 Dec 2021 03:11:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwWh2zPqaJCAX9RF6Y9SF7zloH0bH/lomW9IUo3wlZ0O8nMKVcivVd3yVJlmERwPsJCKZYgAQ==
X-Received: by 2002:a05:6512:1324:: with SMTP id x36mr28203947lfu.495.1639393912237;
        Mon, 13 Dec 2021 03:11:52 -0800 (PST)
Received: from krzk-bin.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id q19sm1381070lfa.266.2021.12.13.03.11.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 03:11:51 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Chanho Park <chanho61.park@samsung.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-samsung-soc@vger.kernel.org,
        Sam Protsenko <semen.protsenko@linaro.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: exynosautov9: convert serial_0 for USI
Date:   Mon, 13 Dec 2021 12:11:47 +0100
Message-Id: <163939390678.7492.11668777657755718143.b4-ty@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211208091853.8557-1-chanho61.park@samsung.com>
References: <CGME20211208092527epcas2p28f6688d5a2742c03cf474d8b2fa773cd@epcas2p2.samsung.com> <20211208091853.8557-1-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, 8 Dec 2021 18:18:53 +0900, Chanho Park wrote:
> According to USI v2 driver change[1], serial_0 node should be converted to
> use the USI node hierarchy. syscon_peric0 will be used as a syscon node
> to control the USI00_USI_SW_CONF register.
> This also changes the serial node name from uart@ to serial@.
> 
> [1]: https://lore.kernel.org/linux-samsung-soc/20211204195757.8600-2-semen.protsenko@linaro.org/
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: exynosautov9: convert serial_0 for USI
      commit: 7836149e155bd3c554571f135619f95932c841fc

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
