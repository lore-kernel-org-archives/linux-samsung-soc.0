Return-Path: <SRS0=YEUN=EO=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FEA3C388F9
	for <linux-samsung-soc@archiver.kernel.org>; Sun,  8 Nov 2020 19:00:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DA10920731
	for <linux-samsung-soc@archiver.kernel.org>; Sun,  8 Nov 2020 19:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604862026;
	bh=ZtOqUI1L4FWYM8jSOHTKQ4uP8rSw7f3pL3dn+Kqm7SQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=gUQuElxomdT9fjkGNuHxA1P6jyl6on/wnsOePvlaLlmhTggUHq0mvEFKXI0rZRCHn
	 x12lM7vd5ufufPY6cFC8wcDfnz6vXl5b8NM5BE3PLfL352sLGgF4DovYHfOfPI9gka
	 MgHAiDkocFF8+8X9ydD9HDdrewd27gG+RXLlfVrc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728451AbgKHTAX convert rfc822-to-8bit (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 8 Nov 2020 14:00:23 -0500
Received: from mail-ed1-f66.google.com ([209.85.208.66]:43400 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727570AbgKHTAW (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 8 Nov 2020 14:00:22 -0500
Received: by mail-ed1-f66.google.com with SMTP id b9so6449932edu.10;
        Sun, 08 Nov 2020 11:00:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=OUgbcezo0h/mAz6/tn0xA6XFgWNb6IgqpXDUg+2j+Es=;
        b=BDsZAtR8MoPsmFOW/5K7vjbEcPPzpmKWgy9oRh61Ii4SRdJpHOq2qtsm1gmovLrAbL
         KYfR9oFJcbhAUTputeEn0KvQqxi9DtahjqN9koft0wBtPdGANcqF81fPTMXhgRUr+vVt
         UgSd/zO0sCmMPa+d/09TtRCkbGXbiHhfl4XmgmKrH4e0Y5EfWDq0PNx/bm6PNKcPnc8n
         nJkhELS0CrK0rMgXcxzqRSyvVYpNcoN4OHcx+rL0MBN9DlwQ/Y4nOIHVb0jVtRsGFbLG
         1TZ7JPQNBv59F2hasu+08W0cAYtDGk8SqTtqOJfU/dLZzbLD6MkBnoM9656/szJx58/w
         ASlA==
X-Gm-Message-State: AOAM530KBxn6doihYi6RScCZyHQ5sd2iTHgbXHbp8LBLQNBRP9lnifbo
        u3NUZeAT7AeZkUn4NSZSC/8=
X-Google-Smtp-Source: ABdhPJwH+j1xAfl18vYu+bpVR8+rFRo9/cS0c7eskeVY7JZ8u5wW9xbyisGlfRpUw3ADztWKjNN7Kw==
X-Received: by 2002:aa7:dcd6:: with SMTP id w22mr11798948edu.19.1604862020676;
        Sun, 08 Nov 2020 11:00:20 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id rn2sm6674691ejb.94.2020.11.08.11.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2020 11:00:19 -0800 (PST)
Date:   Sun, 8 Nov 2020 20:00:17 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     =?utf-8?B?UGF3ZcWC?= Chmiel <pawel.mikolaj.chmiel@gmail.com>
Cc:     kgene@kernel.org, alim.akhtar@samsung.com, robh+dt@kernel.org,
        a.kesavan@samsung.com, naveenkrishna.ch@gmail.com,
        thomas.ab@samsung.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] arm64: dts: exynos: Include common syscon
 restart/poweroff for Exynos7
Message-ID: <20201108190017.GA28948@kozik-lap>
References: <20201107133926.37187-1-pawel.mikolaj.chmiel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <20201107133926.37187-1-pawel.mikolaj.chmiel@gmail.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sat, Nov 07, 2020 at 02:39:25PM +0100, Paweł Chmiel wrote:
> Exynos7 uses the same syscon reboot and poweroff nodes as other Exynos
> SoCs, so instead of duplicating code we can just include common dtsi
> file, which already contains definitions of them. After this change,
> poweroff node will be also available, previously this dts file did
> contain only reboot node.
> 
> Fixes: fb026cb65247 ("arm64: dts: Add reboot node for exynos7")
> Fixes: b9024cbc937d ("arm64: dts: Add initial device tree support for exynos7")
> Signed-off-by: Paweł Chmiel <pawel.mikolaj.chmiel@gmail.com>
> ---
> Changes from v1:
>   - Split into two separate patches.
>   - Include existing exynos-syscon-restart.dtsi to avoid code
>     duplication.
> ---
>  arch/arm64/boot/dts/exynos/exynos7.dtsi | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
> 

Thanks, applied.

Best regards,
Krzysztof

