From: jassi brar <jassisinghbrar@gmail.com>
Subject: Re: i2s driver for s3c6410?
Date: Thu, 3 Dec 2009 09:32:59 +0900
Message-ID: <1b68c6790912021632k6fa0cdf7uf958b7c9c6a4a301@mail.gmail.com>
References: <2A201BEEC85E064DA2513CADA373DB0DB0420E@mx2.telecom.sna.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pw0-f42.google.com ([209.85.160.42]:50229 "EHLO
	mail-pw0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752359AbZLCAcw convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 2 Dec 2009 19:32:52 -0500
Received: by pwi3 with SMTP id 3so591437pwi.21
        for <linux-samsung-soc@vger.kernel.org>; Wed, 02 Dec 2009 16:32:59 -0800 (PST)
In-Reply-To: <2A201BEEC85E064DA2513CADA373DB0DB0420E@mx2.telecom.sna.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Misael Lopez <mlopez@sta.samsung.com>
Cc: linux-samsung-soc@vger.kernel.org

On Thu, Dec 3, 2009 at 8:28 AM, Misael Lopez <mlopez@sta.samsung.com> w=
rote:
> Hi,
>
> I'm wondering what i2s platform driver to use for s3c6410. In
> linux-2.6-samsung tree there are couple of directories containing it:
> sound/soc/s3c and sound/soc/s3c24xx, OTOH ALSA tree only has
> sound/soc/s3c24xx. Not sure why both trees differ in sound support,

> I guess it's part of a migration or something.
you got it right.
And, samsung's repo has code not just for 6410.
so, i suggest you follow mainline 6410 drivers.
Eventually, mainline and samsung's I2S will be synced.

>
> Thanks,
> -Misa
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =C2=A0http://vger.kernel.org/majordomo-info.ht=
ml
>
