From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: domain off
Date: Sun, 10 Jan 2016 15:15:00 +0900
Message-ID: <CAJKOXPe51YO3t1fhUdD1OsmXXcW3MoTwapvY4Y0q8QwaKrxzRg@mail.gmail.com>
References: <CAH9_wRPDMiCMNZJHkkK21oF8dySUfa5AUpGnp-nh6V77As6CPA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-io0-f174.google.com ([209.85.223.174]:36557 "EHLO
	mail-io0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750839AbcAJGPB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 10 Jan 2016 01:15:01 -0500
Received: by mail-io0-f174.google.com with SMTP id g73so125403242ioe.3
        for <linux-samsung-soc@vger.kernel.org>; Sat, 09 Jan 2016 22:15:00 -0800 (PST)
In-Reply-To: <CAH9_wRPDMiCMNZJHkkK21oF8dySUfa5AUpGnp-nh6V77As6CPA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sriram V <vshrirama@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org

2016-01-09 19:19 GMT+09:00 Sriram V <vshrirama@gmail.com>:
>
> Hello,
>
> I am trying to power down power domains which are not used but i am
> unable to do so unless i write manually into the registers.
>
> Can anyone help me on the standard way to power down power domains on
> a exynos 5422.
>
> I  tried marking status /bts-status to disable in the device tree file
> for pd-disp1, but that does not help.
>
> What is the standard way of powering down if they are not used. Do we
> need to do using dt or somewhere in the kernel board file?

Hi,

The domains defined in DT (and enabled in DT... status=disabled marks
the *node* as disabled, not the power domain) are automatically turned
off when attached devices are runtime suspended. Use
PM_DEBUG+PM_ADVANCED_DEBUG and then:
cat /sys/kernel/debug/pm_genpd/pm_genpd_summary

Domains not present there are not defined so they are left in default
status set by bootloader (probably on).

BR,
Krzysztof
