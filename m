From: armdev <armdev.ftm@gmail.com>
Subject: Re: Bare metal Code to test Big Little on Arndale Octa (5420)
Date: Sat, 3 May 2014 10:51:37 +0530
Message-ID: <A51FD864-A348-488B-8E9B-A8DB3204FCB6@gmail.com>
References: <0DC06F23-1FB7-48D0-9341-8CE94A49060E@gmail.com> <5363D94D.3090106@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 7.2 \(1874\))
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f53.google.com ([209.85.220.53]:45587 "EHLO
	mail-pa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750784AbaECFVr convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 3 May 2014 01:21:47 -0400
Received: by mail-pa0-f53.google.com with SMTP id kp14so2006052pab.12
        for <linux-samsung-soc@vger.kernel.org>; Fri, 02 May 2014 22:21:46 -0700 (PDT)
In-Reply-To: <5363D94D.3090106@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linaro-kernel@lists.linaro.org, Tushar Behera <tushar.behera@linaro.org>


On 02-May-2014, at 11:13 pm, Tomasz Figa <tomasz.figa@gmail.com> wrote:

> Hi,
> 
> On 28.04.2014 07:51, armdev wrote:
>> Hi,
>> 
>> We are trying a write a bare metal test code for Switching tasks from A15 Core to A7 core.
>> As of now we have this article to start with https://lwn.net/Articles/481055/.
>> 
>> Can the list help us in
>> a) Where (file/directory ) in Linux kernel code that does the switching code (arch specific) for 5420 ?
> 
> There is no mainline support for big.LITTLE on Exynos5420 yet. There were some patches [1] posted for MCPM support, though.
> 
Tomasz we are trying to add support of Big Little in our RTOS, can you please advice/suggest how to get reference code / documentation.
We have odroid xu and arndale octa. 

> [1] http://www.spinics.net/lists/arm-kernel/msg321666.html
> 
>> b) Any test cases for big little on 5420 ?
> 
> I'm not aware of any, but Exynos5 is not the primary platform I work on.
> 
> Best regards,
> Tomasz
