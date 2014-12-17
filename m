From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH/RFC 04/14] ASoC: samsung: i2s: Request memory region in
 driver probe()
Date: Wed, 17 Dec 2014 16:10:32 +0100
Message-ID: <54919CE8.1070800@samsung.com>
References: <1418319952-10163-1-git-send-email-s.nawrocki@samsung.com>
 <1418319952-10163-5-git-send-email-s.nawrocki@samsung.com>
 <20141212184927.GR11764@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:54546 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750990AbaLQPKi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 17 Dec 2014 10:10:38 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NGQ007XEFOFNP40@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 17 Dec 2014 15:14:39 +0000 (GMT)
In-reply-to: <20141212184927.GR11764@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, padma.v@samsung.com, drake@endlessm.com, sbkim73@samsung.com

On 12/12/14 19:49, Mark Brown wrote:
> On Thu, Dec 11, 2014 at 06:45:42PM +0100, Sylwester Nawrocki wrote:
>> > The memory mapped registers region is common for both DAIs so request
>> > it in the I2S platform device driver's probe for the platform device
>> > corresponding to the primary DAI, rather than in the ASoC DAI's probe
>> > callback. While at it switch to devm_ioremap_resource(). This also
>> > drops the hard coded (0x100) register region size in the driver.
>
> This doesn't apply against current code, please check and resend.

It seems I've used your topic/samsung branch as a base. Let me rebase
to the for-next branch and resend.

-- 
Regards,
Sylwester
