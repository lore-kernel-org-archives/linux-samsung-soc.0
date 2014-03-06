From: Kamil Debski <k.debski@samsung.com>
Subject: RE: [PATCH v9 0/4] phy: Add new Exynos USB 2.0 PHY driver
Date: Thu, 06 Mar 2014 11:25:26 +0100
Message-ID: <193b01cf3926$6512dff0$2f389fd0$%debski@samsung.com>
References: <1394033288-5551-1-git-send-email-k.debski@samsung.com>
 <5317AE67.3040503@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <5317AE67.3040503@math.uni-bielefeld.de>
Content-language: pl
Sender: linux-kernel-owner@vger.kernel.org
To: 'Tobias Jakobi' <tjakobi@math.uni-bielefeld.de>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Cc: kyungmin.park@samsung.com, kishon@ti.com, Tomasz Figa <t.figa@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, gautam.vivek@samsung.com, mat.krawczuk@gmail.com, yulgon.kim@samsung.com, p.paneri@samsung.com, av.tikhomirov@samsung.com, jg1.han@samsung.com, galak@codeaurora.org, matt.porter@linaro.org, stern@rowland.harvard.edu, sander@humilis.net
List-Id: linux-samsung-soc@vger.kernel.org

Hi Tobias,

> From: Tobias Jakobi [mailto:tjakobi@math.uni-bielefeld.de]
> Sent: Thursday, March 06, 2014 12:08 AM
> 
> Hello Kamil,
> 
> this looks very good. I just tested the patchset on my ODROID-X2
> (Exynos4412-based board) and the USB stability issues I mentioned to
> you before (with the older patchset) seem to be gone.

This problem was related to the reset procedure not being done completely. 
It is corrected now.

> 
> All devices on the USB behave normally (mass storage, ethernet and
> bluetooth).

Thank you for testing these patches. Would you consider adding a "Tested-by" tag?
I am planning to send v10 soon, which will address comments to v9.

> 
> With best wishes,
> Tobias

Best wishes,
-- 
Kamil Debski
Samsung R&D Institute Poland
