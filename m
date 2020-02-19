Return-Path: <SRS0=v6hi=4H=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DA2AC34047
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 19 Feb 2020 17:29:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0AA6020801
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 19 Feb 2020 17:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1582133369;
	bh=X7LrmsVCbQEZZqRYiS0djzoxf0rvvxZ7gTb2Ap3JVmM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=nthItTCC1Klvpf99imNtuLu2LomAwwIviFy46cwCNen8b+2JmyM67/e2x59NM1yAd
	 3K917SK6Tr6WE6lpDppkir5fUhly4Snw7mPBIuYRSuUFrWwSueQlzz7D1ns10LvkH9
	 EZJXqMWk05o2nu3tWivq01HuanPiRuVkONwW3RXw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726558AbgBSR32 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 19 Feb 2020 12:29:28 -0500
Received: from mail-ed1-f65.google.com ([209.85.208.65]:46663 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726518AbgBSR32 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 19 Feb 2020 12:29:28 -0500
Received: by mail-ed1-f65.google.com with SMTP id p14so21950100edy.13
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Feb 2020 09:29:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=+7p/FlfxHrbOLw+VfcV5E1tVO+N3N2d/5wgHcY5A5L4=;
        b=J+OgubV8XGs4B8LLMPLn7VD2cAPwhFFMX6b8ojM5E7Rd4nCy2dBXKnaj8opKNyjSOD
         HRC6JJ6EkSDiQa+9vWO8QTQ1+CDEByiQyOaqUQvVpR+ZpRCh8x5rUOKTyF6o8G8cxLXG
         HCJ0jAqIPwElzAZo9j4M2jIR8PY6Fr4EgF4HUQUSMWFKjE+mKnPPVla1cNj5+XB1Y7AN
         qLESTJz3eTV96SRFwWLHgfPKpV7gCqQkPlDOxcwrakPsJjQXa5t7/NWH/0HYKvSHPmHA
         g/7K0SE4Q3R+38ltcxHKjJUPofwzW7IVg2m4fqtJvYLS1ziuAAl6hLjkGpicfHgn8yiT
         Onxg==
X-Gm-Message-State: APjAAAXZ4c8+xcFUQ+q1loujgv15iEeVuxdy1IQBMgJqyJXO07C7XahF
        dPfqCiEdSWjW5isTnfzLq7s=
X-Google-Smtp-Source: APXvYqxcDRT6VTfqWfOq8GJcYkNpfYTvd5IJC/uads1s5AnRP8y/X0F6JNUfqs3pmH8A+IiYHyDFJA==
X-Received: by 2002:aa7:d2cf:: with SMTP id k15mr23917785edr.299.1582133366888;
        Wed, 19 Feb 2020 09:29:26 -0800 (PST)
Received: from kozik-lap ([194.230.155.125])
        by smtp.googlemail.com with ESMTPSA id f25sm5742edt.73.2020.02.19.09.29.25
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Feb 2020 09:29:26 -0800 (PST)
Date:   Wed, 19 Feb 2020 18:29:22 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-samsung-soc@vger.kernel.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH] ARM: exynos_defconfig: Enable SquashFS and increase RAM
 block device size
Message-ID: <20200219172922.GA31106@kozik-lap>
References: <CGME20200218074310eucas1p288fe322bfadcff6025aadf7b6d51ffc2@eucas1p2.samsung.com>
 <20200218074306.16824-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200218074306.16824-1-m.szyprowski@samsung.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, Feb 18, 2020 at 08:43:06AM +0100, Marek Szyprowski wrote:
> All modules built from exynos_defconfig occupy about 55M, so enable
> squashfs filesystem support and increase default ram block device size
> to 32M to enable deploying them on initrd. Such initrd, using squashfs
> requires at least 24M.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm/configs/exynos_defconfig | 3 ++-

Thanks, applied.

Best regards,
Krzysztof

