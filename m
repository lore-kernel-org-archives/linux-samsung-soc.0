From: Robie Basak <robie@justgohome.co.uk>
Subject: Re: Regression: CONFIG_IP_MULTICAST must now be defined in
 exynos_defconfig
Date: Mon, 19 Dec 2016 00:52:24 +0000
Message-ID: <20161219005224.GH4624@mal.justgohome.co.uk>
References: <20161218131912.GG4624@mal.justgohome.co.uk>
 <20161218164945.GA3662@kozik-lap>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from b-painless.mh.aa.net.uk ([81.187.30.52]:46052 "EHLO
        b-painless.mh.aa.net.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752549AbcLSAwe (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 18 Dec 2016 19:52:34 -0500
Content-Disposition: inline
In-Reply-To: <20161218164945.GA3662@kozik-lap>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Kukjin Kim <kgene@kernel.org>, linux-samsung-soc@vger.kernel.org, Nikolay Borisov <kernel@kyup.com>

Hi Krzysztof,

On Sun, Dec 18, 2016 at 06:49:45PM +0200, Krzysztof Kozlowski wrote:
> On Sun, Dec 18, 2016 at 01:19:12PM +0000, Robie Basak wrote:
> > I can define CONFIG_IP_MULTICAST myself easily enough, but shouldn't
> > this be defined in exynos_defconfig anyway?
> 
> (from my correct email address)

Ah, sorry. I failed to update to the current MAINTAINERS file.

> You are more than welcomed to send a patch for this.

Patch to follow. Thanks!

Robie
