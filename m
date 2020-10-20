Return-Path: <SRS0=ufbU=D3=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C243C433E7
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 20 Oct 2020 12:43:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B285322250
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 20 Oct 2020 12:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603197814;
	bh=C4VEYf+xRul3UAXnZfQ5lVJmVhw3RXA+762j6gg6DZE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=ZFMxC2hGZlyKe6Usm1Y+LXGqNUBFbjo9sIcBBvPVK9moRrlwIXcVcGUBvPdX1yp+y
	 1FMc6Z6GwvbG1nqkSolN7kjMxd3Hc2ibhZ+aHHrt7gBSjb03HxpXBLW14AXi1ulDZe
	 R1zKoXIXx5rL60MXk1Nsb+p2XFvGSghzM3ATXeLg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406428AbgJTMne (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 20 Oct 2020 08:43:34 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:38735 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406238AbgJTMne (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 20 Oct 2020 08:43:34 -0400
Received: by mail-wm1-f67.google.com with SMTP id b127so1711611wmb.3;
        Tue, 20 Oct 2020 05:43:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FgYKxrSDF1tBWsa/323Bkz7ZjLx2IgehRkzwvwGOSwI=;
        b=e1U3ui+DND5iRRg6ip/JpXaU1KDjvYpCKF9BPpm/QBA6KCpVtM185AOZ22yPWLrNhE
         3p/l4Djvy9zqQH5AsnPgaLErtfEh/MzrKE9tZdyZ+zp6Ei+EoQvf2+iWDQ70L0KWcjf0
         ELdSwCpkAqWJ7YaIJ/RlWBcQkRnFcM4IbQXfAl+UqgVSUkiJCJ5HOKWPtD6QlxG/1aXw
         iGVJ73rFlkro6GRrSzH7lLi1Bu4xw7h3k9NVysQvKPOP/mJEo7CxDb58YuZ48oTdLrPF
         ntYY26XjDCzK94d//nbHQNzXbjlSnz+OddY4DKcA613SGmmvSL0axrt9m7aLTR4hmgbm
         uaGA==
X-Gm-Message-State: AOAM533BM3D454JcHj0KAkeFY6w/6Tar1biZ1vT05uvbMEvEZc5RBP9Y
        0g05KBaZQncO+gnS3M5uLv8=
X-Google-Smtp-Source: ABdhPJzItDMHl/fgUmZXptVCdAspz9AK3yhYXGwibrLMFhEQNdwyi45x48KtYrINlUkcz4Lhkw2taQ==
X-Received: by 2002:a1c:b409:: with SMTP id d9mr2908080wmf.106.1603197811635;
        Tue, 20 Oct 2020 05:43:31 -0700 (PDT)
Received: from kozik-lap ([194.230.155.171])
        by smtp.googlemail.com with ESMTPSA id x64sm2555441wmg.33.2020.10.20.05.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2020 05:43:30 -0700 (PDT)
Date:   Tue, 20 Oct 2020 14:43:28 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kukjin Kim <kgene@kernel.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 26/29] arm64: dts: exynos: Harmonize DWC USB3 DT nodes
 name
Message-ID: <20201020124328.GU127386@kozik-lap>
References: <20201020115959.2658-1-Sergey.Semin@baikalelectronics.ru>
 <20201020115959.2658-27-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201020115959.2658-27-Sergey.Semin@baikalelectronics.ru>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, Oct 20, 2020 at 02:59:56PM +0300, Serge Semin wrote:
> In accordance with the DWC USB3 bindings the corresponding node
> name is suppose to comply with the Generic USB HCD DT schema, which
> requires the USB nodes to have the name acceptable by the regexp:
> "^usb(@.*)?" . Make sure the "snps,dwc3"-compatible nodes are correctly
> named.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> ---
>  arch/arm64/boot/dts/exynos/exynos5433.dtsi | 4 ++--
>  arch/arm64/boot/dts/exynos/exynos7.dtsi    | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Thanks for the changes to DTSes. I'll take Exynos bits after the mege
window.

Best regards,
Krzysztof

