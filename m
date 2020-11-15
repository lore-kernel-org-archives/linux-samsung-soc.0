Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 466B8C2D0E4
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 15 Nov 2020 10:32:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 07B4624137
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 15 Nov 2020 10:32:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726789AbgKOKc4 convert rfc822-to-8bit (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 15 Nov 2020 05:32:56 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:38162 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726230AbgKOKc4 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 15 Nov 2020 05:32:56 -0500
Received: by mail-wr1-f65.google.com with SMTP id p8so15482294wrx.5;
        Sun, 15 Nov 2020 02:32:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=nboJra9xrDgWjRXVvjgcT7Fsw1IMwT3NAZBZdfUci98=;
        b=q4hiYEmhWASxQzyjGTNZNP5ujBwCHpEvXm6pphRi+H5JX/E20czxxldhualuehCscp
         0Uw/NZOsruCB8uhwVnrYpz7Q2tI0N0FGbO6Jh0Iu5BrHW8slmYsAfbjdYkJeNrTjzaRN
         ikNVbA/Zk8gWjDRQdeRiKFlWX0U8KvLPG4PrZPRhS6dt1hRGvifJRRlZEgMstryHgL7Y
         Q1Zxb/0Ss37i/ITFEbfvriFSNTjD59U66ecn+WM94hns7vF3rKNCuZo7f5FUXB7WpB+Y
         5184MC+wM12vC5erj7iJ5Vt/kzoxQ0wCgHSaMtgusDOu8d8ZZ0dpWBtFV2TJh+Olcrzt
         CupA==
X-Gm-Message-State: AOAM532WQUsQ8Br75gojIua0EanuKoqFfQ0qyV0wxm/cip8o5UpvZlrt
        oc9Sh3TSBMetDjlEC5bqarjGrhwLkpg=
X-Google-Smtp-Source: ABdhPJyM/bTYQ2AwPTHnTlR+FVSvJoOH8FFFS0PRMWgUl0BjnDNWVdNzIC2Z5/qqgyxGY8O5Ka1P7g==
X-Received: by 2002:adf:eb08:: with SMTP id s8mr14406477wrn.12.1605436373944;
        Sun, 15 Nov 2020 02:32:53 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id q5sm14435768wrf.41.2020.11.15.02.32.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2020 02:32:52 -0800 (PST)
Date:   Sun, 15 Nov 2020 11:32:51 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Martin =?utf-8?Q?J=C3=BCcker?= <martin.juecker@gmail.com>
Cc:     linux-samsung-soc@vger.kernel.org, kgene@kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/5] ARM: dts: add Samsung's exynos4412-based p4note
 boards
Message-ID: <20201115103251.GB4587@kozik-lap>
References: <20201113212525.13455-1-martin.juecker@gmail.com>
 <20201113212525.13455-3-martin.juecker@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <20201113212525.13455-3-martin.juecker@gmail.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, Nov 13, 2020 at 10:25:23PM +0100, Martin Jücker wrote:
> The p4note family contains a couple of variants of the Galaxy Note 10.1
> tablet with mainly different modems. The GT-N8010/GT-N8013 is the wifi
> only version.
> 
> Signed-off-by: Martin Jücker <martin.juecker@gmail.com>
> ---
>  arch/arm/boot/dts/Makefile                    |    1 +
>  arch/arm/boot/dts/exynos4412-p4note-n8010.dts |   17 +
>  arch/arm/boot/dts/exynos4412-p4note.dtsi      | 1132 +++++++++++++++++
>  3 files changed, 1150 insertions(+)
>  create mode 100644 arch/arm/boot/dts/exynos4412-p4note-n8010.dts
>  create mode 100644 arch/arm/boot/dts/exynos4412-p4note.dtsi
> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index ce66ffd5a1bb..55ffee2b20f8 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -197,6 +197,7 @@ dtb-$(CONFIG_ARCH_EXYNOS4) += \
>  	exynos4412-odroidx.dtb \
>  	exynos4412-odroidx2.dtb \
>  	exynos4412-origen.dtb \
> +	exynos4412-p4note-n8010.dtb \
>  	exynos4412-smdk4412.dtb \
>  	exynos4412-tiny4412.dtb \
>  	exynos4412-trats2.dtb
> diff --git a/arch/arm/boot/dts/exynos4412-p4note-n8010.dts b/arch/arm/boot/dts/exynos4412-p4note-n8010.dts
> new file mode 100644
> index 000000000000..9f559425bd2c
> --- /dev/null
> +++ b/arch/arm/boot/dts/exynos4412-p4note-n8010.dts
> @@ -0,0 +1,17 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Samsung's Galaxy Note 10.1 - N801x (wifi only version)
> + *
> + * Copyright (c) 2013 Samsung Electronics Co., Ltd.
> + *		http://www.samsung.com

Here and in other files - why did you remove your copyright? My comment
from previous version: "If it is true, then include the copyright of
original work as well."

Best regards,
Krzysztof

