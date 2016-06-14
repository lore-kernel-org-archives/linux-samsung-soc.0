From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH RFC 4/6] ASoC: Add DT bindings documentation for max98504
 amplifier
Date: Tue, 14 Jun 2016 17:14:58 +0200
Message-ID: <57601F72.20001@samsung.com>
References: <1465815160-28504-1-git-send-email-s.nawrocki@samsung.com>
 <1465815160-28504-5-git-send-email-s.nawrocki@samsung.com>
 <20160613153227.GJ2282@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:32867 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751119AbcFNPP0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 14 Jun 2016 11:15:26 -0400
In-reply-to: <20160613153227.GJ2282@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org, robh@kernel.org, linux-samsung-soc@vger.kernel.org, ideal.song@samsung.com, beomho.seo@samsung.com, inki.dae@samsung.com, k.kozlowski@samsung.com, b.zolnierkie@samsung.com

On 06/13/2016 05:32 PM, Mark Brown wrote:
> On Mon, Jun 13, 2016 at 12:52:38PM +0200, Sylwester Nawrocki wrote:
> 
>> > + - maxim,rx-path : indicates speaker source interface:
>> > +    0 - PCM monomix output,
>> > +    1 - Analog input,
>> > +    2 - left PDM channel (CH0),
>> > +    3 - right PDM channel (CH1)
>
> This should be a DAPM control.
> 
>> > + - maxim,rx-channel-mask : a bitmask indicating active PCM Rx channels,
>> > +   bits b7...b0 correspond to channels CH7...CH0
>
> This should be done using the TDM API.

I suspected these don't belong here. I'll add a DAPM control for speaker
source and will learn about the TDM API. I'm inclined to simply omit
the PCM Rx channels configuration feature for now, as the MAX98504's PCM
interface is left unconnected on our board.
