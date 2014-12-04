From: Kevin Hilman <khilman@kernel.org>
Subject: Re: [PATCH] ARM: dts: Add dts file for odroid XU3 board
Date: Wed, 03 Dec 2014 20:40:04 -0800
Message-ID: <7hlhmoxc2j.fsf@deeprootsystems.com>
References: <1417438770-28696-1-git-send-email-sjoerd.simons@collabora.co.uk>
	<7hzjb4y0gp.fsf@deeprootsystems.com>
	<1417638971.21830.42.camel@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f182.google.com ([209.85.192.182]:34813 "EHLO
	mail-pd0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751896AbaLDEkH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 3 Dec 2014 23:40:07 -0500
Received: by mail-pd0-f182.google.com with SMTP id r10so16987872pdi.27
        for <linux-samsung-soc@vger.kernel.org>; Wed, 03 Dec 2014 20:40:07 -0800 (PST)
In-Reply-To: <1417638971.21830.42.camel@collabora.co.uk> (Sjoerd Simons's
	message of "Wed, 03 Dec 2014 21:36:11 +0100")
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sjoerd Simons <sjoerd.simons@collabora.co.uk>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Sjoerd Simons <sjoerd.simons@collabora.co.uk> writes:

> On Wed, 2014-12-03 at 11:53 -0800, Kevin Hilman wrote:
>> Sjoerd Simons <sjoerd.simons@collabora.co.uk> writes:
>> Tried this on top of linux-next (next-20141125 and next20141203) and
>> boots fine on my odroid-xu3. 
>> 
>> Thanks for doing this, I've been meaning to get a DTS upstream for this
>> platform myself.  I also noticed that the imprecise aborts I've been
>> seeing when booting this board with the smdk5420 DTS are gone, so I
>> don't have to dig into those now either.  Thanks!  :)
>
> For completeness, the problem with running the smdk5420 DTS on the XU3
> is that the XU3 runs secure firmware while the SMD5420 doesn't.. Hence
> the imprecise aborts you were seeing.

OK, that's what I suspected but didn't take the time to verify.  Thanks
for the update.

BTW, I'll have some DTS updates for the xu3 to enable the on-board
INA2xx current sensors for easy power measurements without external
instrumentation.  Will send a patch for those soon.

Kevin
