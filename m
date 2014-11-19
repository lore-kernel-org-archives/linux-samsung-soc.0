From: Kevin Hilman <khilman@deeprootsystems.com>
Subject: screen blank causing lockup in exynos-reference/exynos5-v3.18-rc2
Date: Wed, 19 Nov 2014 10:56:58 -0800
Message-ID: <CAMAWPa8kzouNypE=eT79TO6P8OPUc_FfsVGhC+4oOCGHor3MuA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f174.google.com ([209.85.212.174]:64710 "EHLO
	mail-wi0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752736AbaKSS5A (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 19 Nov 2014 13:57:00 -0500
Received: by mail-wi0-f174.google.com with SMTP id h11so6413917wiw.13
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Nov 2014 10:56:59 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ajay Kumar <ajaykumar.rs@samsung.com>, Vivek Gautam <gautam.vivek@samsung.com>, Pankaj Dubey <pankaj.dubey@samsung.com>, Inki Dae <inki.dae@samsung.com>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Amit Kucheria <amit.kucheria@linaro.org>

As I'm hunting around trying to figure out how to make exynos-drm work
with v3.18 or linux-next, I noticed there was an exynos5-v3.18-rc2
branch in the exynos-reference tree[1], so I gave that a spin on my
exynos5800-peach-pi.

It seemed to work OK, but I noticed that as soon as the screen blanked
after timeout, typing on the serial console would still work, but any
typing on the keyboard caused a silent lockup, with no output on the
serial console.

I was able to easily reproduce this by doing

  # echo 3 > /sys/class/graphics/fb0/blank

on the serial console, verifying I could still type on the serial
console. Then, touch any key on the physical keyboard and then I can
no longer type on the serial console, ping the target, etc.

Kevin

[1] https://github.com/exynos-reference/kernel.git
