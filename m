From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: powerdebug
Date: Mon, 11 Jan 2016 10:29:35 +0900
Message-ID: <CAJKOXPchUayshodX=sJRn5j_eRqwTXeMvGWmAD65yKm=rqa41A@mail.gmail.com>
References: <CANMsd022_wQAOKu9bj_gtoSkxre-m_oK2Jbj4+9=VyKTEQeLog@mail.gmail.com>
	<CAJKOXPf7oQg=2AtDh=dfBRw5xqNVHUyk41tn7E-31tXKhNqj=g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ig0-f174.google.com ([209.85.213.174]:33752 "EHLO
	mail-ig0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757614AbcAKB3g (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 10 Jan 2016 20:29:36 -0500
Received: by mail-ig0-f174.google.com with SMTP id z14so109573523igp.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 10 Jan 2016 17:29:35 -0800 (PST)
In-Reply-To: <CAJKOXPf7oQg=2AtDh=dfBRw5xqNVHUyk41tn7E-31tXKhNqj=g@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ryan <ryanphilips19@googlemail.com>
Cc: linux-samsung-soc@vger.kernel.org

2016-01-11 10:06 GMT+09:00 Krzysztof Kozlowski <k.kozlowski@samsung.com>:
> 2016-01-11 0:44 GMT+09:00 Ryan <ryanphilips19@googlemail.com>:
>> Hi all,
>>
>> I am trying to run powerdebug on Odroid xu3 board with hardkernel.
>>
>> I find that when i run powerdebug, it prints all usecounts of all
>> clocks and regulators as 0. Which i find it strange.
>>
>> Am i missing some config options?
>
> It depends actually on the drivers. There should be some users of
> clocks and regulators so this is weird... but you said you are using
> kernel from Hardkernel so I don't have a clue what they did to their
> kernel. I think you should ask them about their kernel. :) This list
> is rather focused on mainline Linux kernel. In my case I see opened
> regulators and enabled clocks but I am using the mainline.

I just noticed that you used powerdebug, not kernel debug interfaces
directly. Please just check the debugfs - clk/clk_summary and
regulator/regulator_summary.

BR,
Krzysztof
