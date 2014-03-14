From: armdev <armdev.ftm@gmail.com>
Subject: Enabling uart 3 in arndale
Date: Fri, 14 Mar 2014 13:34:10 +0530
Message-ID: <0259D8EA-B62C-4D07-8661-ED2CF6E53779@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 7.2 \(1874\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f180.google.com ([209.85.192.180]:40692 "EHLO
	mail-pd0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755516AbaCNIES convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 14 Mar 2014 04:04:18 -0400
Received: by mail-pd0-f180.google.com with SMTP id v10so2232308pde.11
        for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Mar 2014 01:04:17 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tushar Behera <tushar.behera@linaro.org>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, u-boot@lists.denx.de

Hi,

We are trying to enable the UART3 on COM18 pins of arndale board. The UART3 RXD and TXD are on pins 2 and 4 which as per the base board specification is connected as 

XuRXD3 : UART_3_RXD/GPA1[4] : 2
XuTXD3 : UART_3_TXD/GPA1[5] : 4

As per the public reference manual of exynos 5250, there is a register GPACON (0x1140_0000) 
Setting GPACON |= 0x0010_0000 should enable the pins, but I am not able to see any output on UART3.

Can you please suggest what is the right procedure

-Regards
armdev team @FTM