From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 3/4] clk: samsung: always allocate the clk_table
Date: Tue, 12 Mar 2013 12:23:35 +0100
Message-ID: <513F1037.3080107@samsung.com>
References: <201303120042.09633.heiko@sntech.de>
 <201303120044.29499.heiko@sntech.de>
 <CAJuYYwT183EcZZ20P8D7AP34CwXfKYLzsmZdoJz1ny7XznzyAg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:24532 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752623Ab3CLLXi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 12 Mar 2013 07:23:38 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MJJ00LNKOZ1M480@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 12 Mar 2013 11:23:36 +0000 (GMT)
Received: from [106.116.147.32] by eusync1.samsung.com
 (Oracle Communications Messaging Server 7u4-23.01(7.0.4.23.0) 64bit (built Aug
 10 2011)) with ESMTPA id <0MJJ000B4OZC6EC0@eusync1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 12 Mar 2013 11:23:36 +0000 (GMT)
In-reply-to: <CAJuYYwT183EcZZ20P8D7AP34CwXfKYLzsmZdoJz1ny7XznzyAg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>, =?ISO-8859-1?Q?Heiko_St?= =?ISO-8859-1?Q?=FCbner?= <heiko@sntech.de>
Cc: Kukjin Kim <kgene.kim@samsung.com>, mturquette@linaro.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, t.figa@samsung.com

Hi,

On 03/12/2013 10:54 AM, Thomas Abraham wrote:
> This change is fine but one point that should be considered is that on
> non-dt platforms, the memory allocation of clk_table cannot really be
> justified just because few clocks require two or more aliases.
>
> Instead, the optional alias passed for divider/mux register functions
> can actually be a list of alias names, the list being terminated by a
> zero-length string. The clock register helper functions can then loop
> through that list and register all the aliases.

Heiko's approach look much more clean to me and even for Exynos platform
which has currently about 350 clocks and is going to be dt-only starting
from 3.10 we are talking about 1.5kB of memory. Other (s3c64/24xx)
platforms have much less clocks (70...150).

IMHO all clocks aliases should be registered as it is done in Heiko's
patch series. And the clocks table could just be freed on non-dt
platforms if it is a real issue and anyone is concerned about it.

Regards,
Sylwester
