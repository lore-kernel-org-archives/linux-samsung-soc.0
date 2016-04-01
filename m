From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 1/2] phy: Group vendor specific phy drivers
Date: Fri, 1 Apr 2016 17:09:19 +0530
Message-ID: <20160401113919.GC2987@vireshk-i7>
References: <1459510156-9147-1-git-send-email-gautam.vivek@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pf0-f177.google.com ([209.85.192.177]:32799 "EHLO
	mail-pf0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754027AbcDALjX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 1 Apr 2016 07:39:23 -0400
Received: by mail-pf0-f177.google.com with SMTP id 4so92780637pfd.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 01 Apr 2016 04:39:22 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1459510156-9147-1-git-send-email-gautam.vivek@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vivek Gautam <gautam.vivek@samsung.com>
Cc: vireshk@kernel.org, shiraz.linux.kernel@gmail.com, kishon@ti.com, heiko@sntech.de, maxime.ripard@free-electrons.com, wens@csie.org, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org, spear-devel@list.st.com, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org, cpgs@samsung.com

On 01-04-16, 16:59, Vivek Gautam wrote:
> Adding vendor specific directories in phy to group
> phy drivers under their respective vendor umbrella.
> 
> Signed-off-by: Vivek Gautam <gautam.vivek@samsung.com>
> ---
>  drivers/phy/{ => st}/phy-spear1310-miphy.c        |   0
>  drivers/phy/{ => st}/phy-spear1340-miphy.c        |   0
>  rename drivers/phy/{ => st}/phy-spear1310-miphy.c (100%)
>  rename drivers/phy/{ => st}/phy-spear1340-miphy.c (100%)
> 

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
