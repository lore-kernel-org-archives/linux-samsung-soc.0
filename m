From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: [PATCH 0/3] mfd: ChromeOS EC Kconfig dependency cleanup
Date: Thu, 25 Jun 2015 02:20:41 +0200
Message-ID: <1435191645-6022-1-git-send-email-javier.martinez@collabora.co.uk>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, Paul Gortmaker <paul.gortmaker@windriver.com>, Gwendal Grignou <gwendal@google.com>, Doug Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org, Samuel Ortiz <sameo@linux.intel.com>, Olof Johansson <olof@lixom.net>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>
List-Id: linux-samsung-soc@vger.kernel.org


Hello,

This is a trivial series that do some changes to the dependency for the
ChromeOS EC drivers Kconfig symbols. The patches are on top of Paul's
patch "mfd: fix dependency warning for CHROME_PLATFORMS on !X86, !ARM":
https://lkml.org/lkml/2015/6/20/219.

Paul fixed a warning about unmet dependencies but I think the correct fix
is to remove unneded dependencies. So that is what this series do and are
composed of the following patches:


Javier Martinez Canillas (3):
  platform/chrome: Don't make CHROME_PLATFORMS depends on X86 || ARM
  mfd: Remove MFD_CROS_EC depends on X86 || ARM
  mfd: Remove MFD_CROS_EC_SPI depends on OF

 drivers/mfd/Kconfig             | 3 +--
 drivers/platform/chrome/Kconfig | 1 -
 2 files changed, 1 insertion(+), 3 deletions(-)

-- 
2.1.4
