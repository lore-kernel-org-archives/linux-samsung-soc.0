Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96058C4167D
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 20 Dec 2021 09:37:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229728AbhLTJh2 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 20 Dec 2021 04:37:28 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:59550
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229763AbhLTJh1 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 20 Dec 2021 04:37:27 -0500
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com [209.85.208.199])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 19B87402E1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Dec 2021 09:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1639993046;
        bh=g6qji2pb2cXYir7bn0MZqaQvSo0VOIHA4X4Dl0hqX8Y=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=X4g7A3Cdhz28fUFhoQ0WHWNxNKeSQKM0BIJGGqHutHin6zxFCg5o25Ju9ugWLnntp
         CzRqar3YQXbAYSPueaCc88Muzw6KkM/e6GyIcoFK6MQJtD01MYxV8d4QJAw03g9ckX
         h+nLN+3jJh/u7jmqgDPhqK9vFwOuImOiALt+d9obIAlBGpAFWhTcLuxK3ahBAqZS99
         SDl7BSnePRR9QbQz5k/hySn4Wo9nFq50D69uZryv7oXx8roqoZwxvNwaEwBdYg+gNh
         K/wAYS7J7zM+zQ9axaHzPxTtY8yy5f9yBSVnoZdM+mixyCnBCIpoO+itx+RiS+6N4F
         /UL2EgXKHvw1w==
Received: by mail-lj1-f199.google.com with SMTP id m20-20020a2eb6d4000000b002219b019ae8so1568442ljo.16
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Dec 2021 01:37:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=g6qji2pb2cXYir7bn0MZqaQvSo0VOIHA4X4Dl0hqX8Y=;
        b=gB+ejU9YT2zDZV2z+0yiXdGgR4hEkug2XIIcd9qCbD/UTILFNcXFY6R7D6hgkhknlV
         5gKH6td74u7hFp+fqwZlcrKIwqoDiZDGvM6JGotg4CRGLggFw5BQY+o76du3Z8zTuibl
         k+ZHjuUpioFhggPsXR+XAqUOArsDFVYjONJEoSMa9tsCeNASlaFzcOo2gTlWeP5rXEl7
         Zd91pSgMWI8yRPgKW6P/iapXIyNI1G10cfX4quaL+YA/cPa0DYaw5FQTZ9Hiw0o5A5Mb
         9lEWivmpA9/x5VT658Qd9FmgbGPpj/U88Qs8IOgLmtgrYfozgL8GF9Msp9CUOj2A/lva
         AIKQ==
X-Gm-Message-State: AOAM531jH2ajvT2Q3v+I0LWb8DmWb4bzpF+082dKITwY5X83aMR7yHlL
        DTUY6flaXDg2KBvdl74tIPz2ZNLKqEAhi67GJ8kg9wggzboXN62TQNm24WMLVZEv+mPJb0PLbEs
        XRccTDJC/wLlBiOa1LHBGYapmXuCHVvGqI8CdH0ZZFYYcf2ZK
X-Received: by 2002:a05:651c:1031:: with SMTP id w17mr13802006ljm.112.1639993044795;
        Mon, 20 Dec 2021 01:37:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxcb4zCkuksbBh2a+v2wndWfr4lS0Fi1HqUBer1cJ9x95qXKkE6G8NaCPHqp0YjKf8Gv1eP+w==
X-Received: by 2002:a05:651c:1031:: with SMTP id w17mr13801996ljm.112.1639993044655;
        Mon, 20 Dec 2021 01:37:24 -0800 (PST)
Received: from krzk-bin.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id h15sm93443lfu.103.2021.12.20.01.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Dec 2021 01:37:24 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-clk@vger.kernel.org, Chanho Park <chanho61.park@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        David Virag <virag.david003@gmail.com>,
        linux-kernel@vger.kernel.org,
        Jaewon Kim <jaewon02.kim@samsung.com>,
        Daniel Palmer <daniel@0x0f.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, Hao Fang <fanghao11@huawei.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Youngmin Nam <youngmin.nam@samsung.com>
Subject: Re: (subset) [PATCH v4 4/7] dt-bindings: arm: samsung: Document E850-96 board binding
Date:   Mon, 20 Dec 2021 10:37:19 +0100
Message-Id: <163999303689.14127.12844004374381607436.b4-ty@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211217161549.24836-5-semen.protsenko@linaro.org>
References: <20211217161549.24836-1-semen.protsenko@linaro.org> <20211217161549.24836-5-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, 17 Dec 2021 18:15:46 +0200, Sam Protsenko wrote:
> Add binding for the WinLink E850-96 board, which is based on Samsung
> Exynos850 SoC.
> 
> 

Applied, thanks!

[4/7] dt-bindings: arm: samsung: Document E850-96 board binding
      commit: e1ba2f940ba4c4c3b4d0a520301a920591c421f9

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
