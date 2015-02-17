From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: Re: exynos4412: misc issues on Hardkernel Odroid boards
Date: Tue, 17 Feb 2015 14:32:29 +0100
Message-ID: <71afa85252e1c95251e696749172757b@math.uni-bielefeld.de>
References: <54D779FB.9070306@math.uni-bielefeld.de>
 <54D86913.2050109@samsung.com> <54DF9089.8050204@math.uni-bielefeld.de>
 <CAJKOXPcSRjO__ywh0QVDex8zKZ2FEvgCt4JsPs78_kHzCtqZBA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:57270 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754980AbbBQNca (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 17 Feb 2015 08:32:30 -0500
In-Reply-To: <CAJKOXPcSRjO__ywh0QVDex8zKZ2FEvgCt4JsPs78_kHzCtqZBA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, k.kozlowski.k@gmail.com

Hello Krzysztof,

On 2015-02-17 14:24, Krzysztof Kozlowski wrote:
> Looking at the backtrace this seems very likely however I have
> troubles reproducing this. Any special tree or config is required
> (except MMC_CLKGATE and DEBUG_ATOMIC_SLEEP)?
> 
> Best regards,
> Krzysztof
The kernel was build with this config:
https://github.com/tobiasjakobi/odroid-environment/blob/master/sourcecode/system/vanilla-3.19-debug.conf

I didn't have DEBUG_ATOMIC_SLEEP enabled back then, but I could try to 
reproduce it again.

With best wishes,
Tobias
