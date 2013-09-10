From: =?UTF-8?B?xYF1a2FzeiBDemVyd2nFhHNraQ==?= <l.czerwinski@samsung.com>
Subject: Re: [RFC PATCH 6/6] spi: spi-s3c64xx: Move DMA initialization
Date: Tue, 10 Sep 2013 13:24:01 +0200
Message-ID: <522F0151.50905@samsung.com>
References: <1378735766-12330-1-git-send-email-l.czerwinski@samsung.com>
 <1378735766-12330-7-git-send-email-l.czerwinski@samsung.com>
 <20130909145351.GD29403@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:60795 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751069Ab3IJLYE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 10 Sep 2013 07:24:04 -0400
In-reply-to: <20130909145351.GD29403@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: s.nawrocki@samsung.com, linux-samsung-soc@vger.kernel.org, linux-spi@vger.kernel.org



On 09/09/2013 04:53 PM, Mark Brown wrote:
> On Mon, Sep 09, 2013 at 04:09:26PM +0200, Lukasz Czerwinski wrote:
>> This patch removes DMA channel initialization and deinitialization for each
>> transfer. Now DMA channel is requested only at the driver initialization
>> and stored in driver data.
>
> So, this is fine but I had been under the impression that one of the
> reasons that the channels were only being requested at transfer time was
> that they could be used for other purposes too.  If that is not the case
> then fine, if that is the case then probably moving to prepare/unprepare
> transfer hardware (when the clocks are enabled) would make more sense -
> that'd avoid repeated allocations and frees while the controller is busy
> which should be the main issue performance wise.
>
For 16kB buffer upload time is reduced from ~90ms to ~80ms (I tested 
with S5C73M3 355560B transfer). If you think that performance increase 
isn't valuable we should skip that patch.

amba-pl80 uses virtual DMA channels support so driver won't occupy all 
the time physical channel. pl330 driver don't use such framework but It 
will be very hard to occupy all channels at the same time. If I'm wrong 
please correct me.

Thanks
Lukasz
