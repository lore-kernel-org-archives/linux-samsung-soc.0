From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH/RFC 11/14] ASoC: samsung: odroidx2: Handle I2S CDCLK clock
 conditionally
Date: Wed, 17 Dec 2014 16:18:38 +0100
Message-ID: <54919ECE.7040404@samsung.com>
References: <1418319952-10163-1-git-send-email-s.nawrocki@samsung.com>
 <1418319952-10163-12-git-send-email-s.nawrocki@samsung.com>
 <20141212185332.GS11764@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:58343 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750910AbaLQPSn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 17 Dec 2014 10:18:43 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NGQ00L5KG1VRG50@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 17 Dec 2014 15:22:43 +0000 (GMT)
In-reply-to: <20141212185332.GS11764@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, padma.v@samsung.com, drake@endlessm.com, sbkim73@samsung.com

On 12/12/14 19:53, Mark Brown wrote:
> On Thu, Dec 11, 2014 at 06:45:49PM +0100, Sylwester Nawrocki wrote:
>> > If the codec control it's master clock provider by the I2S module
>> > we should not be touching it with set_sysclk() calls.
>> > So skip the set_sysclk() call in the machine driver if "clocks"
>> > property is found in the codec device node.
>
> Please clarify in the changelog here that this is a transition measure
> to support old DTs, it's not clear why we might want to do things for
> the I2S controller by fishing around in the CODEC DT otherwise.

Indeed, there is some room for improvement. I'll add such note to the
commit description. Presumably this whole driver could be removed
after a kernel release or two, since we switched Odroid X2/U3 to
the simple-card.

-- 
Regards,
Sylwester
