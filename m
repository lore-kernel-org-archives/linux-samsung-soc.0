From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [alsa-devel] [PATCH RFC 6/6] ASoC: samsung: Add DT bindings
 documentation for TM2 sound subsystem
Date: Thu, 16 Jun 2016 18:39:46 +0200
Message-ID: <5762D652.5030507@samsung.com>
References: <1465815160-28504-1-git-send-email-s.nawrocki@samsung.com>
 <1465815160-28504-7-git-send-email-s.nawrocki@samsung.com>
 <57612295.7070203@metafoo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:15608 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752615AbcFPQkP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 16 Jun 2016 12:40:15 -0400
In-reply-to: <57612295.7070203@metafoo.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Lars-Peter Clausen <lars@metafoo.de>, broonie@kernel.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org
Cc: robh@kernel.org, k.kozlowski@samsung.com, linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com, inki.dae@samsung.com, beomho.seo@samsung.com, ideal.song@samsung.com

On 06/15/2016 11:40 AM, Lars-Peter Clausen wrote:
> On 06/13/2016 12:52 PM, Sylwester Nawrocki wrote:
> [...]
>> > + - compatible : "samsung,tm2-audio"
>> > + - samsung,model : the user-visible name of this sound complex
>> > + - clocks : must contain an entry for each entry in clock-names,
>> > +   see ../clocks/clock-bindings.txt for details
>> > + - clock-names : must include the following entries:
>> > +   "mclk1", "mclk2"
>
> If these are the MCLKs that go to the CODEC they should be properties of the
> CODEC node.

Yes, these are both CODEC clocks. I couldn't find any related clk code in
the wm5110 arizona codec driver and indeed the clocks stay disabled when
I specify them in the wm5110 DT node. AFAICS from other thread in this
mailing list it is going to take some time until the CODEC drivers are
updated. How about minimizing the requirement of those clocks, making them
optional and then when the CODEC driver gets updated specifying the clocks
in the codec node instead of the sound card one?
The MCLK1 rate could be just hard coded instead of using clk_get_rate(),
but without clk enable calls nothing works.
