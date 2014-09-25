From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH v3] ARM: dts: add CPU nodes for Exynos4 SoCs
Date: Thu, 25 Sep 2014 11:02:05 +0200
Message-ID: <5423DA0D.9030100@linaro.org>
References: <5230569.XLlNbB5NvF@amdc1032> <018e01cfd885$770dd940$65298bc0$@kernel.org> <20140925081704.GA20841@e102568-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f173.google.com ([209.85.212.173]:33195 "EHLO
	mail-wi0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751537AbaIYJCI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 25 Sep 2014 05:02:08 -0400
Received: by mail-wi0-f173.google.com with SMTP id r20so8464234wiv.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Sep 2014 02:02:06 -0700 (PDT)
In-Reply-To: <20140925081704.GA20841@e102568-lin.cambridge.arm.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Kukjin Kim <kgene@kernel.org>
Cc: 'Bartlomiej Zolnierkiewicz' <b.zolnierkie@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 'Marek Szyprowski' <m.szyprowski@samsung.com>, 'Tomasz Figa' <tomasz.figa@gmail.com>, Mark Rutland <Mark.Rutland@arm.com>, 'Thomas Abraham' <ta.omasab@gmail.com>

On 09/25/2014 10:17 AM, Lorenzo Pieralisi wrote:
> [CC'ed Daniel to make him aware this patch goes through your tree]

Thanks for the head up. I was about to send the PR to Rafael.

[ ... ]

> That's great, now my Exynos CPUidle DT patch should be rebased on top
> of this patch so that thanks to the testing carried out by Bart it ca=
n be
> merged too.

Ok, I am getting confused. How can I rebase the latest patch of your=20
series with a patch no yet available in my tree ?

I propose just to drop the last patch and wait for the next merge to=20
reintegrate it into the cpuidle tree. Does it make sense ?

Thanks
   -- Daniel


--=20
  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software fo=
r ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
