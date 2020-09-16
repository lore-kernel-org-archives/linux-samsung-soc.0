Return-Path: <SRS0=Wlns=CZ=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25B18C433E2
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 16 Sep 2020 20:28:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C1B1F221E7
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 16 Sep 2020 20:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600288135;
	bh=PiDVu2AfNwO7VHbgJcAtXVLi+t+ME0jWrz0mm4ZR6IM=;
	h=Date:From:To:Subject:References:In-Reply-To:List-ID:From;
	b=JDZPpvWRCVqggUCmkyckgtaVMSVAP9Kwn1vvR+qVercvCaQ4AAdg3/S8qd+LQPHlR
	 6gC33gXVcHYZudA6vEWOZfYrmwyXt4DP1cx/9mn1yQEGbB15MlTqm0L3ldVuzWo9+k
	 B3hOSl7Fgpk2JwUF/gWwkeUU9XXtutxHQNPAwxdA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726943AbgIPU2K (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 16 Sep 2020 16:28:10 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:33164 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726953AbgIPRYR (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 16 Sep 2020 13:24:17 -0400
Received: by mail-wr1-f65.google.com with SMTP id m6so7789673wrn.0;
        Wed, 16 Sep 2020 10:22:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=zyl8TJrhVfTe2TXHn1Ylm3CaGAI0Eut0vrDhMWKREwU=;
        b=WqRV0r/O3bTIQ4soOV3uyD+bdvMNsZFtEAmsLproaR5hrgGx2Vs+OGMKCJW7bPh/aM
         VTvVa5ul3Nm54zYZtIYO7ziaBlwONkiBnbN2ahYxZsHrC5cYDHFkZvB8F+4oZw7Zb3Db
         u4Veu5V8WWPLq7AIs1O8zN32a40VF4elQ42MdNVKQdnYfNAnfVHVpXPai/zv9Vm73SQU
         Fifxg/LbmohT2c+O8MSkHUOTt8jgFFRq2fytKn2IjYNe5zVHMux/SVqzABfodekpDxXB
         8JjAlgwq9iFCN85OeTr8euSIP+HtuaDkSDRv5xgjRvRHuy3SJYt+yvnnFhdSMLeUWg4w
         0y9w==
X-Gm-Message-State: AOAM5302qx9Qahrx4zHSoXSjHMo5DoyjZ9SddBuvf2JQ8Yvbzu/HDWmE
        p0Akp/wzypMWmB7AClOiF6ool2sZo35+aoET
X-Google-Smtp-Source: ABdhPJzxTPnq22IWDSWfZN82ctZiAHt+M7IbEHPa2jzbRm5lvwD+4JIY7doBYk52EE6ZV+4m3nYEgw==
X-Received: by 2002:adf:cd05:: with SMTP id w5mr27473177wrm.62.1600276396656;
        Wed, 16 Sep 2020 10:13:16 -0700 (PDT)
Received: from kozik-lap ([194.230.155.191])
        by smtp.googlemail.com with ESMTPSA id k8sm33846128wrl.42.2020.09.16.10.13.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Sep 2020 10:13:15 -0700 (PDT)
Date:   Wed, 16 Sep 2020 19:13:13 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Kukjin Kim <kgene@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Inki Dae <inki.dae@samsung.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v2 6/6] arm64: dts: exynos: Align OPP table name with
 dt-schema
Message-ID: <20200916171313.GD19427@kozik-lap>
References: <20200903191438.12781-1-krzk@kernel.org>
 <20200903191438.12781-6-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200903191438.12781-6-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, Sep 03, 2020 at 09:14:38PM +0200, Krzysztof Kozlowski wrote:
> Device tree nodes should have hyphens instead of underscores.  This is
> also expected by the bindings.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> ---
> 
> Changes since v1:
> 1. New patch
> ---
>  arch/arm64/boot/dts/exynos/exynos5433.dtsi | 2 +-

Applied.

Best regards,
Krzysztof

