Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB2E9C63777
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 16 Nov 2020 16:22:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A751122265
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 16 Nov 2020 16:22:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731765AbgKPQWQ convert rfc822-to-8bit (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 16 Nov 2020 11:22:16 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:46626 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728871AbgKPQWQ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 16 Nov 2020 11:22:16 -0500
Received: by mail-wr1-f67.google.com with SMTP id d12so19281711wrr.13;
        Mon, 16 Nov 2020 08:22:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=EWIrU9CEFc3H8GGH+0Mm2hCvHYCABZ5yNEtO9tH2VFA=;
        b=gH7axT4qUsPqrr43U5iuOtt9TV21pKQkKInghpVpJqwRWWFWL9SBtY62ri5i2SCo/3
         sEZSJQ8HsmjxYdQ9L8VF+YaLq1XwTCsjezRVZkJandMZ7mLrRr2MVrXYYcPcfLlLczxv
         SVn+frvFE4keJrCqCpXmWXK248iSuM0w8oDNz4V/ngnE2yPWX39VV5hiblhn55OycJCf
         4ZFVwMbM5GRKSQB0DKFBpyiTzD5lHH20cwGqHOLxf26Riwh7B3IdpRI+cpjotReekIA6
         aB26ACxJHMuk8XpisQsLzcyT65fggNMX1ZOznr0ejcoq4sZQMBH0seFptKzvWQ07UXp0
         LU8Q==
X-Gm-Message-State: AOAM530zch+RI2YVXxIrWxUSUrwwg7fYtEUMZ2H1VwTk0CmZdvl/vXe9
        vShUw52o4nSGoDrs4ag0350=
X-Google-Smtp-Source: ABdhPJxGpsU72Jo3cfypr8FMxJpQHZw6NDmtKYVg0qcWtCx0bFVuMuWrAYldr43xdBw687paZw4+EA==
X-Received: by 2002:a5d:614e:: with SMTP id y14mr21607355wrt.25.1605543732929;
        Mon, 16 Nov 2020 08:22:12 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id g4sm23512352wrp.0.2020.11.16.08.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 08:22:11 -0800 (PST)
Date:   Mon, 16 Nov 2020 17:22:10 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Martin =?utf-8?Q?J=C3=BCcker?= <martin.juecker@gmail.com>
Cc:     linux-samsung-soc@vger.kernel.org, kgene@kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3 3/5] ARM: defconfig: add stmpe adc driver for p4note
Message-ID: <20201116162210.GE25108@kozik-lap>
References: <20201113212525.13455-1-martin.juecker@gmail.com>
 <20201113212525.13455-4-martin.juecker@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <20201113212525.13455-4-martin.juecker@gmail.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, Nov 13, 2020 at 10:25:24PM +0100, Martin Jücker wrote:
> Enable the stmpe adc driver for the p4note device family.
> 
> Signed-off-by: Martin Jücker <martin.juecker@gmail.com>
> ---
>  arch/arm/configs/exynos_defconfig   | 3 +++
>  arch/arm/configs/multi_v7_defconfig | 2 ++
>  2 files changed, 5 insertions(+)

Thanks, applied.

Best regards,
Krzysztof

