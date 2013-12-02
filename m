From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 2/2] ARM: dts: Update display clock frequency for Origen-4412
Date: Mon, 2 Dec 2013 09:44:40 +0530
Message-ID: <CAK9yfHxrafJFcEhGksKygkaJmAx+MeLvfhncr_y0YKb6CznPQA@mail.gmail.com>
References: <1380171018-24229-1-git-send-email-sachin.kamat@linaro.org>
	<1380171018-24229-2-git-send-email-sachin.kamat@linaro.org>
	<085801cedf90$6e2a6580$4a7f3080$@org>
	<CAHbNUh2gW3KV_T2iJ=m5a9qe0nsNUzXuHS=fHYDeoXMn9H-Leg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f53.google.com ([209.85.219.53]:41196 "EHLO
	mail-oa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752753Ab3LBEOk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 1 Dec 2013 23:14:40 -0500
Received: by mail-oa0-f53.google.com with SMTP id m1so12657421oag.12
        for <linux-samsung-soc@vger.kernel.org>; Sun, 01 Dec 2013 20:14:40 -0800 (PST)
In-Reply-To: <CAHbNUh2gW3KV_T2iJ=m5a9qe0nsNUzXuHS=fHYDeoXMn9H-Leg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tushar Behera <tushar.behera@linaro.org>
Cc: Kukjin Kim <kgene@kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, Sachin Kamat <sachin.kamat@linaro.org>

On 13 November 2013 09:17, Tushar Behera <tushar.behera@linaro.org> wrote:
> On 12 November 2013 15:47, Kukjin Kim <kgene@kernel.org> wrote:
>> Sachin Kamat wrote:
>>>
>> + dt ml.
>>
>>> As per the timing information for supported panel, the value should
>>> be between 47.2 MHz to 47.9 MHz for 60Hz refresh rate.
>>>
>>> Total horizontal pixels = 1024 (x-res) + 80 (margin) + 48 (hsync) = 1152
>>> Total vertical pixels = 600 (y-res) + 80 (margin) + 3 (vsync) = 653
>>
>> Should be 683?
>>
>>>
>>> Target pixel clock rate for refresh rate @60 Hz
>>>       = 1152 * 653 * 60 = 47208960 Hz ~ 47.5 MHz
>>>
>> Same here.
>>
>
> Yes, typo in both the cases, however the calculation is right. The
> same typo in patch 1/2 also. You may please fix them while applying.
>


Ping Kukjin.

-- 
With warm regards,
Sachin
