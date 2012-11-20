From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH 1/2] ARM: dts: exynos: Move the dwmmc aliases from
 smdk5250 dts to exynos
Date: Tue, 20 Nov 2012 10:44:51 -0800
Message-ID: <CAOesGMjSP2nJYXccs7n_4u-RVcyhOniEA9nkayEH4GR8muj5ag@mail.gmail.com>
References: <1353432158-22999-1-git-send-email-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1353432158-22999-1-git-send-email-dianders@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: linux-samsung-soc@vger.kernel.org, Olof Johansson <olofj@chromium.org>, Thomas Abraham <thomas.abraham@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, Rahul Sharma <rahul.sharma@samsung.com>, Naveen Krishna Chatradhi <ch.naveen@samsung.com>, Arun Kumar K <arun.kk@samsung.com>, Leela Krishna Amudala <l.krishna@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, Nov 20, 2012 at 9:22 AM, Doug Anderson <dianders@chromium.org> wrote:
> The aliases for dwmmc were placed in the SMDK5250 dts file but really
> should be common for all exynos5250 boards.  Move it to the common CPU
> file.
>
> Signed-off-by: Doug Anderson <dianders@chromium.org>

Acked-by: Olof Johansson <olof@lixom.net>


-Olof
