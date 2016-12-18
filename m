From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: Regression: CONFIG_IP_MULTICAST must now be defined in
 exynos_defconfig
Date: Sun, 18 Dec 2016 18:49:45 +0200
Message-ID: <20161218164945.GA3662@kozik-lap>
References: <20161218131912.GG4624@mal.justgohome.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wj0-f195.google.com ([209.85.210.195]:35320 "EHLO
        mail-wj0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754247AbcLRQtu (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 18 Dec 2016 11:49:50 -0500
Received: by mail-wj0-f195.google.com with SMTP id he10so20735489wjc.2
        for <linux-samsung-soc@vger.kernel.org>; Sun, 18 Dec 2016 08:49:50 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20161218131912.GG4624@mal.justgohome.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Robie Basak <robie@justgohome.co.uk>
Cc: Kukjin Kim <kgene@kernel.org>, linux-samsung-soc@vger.kernel.org, Nikolay Borisov <kernel@kyup.com>

On Sun, Dec 18, 2016 at 01:19:12PM +0000, Robie Basak wrote:
> Kukjin/Krzysztof,
> 
> Nikolay's commit dcd87999d ("igmp: net: Move igmp namespace init to
> correct file") regressed exynos_defconfig for me. In userspace (Ubuntu
> 14.04), I used libnss-mdns with v4.2(.x), but this commit stopped me
> from being able to resolve local names (eg. "foo.local") published using
> mDNS from elsewhere on the network in v4.9.
> 
> It looks like the commit adds extra conditional code based on
> CONFIG_IP_MULTICAST. It turned out that exynos_defconfig doesn't have
> CONFIG_IP_MULTICAST defined. Defining it solved my problem.
> 
> I'm using a Samsung ARM Chromebook.
> 
> I can define CONFIG_IP_MULTICAST myself easily enough, but shouldn't
> this be defined in exynos_defconfig anyway?

(from my correct email address)

Hi Robie,

I don't have any objections against enabling IP_MULTICAST in
exynos_defconfig. It seems indeed essential.

You are more than welcomed to send a patch for this.

If you don't want to do that, I can prepare one with your "Reported-by"
credits.

Best regards,
Krzysztof
