From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: SMDKV210 support issue in kernel 3.8 (dma-pl330 and HDMI failed)
Date: Thu, 28 Feb 2013 16:54:53 +0100
Message-ID: <512F7DCD.3040301@samsung.com>
References: <51275DF7.4010600@gmail.com> <512CB1BE.1070401@gmail.com>
 <512D160D.1050706@gmail.com> <512D1BFB.4000700@gmail.com>
 <512E22AA.8020006@gmail.com> <512E2ABF.1080206@gmail.com>
 <512E7D97.4000608@gmail.com> <512F4D5E.5090900@gmail.com>
 <512F732B.4070804@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:14219 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753470Ab3B1Py4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 28 Feb 2013 10:54:56 -0500
In-reply-to: <512F732B.4070804@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Lonsn <lonsn2005@gmail.com>
Cc: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org

On 02/28/2013 04:09 PM, Lonsn wrote:
> HDMI output is OK now, it's a variable init question in 'struct v4l2_buffer
> buf' when call ioctl(fd, VIDIOC_DQBUF, &buf) in the hdmi example application.
> Add m.planes in buf then OK.
> Thanks all!
> I will continue to test the mfc decoder for s5pv210.

Well done! I was going to suggest exactly that to you. It's due to some
change in v4l2-core in recent versions of the kernel. I'll try to update
the example application when I find some time.

Regards,
Sylwester
