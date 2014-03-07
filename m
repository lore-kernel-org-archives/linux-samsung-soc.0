From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH] [media] s5p-mfc: add init buffer cmd to MFCV6
Date: Fri, 07 Mar 2014 10:29:25 +0100
Message-ID: <53199175.6030606@samsung.com>
References: <1394181090-16446-1-git-send-email-arun.kk@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:17019 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751027AbaCGJ33 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 7 Mar 2014 04:29:29 -0500
In-reply-to: <1394181090-16446-1-git-send-email-arun.kk@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arun Kumar K <arun.kk@samsung.com>, avnd.kiran@samsung.com
Cc: linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org, k.debski@samsung.com, posciak@chromium.org, arunkk.samsung@gmail.com

Hi,

On 07/03/14 09:31, Arun Kumar K wrote:
> From: avnd kiran <avnd.kiran@samsung.com>
> 
> Latest MFC v6 firmware requires tile mode and loop filter
> setting to be done as part of Init buffer command, in sync
> with v7. So, move these settings out of decode options reg.
> Also, make this register definition applicable from v6 onwards.
> 
> Signed-off-by: avnd kiran <avnd.kiran@samsung.com>
> Signed-off-by: Arun Kumar K <arun.kk@samsung.com>

Will the driver also work with older version of the firmware
after this change ? If not, shouldn't things like this be done
depending on what firmware version is loaded ?

Regards,
Sylwester
