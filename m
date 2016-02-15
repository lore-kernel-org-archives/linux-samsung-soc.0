From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: Re: [rtc-linux] [PATCH] rtc: s3c: Document required clocks in the DT
 binding
Date: Mon, 15 Feb 2016 14:41:10 +0100
Message-ID: <20160215134110.GA15219@piout.net>
References: <1455038632-14545-1-git-send-email-javier@osg.samsung.com>
 <56C01FDD.9050204@samsung.com>
 <56C1C95E.7030002@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from down.free-electrons.com ([37.187.137.238]:57974 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1751298AbcBONlN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 15 Feb 2016 08:41:13 -0500
Content-Disposition: inline
In-Reply-To: <56C1C95E.7030002@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, rtc-linux@googlegroups.com, linux-kernel@vger.kernel.org, k.kozlowski.k@gmail.com, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Alessandro Zummo <a.zummo@towertech.it>

On 15/02/2016 at 09:49:34 -0300, Javier Martinez Canillas wrote :
> >No, not entirely. The samsung,s3c6410-rtc needs rtc and rtc_src clocks
> >but rest of compatible devices need only rtc clock.
> >
> 
> Right, sorry for missing that. I noticed that this patch has already
> been picked by Rob Herring (I thought it would be picked by Alexandre
> though) so I will post a follow up patch explaining that rtc_src is
> only for the s3c6410-rtc compatible.
> 

Yeah, I was going to take it, thanks for pointing out the Rob already
has it in his tree.


-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
