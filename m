From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: Re: [PATCH v5 4/4] drivers/rtc/rtc-s5m.c: add support for S2MPS15 RTC
Date: Mon, 2 Nov 2015 11:19:31 +0100
Message-ID: <20151102101931.GK22331@piout.net>
References: <1446186334-16510-1-git-send-email-alim.akhtar@samsung.com>
 <1446186334-16510-5-git-send-email-alim.akhtar@samsung.com>
 <20151101174048.GD22331@piout.net>
 <5636A44D.4090908@samsung.com>
 <20151102004722.GI22331@piout.net>
 <20151102090359.GR4058@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from down.free-electrons.com ([37.187.137.238]:43122 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1752107AbbKBKTf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 Nov 2015 05:19:35 -0500
Content-Disposition: inline
In-Reply-To: <20151102090359.GR4058@x1>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, broonie@kernel.org, linux-samsung-soc@vger.kernel.org, rtc-linux@googlegroups.com, linux-kernel@vger.kernel.org

On 02/11/2015 at 09:03:59 +0000, Lee Jones wrote :
> > > I think you cannot apply it directly because it depends on headers from
> > > patch 2/4. It won't build.
> > > 
> > 
> > Yeah, this depends on the mfd tree. I don't thin Lee applied patch 2/4
> > yet so I'm taking that one for 4.5.
> 
> I don't mind if you take it, but if you do so you need to take the
> Regulator patch as well AND provide Mark and I a pull-request from an
> immutable branch please. 
> 

Actually, I was thinking that you would take 2/4 through your tree and I
would either base myself on that or delay the patch for 4.5. You could
also take the rtc patch if you plan to apply 2/4, feel free to add my
acked-by.

-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
