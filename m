From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH] ARM: samsung: avoid racy early printk at bootup
Date: Wed, 5 Jun 2013 13:56:52 -0700
Message-ID: <CAD=FV=UqLaAWh6pxAXXjcEu+D5ByoCB1V7F8Z2h-Ddq9ObS_6w@mail.gmail.com>
References: <1370397539-21653-1-git-send-email-dianders@chromium.org>
	<20130605031536.GA24910@quad.lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130605031536.GA24910@quad.lixom.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Simon Glass <sjg@chromium.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, Russell King <linux@arm.linux.org.uk>, Ben Dooks <ben-linux@fluff.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Olof,

On Tue, Jun 4, 2013 at 8:15 PM, Olof Johansson <olof@lixom.net> wrote:
> This seems to be caused by not calling iotable_ini() in exynos_init_io()
> when a device tree is passed into the kernel, thus not setting up the
> mapping for the UART in that case.
>
> I think the solution is instead to map the uart earlier. The window of
> exposure is still there, but much smaller (and similar to how it always
> has been).
>
> In current upstream, if there is no map_io mach_desc entry at all,
> debug_ll_io_init() will be called on all platforms. Seems appropriate
> to call that explicitly before of_scan_flat_dt() in exynos_init_io()
> in this case.

Oh.  Ummm, right.  Yes, debug_ll_io_init() is exactly what's needed
here instead of all the complexity of what I proposed.  New patch
coming shortly.  Thanks!  :)

-Doug
