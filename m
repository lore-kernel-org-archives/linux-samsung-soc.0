From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: Re: [PATCH] mmc: s3cmci: moved mach/regs-sdi.h into s3cmci device
 driver
Date: Sun, 03 Feb 2013 19:56:49 +0100
Message-ID: <510EB2F1.4010603@gmail.com>
References: <1359765917-11219-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f52.google.com ([74.125.83.52]:54567 "EHLO
	mail-ee0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753382Ab3BCS44 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 3 Feb 2013 13:56:56 -0500
In-Reply-To: <1359765917-11219-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-mmc@vger.kernel.org, Chris Ball <cjb@laptop.org>

Hi,

On 02/02/2013 01:45 AM, Kukjin Kim wrote:
> Since mach/regs-sdi.h is used only for s3cmci.c, so this moves the
> header file into the driver file, drivers/mmc/host/s3cmci.c file.
>
> Signed-off-by: Kukjin Kim<kgene.kim@samsung.com>

FIW, I have tested this patch on mini2440 board:

Tested-by: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>

--

Thanks,
Sylwester
