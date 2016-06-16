From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH RFC 3/6] ASoC: max98504: Add max98504 speaker amplifier
 driver
Date: Thu, 16 Jun 2016 18:17:35 +0200
Message-ID: <5762D11F.8030403@samsung.com>
References: <1465815160-28504-1-git-send-email-s.nawrocki@samsung.com>
 <1465815160-28504-4-git-send-email-s.nawrocki@samsung.com>
 <20160613151429.GI2282@sirena.org.uk> <57601A1F.5030906@samsung.com>
 <20160615092527.GU2282@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:18711 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754456AbcFPQSE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 16 Jun 2016 12:18:04 -0400
In-reply-to: <20160615092527.GU2282@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org, robh@kernel.org, linux-samsung-soc@vger.kernel.org, ideal.song@samsung.com, beomho.seo@samsung.com, inki.dae@samsung.com, k.kozlowski@samsung.com, b.zolnierkie@samsung.com

On 06/15/2016 11:25 AM, Mark Brown wrote:
> On Tue, Jun 14, 2016 at 04:52:15PM +0200, Sylwester Nawrocki wrote:
>> > On 06/13/2016 05:14 PM, Mark Brown wrote:
>>> > > Removed the regulator handling code?  Why?
>> > Because it was effectively a dead code (disabled by a DT flag property)
>> > and didn't make any sense on our test board. It was setting regulator's
>> > load and voltage on a shared fixed voltage regulator. Even if calls like
>> > regulator_set_optimum_mode() were added that wouldn't make any difference,
>> > since the corresponding PMIC driver ops were not implemented.
>> > I started more or less with something like this [1].
>
> The mode and voltage setting code there are just obviously broken but
> having the get and enable is useful, even if it doesn't do anything on
> your board it's nice to have them there already to avoid any transition
> issues adding them later and help get more complete and accurate DTs in
> from the get go.

OK, I've added regulator supply related code and properties to the DT binding.
