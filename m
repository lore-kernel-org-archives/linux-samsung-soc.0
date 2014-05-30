From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH 1/2] ARM: dts: Correct the usb phy node in peach-pit
Date: Sat, 31 May 2014 03:19:17 +0900
Message-ID: <5388CBA5.4080404@samsung.com>
References: <1401426100-13720-1-git-send-email-arun.kk@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f51.google.com ([209.85.220.51]:47230 "EHLO
	mail-pa0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932473AbaE3STV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 30 May 2014 14:19:21 -0400
Received: by mail-pa0-f51.google.com with SMTP id kq14so1971588pab.24
        for <linux-samsung-soc@vger.kernel.org>; Fri, 30 May 2014 11:19:21 -0700 (PDT)
In-Reply-To: <1401426100-13720-1-git-send-email-arun.kk@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arun Kumar K <arun.kk@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, gautam.vivek@samsung.com

On 05/30/14 14:01, Arun Kumar K wrote:
> The vbus-supply property is wrongly updated in the
> usbdrd node instead of the usbdrd_phy node. This patch
> fixes the same.
>
> Signed-off-by: Arun Kumar K<arun.kk@samsung.com>
> ---

OK, applied this and 2nd one.

Thanks,
Kukjin
