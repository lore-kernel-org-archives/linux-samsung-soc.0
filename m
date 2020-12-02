Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B14A0C64E7B
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  2 Dec 2020 17:19:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4B9F2221E9
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  2 Dec 2020 17:19:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389074AbgLBRTf (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 2 Dec 2020 12:19:35 -0500
Received: from mail.kernel.org ([198.145.29.99]:38520 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389070AbgLBRTf (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 2 Dec 2020 12:19:35 -0500
Date:   Wed, 2 Dec 2020 09:18:52 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606929534;
        bh=gdrIoUwM4Jc/bJ/Co4EbSzcZQeThPm4Zexr4TFqA+CM=;
        h=From:To:Cc:Subject:In-Reply-To:References:From;
        b=oBN3nitMLZKbd6AWlOeY3V9jesJoJpzC+hiz6NaZY21ZoXjGC+0jhss9M1MNakmaw
         K0jlcJAPBGJP5evgjM8/V6GCtJ4sAAzwUrsBQ8Fg5lE+nh+jK32xSWsT5ABnAJ2ggl
         /TvUmkv9rnLcfbTgbcezyUFVU2ZWFxJ6b6z+KM7E=
From:   Jakub Kicinski <kuba@kernel.org>
To:     Lukasz Stelmach <l.stelmach@samsung.com>
Cc:     Andrew Lunn <andrew@lunn.ch>, jim.cromie@gmail.com,
        Heiner Kallweit <hkallweit1@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Rob Herring <robh+dt@kernel.org>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        =?UTF-8?B?QmFydMWCb21pZWogxbtvbG5pZXJr?= =?UTF-8?B?aWV3aWN6?= 
        <b.zolnierkie@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH v7 3/3] net: ax88796c: ASIX AX88796C SPI Ethernet
 Adapter Driver
Message-ID: <20201202091852.69a02069@kicinski-fedora-pc1c0hjn.DHCP.thefacebook.com>
In-Reply-To: <dleftj8sageb97.fsf%l.stelmach@samsung.com>
References: <20201125132621.628ac98b@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
        <CGME20201202104645eucas1p25335c0b07b106f932006f2a5bce88b6e@eucas1p2.samsung.com>
        <dleftj8sageb97.fsf%l.stelmach@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, 02 Dec 2020 11:46:28 +0100 Lukasz Stelmach wrote:
> >> +	status = netif_rx(skb);  
> >
> > If I'm reading things right this is in process context, so netif_rx_ni()
> >  
> 
> Is it? The stack looks as follows
> 
>     ax88796c_skb_return()
>     ax88796c_rx_fixup()
>     ax88796c_receive()
>     ax88796c_process_isr()
>     ax88796c_work()
> 
> and ax88796c_work() is a scheduled in the system_wq.

Are you asking if work queue gets run in process context? It does.

> >> +	if (status != NET_RX_SUCCESS)
> >> +		netif_info(ax_local, rx_err, ndev,
> >> +			   "netif_rx status %d\n", status);  
> >
> > Again, it's inadvisable to put per packet prints without any rate
> > limiting in the data path.  
> 
> Even if limmited by the msglvl flag, which is off by default?

I'd err on the side of caution, but up to you.
