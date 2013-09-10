From: =?UTF-8?B?xYF1a2FzeiBDemVyd2nFhHNraQ==?= <l.czerwinski@samsung.com>
Subject: Re: [RFC PATCH 6/6] spi: spi-s3c64xx: Move DMA initialization
Date: Tue, 10 Sep 2013 15:16:59 +0200
Message-ID: <522F1BCB.1000400@samsung.com>
References: <1378735766-12330-1-git-send-email-l.czerwinski@samsung.com>
 <1378735766-12330-7-git-send-email-l.czerwinski@samsung.com>
 <20130909145351.GD29403@sirena.org.uk> <522F0151.50905@samsung.com>
 <20130910120358.GG29403@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:15469 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751335Ab3IJNRD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 10 Sep 2013 09:17:03 -0400
In-reply-to: <20130910120358.GG29403@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: s.nawrocki@samsung.com, linux-samsung-soc@vger.kernel.org, linux-spi@vger.kernel.org



On 09/10/2013 02:03 PM, Mark Brown wrote:
> On Tue, Sep 10, 2013 at 01:24:01PM +0200, =C5=81ukasz Czerwi=C5=84ski=
 wrote:
>
>> For 16kB buffer upload time is reduced from ~90ms to ~80ms (I tested
>> with S5C73M3 355560B transfer). If you think that performance
>> increase isn't valuable we should skip that patch.
>
> That does seem worthwhile.  Is that just a single transfer in isolati=
on?
>
I gave you summary time when firmware is transferred via 22x16kB blocks=
=2E
Each transfer was isolated.
>> amba-pl80 uses virtual DMA channels support so driver won't occupy
>> all the time physical channel. pl330 driver don't use such framework
>> but It will be very hard to occupy all channels at the same time. If
>> I'm wrong please correct me.
>
> OK.
>
Thanks
Lukasz
