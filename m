From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 3/3] ARM: dts: exynos5422-odroidxu3: Added UHS-I bus speed
 support
Date: Mon, 19 Oct 2015 22:43:42 +0900
Message-ID: <5624F38E.8030207@samsung.com>
References: <1444578364-1384-1-git-send-email-linux.amoon@gmail.com>
 <1444578364-1384-3-git-send-email-linux.amoon@gmail.com>
 <561B48B7.1040201@samsung.com>
 <CANAwSgSLFviT4ZNXTYwxYs2pbrr9ozJmPMauhgRPO0556Rsr_g@mail.gmail.com>
 <561C4CEE.3050905@samsung.com>
 <CANAwSgRJ+5O-x61K9E_AxTZWQy3jJrKF5MiLtWRdUU29CCfa-Q@mail.gmail.com>
 <561C7DF1.6000609@samsung.com>
 <CANAwSgRBzFqHB98wSQnQu-ggGqRT2H6wC415wULXVhPg0uw_3A@mail.gmail.com>
 <561D9ACE.6050103@samsung.com>
 <CAGOxZ51uPkdGmCAs2Tc8_=YvkORJKdivN47vo1ZxkGQ-MY=-oQ@mail.gmail.com>
 <CAD=FV=Voh6Xh_naWQTaRPP8YUS2xJh7jfA+zYbH9QdVhmyZz9A@mail.gmail.com>
 <CANAwSgSd8sHDcmGmck=Em2H5WJzVWM28cbvs9z6CFgpuTY_Juw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f48.google.com ([209.85.220.48]:34818 "EHLO
	mail-pa0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751151AbbJSNnt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 Oct 2015 09:43:49 -0400
In-Reply-To: <CANAwSgSd8sHDcmGmck=Em2H5WJzVWM28cbvs9z6CFgpuTY_Juw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Anand Moon <linux.amoon@gmail.com>, Doug Anderson <dianders@chromium.org>
Cc: k.kozlowski.k@gmail.com, Alim Akhtar <alim.akhtar@gmail.com>, Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Lukasz Majewski <l.majewski@samsung.com>, Jaehoon Chung <jh80.chung@samsung.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>

W dniu 19.10.2015 o 19:11, Anand Moon pisze:
> Hi Doug/ Krzysztof ,
> 
> 
> Thanks for clarifying all the background details on the mmc changes.
> 
> Here is what I would conclude from the previous mail chain's.
> 
> 1 Drop the cd-gpios changes. pinctrl-0 changes.

OK

> 
> 2 Fix the regulator changes for vmmc/vqmmc with disable of regulator-always-on;

Just fix all the comments for patch 2.

> 
> 3 Drop this UHS-I changes as if now.
> 
> Is this ok with you.

It's okay.

Best regards,
Krzysztof
