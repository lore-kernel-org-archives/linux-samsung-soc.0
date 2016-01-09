From: Sriram V <vshrirama@gmail.com>
Subject: domain off
Date: Sat, 9 Jan 2016 15:49:57 +0530
Message-ID: <CAH9_wRPDMiCMNZJHkkK21oF8dySUfa5AUpGnp-nh6V77As6CPA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yk0-f178.google.com ([209.85.160.178]:33072 "EHLO
	mail-yk0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753646AbcAIKT6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 9 Jan 2016 05:19:58 -0500
Received: by mail-yk0-f178.google.com with SMTP id k129so365270906yke.0
        for <linux-samsung-soc@vger.kernel.org>; Sat, 09 Jan 2016 02:19:58 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org

Hello,

I am trying to power down power domains which are not used but i am
unable to do so unless i write manually into the registers.

Can anyone help me on the standard way to power down power domains on
a exynos 5422.

I  tried marking status /bts-status to disable in the device tree file
for pd-disp1, but that does not help.

What is the standard way of powering down if they are not used. Do we
need to do using dt or somewhere in the kernel board file?

-- 
Regards,
Sriram
