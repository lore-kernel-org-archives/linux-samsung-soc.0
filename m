From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [RFT v2 2/5] ASoC: samsung: smdk_wm8580: Remove old platforms and
 drop mach-types usage
Date: Mon, 21 Nov 2016 12:21:17 +0100
Message-ID: <5ca5b9a5-2355-2c9b-f0a9-bbc1375aa044@samsung.com>
References: <1479669895-19124-1-git-send-email-krzk@kernel.org>
 <CGME20161120192523epcas1p4f764b20d525d28059b85373276a4f725@epcas1p4.samsung.com>
 <1479669895-19124-3-git-send-email-krzk@kernel.org>
 <8b81b058-0ba9-f1bc-a0ed-d30604853110@samsung.com>
 <713e7f53-16b2-a510-e99e-77e785f8a7c1@metafoo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:65043 "EHLO
        mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752075AbcKULVY (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 21 Nov 2016 06:21:24 -0500
In-reply-to: <713e7f53-16b2-a510-e99e-77e785f8a7c1@metafoo.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Lars-Peter Clausen <lars@metafoo.de>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org

On 11/21/2016 11:34 AM, Lars-Peter Clausen wrote:
> On 11/21/2016 11:30 AM, Sylwester Nawrocki wrote:
>> > On 11/20/2016 08:24 PM, Krzysztof Kozlowski wrote:
>>> >>
>>> >> Not tested. The driver did not override .platform_name which looks
>>> >> suspicious to me. However I did not want to add changes which could have
>>> >> some visible impact on output code.
>> > 
>> > The patch looks good to me. However the existing smdk64xx sound support
>> > less so. I don't have smdk6410 set up for testing yet, possibly I get
>> > around that next week.
>> > Indeed it's strange .platform_name is not also "samsung-i2s.2".
>
> I think that is a fallout from commit a08485d8fdf6f ("ASoC: Samsung: Do not
> register samsung audio dma device as pdev"). Given nobody noticed this in
> the last 4 years maybe its time to drop this machine driver as well.

Yeah, looks like since that commit things are broken.  Even though nobody
seems to be interested I'm inclined to not removing this machine driver
just yet, otherwise there will not be any board in mainline I could test
s3c64xx IP block related code changes. I'll try to find time to make this
working again.

--
Thanks,
Sylwester
