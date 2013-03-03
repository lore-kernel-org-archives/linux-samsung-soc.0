From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: Re: [PATCH v6 5/5] ARM: dts: Add FIMD DT binding Documentation
Date: Sun, 03 Mar 2013 21:03:25 +0100
Message-ID: <5133AC8D.8030401@gmail.com>
References: <1362044559-7496-1-git-send-email-vikas.sajjan@linaro.org> <1362044559-7496-6-git-send-email-vikas.sajjan@linaro.org> <5133A068.7060906@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ea0-f175.google.com ([209.85.215.175]:37617 "EHLO
	mail-ea0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751462Ab3CCUDa (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 3 Mar 2013 15:03:30 -0500
Received: by mail-ea0-f175.google.com with SMTP id d1so644082eab.20
        for <linux-samsung-soc@vger.kernel.org>; Sun, 03 Mar 2013 12:03:29 -0800 (PST)
In-Reply-To: <5133A068.7060906@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vikas Sajjan <vikas.sajjan@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, sachin.kamat@linaro.org, t.figa@samsung.com, devicetree-discuss@lists.ozlabs.org, inki.dae@samsung.com, jy0922.shim@samsung.com

On 03/03/2013 08:11 PM, Sylwester Nawrocki wrote:
> I have a suggestion here. What about using reg-names property to make this

Oops, this should read "interrupt-names", not "reg-names".

> more explicit, e.g.
>
> - interrupts : should contain a list of all FIMD IP block interrupts:
>    FIFO Level, VSYNC, LCD_SYSTEM. The interrupt specifier format depends
>    on the interrupt controller used;
>
> - interrupt-names : should contain the interrupt names: "fifo", "vsync",
>    "lcd_sys", in the order in which they were listed in the interrupts
>    property;
