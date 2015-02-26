From: Gwendal Grignou <gwendal@chromium.org>
Subject: Re: [PATCH v5 0/7] platform/chrome: Add user-space dev inferface support
Date: Thu, 26 Feb 2015 15:35:06 -0800
Message-ID: <CAMHSBOWy4NdPRjw2SXFmcCF2zKwx=i79RxgHR2CLnLxpamPswQ@mail.gmail.com>
References: <1422876388-16540-1-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f172.google.com ([209.85.220.172]:61728 "EHLO
	mail-vc0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932355AbbBZXf1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 26 Feb 2015 18:35:27 -0500
Received: by mail-vc0-f172.google.com with SMTP id kv7so5176303vcb.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Feb 2015 15:35:26 -0800 (PST)
In-Reply-To: <1422876388-16540-1-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Olof Johansson <olof@lixom.net>, Lee Jones <lee.jones@linaro.org>, Doug Anderson <dianders@chromium.org>, Bill Richardson <wfrichar@chromium.org>, Simon Glass <sjg@google.com>, Jonathan Corbet <corbet@lwn.net>, Varka Bhadram <varkabhadram@gmail.com>, Paul Bolle <pebolle@tiscali.nl>, linux-samsung-soc@vger.kernel.org, Linux Kernel <linux-kernel@vger.kernel.org>

Tested-by: Gwendal Grignou <gwendal@chromium.org>
Reviewed-by: Gwendal Grignou <gwendal@chromium.org>

Tested on a chromebook pixel with kernel 4.0.0-rc1 and ectool using
the enclosed patch in chromiumos platform/ec tree.
I checked the lightbar is working, check the calls with "strace ectool
...", check the sysfs interface calls.

---
 util/comm-dev.c    |  6 +++---
 util/cros_ec_dev.h | 10 +++++-----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/util/comm-dev.c b/util/comm-dev.c
index cdbbbdf..1b9958d 100644
--- a/util/comm-dev.c
+++ b/util/comm-dev.c
@@ -13,9 +13,9 @@
 #include <sys/types.h>
 #include <unistd.h>
.
+#include "ec_commands.h"
 #include "cros_ec_dev.h"
 #include "comm-host.h"
-#include "ec_commands.h"
.
 static int fd = -1;
.
@@ -61,9 +61,8 @@ static int ec_command_dev(int command, int version,
  s_cmd.version = version;
  s_cmd.result = 0xff;
  s_cmd.outsize = outsize;
- s_cmd.outdata = (uint8_t *)outdata;
  s_cmd.insize = insize;
- s_cmd.indata = indata;
+ memcpy(s_cmd.outdata, outdata, outsize);
.
  r = ioctl(fd, CROS_EC_DEV_IOCXCMD, &s_cmd);
  if (r < 0) {
@@ -83,6 +82,7 @@ static int ec_command_dev(int command, int version,
      strresult(s_cmd.result));
    return -EECRESULT - s_cmd.result;
  }
+ memcpy(indata, s_cmd.indata, insize);
.
  return r;
 }
diff --git a/util/cros_ec_dev.h b/util/cros_ec_dev.h
index f6f5a55..55184ca 100644
--- a/util/cros_ec_dev.h
+++ b/util/cros_ec_dev.h
@@ -26,11 +26,11 @@
 struct cros_ec_command {
  uint32_t version;
  uint32_t command;
- uint8_t *outdata;
  uint32_t outsize;
- uint8_t *indata;
  uint32_t insize;
  uint32_t result;
+ uint8_t outdata[EC_PROTO2_MAX_PARAM_SIZE];
+ uint8_t indata[EC_PROTO2_MAX_PARAM_SIZE];
 };
.
 /*
@@ -46,8 +46,8 @@ struct cros_ec_readmem {
  char *buffer;
 };
.
-#define CROS_EC_DEV_IOC              ':'
-#define CROS_EC_DEV_IOCXCMD    _IOWR(':', 0, struct cros_ec_command)
-#define CROS_EC_DEV_IOCRDMEM   _IOWR(':', 1, struct cros_ec_readmem)
+#define CROS_EC_DEV_IOC              0xEC
+#define CROS_EC_DEV_IOCXCMD    _IOWR(0xEC, 0, struct cros_ec_command)
+#define CROS_EC_DEV_IOCRDMEM   _IOWR(0xEC, 1, struct cros_ec_readmem)
.
 #endif /* _CROS_EC_DEV_H_ */
--.
2.2.0.rc0.207.ga3a616c

On Mon, Feb 2, 2015 at 3:26 AM, Javier Martinez Canillas
<javier.martinez@collabora.co.uk> wrote:
> Hello,
>
> The mainline ChromeOS Embedded Controller (EC) driver is still missing some
> features that are present in the downstream ChromiumOS tree. These are:
>
>   - Low Pin Count (LPC) interface
>   - User-space device interface
>   - Access to vboot context stored on a block device
>   - Access to vboot context stored on EC's nvram
>   - Power Delivery Device
>   - Support for multiple EC in a system
>
> This is a fifth version of a series that adds support for the first two of
> the missing features: the EC LPC and EC character device interfaces that
> are used by user-space to access the ChromeOS EC. The support patches were
> taken from the downstream ChromiumOS 3.14 tree with the fixes and cleanups
> squashed to have a minimal patch-set.
>
> The version of the ChromeOS EC chardev driver in this series still does not
> reflect the latest one that is in the downstream ChromiumOS 3.14 kernel but
> makes the delta shorter. Following patches will add the remaining missing
> features until both trees are in sync. I preferred to first add the initial
> support and then adding the other features to both maintain the original
> patch history in the downstream kernel and so preserve the patch authorship
> and also make the diff to have a working cros user-space interface smaller.
>
> This version solves the issues pointed out in the earlier revision.
>
> A big difference between this series and the downstream ChromiumOS kernel is
> that the ioctl API is modified to make it 64-bit safe and compatible with both
> 64 and 32 bit user-space binaries. The data structures passed as arguments in
> the ChromiumOS ioctl interface commands has pointers fields and since these
> have different byte boundaries alignment requirement, the ChromiumOS driver
> has a compat ioctl interface. The feedback was that this had to be avoided
> since this was a new ioctl API so the pointers fields were replaced with a set
> of fixed-size arrays to be used instead. This has the drawback that more data
> could be used and copied between user and kernel space so feedback is welcomed
> if there is a better approach to solve this kind of issues.
>
> The patches were tested on an Exynos5420 Peach Pit Chromebook and (thanks to
> Bill Richardson) on an x86 Pixel Chromebook using a modified ectool [0] to use
> the new ioctl API. The LPC interface driver and the lightbar sysfs driver were
> also tested on the Pixel Chromebook.
>
> The series is composed of the following patches:
>
> Bill Richardson (4):
>   platform/chrome: Add cros_ec_lpc driver for x86 devices
>   platform/chrome: Add Chrome OS EC userspace device interface
>   platform/chrome: Create sysfs attributes for the ChromeOS EC
>   platform/chrome: Expose Chrome OS Lightbar to users
>
> Javier Martinez Canillas (3):
>   mfd: cros_ec: Use fixed size arrays to transfer data with the EC
>   mfd: cros_ec: Add char dev and virtual dev pointers
>   mfd: cros_ec: Instantiate ChromeOS EC character device
>
>  Documentation/ioctl/ioctl-number.txt       |   1 +
>  drivers/i2c/busses/i2c-cros-ec-tunnel.c    |  51 +---
>  drivers/input/keyboard/cros_ec_keyb.c      |  13 +-
>  drivers/mfd/cros_ec.c                      |  19 +-
>  drivers/platform/chrome/Kconfig            |  26 +-
>  drivers/platform/chrome/Makefile           |   3 +
>  drivers/platform/chrome/cros_ec_dev.c      | 274 +++++++++++++++++++++
>  drivers/platform/chrome/cros_ec_dev.h      |  53 +++++
>  drivers/platform/chrome/cros_ec_lightbar.c | 367 +++++++++++++++++++++++++++++
>  drivers/platform/chrome/cros_ec_lpc.c      | 319 +++++++++++++++++++++++++
>  drivers/platform/chrome/cros_ec_sysfs.c    | 271 +++++++++++++++++++++
>  include/linux/mfd/cros_ec.h                |  23 +-
>  12 files changed, 1358 insertions(+), 62 deletions(-)
>  create mode 100644 drivers/platform/chrome/cros_ec_dev.c
>  create mode 100644 drivers/platform/chrome/cros_ec_dev.h
>  create mode 100644 drivers/platform/chrome/cros_ec_lightbar.c
>  create mode 100644 drivers/platform/chrome/cros_ec_lpc.c
>  create mode 100644 drivers/platform/chrome/cros_ec_sysfs.c
>
> Patch #1 modified the struct cros_ec_command structure so it can be used
> as an ioctl argument and be 64 and 32 bit safe and patch #2 adds fields
> to the struct cros_ec_device that will be needed by the EC chardev driver.
>
> Patch #3 adds support for the EC LPC interface used on x86 Chromebooks.
>
> Patch #4 adds the ChromeOS chardev driver and patch #5 instantiates it
> from the mfd cros_ec driver.
>
> Patch #6 exposes sysfs attributes that can be used by user space programs
> to get information and control the ChromeOS EC.
>
> Patch #7 exposes sysfs attributes that are used to control the lightbar
> RGB LEDs found on the Pixel Chromebook.
>
> The patches must be applied together and in order due dependencies.
> Lee Jones has already acked the MFD changes so I think this could go
> through Olof's chrome-platform tree.
>
> Best regards,
> Javier
>
> [0]: git://git.collabora.co.uk/git/user/javier/ec.git mainline-ioctl
