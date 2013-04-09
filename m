From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH RFC] rtc: rtc-s3c: use clk_prepare_enable and
 clk_disable_unprepare
Date: Tue, 09 Apr 2013 15:59:47 +0200
Message-ID: <51641ED3.1090603@samsung.com>
References: <1365500744-14839-1-git-send-email-gautam.vivek@samsung.com>
 <5163E8EB.1050803@samsung.com>
 <CAFp+6iE-ZYSNHZBntTcX8fESLB2FXOr6idM8_Q3Rd7T3s_c4Dw@mail.gmail.com>
 <CAFp+6iGS-4iv-PKTKP4OhwVvTsDoPnc-9N-6AAr5x=Bz9r=vTw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:60051 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751406Ab3DIN7u (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 9 Apr 2013 09:59:50 -0400
In-reply-to: <CAFp+6iGS-4iv-PKTKP4OhwVvTsDoPnc-9N-6AAr5x=Bz9r=vTw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vivek Gautam <gautamvivek1987@gmail.com>
Cc: Vivek Gautam <gautam.vivek@samsung.com>, rtc-linux@googlegroups.com, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, a.zummo@towertech.it, kgene.kim@samsung.com, dianders@chromium.org, Thomas Abraham <thomas.ab@samsung.com>

On 04/09/2013 03:34 PM, Vivek Gautam wrote:
>> Aah !! actually missed a similar patch from Thomas Abraham :(
>> > doing the same as suggested by you.
>> > Its available at:
>> > http://patchwork.ozlabs.org/patch/188687/
> There's a change required in the above mentioned patch, so possibly
> Thomas can go ahead and post the next version
> of that.

Why not make that change yourself if you need it ? That patch is
really old, maybe Thomas is busy with other things now.

Thanks,
Sylwester
