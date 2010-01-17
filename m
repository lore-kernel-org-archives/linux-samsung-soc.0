From: Maurus Cuelenaere <mcuelenaere@gmail.com>
Subject: Re: s3c-hsotg driver problem
Date: Sun, 17 Jan 2010 13:57:04 +0100
Message-ID: <4B530920.5020901@gmail.com>
References: <4B51B36C.6040308@gmail.com> <3c17e3571001161800m14ca30cas1cca155f9880513d@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ew0-f219.google.com ([209.85.219.219]:41080 "EHLO
	mail-ew0-f219.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751758Ab0AQM5H (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 17 Jan 2010 07:57:07 -0500
Received: by ewy19 with SMTP id 19so2393054ewy.21
        for <linux-samsung-soc@vger.kernel.org>; Sun, 17 Jan 2010 04:57:05 -0800 (PST)
In-Reply-To: <3c17e3571001161800m14ca30cas1cca155f9880513d@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Barry Song <21cnbao@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Ben Dooks <ben-linux@fluff.org>

Op 17-01-10 03:00, Barry Song schreef:
> In fact, I once used 12Mhz  external crystal, after setting PHYCLK
> right,  both USB 1.1 as host and 2.0 as gadget can work. The kernel
> version I used is 2.6.28.
>    

You say the kernel version you used is 2.6.28, I'm betting you weren't 
using Ben Dooks' driver then and this was Samsung's tree?
The kernel that is currently shipped with the device I'm porting for 
(SmartQ 7) is using 2.6.24, which also has Samsung's patches applied 
(and uses other drivers than in mainline).

AFAIK there are 2 (?) 'main' trees floating around with Samsung patches: 
2.6.24 and 2.6.28, then there are 2.6.29 and 2.6.31 (and newer) trees 
which contain patches from a mix of both and mainline.

What I'm looking for is getting everything to work with *mainline* 
drivers, so in the end I can push the SmartQ boards to mainline.

Regards,
Maurus Cuelenaere
