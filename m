From: Misha Komarovskiy <zombah@gmail.com>
Subject: Google snow chromebook hard freeze with 4.14
Date: Mon, 20 Nov 2017 18:11:03 +0300
Message-ID: <CANLc0-YnQ93F2RouL4NxVhQ=2KYqGj60BA7_ttVZhGhvas6L3Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f47.google.com ([74.125.82.47]:35722 "EHLO
        mail-wm0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751268AbdKTPLZ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 20 Nov 2017 10:11:25 -0500
Received: by mail-wm0-f47.google.com with SMTP id y80so19382721wmd.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Nov 2017 07:11:24 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org

Hello,
After upgrade to kernel version 4.14 i receive hard freeze 4 of 5
boots on snow with error Unhandled fault: asynchronous external abort
(0x211) at 0x00000000 , here is full serial output of kernel log with
fault trace [1].
With kernel 4.13 device boots fine.

[1] - http://paste.opensuse.org/96574215
-- 
Best Regards,
Misha Komarovskiy
zombahatgmaildotcom
