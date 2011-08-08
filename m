From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH 12/15] spi/s3c64xx: Add support DMA engine API
Date: Mon, 8 Aug 2011 23:46:58 +0530
Message-ID: <CABb+yY08vGuvp4uVm3nd0FvFoXa04jmDOaQYcu324q7326a5Lw@mail.gmail.com>
References: <1311744697-10264-1-git-send-email-boojin.kim@samsung.com>
	<1311744697-10264-13-git-send-email-boojin.kim@samsung.com>
	<CABb+yY3-d0xTO+s0cCPXPW8qGpTH5G2U+bp-0z4Se47eVvJ__w@mail.gmail.com>
	<201108081955.39626.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:48917 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751423Ab1HHSRA convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 8 Aug 2011 14:17:00 -0400
Received: by fxh19 with SMTP id 19so5618891fxh.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 08 Aug 2011 11:16:59 -0700 (PDT)
In-Reply-To: <201108081955.39626.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: Boojin Kim <boojin.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>, Kukjin Kim <kgene.kim@samsung.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Grant Likely <grant.likely@secretlab.ca>, Russell King <linux@arm.linux.org.uk>

On Mon, Aug 8, 2011 at 11:25 PM, Heiko St=C3=BCbner <heiko@sntech.de> w=
rote:
> Am Montag 08 August 2011, 19:47:58 schrieb Jassi Brar:

>> Btw, this spi driver is for S3C64xx(with pl080) and S5P(with pl330)
>> series, both of which
>> have DMAENGINE drivers. May be it could be directly switched to usin=
g
>> those, rather than
>> via Samsung's wrapper driver.
>> Or am I overlooking something ?
> yep, at least the S3C2416/2450 HSSPI which should use this driver.

Seems you keep some patches private ;)  the spi driver isn't enabled
for 2416 in mainline.
