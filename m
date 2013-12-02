From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [RFC PATCH] clk: samsung: add support for multiple clock providers
Date: Mon, 02 Dec 2013 16:06:24 +0100
Message-ID: <3869121.7qly6TIYcg@amdc1227>
References: <1385963716-20045-1-git-send-email-rahul.sharma@samsung.com>
 <1874542.EOuUcEDkzz@amdc1227>
 <CAPdUM4OSWyRGC2jLuP9JsOOSMgV+ML219v+RDhTOXi5Xg60hiw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:65359 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752254Ab3LBPGe (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 Dec 2013 10:06:34 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MX6007RGPYVU720@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 02 Dec 2013 15:06:31 +0000 (GMT)
In-reply-to: <CAPdUM4OSWyRGC2jLuP9JsOOSMgV+ML219v+RDhTOXi5Xg60hiw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rahul Sharma <r.sh.open@gmail.com>
Cc: Rahul Sharma <rahul.sharma@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Mike Turquette <mturquette@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>, sunil joshi <joshi@samsung.com>

On Monday 02 of December 2013 20:19:52 Rahul Sharma wrote:
> Thanks Tomasz,
> 
> On 2 December 2013 19:39, Tomasz Figa <t.figa@samsung.com> wrote:
> > Hi Rahul,
> >
> > On Monday 02 of December 2013 11:25:16 Rahul Sharma wrote:
> >> Samsung CCF helper functions doesn't provide support to
> >> register multiple Clock Providers for a given SoC. Due to
> >> this limitation soc platforms are not able to use these
> >> helpers for registering multiple clock providers and forced
> >> to bypass this layer.
> >
> > This might make sense indeed, but I don't see any use cases for it
> > at the moment. Do you have anything in particular in mind?
> >
> 
> We had 2 clock providers (cmu and audss ) in 5420. In 5260, we had
> 12 CMUs (top, egl, kfc, aud ...) which are physically independent and
> mapped at non-contiguous phy-addresses. I am going to post the basic
> patch set to add support for 5260 including clock file, which based on the
> following RFC patch.

OK, thanks for the explanation. So I guess support for the SoC itself
is coming to the mainline too?

> 
> > Also this is somehow ugly to require passing device_node to every function
> > even when DT is not used. Instead, I would make samsung_clk_init() return
> > the context pointer, which would be then passed to other functions. This
> > would also eliminate the need to add private infrastructure mapping nodes
> > into context pointers.
> >
> 
> yea correct. Sounds better. I will change it as you suggested.

OK.

> 
> > One more thing is the name of clk_provider_context struct. It sounds too
> > generic for a Samsung specific structure. IMHO samsung_clk_provider would
> > be much better.
> 
> I named it simple as it is already defined in samsung/clk.c.
> samsung_clk_provider
> also seems good to me.

OK.

Best regards,
Tomasz
