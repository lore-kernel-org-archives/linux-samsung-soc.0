From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH v2 1/9] ARM: S3C24XX: cpufreq-utils: don't write raw values
 to MPLLCON when using ccf
Date: Thu, 08 May 2014 19:36:10 +0200
Message-ID: <536BC08A.6000006@samsung.com>
References: <2104342.rkElQpXtvM@phil> <535825AB.8060802@cogentembedded.com>
 <535828D7.3080301@gmail.com> <1538030.0aVnFA3MgQ@phil>
 <0e4501cf68e3$8f6612d0$ae323870$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:35668 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755281AbaEHRgN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 8 May 2014 13:36:13 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N5900H5TNK1JK50@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 08 May 2014 18:36:01 +0100 (BST)
In-reply-to: <0e4501cf68e3$8f6612d0$ae323870$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, =?ISO-8859-1?Q?=27Heiko_St=FCbn?= =?ISO-8859-1?Q?er=27?= <heiko@sntech.de>, 'Tomasz Figa' <tomasz.figa@gmail.com>
Cc: 'Sergei Shtylyov' <sergei.shtylyov@cogentembedded.com>, linux-samsung-soc@vger.kernel.org, mturquette@linaro.org, linux-arm-kernel@lists.infradead.org

Hi Kukjin,

On 06.05.2014 06:27, Kukjin Kim wrote:
> Heiko St=FCbner wrote:
>>
>=20
> [...]
>=20
>>> Anyway, Heiko, thanks for working on this. I'll try to review rest =
of
>>> the series soon. (I'm attending the ELC next week, though, so I'm n=
ot
>>> sure if I find some time then, though.)
>>
> Yeah, this series is really good to us.
>=20
>> Just as a reminder, there isn't this much to still review, as you
>> Acked/Reviewed most of the series in v1 and only this patch as well =
as 2
>> and 5
>> still need a review/ack - and the only changes are fixes for your
>> comments ;-)
>>
> I think so. Since I will apply this series in this week, if any big
> comments, please let us know.

This needs to be synchronized with series for Exynos5260 and support fo=
r
multiple clock providers. Let me prepare a branch for you to pull from
my tree with all necessary dependencies.

Best regards,
Tomasz
