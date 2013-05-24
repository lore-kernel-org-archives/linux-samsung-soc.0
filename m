From: Arun Kumar K <arunkk.samsung@gmail.com>
Subject: Re: [PATCH] clk: Exynos5250: Add clocks for G3D
Date: Fri, 24 May 2013 10:04:29 +0530
Message-ID: <CALt3h7_WMe00Pq+CQCMfFeymFG8CgBW6gfyk8CxdCe4wWtvD6Q@mail.gmail.com>
References: <1369139801-1889-1-git-send-email-arun.kk@samsung.com>
	<59532716.tUOcOF6tE1@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f171.google.com ([209.85.220.171]:63842 "EHLO
	mail-vc0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752168Ab3EXEea (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 24 May 2013 00:34:30 -0400
Received: by mail-vc0-f171.google.com with SMTP id m17so2854287vca.30
        for <linux-samsung-soc@vger.kernel.org>; Thu, 23 May 2013 21:34:29 -0700 (PDT)
In-Reply-To: <59532716.tUOcOF6tE1@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Arun Kumar K <arun.kk@samsung.com>, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, Thomas Abraham <thomas.abraham@linaro.org>

Hi Tomasz,

Thanks for your review.

>> +     DIV(aclk_400_g3d, "aclk_400_g3d", "mout_aclk400", DIV_TOP0, 24,
> 3),
>
> Do you need to export this div clock? If it's a parent of a gate clock,
> then you can simply add CLK_SET_RATE_PARENT flag to the gate clock and
> calling set_rate on it will reconfigure the divider.
>

Yes this clock doesnt need to exported. But the current driver gets this clock
and will fail if its not exported. So that will need some changes from the
driver side also.


>>       DIV(none, "div_cam_bayer", "mout_cam_bayer", DIV_GSCL, 12, 4),
>>       DIV(none, "div_cam0", "mout_cam0", DIV_GSCL, 16, 4),
>>       DIV(none, "div_cam1", "mout_cam1", DIV_GSCL, 20, 4),
>> @@ -462,6 +471,7 @@ struct samsung_gate_clock exynos5250_gate_clks[]
>> __initdata = { GATE(dp, "dp", "aclk200", GATE_IP_DISP1, 4, 0, 0),
>>       GATE(mixer, "mixer", "aclk200", GATE_IP_DISP1, 5, 0, 0),
>>       GATE(hdmi, "hdmi", "aclk200", GATE_IP_DISP1, 6, 0, 0),
>> +     GATE(g3d, "g3d", "aclk_400_g3d", GATE_IP_G3D, 0, 0, 0),
>
> This would be then:
>
>         GATE(g3d, "g3d", "aclk_400_g3d", GATE_IP_G3D, 0,
>                                         CLK_SET_RATE_PARENT, 0),
>

Yes this would work. I will change it accordingly.

Thanks
Arun
