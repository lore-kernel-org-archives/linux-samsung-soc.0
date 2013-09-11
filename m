From: =?UTF-8?B?xYF1a2FzeiBDemVyd2nFhHNraQ==?= <l.czerwinski@samsung.com>
Subject: Re: [RFC PATCH 6/6] spi: spi-s3c64xx: Move DMA initialization
Date: Wed, 11 Sep 2013 09:45:58 +0200
Message-ID: <52301FB6.6060601@samsung.com>
References: <1378735766-12330-1-git-send-email-l.czerwinski@samsung.com>
 <1378735766-12330-7-git-send-email-l.czerwinski@samsung.com>
 <20130909145351.GD29403@sirena.org.uk> <522F0151.50905@samsung.com>
 <20130910120358.GG29403@sirena.org.uk> <522F1BCB.1000400@samsung.com>
 <20130910163248.GO29403@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:32558 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751376Ab3IKHqB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 11 Sep 2013 03:46:01 -0400
In-reply-to: <20130910163248.GO29403@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: s.nawrocki@samsung.com, linux-samsung-soc@vger.kernel.org, linux-spi@vger.kernel.org



On 09/10/2013 06:32 PM, Mark Brown wrote:
> On Tue, Sep 10, 2013 at 03:16:59PM +0200, =C5=81ukasz Czerwi=C5=84ski=
 wrote:
>> On 09/10/2013 02:03 PM, Mark Brown wrote:
>>> On Tue, Sep 10, 2013 at 01:24:01PM +0200, =C5=81ukasz Czerwi=C5=84s=
ki wrote:
>
>>>> For 16kB buffer upload time is reduced from ~90ms to ~80ms (I test=
ed
>>>> with S5C73M3 355560B transfer). If you think that performance
>>>> increase isn't valuable we should skip that patch.
>
>>> That does seem worthwhile.  Is that just a single transfer in isola=
tion?
>
>> I gave you summary time when firmware is transferred via 22x16kB blo=
cks.
>> Each transfer was isolated.
>
> OK, so that's the per-transfer number?  I'm just wondering if moving =
it
> to prepare/unprepare would achieve the same effect here.
>
Yes

You are right.

S5C73M3 splits firmware into several spi_messages with single SPI=20
transfer.  It caused for each single spi_message transfer=20
prepare/unprepare.  I tried mistakenly optimize through moving=20
dma_channel_request(in prepare) from prepare to probe(do it once).

I based my patch on the spi-tegra114.c driver. 	There is=20
dma_chanel_request at the beginning in the probe function.
I really should correct S5C73M3 firmware upload function.

When I added small modification into S5C73M3 driver I achieved the same=
=20
effect.

Sorry for wasting your time.

Thanks
Lukasz
