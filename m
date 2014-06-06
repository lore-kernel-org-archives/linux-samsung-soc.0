From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: Re: Problems booting exynos5420 with >1 CPU
Date: Fri, 6 Jun 2014 18:38:17 -0400 (EDT)
Message-ID: <alpine.LFD.2.11.1406061836130.25775@knanqh.ubzr>
References: <539145B4.5000200@gmail.com> <CAD=FV=XqwEQNJmij-4Gh62OY+B66AjdQjZC0=f_6tbot3UfQaA@mail.gmail.com> <CAM4voaknx3+X4O8MUwaruUFPyquY8Opq61ucKX08xTrv8PqfLg@mail.gmail.com> <CAD=FV=Vo1JR6n496Q3FqXjRBkbTBRg89_fJQNsqeRx8WQW_a9w@mail.gmail.com>
 <CAM4voakAMN4jdAZDPz55tnc3woZDieZ5aL3TVU2kYsNHT+AMqg@mail.gmail.com> <CAD=FV=UjmN5AwWMPy7mQt-J4A_niO8Ug4r15Ez2ZWPT1g3L=VA@mail.gmail.com> <20140606203721.GA10422@quad.lixom.net> <CAM4voanSpTd=dAXLZhdZKRP4Z_YShbD4Hr-6UWn3DFYueoxeTA@mail.gmail.com>
 <20140606210126.GA10219@quad.lixom.net> <alpine.LFD.2.11.1406061717520.25775@knanqh.ubzr> <20140606214921.GA10969@quad.lixom.net> <CAD=FV=WSEBRH-Py8oGXp0soAx_Y=j8NdoX89YiPGYeTBzQdOyw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qa0-f48.google.com ([209.85.216.48]:55173 "EHLO
	mail-qa0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751635AbaFFWiT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 6 Jun 2014 18:38:19 -0400
Received: by mail-qa0-f48.google.com with SMTP id i13so4861546qae.21
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 Jun 2014 15:38:19 -0700 (PDT)
In-Reply-To: <CAD=FV=WSEBRH-Py8oGXp0soAx_Y=j8NdoX89YiPGYeTBzQdOyw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@google.com>
Cc: Olof Johansson <olof@lixom.net>, Abhilash Kesavan <kesavan.abhilash@gmail.com>, Tushar Behera <trblinux@gmail.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "Turquette, Mike" <mturquette@linaro.org>, Kevin Hilman <khilman@linaro.org>, Thomas Abraham <thomas.abraham@linaro.org>, Arun Kumar <arun.kk@samsung.com>, Sonny Rao <sonnyrao@chromium.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>

On Fri, 6 Jun 2014, Doug Anderson wrote:

> Note that handling CPU resume in a way that can be updated by RW
> firmware is non-trivial and requires some SRAM to be saved across
> suspend/resume.

Saved by the kernel or the firmware?


Nicolas
