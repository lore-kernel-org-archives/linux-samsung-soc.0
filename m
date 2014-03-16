From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: Enabling uart 3 in arndale
Date: Sun, 16 Mar 2014 13:53:09 +0100
Message-ID: <53259EB5.8090202@gmail.com>
References: <0259D8EA-B62C-4D07-8661-ED2CF6E53779@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f44.google.com ([74.125.83.44]:59548 "EHLO
	mail-ee0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750899AbaCPMxK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 16 Mar 2014 08:53:10 -0400
Received: by mail-ee0-f44.google.com with SMTP id e49so3103588eek.17
        for <linux-samsung-soc@vger.kernel.org>; Sun, 16 Mar 2014 05:53:09 -0700 (PDT)
In-Reply-To: <0259D8EA-B62C-4D07-8661-ED2CF6E53779@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: armdev <armdev.ftm@gmail.com>, Tushar Behera <tushar.behera@linaro.org>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, u-boot@lists.denx.de

Hi,

On 14.03.2014 09:04, armdev wrote:
> Hi,
>
> We are trying to enable the UART3 on COM18 pins of arndale board. The UART3 RXD and TXD are on pins 2 and 4 which as per the base board specification is connected as
>
> XuRXD3 : UART_3_RXD/GPA1[4] : 2
> XuTXD3 : UART_3_TXD/GPA1[5] : 4
>
> As per the public reference manual of exynos 5250, there is a register GPACON (0x1140_0000)
> Setting GPACON |= 0x0010_0000 should enable the pins, but I am not able to see any output on UART3.
>
> Can you please suggest what is the right procedure

The register is GPA1CON and its GPA1CON[4] and [5] bit fields need both 
to be set to 0x2 - see Pad Control chapter of Exynos5250 public 
datasheet. Also GPA1PUD should be reconfigured to disable default 
pull-down on both pins, again you can find details of the register in 
the datasheet.

Best regards,
Tomasz
