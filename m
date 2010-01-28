From: jassi brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCHv2 06/10] ARM: SMDK64XX: Enable AC97 device
Date: Thu, 28 Jan 2010 14:31:49 +0900
Message-ID: <1b68c6791001272131u388f1980l48a1a587070f0189@mail.gmail.com>
References: <1264571969-15145-1-git-send-email-jassisinghbrar@gmail.com>
	 <20100128034152.GA14154@trinity.fluff.org>
	 <1b68c6791001272008k7341d360oeb0e84b181e74b0c@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vw0-f46.google.com ([209.85.212.46]:42170 "EHLO
	mail-vw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751046Ab0A1Fbu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 28 Jan 2010 00:31:50 -0500
Received: by vws12 with SMTP id 12so90003vws.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Jan 2010 21:31:50 -0800 (PST)
In-Reply-To: <1b68c6791001272008k7341d360oeb0e84b181e74b0c@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben@trinity.fluff.org>
Cc: alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org, ben-linux@fluff.org, broonie@opensource.wolfsonmicro.com, lrg@slimlogic.co.uk, linux-samsung-soc@vger.kernel.org, Jassi Brar <jassi.brar@samsung.com>

On Thu, Jan 28, 2010 at 1:08 PM, jassi brar <jassisinghbrar@gmail.com> wrote:
> On Thu, Jan 28, 2010 at 12:41 PM, Ben Dooks <ben@trinity.fluff.org> wrote:
>> On Wed, Jan 27, 2010 at 02:59:29PM +0900, jassisinghbrar@gmail.com wrote:
>>> From: Jassi Brar <jassi.brar@samsung.com>
>>>
>>> Add AC97 controller to platform devices and initialize the AC97 gpios.
>>
>> I'd much rather see platform devices always added unless there is a really
>> good reason not to. People can build things as modules and this means you
>> end up having to rebuild the core kernel as well as the module if you want
>> to change.
> Yes, sounds good to me. I will revise this patch accordingly.
> Thanks

s3c64xx_device_ac97 device is exported from dev-audio.c
which is compiled only if CONFIG_SND_S3C24XX_SOC is defined.
So, If we unconditionally add the platform device, it will give error in case
the user didn't select Samsung ASoC option.
So, I guess i should make it conditional on CONFIG_SND_S3C24XX_SOC
rather than CONFIG_SND_SOC_SMDK_WM9713
