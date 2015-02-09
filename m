From: Hyungwon Hwang <human.hwang@samsung.com>
Subject: Re: odroidxu3 u-boot samsung - git - Denx
Date: Mon, 09 Feb 2015 10:59:07 +0900
Message-ID: <20150209105907.6cff037c@hwh-ubuntu>
References: <1333497114.1454774.1423392715955.JavaMail.yahoo@mail.yahoo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:32969 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754632AbbBIB7J (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 8 Feb 2015 20:59:09 -0500
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NJH00BAXEUJ2D70@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 09 Feb 2015 10:59:07 +0900 (KST)
In-reply-to: <1333497114.1454774.1423392715955.JavaMail.yahoo@mail.yahoo.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Anand Moon <moon.linux@yahoo.com>
Cc: Lukasz Majewski <l.majewski@samsung.com>, Minkyu Kang <mk7.kang@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

Hi,

On Sun, 08 Feb 2015 10:51:55 +0000 (UTC)
Anand Moon <moon.linux@yahoo.com> wrote:

> Hi All,
> 
> I am trying to build upstream  the u-boot from the 
> git://git.denx.de/u-boot-samsung.git
> 
> I checkout the git repository.
> 
> to build the u-boot-dts.bin, I used the following commands.
> 
> # make odroid-xu3_config
> # make
> 
> After the I copied the u-boot-dts.bin to "sd_fuse/hardkernel/".
> 
> After that I issued the command 
> 
> sudo ./sd_fusing.sh /dev/sdb        # Which loaded the boot loader on
> the /dev/sdb
> 
> After these changes I could not issue or set any further command onto
> the Odroid XU3 # command.

sd_fusing.sh script write the bootloader to the SD card which is
connected to your PC. It is irrelevant to your Odroid machine. I think
you may find more helpful information from odroid forum.

> 
> So I pulled some flags changes from the
> #u-boot-samsung/include/configs/odroid.h to
> #u-boot-samsung/include/configs/odroid_xu3.h
> 
> 
> After these change I am able to set the environment variables for
> u-boot. But I am not able to boot into new kernel. Please some one
> could help me guide me If I am doing some thing wrong.
> 

Best regards,
Hyungwon Hwang
