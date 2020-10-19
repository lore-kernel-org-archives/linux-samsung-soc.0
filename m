Return-Path: <SRS0=F6EI=D2=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6999FC433DF
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 19 Oct 2020 13:02:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1943A222E8
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 19 Oct 2020 13:02:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727482AbgJSNCZ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 19 Oct 2020 09:02:25 -0400
Received: from vps0.lunn.ch ([185.16.172.187]:34718 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726336AbgJSNCZ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 19 Oct 2020 09:02:25 -0400
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
        (envelope-from <andrew@lunn.ch>)
        id 1kUUnn-002V2W-Mg; Mon, 19 Oct 2020 15:02:15 +0200
Date:   Mon, 19 Oct 2020 15:02:15 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Lukasz Stelmach <l.stelmach@samsung.com>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Kukjin Kim <kgene@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Russell King <linux@armlinux.org.uk>, jim.cromie@gmail.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org,
        =?utf-8?Q?Bart=C5=82omiej_=C5=BBolnierkiewicz?= 
        <b.zolnierkie@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH v2 2/4] net: ax88796c: ASIX AX88796C SPI Ethernet Adapter
 Driver
Message-ID: <20201019130215.GR139700@lunn.ch>
References: <20201002203641.GI3996795@lunn.ch>
 <CGME20201019125624eucas1p257a76c307adfb27202332658f93c9aba@eucas1p2.samsung.com>
 <dleftjh7qq4bo7.fsf%l.stelmach@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dleftjh7qq4bo7.fsf%l.stelmach@samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

> I looked and I looked and I didn't see how I could reasonably manage
> asynchronous start_xmit calls, the work queue also supports at the
> moment.

O.K, keep it, since it has other uses. If it was just for interrupt
handling, threaded IRQs could of simplified the code. But it looks
like you cannot make that simplification.

     Andrew
