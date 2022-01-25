Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44801C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 25 Jan 2022 17:26:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237879AbiAYR0H (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 25 Jan 2022 12:26:07 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:55162
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1345730AbiAYRNe (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 25 Jan 2022 12:13:34 -0500
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 7F5723FFE9
        for <linux-samsung-soc@vger.kernel.org>; Tue, 25 Jan 2022 17:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1643130715;
        bh=Eq37txspH2phodHd9XBEM6IFXJwB351PQd0cul0xPxo=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=i3vxSJLw7gC9U3XSELBEQWNBokeKWgLClftdBRevLz8r0mXgslU+/m+4ExyeG8Rkp
         pgKnika4RuLZbAs6AEallBgaLIJKzkIoS/QrUiSqSrQlrBtQp5FoK/CEnvPUJOPKf7
         oolQCKJjy+WR2KyRR/iPRx6WWy3mm++THMm3xp3da4C+OQ8OBu+PNEAt4uXUlY4deH
         crUCrdC+ZMKMkarR5/3UT7UCAiJz3Q0JMKGWjZbMKFw3EfJj2DmjAvZB26BrNXiqkJ
         Q7aXOJSW0FnRkAsWi8KDuPcm7khm1x1fXBTywti8U60On7cyG2JGrXu2uJhp2wQdXM
         AZoDlniPXkc/g==
Received: by mail-wm1-f69.google.com with SMTP id q71-20020a1ca74a000000b003507f38e330so1373578wme.9
        for <linux-samsung-soc@vger.kernel.org>; Tue, 25 Jan 2022 09:11:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Eq37txspH2phodHd9XBEM6IFXJwB351PQd0cul0xPxo=;
        b=lJSZaCpJ3EOaGGKYQ4QkO0UOcsXrkmKnd1U218y75hkU7Y31r99cDoNc7K+Mmud4of
         aVrrpOYdULlozpqP0SPJsd7dxbL3mlPxeJC9w/uNjHB93IsLtR8ESHv2VyOyOFUavYSU
         UyNHac6gJd/EQkSIFis6jnSR7RRMRc52ZUz11UsjAQCHtNGfJVSLe2f0plamAh/y0nEg
         2Vf8UGyxc/8rdupzvngO9CD6UfKvF4rS0kq8QkqLyCHyGi2breXlfQeLD34YeaW9y3Mp
         zor4P8vfg1zrTjmuibg354SbjKKRsxTfJuEnd+iJcAIEvZ3rk2pFvuahEy9/FkUNlWFj
         UbFQ==
X-Gm-Message-State: AOAM530bfXji7zDRMaLNFNqNbsX7Y1bJGSN11Aj4uecpnlYFqSOKvy8M
        3sHoH2wXg31TjqCTHTDsWogd2WfsVoaQ5WKGzTU+AHJOYYgsD5cTIg5G9T7Byb11ouwyEmw9JZx
        eVQNmSw6F+d7wCIYDRkywu55FUW0T8XHfK1VxxCdvlGP6MvsH
X-Received: by 2002:a7b:c3c8:: with SMTP id t8mr3770878wmj.189.1643130715145;
        Tue, 25 Jan 2022 09:11:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyrbdeHL0IlLxe23svOOleIzfku/tFpG1O9rOLv6Af/becvU1F5yAgCWPKlbpU8ULSRE8Matg==
X-Received: by 2002:a7b:c3c8:: with SMTP id t8mr3770860wmj.189.1643130714957;
        Tue, 25 Jan 2022 09:11:54 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id f8sm1185826wmg.44.2022.01.25.09.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jan 2022 09:11:54 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     linux-arm-kernel@lists.infradead.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        devicetree@vger.kernel.org, linus.walleij@linaro.org,
        sboyd@kernel.org, olof@lixom.net, soc@kernel.org,
        linux-fsd@tesla.com, linux-clk@vger.kernel.org, arnd@arndb.de,
        linux-samsung-soc@vger.kernel.org,
        Shashank Prashar <s.prashar@samsung.com>,
        catalin.marinas@arm.com, Aswani Reddy <aswani.reddy@samsung.com>,
        robh+dt@kernel.org, pankaj.dubey@samsung.com,
        s.nawrocki@samsung.com
Subject: Re: (subset) [PATCH v5 15/16] arm64: dts: fsd: Add initial pinctrl support
Date:   Tue, 25 Jan 2022 18:11:06 +0100
Message-Id: <164313065136.81319.15871986388224953551.b4-ty@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220124141644.71052-16-alim.akhtar@samsung.com>
References: <20220124141644.71052-1-alim.akhtar@samsung.com> <CGME20220124143001epcas5p4c0aab0902709a24bbedadaa223fe7910@epcas5p4.samsung.com> <20220124141644.71052-16-alim.akhtar@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, 24 Jan 2022 19:46:43 +0530, Alim Akhtar wrote:
> Add initial pin configuration nodes for FSD SoC.
> 
> 

Applied, thanks!

[15/16] arm64: dts: fsd: Add initial pinctrl support
        commit: 773d685fd406514af4b365aaa54fe493cf523602

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
