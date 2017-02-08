From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 2/5] arm64: dts: exynos: Move the clock-frequency property
Date: Wed, 8 Feb 2017 09:32:26 +0200
Message-ID: <CAJKOXPe9Bjpobw1chuhG3vdt6sWZ69AcQbqYD9rRoMRyO1-cMA@mail.gmail.com>
References: <1486347584-6762-1-git-send-email-hoegeun.kwon@samsung.com>
 <CGME20170206021951epcas1p365db9f08f22cc223ca45538b0dbc86d6@epcas1p3.samsung.com>
 <1486347584-6762-3-git-send-email-hoegeun.kwon@samsung.com>
 <20170207201335.lyc7yvwed7cm25nj@kozik-lap> <8c4f2a21-152d-eb41-3f26-44bb69f831c7@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:44816 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932092AbdBHHce (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 8 Feb 2017 02:32:34 -0500
In-Reply-To: <8c4f2a21-152d-eb41-3f26-44bb69f831c7@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Cc: Inki Dae <inki.dae@samsung.com>, robh+dt@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org

On Wed, Feb 8, 2017 at 9:24 AM, Hoegeun Kwon <hoegeun.kwon@samsung.com> wrote:
>
>>
>> "Remove the ports node abd move burst and esc clock frequency properties
>> to the parent (DSI node)."
>>
>> The information which is missing is the answer for WHY? Why are you
>> doing this?
>
>
> The current mipi-dsi must have at least one OF graph.
> However, for example, dsi and panel are parent-child relationships,
> so OF graph is not needed, and fimd and dsi are not connected to the OF
> graph.
> In this case, an error occurred in dsi_parse in the code before patch (1/5).

The error occurred in case of DSI + FIMD? I do not get it whether you
are removing the something which is not needed or fixing something.

> So I modified dsi_parse_dt.
>
>>
>> Does the patch depends on 1/5?
>
>
> Yes, it is.
> The 2/5 to 5/5 patches depend on the 1/5 patch.

So that's a break of DT ABI for no clear (yet) reasons. Please mention
this in 1/5 patch and explain what is really fixed.

Best regards,
Krzysztof
