Return-Path: <SRS0=5lYo=CE=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 348C3C433DF
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 26 Aug 2020 16:07:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1F1A82075E
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 26 Aug 2020 16:07:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726887AbgHZQH0 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 26 Aug 2020 12:07:26 -0400
Received: from vps0.lunn.ch ([185.16.172.187]:53144 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726763AbgHZQHY (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 26 Aug 2020 12:07:24 -0400
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
        (envelope-from <andrew@lunn.ch>)
        id 1kAxxD-00By1C-Em; Wed, 26 Aug 2020 18:07:15 +0200
Date:   Wed, 26 Aug 2020 18:07:15 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     David Laight <David.Laight@ACULAB.COM>
Cc:     'Lukasz Stelmach' <l.stelmach@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Kukjin Kim <kgene@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>,
        "b.zolnierkie@samsung.com" <b.zolnierkie@samsung.com>
Subject: Re: [PATCH 1/3] net: ax88796c: ASIX AX88796C SPI Ethernet Adapter
 Driver
Message-ID: <20200826160715.GV2403519@lunn.ch>
References: <20200825184413.GA2693@kozik-lap>
 <CGME20200826145929eucas1p1367c260edb8fa003869de1da527039c0@eucas1p1.samsung.com>
 <dleftja6yhv4g2.fsf%l.stelmach@samsung.com>
 <1efebb42c30a4c40bf91649d83d60e1c@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1efebb42c30a4c40bf91649d83d60e1c@AcuMS.aculab.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

> (I can't imagine SPI being fast enough to be useful for ethernet...)

There are plenty of IoT things which only need a few kbit/s.

A VoIP phone can probably get by with 128Kbps, which a 50Mbps SPI bus
has no problem to provide, etc.

      Andrew
