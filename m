From: Sathishkumar Duraisamy <bewithsathish@gmail.com>
Subject: How to get High resolution time in s3c6410
Date: Wed, 7 Dec 2011 17:51:05 +0530
Message-ID: <CANJvwR_NCHs0KfmhRrV6pfo_PW3kFJmEHqhdi1QEUi8xhRHiNg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:52695 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755572Ab1LGMVG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 7 Dec 2011 07:21:06 -0500
Received: by dadv6 with SMTP id v6so511568dad.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 07 Dec 2011 04:21:05 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org

Hi all,

Here I have to measure time elapsed between two events in
microseconds. Currently in my working kernel 2.6.36.2, there is no
support for high resolution timer and resolution of time is 10ms
(jiffies) . Can you please help me to get high resolution timer? Or Do
I have to use timer hardware ?

-- 
Regards,
Sathishkumar D
http://flowersopenlab.weebly.com/
