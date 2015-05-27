From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [PATCH v3 1/7] mfd: cros_ec: Use a zero-length array for command
 data
Date: Wed, 27 May 2015 10:39:10 +0200
Message-ID: <556582AE.6030100@collabora.co.uk>
References: <1432309340-13688-1-git-send-email-javier.martinez@collabora.co.uk> <1432309340-13688-2-git-send-email-javier.martinez@collabora.co.uk> <20150527083659.GT11677@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150527083659.GT11677@x1>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Samuel Ortiz <sameo@linux.intel.com>, Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, Bill Richardson <wfrichar@chromium.org>, Simon Glass <sjg@google.com>, Gwendal Grignou <gwendal@google.com>, Stephen Barber <smbarber@chromium.org>, Filipe Brandenburger <filbranden@google.com>, Todd Broch <tbroch@chromium.org>, Alexandru M Stan <amstan@chromium.org>, Heiko Stuebner <heiko@sntech.de>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hello Lee,

On 05/27/2015 10:36 AM, Lee Jones wrote:
>> ---
>>  drivers/i2c/busses/i2c-cros-ec-tunnel.c    |  45 ++++++---
>>  drivers/input/keyboard/cros_ec_keyb.c      |  29 ++++--
>>  drivers/mfd/cros_ec.c                      |  28 ++++--
>>  drivers/mfd/cros_ec_i2c.c                  |   4 +-
>>  drivers/mfd/cros_ec_spi.c                  |   2 +-
> 
> For the MFD changes:
>  Acked-by: Lee Jones <lee.jones@linaro.org>
> 

Thanks!

Best regards,
Javier
