Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAC25C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  6 Apr 2022 01:20:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236634AbiDFBVz (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 5 Apr 2022 21:21:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1446407AbiDEPof (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 5 Apr 2022 11:44:35 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D9FF1F55EC;
        Tue,  5 Apr 2022 07:15:07 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8D38723A;
        Tue,  5 Apr 2022 07:15:07 -0700 (PDT)
Received: from bogus (unknown [10.57.43.163])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4847D3F5A1;
        Tue,  5 Apr 2022 07:15:03 -0700 (PDT)
Date:   Tue, 5 Apr 2022 15:15:00 +0100
From:   Sudeep Holla <sudeep.holla@arm.com>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Russell King <linux@armlinux.org.uk>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Hartley Sweeten <hsweeten@visionengravers.com>,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        Hubert Feurstein <hubert.feurstein@contec.at>,
        Lukasz Majewski <lukma@denx.de>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Imre Kaloz <kaloz@openwrt.org>,
        Krzysztof Halasa <khalasa@piap.pl>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Simtec Linux Team <linux@simtec.co.uk>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH 01/12] ARM: versatile: move integrator/realview/vexpress
 to versatile
Message-ID: <20220405141500.ixjl6qsy4cczghgt@bogus>
References: <20220405091750.3076973-1-arnd@kernel.org>
 <20220405091750.3076973-2-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220405091750.3076973-2-arnd@kernel.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, Apr 05, 2022 at 11:17:39AM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> These are all fairly small platforms by now, and they are
> closely related. Just move them all into a single directory.
> 

I had forgotten about this. When do you plan to merge this ? I guess for
v5.19. The reason I ask is that one of the branch triggered loads of
kernel-doc warning[1] and I was bit confused with the file path. I did post
the fix[2] for kernel-doc and was planning to send it as fix for v5.18, but
let me know what do you prefer as it conflicts with this patch.

-- 
Regards,
Sudeep

[1] https://lore.kernel.org/linux-doc/202204031026.4ogKxt89-lkp@intel.com/
[2] https://lore.kernel.org/all/20220404130207.1162445-1-sudeep.holla@arm.com/

