From: Amit Kucheria <amit.kucheria@linaro.org>
Subject: Re: Bare metal Code to test Big Little on Arndale Octa (5420)
Date: Mon, 5 May 2014 09:42:40 +0530
Message-ID: <CAP245DVf1-QhVaaTQ_PtcqQMNpWh8RirJtSPmQc9BR1=xO=fMg@mail.gmail.com>
References: <0DC06F23-1FB7-48D0-9341-8CE94A49060E@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ve0-f179.google.com ([209.85.128.179]:62568 "EHLO
	mail-ve0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751341AbaEEEMk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 5 May 2014 00:12:40 -0400
Received: by mail-ve0-f179.google.com with SMTP id oy12so5071584veb.38
        for <linux-samsung-soc@vger.kernel.org>; Sun, 04 May 2014 21:12:40 -0700 (PDT)
In-Reply-To: <0DC06F23-1FB7-48D0-9341-8CE94A49060E@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: armdev <armdev.ftm@gmail.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Lists linaro-kernel <linaro-kernel@lists.linaro.org>, Tushar Behera <tushar.behera@linaro.org>

Hi,

No public code has been released to boot all 8 cores on the 5420. You
can only see the A15s.

You could however, if you are interested, get IKS[1] working by
integrating the MCPM patches posted by Samsung and the IKS patches
that are already in mainline.

Regards,
Amit
[1] http://lwn.net/Articles/481055/

On Mon, Apr 28, 2014 at 11:21 AM, armdev <armdev.ftm@gmail.com> wrote:
> Hi,
>
> We are trying a write a bare metal test code for Switching tasks from A15 Core to A7 core.
> As of now we have this article to start with https://lwn.net/Articles/481055/.
>
> Can the list help us in
> a) Where (file/directory ) in Linux kernel code that does the switching code (arch specific) for 5420 ?
> b) Any test cases for big little on 5420 ?
>
>
> -Regards
> armdev team
> _______________________________________________
> linaro-kernel mailing list
> linaro-kernel@lists.linaro.org
> http://lists.linaro.org/mailman/listinfo/linaro-kernel
