From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v2 16/16] ARM: dts: Fix I2S1,
 I2S2 compatible for exynos4 SoCs
Date: Wed, 14 Jan 2015 12:57:51 +0100
Message-ID: <54B659BF.4000803@samsung.com>
References: <1418997336-17777-1-git-send-email-s.nawrocki@samsung.com>
 <1418997336-17777-17-git-send-email-s.nawrocki@samsung.com>
 <20150106181517.GQ2634@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:10541 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751966AbbANL54 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Jan 2015 06:57:56 -0500
In-reply-to: <20150106181517.GQ2634@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: kgene@kernel.org, alsa-devel@alsa-project.org, padma.v@samsung.com, drake@endlessm.com, sbkim73@samsung.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On 06/01/15 19:15, Mark Brown wrote:
> On Fri, Dec 19, 2014 at 02:55:36PM +0100, Sylwester Nawrocki wrote:
>> > I2S1, I2S2 on Exynos4 SoC series have limited functionality compared
>> > to I2S0, "samsung,s3c6410-i2s" compatible should be used for them.
>> > 
>> > Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
>> > ---
>
> This should probably go to stable as a bug fix too.

Sounds like a reasonable thing to do, I will Cc stable in next iteration.
