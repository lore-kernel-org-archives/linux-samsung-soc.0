From: "Denis 'GNUtoo' Carikli" <GNUtoo@no-log.org>
Subject: Re: [PATCH] Add poll_get_char & poll_put_char to uart_ops for the samsung UARTS.
Date: Sun, 26 Feb 2012 19:31:57 +0100
Message-ID: <201202261931.57316.GNUtoo@no-log.org>
References: <20120212182201.GA17975@debian>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp201.alice.it ([82.57.200.97]:52226 "EHLO smtp201.alice.it"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752319Ab2BZScA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 26 Feb 2012 13:32:00 -0500
In-Reply-To: <20120212182201.GA17975@debian>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Julien Pichon <pichon.jln@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org

Hi Julien,

>The following patch allows users to use KGDB over serial console on
>board based on Samsung SOC. It has been tested on a mini2440.
(gdb) target remote /dev/ttyUSB0
Remote debugging using /dev/ttyUSB0
kgdb_breakpoint () at kernel/debug/debug_core.c:959
959		arch_kgdb_breakpoint();

It works on a gta02 machine too...

Thanks a lot for working on that, it will help me a lot for continuing to fix 
things in mainline for gta02, It already was very usefull with debugging an 
alsa problem.

Tested-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>

Denis.
