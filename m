From: Yauhen Kharuzhy <jekhor@gmail.com>
Subject: Re: [PATCH 11/15] ARM: S3C2416: Add support for second HSMMC
 channel
Date: Thu, 17 Jun 2010 22:19:01 +0300
Message-ID: <20100617191901.GA5864@jeknote.loshitsa1.net>
References: <1273631766-15693-1-git-send-email-ben-linux@fluff.org>
 <1273631766-15693-11-git-send-email-ben-linux@fluff.org>
 <4C1A71F6.5030203@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:46701 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933163Ab0FQTTG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 17 Jun 2010 15:19:06 -0400
Received: by bwz7 with SMTP id 7so58423bwz.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 17 Jun 2010 12:19:05 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <4C1A71F6.5030203@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Darius Augulis <augulis.darius@gmail.com>
Cc: Ben Dooks <ben-linux@fluff.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On Thu, Jun 17, 2010 at 10:05:26PM +0300, Darius Augulis wrote:
> On 05/12/2010 05:36 AM, Ben Dooks wrote:
> >Add support for the second HSMMC channel on the S3C2416.
> 
> There is issue with mach-s3c2416 and sdhci-s3c driver.
> Driver probe crashes with following backtrace:
> 
> sdhci: Secure Digital Host Controller Interface driver
> sdhci: Copyright(c) Pierre Ossman
> Unable to handle kernel NULL pointer dereference at virtual address 00000000
> pgd = c0004000
> [00000000] *pgd=00000000
> Internal error: Oops: 5 [#1]
> last sysfs file:
> CPU: 0    Not tainted  (2.6.35-rc3-00001-g7dfb002 #31)
> PC is at sdhci_s3c_probe+0x188/0x42c
> LR is at clk_enable+0x50/0x60
> 
> The reason is not completely initialised s3c_sdhci_platdata
> structure. When getting clocks in sdhci_s3c_probe():
> 
> for (clks = 0, ptr = 0; ptr < MAX_BUS_CLK; ptr++) {
>                 struct clk *clk;
>                 char *name = pdata->clocks[ptr];
> 
> Pointer clocks is not initialised at all, because mach-s3c2416
> doesn't have such helpers like mach-s3c64xx does:
> 
> s3c6400_default_sdhci0()
> s3c6400_default_sdhci1()
> s3c6400_default_sdhci2()
> 
> Also other necessary s3c_sdhci_platdata members cfg_gpio and
> cfg_card are missing on s3c2416.
> 
> Is there any patch adding this missing info to mach-s3c2416?

I am already wrote such patch today and will post it after testing
tomorrow, I hope.

-- 
Yauhen Kharuzhy		jekhor _at_ gmail.com
			JID: jek@jabber.ru

A: No
Q: Should I quote below my post?
