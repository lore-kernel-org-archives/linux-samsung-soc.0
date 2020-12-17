Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44CDCC4361B
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 17 Dec 2020 19:09:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EC7BE239EE
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 17 Dec 2020 19:09:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727063AbgLQTIh (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 17 Dec 2020 14:08:37 -0500
Received: from mail.kernel.org ([198.145.29.99]:45790 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725468AbgLQTIh (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 17 Dec 2020 14:08:37 -0500
Date:   Thu, 17 Dec 2020 11:07:54 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1608232076;
        bh=+dRzdq8awJ0/1o0rLgSQkpay+Vk7ovTPqC3kYo+boG8=;
        h=From:To:Cc:Subject:In-Reply-To:References:From;
        b=GTGQnXcVbdz2nfgFZg859yyPH/zauxBwumjTnpAVCfAp0xGcD0s/UdUbjugkimSEH
         PO2DmmJiznRmm/u+HRaOlddyY9pW1vsbfrCNwlO0pOH5x8ep1l73HMgQ2lsetsdZt+
         GmirCp5NSBf0l7j7q2jsIoXO+5TmOzq5tHFDfGmF25tPoChrTrJ3AvCxuhPmt2fUzC
         K1C1GKbcOiFxxdvSJ3ay6ZxPbiwhnyxfEPVR6VODWY8MTRt3LpPp8D3JFoFlCjL65q
         4V+cdNrb14p/qpAmOjjOuPqVkXqv4VA7MTyL71ybKESFozi9QpdHx6G0X2AgPtNl69
         2RBwhhkQciuyQ==
From:   Jakub Kicinski <kuba@kernel.org>
To:     =?UTF-8?B?xYF1a2Fzeg==?= Stelmach <l.stelmach@samsung.com>
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
Subject: Re: [PATCH v9 0/3] AX88796C SPI Ethernet Adapter
Message-ID: <20201217110754.179466f6@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20201217115330.28431-1-l.stelmach@samsung.com>
References: <CGME20201217115341eucas1p11b7d1ffe89f9411223523eb5b5da170a@eucas1p1.samsung.com>
        <20201217115330.28431-1-l.stelmach@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, 17 Dec 2020 12:53:27 +0100 =C5=81ukasz Stelmach wrote:
> This is a driver for AX88796C Ethernet Adapter connected in SPI mode as
> found on ARTIK5 evaluation board. The driver has been ported from a
> v3.10.9 vendor kernel for ARTIK5 board.

# Form letter - net-next is closed

We have already sent the networking pull request for 5.11 and therefore
net-next is closed for new drivers, features, code refactoring and
optimizations. We are currently accepting bug fixes only.

Please repost when net-next reopens after 5.11-rc1 is cut.

Look out for the announcement on the mailing list or check:
http://vger.kernel.org/~davem/net-next.html

RFC patches sent for review only are obviously welcome at any time.
