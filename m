From: Shrirang Bagul <shrirang.bagul@gmail.com>
Subject: S5PC100 suspend to ram debugging
Date: Fri, 29 Jan 2010 11:43:14 +0800
Message-ID: <f1a373561001281943j433c31cbx5c89dd9711f94b9a@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f189.google.com ([209.85.222.189]:38571 "EHLO
	mail-pz0-f189.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932170Ab0A2DnP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 28 Jan 2010 22:43:15 -0500
Received: by pzk27 with SMTP id 27so1146932pzk.33
        for <linux-samsung-soc@vger.kernel.org>; Thu, 28 Jan 2010 19:43:14 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org

Hi All,

I am trying to implement/test the "Suspend to RAM" feature on a
smdkc100 (processor S5PC100) based board. I am unable to see ant debug
messages when I do the following:

echo "mem" > /sys/power/state

The debug console is assigned to /dev/ttySAC0. My guess is that the
pm_prepare() function in mach-s5pc100/pm.c should  be implemented in
this case to view the debug messages.
Can anyone please guide me as to how this can be done? Also, are there
any modifications with respect to u-boot for resuming from the suspend
state in this case?

Thanks.

Best regards,
Shrirang.

-- 
Shrirang Bagul. <shrirang.bagul@gmail.com>,
Software R&D Engineer, Core Technology Center,
ASUSTek Computers Inc.
