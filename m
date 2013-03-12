From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH 3/4] clk: samsung: always allocate the clk_table
Date: Tue, 12 Mar 2013 17:16:10 +0530
Message-ID: <CAJuYYwRDv4ULqXQOXmTsGfqVopt6XPR+XXb-pPZ35+pC7kUN3A@mail.gmail.com>
References: <201303120042.09633.heiko@sntech.de>
	<201303120044.29499.heiko@sntech.de>
	<CAJuYYwT183EcZZ20P8D7AP34CwXfKYLzsmZdoJz1ny7XznzyAg@mail.gmail.com>
	<513F1037.3080107@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ia0-f182.google.com ([209.85.210.182]:35471 "EHLO
	mail-ia0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753479Ab3CLLqL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 12 Mar 2013 07:46:11 -0400
Received: by mail-ia0-f182.google.com with SMTP id b35so2961523iac.41
        for <linux-samsung-soc@vger.kernel.org>; Tue, 12 Mar 2013 04:46:11 -0700 (PDT)
In-Reply-To: <513F1037.3080107@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>, Kukjin Kim <kgene.kim@samsung.com>, mturquette@linaro.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, t.figa@samsung.com

On 12 March 2013 16:53, Sylwester Nawrocki <s.nawrocki@samsung.com> wrote:
> Hi,
>
> On 03/12/2013 10:54 AM, Thomas Abraham wrote:
>> This change is fine but one point that should be considered is that on
>> non-dt platforms, the memory allocation of clk_table cannot really be
>> justified just because few clocks require two or more aliases.
>>
>> Instead, the optional alias passed for divider/mux register functions
>> can actually be a list of alias names, the list being terminated by a
>> zero-length string. The clock register helper functions can then loop
>> through that list and register all the aliases.
>
> Heiko's approach look much more clean to me and even for Exynos platform
> which has currently about 350 clocks and is going to be dt-only starting
> from 3.10 we are talking about 1.5kB of memory. Other (s3c64/24xx)
> platforms have much less clocks (70...150).
>
> IMHO all clocks aliases should be registered as it is done in Heiko's
> patch series. And the clocks table could just be freed on non-dt
> platforms if it is a real issue and anyone is concerned about it.

Ok, thanks.

And, you mentioned Exynos4 will be dt-only from 3.10. Does that mean
we just drop support for universal and nuri non-dt board support? Or,
will there be a equivalent dt support added for these boards?

Thanks,
Thomas.

>
> Regards,
> Sylwester
