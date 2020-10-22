Return-Path: <SRS0=b7Q7=D5=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B7D6C388F2
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 22 Oct 2020 11:25:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 235D3223BF
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 22 Oct 2020 11:25:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502629AbgJVLZm (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 22 Oct 2020 07:25:42 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:39968 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2444295AbgJVLZm (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 22 Oct 2020 07:25:42 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 02F19803073F;
        Thu, 22 Oct 2020 11:25:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id oelBG4RXhy7b; Thu, 22 Oct 2020 14:25:38 +0300 (MSK)
Date:   Thu, 22 Oct 2020 14:25:37 +0300
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Krzysztof Kozlowski <krzk@kernel.org>
CC:     Serge Semin <fancer.lancer@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kukjin Kim <kgene@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-samsung-soc@vger.kernel.org>
Subject: Re: [PATCH 26/29] arm64: dts: exynos: Harmonize DWC USB3 DT nodes
 name
Message-ID: <20201022112537.lvwjjxymp36sez5i@mobilestation.baikal.int>
References: <20201020115959.2658-1-Sergey.Semin@baikalelectronics.ru>
 <20201020115959.2658-27-Sergey.Semin@baikalelectronics.ru>
 <20201020124328.GU127386@kozik-lap>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20201020124328.GU127386@kozik-lap>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, Oct 20, 2020 at 02:43:28PM +0200, Krzysztof Kozlowski wrote:
> On Tue, Oct 20, 2020 at 02:59:56PM +0300, Serge Semin wrote:
> > In accordance with the DWC USB3 bindings the corresponding node
> > name is suppose to comply with the Generic USB HCD DT schema, which
> > requires the USB nodes to have the name acceptable by the regexp:
> > "^usb(@.*)?" . Make sure the "snps,dwc3"-compatible nodes are correctly
> > named.
> > 
> > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > ---
> >  arch/arm64/boot/dts/exynos/exynos5433.dtsi | 4 ++--
> >  arch/arm64/boot/dts/exynos/exynos7.dtsi    | 2 +-
> >  2 files changed, 3 insertions(+), 3 deletions(-)
> 

> Thanks for the changes to DTSes. I'll take Exynos bits after the mege
> window.

Ok. Thanks.

-Sergey

> 
> Best regards,
> Krzysztof
> 
