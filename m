From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [alsa-devel] [PATCH 10/10] ASoC: SAMSUNG: Add Machine driver for
 S/PDIF PCM audio
Date: Tue, 5 Oct 2010 11:19:35 +0900
Message-ID: <AANLkTincwL_nQAmu7Dcmht0FV43BiN7OoecE_60QJhS2@mail.gmail.com>
References: <1286191550-22197-1-git-send-email-sw.youn@samsung.com>
	<1286194583-19937-1-git-send-email-sw.youn@samsung.com>
	<20101004224159.GA4972@opensource.wolfsonmicro.com>
	<AANLkTi=FHGw+qzL507K546vr8zEZgXBP3Mk=O__Rpd4H@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:59707 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753244Ab0JECTh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 4 Oct 2010 22:19:37 -0400
Received: by bwz11 with SMTP id 11so4243786bwz.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 04 Oct 2010 19:19:35 -0700 (PDT)
In-Reply-To: <AANLkTi=FHGw+qzL507K546vr8zEZgXBP3Mk=O__Rpd4H@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Seungwhan Youn <sw.youn@samsung.com>, alsa-devel@alsa-project.org, kgene.kim@samsung.com, jassi.brar@samsung.com, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org, lrg@slimlogic.co.uk

On Tue, Oct 5, 2010 at 10:10 AM, Jassi Brar <jassisinghbrar@gmail.com> wrote:
> On Tue, Oct 5, 2010 at 7:42 AM, Mark Brown
> <broonie@opensource.wolfsonmicro.com> wrote:
>> On Mon, Oct 04, 2010 at 09:16:23PM +0900, Seungwhan Youn wrote:
>>
>>> +/* Audio clock settings are belonged to board specific part. Every
>>> + * board can set audio source clock setting which is matched with H/W
>>> + * like this function-'set_audio_clock_heirachy'.
>>> + */
>>> +static int set_audio_clock_heirachy(struct platform_device *pdev)
>>> +{
>>
>> I'd expect this to be with the other clock configuration code under
>> arch/arm, especially as it's involving the EPLL which can have fairly
>> wide usage - it seems better to make sure people working with other,
>> non-audio, bits of the system are aware of the EPLL usage.
>
> Please let me explain on Claude's behalf.
> That is the first option that crossed my mind as well.
> But that would have made us have EPLL manipulation in two places -
> one in arch/arm/mach/board-init and other in ASoC Machine driver because
> we would need to change the source clock's rate in runtime(using
> callback pointers
> for the purpose seemed too over the top).
> If ASoC doesn't change EPLL, it doesn't matter to other devices, if it
> does there
> is currently no means for other drivers to know about it. So, we might just
> as well move the EPLL related code to ASoC machine driver.

Btw, another important reason is that having EPLL manipulation in board-int
would result in code-duplication on other SMDK platforms as most have the
same clock routing options available in h/w and we want to use the same ASoC
machine driver for SoCs whenever possible.
