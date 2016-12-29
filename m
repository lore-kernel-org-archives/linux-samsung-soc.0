From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] ARM: exynos_defconfig: enable IP multicast
Date: Thu, 29 Dec 2016 16:06:04 +0200
Message-ID: <20161229140604.lqzdaks2rlmiqzzu@kozik-lap>
References: <20161218131912.GG4624@mal.justgohome.co.uk>
 <20161218164945.GA3662@kozik-lap>
 <20161219005224.GH4624@mal.justgohome.co.uk>
 <20161219005637.GI4624@mal.justgohome.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:34704 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752311AbcL2OGK (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 29 Dec 2016 09:06:10 -0500
Received: by mail-lf0-f65.google.com with SMTP id d16so20063519lfb.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 29 Dec 2016 06:06:09 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20161219005637.GI4624@mal.justgohome.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Robie Basak <robie@justgohome.co.uk>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, linux-samsung-soc@vger.kernel.org, Nikolay Borisov <kernel@kyup.com>

On Mon, Dec 19, 2016 at 12:56:37AM +0000, Robie Basak wrote:
> Prior to Nikolay's commit dcd87999d, libnss-mdns (eg. to resolve
> "foo.local" on the LAN using mDNS) worked without CONFIG_IP_MULTICAST
> defined, but dcd87999d caused it to stop working without having
> CONFIG_IP_MULTICAST defined explicitly.
> 
> Since exynos_defconfig did not previously define CONFIG_IP_MULTICAST,
> mDNS used to work for users building with just exynos_defconfig, but
> stopped working from dcd87999d.
> 
> Define CONFIG_IP_MULTICAST explicitly in exynos_defconfig as it appears
> essential anyway.
> 
> Signed-off-by: Robie Basak <robie@justgohome.co.uk>
> ---
>  arch/arm/configs/exynos_defconfig | 1 +
>  1 file changed, 1 insertion(+)

Thanks, applied.

Best regards,
Krzysztof
