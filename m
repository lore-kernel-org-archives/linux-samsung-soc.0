Return-Path: <SRS0=5Pkx=ED=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8803DC4363A
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 28 Oct 2020 21:55:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 340AB24724
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 28 Oct 2020 21:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603922159;
	bh=MNIwIR/HZrW/y/nzwQdRg3PwqybasLlQU8pd0CZhAGI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=VgpzQEOIRrLqErQWEeuhwHIP76gpWvpAElFxXhjCVKzjNl74oalvwmkAzuHTIz88S
	 Fd7vxIQBk5EAnDXWGv78X/t0ACqPjrdHRvTWM4rMBU+8K4kt0sPOuNRNlmRPBtu2s4
	 CE5c66+oJj9xGoCPN2SuOnWPWjy9cG7VcVQBXCnQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728532AbgJ1Vz5 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 28 Oct 2020 17:55:57 -0400
Received: from mail-ej1-f66.google.com ([209.85.218.66]:34051 "EHLO
        mail-ej1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728492AbgJ1Vzy (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 28 Oct 2020 17:55:54 -0400
Received: by mail-ej1-f66.google.com with SMTP id gs25so1079863ejb.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 28 Oct 2020 14:55:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Vspv7sHfBQBjbCHNRTOagbnTY3/shcmpq7iK9KY9QC8=;
        b=rNGQmhRhzUaqtOTsJU8iEHrAsJqesQi7eBO3TGlODlx6PD2X2bJtEzPOj+vDUM6Ufs
         47c5EQvblxqmn5HiEVl2NerIrEv0V7Yx/JbCRuE0jJrBnBWlwPRiDiT70Il9SHRQofQr
         8LSlOGQk9GwVBiUubTyTKC9FTxIiea218v+h41R8JVVl0jLu4vCJswOHcXet4gkbfaqL
         pXxZ8aCiU5yNtusV3Tx6KmoZsp/P1TaYLkSd0xQ8JAjF3i0OLpg+K0hhpmsmF45S2c42
         FprAcn1gM0iG83otikzE5+LhjUIGl5K3+d2RrNBdZmbfKTqvsrcU/IvH9coHQNinLmcl
         H6cw==
X-Gm-Message-State: AOAM532WgZ0AKrBqXcAmJ3y8cCVhVhjRPbuKSRL1GKxtaPGPF+eG59HA
        xHo5m6/RDMfsHFsorwZyRNBYmjge8s3Wkw==
X-Google-Smtp-Source: ABdhPJz3FKAhJS02jlP9XuNEL+xxbKTcwJXcVkrEChj+iAhBkkdT6AlaUq4/yp+/3BlBtWMNwSqldQ==
X-Received: by 2002:a17:906:8305:: with SMTP id j5mr483499ejx.497.1603911588518;
        Wed, 28 Oct 2020 11:59:48 -0700 (PDT)
Received: from kozik-lap ([194.230.155.184])
        by smtp.googlemail.com with ESMTPSA id f7sm244193ejz.23.2020.10.28.11.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2020 11:59:47 -0700 (PDT)
Date:   Wed, 28 Oct 2020 19:59:45 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-samsung-soc@vger.kernel.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH 2/3] ARM: dts: exynos: Enable BlueTooth support for
 Universal C210 board
Message-ID: <20201028185945.GB159042@kozik-lap>
References: <20201027142330.5121-1-m.szyprowski@samsung.com>
 <CGME20201027142341eucas1p299a5277c0de2a490f12a64cc84438fcf@eucas1p2.samsung.com>
 <20201027142330.5121-2-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201027142330.5121-2-m.szyprowski@samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, Oct 27, 2020 at 03:23:29PM +0100, Marek Szyprowski wrote:
> Add a node for the BCM4330 Bluetooth chip on the serial bus #0 on
> the Exynos4210-based Universal C210 boards.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  .../boot/dts/exynos4210-universal_c210.dts    | 29 +++++++++++++++++++

Thanks, applied.

Best regards,
Krzysztof

