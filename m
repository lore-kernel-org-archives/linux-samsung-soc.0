From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH V4 2/2] video: exynos_dp: device tree documentation
Date: Thu, 11 Oct 2012 12:01:13 +0200
Message-ID: <507698E9.7050007@samsung.com>
References: <1349824101-32574-1-git-send-email-ajaykumar.rs@samsung.com>
 <1349824101-32574-3-git-send-email-ajaykumar.rs@samsung.com>
 <50749727.1020103@gmail.com>
 <CAEC9eQO5s5VG_qwRbH4K7TD_Z_rYbks=s_GEOfY3TxDMk7gPzw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:40322 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756663Ab2JKKBR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 11 Oct 2012 06:01:17 -0400
In-reply-to: <CAEC9eQO5s5VG_qwRbH4K7TD_Z_rYbks=s_GEOfY3TxDMk7gPzw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ajay kumar <ajaynumb@gmail.com>
Cc: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, Ajay Kumar <ajaykumar.rs@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-fbdev@vger.kernel.org, jg1.han@samsung.com, devicetree-discuss@lists.ozlabs.org, FlorianSchandinat@gmx.de, tomasz.figa@gmail.com, thomas.ab@samsung.com

On 10/11/2012 08:50 AM, Ajay kumar wrote:
>>> +     -samsung,interlaced:
>>> +             Interlace scan mode.
>>> +                     Progressive if defined, Interlaced if not defined
>>> +     -samsung,v_sync_polarity:
>>> +             VSYNC polarity configuration.
>>> +                     High if defined, Low if not defined
>>> +     -samsung,h_sync_polarity:
>>> +             HSYNC polarity configuration.
>>> +                     High if defined, Low if not defined
>>
>> So there is no common video bindings for things like these two ?
>> In V4L2 we decided to use vsync-active, hsync-active [1], the video
>> timings bindings [2] use hsync-active-high, hsync-active-high boolean
>> properties. Perhaps it is worth to pick some of those standard
>> definitions and use instead of the vendor specific ones ?

> hsync-active-high and vsync-active-high seems to hold good in our case.
> Also, are you asking us to just use only the standard names or use standard
> helper functions as well? Since we use only hsync and vsync polarity and no
> other LCD timing properties, I think we need not use standard helper functions
> for parsing display timings!

My point was just to use common property names where possible. Any parsing
helpers could be created afterwards, if you would rather avoid doing that
right now. BTW, it seems 'interlaced' could also be reused.

...
>> [1] http://www.mail-archive.com/linux-media@vger.kernel.org/msg52743.html
>> [2] http://www.mail-archive.com/linux-media@vger.kernel.org/msg53323.html

Thanks,
Sylwester
