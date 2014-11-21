From: Kevin Hilman <khilman@kernel.org>
Subject: Re: screen blank causing lockup in exynos-reference/exynos5-v3.18-rc2
Date: Fri, 21 Nov 2014 11:23:18 -0800
Message-ID: <7h4mtsnys9.fsf@deeprootsystems.com>
References: <8C.59.15273.8FB5F645@epcpsbgx1.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f181.google.com ([209.85.192.181]:45013 "EHLO
	mail-pd0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751791AbaKUTXV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 21 Nov 2014 14:23:21 -0500
Received: by mail-pd0-f181.google.com with SMTP id z10so5915835pdj.12
        for <linux-samsung-soc@vger.kernel.org>; Fri, 21 Nov 2014 11:23:21 -0800 (PST)
In-Reply-To: <8C.59.15273.8FB5F645@epcpsbgx1.samsung.com> (AJAY KUMAR
	RAMAKRISHNA SHYMALAMMA's message of "Fri, 21 Nov 2014 15:36:24 +0000
	(GMT)")
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: ajaykumar.rs@samsung.com
Cc: Vivek Gautam <gautam.vivek@samsung.com>, PANKAJ KUMAR DUBEY <pankaj.dubey@samsung.com>, In-Ki Dae <inki.dae@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Amit Kucheria <amit.kucheria@linaro.org>, "bhushan.r@samsung.com" <bhushan.r@samsung.com>

Hi Ajay,

AJAY KUMAR RAMAKRISHNA SHYMALAMMA <ajaykumar.rs@samsung.com> writes:

> I tried to reproduce the issue which you reported,
>
> but I am sorry I am not able to reproduce it.
>
> I tried with my patches for DRM on top of Linux-next.

I don't see the issue on linux-next either.  As I mentioned in the
original post, I only see it on the v3.18 branch in the exynos-reference
tree.

Kevin
