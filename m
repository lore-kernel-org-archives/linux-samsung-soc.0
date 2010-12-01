From: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: Re: [PATCH v5] ARM: s3c244x: Fix mess with gpio {set,get}_pull callbacks
Date: Wed, 1 Dec 2010 14:16:00 +0200
Message-ID: <201012011416.01065.anarsoul@gmail.com>
References: <4CF55785.5090403@metafoo.de> <201012011217.41602.anarsoul@gmail.com> <003c01cb914f$fc6d3350$f54799f0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ey0-f174.google.com ([209.85.215.174]:44439 "EHLO
	mail-ey0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751526Ab0LAMQ1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 1 Dec 2010 07:16:27 -0500
Received: by eye27 with SMTP id 27so3391715eye.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 01 Dec 2010 04:16:26 -0800 (PST)
In-Reply-To: <003c01cb914f$fc6d3350$f54799f0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Lars-Peter Clausen' <lars@metafoo.de>, 'Ben Dooks' <ben-linux@fluff.org>, 'Russell King' <linux@arm.linux.org.uk>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 'Abdoulaye Walsimou GAYE' <awg@embtoolkit.org>

On Wednesday 01 December 2010 14:05:00 Kukjin Kim wrote:
> Yeah, right...it depends on each SoCs. But, if there is no setup it in
> map_io(), there is no functions of set_pull() and get_pull(). As you know,
> used s3c_gpio_{set,get}pull_1up as default before your patch...
> 
> Hmm...however, I will think about its necessity again.

In this case it will fail if SoC does not support pull up, so does it matter 
how it will fail?
 
> Ok..I will do it and will apply.
> Then, will be sent to Linus during 37-rc.

Thanks

Regards
Vasily
