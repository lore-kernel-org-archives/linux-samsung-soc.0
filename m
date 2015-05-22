From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v3 0/7] mfd: cros_ec: Add multi EC and proto v3 support
Date: Fri, 22 May 2015 21:28:12 +0200
Message-ID: <34956392.X7yifgxE7d@phil>
References: <1432309340-13688-1-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1432309340-13688-1-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Lee Jones <lee.jones@linaro.org>, Samuel Ortiz <sameo@linux.intel.com>, Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, Bill Richardson <wfrichar@chromium.org>, Simon Glass <sjg@google.com>, Gwendal Grignou <gwendal@google.com>, Stephen Barber <smbarber@chromium.org>, Filipe Brandenburger <filbranden@google.com>, Todd Broch <tbroch@chromium.org>, Alexandru M Stan <amstan@chromium.org>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Javier,

Am Freitag, 22. Mai 2015, 17:42:13 schrieb Javier Martinez Canillas:
> Newer Chromebooks have more than one Embedded Controller (EC) in the
> system. These additional ECs are connected through I2C with a host EC
> which is the one that is connected to the Application Processor (AP)
> through different transports (I2C, SPI or LPC).
[...]
> The series were tested using a modified ectool [2] that supports the new
> cros_ec IOCTL API. They were also tested on a x86 Pixel Chromebook 2 (Samus)
> that uses the new protocol v3 and has 2 EC (cros_ec and cros_pd). But for
> testing on Samus, also the posted "[PATCH 0/3] platform/chrome: Changes for
> cros_ec_lpc and cros_ec_dev" series [3] are needed.
> 
> Gwendal Grignou and Heiko Stuebner tested the first versions of the series
> but I did not carry their Tested-by tags for the patches that had not
> trivial changes. So testing on more platforms will be highly appreciated.

Everything is still working nicely on rk3288-pinky and rk3288-jerry on
4.1-rc4, so still

Tested-by: Heiko Stuebner <heiko@sntech.de>
