From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH] ARM: dts: exynos: Use stdout non-deprecated property and
 add serial options to Odroid XU/XU3/XU4
Date: Wed, 17 Aug 2016 11:39:35 +0100
Message-ID: <20160817103935.GE30900@leverpostej>
References: <1471419298-10414-1-git-send-email-k.kozlowski@samsung.com>
 <20160817102506.GD30900@leverpostej>
 <bae50bce-8e56-62cc-89b4-68532c2acaf0@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:51899 "EHLO foss.arm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750968AbcHQKjm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 17 Aug 2016 06:39:42 -0400
Content-Disposition: inline
In-Reply-To: <bae50bce-8e56-62cc-89b4-68532c2acaf0@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

On Wed, Aug 17, 2016 at 12:28:48PM +0200, Krzysztof Kozlowski wrote:
> On 08/17/2016 12:25 PM, Mark Rutland wrote:
> > On Wed, Aug 17, 2016 at 09:34:58AM +0200, Krzysztof Kozlowski wrote:
> >> The "linux,stdout-path" is deprecated.
> >>
> >> Add serial options so the console can be properly configured when
> >> bootloader does not pass "console" parameter to command line.  Without
> >> options and lack of "console", the serial output dies during boot (just
> >> after probing sound).
> > 
> > I'm confused. Is this just a cleanup (given "linux,stdout-path" is
> > deprecated but still supported), or a bug fix?
> 
> There is no bug, so rather this is cleanup and improvement in one.
> Usually we pass full console=ttySAC2,115200n8 from UBoot to command
> line. The usage of serial options allows skipping that.
> 
> I can split the cleanup part from improvement. To me it looked a little
> bit too much but I don't mind.

No need. It just wasn't clear to me that you had U-Boot configured to
pass the rate on the command line.

As I mentioned, I suspect that the serial output doesn't "die" as such,
but rather changes rate. It might be worth clarifying that in the commit
message, but either way the patch itself is fine, and it's no big deal.

Thanks,
Mark.
