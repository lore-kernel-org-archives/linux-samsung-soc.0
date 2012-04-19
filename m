From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: s5p-fimc VIDIOC_STREAMOFF bug
Date: Thu, 19 Apr 2012 23:45:02 +0200
Message-ID: <6126533.0OoG4qIlQU@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f174.google.com ([74.125.82.174]:50079 "EHLO
	mail-we0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756673Ab2DSVpQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 19 Apr 2012 17:45:16 -0400
Received: by wejx9 with SMTP id x9so5688695wej.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Apr 2012 14:45:15 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: s.nawrocki@samsung.com

Hi,

I have been working on adapting s5p-fimc driver for s3c6410 and everything 
seems to be working just fine after some minor changes (except minor loss 
of functionality - only codec path is supported, but for most use cases it 
does not matter).

However I think that I have spotted a bug in capture stop / capture suspend 
handling. In fimc_capture_state_cleanup() the ST_CAPT_SUSPENDED status bit 
of fimc->state field is being set regardless of suspend parameter, which 
confuses the driver that FIMC is suspended and might not accept buffers 
into active queue and so the driver will never start the capture process 
unless the device gets closed and reopened (because of the condition 
checking the count of active buffers).

In my fork for s3c6410 I have moved the set_bit call into 
fimc_capture_suspend(), so the bit gets set only when the device gets 
suspended. This seems to solve the problem and I do not see any issues that 
this could introduce, so it might be a good solution.

Let me know if I am wrong in anything I have written.

Best regards,
Tomasz Figa
