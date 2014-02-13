From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH v2 7/9] clk: samsung: Drop old suspend/resume code
Date: Fri, 14 Feb 2014 08:07:36 +0900
Message-ID: <52FD5038.6090309@samsung.com>
References: <1391710616-14226-1-git-send-email-t.figa@samsung.com> <1391710616-14226-8-git-send-email-t.figa@samsung.com> <4274393.fPXjFZLa78@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f46.google.com ([209.85.220.46]:42710 "EHLO
	mail-pa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750932AbaBMXHo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 13 Feb 2014 18:07:44 -0500
Received: by mail-pa0-f46.google.com with SMTP id rd3so11325305pab.5
        for <linux-samsung-soc@vger.kernel.org>; Thu, 13 Feb 2014 15:07:43 -0800 (PST)
In-Reply-To: <4274393.fPXjFZLa78@phil>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>
Cc: Tomasz Figa <t.figa@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Mike Turquette <mturquette@linaro.org>, Kyungmin Park <kyungmin.park@samsung.com>, linux-samsung-soc@vger.kernel.org, Thomas Abraham <thomas.abraham@linaro.org>, Rahul Sharma <r.sh.open@gmail.com>, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>

On 02/07/14 18:50, Heiko St=FCbner wrote:
> Am Donnerstag, 6. Februar 2014, 19:16:54 schrieb Tomasz Figa:
>> Since all SoC drivers have been moved to local suspend/resume handli=
ng,
>> the old code can be safely dropped.
>>
>> Signed-off-by: Tomasz Figa<t.figa@samsung.com>
>> Acked-by: Kyungmin Park<kyungmin.park@samsung.com>
>
> So it looks like I'll need to respin my s3c24xx-ccf patches again, bu=
t
> nevertheless:
>
> Acked-by: Heiko Stuebner<heiko@sntech.de>
>

Heiko,

I'll apply this series, so please re-work your s3c24xx CCF based on=20
this. you can see in v3.15-next/s2r-pm-samsung.

Thanks,
- Kukjin

>> ---
>>   drivers/clk/samsung/clk-exynos4.c    |  2 +-
>>   drivers/clk/samsung/clk-exynos5250.c |  2 +-
>>   drivers/clk/samsung/clk-exynos5420.c |  2 +-
>>   drivers/clk/samsung/clk-exynos5440.c |  2 +-
>>   drivers/clk/samsung/clk-s3c64xx.c    |  2 +-
>>   drivers/clk/samsung/clk.c            | 54
>> +----------------------------------- drivers/clk/samsung/clk.h      =
      |
>>   4 +--
>>   7 files changed, 7 insertions(+), 61 deletions(-)
