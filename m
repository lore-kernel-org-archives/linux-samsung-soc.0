From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] ARM: dts: add interrupt-names property to get interrupt resource by name
Date: Tue, 19 Mar 2013 00:00:14 +0100
Message-ID: <1527181.4g75O5bCOz@wuerfel>
References: <1363173980-11428-1-git-send-email-vikas.sajjan@linaro.org> <514758C3.7070601@wwwdotorg.org> <514794D7.3060903@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.171]:59183 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754748Ab3CRXAc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 18 Mar 2013 19:00:32 -0400
In-Reply-To: <514794D7.3060903@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: devicetree-discuss@lists.ozlabs.org
Cc: Rob Herring <robherring2@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, linux-samsung-soc@vger.kernel.org, l.krishna@samsung.com, joshi@samsung.com, inki.dae@samsung.com, kgene.kim@samsung.com, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, Vikas Sajjan <vikas.sajjan@linaro.org>, linaro-kernel@lists.linaro.org

On Monday 18 March 2013 17:27:35 Rob Herring wrote:
> 
> I think it depends on the specific name the property is tied too. For
> interrupt and reg properties which have a long history and convention,
> the order should be defined. IIRC, this was Grant's position too. For
> new bindings, perhaps we can be more lenient.

At least in case of the dmaengine binding, order is not significant
and cannot be, because you may have multiple DMA specifiers referring
to the a output of the slave device connected to multiple dma engines,
and we require that they all use the same name in that case.

	Arnd
