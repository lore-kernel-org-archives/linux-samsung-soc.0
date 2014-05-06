From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v2 1/9] ARM: S3C24XX: cpufreq-utils: don't write raw values
 to MPLLCON when using ccf
Date: Tue, 06 May 2014 13:27:58 +0900
Message-ID: <0e4501cf68e3$8f6612d0$ae323870$@samsung.com>
References: <2104342.rkElQpXtvM@phil> <535825AB.8060802@cogentembedded.com>
 <535828D7.3080301@gmail.com> <1538030.0aVnFA3MgQ@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:46858 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751143AbaEFE2B convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 6 May 2014 00:28:01 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N5400DZRXQNKQ50@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 06 May 2014 13:27:59 +0900 (KST)
In-reply-to: <1538030.0aVnFA3MgQ@phil>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?iso-8859-1?Q?'Heiko_St=FCbner'?= <heiko@sntech.de>, 'Tomasz Figa' <tomasz.figa@gmail.com>
Cc: 'Sergei Shtylyov' <sergei.shtylyov@cogentembedded.com>, t.figa@samsung.com, linux-samsung-soc@vger.kernel.org, mturquette@linaro.org, linux-arm-kernel@lists.infradead.org

Heiko St=FCbner wrote:
>=20

[...]

> > Anyway, Heiko, thanks for working on this. I'll try to review rest =
of
> > the series soon. (I'm attending the ELC next week, though, so I'm n=
ot
> > sure if I find some time then, though.)
>=20
Yeah, this series is really good to us.

> Just as a reminder, there isn't this much to still review, as you
> Acked/Reviewed most of the series in v1 and only this patch as well a=
s 2
> and 5
> still need a review/ack - and the only changes are fixes for your
> comments ;-)
>=20
I think so. Since I will apply this series in this week, if any big
comments, please let us know.

Heiko, thanks for the v2.1 as well.

- Kukjin
