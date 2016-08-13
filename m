From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: Wakeup source
Date: Sat, 13 Aug 2016 20:53:03 +0200
Message-ID: <20160813185303.GA12620@kozik-lap>
References: <CANMsd03AdbM1JuQPOwmFpiUPUGU0g=TDYuX3KiETr2-fwW5Fqg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f51.google.com ([74.125.82.51]:36882 "EHLO
	mail-wm0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752767AbcHNIaJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 14 Aug 2016 04:30:09 -0400
Received: by mail-wm0-f51.google.com with SMTP id i5so50766082wmg.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 14 Aug 2016 01:30:08 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <CANMsd03AdbM1JuQPOwmFpiUPUGU0g=TDYuX3KiETr2-fwW5Fqg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ryan <ryanphilips19@googlemail.com>
Cc: linux-samsung-soc@vger.kernel.org

On Fri, Aug 12, 2016 at 07:44:56PM +0530, Ryan wrote:
> Hello,
> 
> I am using Samsung exynos 5422. How can i find the source of wakeup
> from suspend?
> 
> I have multiple wakeup sources? Just wanted to find out what is the
> source of the interrupt. Like to print it when it resumes back.

This might be helpful:
https://patchwork.kernel.org/patch/3827341/

Best regards,
Krzysztof
