From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH RFC 6/6] ASoC: samsung: Add DT bindings documentation for
 TM2 sound subsystem
Date: Tue, 21 Jun 2016 11:48:11 +0200
Message-ID: <57690D5B.2020504@samsung.com>
References: <1465815160-28504-1-git-send-email-s.nawrocki@samsung.com>
 <1465815160-28504-7-git-send-email-s.nawrocki@samsung.com>
 <20160614233224.GA4477@rob-hp-laptop> <20160615094730.GX2282@sirena.org.uk>
 <CAL_Jsq+=EGo+6PkwjCSUavm+DyvjuXDx2XzteY6xXSP+0u+Z+g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:25329 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751624AbcFUJsQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 21 Jun 2016 05:48:16 -0400
In-reply-to: <CAL_Jsq+=EGo+6PkwjCSUavm+DyvjuXDx2XzteY6xXSP+0u+Z+g@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rob Herring <robh@kernel.org>, Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Inha Song <ideal.song@samsung.com>, Beomho Seo <beomho.seo@samsung.com>, InKi Dae <inki.dae@samsung.com>, =?UTF-8?Q?Krzysztof_Koz=c5=82owski?= <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

On 06/20/2016 07:49 PM, Rob Herring wrote:
>>>> + - samsung,i2s-controller : the phandle of the I2S controller
>>>> + - samsung,speaker-amplifier : the phandle of the MAX98504 amplifier

I'm considering changing this to a more generic (samsung,?)audio-amplifier
in next iteration. Or maybe just listing MAX98504 as second entry of the
(samsung,)audio-codec(s) property value, since capabilities and functionality 
of the device in the system is not limited to just simple audio power 
amplification. It accepts analogue audio signal on its input and is 
transmitting digital audio data stream in the feedback path to the WM5110 
codec's DSP.

>>> >> We should have standard properties for these. 2nd ones I've seen today.
>> >
>> > No, these aren't fixed roles in a system, you couldn't have standard
>> > handling for them.
>
> What do you mean? It is silly for us to put vendor prefixes on all of
> these. There are dozens of examples in the binding docs of
> <vendor>,i2s-controller and <vendor>,audio-codec. Yes, dropping just
> the vendor prefix doesn't buy much (maybe some string space), but it
> certainly adds nothing.

It also looked unnecessary to me to at first sight to be adding
vendor prefixes to those properties. We could look at the compatible
string in the pointed node for handling any differences.
