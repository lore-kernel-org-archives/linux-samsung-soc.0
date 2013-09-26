From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH v2 00/12] clk/exynos convert clock IDs to macros
Date: Thu, 26 Sep 2013 14:21:52 +0200
Message-ID: <524426E0.7020006@samsung.com>
References: <1378462361-13680-1-git-send-email-a.hajda@samsung.com>
 <8412301.YP2zzplWoe@amdc1227>
 <070001ceafa5$d4d81a40$7e884ec0$%kim@samsung.com>
 <523716C9.3000204@samsung.com> <20130916193709.27384.86101@quantum>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:15127 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756570Ab3IZMV4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 26 Sep 2013 08:21:56 -0400
In-reply-to: <20130916193709.27384.86101@quantum>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Mike Turquette <mturquette@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 'Tomasz Figa' <t.figa@samsung.com>, linux-arm-kernel@lists.infradead.org, 'Kyungmin Park' <kyungmin.park@samsung.com>, devicetree <devicetree@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

On 09/16/2013 09:37 PM, Mike Turquette wrote:
> Quoting Sylwester Nawrocki (2013-09-16 07:33:45)
>> On 09/12/2013 12:50 PM, Kukjin Kim wrote:
>>> Well...I'm not sure changing to use macro is better or not at this moment...
>> I think it is. ;) It's really less error prone to have symbolic names instead
>> of the plain numbers. The clock ids are defined in one place and it is more
>> clear what a clock is by looking at symbolic name. It's especially annoying 
>> to use plain numbers where are are many clock in a single node, like 10 or 
>> more. What are you main concerns with this ?
> I think having the symbolic names is a win for readability.
>
> Regards,
> Mike
>
>> --
>> Regards,
>> Sylwester
Hi Kukjin,

Any thoughts/decisions regarding this patchset ?

Regards
Andrzej
