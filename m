From: Arun Kumar K <arunkk.samsung@gmail.com>
Subject: Re: [PATCH v5] ARM: EXYNOS: Add MFC device tree support
Date: Tue, 18 Dec 2012 17:42:40 +0530
Message-ID: <CALt3h7-+RtYt5xxyB7KKs5XUQWrW1bU9=jXc6KX1O54iMs=AsQ@mail.gmail.com>
References: <1348765784-7508-1-git-send-email-arun.kk@samsung.com>
	<1348765784-7508-2-git-send-email-arun.kk@samsung.com>
	<loom.20121214T121839-194@post.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f174.google.com ([209.85.220.174]:52632 "EHLO
	mail-vc0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754352Ab2LRMMl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 Dec 2012 07:12:41 -0500
Received: by mail-vc0-f174.google.com with SMTP id d16so710069vcd.33
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Dec 2012 04:12:40 -0800 (PST)
In-Reply-To: <loom.20121214T121839-194@post.gmane.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sekhar Nori <nori.sekhar@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org

Hi Sekhar,

>
>> +
>> +     codec <at> 11000000 {
>> +             samsung,mfc-r = <0x43000000 0x800000>;
>> +             samsung,mfc-l = <0x51000000 0x800000>;
>> +     };
>
> How are these addresses determined? Are they defined by hardware (so they are
> not user configurable) or is the user free to choose them depending on where
> he intends the contiguous memory to lie? If it is the later, I wonder if it
> is considered okay to define this in device tree since it is supposed to be
> a description of the hardware.
>

These addresses are not really user defined but board specific.
So these properties are separated out from exynos5250.dtsi and put
inside exynos5250-smdk5250.dts file where the board specific parameters
are defined. The addresses signifies different memory bank areas as per
the board configuration. So its still a hardware description and hence included
in the dt file.

Regards
Arun
