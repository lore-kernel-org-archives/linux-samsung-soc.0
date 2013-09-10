From: =?UTF-8?B?xYF1a2FzeiBDemVyd2nFhHNraQ==?= <l.czerwinski@samsung.com>
Subject: Re: [RFC PATCH 3/6] spi: spi-s3c64xx: Add coherent buffers for DMA
 transfers
Date: Tue, 10 Sep 2013 13:23:45 +0200
Message-ID: <522F0141.1000905@samsung.com>
References: <1378735766-12330-1-git-send-email-l.czerwinski@samsung.com>
 <1378735766-12330-4-git-send-email-l.czerwinski@samsung.com>
 <20130909144509.GB29403@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:60764 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751069Ab3IJLXs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 10 Sep 2013 07:23:48 -0400
In-reply-to: <20130909144509.GB29403@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: s.nawrocki@samsung.com, linux-samsung-soc@vger.kernel.org, linux-spi@vger.kernel.org



On 09/09/2013 04:45 PM, Mark Brown wrote:
> On Mon, Sep 09, 2013 at 04:09:23PM +0200, Lukasz Czerwinski wrote:
>> The spi-s3c64xx currently doesn't support transfers from non-contiguous
>> client buffers.
>>
>> This patch adds two coherent buffers which allow transfers from
>> non-contiguous client buffers without extra coherent memory allocation
>> in the client driver.
>>
>> Buffer size is hardcoded to 16kB for Tx/Rx. Client drivers shouldn't
>> exceed that value.
>
> This seems like a very low limit to have, consider things like firmware
> downloads for example.  It seems reasonable to have a preallocated small
> buffer but there should be some fallback for larger transfer sizes.
>
I have tested my modification with different buffer sizes with S5C73M3 
driver (355560 B upload). I obtained following upload times:

16kB buffer:
	- 83.972 ms
	- 79.196 ms
	- 79.432 ms
128kB buffer:
	- 74.449 ms
	- 80.719 ms
	- 75.599 ms

For 256kB I obtained similar results as in 128kB case. Normally 
non-interrupted SPI transfer should take 56ms (50MHz). Performance loss 
is approximately about 6% between 16kB and 128KB buffer. I my opinion 
there are no need to use bigger buffers.

I propose add extra module parameter which allows to change buffer size.

> I also didn't notice any checks in the code for the length of transfers
> so this will corrupt memory if a client driver tries to transfer more
> than the preallocated buffer as things stand.
>
Right, I will add that.

Thanks
Lukasz
