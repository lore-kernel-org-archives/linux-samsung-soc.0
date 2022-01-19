Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3D75C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 19 Jan 2022 15:12:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355617AbiASPMZ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 19 Jan 2022 10:12:25 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:60932
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1355625AbiASPMB (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 19 Jan 2022 10:12:01 -0500
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 432B84004F
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Jan 2022 15:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1642605120;
        bh=drjzBd6xSh2W3A1sdcF3qLyFND0naAGILhzsS9dD8A4=;
        h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
         Content-Type:In-Reply-To;
        b=CIy3wWJSaRhLgakGKkv3qXUIeqe6Bppmud6RKv32ckjAbiI9SiAVQRMNcNFnFYiNm
         orb9CbkWiGRhZU8qL/42KS79bFz6yImuz1QVqkUCzKZpbBaKlAn4X9BKJQ0Fl3nC9y
         KUaMAxhhbAEyXyZGZFVFH9chGxmAkBnBIqdrGhZdwThxSDKDmTQdXzuCKtOFzv0eE2
         dscNkpAHHemAQdiGqyT+SyWcTw1sRJgqFoYwrHI2LnOvmWErvreHLoiUvi8TXCQJYO
         P2oW+NKeAKZjeR/8GbZIoZgshqifZJvOg9hss+xZcn7AMAk++mFbpG3EH9GgSBlR0Z
         scV1nJibRUqgA==
Received: by mail-ed1-f69.google.com with SMTP id en7-20020a056402528700b00404aba0a6ffso1644224edb.5
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Jan 2022 07:12:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=drjzBd6xSh2W3A1sdcF3qLyFND0naAGILhzsS9dD8A4=;
        b=5ogMLQOhBFhNsBPDE8h9wPDzbmuT8zpMzWnqpyDbQIdohssZvFJpwMQUrSv0rxPoh3
         AX14d795jREWyPEArNK4tlnDNW0CwxdpL1dSfR3iEM/EhHzK/FpLrHautn1yVSRoFK9x
         EBgkCxCPnROPRQSGZFpr4j0qyQE2wbeUf6U0Miuu7wvU9aEObhAEb7ui/qdZCHmCsFhQ
         23Ft0CNpjaig68fQhSksCaEIQo3vRdoKvhn6g8KfryOOP2g2o/aHlkkyysD0OKu4SC4/
         5YmdjPw06l0yx1RIxgOVsWWmftqWqiPvu9SGVV520Pk8HbQ51S4fGPocJfm9arNWX/si
         keDA==
X-Gm-Message-State: AOAM532YmfsWtC9WgEaSK4ZJXKygw2MsNab4nRLxSVbTT++wA1fBF6r0
        kW52b+wS1yEdIOsrJw+FitwzeTWLugmLRlXg8O7DBhw8BZbYlUT/KtgYxHH1ofnT6Q1/MVjLkCc
        tiBWHBXgRvz9Gysy/4/CE+v0X/jG745U5joCUm/hoEkfNm9CS
X-Received: by 2002:a17:907:90d5:: with SMTP id gk21mr24657798ejb.359.1642605118495;
        Wed, 19 Jan 2022 07:11:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxddTNyN9TBuuv8pGuZnGAB9t/ygdDr/3nax3MlitJXfQZJieVWGTj2hsRfDZn1PRaG5CZVnw==
X-Received: by 2002:a17:907:90d5:: with SMTP id gk21mr24657762ejb.359.1642605118251;
        Wed, 19 Jan 2022 07:11:58 -0800 (PST)
Received: from krzk-bin (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.googlemail.com with ESMTPSA id i23sm1339989edt.93.2022.01.19.07.11.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jan 2022 07:11:57 -0800 (PST)
Date:   Wed, 19 Jan 2022 16:11:56 +0100
From:   'Krzysztof Kozlowski' <krzysztof.kozlowski@canonical.com>
To:     Alim Akhtar <alim.akhtar@samsung.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        soc@kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, olof@lixom.net, arnd@arndb.de,
        linus.walleij@linaro.org, catalin.marinas@arm.com,
        robh+dt@kernel.org, s.nawrocki@samsung.com,
        linux-samsung-soc@vger.kernel.org, pankaj.dubey@samsung.com,
        linux-fsd@tesla.com, 'Arjun K V' <arjun.kv@samsung.com>,
        'Aswani Reddy' <aswani.reddy@samsung.com>,
        'Ajay Kumar' <ajaykumar.rs@samsung.com>,
        'Sriranjani P' <sriranjani.p@samsung.com>,
        'Chandrasekar R' <rcsekar@samsung.com>,
        'Shashank Prashar' <s.prashar@samsung.com>
Subject: Re: [PATCH v2 14/16] arm64: dts: fsd: Add initial device tree support
Message-ID: <20220119151156.y2rzrk2gpoweiofc@krzk-bin>
References: <20220118144851.69537-1-alim.akhtar@samsung.com>
 <CGME20220118150108epcas5p2d9cd4db7cb368c2bfbd7d058eba4107c@epcas5p2.samsung.com>
 <20220118144851.69537-15-alim.akhtar@samsung.com>
 <43e72d34-0e11-9ff6-6924-0cab62b51891@canonical.com>
 <000301d80d46$502ae590$f080b0b0$@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <000301d80d46$502ae590$f080b0b0$@samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, Jan 19, 2022 at 08:37:40PM +0530, Alim Akhtar wrote:
> >Similarly to previous vendor-prefix patch, please let me know if it's expected
> >me to take it. I assume no. :)
> >
> I am expecting this will go via your tree, but I am ok either ways. May be you and arm-soc maintainers (Arnd/Olof) can take the call here.

I can take it, that would be the easiest, I guess.

Best regards,
Krzysztof

