From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v2 1/9] ARM: S3C24XX: cpufreq-utils: don't write raw values
 to MPLLCON when using ccf
Date: Tue, 06 May 2014 17:07:49 +0200
Message-ID: <5368FAC5.4010801@gmail.com>
References: <2104342.rkElQpXtvM@phil> <535825AB.8060802@cogentembedded.com> <535828D7.3080301@gmail.com> <1538030.0aVnFA3MgQ@phil> <0e4501cf68e3$8f6612d0$ae323870$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f42.google.com ([74.125.83.42]:45149 "EHLO
	mail-ee0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751921AbaEFPIA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 6 May 2014 11:08:00 -0400
Received: by mail-ee0-f42.google.com with SMTP id d49so2474234eek.15
        for <linux-samsung-soc@vger.kernel.org>; Tue, 06 May 2014 08:07:59 -0700 (PDT)
In-Reply-To: <0e4501cf68e3$8f6612d0$ae323870$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, =?ISO-8859-1?Q?=27Heiko_St=FCbn?= =?ISO-8859-1?Q?er=27?= <heiko@sntech.de>
Cc: 'Sergei Shtylyov' <sergei.shtylyov@cogentembedded.com>, t.figa@samsung.com, linux-samsung-soc@vger.kernel.org, mturquette@linaro.org, linux-arm-kernel@lists.infradead.org

Hi,

On 06.05.2014 06:27, Kukjin Kim wrote:
> Heiko St=FCbner wrote:
>>
>
> [...]
>
>>> Anyway, Heiko, thanks for working on this. I'll try to review rest =
of
>>> the series soon. (I'm attending the ELC next week, though, so I'm n=
ot
>>> sure if I find some time then, though.)
>>
> Yeah, this series is really good to us.
>
>> Just as a reminder, there isn't this much to still review, as you
>> Acked/Reviewed most of the series in v1 and only this patch as well =
as 2
>> and 5
>> still need a review/ack - and the only changes are fixes for your
>> comments ;-)
>>
> I think so. Since I will apply this series in this week, if any big
> comments, please let us know.
>
> Heiko, thanks for the v2.1 as well.

Just found time to look through this series and it looks fine. So if no=
t=20
applied yet, feel free to add

Acked-by: Tomasz Figa <t.figa@samsung.com>

to clk: patches.

Also we still need to ping DT maintainers, as they should ask patch 4/9=
=20
before it is merged.

Best regards,
Tomasz
