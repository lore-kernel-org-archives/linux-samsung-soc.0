From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH V3 13/15] ARM: dts: Exynos4 and Odroid X2/U3 sound device
 nodes update
Date: Tue, 03 Feb 2015 12:04:16 +0100
Message-ID: <54D0AB30.2010504@samsung.com>
References: <1421260962-16892-1-git-send-email-s.nawrocki@samsung.com>
 <1421260962-16892-14-git-send-email-s.nawrocki@samsung.com>
 <20150114195452.GM3043@sirena.org.uk>
 <07a501d03f69$aba222b0$02e66810$@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:31915 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752291AbbBCLEV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 3 Feb 2015 06:04:21 -0500
In-reply-to: <07a501d03f69$aba222b0$02e66810$@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: 'Mark Brown' <broonie@kernel.org>, devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, padma.v@samsung.com, sbkim73@samsung.com, drake@endlessm.com, linux-arm-kernel@lists.infradead.org

On 03/02/15 05:27, Kukjin Kim wrote:
> Mark Brown wrote:
>> On Wed, Jan 14, 2015 at 07:42:40PM +0100, Sylwester Nawrocki wrote:
>>> Clock related properties are added to the Exynos4 I2S device nodes
>>> so they can be referred to as clock providers. Missing i2s_opclk1
>>> clock is added to the I2S0 node and clock properties are added
>>> to the MAX98090 codec node to allow it to control/read frequency
>>> of the MCLK clock directly.
>>
>> Sorry, I should've said - I applied the ASoC patches, not these.
> 
> Shall I take 13 to 15 DT patches in Samsung tree?

Patches 13, 14 use macro definitions which are added in patch which is
already in Mark's sound tree ("ASoC: samsung: i2s: Add clk provider DT
binding documentation") [1]. We would need to consider that to avoid
build breaks.

--
Thanks,
Sylwester

[1]
https://git.kernel.org/cgit/linux/kernel/git/broonie/sound.git/commit/?h=for-next&id=0d40c61279510b8ce2368e1c6adcc2c4dc1af279
