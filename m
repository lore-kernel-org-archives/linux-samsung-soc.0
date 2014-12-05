From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v4 1/3] clk: samsung: Fix clock disable failure because
 domain being gated
Date: Fri, 05 Dec 2014 14:02:52 +0100
Message-ID: <5481ACFC.8000502@samsung.com>
References: <1417777254-26579-1-git-send-email-k.kozlowski@samsung.com>
 <1417777254-26579-2-git-send-email-k.kozlowski@samsung.com>
 <5481955A.9000703@samsung.com> <5481A650.8020408@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:18593 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751258AbaLENDJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 5 Dec 2014 08:03:09 -0500
In-reply-to: <5481A650.8020408@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kevin Hilman <khilman@kernel.org>, Mike Turquette <mturquette@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>, Kukjin Kim <kgene@kernel.org>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Vivek Gautam <gautam.vivek@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

On 05/12/14 13:34, Javier Martinez Canillas wrote:
> Hello Sylwester,
> 
> On 12/05/2014 12:22 PM, Sylwester Nawrocki wrote:
>>> >> Tested-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
>> > 
>> > Can you confirm sound works with this patch on exynos5420 ? Or does
>> > your Tested-by refer only to successful booting ?
>> > 
> I tested latest linux-next + "clk: samsung: Fix double add of syscore
> ops after driver rebind" [0] + this series and I confirm that sound is
> also working on my Exynos5420 Peach Pit Chromebook.

OK, thanks a lot for checking it again.

--
Regards,
Sylwester
