From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 00/12] ARM: S3C24XX: convert s3c2410, s3c2440 s3c2442 to common clock framework
Date: Tue, 11 Feb 2014 10:20:55 +0100
Message-ID: <4099437.QudIaVHrIN@phil>
References: <201312131356.40755.heiko@sntech.de> <52F7DD6E.8070303@gmail.com> <CAL5jtJm=Ehwk2ZyCJaW0NfMn8XM893r1hdCVWs2skMv4+M7yXQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:45785 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750863AbaBKJVx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 11 Feb 2014 04:21:53 -0500
In-Reply-To: <CAL5jtJm=Ehwk2ZyCJaW0NfMn8XM893r1hdCVWs2skMv4+M7yXQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@gmail.com>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Tomasz Figa <t.figa@samsung.com>, Mike Turquette <mturquette@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

Hi Kukjin,

Am Dienstag, 11. Februar 2014, 11:46:13 schrieb Kukjin Kim:
> 2014-02-10 1:26 GMT+05:30 Tomasz Figa <tomasz.figa@gmail.com>:
> > 
> > For patches 4, 5, 9, 10, 11, 12:
> > 
> > Reviewed-by: Tomasz Figa <t.figa@samsung.com>
> > 
> > For patches 6, 7:
> > 
> > Acked-by: Tomasz Figa <t.figa@samsung.com>
> 
> Really nice series.
> Heiko, thanks for your effort and Tomasz, thanks for your review and ack.
> 
> OK, I'll apply this whole series and this will be sent to arm-soc in this
> week.

not this fast :-)

Tomasz hat some comments about the two clk-drivers included, which I'll need 
to address first.

Also, this series, as well as the other two at the moment conflict with Tomasz' 
clock-pm changes. Our (Tomasz and me) current plan was for me to respin the 3 
ccf conversion series against his clock-pm series, which I hope to do in the 
next two days or so.


Heiko
