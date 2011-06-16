From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [RE-SEND] [PATCH 3/4] s3c-fb: Add support EXYNOS4 FIMD
Date: Thu, 16 Jun 2011 17:44:01 +0200
Message-ID: <4DFA24C1.70307@samsung.com>
References: <1307693723-14971-1-git-send-email-anand.kn@samsung.com>
 <1307693723-14971-4-git-send-email-anand.kn@samsung.com>
 <4DF39A92.5050609@gmail.com>
 <BANLkTinuAnaoo2hA6MLBDncXxXtL8NO2pg@mail.gmail.com>
 <4DF866D9.7090406@samsung.com>
 <BANLkTi=K6SJ-Scnr6wBojFaWQMZQK6YT3w@mail.gmail.com>
 <20110615100814.GD28989@n2100.arm.linux.org.uk>
 <BANLkTin1-D3en-ZpOKw2jZB0TKYt5OLsPw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:52099 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755547Ab1FPPoG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 16 Jun 2011 11:44:06 -0400
Received: from spt2.w1.samsung.com ([210.118.77.13]) by mailout3.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0LMW0073J3PFIYA0@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 16 Jun 2011 16:44:03 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LMW00MF73PE77@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 16 Jun 2011 16:44:02 +0100 (BST)
In-reply-to: <BANLkTin1-D3en-ZpOKw2jZB0TKYt5OLsPw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>, Anand Kumar N <anand.kn@samsung.com>, lethal@linux-sh.org, kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, jg1.han@samsung.com, jonghun.han@samsung.com, thomas.ab@samsung.com

On 06/15/2011 12:22 PM, Thomas Abraham wrote:
> On 15 June 2011 15:38, Russell King - ARM Linux <linux@arm.linux.org.uk> wrote:
>> On Wed, Jun 15, 2011 at 03:34:40PM +0530, Thomas Abraham wrote:
>>> Ok. Thanks for clarifying this point. In this case, maybe we could use
>>> the clk_add_alias API. With this API, we can have a instance of clock
>>> by name 'fimd' and then create a clkdev alias by name 'lcd' in the
>>> machine code. The driver can then continue to lookup with 'lcd' as the
>>> con_id.
>>
>> That's additional needless complexity.  If you don't embed the clk_lookup
>> structure in your struct clk but list out the dev/con/clk stuff separately
>> like OMAP does, you can easily assign the dev/con pairs to multiple
>> clks without hastle - and then it really doesn't matter what the clk
>> itself is called.
>>
> 
> Thanks for your suggestion Russell. The limitation in doing it the
> OMAP way is, in all Samsung machine code, all the clock instances are
> put into a array and then registered. So there is no separately named
> instance for each clock to build a dev/con/clk omap-type table.

I realize it might be quite a bit of work to convert the clock tables,
perhaps some scripts/trickery could be of help here.
I'm just wondering if this won't have to be done anyway when people
make agreement about common struct clk on ARM.

However there is a little problem that there are two clock arrays in
each Samsung platform, for clock disabled and enabled by default.
Not sure yet how to handle that cleanly.

Cheers,
Sylwester

-- 
Sylwester Nawrocki
Samsung Poland R&D Center
