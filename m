From: Romain Naour <romain.naour@openwide.fr>
Subject: Re: [PATCH] S3C24XX: add clockevent/clocksource support
Date: Sun, 25 Nov 2012 03:54:51 +0100
Message-ID: <50B1887B.1090409@openwide.fr>
References: <50885608.1030503@openwide.fr> <6694372.nV9NvELlFJ@flatron> <508A6B15.1040609@openwide.fr> <110b01cdc922$82d683e0$88838ba0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from zimbra3.corp.accelance.fr ([213.162.49.233]:36208 "EHLO
	zimbra3.corp.accelance.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752863Ab2KYCy7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 24 Nov 2012 21:54:59 -0500
In-Reply-To: <110b01cdc922$82d683e0$88838ba0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Tomasz Figa' <tomasz.figa@gmail.com>, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, =?ISO-8859-1?Q?=27Heiko_St=FCbner=27?= <heiko@sntech.de>, 'Sylwester Nawrocki' <sylvester.nawrocki@gmail.com>

Le 23/11/2012 03:30, Kukjin Kim a =E9crit :
>=20
> Basically, looks good to me but need to edit commit message :-)

I will correct that.

> And since this touches many files so would be better if this could be
> applied early -rc not now. It can provide more time to test for many =
boards.
> Is it ok to you?

I'm ok :-)

> Thanks.
>=20
> Best regards,
> Kgene.
> --
> Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
> SW Solution Development Team, Samsung Electronics Co., Ltd.
>=20

This patch was applied to 3.7-rc1 and tested only on s3c2440 (mini2440)=
=2E
I could re-apply this patch for the next 3.8-rc if you prefer.

I proposed this patch because I need to have clockevent / clocksource
support to use Xenomai or Linux-rt on mini2440.

Since API clockevent/clocksource is enabled, we can use High Resolution
Timer and Tickless mode. This can be interesting for the Linux side too=
=2E

Most of the work is already done in s5p-time.c (renamed samsung-time.c)=
=2E
I add some #define for s3c24xx case.

Thank you.
Romain
