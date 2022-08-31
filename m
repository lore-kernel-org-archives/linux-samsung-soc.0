Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA3EAECAAD1
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 31 Aug 2022 14:21:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231959AbiHaOVk (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 31 Aug 2022 10:21:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231964AbiHaOVj (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 31 Aug 2022 10:21:39 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id B4477B07F5
        for <linux-samsung-soc@vger.kernel.org>; Wed, 31 Aug 2022 07:21:37 -0700 (PDT)
Received: (qmail 191439 invoked by uid 1000); 31 Aug 2022 10:21:36 -0400
Date:   Wed, 31 Aug 2022 10:21:36 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, kernel test robot <lkp@intel.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Rob Herring <robh@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: hcd: remove unused hcd_name variables
Message-ID: <Yw9ucDxO7huIl/2W@rowland.harvard.edu>
References: <20220831073032.1409291-1-gregkh@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220831073032.1409291-1-gregkh@linuxfoundation.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, Aug 31, 2022 at 09:30:32AM +0200, Greg Kroah-Hartman wrote:
> In the commit 10174220f55a ("usb: reduce kernel log spam on driver
> registration") a lot of unneeded kernel log messages were removed, but
> that caused a few build warnings to show up where the variable
> `hcd_name` was being set but never used anymore.
> 
> Resolve this by just removing these variables as they are not needed
> anymore
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Alan Stern <stern@rowland.harvard.edu>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Cc: Alim Akhtar <alim.akhtar@samsung.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: linux-usb@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-samsung-soc@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Fixes: 10174220f55a ("usb: reduce kernel log spam on driver registration")
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>  drivers/usb/host/ehci-exynos.c   | 1 -
>  drivers/usb/host/ehci-platform.c | 2 --
>  drivers/usb/host/ohci-platform.c | 2 --
>  3 files changed, 5 deletions(-)

This isn't enough, as you can see from this kernel test robot excerpt:

clang_recent_errors
|-- arm-s5pv210_defconfig
|   |-- drivers-usb-host-ehci-exynos.c:warning:unused-variable-hcd_name
|   `-- drivers-usb-host-ohci-exynos.c:warning:unused-variable-hcd_name
|-- hexagon-randconfig-r024-20220830
|   |-- drivers-usb-host-ehci-atmel.c:warning:unused-variable-hcd_name
|   |-- drivers-usb-host-ehci-exynos.c:warning:unused-variable-hcd_name
|   |-- drivers-usb-host-ehci-orion.c:warning:unused-variable-hcd_name
|   |-- 
drivers-usb-host-ehci-platform.c:warning:unused-variable-hcd_name
|   |-- drivers-usb-host-ehci-spear.c:warning:unused-variable-hcd_name
|   `-- 
drivers-usb-host-ohci-platform.c:warning:unused-variable-hcd_name
|-- hexagon-randconfig-r036-20220830
|   |-- drivers-usb-host-ehci-atmel.c:warning:unused-variable-hcd_name
|   |-- drivers-usb-host-ehci-npcm7xx.c:warning:unused-variable-hcd_name
|   |-- 
drivers-usb-host-ehci-platform.c:warning:unused-variable-hcd_name
|   |-- drivers-usb-host-ehci-st.c:warning:unused-variable-hcd_name
|   |-- drivers-usb-host-ohci-at91.c:warning:unused-variable-hcd_name
|   |-- 
drivers-usb-host-ohci-platform.c:warning:unused-variable-hcd_name
|   |-- drivers-usb-host-ohci-s3c2410.c:warning:unused-variable-hcd_name
|   |-- drivers-usb-host-ohci-spear.c:warning:unused-variable-hcd_name
|   `-- drivers-usb-host-ohci-st.c:warning:unused-variable-hcd_name

Yes, it has duplicates and your patch handles some of these.  But there 
are others that still need to be fixed.  Also, this list is missing 
ohci-pxa27x.c.

Alan Stern
