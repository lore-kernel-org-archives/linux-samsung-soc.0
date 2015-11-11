From: Thomas Pietrowski <thopiekar@gmail.com>
Subject: Devicetree gpu entry for Mali400-MP4 embedded in Exynos4412 Prime SoC'S
Date: Wed, 11 Nov 2015 19:31:25 +0100
Message-ID: <CAE-5t2vrv=BgrdS4ft4hCe9FG8Vz_uKHoGxjxJi55MO1r9xNQw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yk0-f173.google.com ([209.85.160.173]:35117 "EHLO
	mail-yk0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751275AbbKKSb1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 11 Nov 2015 13:31:27 -0500
Received: by ykba77 with SMTP id a77so63054332ykb.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 11 Nov 2015 10:31:26 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

Hi,

while using the mainline kernel on my Odroid U3+ for a while, I tried
to make it working with the latest ARM Mali driver supported by my
vendor (Hardkernel), which is r5p0.
I found a pdf document on the net for the Exynos4412 and also took a
look at the dt entry by Tobias Jakobi, who has got a individual dt
implementation for an older (r4p0) mali driver.
But I ended with error messages at driver initialization, so added a
question at community.com [1] to understand the reason and they said
that there is a lot wrong in the dt entry. So I assume that there are
much differences between Exynos4412 and Exynos4412 Prime (?).

Additionally: Is it possible to merge dtb files? Just in case I have
an installation with a kernel + dtb's preinstalled, is it possible to
cat the missing gpu@ entry from a seperate dtb? Or better: Are you
planning to add the missing gpu@ entries? I know Greg Kroah-Hartman
made a statement in the past about the mali driver, but as the device
trees just have to describe the hardware layout it shouldn't be a
problem adding these entries, isn't it?

Regards

[1] https://community.arm.com/thread/9145
