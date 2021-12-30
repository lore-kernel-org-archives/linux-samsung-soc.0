Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE35CC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 30 Dec 2021 19:34:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237298AbhL3Te4 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 30 Dec 2021 14:34:56 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:33438
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233850AbhL3Tez (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 30 Dec 2021 14:34:55 -0500
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com [209.85.208.199])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id B21A13F1AF
        for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Dec 2021 19:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1640892893;
        bh=shZCFiS+ib8mHhXNKkuXNTy39TEUCiC0ufCAqLJtIC4=;
        h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type;
        b=hiRgtvZvCAXXpf7b8oKHAA9GOLoRcrJ6Br4LsmCzvJl/MAKCkoidHeWrdVFneVktF
         x8NlS09AdA4w9KYNu2Bj/c6viFM332ybAl/KUVYKoOpGIVs78rOhubysLYnREpgeQr
         BjSqqf8VoJ96ttVlrpi48npLYNCoYwSZVI6d4oiXItQ419EpQo0qW1QqNxiZzFIMAo
         bNfRgav6BgE4vadajTAqVqKIXy0LaluAk56pihmeYIpSskhlgJMGHK1kAq9x+E50LX
         vKcXeXbsCXncq2kPbT8f+IEffn4ftpFxIxSNgS5xoaB4fmvjJzSJ/tNUl7NHG39vGe
         8KX0+NFq5+0sQ==
Received: by mail-lj1-f199.google.com with SMTP id k20-20020a2e9214000000b0022d6b13bc8aso8471366ljg.13
        for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Dec 2021 11:34:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:cc:from:subject:content-transfer-encoding;
        bh=shZCFiS+ib8mHhXNKkuXNTy39TEUCiC0ufCAqLJtIC4=;
        b=fn26UQdOMUMybqNI8ldLuylLdCbGwSfIrtQDZJS0jXqQE6p/K/B2Ngm4o3QSTK+BFn
         slxLxRUpcfNI8QPhZBvs00mqpKh00iKQVdFJMPLJNOw1Z9/pgphzPnD4kGOAxXU9TTZ7
         ElnKNJi3WoBR7CRCZBCnsY4CVHAX5G6rYslet0t+KkHz4RSYAW1haSGuExj45ItSg9iR
         cVJUWMTnR7JCtGV2eWSEJT3VekKXkBVTgx5jUXvia0j9xfPgtiwfj0phDpmodb5IJzHX
         MY4J95LlprIkUf4ewewYHqHBRt2EHunXfQ5A7rgkVM3dtkE66GKMbVA6CXtE/DjZdxUQ
         xm4g==
X-Gm-Message-State: AOAM533/BfI/uGG7WRobUoSqrlRMmiCp0r9W+1DPKIYyi3OCu29e38G3
        HIjfKo9a7zOqba3d8W82uTdrIDIMpalx0so+3RrXaNHcGiwXTU03cMNxa58w10mBe/jPlPLT2qt
        3E1t9dJgCjGmGTJ9NeLPrV/wTSOT7olSfskQcJcKZP1mgjASC
X-Received: by 2002:a2e:978a:: with SMTP id y10mr23513565lji.210.1640892892904;
        Thu, 30 Dec 2021 11:34:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzyM5o5yeD33DV/nSADMs6S9OOkMSN+9tPSwlMg7sd7VUhE41JFJI5x8oTqjA5sQdyrfX2daw==
X-Received: by 2002:a2e:978a:: with SMTP id y10mr23513558lji.210.1640892892737;
        Thu, 30 Dec 2021 11:34:52 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id j1sm2549752ljg.45.2021.12.30.11.34.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Dec 2021 11:34:52 -0800 (PST)
Message-ID: <3c0087a9-5c3b-d665-136e-6110a0482775@canonical.com>
Date:   Thu, 30 Dec 2021 20:34:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Content-Language: en-US
To:     Chanho Park <chanho61.park@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: Exynos850 and ExynosAuto v9 pinctrl wakeup muxed interrupt
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Chanho and Sam,

I am slowly finishing dtschema for Samsung pinctrl drivers [1] and I
noticed that Exynos850 and Auto v9 do not define interrupt in pinctrl
node with: wakeup-interrupt-controller. This is an interrupt muxing
several external wakeup interrupts, e.g. EINT16 - EINT31.

For Exynos5433 this looks like:
https://elixir.bootlin.com/linux/latest/source/arch/arm64/boot/dts/exynos/exynos5433.dtsi#L857

Missing muxed interrupt for Exynos850 and Autov9 might be fine, although
you should see in dmesg error log like:
    "irq number for muxed EINTs not found"

Can you check that your wakeup-interrupt-controller is properly defined
in DTSI? If yes, I will need to include such differences in the dtschema.

[1] https://github.com/krzk/linux/tree/n/dt-bindings-samsung-pinctrl-schema

Best regards,
Krzysztof
