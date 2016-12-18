From: Robie Basak <robie@justgohome.co.uk>
Subject: Regression: CONFIG_IP_MULTICAST must now be defined in
 exynos_defconfig
Date: Sun, 18 Dec 2016 13:19:12 +0000
Message-ID: <20161218131912.GG4624@mal.justgohome.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from b-painless.mh.aa.net.uk ([81.187.30.52]:37501 "EHLO
        b-painless.mh.aa.net.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753059AbcLROCb (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 18 Dec 2016 09:02:31 -0500
Content-Disposition: inline
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Nikolay Borisov <kernel@kyup.com>

Kukjin/Krzysztof,

Nikolay's commit dcd87999d ("igmp: net: Move igmp namespace init to
correct file") regressed exynos_defconfig for me. In userspace (Ubuntu
14.04), I used libnss-mdns with v4.2(.x), but this commit stopped me
from being able to resolve local names (eg. "foo.local") published using
mDNS from elsewhere on the network in v4.9.

It looks like the commit adds extra conditional code based on
CONFIG_IP_MULTICAST. It turned out that exynos_defconfig doesn't have
CONFIG_IP_MULTICAST defined. Defining it solved my problem.

I'm using a Samsung ARM Chromebook.

I can define CONFIG_IP_MULTICAST myself easily enough, but shouldn't
this be defined in exynos_defconfig anyway?

Robie
