From: Paul Bolle <pebolle@tiscali.nl>
Subject: Re: [PATCH v4 3/7] misc: Add cros_ec_lpc driver for x86 devices
Date: Thu, 29 Jan 2015 22:11:29 +0100
Message-ID: <1422565889.10643.6.camel@x220>
References: <1422538676-4615-1-git-send-email-javier.martinez@collabora.co.uk>
	 <1422538676-4615-4-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cpsmtpb-ews08.kpnxchange.com ([213.75.39.13]:50902 "EHLO
	cpsmtpb-ews08.kpnxchange.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752741AbbA2VLc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 29 Jan 2015 16:11:32 -0500
In-Reply-To: <1422538676-4615-4-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Lee Jones <lee.jones@linaro.org>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Doug Anderson <dianders@chromium.org>, Bill Richardson <wfrichar@chromium.org>, Simon Glass <sjg@google.com>, Gwendal Grignou <gwendal@google.com>, Jonathan Corbet <corbet@lwn.net>, Varka Bhadram <varkabhadram@gmail.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

Javier,

Trivial nits below.

On Thu, 2015-01-29 at 14:37 +0100, Javier Martinez Canillas wrote:
> From: Bill Richardson <wfrichar@chromium.org>
> 
> Chromebooks have an Embedded Controller (EC) that is used to
> implement various functions such as keyboard, power and battery.
> 
> The AP can communicate with the EC through different bus types
> such as I2C, SPI or LPC.
> 
> The cros_ec mfd driver is then composed of a core driver that
> register the sub-devices as mfd cells and provide a high level
> communication interface that is used by the rest of the kernel
> and bus specific interfaces modules.
> 
> Each connection method then has its own driver, which register
> with the EC driver interface-agnostic interface.
> 
> Currently, there are drivers to communicate with the EC over
> I2C and SPI and this driver adds support for LPC.
> 
> Signed-off-by: Bill Richardson <wfrichar@chromium.org>
> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
> [...]
>  drivers/misc/Kconfig       |  10 ++
>  drivers/misc/Makefile      |   1 +
>  drivers/misc/cros_ec_lpc.c | 291 +++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 302 insertions(+)
>  create mode 100644 drivers/misc/cros_ec_lpc.c
> 
> diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
> index 006242c8bca0..142393e84a43 100644
> --- a/drivers/misc/Kconfig
> +++ b/drivers/misc/Kconfig
> @@ -515,6 +515,16 @@ config VEXPRESS_SYSCFG
>  	  bus. System Configuration interface is one of the possible means
>  	  of generating transactions on this bus.
>  
> +config CROS_EC_LPC
> +	tristate "ChromeOS Embedded Controller (LPC)"
> +	depends on MFD_CROS_EC
> +

Please drop this empty line.

> +	help
> +	  If you say Y here, you get support for talking to the ChromeOS EC
> +	  over an LPC bus. This uses a simple byte-level protocol with a
> +	  checksum. This is used for userspace access only. The kernel
> +	  typically has its own communication methods.
> +

What happens when you say M?

>  source "drivers/misc/c2port/Kconfig"
>  source "drivers/misc/eeprom/Kconfig"
>  source "drivers/misc/cb710/Kconfig"


Paul Bolle
