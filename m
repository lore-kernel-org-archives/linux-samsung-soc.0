From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 2/2] ARM: dts: exynos: Fix initial clocks configuration
 on Odroid X/X2/U3 boards
Date: Thu, 8 Dec 2016 19:13:57 +0200
Message-ID: <20161208171357.GA8082@kozik-lap>
References: <1481194914-20490-1-git-send-email-m.szyprowski@samsung.com>
 <1481194914-20490-2-git-send-email-m.szyprowski@samsung.com>
 <CGME20161208164434epcas4p4a7c6c5045d38140b0dca501276206a2c@epcas4p4.samsung.com>
 <20161208164421.GC5238@kozik-lap>
 <864877de-a14b-093a-4127-4ad710299fc2@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wj0-f193.google.com ([209.85.210.193]:36728 "EHLO
        mail-wj0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932708AbcLHROD (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 8 Dec 2016 12:14:03 -0500
Content-Disposition: inline
In-Reply-To: <864877de-a14b-093a-4127-4ad710299fc2@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, linux-clk@vger.kernel.org

On Thu, Dec 08, 2016 at 06:07:02PM +0100, Sylwester Nawrocki wrote:
> On 12/08/2016 05:44 PM, Krzysztof Kozlowski wrote:
> > On Thu, Dec 08, 2016 at 12:01:54PM +0100, Marek Szyprowski wrote:
> >> Move assigned clocks properties from sound node to audio subsystem clock
> >> controller node. This way clocks topology and rates are set just after
> >> probing audio clocks controller. Leaving those properties under sound
> >> node doesn't guarantee to configure them before they are being used
> >> (for example i2s hardware module can be probed in parallel and it also
> >> require proper audio clocks configuration).
> >>
> >> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> >> ---
> >>  arch/arm/boot/dts/exynos4412-odroid-common.dtsi | 20 ++++++++++----------
> >>  1 file changed, 10 insertions(+), 10 deletions(-)
> >
> > Looks correct, for the reference:
> > Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
> > 
> > Does this fixes any encountered issue (real one)? I wonder whether this
> > should go to fixes or not.
> 
> With current code there is no issues, and in fact there should be no
> such timing dependencies in DT to rely on.  However, the binding convention
> is to put assigned-clock* properties in a node of a device they belong
> to and in this case the 'clock_audss' is more appropriate than the 'sound'
> node.  This patch doesn't fix any bug with current code but it might save
> us some trouble with future changes.
>

Thanks for explanation. I am not planning any pull requests for this
cycle so the patch will have to wait till the end of 4.10-rc1
merge window.

Best regards,
Krzysztof
