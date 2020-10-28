Return-Path: <SRS0=5Pkx=ED=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A611AC388F7
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 28 Oct 2020 22:23:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4B7D520709
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 28 Oct 2020 22:23:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="tyC/p008"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732791AbgJ1WXz (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 28 Oct 2020 18:23:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732781AbgJ1WXy (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 28 Oct 2020 18:23:54 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AEACC0613CF
        for <linux-samsung-soc@vger.kernel.org>; Wed, 28 Oct 2020 15:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=iGNt9q4u3C8iCvbvbTSQ7zegZDgrGY8gA6FD/mliiJc=; b=tyC/p008K/KhAYOxaqxcY7WRf
        5fd3pS3xqetPeTmL0b93VSI2MlpnAwqZtW6ekD9Qb2qKYu+Voyqo8pxBPfsdwiascoBEqzXuqGXLZ
        AypHNaBoN2W/6e2X2tKOmLh+wxKmCJ3NBuDB8pkLltSuCGSvNl4uzz29CcFAga9unjsPZea8mYXe8
        WIxQaen2lEQi/QwA/9J4RSEgN2AYhlEHamqHC3XwKocJtEGUe1oOmuqkm94WGedUXAi2tnNGpqL3n
        iJmtdXWinGZrypheUhf8+0T7dcyIWuUv8zqPOhOVYmJD9GnjRX8F8ag0JlnBk7xaFRuq/tjN0Wd1v
        BiZgnztKw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:52040)
        by pandora.armlinux.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <linux@armlinux.org.uk>)
        id 1kXlCv-0002pR-8e; Wed, 28 Oct 2020 13:09:41 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1kXlCt-00053q-Lp; Wed, 28 Oct 2020 13:09:39 +0000
Date:   Wed, 28 Oct 2020 13:09:39 +0000
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Ard Biesheuvel <ardb@kernel.org>
Cc:     Joel Stanley <joel@jms.id.au>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Nicolas Pitre <nico@fluxnic.net>,
        =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH v2 2/2] ARM: move device tree mapping out of linear region
Message-ID: <20201028130939.GM1551@shell.armlinux.org.uk>
References: <20201007083944.27910-1-ardb@kernel.org>
 <CGME20201028091912eucas1p13fb9cd947faa6bfd79199ea79648b6af@eucas1p1.samsung.com>
 <20201007083944.27910-3-ardb@kernel.org>
 <920965b8-6f87-3f82-9fce-d3051fc543ca@samsung.com>
 <CACPK8XfNfqToFBe0GPFTGrnPhNTYhSDiEagpB7ayBSW1DC-THA@mail.gmail.com>
 <CAMj1kXH90MzCUJ_DHZ_2=JcWBX=Qf1PT-A9PX9EeBTVx22EkaQ@mail.gmail.com>
 <20201028130050.GL1551@shell.armlinux.org.uk>
 <CAMj1kXFWAr+-fnThgtY_jTg1_=kmhHRS5+X6jXAG9K7GegCchg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXFWAr+-fnThgtY_jTg1_=kmhHRS5+X6jXAG9K7GegCchg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, Oct 28, 2020 at 02:04:41PM +0100, Ard Biesheuvel wrote:
> On Wed, 28 Oct 2020 at 14:01, Russell King - ARM Linux admin
> <linux@armlinux.org.uk> wrote:
> >
> > On Wed, Oct 28, 2020 at 01:52:48PM +0100, Ard Biesheuvel wrote:
> > > Does this help?
> > >
> > > diff --git a/arch/arm/include/asm/memory.h b/arch/arm/include/asm/memory.h
> > > index bb79e52aeb90..4f355bda872a 100644
> > > --- a/arch/arm/include/asm/memory.h
> > > +++ b/arch/arm/include/asm/memory.h
> > > @@ -68,8 +68,8 @@
> > >  #define XIP_VIRT_ADDR(physaddr)  (MODULES_VADDR + ((physaddr) & 0x000fffff))
> > >
> > >  #define FDT_FIXED_BASE         UL(0xff800000)
> > > -#define FDT_FIXED_SIZE         (2 * PMD_SIZE)
> > > -#define FDT_VIRT_ADDR(physaddr)        ((void *)(FDT_FIXED_BASE |
> > > (physaddr) % PMD_SIZE))
> > > +#define FDT_FIXED_SIZE         (2 * SECTION_SIZE)
> > > +#define FDT_VIRT_ADDR(physaddr)        ((void *)(FDT_FIXED_BASE |
> > > (physaddr) % SECTION_SIZE))
> >
> > Is this correct? If the FDT fixed size is 2x, why does FDT_VIRT_ADDR()
> > only work for half of it?
> >
> 
> Perhaps the naming is confusing. This is only used to obtain the start
> of the virtually mapped DT, which amounts to the virtual address of
> the section plus the physical address modulo the section size.
> 
> I will rename physaddr to physbase when I respin this as a patch.
> Shall I rename FDT_VIRT_ADDR to FDT_VIRT_BASE as well?

Yes please, I think that makes it clearer what is going on here.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
