From: Saravana Kannan <skannan@codeaurora.org>
Subject: Re: [RFC 2/2] clk: samsung: add exynos5250 composite clock for hdmi
Date: Mon, 20 May 2013 13:02:57 -0700
Message-ID: <519A8171.3040003@codeaurora.org>
References: <1369059428-26820-1-git-send-email-rahul.sharma@samsung.com> <1369059428-26820-3-git-send-email-rahul.sharma@samsung.com> <5956307.B4Gm3xbmhh@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254]:11107 "EHLO
	wolverine01.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756835Ab3ETUC6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 20 May 2013 16:02:58 -0400
In-Reply-To: <5956307.B4Gm3xbmhh@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Rahul Sharma <rahul.sharma@samsung.com>, kgene.kim@samsung.com, devicetree-discuss@lists.ozlabs.org, joshi@samsung.com, inki.dae@samsung.com, linux-samsung-soc@vger.kernel.org, s.nawrocki@samsung.com, r.sh.open@gmail.com

On 05/20/2013 11:57 AM, Tomasz Figa wrote:
> Hi Rahul,
>
> On Monday 20 of May 2013 19:47:08 Rahul Sharma wrote:
>> HDMI driver needs to change the parent of sclk_hdmi clock to
>> sclk_pixel or to sclk_hdmiphy, depends on the status of hdmiphy.
>> sclk_hdmi which is gate clock doesn't support the set_parent
>> operation.
>
> Wouldn't it be better to simply allow calling clk_set_parent() on gate
> clocks and propagate parent change to nearest mux, just like it is done
> with clk_set_rate()?
>
> It wouldn't require any SoC-specific composite clocks and keep the nice
> property of the clock tree, which is built from basic, generic clock
> blocks that nicely correspond to blocks shown in the documentation.
>
> We had discussed this already at SRPOL and got to the conclusion that it's
> a step backwards, making the clock driver more complex, because each
> composite block would have to be described using a structure with many
> fields. In addition there are many special cases, for which the composite
> scheme wouldn't work anyway and they would end up with simple clocks
> attached after the composite block, defeating the purpose of your patch.
>

+1 to all these comments.

-Saravana

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
hosted by The Linux Foundation
