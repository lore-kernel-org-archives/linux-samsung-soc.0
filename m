From: Arun Kumar K <arunkk.samsung@gmail.com>
Subject: Re: clk: Exynos5250: Add clocks for G3D
Date: Fri, 24 May 2013 10:05:21 +0530
Message-ID: <CALt3h7_-igWP25WnM4gHqi5PAB4LPFaQHQ8dix32EAnpo5uvmg@mail.gmail.com>
References: <1369139801-1889-1-git-send-email-arun.kk@samsung.com>
	<CAD=FV=XCzcY4-dN=2OYkrkTU9HYxykSUPnm++RVQ6a6g4t-XUA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f176.google.com ([209.85.220.176]:48033 "EHLO
	mail-vc0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752280Ab3EXEfW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 24 May 2013 00:35:22 -0400
Received: by mail-vc0-f176.google.com with SMTP id ha11so2806571vcb.35
        for <linux-samsung-soc@vger.kernel.org>; Thu, 23 May 2013 21:35:21 -0700 (PDT)
In-Reply-To: <CAD=FV=XCzcY4-dN=2OYkrkTU9HYxykSUPnm++RVQ6a6g4t-XUA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Arun Kumar K <arun.kk@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>

Hi Doug,

Thanks for the review.
But as per Tomasz Figa's comment, I will remove the exporting of aclk_400_g3d
to the driver.

Regards
Arun

On Wed, May 22, 2013 at 4:13 AM, Doug Anderson <dianders@chromium.org> wrote:
> Arun,
>
> On Tue, May 21, 2013 at 5:36 AM, Arun Kumar K <arun.kk@samsung.com> wrote:
>> @@ -262,6 +270,7 @@ struct samsung_div_clock exynos5250_div_clks[] __initdata = {
>>         DIV(none, "aclk166", "mout_aclk166", DIV_TOP0, 8, 3),
>>         DIV(none, "aclk333", "mout_aclk333", DIV_TOP0, 20, 3),
>>         DIV(none, "aclk200", "mout_aclk200", DIV_TOP0, 12, 3),
>> +       DIV(aclk_400_g3d, "aclk_400_g3d", "mout_aclk400", DIV_TOP0, 24, 3),
>
> Doh!  I looked at this more and it looks like I missed something.
> You've added this clock to the range assigned for "[Peripheral Clock
> Gates]".  This is not a gate clock but is a div clock.
>
> Perhaps it should be in a different range?  Could make IDs that start
> at 512 or something?
>
> -Doug
