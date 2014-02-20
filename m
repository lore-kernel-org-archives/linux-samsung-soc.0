From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH v4 0/4] Bugfix for of_match_node ordering
Date: Thu, 20 Feb 2014 16:43:01 +0530
Message-ID: <CAK9yfHwC28zUY7jzJnR3evoevPE4SBofrd0p2B=J5XOKPXzHCg@mail.gmail.com>
References: <1392819290-1044-1-git-send-email-grant.likely@linaro.org>
	<CAK9yfHwwmZkFMRvxsxjBAfUbVXU3V+iPFDZO=DwQsFvJ3NQyKA@mail.gmail.com>
	<20140220101240.GA3745@pek-khao-d1.corp.ad.wrs.com>
	<CAK9yfHzM_kyXMrnLC=M0qiLHKWxE41E-MdyGtipKA7AwoLnOqg@mail.gmail.com>
	<20140220105540.GB3745@pek-khao-d1.corp.ad.wrs.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f53.google.com ([209.85.219.53]:38648 "EHLO
	mail-oa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752815AbaBTLND (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Feb 2014 06:13:03 -0500
Received: by mail-oa0-f53.google.com with SMTP id m1so1873806oag.26
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Feb 2014 03:13:01 -0800 (PST)
In-Reply-To: <20140220105540.GB3745@pek-khao-d1.corp.ad.wrs.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kevin Hao <haokexin@gmail.com>
Cc: Grant Likely <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

On 20 February 2014 16:25, Kevin Hao <haokexin@gmail.com> wrote:
> On Thu, Feb 20, 2014 at 03:57:07PM +0530, Sachin Kamat wrote:
>> Hi Kevin,
>>
>> On 20 February 2014 15:42, Kevin Hao <haokexin@gmail.com> wrote:
>> > On Thu, Feb 20, 2014 at 02:09:08PM +0530, Sachin Kamat wrote:
>> >> Hi Grant,
>> >>
>> >> I observe the following boot failure with today's (next-20140220) linux-next
>> >> tree on Exynos based boards with the default exynos_defconfig.
>> >
>> > Does this help?
>>
>> The below patch works for me. Thanks for the fix.
>
> Thanks Sachin.
>
> Hi Grant,
>
> I assume you would fold this change into the original patch. But if you want
> a separate patch, please let me know.
>
> Thanks,
> Kevin

FWIW, On Exynos platform
Tested-by: Sachin Kamat <sachin.kamat@linaro.org>


-- 
With warm regards,
Sachin
