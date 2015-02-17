From: Tobias Jakobi <liquid.acid@gmx.net>
Subject: Re: [PATCH v12 0/6] cpufreq: use generic cpufreq drivers for
 exynos platforms
Date: Tue, 17 Feb 2015 21:25:49 +0100
Message-ID: <54E3A3CD.3020106@gmx.net>
References: <1416576682-5255-1-git-send-email-thomas.ab@samsung.com> <CAMAWPa9fUJVjJ8V+93AkHy9DtEmUUnGs4MJDGcsoMdWwGmg5qg@mail.gmail.com> <CAJKOXPfyPH7tyce6YB=q4krSP078aJVAmqObg89qCnLrL_Nbhg@mail.gmail.com> <20150216105217.79315ffd@amdc2363>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.17.21]:60120 "EHLO mout.gmx.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751459AbbBQU0i (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 17 Feb 2015 15:26:38 -0500
In-Reply-To: <20150216105217.79315ffd@amdc2363>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Lukasz Majewski <l.majewski@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Kevin Hilman <khilman@kernel.org>, Thomas Abraham <thomas.ab@samsung.com>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Mike Turquette <mturquette@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Viresh Kumar <viresh.kumar@linaro.org>, =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>, Chanwoo Choi <cw00.choi@samsung.com>, Kevin Hilman <khilman@linaro.org>

Hello!

Lukasz Majewski wrote:
> Hi Krzysztof, Thomas,
> 
>> 2015-01-08 22:17 GMT+01:00 Kevin Hilman <khilman@kernel.org>:
>> Hi Thomas,
>>
>> Do you plan to continue with this work? It would be very helpful.
> 
> +1 from me.
> 
>>
>> I also wonder if Exynos 4412 could be re-added (without the boost if
>> these bindings are not ready)?
> 
> I would prefer to have all platforms converted at once, since it might
> happen that some parts of the work would get lost.

Joining in as well!

Reviving this patch series would be very much appreciated, especially if
it moves again into the direction of storing most information into the
DT (so that one can easily modify it in the board dts).

With best wishes,
Tobias
