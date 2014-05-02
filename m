From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: Bare metal Code to test Big Little on Arndale Octa (5420)
Date: Fri, 02 May 2014 19:43:41 +0200
Message-ID: <5363D94D.3090106@gmail.com>
References: <0DC06F23-1FB7-48D0-9341-8CE94A49060E@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qa0-f54.google.com ([209.85.216.54]:51211 "EHLO
	mail-qa0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752980AbaEBRnm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 2 May 2014 13:43:42 -0400
Received: by mail-qa0-f54.google.com with SMTP id s7so4643135qap.27
        for <linux-samsung-soc@vger.kernel.org>; Fri, 02 May 2014 10:43:42 -0700 (PDT)
In-Reply-To: <0DC06F23-1FB7-48D0-9341-8CE94A49060E@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: armdev <armdev.ftm@gmail.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linaro-kernel@lists.linaro.org, Tushar Behera <tushar.behera@linaro.org>

Hi,

On 28.04.2014 07:51, armdev wrote:
> Hi,
>
> We are trying a write a bare metal test code for Switching tasks from A15 Core to A7 core.
> As of now we have this article to start with https://lwn.net/Articles/481055/.
>
> Can the list help us in
> a) Where (file/directory ) in Linux kernel code that does the switching code (arch specific) for 5420 ?

There is no mainline support for big.LITTLE on Exynos5420 yet. There 
were some patches [1] posted for MCPM support, though.

[1] http://www.spinics.net/lists/arm-kernel/msg321666.html

> b) Any test cases for big little on 5420 ?

I'm not aware of any, but Exynos5 is not the primary platform I work on.

Best regards,
Tomasz
