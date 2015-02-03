From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH V3 13/15] ARM: dts: Exynos4 and Odroid X2/U3 sound device
 nodes update
Date: Tue, 03 Feb 2015 15:05:36 +0100
Message-ID: <54D0D5B0.20803@samsung.com>
References: <1421260962-16892-1-git-send-email-s.nawrocki@samsung.com>
 <1421260962-16892-14-git-send-email-s.nawrocki@samsung.com>
 <20150114195452.GM3043@sirena.org.uk>
 <07a501d03f69$aba222b0$02e66810$@kernel.org> <54D0AB30.2010504@samsung.com>
 <20150203131127.GM21293@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:43180 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755907AbbBCOFk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 3 Feb 2015 09:05:40 -0500
In-reply-to: <20150203131127.GM21293@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, padma.v@samsung.com, sbkim73@samsung.com, drake@endlessm.com, linux-arm-kernel@lists.infradead.org

On 03/02/15 14:11, Mark Brown wrote:
> On Tue, Feb 03, 2015 at 12:04:16PM +0100, Sylwester Nawrocki wrote:
> 
>>>> > >> Sorry, I should've said - I applied the ASoC patches, not these.
>>> > > Shall I take 13 to 15 DT patches in Samsung tree?
>> > Patches 13, 14 use macro definitions which are added in patch which is
>> > already in Mark's sound tree ("ASoC: samsung: i2s: Add clk provider DT
>> > binding documentation") [1]. We would need to consider that to avoid
>> > build breaks.
>
> OK, I can apply them if people want but I'd need a resend - I discarded
> them since they'd normally go via the arch tree.

I will resend the last 3 patches then. There also shouldn't be any issues
if 13, 14 are only merged through ASoC tree and patch 15 through Samsung
tree.

--
Thanks,
Sylwester
