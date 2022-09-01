Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 559E3ECAAD3
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  1 Sep 2022 13:53:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231351AbiIANxt (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 1 Sep 2022 09:53:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234043AbiIANxj (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 1 Sep 2022 09:53:39 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 690812B1;
        Thu,  1 Sep 2022 06:53:38 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 1BBB4B826E3;
        Thu,  1 Sep 2022 13:53:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22043C433C1;
        Thu,  1 Sep 2022 13:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1662040415;
        bh=maj09gBjgscBkimh9rmhEf4vQtAIsp/gFrKj8Dk/SMc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ER2mMSX7WIaCZk/ViG3Pj/CXpVATHmCLMeUgxwozwckOUik86kZiChQGC5NXMWbiH
         tdbW3Q7tw30yl6Cjj93D+UPPSpteRSzWpPtQffjN1j67unQtAigqeIlv+GJOImfge1
         pYWvbaUeXE+OnfhgRW5GDYdh6TkP25Xy8w+lNnyc=
Date:   Thu, 1 Sep 2022 15:53:32 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org, kernel test robot <lkp@intel.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Rob Herring <robh@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: hcd: remove unused hcd_name variables
Message-ID: <YxC5XCnJaYQPWAMP@kroah.com>
References: <20220831073032.1409291-1-gregkh@linuxfoundation.org>
 <Yw9ucDxO7huIl/2W@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yw9ucDxO7huIl/2W@rowland.harvard.edu>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, Aug 31, 2022 at 10:21:36AM -0400, Alan Stern wrote:
> On Wed, Aug 31, 2022 at 09:30:32AM +0200, Greg Kroah-Hartman wrote:
> > In the commit 10174220f55a ("usb: reduce kernel log spam on driver
> > registration") a lot of unneeded kernel log messages were removed, but
> > that caused a few build warnings to show up where the variable
> > `hcd_name` was being set but never used anymore.
> > 
> > Resolve this by just removing these variables as they are not needed
> > anymore
> > 
> > Reported-by: kernel test robot <lkp@intel.com>
> > Cc: Ard Biesheuvel <ardb@kernel.org>
> > Cc: Alan Stern <stern@rowland.harvard.edu>
> > Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Cc: Alim Akhtar <alim.akhtar@samsung.com>
> > Cc: Rob Herring <robh@kernel.org>
> > Cc: linux-usb@vger.kernel.org
> > Cc: linux-arm-kernel@lists.infradead.org
> > Cc: linux-samsung-soc@vger.kernel.org
> > Cc: linux-kernel@vger.kernel.org
> > Fixes: 10174220f55a ("usb: reduce kernel log spam on driver registration")
> > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > ---
> >  drivers/usb/host/ehci-exynos.c   | 1 -
> >  drivers/usb/host/ehci-platform.c | 2 --
> >  drivers/usb/host/ohci-platform.c | 2 --
> >  3 files changed, 5 deletions(-)
> 
> This isn't enough, as you can see from this kernel test robot excerpt:
> 
> clang_recent_errors
> |-- arm-s5pv210_defconfig
> |   |-- drivers-usb-host-ehci-exynos.c:warning:unused-variable-hcd_name
> |   `-- drivers-usb-host-ohci-exynos.c:warning:unused-variable-hcd_name
> |-- hexagon-randconfig-r024-20220830
> |   |-- drivers-usb-host-ehci-atmel.c:warning:unused-variable-hcd_name
> |   |-- drivers-usb-host-ehci-exynos.c:warning:unused-variable-hcd_name
> |   |-- drivers-usb-host-ehci-orion.c:warning:unused-variable-hcd_name
> |   |-- 
> drivers-usb-host-ehci-platform.c:warning:unused-variable-hcd_name
> |   |-- drivers-usb-host-ehci-spear.c:warning:unused-variable-hcd_name
> |   `-- 
> drivers-usb-host-ohci-platform.c:warning:unused-variable-hcd_name
> |-- hexagon-randconfig-r036-20220830
> |   |-- drivers-usb-host-ehci-atmel.c:warning:unused-variable-hcd_name
> |   |-- drivers-usb-host-ehci-npcm7xx.c:warning:unused-variable-hcd_name
> |   |-- 
> drivers-usb-host-ehci-platform.c:warning:unused-variable-hcd_name
> |   |-- drivers-usb-host-ehci-st.c:warning:unused-variable-hcd_name
> |   |-- drivers-usb-host-ohci-at91.c:warning:unused-variable-hcd_name
> |   |-- 
> drivers-usb-host-ohci-platform.c:warning:unused-variable-hcd_name
> |   |-- drivers-usb-host-ohci-s3c2410.c:warning:unused-variable-hcd_name
> |   |-- drivers-usb-host-ohci-spear.c:warning:unused-variable-hcd_name
> |   `-- drivers-usb-host-ohci-st.c:warning:unused-variable-hcd_name
> 
> Yes, it has duplicates and your patch handles some of these.  But there 
> are others that still need to be fixed.  Also, this list is missing 
> ohci-pxa27x.c.

Ick, ok, I went off of a different kbuild report.  Let me fix this up
later today...

greg k-h
